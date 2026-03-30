Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DE7FF492E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 02:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g8MkxEWyng0lO9QdFa1u7VtrnQwsGiudVwe3huJqrBE=; b=Sz9S6cFl2AvpKh1/ZI/nYg7S/P
	38mjhHRolPUdaa1apcvPxwUIijyr3NAkx0j4K9SzeQa/ohGV7JEoAdMcREq/drPWIGnOcmvJraIT2
	f0fQaD7h+FXjA9L/oYDzvEKunQgpbEr8Bb8Mi0CXrnyWBV5abudZ5FCPu2ltJwSHvhugJbaPruVu9
	17U8Y2+YrfOprPTSjzvZVbvfLggE9t4PG+kRqGO9MDLRyEz/l/iT26p8B56yb+8XDYxArEmCItkmi
	X78G272peptA4rGWe6Ms6xKjt3YUmQP/1OGbhSIg3xmj5AJklQu9fANW7b3JBURCvLttKkqefVPq7
	uxQ96APA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w71xk-0000000AUI4-3aW4;
	Mon, 30 Mar 2026 02:02:44 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w71xf-0000000AUHF-3pCC;
	Mon, 30 Mar 2026 02:02:43 +0000
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-03 (Coremail) with SMTP id rQCowABngdix2clpVhhEDA--.40377S2;
	Mon, 30 Mar 2026 10:02:26 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	george.sun@mediatek.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: free working buf on error path in vdec_vp9_slice_setup_lat()
Date: Mon, 30 Mar 2026 10:02:24 +0800
Message-Id: <20260330020224.2729252-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABngdix2clpVhhEDA--.40377S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ArWktr4UXF43AFykWrW5Awb_yoW8WF15pF
	4Y9rWUZFyjyFnFvay8JF48ua15C3ySvryxWw43u34SyFyYqr17Xr1IyFy3Ar4rCan2ya45
	ur12qryUuFW5AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0pRHUDLUUUUU=
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiCQ4CE2nJxcxTOgAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_190240_359485_4128FFAC 
X-CRM114-Status: UNSURE (   8.03  )
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

Add an error path label in vdec_vp9_slice_setup_lat()
and call vdec_vp9_slice_free_working_buffer() to free
working buffer to prevent potential memory leak.

Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9 decoding")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c    | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index cd1935014d76..3dadb5cc8876 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1168,7 +1168,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
 
 	ret = vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf);
 	if (ret)
-		goto err;
+		goto alloc_err;
 
 	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
 
@@ -1176,14 +1176,16 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
 
 	ret = vdec_vp9_slice_setup_prob_buffer(instance, vsi);
 	if (ret)
-		goto err;
+		goto alloc_err;
 
 	ret = vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
 	if (ret)
-		goto err;
+		goto alloc_err;
 
 	return 0;
 
+alloc_err:
+	vdec_vp9_slice_free_working_buffer(instance);
 err:
 	return ret;
 }
-- 
2.25.1


