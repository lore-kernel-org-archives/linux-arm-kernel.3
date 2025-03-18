Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC2EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjWT0KIPG9aIQyy56GIy7I+HKIvMrUD3TmZSay3Fv0Y=; b=CKWXGWin9uoAJkYs9k5lZ2R6/i
	ZKTvWO6L1jCM5aKIFDIWx+ymjoAZfgz7c5Xoh4yMlZbuPyyrqdX8XUwR/EVCYOwo58AU6Ehk0D5mL
	LmkYGtxVVxYzHfxLom5Q+mTV4JFQs+MsMz6NzWOhJIS/MGAZOsHqS9fgftSYiJ470CCpC1y3Mbc8B
	MCK8/CVW8iX4pA+jaOocD04ozYljogpeuQ5yduRLVE7LeMB3PUl6QsoXtxl2x/RSeK65DWqVgyKKr
	dWZVWA3gMhUrFaSMwW//QqRovVXntxqMqXr3JD39UD+5Dnr0oOZCelVOWKCwdTOTOYn1slF9ZBI8L
	vbQ/AqLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUmL-00000005e2M-0wVQ;
	Tue, 18 Mar 2025 11:06:37 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUfd-00000005cbu-0bSP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295581; x=1773831581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g0km+zVxRqwRAs2RLk/084gII6D1iqm+5F4kXCBIEnY=;
  b=nBuKzB9iQUUwPkZyYw34SkARC3FY6FxkfTMbig2QgrcJgWyG6JKmeREG
   dpl7ekIZM5CppB5CtX0vPF9kUdceUWkdBZpSaFm5SsrqqKBrQcaCRIgIz
   kJRrmXHm3H75p7rU5+gdWYcCwusmmcowCGQ/V3sgbUulWmc+DxqA/Y3Z8
   2JqxULYeSsck3fdwg4rrpn3VkkzlMEWvDTjRMG3Ggdcwb8O3RwJXQ5LES
   GAW9NKoMIzlfc50P7W2DTzWZ45ufR+p+hKrBb8ki1dJ54QqX9FdwKmMSD
   PgL4BSQny1gakugJ8Uowhsw9DrN2A1d5KS5990nLcCciFZc1dbDl0OiWu
   w==;
X-CSE-ConnectionGUID: Ix+CFYRiSuO4OKYj4bKa2A==
X-CSE-MsgGUID: KGOnfKnpTXCZift6SIOK7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68781764"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="68781764"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:38 -0700
X-CSE-ConnectionGUID: nhLIuPdfRqmK4abuoQlihw==
X-CSE-MsgGUID: eQ4VFVtRTIqLSmNCiL8z3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="153215697"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2025 03:59:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D00F3CC; Tue, 18 Mar 2025 12:59:33 +0200 (EET)
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
Subject: [PATCH v2 1/5] pinctrl: npcm8xx: Fix incorrect struct npcm8xx_pincfg assignment
Date: Tue, 18 Mar 2025 12:57:14 +0200
Message-ID: <20250318105932.2090926-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_035941_206736_C138A428 
X-CRM114-Status: GOOD (  13.38  )
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

Sparse is not happy about implementation of the NPCM8XX_PINCFG()

 pinctrl-npcm8xx.c:1314:9: warning: obsolete array initializer, use C99 syntax
 pinctrl-npcm8xx.c:1315:9: warning: obsolete array initializer, use C99 syntax
 ...
 pinctrl-npcm8xx.c:1412:9: warning: obsolete array initializer, use C99 syntax
 pinctrl-npcm8xx.c:1413:9: warning: too many warnings

which uses index-based assignment in a wrong way, i.e. it missed
the equal sign and hence the index is simply ignored, while the
entries are indexed naturally. This is not a problem as the pin
numbering repeats the natural order, but it might be in case of
shuffling the entries. Fix this by adding missed equal sign and
reformat a bit for better readability.

Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 17825bbe1421..f6a1e684a386 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -1290,12 +1290,14 @@ static struct npcm8xx_func npcm8xx_funcs[] = {
 };
 
 #define NPCM8XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q) \
-	[a] { .fn0 = fn_ ## b, .reg0 = NPCM8XX_GCR_ ## c, .bit0 = d, \
+	[a] = {								  \
+			.flag = q,					  \
+			.fn0 = fn_ ## b, .reg0 = NPCM8XX_GCR_ ## c, .bit0 = d, \
 			.fn1 = fn_ ## e, .reg1 = NPCM8XX_GCR_ ## f, .bit1 = g, \
 			.fn2 = fn_ ## h, .reg2 = NPCM8XX_GCR_ ## i, .bit2 = j, \
 			.fn3 = fn_ ## k, .reg3 = NPCM8XX_GCR_ ## l, .bit3 = m, \
 			.fn4 = fn_ ## n, .reg4 = NPCM8XX_GCR_ ## o, .bit4 = p, \
-			.flag = q }
+	}
 
 /* Drive strength controlled by NPCM8XX_GP_N_ODSC */
 #define DRIVE_STRENGTH_LO_SHIFT		8
-- 
2.47.2


