Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2ECC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eE2qS0oc0FeToD9n+KCUxi7iW72E/EIJMlXOJIbNUgU=; b=ruC61XcbDxPEIHq7J0pZXqlrTG
	dNgXEKhjJolMvajizCHPUTOc0uQyOoBX2zs+FwDksXMg/azbu2mUaF073vZcMd0gxz4frm1Uo7IbY
	lf82vKs4NsZPM2WO0BFgXXweVlyKH1QOnyHB1S44qCYjsEUVHLfV42NRc/3TvvB4oDeJYR/Vv9Ost
	UMj9U3YyPKMCjZyYDCNg4VKkNlm3QZlQqKyPHUl64CndTv6l/chHwFquLx5f41OTElJjPwPXtHvTO
	pXeQQ//5FDoIve7A+Wai7b+5QFq+EF1BYhwdr+2tEKu7si3+T5EVeOluEpOQY1X1IOJ1uRPdFJ4N/
	H4oKNuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYGy-0000000669P-22sW;
	Tue, 04 Mar 2025 19:49:48 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXLD-00000005u7t-2ipG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 18:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741114208; x=1772650208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ERDSiQRCm2WziHCfxkR9TWnvgzH+j6+KMNNxZfF4lWE=;
  b=lLwzdHRDlhcuyZXrWgwyNFJ+hSeoSXy8U9ioG7FknbG2XKcvLd8yqrJY
   PMECRFqalMv4r8Al4B2anFBYxUyyO+4jiSmJk9FtFh3kjbAqlPEbTgBD5
   AjCvVkQsNjCZrMWNxAVfIeU7go0ZjPJphrd9OAjo6EWguedLlosyj+edK
   6f8MeUmyyzwDIybRuZnwAzw8LOHtlNe2SoIHvaEfhTYvlq0xeoDuw3zPp
   hX1aESjAwzv5Ag8vERJFoQq6Nb6CvmyKg62frAZZiuDt3NJiufM/h28zN
   oTmg6PgJTIgRigHnrQaA0UwEpXM+x3sOy1BpJWJuMyjYdj8TnSMRsBbZl
   g==;
X-CSE-ConnectionGUID: x2o+xvkTR6GE6kKPBxCZIg==
X-CSE-MsgGUID: tLodInsvQR6Mi16AkBelDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41300920"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="41300920"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 10:50:04 -0800
X-CSE-ConnectionGUID: L2gp5m1iTESUO//o6ZLqsw==
X-CSE-MsgGUID: PJuqkSteSBei5ABb7SshKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118193970"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 10:50:01 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpXL4-000K9m-0h;
	Tue, 04 Mar 2025 18:49:58 +0000
Date: Wed, 5 Mar 2025 02:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Eggers <ceggers@arri.de>,
	Russell King <linux@armlinux.org.uk>,
	Yuntao Liu <liuyuntao12@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Christian Eggers <ceggers@arri.de>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/2] ARM: substitute OVERLAY description in linker
 script
Message-ID: <202503050230.820w99b6-lkp@intel.com>
References: <20250224125414.2184-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224125414.2184-1-ceggers@arri.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_105007_707260_6128EF10 
X-CRM114-Status: GOOD (  13.05  )
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

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Eggers/ARM-avoid-that-vectors-are-removed-during-linker-garbage-collection/20250224-210146
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250224125414.2184-1-ceggers%40arri.de
patch subject: [PATCH v2 1/2] ARM: substitute OVERLAY description in linker script
config: arm-milbeaut_m10v_defconfig (https://download.01.org/0day-ci/archive/20250305/202503050230.820w99b6-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050230.820w99b6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050230.820w99b6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: section .vectors.bhb.bpiall virtual address range overlaps with .vectors.bhb.loop8
   >>> .vectors.bhb.bpiall range is [0xFFFF0000, 0xFFFF001F]
   >>> .vectors.bhb.loop8 range is [0xFFFF0000, 0xFFFF001F]
--
>> ld.lld: error: section .vectors.bhb.loop8 virtual address range overlaps with .vectors
   >>> .vectors.bhb.loop8 range is [0xFFFF0000, 0xFFFF001F]
   >>> .vectors range is [0xFFFF0000, 0xFFFF001F]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

