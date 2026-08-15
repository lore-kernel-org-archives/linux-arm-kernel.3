Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26329C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 19:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RixPhJk+gYVryfYGhQfLmx60drwk5C34W1B3mP3kFkk=; b=gaO2ovnerMtjWHOW0+HMk1oT5o
	8vlJ4aqh4p2Waa80ndhBwpew6MRfmoXLsCKlnGHYuofkome59aND//JNc5fFHfVDctF292BiQBZZv
	N164uP3/sYNStmg4w+EGJpHiFpVu+jVTbfD2BTlgGza7p61W2K0BZ+RnxHxCzyJNKi6yxlLnPnbTp
	aGwUmBWEIMgwh7FkoEWauO8AARBoV2JylnHqFAjGOlQcN9QZ2gxEg+Z6KyfBgqbToU+R60mKUnBGl
	LV93yURvII5NaOkdNpvHbEU3h0vbcMwA3mM5JU2l4furgOyWV8zkAVcwmRhR9jA4oa3xZT9iU9UVJ
	rr7Zwt+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvKGl-000000048rL-3Bd0;
	Sat, 15 Aug 2026 19:42:15 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvKGi-000000048qs-1hYk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 19:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786822933; x=1818358933;
  h=date:from:to:cc:subject:message-id;
  bh=FwYVoP/09leCO0hIOwAJYeqyf0gOUUkfhS0A8HX2bnc=;
  b=klXx3TfkEWk3zmwTOWr/Bbr8ZemejwxJC0X1T6MZxn8SSaix76nMM1mf
   79JfnjMhFVh+UdZwskkXN52qOPZVgNNEhToptpQzP6xxGiqYD+5Pn1jIM
   qHD6vVVuNZW309Sr+21uDDN1BPnhfBwfnA70NDJjeodEi5KJRaHX5LYOx
   oUeclggXON3eHLPD1ASirasKjm17siGFbp722566rKnvGHyWueAn6QitK
   1uwoRJabUAasMG/UUJTHCb/9oMKHHM5i/OW0xW1IFE6/jPLVzVIeg0nNY
   rppY6PaHG0lRwQTwA8y362ywzUQt+pFk/IrRZ4kTE83HWzaBMi5hCE7KB
   A==;
X-CSE-ConnectionGUID: H+UboGDrTkesu/vJ6KbkhQ==
X-CSE-MsgGUID: Wpu4ZIttTnehEWYiumgapQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="104742897"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="104742897"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 12:42:11 -0700
X-CSE-ConnectionGUID: 5YJPer3NT0qHsMqithKPXg==
X-CSE-MsgGUID: ln7oeZNyTpmaQn7rjHz+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="288002194"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Aug 2026 12:42:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvKGc-00000000cS6-2ajv;
	Sat, 15 Aug 2026 19:42:06 +0000
Date: Sun, 16 Aug 2026 03:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove 40/217] arch/arm/kernel/process.c:379:5:
 warning: no previous prototype for function 'arch_setup_additional_pages'
Message-ID: <202608160341.2pHIQyJL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_124212_531025_F3D8FEAC 
X-CRM114-Status: UNSURE (   9.33  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 99feea9e164dc7bec620cd48078d1c6ec0bdadc4 [40/217] ARM: remove remaining nommu support
config: arm-orion5x_defconfig (https://download.01.org/0day-ci/archive/20260816/202608160341.2pHIQyJL-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160341.2pHIQyJL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160341.2pHIQyJL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/kernel/process.c:379:5: warning: no previous prototype for function 'arch_setup_additional_pages' [-Wmissing-prototypes]
     379 | int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
         |     ^
   arch/arm/kernel/process.c:379:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     379 | int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
         | ^
         | static 
   1 warning generated.


vim +/arch_setup_additional_pages +379 arch/arm/kernel/process.c

02e0409a65560d Nathan Lynch 2014-09-22  378  
48be69a026b2c1 Russell King 2013-07-24 @379  int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)

:::::: The code at line 379 was first introduced by commit
:::::: 48be69a026b2c17350a5ef18a1959a919f60be7d ARM: move signal handlers into a vdso-like page

:::::: TO: Russell King <rmk+kernel@arm.linux.org.uk>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

