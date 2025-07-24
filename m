Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258EAC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZvB9LB7Gi2PdxCwvcGr4xUKBMwS0r+afhj/YLKh2sg=; b=eo1TQtOePDdTyfZJBAbVwFN6v7
	nCot6C9eSN5inUJhzLwQKGEILG3PWmSAY0yJjAOlczNwBCTmt5pDjaCk5KKgexGN4OnAXttkp4za3
	MdSBzqAcNKyCg0gpqcieT/VPKgGmrRS53nvob/9u4iD/K3Kxh9dteYo8P9pI5DbMSgyB41tFwH1u9
	5BJOTWaOeDcsYUTaw/+P0r/yLhlA4oRWzV6QLI6SEUCihxLv8t0e5y/wfiZEVMQc+s8Ggl45NfIZs
	TERSBE4HI8BAoogfmCq8G6Ry6gDpOUZzwRBC2l2DMz/CDiqCzVZRljLRolsZlWDx0Q+HTFiQE4dZY
	ZhFXMFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueyDx-00000007vhh-3mvD;
	Thu, 24 Jul 2025 15:51:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewet-00000007hr6-10iq;
	Thu, 24 Jul 2025 14:10:56 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DB6E1AE0;
	Thu, 24 Jul 2025 16:10:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366215;
	bh=NRkJxIVd0ZlILnv8udnGakJfoaHUIwP9DNE9boCy8vE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UlL2edDMMY3vE+u6qV+WJ5BxDywdBIyB7RAh+Z1A2BSwPLSD/Tjbt5wH7jSgmXo2S
	 pGBRsikEUIjG95tu0BC/fX+ieONc23GevfVFtkRlG6l/cs2+R/12EmFf/5GGga2ti2
	 Yh0gHaKR3Na2WZ19pYJNQxwVJ5K8BZ+kgX9479Zs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:29 +0200
Subject: [PATCH DNI v2 22/27] media: pisp_be: Start and stop the media
 pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-22-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7QEP+68dq8KkWsJ+v1ViUzSitaYErWzTwC/
 sRx00/o4rWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0AAKCRByNAaPFqFW
 PGUtD/sGh0joplnq6k8QTbkDJBZ7jg6en6tZ4O2bziq8gjtTEVqGjo6UzEq3/UweR5JgoZBb1/k
 Tx1QTAG0XQoByC1DXrmtvmywS+XInxq5IYbgYMAUXOU5uVhYsuewLsp4Agy4zYV3j4Xe/jHC0XZ
 YgLcevIjOuTFEFWEt0/aD/zvlF3gKqC24dX0fnHwxvU0MQbB8rdZCvgQFUdjrTtdeqD57bU8Uso
 H5XbNZpI5rxaNYKtt2OxPTTEfPENl7CxH0djPgtmT+hAutEd7i5KuTQbaaN0FjTV2RpIx3/Qfah
 VZOcfW2Qpeg6LVCBY5p1HjwzVDsxGeTwsKI7ZtIZvmlp2uffKF7QpQ1h4lJ/yRn8icuiVgoQaBi
 SkxqeU2qvUzeXb/kYEjpS01FX5pq4tMTeSJB2Tgd4yREA1S/+RQcQG9nFvWVdlMw+0nQuSttOMC
 qJNKCcMa87drjlDepLc9wMtSC5PzlGwJ8p1kBibetqLF2ZlxMQGBsZ+4KYBBUTKkwGhAz0LbXPf
 m3xRQ80J+9pkklAc0OfOHXwXjDPZ+ju9eFD24deqbVNLQJ3xj+OXMdWWCh7p7q1eY1waEBdNvmw
 zxSmDb3WIy2ThJL9y/r+52Usz+LasLT4o+qHPz+6yrtPHjZZLmm7fZ7sp8NCupM3s1wxJnt/zTK
 4NxoG8FwDE/wjcA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071055_418524_D09AA528 
X-CRM114-Status: UNSURE (   8.08  )
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


