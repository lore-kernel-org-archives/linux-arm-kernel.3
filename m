Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF643C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nm9MdCc56O0ybRA1MooKBiWRQY+I+nlZ2IPu4g6zyPk=; b=NwdF1inWLxzCAaaPuIGwj42AXx
	IMkqXjpETpNy+9oT0CZgESj3+YB9IXYU8O7UZ99Fe4JIWpjSs3e1aSBN7umcWK53kBSsQfBut3p4n
	rHcCSY4qgPRw9+w/bQYhe/ODSpaxIApORs1se2OU7NJdncLZiZfuO1L8+uF9tsAbCGbRGcSevYbvF
	1PdLBSVUMM9TI0E861bG/IIZ9DZGP0JqTH7hVj9WO+npUjoaO8v0pvFFIwmpxAr1oe1bJUFFWdNA0
	A4/vzEcCs03faJVNbUALn6OAAT7I+dBQcujWGqQXdBRpWf+0xFpOviYUspRHRt0p7hTgJkCuTHlBy
	ziZzlpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4he-0000000Fif5-0KjJ;
	Wed, 15 Jul 2026 18:51:30 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4hZ-0000000Fib0-3znq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141486; x=1815677486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JwEf2B0/taqBgVcAFv7SQawwrLtkBIODJnPpyfPpuQ8=;
  b=QTMylQQB5lz8Y6TEuXrfeuRbpAyHBCNjjfOBBhgiEK6Ql4YhCZC7ONVo
   tTE1aeRaD1jHIuu7rO2c0LMJhMu7IQECF8DvP3+rNkefkS/zs2XmgZaPL
   0D5kaMwvdYq9esFzFQ9L7WTh5q7gtMpKZ6LTb0L+kC1sMibguw73IvZzU
   sVYE9er5H/yIyKQwZBCFTBexTQC6Advlr9kxslZo9yasfINrJ7MBjCoa/
   CZtwsq4eviB9mqMsBw2HLQMkgj57s5PLXo0oxp+3uwCDS7rCNXJbaVjrt
   PlDHvAA98YGbyxHnNby3xYiTFqNlQnKaUM86RGkDDoswx5rWVqa/rfu+h
   Q==;
X-CSE-ConnectionGUID: hTcMsjO4T2il7SpdDk2gYQ==
X-CSE-MsgGUID: bkGuuYSwTBuCAuydtRwDiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84887488"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84887488"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:21 -0700
X-CSE-ConnectionGUID: OrV9bNQNTGWJhH0jJhKgFg==
X-CSE-MsgGUID: 8rEnzpPOQHC01JImubDiYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="280700292"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2026 11:51:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EA4F198; Wed, 15 Jul 2026 20:51:15 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bradford Love <brad@nextdimension.cc>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 1/7] ARM: pxa: spitz: Open code gpio_request_one()
Date: Wed, 15 Jul 2026 20:46:41 +0200
Message-ID: <20260715185112.1323510-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_115126_053541_7ACC349C 
X-CRM114-Status: GOOD (  12.28  )
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

Open code the gpio_request_one() call to be able to kill that API
in the follow changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/arm/mach-pxa/spitz_pm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_pm.c
index 03b4b347f11a..f46a3fb7e07c 100644
--- a/arch/arm/mach-pxa/spitz_pm.c
+++ b/arch/arm/mach-pxa/spitz_pm.c
@@ -108,7 +108,8 @@ static void spitz_presuspend(void)
 	PGSR2 |= GPIO_bit(SPITZ_GPIO_KEY_STROBE0);
 
 	pxa2xx_mfp_config(&gpio18_config, 1);
-	gpio_request_one(18, GPIOF_OUT_INIT_HIGH, "Unknown");
+	gpio_request(18, "Unknown");
+	gpio_direction_output(18, 1);
 	gpio_free(18);
 
 	PRER = GPIO_bit(SPITZ_GPIO_KEY_INT);
-- 
2.50.1


