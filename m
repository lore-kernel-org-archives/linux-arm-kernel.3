Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F804D74EEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 15:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r1qk+ARscTtmVdRCZrEBAhBX3S2S46H1/xkuqvs8Pgo=; b=XIfr5JZUNpfYTWiVrGhnMvVk4u
	5KHAeDcVU6JU8RTWjqkUHZL8v6+pCb7QljY3gNK83HJ3qH0ILEzI0dPezGQJEy6D+wJDctbl1tKz8
	xFEWvLB0b6fbDSKnxAPpJ0wppuXGGpj9mQfelmGxWuKkxhLlDYcAeCmEDZewA4a7KSv15Yg8RyNAg
	pMSp9HhQ46+KijTwG9Af8swP5R20vilRB4utReV2yDJ4pgl/SpZYfgjjIf4QVbexl4ws2BXrwOgUJ
	ITNrKPUM6fB+byJLVxedRgV3R9RsU1TeKbzAeBABsCtLlu+iX8g3PmAu3o5wjSAfYd8eMPJBNNpuO
	lqvq0cRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJ83-000000096cr-1VzE;
	Fri, 23 Jan 2026 15:31:19 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJ81-000000096cJ-0euu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 15:31:18 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c2af7d09533so1564965a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 07:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769182276; x=1769787076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r1qk+ARscTtmVdRCZrEBAhBX3S2S46H1/xkuqvs8Pgo=;
        b=CJTSc/KFez4+IIwMMB5mwwCvtteo8mMBhRTFGAPeQofN3E3u5ZzZPXn4QIT8uGvhxE
         7sYzqmDddBgzeAcgdXSbSVFEeTQyWhafSlD5tAOuiI6gavUVlR8xQsPvq/qmnQ4ViHRh
         uaseuxkLTrTNIFEIK2I+/KLJUKSWB0N26xa3pAYs1ASH85Dm4WoIUfL0g0zoT1ia6yIe
         XhijLW6D7uL86ToTdcT7StH78iM2+dfDFaYnZ5iV7+0F0dppdJ3NKpkWHwXvyo7XFJlz
         2E19rZSns05KG8EVWZxysjZ/k323t3Ja1nbEYnFj9XFLib8eF9QiVwlkiXJQMeQzcfs8
         DRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769182276; x=1769787076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1qk+ARscTtmVdRCZrEBAhBX3S2S46H1/xkuqvs8Pgo=;
        b=YwxRQWsqN6xm1H0QDvnTgCr78AClfGxgFdGC8jtNpFNEox2pde0mTNKGylEC5vs8G5
         8RQDcqO2ZoXRnVlM3pUSwg2OyQSLmr+7YNCoUEDCkj05b+yus8mxMkeWieC6XyBlLEG0
         Y8CNDXDU1I/fB865RLI79ltoQB4OMfpoL6gEPi6F8VNehhuR9QB8WC/qUS/L5pp87Z4u
         sjy0ORfy2EuVYv5MbaGBS+l4LcXYB3g69C4AffcUGc58FFKR0vbMle1+7CJm4c00JgwF
         JZmT+K62FsADOH4DQli4HiLjWNItR3hTtXo5VJiFJN9H80w6VJst3/ub6/qOO3xXmatw
         spAw==
X-Forwarded-Encrypted: i=1; AJvYcCWgO1n8Xik94MkDE8T478sOONrP555aS4tGP78tnhiCf6rWX0pEMiPCRw7zZxj6QWdxr3GRAWPlarzqXB6gqR84@lists.infradead.org
X-Gm-Message-State: AOJu0YznScgR5yDMhofvx955nHcEmECpX3XOkMo+5JvD9u5dWrh+KoyP
	yB9wN/kq7Y6As3du/uo7+CtelxctMwQwLpe/OcuFiZ12IeFcYEL+SpdW
