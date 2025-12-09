Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22F2D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vc0KdQKgNZDHuGXWBuNPLT4Elf9b/jVqB6VSvsEiHQ=; b=EYNRQ3hyjz4GB9rGyvHffm9r5z
	GDZtYvltHU8ehOaW8X55UsnHWzRGxwwx1s3ZPTqIrIuaDYg1aUXu8mG3ZKH5+WO5Kv70He4tuCcWd
	4qkqLfw17JDXBYGwyhmKLM73B0SGkrd6odedR1o5PHA8619FzKPC1fTgSkeKDQsOVceK3bPMWMMmT
	lk+Y6h2MGONKUnvKAeanAuKuJAxZwF9k+WgrR39sWjcTl+DOAcPWZRxsVX5uoYKbsiXt6RY94JshC
	0RKiRDOnSD9MmNjP0yOgSJiV9f4aHNY6eXCaxCv9M5Lxq1r01vgPEcQevNNistvj2VoOYeP+kMESM
	CiiAzXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwsv-0000000EFUb-28B9;
	Tue, 09 Dec 2025 12:32:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwsr-0000000EFNB-2uH7;
	Tue, 09 Dec 2025 12:32:02 +0000
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66E84BE1;
	Tue,  9 Dec 2025 13:31:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765283519;
	bh=HZQyMjT87Z1PejUxmVw81uhUIpqcMrEpz5q4yzf0/Yc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ExoYpECA4ZPC8E5wHdP7Fp7YT3Eox6+ZgfAUZbjEZCzaREBQIAugY4O33p21RUnmP
	 wzxinv3+L3Xu0W4kdSNnAmjzAzgwFvjNyAmXxiGorXjwi546ZXi2GJuLD4IJx78HwO
	 Fv5joDDbfDTk9VBi+Gl5YEykwDK//JRQiNsa6qpM=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: dafna@fastmail.com
Cc: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [RFC PATCH 6/6] media: rkisp1: Give buffers back instead of dropping in bypass mode
Date: Tue,  9 Dec 2025 12:31:36 +0000
Message-ID: <20251209123136.273938-7-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209123136.273938-1-isaac.scott@ideasonboard.com>
References: <20251209123136.273938-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_043201_897124_3537EA06 
X-CRM114-Status: GOOD (  12.14  )
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

In the data mode used for YUV passthrough, falling VSYNC events are used
to determine when a buffer is complete. This means there is no 'Frame
End' signal.

Previously, all buffers would be dropped when bypass mode was active.
Instead of dropping every frame, we should return the buffer to user
space if it is marked as complete by a falling VSYNC signal.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 6dcefd144d5a..ffce08e45200 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -832,6 +832,11 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
 	for (i = 0; i < dev_count; ++i) {
 		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
 
+		if (rkisp1->in_bypass) {
+			rkisp1_handle_buffer(cap);
+			continue;
+		}
+
 		if (!(status & RKISP1_CIF_MI_FRAME(cap)))
 			continue;
 		if (!cap->is_stopping) {
-- 
2.43.0


