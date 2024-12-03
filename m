Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8DDE6C60B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 06:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ki+Dx2+aqlHtL5xadNlzDyPZ3Y4a+fTAbiN74cOiE8=; b=pmdjqNL7TKEbYu7aUXxNwYms+g
	UMuWdM3BbKQ2Hm/7ul/eVPf9jFXQE6T434so5QpB9jEmecAFdf+BhTuo+KqZSCZV66gzVQwNip+VL
	w0QaeCHw5uSo4EZugPMK44ZJkWHWjNPqkewEOwGGFVUAexWUJH0UeiUBM4kkaZQgnM7mffNlEyNJu
	pinRApgkOmob+RpK1TYrPhEc/Vdklt4KZ7l2cfQ4/1H3gxA26wl3t2Ni+lNZVwYbqPhtHj3N1lduf
	Ev9gN6Dpgq8BfHZ9LQfz2jDlcBupN1DtDcMMzy7pwf98RC5KmwCLm1TYDMqNSxI/cmyLLegEz6DLQ
	P3Ixd2MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIMEM-00000008Oc6-1g5O;
	Tue, 03 Dec 2024 06:17:54 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIMDM-00000008OWp-3Asl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 06:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733206612; x=1764742612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oA6ewBaY6R0hItmwM5cpBRuJjIHcJ1qxRSBhvF4GLcs=;
  b=TENpK+ZKhHy/lBBL8h8HSo5GYtBCBcUi1LiO1ZN3PJmgE/Q+9AfkVcSU
   cC4sYmWLU1hyWvo2u59qa9omUcLMY3SO0XJCNkwmRiJbnJ1bJUy6CpKz2
   dw7S1sp54v0VjVgmz/JbT0SUTj+EcW8u3KgQSaGVEsT5MexWedGw1Mjxs
   TevGTqBh9t09Mg2N6HHT0HK/fRQ3Y2nz3OPAu/wCMxiQrsLl8TcWwTfF5
   a1GEjqQlGNZ/XuGkObg20kgUhR9iVd5JxASxFooR/rXiS1CGCipoUE2de
   hGsMQfQx9Rj5t4yPHCWWQsK8C/WFZCTlUZ4fjuE5MZVhsR6MNOSV+j0sq
   w==;
X-CSE-ConnectionGUID: dZcnAoMLSa6/n4GZquojZw==
X-CSE-MsgGUID: xUB8eV3UQRaCC9wx1ojhdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33323968"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33323968"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 22:16:50 -0800
X-CSE-ConnectionGUID: m7bSA4OnTsu/ivmR3USEIg==
X-CSE-MsgGUID: qJWVHbb8RI6rUa9aO/NjJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="97396964"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2024 22:16:47 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIMDE-0000D5-1f;
	Tue, 03 Dec 2024 06:16:44 +0000
Date: Tue, 3 Dec 2024 14:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremy Linton <jeremy.linton@arm.com>,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, gshan@redhat.com, steven.price@arm.com,
	sami.mujawar@arm.com, suzuki.poulose@arm.com, will@kernel.org,
	catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: Re: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module
 loading
Message-ID: <202412031328.ybzEAJ4U-lkp@intel.com>
References: <20241203000156.72451-2-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203000156.72451-2-jeremy.linton@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_221652_849762_DF123D53 
X-CRM114-Status: GOOD (  13.20  )
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
config: arm64-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031328.ybzEAJ4U-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031328.ybzEAJ4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031328.ybzEAJ4U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:55: warning: 'arm_cca_match' defined but not used [-Wunused-const-variable=]
     224 | static const struct __maybe_unused platform_device_id arm_cca_match[] = {
         |                                                       ^~~~~~~~~~~~~


vim +/arm_cca_match +224 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c

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

