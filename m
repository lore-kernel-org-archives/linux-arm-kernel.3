Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BF3D149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+NR5LKr4OxeWQLlNj8flZMDifFbPCFEGLf/3iSNdew=; b=F97CcgHcV1vCGOtZ8kw+3Ac/AZ
	cy4Mmhp240ySaxXZvXdXWrVrYRBpyHYE/dcjN5KLJy71XpqSU+bdk/z/vpR4HqisY3q4KXlPkYyfD
	G/F94aDdaPaMmHuiJyTtDBrZ0T3TrCVg1C7ijLpBKia4EQOpjSdxh35gXWwFzrpdcczUoGFhpIDaf
	Gu2F1rRTbZ9JcJTk9zkX6hnK4HZOsDaSpD+2sNyAzX07NTMbp71JZEsdzlGqOUSXRmcUayGbLQOfE
	kx+HnMUTVMx6+fCVSY3G1k6UNKkyWUra3Vm8wNcPU/zNilN/10vekphmVc2AeYv7g15z38LtuX7L4
	fU7YeS/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ob7-00000004hsZ-0HcC;
	Fri, 25 Oct 2024 17:59:41 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvO-00000004Y4v-1shA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43193678216so8349155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876593; x=1730481393; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+NR5LKr4OxeWQLlNj8flZMDifFbPCFEGLf/3iSNdew=;
        b=UFnHt0LOYBt78RQGMd8s2Q3MBxcCA4TQCc1t3CSKWvUIX+SuNOq2Esmj48iEViuSBs
         0TT6uOAJcaFelvcuerq+XfkC5Q5Cm6L4N5BVWbkrc9jjFL1ww9iJH3lQYYeGxL7nPfJG
         OkJ7+Zpu2vShOim8yJVuKQnU/j6BvwDBNusRI4an/J8OvFG27dTDiMpdmPhvK2CiOAjY
         fnFsQtn0A0cYq+g2mHOR1CHyqexcvo8EpDw1165LSoAG9RicdRZIya4cfy1xMH1oqoDh
         X9MMSEK6lHWVWOD5Ww74lABMyMK25/EdwmNzsE5JGO5reFg+Pje/gjlo8g+tVBBH860u
         VjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876593; x=1730481393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+NR5LKr4OxeWQLlNj8flZMDifFbPCFEGLf/3iSNdew=;
        b=sghqHkG7xF7PWdWUBntu0DyYJCgQPhPv9rXSXdlUXS1pwQO/B/gz8FDEGpyndCxI9L
         OwLboqQP6h/O+SbR785LhrHiZTIdzdkAHWRfIJwmYvuLhhFn7mhlcyjsNMXWG0H6GKWN
         B+cqGHeXsziztcHpqxUkLwRjhZ13Kszz8E83ApYk2j9n38wQmKBrqTArgEliNOksLjIT
         rmEtBZq1e0ezrU+ulnTvOdOeHAQ+qvJ5h4T3dmKPTFuVaoX+vumhA7l1yj2Jmn+lncTm
         N9/hUft6fTfxR7Mb8UPJYwdapnJEjwOftoL1m/Btay0r4QpJj0iz1WRcu7Gqj/sD7prZ
         Euqw==
X-Forwarded-Encrypted: i=1; AJvYcCVnG8eWu0J8NbuU8jUD2DoM7Imgm5fdW6QvZHtG3qpwLOukLQs1iW6sCjZewsORo/TKw5Qirmw0sbKrad4PX6hO@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh33W3tJRrZpaUGCoIqDakjrsDoN1SCBqJl2Z7WcIpu5ByYpDt
	/9mIkG1I8EfzlR+q3apodOngIHzSmR/0NpHt3ldQpTMOgP8q0HXLY8dJ2vSM/xE=
X-Google-Smtp-Source: AGHT+IHe5tCoSz92UO987eOIzi01b4rnj6tRANtMPS83mpXtoleIp32yTkc1Cq0CRABNQvTNNn9/Eg==
X-Received: by 2002:a5d:63cf:0:b0:37c:d57d:71cd with SMTP id ffacd0b85a97d-380611ff862mr97480f8f.52.1729876593018;
        Fri, 25 Oct 2024 10:16:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:32 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:04 +0100
Subject: [PATCH v2 33/36] clk: bcm: rpi: Add disp clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-33-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_101634_817908_DC3EE2F7 
X-CRM114-Status: GOOD (  14.56  )
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
index b12d86720207..0e1fe3759530 100644
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


