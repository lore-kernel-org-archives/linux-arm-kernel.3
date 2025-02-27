Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3549AC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oS0MTh3HNmzj/cT/Jlz0lZPcEu3Lev9rvQWsU7fLaqM=; b=q/Es+/q+HHDRXz8RWCnSMXlxa9
	KvpJJvs4+HA/fXAj8ZPcw/gEamsQibXXp9HJIPpLgh1AQoz4Wl44z4cszc515yXCKu1ZWa7akw+V+
	ywmVkj03nGCugiJaWe6GVhBs4G7UutvPcfORQlGybMcJ8kE1/3zVKcBwCRycQwh3UlvMEmngE+2Vz
	hdcZz/8KA7S+0hfuelQ2Hah5ZUUkm9TVHjviGHJJW83ytrC8e30Ru2nVKk32EFBnU2JQlGpUqe6Od
	d4Gu7Xmu+01VLjl0jGUz06+gO8llZ0DCCp/ahfoxUfkE+O2xDqmiuuE0OW9VP4WYZ2qCTer+dTUYi
	NFKAzuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjiV-00000008WKD-1kvg;
	Thu, 27 Feb 2025 19:38:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngC5-00000007xu7-0rRn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740671581; x=1772207581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gcjRK2iA7G5Y9xRymwaWG/RlPc2FbREDTowEmIyMkRk=;
  b=pYdNmpEPbuLjtKkM/SgNDGySResZNKOOrFEEtdoM0FnvTGuAnPFj0PV/
   PZr/fqKHINMj5y4BGraRNfDaXDYSlHFwFNXj3IT+dXCFoMcl7hKfRzwhi
   4xS14R62UsQwQmWMJVz9S+osdkzjoMxd9PylfZBmTBa0lnFa7k7LoAq5r
   r3AgSp8AnQ0iO7+5IYQAuNjzzKowISM79RrfzsxHmm9E7b03pqEGqdOeX
   F1p7zZVCv9nJf+UQIfqQ3emufhvhX/WcDAKN6IQsd7wTgmKd/gC5Qm1bd
   +42ICSMYhmP2y5Fdd1FgC7SSEKu3oe4h3otlxHbooyKgsaQYpdjJUTFb0
   w==;
X-CSE-ConnectionGUID: xBkIAngZQVSwQhIMCQbtUA==
X-CSE-MsgGUID: 3DE/RfGkTuK0eY13l8gwXQ==
X-IronPort-AV: E=Sophos;i="6.13,320,1732604400"; 
   d="scan'208";a="38638174"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 08:52:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 08:52:45 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 27 Feb 2025 08:52:45 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 11/21] ARM: at91: PM: Add Backup mode for SAMA7D65
Date: Thu, 27 Feb 2025 08:51:58 -0700
Message-ID: <3a1f59af1ac9322b0203694b535d5d13120a31eb.1740671156.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075301_315626_D9070E04 
X-CRM114-Status: GOOD (  11.98  )
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

Add SHDWC_SR read to clear the status bits once finished exiting backup
mode. This is only for SAMA7D65 SoCs. The SHDWC status register
needs to be cleared after exiting backup mode to clear the wake up pin
status.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/mach-at91/pm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 39644703244d..d82a507bc8da 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -647,6 +647,11 @@ static void at91_pm_suspend(suspend_state_t state)
 		at91_suspend_sram_fn = fncpy(at91_suspend_sram_fn,
 					     &at91_pm_suspend_in_sram,
 					     at91_pm_suspend_in_sram_sz);
+
+		if (IS_ENABLED(CONFIG_SOC_SAMA7D65))
+			/* SHDWC.SR */
+			readl(soc_pm.data.shdwc + 0x08);
+
 	} else {
 		at91_suspend_finish(0);
 	}
@@ -707,6 +712,7 @@ static int at91_pm_enter(suspend_state_t state)
 static void at91_pm_end(void)
 {
 	at91_pm_config_ws(soc_pm.data.mode, false);
+
 }
 
 
@@ -1065,7 +1071,8 @@ static int __init at91_pm_backup_init(void)
 	int ret = -ENODEV, located = 0;
 
 	if (!IS_ENABLED(CONFIG_SOC_SAMA5D2) &&
-	    !IS_ENABLED(CONFIG_SOC_SAMA7G5))
+	    !IS_ENABLED(CONFIG_SOC_SAMA7G5) &&
+	    !IS_ENABLED(CONFIG_SOC_SAMA7D65))
 		return -EPERM;
 
 	if (!at91_is_pm_mode_active(AT91_PM_BACKUP))
-- 
2.43.0


