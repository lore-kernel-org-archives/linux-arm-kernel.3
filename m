Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEB8E68940
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 00:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHOBCHB+gSLuGflh6eXYwG7TlTFnET6Zkxlwir5NgSs=; b=lOuKhJz495KD00HD9j2nWm76gM
	/xY1MrzS6rGOJMpx54WLFn82+NLrnW8kXjHjIFU0v3H9dFPMpVwr33c2ti8jkEQSUwxvxe5qOGsoQ
	rrgI9jQieAPrdxRq7llZnC1Fco5I5WYgl9nQeMbYe9nNMy8Ynr2fgtMpx9X8Gf8ZUlPt40DrEj/Mh
	NHAX+5WjCAuO+sVAT4hGMHIJdMERqWTcbgbK73elKPJEpS+11NM/QkueeJjpT+DcEdJFvr7k9ykp9
	dvqn0fpviMMn0KHDbbGECnZA4qUOc3PA0t5Ykmzk7DoEDkFiwntfI8JEMvvvuTpurPV7we9MMpqva
	XPyWpegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6JLa-00000002Bun-0yNT;
	Thu, 31 Oct 2024 00:47:34 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6JJr-00000002BXs-1f7O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 00:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730335547; x=1761871547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oAA+9OSWf2l09wWMiiddhw7UfO+O2McyY//3wWYPwBo=;
  b=Bn9KjBJj3LLeQKI1xmsyT+kH1pUgXXw5NLFa407ZHJI20WCDmSvjGIrd
   luMdD0ZzEhi1FEnsMEbSAv6T6sNt0wn05Z/HZJ6UXcMdUI/9711KqsrYE
   XPFOa22vawXiOHiFwKaSOXVMR7U6xFbPVm/mKggq/AoP+N+IJUCN6vqIU
   EzoI6GYnnHAlA++Hr0fAU9uAbEDchtE6ea3ImglmT5uZiAupyNxX8tvro
   ZdKGXX786QczL+bTpLqwmuoCnkTdv1eKPO3Pfp1fPrJez4YJo/JK2s8bC
   1vhwsYvzUF7PoiWIcG9atWYm1lqUmUYm/paP7S+PuTZLe6vzpEIy10gLl
   A==;
X-CSE-ConnectionGUID: bMR2Zv8ITbGGGqPu4myzag==
X-CSE-MsgGUID: T1OXKev0RI+SyOmkkBVijA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="40637958"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="40637958"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 17:45:47 -0700
X-CSE-ConnectionGUID: X4k+Gr8wTfSo4COVZJWTZg==
X-CSE-MsgGUID: bS1Vd3qcQn2WxqGo5GafTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="82790697"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Oct 2024 17:45:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6JJk-000fSq-2D;
	Thu, 31 Oct 2024 00:45:40 +0000
Date: Thu, 31 Oct 2024 08:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dmitry.baryshkov@linaro.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 3/3] clk: aspeed: add AST2700 clock driver.
Message-ID: <202410310827.OOitgPg0-lkp@intel.com>
References: <20241028053018.2579200-4-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028053018.2579200-4-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_174547_473495_A73A6558 
X-CRM114-Status: GOOD (  11.21  )
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

Hi Ryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on pza/reset/next lee-mfd/for-mfd-next lee-leds/for-leds-next linus/master lee-mfd/for-mfd-fixes v6.12-rc5 next-20241030]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-mfd-aspeed-support-for-AST2700/20241028-133255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241028053018.2579200-4-ryan_chen%40aspeedtech.com
patch subject: [PATCH v7 3/3] clk: aspeed: add AST2700 clock driver.
config: csky-randconfig-001-20241031 (https://download.01.org/0day-ci/archive/20241031/202410310827.OOitgPg0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310827.OOitgPg0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310827.OOitgPg0-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/clk/clk-ast2700.o: in function `ast2700_soc_clk_probe':
   clk-ast2700.c:(.text+0x530): undefined reference to `aspeed_reset_controller_register'
>> csky-linux-ld: clk-ast2700.c:(.text+0x558): undefined reference to `aspeed_reset_controller_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

