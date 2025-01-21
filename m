Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7C7C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 03:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FoySJGlrE7XaqCz8Rt7AcF6yky3wLqS7JAAoyxwkUYs=; b=PYSzYOWGCwCJOmE09feZZiz8DF
	HjX9xjNCQCU37jiimlSck5/B5mwaj7MGhJHMTYzqhPbf9r5tT6BZRu4kvaztZ708QAqOKbzmCbFL2
	vlY29oHVWIxkp7fA5c70e/0NHrMVqg6lq31ma2JqNqE+Ced7IlZD4m7+C+K2c36YCNQz6070Nzdhv
	i4Y8KV4zza4uQAYejBP7r7JGeS1Rx9VrGuqtHDEXt4D1E85fuQ+iXc+5B2c3LIiOqR5Rw4wghbxoy
	tSp8u94GyhEYmr3bmo+Ikd0ll/L0k125u2imY6MTno3ajdXfcrSXRlhSFzJkIrP5XUJv29SdpWH/g
	OfSl1IlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta4pO-00000006nzO-4ANM;
	Tue, 21 Jan 2025 03:21:22 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta4o4-00000006noY-1xLq;
	Tue, 21 Jan 2025 03:20:03 +0000
Received: from localhost.localdomain (unknown [220.197.236.33])
	by APP-05 (Coremail) with SMTP id zQCowADX3ipMEo9nKdtZCA--.7807S2;
	Tue, 21 Jan 2025 11:19:44 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org
Cc: mo.c.weber@gmail.com,
	wsa+renesas@sang-engineering.com,
	wahrenst@gmx.net,
	vulab@iscas.ac.cn,
	umang.jain@ideasonboard.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] staging: vc04_services: Add error handling for vchiq_mmal_port_connect_tunnel
Date: Tue, 21 Jan 2025 11:19:20 +0800
Message-ID: <20250121031921.2076-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADX3ipMEo9nKdtZCA--.7807S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFy3Aw1UXw43Gr1xCryrXrb_yoW8Aw1xp3
	WUWan8JFW8JF1rC3WDZF4rWry5WrZ7tay8K3y7K343Ary5KFs7Gr42vr93tw1UGrs3JrWa
	qr4j9F4rWa18CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbGQ6J
	UUUUU==
X-Originating-IP: [220.197.236.33]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRAJA2ePDdARSQAAs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_192000_885234_9DDCFEB4 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

In mmal_setup_video_component() and mmal_setup_components(),
two vchiq_mmal_port_connect_tunnel() are called without proper
error handling. This could lead to unnoticed failures and
inconsistent behavior compared to other parts of the code.

In this patch, error handlings have been added for calls
to vchiq_mmal_port_connect_tunnel(), enhancing code robustness
and ensuring consistent error management.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index deec33f63bcf..eb9f484548ff 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1021,6 +1021,8 @@ static int mmal_setup_video_component(struct bcm2835_mmal_dev *dev,
 			ret = vchiq_mmal_port_connect_tunnel(dev->instance,
 							     preview_port,
 							     NULL);
+			if (ret)
+				return ret;
 		}
 	}
 	preview_port->es.video.width = f->fmt.pix.width;
@@ -1153,8 +1155,10 @@ static int mmal_setup_components(struct bcm2835_mmal_dev *dev,
 			 "vid_cap - disconnect previous tunnel\n");
 
 		/* Disconnect any previous connection */
-		vchiq_mmal_port_connect_tunnel(dev->instance,
-					       dev->capture.camera_port, NULL);
+		ret = vchiq_mmal_port_connect_tunnel(dev->instance,
+						     dev->capture.camera_port, NULL);
+		if (ret)
+			return ret;
 		dev->capture.camera_port = NULL;
 		ret = vchiq_mmal_component_disable(dev->instance,
 						   dev->capture.encode_component);
-- 
2.42.0.windows.2


