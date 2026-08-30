Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D793FC61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 14:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlhLC5lrMb6gZb5qHAZkcZvI7kW7ZIaJOFgZY4jVIAI=; b=WUVsCMz0hyMPMIeOsvPOXlomxC
	nEY/01/5ucJifrsjY3jmsvqrBubl6SRrttO3PP01JJBheqmSAJSgGDhu+l5+3OBy+09AMBM1hMjJN
	J4bBc9UHMfAZHfoc4ccTrjm8n3CpKgUShlLOEajfV87TJpC4fhG51pVj6fFJv4B7Yz14vM3BcNXQW
	uWaWMsEbfH0HszkfT2+Mj90jIRE11imjAAw/0iI+3S3CWKFAhok4qFCjhrVWTPLvG07iTWSoaXQ5n
	K3UZjlNl8YeFYPZVCsEHI1vAAHrx3SGXhaO/EfJsynL0HlnwLkFBDlIY6gCnYHN/WlsCG05cCikxj
	eyY03KJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gyy-00000007opa-0ggg;
	Sun, 30 Aug 2026 14:58:04 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gyu-00000007opE-1tAv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 14:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788101880; x=1819637880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jz6SGp8A9K6qYUuqL9q2t6pIpvCJVbYQr8/3UysdP40=;
  b=L2tpQGXDXZ1Y4diM+1uSKur9mrXr4tjex8UH51qLmBvh5QaUjjvUmMZX
   +Y99E3oXm+A3Bat2tfDeZChkWqW5RUcJLUIU59nxP9vzr3LyNBFCH4QqB
   y/BcGa8lmM/nmd6XxtkUxA1pu0jSLHriKDNbpdDaJeS0ROETIhHT37h+i
   bSDRlDgtqgfXPDFJuPL7jSPt4Ap3/dglbuxnxAmw5HVfNNLeAAgUtPkhY
   YzPqQiPcZZ1M6JQZMKbcdFiBqyGEEwh77xPzxGUlTl4mO0lj0WCIl4gNk
   MynEa4m0dVep8bhLwBGBluCop5wE+oTwPqiqPJB79QN9A90sLUuv0mQ7g
   w==;
X-CSE-ConnectionGUID: Xhu+/30AQMGk1MRtRdQt9Q==
X-CSE-MsgGUID: aof1413ZSRWysKSybadLIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="99877500"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99877500"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 07:57:59 -0700
X-CSE-ConnectionGUID: NUdCDotGSWypYZ4ykE5Ycw==
X-CSE-MsgGUID: wdrIOB+hQ3KIfuK+A17WXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="306825838"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 30 Aug 2026 07:57:57 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0gyo-00000000095-34uo;
	Sun, 30 Aug 2026 14:57:54 +0000
Date: Sun, 30 Aug 2026 16:57:33 +0200
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>
Subject: Re: [PATCH v1 4/4] pinctrl: pistachio: Replace open coded
 fwnode_is_gpiochip()
Message-ID: <202608301629.wjbEOoNN-lkp@intel.com>
References: <20260824074427.3226457-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824074427.3226457-5-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_075800_566032_BE61C25A 
X-CRM114-Status: GOOD (  11.36  )
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

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v7.2 next-20260828]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/gpio-Split-fwnode_is_gpiochip-helper/20260824-094232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260824074427.3226457-5-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 4/4] pinctrl: pistachio: Replace open coded fwnode_is_gpiochip()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260830/202608301629.wjbEOoNN-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608301629.wjbEOoNN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608301629.wjbEOoNN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:83:
   In file included from rust/helpers/pwm.c:5:
   In file included from include/linux/pwm.h:8:
>> include/linux/gpio/driver.h:888:33: error: use of undeclared identifier 'child'
     888 |         return fwnode_property_present(child, "gpio-controller");
         |                                        ^~~~~
   1 error generated.
--
>> include/linux/gpio/driver.h:888:33: error: use of undeclared identifier 'child'
>> Unable to generate bindings: clang diagnosed error: include/linux/gpio/driver.h:888:33: error: use of undeclared identifier 'child'


vim +/child +888 include/linux/gpio/driver.h

   885	
   886	static inline bool fwnode_is_gpiochip(struct fwnode_handle *fwnode)
   887	{
 > 888		return fwnode_property_present(child, "gpio-controller");
   889	}
   890	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

