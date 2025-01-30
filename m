Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EADC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQ8ec0dCJ2aem4mPbo2U/jgJd7SY9pBHvy+gzPKsDoY=; b=DZInVRYIItkzdJeO2+QlyyizGQ
	wMnRpHgGMZu0AWijBIoH3V8FF0pJPzImxYJLHOtHs0anZpxpnIkTsy2+Ui2xB2TZphhqIF7azKFUZ
	pi0JKTjYIbBoiDXkn/+qqR7YBi4CNsond2/sKfjEP3mGyxMxOfOWTgwOA9MvALQwCocOSXores1ED
	I/1SGh7d4H8PytNFQWNVKddldmHqQ06vcWcNe97LYhfhq6DWJCUXK2DI7YdQEWbLwFoi8YtY5L8SI
	nDiYOh9gGyJELV4R317D03VaYNhZgQB0KTT0rfrdTdH068Ol7DaH/MHh6o/7duwC075mZYh/2P/iZ
	e3rm4xpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYZw-00000009JjB-3AJN;
	Thu, 30 Jan 2025 17:43:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYSd-00000009INj-1gEG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738258575; x=1769794575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=saqK4kIsZxI+5DQ85cuDmpYxXTWmAMmJjllcEfKrsSY=;
  b=rulUiBqVo/8xSi7P9sRBrtFZgb/05U3et8Vg9Er6MhDKKmVGfkM4SGSq
   NPCB4WcbPd3M4NP+maEYMnM01Xa9x5s4E5WzZ07YhxczuOqXcQ3YzpJGY
   /Si9CuhqoWLnABnR75DKHu5rXknaQ8M06Ebv8vC7SXaBmbX/ahbjvlImX
   pqOF0T/03bEUoiKTq5C3rgigN9eb8PgUq8Re49uK2mK5OG+iwF+cACg0r
   I+5mFXF3WH7gPbDBostZeSoLGFLALO/f9oQDhdDdDU/dO9YnNOWbFrhAv
   MhNY2bCXOlic33tfAesMfpmZcGSq24za1Q3k+SRnCFWR/VqzOzQ/KcRO8
   w==;
X-CSE-ConnectionGUID: 7iQ0c/B2QHylE8DKLR4q+g==
X-CSE-MsgGUID: ehYY8ZpbQe2lcmyKveAkSA==
X-IronPort-AV: E=Sophos;i="6.13,246,1732604400"; 
   d="scan'208";a="41090048"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2025 10:36:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Jan 2025 10:35:41 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 30 Jan 2025 10:35:41 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>, <linux@armlinux.org.uk>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 12/16] ARM: at91: PM: Add Backup mode for SAMA7D65
Date: Thu, 30 Jan 2025 10:33:52 -0700
Message-ID: <c627ef4928eeec72e63406adef31bd740ad18106.1738257860.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738257860.git.Ryan.Wanner@microchip.com>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093615_452690_1C33A7D6 
X-CRM114-Status: GOOD (  12.10  )
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

Add config check that enables Backup mode for SAMA7D65 SoC.

Add SHDWC_SR read to clear the status bits once finished exiting low
power modes. This is only for SAMA7D65 SoCs.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/mach-at91/pm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index a8cd1300a8f33..5e458254e1f1c 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -706,6 +706,9 @@ static int at91_pm_enter(suspend_state_t state)
 static void at91_pm_end(void)
 {
 	at91_pm_config_ws(soc_pm.data.mode, false);
+
+	if (IS_ENABLED(CONFIG_SOC_SAMA7D65))
+		readl(soc_pm.data.shdwc + 0x08);
 }
 
 
@@ -1064,7 +1067,8 @@ static int __init at91_pm_backup_init(void)
 	int ret = -ENODEV, located = 0;
 
 	if (!IS_ENABLED(CONFIG_SOC_SAMA5D2) &&
-	    !IS_ENABLED(CONFIG_SOC_SAMA7G5))
+	    !IS_ENABLED(CONFIG_SOC_SAMA7G5) &&
+	    !IS_ENABLED(CONFIG_SOC_SAMA7D65))
 		return -EPERM;
 
 	if (!at91_is_pm_mode_active(AT91_PM_BACKUP))
-- 
2.43.0


