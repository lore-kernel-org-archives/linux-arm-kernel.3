Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A971ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=memrQ7axYdUaYQsPly43343ciuqTBbrMMvXh3RrcAoI=; b=GYA6KgNlxJFCxk94/3jPsrhFUW
	eOmwgmwK9dFGq7pBoGNc2pgibN8eT9EWjcS8OBfljzgxfRfYr0ePvrkSKd6fzVIb+Qk/0z9K2W9hX
	5srUSaZJJScK9BG3Bh+BzqIY0clwQI5JR71wppetzKSXukqeerFrymu+qj0SCu6xNDFZuHOkr6ipT
	D4Zq8LiO8ybw1KDHf5HZLxOGFINsE5g2h+vptYZg2bnGFDQIO4yBYOWniDnjG23/1kEWQG3eoldWa
	5IgYadkKxxNWEB57Xq6RJ3D0AU0HvXl5kTKZ6eXc0ChEhadNNvoSfBmt/RrUY0RCvtZGBUIxrq7Ew
	iO+FMhnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJeZ-0000000GGjv-2EBs;
	Wed, 27 Aug 2025 17:09:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHYu-0000000FpLc-1JK9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 14:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756306544; x=1787842544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RASQzDEjrALc3K/YuT5UvThKt2BVAZIxpTZ+5exrzzU=;
  b=GCh0mveRmFhwL3Mt3E4lNTM8HztRQGc33ECG/JteXucpMaNg++xmlTs5
   Lm3HEUiPF4hSpLJwwmI4rkckmFLW6wTkwM/dJpbL2s8yOm+8BqbjYfUTz
   cd5PVGlPnCTlv/7OTQcT2ePBByHLJyHrWdahdXMjSpTtTLteuoD9TyRuE
   jhXt9E9i9EB777oLrBLSUDOFFl05EQ8YEUAOUIqBukMiQZ4ENZ0gHd/fM
   YHrwVEbku0AahoEFUIian4vjcIVFA65PzD5HDrK2s/IR9G+G4HakYXMfZ
   yETv1Y3rgY3GZ+yyH06A+cumcLdjbsDXpxZDBl2JazTiH/L53tIXLfH4w
   Q==;
X-CSE-ConnectionGUID: qmQ3gJioTdWJF8Sch/45rg==
X-CSE-MsgGUID: FPpwuLK0SzS4wq4WK45RWQ==
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="213136671"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Aug 2025 07:55:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 27 Aug 2025 07:54:39 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 27 Aug 2025 07:54:37 -0700
From: <nicolas.ferre@microchip.com>
To: ARM Maintainers <arm@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ryan Wanner <ryan.wanner@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH 1/3] ARM: at91: pm: fix .uhp_udp_mask specification for current SoCs
Date: Wed, 27 Aug 2025 16:54:25 +0200
Message-ID: <20250827145427.46819-2-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827145427.46819-1-nicolas.ferre@microchip.com>
References: <20250827145427.46819-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_075544_413341_C66F9B96 
X-CRM114-Status: GOOD (  13.23  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

All SoCs using this structure field .uhp_udp_mask in configuration
index 4 don't have the bit 7 specified: sam9x60 nor sam9x75.
Remove this bit from the mask definition to match register layout.

This mask is used in function at91_pm_verify_clocks().

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/mach-at91/pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 3aa20038ad93..35058b99069c 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -1364,7 +1364,7 @@ static const struct pmc_info pmc_infos[] __initconst = {
 		.version = AT91_PMC_V1,
 	},
 	{
-		.uhp_udp_mask = AT91SAM926x_PMC_UHP | AT91SAM926x_PMC_UDP,
+		.uhp_udp_mask = AT91SAM926x_PMC_UHP,
 		.mckr = 0x28,
 		.version = AT91_PMC_V2,
 	},
-- 
2.43.0


