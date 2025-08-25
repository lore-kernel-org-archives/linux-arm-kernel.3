Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDB0CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CYkENkG86CGpJX8tlASGD4qcKwdlUFc6LyyYgBUp7bk=; b=Nnn3OJC1f4SszZrUOsH9PVbVGQ
	96g0HxIexBE1bYZG+kyfHpDTrTUcPH44y8sIo+YFNgq6hcsMh+HPWPNtFJ6S3wLVwRBBHwfjkSOLw
	yBezKa7o/mixvHhlSx7YZtA0H0/3zVDE4lwmtPWFvO4sy7941haS+UcHGawCrsZfAj6KN/Z1OhMw6
	qfGSQdKA7WRsl9ZmcSwa8FHrbMB+WgKAd1faWXwLq/23Fm/6j67Z+muW4/3FQt3jeBCxGEVFNZK+v
	q7yKUarpCUFIimjNn1Y8gXcxIfXn4CKhZdB98ATMx2u9hSTIsfNFCvhEdNqF/RSS4/mhDsUmcfO7n
	PDpR0baQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcY9-00000009Aia-29w2;
	Mon, 25 Aug 2025 19:08:13 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaAm-00000008hNb-1Odr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 16:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756139756; x=1787675756;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L2un3Tp24kq84D49bPeqtKFgx0ttvdt2Oi+LfIRW2Jk=;
  b=aQ4JtXe64l+megZLLTslxyNO3mJqjxdtJ26XSa/vg7Ok0/CPcoWHylNS
   sy7pZklbtxpurn/BksnbsqCcROHvDk6acKNemmeoCLgviZMx9To+ysikz
   EdWm7ujPGtjUyp8MohOgTFCufJzi5KQ0cMNvOl+AzGO5N52dsnVC/dpTp
   JP2GkFp+B4U7cXsOqor3Jq6ku+sW4EGsBmdVrX1dLtNXZFulX9PA0+ZxU
   TCqaefv5XJmYMQdXjFqGC7ZsHjmSKJQCskjGAauLG/aMOV77ejuZpgaHC
   daCGL962vrAplIU/KS0uGjxyp1jnq+tEWKEflG7ocsis59TMXvx69grQ2
   g==;
X-CSE-ConnectionGUID: dRJsnVnfS/aOxHAzofQpuw==
X-CSE-MsgGUID: uMRazMkWRPKtNwoj2asBsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69459514"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="69459514"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 09:35:55 -0700
X-CSE-ConnectionGUID: orFQ8jjkTR+a1kLWJels8Q==
X-CSE-MsgGUID: l5OrMqmGT8icT6nXAJqR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="169241087"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 25 Aug 2025 09:35:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D581B94; Mon, 25 Aug 2025 18:35:46 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Helge Deller <deller@gmx.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/3] floppy: A couple of cleanups
Date: Mon, 25 Aug 2025 18:32:54 +0200
Message-ID: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_093556_448230_184D8594 
X-CRM114-Status: GOOD (  12.06  )
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

There are a few places in architecture code for the floppy driver
that may be cleaned up. Do it so.

Assumed to route via Andrew Morton's tree as floppy is basically orphaned.

Changelog v2:
- combined separate patches sent earlier into a series
- added tags (Helge, Geert)
- fixed typo in the commit message (Geert)

Andy Shevchenko (3):
  floppy: Remove unused CROSS_64KB() macro from arch/ code
  floppy: Replace custom SZ_64K constant
  floppy: Sort headers alphabetically

 arch/alpha/include/asm/floppy.h    | 19 ----------
 arch/arm/include/asm/floppy.h      |  2 --
 arch/m68k/include/asm/floppy.h     |  4 ---
 arch/mips/include/asm/floppy.h     | 15 --------
 arch/parisc/include/asm/floppy.h   | 11 +++---
 arch/powerpc/include/asm/floppy.h  |  5 ---
 arch/sparc/include/asm/floppy_32.h |  3 --
 arch/sparc/include/asm/floppy_64.h |  3 --
 arch/x86/include/asm/floppy.h      |  8 ++---
 drivers/block/floppy.c             | 56 ++++++++++++++----------------
 10 files changed, 34 insertions(+), 92 deletions(-)

-- 
2.50.1


