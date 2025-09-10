Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5906CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LObPjUJmZmYtu2CC9r5/lKDEH8eCUfcZ9YbdVKJ/Mgo=; b=txkjR06IFbblzET3U4cUwrmSzF
	TrgUOiMe/gIqdMM3KgevK3NR6CsPKXt/nwsurf9VHL13evPbPHWmLAWYfZWyDAaYgcb4A9Tr/p7js
	j6RjQBaoOUHKwPBwcLu7V+E7Qn+NMGBWEnJNKobA1RGwPKHVKxNoICwyA3Am+jC4K5IImz0zvIP+L
	IV6rj7G0FdQzgvBwhjC7/PSC1vLeJ8rF0Fiuj69dkR5S64jSXUgep11NPj6Afycb1ZjIbBqCkDb2W
	dRsYH9W58ObwrUYS3x5AoXv4vdY8TWzupLboSVeaK11HhSt6TiZrTaQuMjOL9PJSAa/nvqZnhKj/B
	il7UF9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNaa-0000000FRiK-1EQ1;
	Wed, 10 Sep 2025 16:22:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNaW-0000000FRfd-3Wsi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757521348; x=1789057348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OA697MSbwYFaga1yasvj23HlhhxErDH/zxQeYPOWGmE=;
  b=gmWsCBy1NDiRQZGmxqMAx4YGLgMpKRNo89JBuLDhQSZXe9pe0dfiEAV4
   a+yZBmIXn0cKZTNCjFrNV0bY8VM9Kfyalio+dGBfSrFY3EtXR5vc+Z2mI
   3xqPefkdIr8EZ/gVvgH7tnvMT9MRBwwcfRx9z6OQq1f1nlVeWChetmGYE
   vWDBsmsFPDElWw0IAAW7Y77tbc6NiJ8hRjvTNCKLO1u4mMWlrw3sZmfNb
   UKroofsRogsbiPc7BtvGn2ytBdzegcRIGhnyS8g6MttUAKadJTgzNGgy6
   Y+9XtBojHP9UqmmxIWsDwZEtuEtsnOgRbNvPEbaPWiQPHszyS54HhNibc
   Q==;
X-CSE-ConnectionGUID: tPE+SbpaSyCyxVMbhLqdoA==
X-CSE-MsgGUID: +YSUaQIrRSOq/S/Erz+hxg==
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="213715732"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Sep 2025 09:22:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 10 Sep 2025 09:22:11 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 10 Sep 2025 09:22:11 -0700
From: <Ryan.Wanner@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <sre@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH 3/4] ARM: at91: pm: Remove 2.5V regulator
Date: Wed, 10 Sep 2025 09:20:38 -0700
Message-ID: <a6785a40648b315a07152bca261a42bbf0f356af.1757519351.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757519351.git.Ryan.Wanner@microchip.com>
References: <cover.1757519351.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_092229_172875_E1603300 
X-CRM114-Status: UNSURE (   9.67  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Remove 2.5V regulator since enabling and disabling this regulator is no
longer supported.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/mach-at91/pm_suspend.S | 29 -----------------------------
 include/soc/at91/sama7-sfrbu.h  |  7 -------
 2 files changed, 36 deletions(-)

diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
index 198236bdbbb3..36cae7b1a490 100644
--- a/arch/arm/mach-at91/pm_suspend.S
+++ b/arch/arm/mach-at91/pm_suspend.S
@@ -87,29 +87,6 @@ tmp3	.req	r6
 
 	.endm
 
-/**
- * Set state for 2.5V low power regulator
- * @ena: 0 - disable regulator
- *	 1 - enable regulator
- *
- * Side effects: overwrites r7, r8, r9, r10
- */
-	.macro at91_2_5V_reg_set_low_power ena
-#ifdef CONFIG_SOC_SAMA7
-	ldr	r7, .sfrbu
-	mov	r8, #\ena
-	ldr	r9, [r7, #AT91_SFRBU_25LDOCR]
-	orr	r9, r9, #AT91_SFRBU_25LDOCR_LP
-	cmp	r8, #1
-	beq	lp_done_\ena
-	bic	r9, r9, #AT91_SFRBU_25LDOCR_LP
-lp_done_\ena:
-	ldr	r10, =AT91_SFRBU_25LDOCR_LDOANAKEY
-	orr	r9, r9, r10
-	str	r9, [r7, #AT91_SFRBU_25LDOCR]
-#endif
-	.endm
-
 /*
  * Set LPM
  * @ena: 0 - disable LPM
@@ -1055,9 +1032,6 @@ save_mck:
 
 	at91_plla_disable
 
-	/* Enable low power mode for 2.5V regulator. */
-	at91_2_5V_reg_set_low_power 1
-
 	ldr	tmp3, .pm_mode
 	cmp	tmp3, #AT91_PM_ULP1
 	beq	ulp1_mode
@@ -1070,9 +1044,6 @@ ulp1_mode:
 	b	ulp_exit
 
 ulp_exit:
-	/* Disable low power mode for 2.5V regulator. */
-	at91_2_5V_reg_set_low_power 0
-
 	ldr	pmc, .pmc_base
 
 	at91_plla_enable
diff --git a/include/soc/at91/sama7-sfrbu.h b/include/soc/at91/sama7-sfrbu.h
index 76b740810d34..8cee48d1ae2c 100644
--- a/include/soc/at91/sama7-sfrbu.h
+++ b/include/soc/at91/sama7-sfrbu.h
@@ -18,13 +18,6 @@
 #define		AT91_SFRBU_PSWBU_SOFTSWITCH	(1 << 1)	/* Power switch BU source selection */
 #define		AT91_SFRBU_PSWBU_CTRL		(1 << 0)	/* Power switch BU control */
 
-#define AT91_SFRBU_25LDOCR			(0x0C)		/* SFRBU 2.5V LDO Control Register */
-#define		AT91_SFRBU_25LDOCR_LDOANAKEY	(0x3B6E18 << 8)	/* Specific value mandatory to allow writing of other register bits. */
-#define		AT91_SFRBU_25LDOCR_STATE	(1 << 3)	/* LDOANA Switch On/Off Control */
-#define		AT91_SFRBU_25LDOCR_LP		(1 << 2)	/* LDOANA Low-Power Mode Control */
-#define		AT91_SFRBU_PD_VALUE_MSK		(0x3)
-#define		AT91_SFRBU_25LDOCR_PD_VALUE(v)	((v) & AT91_SFRBU_PD_VALUE_MSK)	/* LDOANA Pull-down value */
-
 #define AT91_FRBU_DDRPWR			(0x10)		/* SFRBU DDR Power Control Register */
 #define		AT91_FRBU_DDRPWR_STATE		(1 << 0)	/* DDR Power Mode State */
 
-- 
2.43.0


