Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0CDC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWtWtBwjob36nAaKnSWI4pJUD13rGF2wqiMWwwOpQSE=; b=m+lzBql3n/6Hq/7v/+p3TfqdGr
	DuMC1h5RZkQZdcyx6qW/4sxTGJNt1xwH6gjKF3mxBhiHyaqjM0TC2C9jfusvWlU+OiR+vRfNkgG5a
	1Jc0fbPbz22GDZAG0XVrDcfDXaUALnA4G4ic4dqXvUoDmv9SHbaSJXJ8zrm+ModPpyepqxHyXGeph
	vJYmZ3KFN3ZQGYdzuVePC9nJ2EZPz+7cHQ0F/fdGbMVH1U5H3lew4sPZYgxMrQjsI5mqG9Lk3zLpP
	ebheKb3OQRMhQG/Z35FOyuGnZ2itbLusg48ZkHQjdGALNDbfXqdEdnRKFCLkKtGy36KrLnQ/5HwY4
	Mjt/9AJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnMl-0000000Bsfb-0uJC;
	Thu, 26 Jun 2025 14:14:15 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnDo-0000000Bqzq-2tnt;
	Thu, 26 Jun 2025 14:05:01 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-adfb562266cso199710066b.0;
        Thu, 26 Jun 2025 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750946699; x=1751551499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWtWtBwjob36nAaKnSWI4pJUD13rGF2wqiMWwwOpQSE=;
        b=THoIxbIbfQdr0B25Toluwx+eYnzszxEIqAlbhmP4M3Yg7Mv44Ri2sMLnW+tSxhItoS
         Wrt2QXj3j1Xe5L4CLoxaGfna41wdd9Phkh2Uk5u2tJsVos9EwM7DBVJoQobmr5DU7FTn
         YQig9M6XaT0ts4qylMaxhcFWsZUBxKLtczlpJJ/UYkPZd5PW66Vz2Dl2e/UdNPVwlwxd
         W15d0gxPmRBAWtg4dJk+a+dFkEz5VXcQOI2i0BgcPTVIGaFE2L9xm8iHqiopWlzb79cU
         O2TNke8uciXWlTQ7RLDABZ1UBUu3LXe8jILTJHGwA0b+DYp48NHC2VBmFJhAMezVvl70
         XEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946699; x=1751551499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWtWtBwjob36nAaKnSWI4pJUD13rGF2wqiMWwwOpQSE=;
        b=wg/Hk3egqy15C8LuRNOCa1VFlDm4R3AdBeO+cErnMmqkS1jvPsPD5jSlrJgtebaP2L
         OKlJke35/OcrNJPzl6mYq9FD5JKjvhheoX9gxDM9FBNb2yCyvBr5BI4K1VyZIV20LmXi
         NO/9Lyl01lOaCRDBjh5DL66vwcMN0AdBTaW1FvJVl8TmkTUNLsntTU1qEv9EoKEFvGiy
         xy9tZ9n5jNvFxF8nmjx7yn4LbxNtM3qSgrsP45nHURQoIReaB9NeCQqZQcm0Yc0GK8bH
         XXOEfhQp18MxAu4acchYScE78/eujrX1+awDDbA7j81SGYZD6ftZL1PIMRaMmeWKxY5D
         GbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWEUvfd1AfACh3dq4LRqXGGLI/RLXhXj9/BOkgH2aDHCZyrotByd545ti9H4sFfqc1qXqU2MhMs/BQrDCN4mzv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/MhEDX8ulZzMHVvr3tQF5AYM3zGlbNADyoTBahaPDD7WuxeRd
	XDd0svdEC1h2aTqLNtpzdKj4VbhSMOAnYXuYnWph2LeNLa6PCI2C0GSqeqXw1UHolTkRJg==
