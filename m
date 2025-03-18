Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A22C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhA20a1giyygMYB5F+ic7LpD6FeCXdJlQSf/S9lVgMM=; b=d0pEH3e1XM3MMhgtKCCMok2qHh
	qnQDT6Rmn9rzc3F+sLd0o/fwNPWvEN2Crxa0+jRFm97XDImzFXr31aWq6Fcx6SlnHYa/ORuR5mNRs
	3XwTXe/3CKe0UefSDkM17i6219+eCJ2L5La9ijGezzVhtInThdD5fTxapECswYKDV7Qlrhc9BwRiC
	G1GfvBUUqH21azyzhsp8hziIa+sP22/h/d/RzBUDBahMroKFRB1BMrh6m+4xl+oVqtJEVSZpiTnIz
	z1lPy05/FOdHpEiExBXLwBLieSSs+BgbZ895jNP06BX/XDWZar75KR2C4Dz3/20tU8+/qpC1ZE5lK
	cLTRKRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUkg-00000005dhz-1rh1;
	Tue, 18 Mar 2025 11:04:54 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUfd-00000005caQ-0OwA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295581; x=1773831581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QrndgZbN9z1XtoTGR06yFti0xSwFxjHct0FERYdF7BA=;
  b=HJmCs46PrlEvLzUi6AggymdPoFESx88gwSRmfVzRwzGkbLHtLamGw8OU
   7oyy5jpjEURGK157JGN9n1xoKA62XDCQiFPSf/TdMnzl/VpOJkAWhYIT1
   yToOT6YRLU8CASY2BY5lJaDAUhABE36snmc4fanQ7cvy8MxqpYhi96vJz
   BJqVcPKwgGCLPKMpy3WBflfYickE8ftnJJtAZePIpHb4ZM10WKggDbDtV
   pOwsx+J5efjlDy/zYKlBETP6Ix49HZ9oAKbB/DeHcxBggp+HFlfw3YJBA
   S6FpGudq+mvfdQCOnqHdrDH+YuGnRPrZIYO88JIA4nSW97rW3H1KA5Sxj
   g==;
X-CSE-ConnectionGUID: /MldXe8NSX+Eo0akbskJag==
X-CSE-MsgGUID: MBlJw630QqOszc24SRn6jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68781756"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="68781756"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:38 -0700
X-CSE-ConnectionGUID: epYLmD4nSv++05dKgL+RbQ==
X-CSE-MsgGUID: oAb6QjutR1yMp+GHh+cTwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="153215696"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2025 03:59:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E65112E2; Tue, 18 Mar 2025 12:59:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/5] pinctrl: nuvoton: Convert to use struct pingroup and PINCTRL_PINGROUP()
Date: Tue, 18 Mar 2025 12:57:15 +0200
Message-ID: <20250318105932.2090926-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_035941_149956_AD7BAD71 
X-CRM114-Status: GOOD (  10.95  )
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

The pin control header provides struct pingroup and PINCTRL_PINGROUP() macro.
Utilize them instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 16 ++--------------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 16 ++--------------
 2 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 62a46d824b46..2601aacfb976 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -504,17 +504,6 @@ static const int lkgpo2_pins[] = { 9 };
 
 static const int nprd_smi_pins[] = { 190 };
 
-/*
- * pin:	     name, number
- * group:    name, npins,   pins
- * function: name, ngroups, groups
- */
-struct npcm7xx_group {
-	const char *name;
-	const unsigned int *pins;
-	int npins;
-};
-
 #define NPCM7XX_GRPS \
 	NPCM7XX_GRP(smb0), \
 	NPCM7XX_GRP(smb0b), \
@@ -642,9 +631,8 @@ enum {
 #undef NPCM7XX_GRP
 };
 
-static struct npcm7xx_group npcm7xx_groups[] = {
-#define NPCM7XX_GRP(x) { .name = #x, .pins = x ## _pins, \
-			.npins = ARRAY_SIZE(x ## _pins) }
+static struct pingroup npcm7xx_groups[] = {
+#define NPCM7XX_GRP(x) PINCTRL_PINGROUP(#x, x ## _pins, ARRAY_SIZE(x ## _pins))
 	NPCM7XX_GRPS
 #undef NPCM7XX_GRP
 };
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index f6a1e684a386..eac43315a360 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -587,17 +587,6 @@ static const int hgpio5_pins[] = { 25 };
 static const int hgpio6_pins[] = { 59 };
 static const int hgpio7_pins[] = { 60 };
 
-/*
- * pin:	     name, number
- * group:    name, npins,   pins
- * function: name, ngroups, groups
- */
-struct npcm8xx_pingroup {
-	const char *name;
-	const unsigned int *pins;
-	int npins;
-};
-
 #define NPCM8XX_GRPS \
 	NPCM8XX_GRP(gpi36), \
 	NPCM8XX_GRP(gpi35), \
@@ -829,9 +818,8 @@ enum {
 #undef NPCM8XX_GRP
 };
 
-static struct npcm8xx_pingroup npcm8xx_pingroups[] = {
-#define NPCM8XX_GRP(x) { .name = #x, .pins = x ## _pins, \
-			.npins = ARRAY_SIZE(x ## _pins) }
+static struct pingroup npcm8xx_pingroups[] = {
+#define NPCM8XX_GRP(x) PINCTRL_PINGROUP(#x, x ## _pins, ARRAY_SIZE(x ## _pins))
 	NPCM8XX_GRPS
 #undef NPCM8XX_GRP
 };
-- 
2.47.2


