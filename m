Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FE3E65D2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=su6tsEJry4BzuFP65MpXpBH51+aHQ+dE9vL6DxTxUwA=; b=LcamiLuNFX5pOaHcsXYAwM9BJg
	MexF04sKbhIXcGIHl1+Mq/K0F2uvzOKeDRTvVnelWHEfyZxnYn/Zbsy1/Q2yPz+WpXnvRC/Gy7Q8A
	RKAa7BngFVrRfLcjD1C7zRlh7mAwWrdNLcjJVh+puNK+J80DM9AQwwyUEa7GwfEuU0y5uvlfTCF2k
	Z8iBq7NX44raCptdRMaZwR4bmUd/WVPMXlavC5GzscYhToLk5c8/BcbY4OH1npadcDwPtUg0MZ4iS
	c1/QrnfARr2ij0xGFiIVbKr86lEQ/UhtzBIhNul2nbmnWSQVox7URWXspe+SGdLWLNca0BKwMoh/F
	jFk+ROZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPHJ-00000001xje-0Tse;
	Fri, 22 Nov 2024 08:44:37 +0000
Received: from mail-wm1-x363.google.com ([2a00:1450:4864:20::363])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPEr-00000001x3C-3rPr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 08:42:07 +0000
Received: by mail-wm1-x363.google.com with SMTP id 5b1f17b1804b1-432d9b8558aso16847445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 00:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732264924; x=1732869724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su6tsEJry4BzuFP65MpXpBH51+aHQ+dE9vL6DxTxUwA=;
        b=n4y68So96k0ZaWAee7kk+tDgGrqbxRoeFGpd0T5NRYWFlDLcxcMo1ezsuJlly66zN3
         8OrGa0WzfNN/Dc3NWE6PM/khH4cjZpxtLsyzxtJIPc/8aF/x1nu6PXI3lzyTmcL7qTx8
         dGgrxh2IM21Deefpbb7XVToWWf6rVn43Pmymwpzw2CLC0r1/i82iLi/Y38Ue2CmrnMGd
         SQVvuq6eEOscNir6eXa1wmOK2N0IVM8z5RAvNytZsoDFic2AxyIDUobomUCD1NQpo7Ot
         amK4pKRGCbZNq8gDS+OtOrc7LXz8m7aEYs7ipz3iMXQpx+Py6JwAlCwxzIKt0JWte7Dw
         0SCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732264924; x=1732869724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=su6tsEJry4BzuFP65MpXpBH51+aHQ+dE9vL6DxTxUwA=;
        b=V815XljsTOC2/GnaeCzzkbySZil6OtywShyGjci+yc8/TdKdhy7m4qRg4fubP8p878
         MNyT/BKmv8jT0Swia/oJFCheCZuzpDyf2zVehLG2yhzPP/zhsS+cfwIei8azuanO4VPp
         6/FffiKruqJ1APjdLo1k7zUljADqNWuPh/j7J2v+rlM/WkD41SiDrPggql1eUgn+pp09
         8tiOV/qSi5wOEpiUQOD62RkOz8KsrtMg9dnOlvGubRTmsZDxcmCYCRI52M5vRldShxR+
         qQ9KU3PqNI/owcPB4u8/nlLRPtbcF/iF5hhEsA4TXpdEpljNFkN8XqeUPgAGMrBzEC56
         cBIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaqyU/kRCGiema4IGD0Hjo3Q8bezwkUhvsEoBk0MWcbZChOSSoG7ERPqj+jrQV+g3jvsHHIQcpvXJ3BchSi8Gf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp3/cHmP4clc8EPTUAnx/apSaB1wkuvuqJ4rJUlWKpVBtvmB1W
	HK5kSEUyoozHAfAUIMD5iPcxk1qr0Acc8KVVxdZq3kXS9G1awAahzdJYEppeo9ggdChbgio6rUZ
	Ndh/nYw232ACBerB2RS1K4kKqL6hoAbUF