X-Gm-Gg: ASbGncvyMxNiQclhUq8bKlriXLYewlTeb6q5A1xxFjnAt0AlfsAtcvQuLfwvM4dyl/L
	S7NSo8Qo8Rdm1JI/bxB5CstennZTQ8gijYp5s+dnZuJpFq5bgcxJYLIUZR0Ss6+Qiy4aXGPXMaS
	r1rKAsO339nHrSGnZVEZpJPv9NJcnCYggD///8NnDunTx9pHwd57ZvoaWklin4Po8Bo1fXD0VJa
	mdCIBACG+/styLQfamYnTWv/QDhFrgfwjTIoVQqQeG+mNW6OtNhfw9s8mP2m1MRNtCF5GArlNlo
	Bz7BY9fJcMw9p4fqtNyVkzch13MfjTdT3DJgCOHlT7LifR/ig/fIVCpvT88NHPPPcb7YCE4XbkF
	CE9TzRjlyaFi2Pl2+kg4sVQ==
X-Google-Smtp-Source: AGHT+IGRGxDi3nPzaP3+FSW4c8MyVlay1gtJ0zdopMKZ0v2+8WCKkner18HyfnUkf/LF+ysDQFdlmA==
X-Received: by 2002:a17:906:4fc5:b0:ad8:85df:865b with SMTP id a640c23a62f3a-ae0bee4f81bmr699701566b.33.1750946698184;
        Thu, 26 Jun 2025 07:04:58 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d928dsm3958266b.107.2025.06.26.07.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:04:57 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH 3/5] mfd: khadas-mcu: add Khadas Edge 2 registers
