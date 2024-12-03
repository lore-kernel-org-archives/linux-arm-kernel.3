Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BFCE6C60C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 06:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKu9HhjJWOdElgfg2fOonVhfCItaMwtNHLNf136iEFM=; b=PSSwqAS8EqrMx9j6a3BGALrax8
	oD1lDFnXOygeeI4SWtHWd+zxlzLduhiTNkiHrGAq3tWSeTgv7RJLFfS6QgqYTscQVfM2ZWfVNxkQa
	+SUMxCQEq6LgiQCT03mxKM3jXmaB8Tsh1XC9vbzsp+pN4xSQKC20QTOgDgHXyzPbMDS7PLAavRacR
	4JyRF9N/MHKJAGfSLXAUv2KbTa7b/EQWzQVXtvtq11//DtiKbbZK9nogKNxrM/2LWlY7n+oNfT/r2
	T+4R81igKGoF6AmP+rOdwZTdBdevFS/3w2+iZx7Scg3TyeVeHZvXCb32ugS8jOZLsFfiWbfhlc05C
	7qNz57Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIM2q-00000008NGM-1PYy;
	Tue, 03 Dec 2024 06:06:00 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIM1p-00000008Mwn-3DiR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 06:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733205898; x=1764741898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BT83Re3GiDTTTTEsWas6izUc7PJ6WYHEM3jZoAJ95/U=;
  b=R2omHsZw8R5JgRUCBBtSHdRHmnHUbH2dfZnYEcH3RfdYvQ4z8KrS8UUh
   GafSuqs3dC5g4+fvka9KQQF+tpq3ErK0YmVpzklbmUOe88n/f+zbp6lzo
   vAhZaGD4/k1YvucE5xfaszLFrkYym0pMPJn8K6TuAtbnhHiXKOCATe5I2
   QHBV8SFBcH577IXOZiOA6hXVNe6JcI4+xiw9N/5s6Yy/eWMCXmWQ60WM3
   Gwc8z/BaYf3rfwmIok/AXuQ4JQYxEn5hqZWuej2J003xPNZzkeezx9UCE
   j5TQI2RLNzq/2N3dBYdegnDt3iUzZrVL4WLqoDBN0uTGo+EUxn8PzIOhj
   A==;
X-CSE-ConnectionGUID: ygNfPQfBRE+RFKqXoM1rew==
X-CSE-MsgGUID: 9emuGD/2TIOGCdylvgza3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32758578"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="32758578"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 22:04:47 -0800
X-CSE-ConnectionGUID: W/jsw9LqTtCr7S/pP1lPzQ==
X-CSE-MsgGUID: KS9GA9HnTUqRTc7F2BmAXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="98104027"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Dec 2024 22:04:45 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIM1a-0000CF-2h;
	Tue, 03 Dec 2024 06:04:42 +0000
Date: Tue, 3 Dec 2024 14:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremy Linton <jeremy.linton@arm.com>,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, gshan@redhat.com,
	steven.price@arm.com, sami.mujawar@arm.com, suzuki.poulose@arm.com,
	will@kernel.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>
Subject: Re: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module
 loading
Message-ID: <202412031348.bp5i3ws2-lkp@intel.com>
References: <20241203000156.72451-2-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203000156.72451-2-jeremy.linton@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_220457_830544_B45BF8CA 
X-CRM114-Status: GOOD (  12.82  )
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

Hi Jeremy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.13-rc1 next-20241128]
[cannot apply to kvmarm/next soc/for-next arm/for-next arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Linton/arm64-rsi-Add-automatic-arm-cca-guest-module-loading/20241203-080347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20241203000156.72451-2-jeremy.linton%40arm.com
patch subject: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module loading
config: arm64-randconfig-004-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031348.bp5i3ws2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:21: warning: attribute declaration must precede definition [-Wignored-attributes]
     224 | static const struct __maybe_unused platform_device_id arm_cca_match[] = {
         |                     ^
   include/linux/compiler_attributes.h:356:56: note: expanded from macro '__maybe_unused'
     356 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   include/linux/mod_devicetable.h:607:8: note: previous definition is here
     607 | struct platform_device_id {
         |        ^
>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:55: warning: unused variable 'arm_cca_match' [-Wunused-const-variable]
     224 | static const struct __maybe_unused platform_device_id arm_cca_match[] = {
         |                                                       ^~~~~~~~~~~~~
   2 warnings generated.


vim +224 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c

   222	
   223	/* modalias, so userspace can autoload this module when RSI is available */
 > 224	static const struct __maybe_unused platform_device_id arm_cca_match[] = {
   225		{ RSI_PDEV_NAME, 0},
   226		{ }
   227	};
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

