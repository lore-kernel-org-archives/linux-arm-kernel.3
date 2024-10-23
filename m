Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B850CFA461
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFtxhxYujLumaUhYyF7W41V3jkXWk5OXPRGFqIjwWy0=; b=CoPp/Ztwd2WviiAUcoguReNU0s
	O+5ZIHAs9GLu+ZHjxjZvwG5LEDSLxQF2TfJ9NBhNqmTU4MmQ9sP7ZTvt474xtCrfxUHzjrV4zs55t
	Jhsfu+r6fEbG0MDxUqF9WHuWfhoVfiY3eCoblA9vorjAOhFiIe7PdReQyUEZKnMPsY3KNK1MsUgJg
	nd3Xkb2OtpNlyp7lcLTQThAApe9bK5l+u5m0KVcRrS+rZJbrMDQehgM5c8HwJUfvUBBg36r3UqLO2
	xNHZC6qGvcJLIQChcqwemcQOELcHsTp05m5wcWeH4KL+LYnIuD57Lq5Ss5zo5oz0fmn/LCx9wumIf
	1AVz1Mlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gsU-0000000Fdjv-3P6O;
	Wed, 23 Oct 2024 19:18:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZT-0000000FDhD-3Jh9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so69622935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702254; x=1730307054; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFtxhxYujLumaUhYyF7W41V3jkXWk5OXPRGFqIjwWy0=;
        b=c/pQ3w3jV2L+fq8In60XN8ZGUsrBsW+Gea6JkbQ/Zx9IyIt6XD2NRu+OCQpUQsAtAt
         QARi8Pd0UhfH4NSIDCH0nf61HnXrkOmxSVS3gBWZexU6FBHDJwTW0zbCzsvfaLq3KPId
         4Yj6o0R+Vu1G6O4+EXO0LYSho8R6dIMGcmQYDgBWoAh8SaH6P5mePfZEOJVg1CiqaHvv
         hZzKTQHtbc82voOYhE5MjsT1DEWg+zcA6+0WQE0l/aq2sMhxY0f1Pl4NyWYjNLfE8PYO
         oYCTWGLIqCXFCSenGTCPzIWVseXuyWTsPzTFMljHys1Zr15UtMc990D82ijyzg1cxEfw
         c5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702254; x=1730307054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFtxhxYujLumaUhYyF7W41V3jkXWk5OXPRGFqIjwWy0=;
        b=VyOLiu1IL0AVNwdnEjYQ3DrN9v5KHBJltvMRvF/QacCyOZRD3owjPrH8I06eL/KUTn
         aWGYaStWvEBk6ELYiH2qh0PX70hnYvOGnIF9XxdD9lsilVHVPfTbXTMPbzsBzRUvDWUj
         ee/7iW+tPX4Q8haQb8mV/U38dIbztL/P6pRdaPBygmLXwX/XUQbwbyq7RUgNFyk3Vch6
         4cLxgyC3UAb21KFn1IxfzvLuqzleKBEP/yjEseB3rQIuL3kfW7or0YdGDg2vl16YfCLG
         SNPA3GJ3j2R7VrGfdoPWra6AOxrnKp9dSiFV8U9TsxlwTGK/ers2y6/zVUBuEg1r3o5N
         yFNA==
X-Forwarded-Encrypted: i=1; AJvYcCW94/P7NPBK6so8/xjksSb3gNdi5014sllmCzmYtVVK2ancQ9Mq3khSMl6lCmOXisZWue8uENd0k6pGMc44xWWD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw62xtzAnsuKSl59k+WdHDwxLfXnlzl/FMaFz6+cogNSE68Ao3R
	ufQ6OcUhGR4qI3ZInXs/kkvB67sozLwGSko2yoHG+9j+6dw6FKHQinYatfxBAKI=
X-Google-Smtp-Source: AGHT+IH4dOnkzCDNmAk4RGF4mcO+87rO9BS2DXATZO3jiQ7gGdJCQSnc4CC+BnBw8QyI1TRa/qtaAA==
X-Received: by 2002:a05:600c:4a9a:b0:431:57e5:b245 with SMTP id 5b1f17b1804b1-4318423b9e1mr26772775e9.23.1729702254379;
        Wed, 23 Oct 2024 09:50:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:53 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:31 +0100
Subject: [PATCH 34/37] clk: bcm: rpi: Add disp clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-34-1cc2d5594907@raspberrypi.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_095055_988645_AA72C98A 
X-CRM114-Status: GOOD (  14.30  )
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

From: Maxime Ripard <mripard@kernel.org>

BCM2712 has an extra clock exposed by the firmware called DISP, and used
by (at least) the HVS. Let's add it to the list of clocks to register in
Linux.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c          | 5 +++++
 include/soc/bcm2835/raspberrypi-firmware.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 89e2c0241ff6..aff9f3195573 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -34,6 +34,7 @@ static char *rpi_firmware_clk_names[] = {
 	[RPI_FIRMWARE_M2MC_CLK_ID]	= "m2mc",
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID]	= "pixel-bvb",
 	[RPI_FIRMWARE_VEC_CLK_ID]	= "vec",
+	[RPI_FIRMWARE_DISP_CLK_ID]	= "disp",
 };
 
 #define RPI_FIRMWARE_STATE_ENABLE_BIT	BIT(0)
@@ -139,6 +140,10 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		.export = true,
 		.minimize = true,
 	},
+	[RPI_FIRMWARE_DISP_CLK_ID] = {
+		.export = true,
+		.minimize = true,
+	},
 };
 
 /*
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 73cac8d0287e..e1f87fbfe554 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -152,6 +152,7 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_M2MC_CLK_ID,
 	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
 	RPI_FIRMWARE_VEC_CLK_ID,
+	RPI_FIRMWARE_DISP_CLK_ID,
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 

-- 
2.34.1


