Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC594D29FBC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 01:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3es5RRP8wDvjlZykvA3iGHnHUcsAvyoChZWhO3H3jMo=; b=iFJ9YvakI1hI+A4b6huU4Wa+V5
	gVcPWY6MQ/bKprCrtB66nHMdFGsMPd85FAC8qtFv7dVOrhOU13ioq1VFQvChnwNdVDw5zJolK5xaL
	rWtUKaka4YGsG4+GGsJmai+vzHykRpVWu0Z9tXQZw3kap+TdCqdm8gYxNkNirsGXr1gqJixvPluiZ
	kZkLcVw7EB1qrzyzZLol3oWo0NZQr2IzfOcLd2QuymnrQUF+M/sO3hy4KE2wBAOIGYxuYWKrw7p5Z
	dEHx2qcZqRBBlNoeqwCto86my1m+Ewo4zzzg6tHVpdk5p22QgpxklGr+CEC0c67cuHSvOvTiiVR7i
	pi7tca/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8qw2-00000005E0N-1V7y;
	Thu, 07 Nov 2024 01:03:42 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8quI-00000005Dnl-4B2q;
	Thu, 07 Nov 2024 01:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730941315; x=1762477315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8LZPvUCN9C3yUR3J6KQF9rZje6rFNhSf2IWdy4LztfM=;
  b=QbRbxW6R9Ei/Poc8Rr/cBlAe1pibBRY4d8UUhSWLxTM3CdUwunKyBqGF
   t6+SJHIcRu+C6ukHOJMuMRGgkKpjnO7TjLaVpehxx8zjm7uL0NRCJF10e
   Ptt6EwsjsVdrM1Pi+0Ll5mM/ml2lfgsgRu9F0BXo6qDoM33uTzSK6k0fj
   N826NnSAb0YvvSr6Cs4IY/Sw1Fl6kjW9F794nvxfD0+rKIGdeW768R08d
   2zM0tYZR5FjgtiNjEEh6tApnMYBxvMzvjLCsevw8M9T4c/1XcPlTFzyzx
   B/aEdtE7dNgQ6npWwfn/Xr6jzeAEW6u7LtB+KlpTbOUIk+/Mh28X7pks9
   Q==;
X-CSE-ConnectionGUID: Ydm33zfmRR6TUM7RwYtfPQ==
X-CSE-MsgGUID: ToOtmcbcSkq36Y6ZJwilLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30868872"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="30868872"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 17:01:48 -0800
X-CSE-ConnectionGUID: w39IjmtKRLq/XpI8W46YJw==
X-CSE-MsgGUID: tU/9JlygSBWKwC5v93+JRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="88828063"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Nov 2024 17:01:44 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8qu6-000pb4-12;
	Thu, 07 Nov 2024 01:01:42 +0000
Date: Thu, 7 Nov 2024 09:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yassine Oudjana <y.oudjana@protonmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 7/7] pinctrl: mediatek: Add MT6735 pinctrl driver
Message-ID: <202411070804.SS4EF03K-lkp@intel.com>
References: <20241106100741.173825-8-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106100741.173825-8-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_170155_076796_0F1852B7 
X-CRM114-Status: GOOD (  12.69  )
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

Hi Yassine,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next robh/for-next linus/master v6.12-rc6 next-20241106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Oudjana/dt-bindings-pinctrl-mediatek-mt6779-pinctrl-Pull-pinctrl-node-changes-from-MT6795-document/20241106-181127
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241106100741.173825-8-y.oudjana%40protonmail.com
patch subject: [PATCH v7 7/7] pinctrl: mediatek: Add MT6735 pinctrl driver
config: arm64-randconfig-002-20241107 (https://download.01.org/0day-ci/archive/20241107/202411070804.SS4EF03K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070804.SS4EF03K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070804.SS4EF03K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: drivers/pinctrl/mediatek/pinctrl-mt6735.o:(.data+0xa0): undefined reference to `mtk_paris_pinctrl_pm_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

