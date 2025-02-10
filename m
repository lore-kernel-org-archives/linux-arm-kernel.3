Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B033C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 21:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6Z7xRKvR6+vovGanZBJSSFPvOye2YZymkV3U86D64s=; b=d8oaYIC77L2pJCykBmtQsML9MY
	q/u8mLuIYprLP6tUPRzhpO0l+XZG22XEkk/b5tyrpY+Ad6ks3jOb3oAIyaYVfZIV2GAUMh2Z6FpI/
	kMQdVlo812+bJuKG3wvdOkpSiSiQwYbx7lmyvs/C05SfqfyjAZv//9L6KuwaiX2yX9okqromURO8B
	GADEed5VqDQ30Hy7gfQ75SOeh9cfMgAv8BTN8mhOFBvz6Q7rhEXm55irlGCCyQbMxSEPfaVUjNl+5
	uljVPwBRRLSjJoARbdbtPK+I+RwT+9e4oPZaAjoR7yTcW2ezO5i1YCWRqYkQwOy8xY39DeO8h0Sc0
	I1u1Jo7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbSe-00000001VhN-1o2i;
	Mon, 10 Feb 2025 21:37:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thb6Z-00000001SVB-3APo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739222051; x=1770758051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Av1ib6CM5UFki6Z+KJ2dFNdTFpzluX5rZ5YX+kc6uD8=;
  b=lVpo1apcHc9henOfHtKBqE3b44sYjkDZw4JvPqYn0k3UYlRl2NuZNbSk
   ZgkOTM+hmwqQ/zMrxb56arJZcDw0Q2/M3FjhipRQg+XBtEbh7//BZzCoF
   YUh2fpmktYgD9mMxWtHr0r40wTyJxuFuyzMQ33EtdQX3SxsFHWYDlrfPQ
   3Vv8ZOPeVAG1nANsR3ozneomr4DVd9/By0/pVqhzm55qHCkmvYCi3g+Kh
   59e/WS/j5UzTXBdfexNtyRlVYtp1WMK7Rkwp5cyLJiJNC0aTO8PiFRNbO
   iD7uTdmsqPP7VZprl8oavA4dx7cS0DVEZcdQaJgWiF1d61z54DF0NQRMr
   w==;
X-CSE-ConnectionGUID: AYqW9AG9RbOJ2Xf8Pt97Yw==
X-CSE-MsgGUID: xh/FP1YVRZiE3cTC268PGg==
X-IronPort-AV: E=Sophos;i="6.13,275,1732604400"; 
   d="scan'208";a="205027988"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Feb 2025 14:14:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Feb 2025 14:13:47 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Feb 2025 14:13:47 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 11/15] ARM: at91: PM: Add Backup mode for SAMA7D65
Date: Mon, 10 Feb 2025 14:13:11 -0700
Message-ID: <76a89f1ae5e9c4d337c2a28e4b1d0e5cef63e5fe.1739221064.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739221064.git.Ryan.Wanner@microchip.com>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_131411_860029_D37E2367 
X-CRM114-Status: GOOD (  11.65  )
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
index 1eec68e92f8d8..55cab31ce1ecb 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -707,6 +707,9 @@ static int at91_pm_enter(suspend_state_t state)
 static void at91_pm_end(void)
 {
 	at91_pm_config_ws(soc_pm.data.mode, false);
+
+	if (IS_ENABLED(CONFIG_SOC_SAMA7D65))
+		readl(soc_pm.data.shdwc + 0x08);
 }
 
 
@@ -1065,7 +1068,8 @@ static int __init at91_pm_backup_init(void)
 	int ret = -ENODEV, located = 0;
 
 	if (!IS_ENABLED(CONFIG_SOC_SAMA5D2) &&
-	    !IS_ENABLED(CONFIG_SOC_SAMA7G5))
+	    !IS_ENABLED(CONFIG_SOC_SAMA7G5) &&
+	    !IS_ENABLED(CONFIG_SOC_SAMA7D65))
 		return -EPERM;
 
 	if (!at91_is_pm_mode_active(AT91_PM_BACKUP))
-- 
2.43.0