Date: Thu, 26 Jun 2025 17:04:30 +0300
Message-ID: <16807e13e034f85adc91d131f6c5046ce7d98d9c.1746518265.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746518265.git.efectn@protonmail.com>
References: <cover.1746518265.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_070500_735991_37E251EC 
X-CRM114-Status: GOOD (  12.57  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

Add Khadas Edge 2 MCU registers to khadas-mcu.h and adjust some properties.
Also, i've added some registers with V2 suffix,
as same addresses were already exist for previous boards.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 drivers/mfd/khadas-mcu.c       |  8 ++++++--
 include/linux/mfd/khadas-mcu.h | 25 +++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index ca4bd6cf5..199ed4925 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -26,6 +26,10 @@ static bool khadas_mcu_reg_volatile(struct device *dev, unsigned int reg)
 	case KHADAS_MCU_CHECK_USER_PASSWD_REG:
 	case KHADAS_MCU_WOL_INIT_START_REG:
 	case KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG:
+	case KHADAS_MCU_LED_ON_RAM_REG:
+	case KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2:
+	case KHADAS_MCU_WDT_EN_REG:
+	case KHADAS_MCU_SYS_RST_REG:
 		return true;
 	default:
 		return false;
@@ -69,14 +73,14 @@ static const struct regmap_config khadas_mcu_regmap_config = {
 	.reg_bits	= 8,
 	.reg_stride	= 1,
 	.val_bits	= 8,
-	.max_register	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
+	.max_register	= KHADAS_MCU_SYS_RST_REG,
 	.volatile_reg	= khadas_mcu_reg_volatile,
 	.writeable_reg	= khadas_mcu_reg_writeable,
 	.cache_type	= REGCACHE_MAPLE,
 };
 
 static struct mfd_cell khadas_mcu_fan_cells[] = {
-	/* VIM1/2 Rev13+ and VIM3 only */
+	/* VIM1/2 Rev13+, VIM3 and Edge2 only */
 	{ .name = "khadas-mcu-fan-ctrl", },
 };
 
diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
index a99ba2ed0..de570e159 100644
--- a/include/linux/mfd/khadas-mcu.h
+++ b/include/linux/mfd/khadas-mcu.h
@@ -35,26 +35,45 @@
 #define KHADAS_MCU_FACTORY_TEST_REG		0x16 /* R */
 #define KHADAS_MCU_BOOT_MODE_REG		0x20 /* RW */
 #define KHADAS_MCU_BOOT_EN_WOL_REG		0x21 /* RW */
+#define KHADAS_MCU_BOOT_EN_DCIN_REG_V2		0x21 /* RW */
 #define KHADAS_MCU_BOOT_EN_RTC_REG		0x22 /* RW */
 #define KHADAS_MCU_BOOT_EN_EXP_REG		0x23 /* RW */
+#define KHADAS_MCU_LED_MODE_ON_REG_V2		0x23 /* RW */
+#define KHADAS_MCU_LED_MODE_OFF_REG_V2		0x24 /* RW */
 #define KHADAS_MCU_BOOT_EN_IR_REG		0x24 /* RW */
 #define KHADAS_MCU_BOOT_EN_DCIN_REG		0x25 /* RW */
+#define KHADAS_MCU_RGB_ON_R_REG			0x25 /* RW */
+#define KHADAS_MCU_RGB_ON_G_REG			0x26 /* RW */
 #define KHADAS_MCU_BOOT_EN_KEY_REG		0x26 /* RW */
+#define KHADAS_MCU_RGB_ON_B_REG			0x27 /* RW */
 #define KHADAS_MCU_KEY_MODE_REG			0x27 /* RW */
+#define KHADAS_MCU_RGB_OFF_R_REG		0x28 /* RW */
 #define KHADAS_MCU_LED_MODE_ON_REG		0x28 /* RW */
+#define KHADAS_MCU_RGB_OFF_G_REG		0x29 /* RW */
 #define KHADAS_MCU_LED_MODE_OFF_REG		0x29 /* RW */
+#define KHADAS_MCU_RGB_OFF_B_REG		0x2a /* RW */
+#define KHADAS_MCU_REST_CONF_REG		0x2c /* WO */
 #define KHADAS_MCU_SHUTDOWN_NORMAL_REG		0x2c /* RW */
 #define KHADAS_MCU_MAC_SWITCH_REG		0x2d /* RW */
 #define KHADAS_MCU_MCU_SLEEP_MODE_REG		0x2e /* RW */
+#define KHADAS_MCU_BOOT_EN_IR_REG_V2		0x2f /* RW */
 #define KHADAS_MCU_IR_CODE1_0_REG		0x2f /* RW */
 #define KHADAS_MCU_IR_CODE1_1_REG		0x30 /* RW */
+#define KHADAS_MCU_IR1_CUST1_REG		0x30 /* RW */
 #define KHADAS_MCU_IR_CODE1_2_REG		0x31 /* RW */
+#define KHADAS_MCU_IR1_CUST2_REG		0x31 /* RW */
 #define KHADAS_MCU_IR_CODE1_3_REG		0x32 /* RW */
+#define KHADAS_MCU_IR1_ORDER1_REG		0x32 /* RW */
 #define KHADAS_MCU_USB_PCIE_SWITCH_REG		0x33 /* RW */
+#define KHADAS_MCU_IR1_ORDER2_REG		0x33 /* RW */
+#define KHADAS_MCU_IR2_CUST1_REG		0x34 /* RW */
 #define KHADAS_MCU_IR_CODE2_0_REG		0x34 /* RW */
 #define KHADAS_MCU_IR_CODE2_1_REG		0x35 /* RW */
+#define KHADAS_MCU_IR2_CUST2_REG		0x35 /* RW */
 #define KHADAS_MCU_IR_CODE2_2_REG		0x36 /* RW */
+#define KHADAS_MCU_IR2_ORDER1_REG		0x36 /* RW */
 #define KHADAS_MCU_IR_CODE2_3_REG		0x37 /* RW */
+#define KHADAS_MCU_IR2_ORDER2_REG		0x36 /* RW */
 #define KHADAS_MCU_PASSWD_USER_0_REG		0x40 /* RW */
 #define KHADAS_MCU_PASSWD_USER_1_REG		0x41 /* RW */
 #define KHADAS_MCU_PASSWD_USER_2_REG		0x42 /* RW */
@@ -69,6 +88,11 @@
 #define KHADAS_MCU_SHUTDOWN_NORMAL_STATUS_REG	0x86 /* RO */
 #define KHADAS_MCU_WOL_INIT_START_REG		0x87 /* WO */
 #define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG	0x88 /* WO */
+#define KHADAS_MCU_LED_ON_RAM_REG		0x89 /* WO */
+#define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2	0x8A /* WO */
+#define KHADAS_MCU_WDT_EN_REG			0x8B /* WO */
+#define KHADAS_MCU_SYS_RST_REG			0x91 /* WO */
+
 
 enum {
 	KHADAS_BOARD_VIM1 = 0x1,
@@ -76,6 +100,7 @@ enum {
 	KHADAS_BOARD_VIM3,
 	KHADAS_BOARD_EDGE = 0x11,
 	KHADAS_BOARD_EDGE_V,
+	KHADAS_BOARD_EDGE2,
 };
 
 /**
-- 
2.49.0


