Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B24C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GUrQICegmbLSr9Idhdkps3DDItmvs3SCJZyFwlTIQJg=; b=XLTxv/3SmWkinoAWYbK1i8TWti
	AY++PnVUuYGVld/lciwTgIcKCCvskgAKbZbhUPi2DSNKdiD8Y4id/UmI8JoLkgrcy5gtscv8sGqcY
	12UTXC7R+z1jDf3nnH8KKUD6o0Vaez5Bgf/PUGGhvSVL/GcH/PFqVzo03AFNa5LYAD+vRB0iuHK+y
	0bUjn1CFCrXVJuNb1O7kgNFgsuUY7H288VNE8LIu4Vxr1W+dlDIHKnhC84XpXyZJxvRNznwcRk7cs
	4/5hd3x+CHqwfvNMFROzjV3Ygb8z3/3O+17+thQ9FQgdpFGqFSTGJbPpHHlu+JoRzaAu4xaemUzDH
	Phr8DSqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbpP-00000002iTO-2uw9;
	Wed, 05 Feb 2025 09:36:15 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfblQ-00000002hvV-455Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 09:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738747929; x=1770283929;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H9qoS6pbPgmsbWofG3X9JMy/xr3CQqscYBQeQNivmfM=;
  b=U+iMP9e6xy1GjSVgkXNQGoXFw5SUglvcQDXkAHQrgr3j3vw7+AuB7e+R
   D+8yrwkP/nRQsAUEOCxZZ5EsmO3B25GWzA+dd3ZBzV5C7g3UzmwNo6VFY
   j9rSriYwVpCOS2voOZ116IdEX7WAELGO0iEW8tDby4qYp8ljqNhNaO/T0
   DK8TGgoyg2OuWtlIf+m56C8GmsCGlkymUR6fm6/0OAwgrzxckNKdVMcpP
   g6VCvVpGF1VBU2RO8QyLItRtnPKVSPNciJO1h2UmXYSscizcZdf4W2crY
   whfxxcYi0NH3eRHDSs6HceUiHueihwnXlQmegKC+Euj9klR31d06JLn3Q
   w==;
X-CSE-ConnectionGUID: S0xB7TNgQimeGpSbL2hB4Q==
X-CSE-MsgGUID: mFpwYbAFTrmNCFTxSZ6fWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39462098"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39462098"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:32:05 -0800
X-CSE-ConnectionGUID: jqQmarEpTNuZiWdYFuUtEw==
X-CSE-MsgGUID: ANd1pfs2QLKunK+Y8TIv0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111728224"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 01:32:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 14534353; Wed, 05 Feb 2025 11:32:00 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/2] gpio: xilinx: Replace custom bitmap APIs
Date: Wed,  5 Feb 2025 11:31:09 +0200
Message-ID: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_013209_022324_009FD2D9 
X-CRM114-Status: UNSURE (   6.95  )
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

Relatively recently bitmap APIs gain a few new calls which may help
to convert the GPIO Xilinx driver to use them and become shorter and
nicer. This mini-series does exactly that.

Changelog v2:
- fixed a regression in patch 2

Andy Shevchenko (2):
  gpio: xilinx: Use better bitmap APIs where appropriate
  gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()

 drivers/gpio/gpio-xilinx.c | 102 ++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 65 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


