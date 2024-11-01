Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D963E6F071
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cp7PodwWf/pJg4GFgOPstCPTYOojB7mQ7lkGX6OAtUw=; b=NtcM2WE8xPruuaWkeiwKEyRfSM
	1lf+IXv7Fzcudgwg5hvX8vqKA97TyudqjA6T+veNNW3jXG/6Mc/6K2hdsiXKyyg8CZ8ChMITFviMt
	bYtLhtH27h49Ev7L03M4/LmO1ha1ZGJ2eAgF1um4knAJoLTW/KGxtxdkAfdK0OAjzwl35qP+qXYVT
	fvpWnIPeU3Jj41qo/udRkCivBaFqeqhiWreimoWDJvyGG19vi0aZVkXFHmPPJDDiKmiFfEGj5e/Ce
	SnO5afNJ/IMnZngzAffSaSzewMws5nZzpE6b8+mTU6qgHXp71eznFZV1H8CM/DVcaEmD2QxEOoddi
	y3LG6dWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vLs-00000007pUB-0NVR;
	Fri, 01 Nov 2024 17:22:24 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vIf-00000007onZ-35dU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730481546; x=1762017546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lxq998gJqdX9fpNp1aT7xjSU+QrdgsX0MPC9PiPtROo=;
  b=QTgvEzgjZJsjWKDVAwvB2xQ4M0jrrOiZDu+KlIIayV6EeArvY+zxv9bj
   w8uBHwVCNh9gG+RKgxL/SCPN2ZOhB4Mw06lVBTZY5r1oU5a1mNxgFdJof
   Tbz1hk8F17CtL2vEU35Fy8i/xSAWLg1JQ5zCpglCXQsY2TihNhgDE9t32
   K4JXVkR3EnDprmP4bvPxTvhk7SpK7vYopM2Yu+Wvl1PC91YH80uojVIgt
   iPbFrzL/gxrcdNnu7yNChALCOWD664ippp8CxrlDwiMI8K925Gkns8jrp
   hg+Linaor42rJ+EGUVzSlV1M5ayuvy8dVCD06eBFMuSf0H/beErUvBZbg
   g==;
X-CSE-ConnectionGUID: Ehro6Sj6SuaCXcN3oHxrjQ==
X-CSE-MsgGUID: EOa0HRFjR/mQkTNTss4SRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="29671143"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="29671143"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 10:19:00 -0700
X-CSE-ConnectionGUID: erxjZ4CzSSuCmgrK+9hJFA==
X-CSE-MsgGUID: 4aOi8Hy6Tz+4ZlBe8q8cHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="88147807"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Nov 2024 10:18:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6vIO-000hnX-0z;
	Fri, 01 Nov 2024 17:18:48 +0000
Date: Sat, 2 Nov 2024 01:18:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <202411020003.C5suQQDX-lkp@intel.com>
References: <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_101905_844371_7A9FB5BA 
X-CRM114-Status: GOOD (  17.45  )
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

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next lee-mfd/for-mfd-next shawnguo/for-next linus/master lee-mfd/for-mfd-fixes v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/dt-bindings-mfd-add-support-for-the-NXP-SIUL2-module/20241101-160940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241101080614.1070819-3-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241102/202411020003.C5suQQDX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020003.C5suQQDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020003.C5suQQDX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/nxp-siul2.c: In function 'nxp_siul2_init_regmap':
>> drivers/mfd/nxp-siul2.c:318:1: warning: the frame size of 1116 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     318 | }
         | ^
--
>> drivers/mfd/nxp-siul2.c:50: warning: Function parameter or struct member 'reg_name' not described in 'nxp_siul2_reg_range_info'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +318 drivers/mfd/nxp-siul2.c

   266	
   267	static int nxp_siul2_init_regmap(struct platform_device *pdev,
   268					 void __iomem *base, int siul)
   269	{
   270		struct regmap_config regmap_configs[SIUL2_NUM_REG_TYPES] = {
   271			[SIUL2_MPIDR]	= nxp_siul2_regmap_generic_conf,
   272			[SIUL2_IRQ]	= nxp_siul2_regmap_irq_conf,
   273			[SIUL2_MSCR]	= nxp_siul2_regmap_generic_conf,
   274			[SIUL2_IMCR]	= nxp_siul2_regmap_generic_conf,
   275			[SIUL2_PGPDO]	= nxp_siul2_regmap_pgpdo_conf,
   276			[SIUL2_PGPDI]	= nxp_siul2_regmap_pgpdi_conf,
   277		};
   278		const struct nxp_siul2_reg_range_info *tmp_range;
   279		struct regmap_config *tmp_conf;
   280		struct nxp_siul2_info *info;
   281		struct nxp_siul2_mfd *priv;
   282		void __iomem *reg_start;
   283		int i, ret;
   284	
   285		priv = platform_get_drvdata(pdev);
   286		info = &priv->siul2[siul];
   287	
   288		for (i = 0; i < SIUL2_NUM_REG_TYPES; i++) {
   289			if (!s32g2_reg_ranges[siul][i].valid)
   290				continue;
   291	
   292			tmp_range = &s32g2_reg_ranges[siul][i];
   293			tmp_conf = &regmap_configs[i];
   294			tmp_conf->name = tmp_range->reg_name;
   295			tmp_conf->max_register =
   296				tmp_range->reg_end_offset - tmp_range->reg_start_offset;
   297	
   298			if (tmp_conf->cache_type != REGCACHE_NONE)
   299				tmp_conf->num_reg_defaults_raw =
   300					tmp_conf->max_register / tmp_conf->reg_stride;
   301	
   302			if (tmp_range->reg_access) {
   303				tmp_conf->wr_table = tmp_range->reg_access;
   304				tmp_conf->rd_table = tmp_range->reg_access;
   305			}
   306	
   307			reg_start = base + tmp_range->reg_start_offset;
   308			info->regmaps[i] = devm_regmap_init_mmio(&pdev->dev, reg_start,
   309								 tmp_conf);
   310			if (IS_ERR(info->regmaps[i])) {
   311				dev_err(&pdev->dev, "regmap %d init failed: %d\n", i,
   312					ret);
   313				return PTR_ERR(info->regmaps[i]);
   314			}
   315		}
   316	
   317		return 0;
 > 318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