X-Gm-Gg: AZuq6aJBptPRDxMUA8lv6sx7LuospVTe642PfEFB8FPrqHDZmpNvUnYgzA3C5zmFU7y
	U0VAI/1VUhpIzYHbYCTiW1HbYUmDqTYlJ4AlHqFxaeRGSkS5+oJvNr7jtBFvqSjw2f78TsYoGsg
	bQcx9SxPTD2jj9DkHak/1FWGcpoQYhDPD6LSHPpg5Dp5XEisoWHBSLP1R0c7cSA6l64cGayOzoz
	ZBqwlS0ElIZ/IRFJgJXvL7F0lophFGI+Bc/FV5S4kEct5Du1sDurBNTgBhZEyxFtLieLmzR7Q1P
	0FiZ2BOt8TQK5JmQlKrgGPSPN//lbHI1jq1pOMQvQKZwwjgXjc3nNFxuKzOp6GGSX26RtcC/ST3
	nH5mrm4ieVQ/z1LDH2w2E3doeweS1/wRxHUftOdarcq8COa17PcBA+Kp00Us0JItNpfEyVk9jpp
	OcAzZSG2BGLup7c+vz8Je2lVuqLPJWRtQgCoDRrUDzI+WWQ0XwBJSMRQ0Bkdjf7MvGGJyafcBe9
	BjwE4Jg8Q==
X-Received: by 2002:a17:902:e786:b0:2a0:bea0:8207 with SMTP id d9443c01a7336-2a7fe7469f5mr33031065ad.49.1769182275581;
        Fri, 23 Jan 2026 07:31:15 -0800 (PST)
Received: from nickhuang.. (2001-b400-e2d9-1931-19a2-fdcf-8614-4260.emome-ip6.hinet.net. [2001:b400:e2d9:1931:19a2:fdcf:8614:4260])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97f3asm23453705ad.59.2026.01.23.07.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:31:15 -0800 (PST)
From: Nick Huang <sef1548@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kusogame68@gmail.com,
	Nick Huang <sef1548@gmail.com>
Subject: [PATCH] drm/xcsi2rxss: use str_true_false() for boolean dev_info output
Date: Fri, 23 Jan 2026 15:31:04 +0000
Message-ID: <20260123153108.19204-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_073117_194176_A5D5CC23 
X-CRM114-Status: GOOD (  10.81  )
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

Refactor dev_info calls in xcsi2rxss_log_status() to use the
str_true_false() helper instead of inline ternary operators
("true" : "false"). This makes the code cleaner, more readable,
and easier to maintain. Added #include <linux/string_choices.h>
for future use if symbolic flag printing is needed.

Signed-off-by: Nick Huang <sef1548@gmail.com>
---
 drivers/media/platform/xilinx/xilinx-csi2rxss.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index 146131b8f..e0c5b2ceb 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -17,6 +17,7 @@
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/v4l2-subdev.h>
+#include <linux/string_choices.h>
 #include <media/media-entity.h>
 #include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
@@ -400,19 +401,19 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
 	dev_info(dev, "***** Core Status *****\n");
 	data = xcsi2rxss_read(xcsi2rxss, XCSI_CSR_OFFSET);
 	dev_info(dev, "Short Packet FIFO Full = %s\n",
-		 data & XCSI_CSR_SPFIFOFULL ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SPFIFOFULL));
 	dev_info(dev, "Short Packet FIFO Not Empty = %s\n",
-		 data & XCSI_CSR_SPFIFONE ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SPFIFONE));
 	dev_info(dev, "Stream line buffer full = %s\n",
-		 data & XCSI_CSR_SLBF ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SLBF));
 	dev_info(dev, "Soft reset/Core disable in progress = %s\n",
-		 data & XCSI_CSR_RIPCD ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_RIPCD));
 
 	/* Clk & Lane Info  */
 	dev_info(dev, "******** Clock Lane Info *********\n");
 	data = xcsi2rxss_read(xcsi2rxss, XCSI_CLKINFR_OFFSET);
 	dev_info(dev, "Clock Lane in Stop State = %s\n",
-		 data & XCSI_CLKINFR_STOP ? "true" : "false");
+		 str_true_false(data & XCSI_CLKINFR_STOP));
 
 	dev_info(dev, "******** Data Lane Info *********\n");
 	dev_info(dev, "Lane\tSoT Error\tSoT Sync Error\tStop State\n");
@@ -421,9 +422,9 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
 		data = xcsi2rxss_read(xcsi2rxss, reg);
 
 		dev_info(dev, "%d\t%s\t\t%s\t\t%s\n", i,
-			 data & XCSI_DLXINFR_SOTERR ? "true" : "false",
-			 data & XCSI_DLXINFR_SOTSYNCERR ? "true" : "false",
-			 data & XCSI_DLXINFR_STOP ? "true" : "false");
+			 str_true_false(data & XCSI_DLXINFR_SOTERR),
+			 str_true_false(data & XCSI_DLXINFR_SOTSYNCERR),
+			 str_true_false(data & XCSI_DLXINFR_STOP));
 
 		reg += XCSI_NEXTREG_OFFSET;
 	}
-- 
2.43.0


