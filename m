Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AA0D609D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDLmlhfFf3fKmWcDI3ja5XlaBhDY7yQ7y51lLCUjcJ4=; b=Umtqso/wKC1RFOfPTp1YyZSiTd
	8hU0EhobTcSlPAHFkQS5r0w5gxnaBr0NE73DquKJ0Uu9EfPTIh8lQpIKMTcFfzcIqyR8FJXockOjT
	+bYuhbOhKGTA7c8UwWrCkLKE/DFuX+gXSxCZp1DAXELP7HsN4/V6m5QjQLR3o274cOXPQ2xVzLzqd
	P5c2tPP4BV0gwJgnim5hG0Y4lGi+3D5Do0sY/qOe7kkqgrF8Oqy8vI7MqPXsfVeNhla6mJ2In0Tl3
	9w2rmp/FjX4UqIHiBYH3C4twadKMwXvOSUnQ4M76Un5hRA5OeW0aXJVNEIjkIupdEE9Re3FFKXLuC
	fyxb1EWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG6C-0000000CzP6-2hmj;
	Wed, 27 Nov 2024 11:20:48 +0000
Received: from mail-lj1-x262.google.com ([2a00:1450:4864:20::262])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG0w-0000000CyHz-0PQn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:15:23 +0000
Received: by mail-lj1-x262.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso75906351fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 03:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732706120; x=1733310920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDLmlhfFf3fKmWcDI3ja5XlaBhDY7yQ7y51lLCUjcJ4=;
        b=ByN3U/ybDLN17nKgjnsldF+FJpVG31ERX5YY5nfea6KGA0U6t1jia/ELDCYpjMzObe
         DW7AWmDgLxbtqvZ8ntCPSxZtZvR4jqrb/zW2tmphl2Q34i/sn9jIyhcgjV4ccGspoktA
         uWHJf5I1LBLSabqtk0Yhn1Hxv6qOVLMW2K9FJmCmr+r9UhOUbm6zgiW+nDrQcUQQPC8e
         FGj350V6dMlcidRSJFUdXWI8XefF3+lW9DaIN5gMwn+tb28GaXJj0BV9Ubw2sZRXKQVz
         Qdx5eC49NgJWfmPd17WfzKFrKzgDda83CJn9vDGdJqy9yj3HD346fUCy4eN6eiy2jTHM
         HDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706120; x=1733310920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDLmlhfFf3fKmWcDI3ja5XlaBhDY7yQ7y51lLCUjcJ4=;
        b=lQerGaYG2ofrSb1jl92zBVd8oSGWSe2TH/f9xF609H3mG4qxQtYgrjjGZL10D4dhly
         wAa6H1l8nwiWsQGYBVDeXiu88xp5LF9GOtYoe2GsZQ/KrOwyHqIQ4XremFgZFsBRGEoh
         MorR8awErD0o3VK3WXFl1mihH9kpUUennJKehsCmbDID/EGXN/OC0fpxX429keZGq2Nr
         n8YWrL7C0PyZLXce8NWNspeZPjAEKUqthjBuG/7ctFM5f+y9yZ3Kz0ZGksBc+Lgz7Xvf
         8KEMCpgmKPPbDwUeOX2GvsPNBooNUo2M5oUyqvjmzI1/qVXL9uyvC+NnOb86BPawNe/b
         DBpA==
X-Forwarded-Encrypted: i=1; AJvYcCU+qfWgmY9YJBCXIb06xv2aJ2IMiohiufAR9BI8K5hIIWh+48xA3dwASaAkmoICMAfoAYREuV5ksFxf1IvKsAPn@lists.infradead.org
X-Gm-Message-State: AOJu0YzMN6T2kF7y6VB/s8r3jomgl2DpM5Cub5uxeh0vbqxsM1feqnLt
	LOUoTYn67wwgmhVMDYRx6Rbxb4Qy2XvNhYaNJO+iRWK3KAdHjTR7rJIeUcjeV5f5YlFrNB94T52
	S5bd116GoWiK0Vh2lGx25+sxSPoj21z8G
X-Gm-Gg: ASbGncsWUvpLFzfKoyw0EYnwBD56+5X3W5bDRGEBvhTUMAOR6KTflAjuu/DM4VP9ziA
	SSpUIgt8fOmoLNz4eKf4N1IW3zUf7Iq4tobJ7umee/7Bl6hOjIztPB6DASaVfui/zafUwBbbQss
	pDkushtTgC61hRHnDWEvF9YFkpeYbAuwURSiuOicT/JM5P6t662BeAwEBOm02Ff6ptj2amDK8Xg
	n/rxpxfHJZe9aon6KuyliU6dR59X9n8g6MNzNs1cWx7Td9dyTKVJUVOA92FK5Q3vg==
X-Google-Smtp-Source: AGHT+IGTwoCSNs5BBDwFG/AtnZDnL6h+6Oxq6PET6Ihsy3bf1ZEmlnpsnNPW65FRF37uJIGFAM/fVa2LEDdW
X-Received: by 2002:a05:651c:211a:b0:2ff:c67f:5197 with SMTP id 38308e7fff4ca-2ffd605a257mr12586081fa.13.1732706119878;
        Wed, 27 Nov 2024 03:15:19 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 38308e7fff4ca-2ffa5eddedcsm1274321fa.59.2024.11.27.03.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:15:19 -0800 (PST)
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
Subject: [PATCH v2 1/4] drivers: media: bcm2835-unicam: Improve frame sequence count handling
Date: Wed, 27 Nov 2024 11:15:12 +0000
Message-Id: <20241127111515.565992-2-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127111515.565992-1-naush@raspberrypi.com>
References: <20241127111515.565992-1-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_031522_144605_E1697D76 
X-CRM114-Status: GOOD (  18.88  )
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
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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


