Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13B0C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 08:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lg/zej223n0BvDYYY+24Lde/1H1a2/zWfNQZFecjM2E=; b=MtvxhBao6I1fNybPUjh9XWdOyv
	F3L2w9aVJBw9YWoH8waOsU6IydXaOPhcAjW8FQIxRMK9Lcq9x57Pu0qzJ0xx87FNAZldJItanSOqk
	MmyF6O3xVlQlbKzSFBw6f8g+wRhXOARWfPMMxfa4B6CPcR4Sc9UMheg++cOiF1gj4e0kv9sGAFVMG
	uJW+p6N4chiakTUFIx8XEt3w0nyWPx5ZpUh4LP8g0kZv9rJum3ngCosEtoA9hEy6BwTeiR+bNWGcd
	DHdm7XyXBIpmiBX31/Aj/xEI2JHC+E417n9THG3tpl1NnS9Bc5zRc1qLx0CGV+eFS1dqz9/I+K+q2
	zy7nq5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugJ86-0000000Dxw1-3T6V;
	Mon, 28 Jul 2025 08:22:42 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugJ59-0000000DxPy-15fQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 08:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753690779; x=1785226779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r9heF4Jx2oSf4dh7BKMtWEH3wRtjhZSOKr7RdyIDwec=;
  b=MKZat7Wm9Lq/C7zsf8BV407McsLz2p8O7/BHlqwKvSymmVfsFwP4iFxZ
   13/hymVB3zAoAFZ4VyqRhMQ+yxnjZfCUFgcYUqAHj0mWvFmTeMHSlg66r
   Qo3qNs/sSnDT0PhHm1JEnj/jdCnJUbu3LcL9/ln5DPtlLnEpbb3NS8wZT
   kLA8lPf98tdjFWshzyUFQMDNJw3P5KAwIS7OObeozgBGn5b/g77LLji7W
   dGGRNHCXUdWNmG+iozn6Eoa7UEx80AGocBOOvbAsdP5kTSaIePodAT4Sm
   z4b8OhwciODoDNAJxOO1CGtaAOB8wiDJrFElOtCxj3q46nhvNB4fVNqpz
   A==;
X-CSE-ConnectionGUID: g7UXlN7zTxWGwVabY0JXZg==
X-CSE-MsgGUID: uNdt/ymhTTCSMy9ihjjCsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55142953"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55142953"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 01:19:38 -0700
X-CSE-ConnectionGUID: e4j/OyJ1Q+m/OV7eekb6VQ==
X-CSE-MsgGUID: gR3o9gKhS6iEfbQfGj2kbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161600047"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jul 2025 01:19:35 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugJ52-0000K1-1z;
	Mon, 28 Jul 2025 08:19:32 +0000
Date: Mon, 28 Jul 2025 16:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>, clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: Re: [PATCH 3/9] crypto: sun8i-ce - remove unnecessary __maybe_unused
 annotations
Message-ID: <202507281638.lcdB5LRY-lkp@intel.com>
References: <20250728060701.1787607-4-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728060701.1787607-4-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_011939_317949_BB30889C 
X-CRM114-Status: GOOD (  11.66  )
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

Hi Ovidiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on next-20250728]
[cannot apply to sunxi/sunxi/for-next herbert-crypto-2.6/master linus/master v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ovidiu-Panait/crypto-sun8i-ce-remove-channel-timeout-field/20250728-141133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20250728060701.1787607-4-ovidiu.panait.oss%40gmail.com
patch subject: [PATCH 3/9] crypto: sun8i-ce - remove unnecessary __maybe_unused annotations
config: arm-randconfig-002-20250728 (https://download.01.org/0day-ci/archive/20250728/202507281638.lcdB5LRY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1b4db78d2eaa070b3f364a2d2b2b826a5439b892)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507281638.lcdB5LRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507281638.lcdB5LRY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c:1066:18: warning: variable 'dbgfs_stats' set but not used [-Wunused-but-set-variable]
    1066 |                 struct dentry *dbgfs_stats;
         |                                ^
   1 warning generated.


vim +/dbgfs_stats +1066 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c

  1056	
  1057		v = readl(ce->base + CE_CTR);
  1058		v >>= CE_DIE_ID_SHIFT;
  1059		v &= CE_DIE_ID_MASK;
  1060		dev_info(&pdev->dev, "CryptoEngine Die ID %x\n", v);
  1061	
  1062		pm_runtime_put_sync(ce->dev);
  1063	
  1064		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
  1065			struct dentry *dbgfs_dir;
> 1066			struct dentry *dbgfs_stats;
  1067	
  1068			/* Ignore error of debugfs */
  1069			dbgfs_dir = debugfs_create_dir("sun8i-ce", NULL);
  1070			dbgfs_stats = debugfs_create_file("stats", 0444,
  1071							  dbgfs_dir, ce,
  1072							  &sun8i_ce_debugfs_fops);
  1073	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