X-Gm-Gg: ASbGncv7kRpOVEiQXr+469No51Yg8/5sxzZ99u8AemZAgZjzd+z4dRvkc+3TOy4u7Y8
	/7BA5B+PPLr88P/v0O5+4foPB/hug/jy/cu2J+sw5LFSdkXGngX3D58vKcvHvZS8p1DbtfnR9fQ
	Kjc+g30ffV70zKh9GdDMkJLpajBhD0lY0gB7SaBFlbhYrAg2XVQmbqnWZubIzCVW7NAve3ocFq1
	B6Mk79zHnmMudIj1uS/35qJNonA2XuwkzTOzLZnyo94IFGdLwswMP4LN3nir7+reg==
X-Google-Smtp-Source: AGHT+IHzC1eCRwXGViTOOLSFM/PDCwUqY6DKBuYcoiYSQl4qaaz1QaEXL2O6o2F/GfgoK5RmaU1tu7qT3rGx
X-Received: by 2002:a05:600c:5105:b0:431:15f1:421d with SMTP id 5b1f17b1804b1-433c5ceeb38mr52428355e9.16.1732264924132;
        Fri, 22 Nov 2024 00:42:04 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-433b45c428asm4064825e9.23.2024.11.22.00.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:42:04 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v1 1/5] drivers: media: bcm2835-unicam: Improve frame sequence count handling
Date: Fri, 22 Nov 2024 08:41:48 +0000
Message-Id: <20241122084152.1841419-2-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122084152.1841419-1-naush@raspberrypi.com>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_004205_981962_660BDC52 
X-CRM114-Status: GOOD (  18.69  )
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

Ensure that the frame sequence counter is incremented only if a previous
frame start interrupt has occurred, or a frame start + frame end has
occurred simultaneously.

This corresponds the sequence number with the actual number of frames
produced by the sensor, not the number of frame buffers dequeued back
to userland.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---
 .../media/platform/broadcom/bcm2835-unicam.c  | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 3aed0e493c81..36fb186a0421 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -199,6 +199,7 @@ struct unicam_device {
 	/* subdevice async notifier */
 	struct v4l2_async_notifier notifier;
 	unsigned int sequence;
+	bool frame_started;
 
 	/* Sensor node */
 	struct {
@@ -742,6 +743,8 @@ static irqreturn_t unicam_isr(int irq, void *dev)
 	 * buffer forever.
 	 */
 	if (fe) {
+		bool inc_seq = unicam->frame_started;
+
 		/*
 		 * Ensure we have swapped buffers already as we can't
 		 * stop the peripheral. If no buffer is available, use a
@@ -761,11 +764,24 @@ static irqreturn_t unicam_isr(int irq, void *dev)
 			 * + FS + LS). In this case, we cannot signal the buffer
 			 * as complete, as the HW will reuse that buffer.
 			 */
-			if (node->cur_frm && node->cur_frm != node->next_frm)
+			if (node->cur_frm && node->cur_frm != node->next_frm) {
 				unicam_process_buffer_complete(node, sequence);
+				inc_seq = true;
+			}
 			node->cur_frm = node->next_frm;
 		}
-		unicam->sequence++;
+
+		/*
+		 * Increment the sequence number conditionally on either a FS
+		 * having already occurred, or in the FE + FS condition as
+		 * caught in the FE handler above. This ensures the sequence
+		 * number corresponds to the frames generated by the sensor, not
+		 * the frames dequeued to userland.
+		 */
+		if (inc_seq) {
+			unicam->sequence++;
+			unicam->frame_started = false;
+		}
 	}
 
 	if (ista & UNICAM_FSI) {
@@ -795,6 +811,7 @@ static irqreturn_t unicam_isr(int irq, void *dev)
 		}
 
 		unicam_queue_event_sof(unicam);
+		unicam->frame_started = true;
 	}
 
 	/*
@@ -1413,6 +1430,7 @@ static int unicam_sd_enable_streams(struct v4l2_subdev *sd,
 		if (unicam->pipe.nodes & BIT(UNICAM_METADATA_NODE))
 			unicam_start_metadata(unicam);
 
+		unicam->frame_started = false;
 		unicam_start_rx(unicam, state);
 	}
 
-- 
2.34.1


