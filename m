Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD2CC61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 21:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVuF7Wb2paULBBfvrLMS7axJ7Tosz94ktVXwwm6zE0Q=; b=xB4Ow/fcCkptIAt9i/drgXJGLu
	Wi3N+idT630FTEvCdGcRDhB2MnTiNcjK/NWEascUWZrdmBe9JVz9ROOZ1RtCYLe+yQPB4PZ1jryPv
	PDN7K8+YXEuQsYxTO+psNLyeZjdcp/CtMtW3Nr9Nqs4R3N6d2u07dNVgUMsULvKNUORB23DU6NWBJ
	UbcUPwjhf/iCgq0+cQUccsQvnqB1qIKIFMIAV3Kc7Ftq/9s3u/BGKgOzZRCE2peBNIAuxRs5e5zcC
	iWJm18QjMKx/uZSCE8zhIgxAqB1sQuswR+HXFAGoA+B0bi+V0gRAzzkwzVrOrjukMSX49b6oEeni3
	U0esPqLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0mqv-000000086OK-1fWy;
	Sun, 30 Aug 2026 21:14:09 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0mqs-000000086Nm-2AuN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 21:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788124447; x=1819660447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u5WW52dRfOA9bB1N5Z5GSQCIlLzFE6CPKa3DpFewPDg=;
  b=CzDEU9xDB8R54I/Loto05ZPc2oC16TjLbs4CMJ3eb0hB3EoV0vVo8E9I
   fW5u8EpgL3e45bhZ3ZdbCFCMwvyDWpUb4PK+DLUFhgxMgmpQWcfJ9+Ram
   1hA2XRo/Av1S/eQMXI1eJ63hhKpHsIc1dmQsA8u9gEhvWL/reUtlhKFwT
   a3b9AX8A98a8GbBdgAfB5YlrZh7QjnB129vwU67+jtkfQ+w6oEWlbvpXc
   xKOwk/wysdMOgfWXNlQM+hd4tYQZbghDGwWxaTB0VXHe950fCMD/eDmnc
   lctris0f2dYJJOrBVhBfh0KX/nC/yx4gS8Lwe0d6vE/iBch+6fSmke7sT
   g==;
X-CSE-ConnectionGUID: Dt6e9TkYS6KaO4yAAGCmhA==
X-CSE-MsgGUID: hq8QlNQNSsOksfcihIVH/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106060752"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="106060752"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 14:14:06 -0700
X-CSE-ConnectionGUID: qdshCc9lT+KpACMbc3W3Zw==
X-CSE-MsgGUID: c/6HIHzpSEOcjPazKn0M7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272433446"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 30 Aug 2026 14:14:03 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0mqn-000000000Df-1ywc;
	Sun, 30 Aug 2026 21:14:01 +0000
Date: Sun, 30 Aug 2026 23:13:32 +0200
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
Message-ID: <202608302328.ToabNDV1-lkp@intel.com>
References: <20260824074427.3226457-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824074427.3226457-5-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_141406_608796_40EA0936 
X-CRM114-Status: GOOD (  14.84  )
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
[also build test ERROR on linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v7.2 next-20260827]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/gpio-Split-fwnode_is_gpiochip-helper/20260824-094232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260824074427.3226457-5-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 4/4] pinctrl: pistachio: Replace open coded fwnode_is_gpiochip()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260830/202608302328.ToabNDV1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608302328.ToabNDV1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608302328.ToabNDV1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bcma/bcma_driver_chipcommon.h:7,
                    from include/linux/bcma/bcma.h:9,
                    from arch/x86/kernel/early-quirks.c:17:
   include/linux/gpio/driver.h: In function 'fwnode_is_gpiochip':
>> include/linux/gpio/driver.h:888:40: error: 'child' undeclared (first use in this function)
     888 |         return fwnode_property_present(child, "gpio-controller");
         |                                        ^~~~~
   include/linux/gpio/driver.h:888:40: note: each undeclared identifier is reported only once for each function it appears in


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

