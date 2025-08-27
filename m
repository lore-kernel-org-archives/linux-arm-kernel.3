Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92230CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bh0CcyOT86ApjJQUXRm7u91F4XFOV+i5pxzWZF4mFzE=; b=SQuewhTDvWYkM/Lb0OC3SadtEr
	YERxI76Vu/SecFengKBICBP0Bkrw68tEX0i3Sm6fP6E0+Q4lfYlZ+i0+YYxWw7gZbBGWmEKNIRpm/
	J9XfSMV0hr3jvgMAsLVBHqiD7N1niVFMF2Phwjax6h53MfTzFOPinYoMmDAsmS7uvIdZGKOvD0XPr
	rPEZ2bXLcXTuansKWfwDuKd9dsEA1jCIeU9QwOrSARRqHJNlzXsPXtpCD5dwPHvz1Qt3HnzpOc/hl
	Nz2cJ+heUakKZexTGYFpPPNMgEE+jOlLDp5ljSEf5NeAYNYN8bW6wJJXVoOFFbKQ5IPhTP+2VCD8X
	GfgmkSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJZE-0000000GFW3-2TLm;
	Wed, 27 Aug 2025 17:04:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHYS-0000000FpG6-1mEL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 14:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756306516; x=1787842516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uwD7I3Vk5NcXfozUcavy0K+Nxxxwd8y/BEigyn9nl4g=;
  b=KDEUy90dNekQIRKhb+Ha1bjl+26HMTdBpZYFk/zQTkcR/EnrNH6DDLUo
   zYqafVRdb7XZMc8e9foJXfP3A5dHfhIs+IejcD9yC0yuWqk8nTLAB+fcJ
   CCoE/OcoBQXScAeV049m5lbzFggCrSeyR149pF3PROPQ7wkeeNZGheIYO
   zdUCN2O/2Y48RsMLw1B5aWLpyaYmQI5K7eTMoS1A1mJNxxpU8O5GIE+3u
   ahgp7ND4WmagpZs+wz02XneOL6B8R5FN+pXYrEIyhdGuu2zxX3UX+TjKY
   xBHNmR5jO/BpifrFgojgByhhtx8BW8Jzpk7nAqaAGlITWqUDOG3asMi5g
   A==;
X-CSE-ConnectionGUID: 4yuHX6b1S/u7TSh6v5Gw7g==
X-CSE-MsgGUID: tIBq8RwESmygDYS25zfFeQ==
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="46291226"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Aug 2025 07:55:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 27 Aug 2025 07:54:42 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 27 Aug 2025 07:54:40 -0700
From: <nicolas.ferre@microchip.com>
To: ARM Maintainers <arm@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ryan Wanner <ryan.wanner@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH 2/3] ARM: at91: pm: fix MCKx restore routine
Date: Wed, 27 Aug 2025 16:54:26 +0200
Message-ID: <20250827145427.46819-3-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827145427.46819-1-nicolas.ferre@microchip.com>
References: <20250827145427.46819-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_075516_532995_38657924 
X-CRM114-Status: GOOD (  11.90  )
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

The at91_mckx_ps_restore() assembly function is responsible for setting
back MCKx system bus clocks after exiting low power modes.

Fix a typo and use tmp3 variable instead of tmp2 to correctly set MCKx
to previously saved sate.
Tmp2 was used without the needed changes in CSS and DIV. Moreover the
required bit 7, telling that MCR register's content is to be changed
(CMD/write), was not set.

Fix function comment to match tmp variables actually used.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Fixes: 28eb1d40fe57 ("ARM: at91: pm: add support for MCK1..4 save/restore for ulp modes")
---
 arch/arm/mach-at91/pm_suspend.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
index e23b86834096..7e6c94f8edee 100644
--- a/arch/arm/mach-at91/pm_suspend.S
+++ b/arch/arm/mach-at91/pm_suspend.S
@@ -904,7 +904,7 @@ e_done:
 /**
  * at91_mckx_ps_restore: restore MCKx settings
  *
- * Side effects: overwrites tmp1, tmp2
+ * Side effects: overwrites tmp1, tmp2 and tmp3
  */
 .macro at91_mckx_ps_restore
 #ifdef CONFIG_SOC_SAMA7
@@ -980,7 +980,7 @@ r_ps:
 	bic	tmp3, tmp3, #AT91_PMC_MCR_V2_ID_MSK
 	orr	tmp3, tmp3, tmp1
 	orr	tmp3, tmp3, #AT91_PMC_MCR_V2_CMD
-	str	tmp2, [pmc, #AT91_PMC_MCR_V2]
+	str	tmp3, [pmc, #AT91_PMC_MCR_V2]
 
 	wait_mckrdy tmp1
 
-- 
2.43.0


