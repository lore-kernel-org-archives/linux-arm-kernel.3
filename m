Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5F2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 11:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZvB9LB7Gi2PdxCwvcGr4xUKBMwS0r+afhj/YLKh2sg=; b=ilFTCm65jnIRatRFnUr34TB6JM
	S3iB+ST3PHCu6AKego6Nr71q7KsqLufYYHgSwonIlfgu9Hm17QFGwSBjAq82rRJY9I5pyB2/I9oqM
	DK50RTNCmCIUYNr+sEK8BPfLax6T5nlmNEnQDVV4ZHfpAgLhBz/YPQ/rSX6Yy5FQiXb6gzoMRqmCG
	cyX7CT3Ocv6CDqnE0V+6uhgaH472AqIm5FmVT21D44J5LrOWDqsQ2K2jYyNJsllPUt+EZvfm/pv0G
	qoFBDAGFnzd2Pa2S2on5h8iuhBFbK8Wkrs4tyRIAWG+KGshHw71LonimQx/lCDjLnpERXxv8UWwQv
	t9EHQtpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNGx-0000000A3Gd-0yDS;
	Thu, 17 Jul 2025 11:59:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM80-00000009swW-0SXP;
	Thu, 17 Jul 2025 10:46:17 +0000
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F4C420EE;
	Thu, 17 Jul 2025 12:45:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749141;
	bh=NRkJxIVd0ZlILnv8udnGakJfoaHUIwP9DNE9boCy8vE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L3xM2sINUfbupiC+4EYm9Z6p/Zv84402Yye5DQ6rY0irVFPw9GLujgTxofj00VRJM
	 WwhBg+9npeSIX0m1lJMP877j9Y/AmNMl3/frgxTchEGe6EkNK1QOJJdSoEWdpMHA88
	 OBUPUDXg+FYpinYgkQw7S6jAEBfUgRd8HcRcX/Rk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:47 +0200
Subject: [PATCH DNI 21/26] media: pisp_be: Start and stop the media
 pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-21-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=NRkJxIVd0ZlILnv8udnGakJfoaHUIwP9DNE9boCy8vE=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRRnPxjMuVJs1HDTPiwMpU50liJADhwZgbZ+
 3n0peOrAiaJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUQAKCRByNAaPFqFW
 PKqND/9lgHHdpWtrKrn0s9fq2BS22V66oiOoXeL8C/PTv242eTMZeOE94cLl9MbKi4o+5xPUSgF
 BeOjGegTyWCk9qatrxSXUbEIlx98/xRYLXW6k27iRYnM9mSy2VGrG/R/Os+jhwDjC+FhXRoAcj1
 438gbXywzXL1ywduiOQI5XFleXFU0hnet4mRrNDVDk/oZhBC/e+79ucyLeNSYpfUaAuv6IDub68
 jMNrSN729Cr7IWSOIqtzcz0xL8+81s8VY0pBCoFEspXC5CAt+1UQerJJJWGTR0lwwGdfT131EY3
 pzv8dR+EEHF/5Y10fG4GkqmQMNY1K5WWbX8I4NSFSn37M7H1iQ22PTVkiWyXaI+NU5WMJN98EJV
 la/yOjYj0cCpdMlL2qWs3v9spHNpfBJ3KjGhh141hwkOj49CB5xoEakxlinG8nZX+q03FF41wKG
 QPDrk4+zDNA8ZJBwGCWtTJFatlK1s5JEaaldh6FmuP3gzsT2usT5fAbrzhg/mDT2DwskRjbUiCC
 d36/yQrpr7Z/G20fbDWHjFKJ9BIRmrR4wLyvmWLUDMSv1RksKgBXJjpGn/RzJdJGZFWJzNXmqoG
 4oF+g2oqfjhLklBeGkcvdSPI8xUAKGB3vtA96BOx4dI6HDcxbudyhriK2e9SE9MUg7vmyxzBI57
 ELeGa7Yq1gwaB4g==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034616_303273_5F7A3D27 
X-CRM114-Status: UNSURE (   7.68  )
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

Call video_device_pipeline_alloc_start() and
video_device_pipeline_stop() at streaming start/stop time for all
video nodes.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index b30891718d8df9c48ce1b83ad9fcafb201105625..423cb21298309c2ba51214b129fbf6e875370c98 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -878,6 +878,10 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret < 0)
 		goto err_return_buffers;
 
+	ret = video_device_pipeline_alloc_start(&node->vfd);
+	if (ret)
+		goto err_return_buffers;
+
 	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
 		node->pispbe->streaming_map |=  BIT(node->id);
 		node->pispbe->sequence = 0;
@@ -933,6 +937,8 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 
 	vb2_wait_for_all_buffers(&node->queue);
 
+	video_device_pipeline_stop(&node->vfd);
+
 	spin_lock_irq(&pispbe->hw_lock);
 	pispbe->streaming_map &= ~BIT(node->id);
 

-- 
2.49.0


