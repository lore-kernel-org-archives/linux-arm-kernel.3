Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16ACCFA45F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts1NDd5vcHREqhcvSTV/1shtmvDfyt1K2xdMF/qf56o=; b=uRsxq9Kh75bzGgTImKr66vJtDu
	NrrDg4W2sU2egHC92kdOcu9DC6dCZwj9E9OZsOatPxdBjAhKSJL2J1jvpzMnLZ/gKj+L4daNv+Fk7
	2HtjSxp3OrHqtfo0fTRlOO/Av2b+D1xP6P/TxUQZESKiFQAMhozXrva1lxQYw66c5lCQPCLEGEpfo
	2UrcgZuPx6IMGyuqPxOYQwNd8GMxz/hjklmM7kfSGxF/ZMenbILlMLDivexGyQX1GTkdEl38gPNJ/
	g9OVi0e+i9rLstwjpcYjKk1kADtdY+AWw6oOv5KfwA78AbyAt1h7pCXd7kfAtDjel4Ml60LRT5yYL
	KYaW0RUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gsG-0000000FdWm-1YeK;
	Wed, 23 Oct 2024 19:18:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZS-0000000FDfw-1Y2o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4315baec681so73403475e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702252; x=1730307052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ts1NDd5vcHREqhcvSTV/1shtmvDfyt1K2xdMF/qf56o=;
        b=oMxgXVVxYl5ciC9VwN60aKH0BKqefcsWpL4P0e9SQ7QZBL3IFcRevICCPJeDWhu1u5
         Bt50squepzsCW29PFu6qrAu80gMtPNvMU7Lirm67qg8BXUFopry2Y8x2JZq5hlQ/UNyS
         SDL94/+F9gGGua16WuI0Kdr+Cv45AWTM19DlLLD/vIT43FZV7T+e/Av9CFjJUYV+LvVX
         vmKQTuSJJYIFphgFdWE3p9G2FtNR/E+KI3f7tSxvPYzqQZVJ7qDZTy09jfnodMhp1QXH
         hJfsdP/wKXskjiIKrUsMEmbPu1m8HRtf2y17UTLKZ65lPux1+vUbRxq+GEdbDmcFy4lB
         FKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702252; x=1730307052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ts1NDd5vcHREqhcvSTV/1shtmvDfyt1K2xdMF/qf56o=;
        b=ayTQJmMOi978+1YxsNIlc9BqRmoqEl7DldEZzGSi2ej/x8AkKae47SDtJ+zDhgjMc7
         J0VEbqFdGjdJpslfUuQuHOJMR8wwwqXeKowciMCCNS+EZZIgPFaLDnaKGPZlECpTNKD2
         rZ//izqTcAzP1ha0Q8Z/mEdBA3FXyRi+KSGH1HF/034rXGeDhJMpBoF0D2Em5ZBqeY5g
         B0caDa60KG9K7hAv9q6XY4D7Um5U1mXL9Qx7eNtbf2awQ8P74W+feFLJFF4zLfdcgoT6
         OwVR8mB+w25TYtWcmFgT4B3oKFcTnDWykmsknSrtfuUjfJj1jTPWqfytVGsW5w/sd1rt
         Iwew==
X-Forwarded-Encrypted: i=1; AJvYcCVXUp+KcyMvyMBRG7cRu97nhu7IXd50JpISqI2Stq7LIDl8+8Bs3B90Q2kYCrI+IDz4D1blHaHdHRSk9ujwa+qE@lists.infradead.org
X-Gm-Message-State: AOJu0YxaRCRA8ZBSvicV4dYYaejxFv40ZEE3ct6347wCSBGDSvD3TtIZ
	QTPpGHNb8FFeHoeePxtC0YWejBHOeZRM36kw7eUbgPybvwAu5PI8+hEsLXZhgOA=
X-Google-Smtp-Source: AGHT+IF+Ep5cy5ocAHASp/06u2OSiKjV3AGCYRQMjGhBm4svhBLkWe/K2mww/KQzVSfsztZblCEfXg==
X-Received: by 2002:a05:600c:358b:b0:431:46fe:4cad with SMTP id 5b1f17b1804b1-4318413e307mr28468675e9.9.1729702252475;
        Wed, 23 Oct 2024 09:50:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:52 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:29 +0100
Subject: [PATCH 32/37] clk: bcm: rpi: Enable minimize for all firmware
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-32-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_095054_413632_9C60FC7D 
X-CRM114-Status: GOOD (  10.64  )
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

From: Dom Cobley <popcornmix@gmail.com>

There isn't a reason not to minimise the clocks, and it saves
some power.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 274176a938c6..fd7ae0efcf07 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -111,21 +111,27 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 };
 

-- 
2.34.1


