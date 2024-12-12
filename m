Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5F7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 04:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vx3XFkcWy0gIeFrb8Q2f2Mg/P2Tbbx32wDZXQUgBzgY=; b=j1oHxzxj3UXWjy0IgHijp+Gsu+
	j9vht/D3acz3AY7tAd3ycVBU1Ws24eehXNf7hbBZcBSIwuSXpde5RVMDYeY7HIlIa4kvFfyrQD8ho
	gWTqlZUavvmzAcR/GiM+w1W9NCRN72jCfP/JA7OcA6rfVe5izy0PgjiqDQUqV82XYE1l8JwVeT2fn
	N4UXd2cJWL9Pk3vWFfSJxA4R5p1ACZl/bjP9DC337bPNUxMBFnM/W4zASsQ7U7juNi2PhcnOseefv
	4DC/RJjMapCTE64sLybBUHitKPFmB0Xs9tvT5LrGOxBWpnWNE9ugT+E9SNLQGm48ZSETRovxQYfCF
	iSpw+uPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLbDP-0000000GvQp-2PZe;
	Thu, 12 Dec 2024 04:54:19 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLbCK-0000000GvDn-1ZQh;
	Thu, 12 Dec 2024 04:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733979192; x=1765515192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zjOKo7X1WIM6wbB1lJ8RKKq+iVqK9Xjvj89egCgASEk=;
  b=T3KiGUwljQ28JBsY80Vfg2btqMySP+idLAj3sd80YRgbcAsEX66gAZgE
   idvAc4FccTTRP6tGIa8MzWwInD34Fp+RKgfaXKTZB01IDUDNiszuZQN73
   JM1l5cdCnVJcQdnJTjZrCNbKIyZQB45hwDI775YChS5bXk4a4I8qOzLkU
   yzdHJh9WYsbtbpNI9Gu1HXqCYgwKNq59zEumGcvl7V3nGNZoaEkmedAld
   KcG7IzCKULFh5LQoPLq0653lLm1UnMz9Fl2twcvNN3xT4lWaLK8cPBNKa
   P8poX7aJ+4dJHRamTAYtO+XdmK6NpKyYB4yBKk77aC+yUV3MHEHS1UhNS
   Q==;
X-CSE-ConnectionGUID: 3ANZTvjkSlyTT4k/StCJ8A==
X-CSE-MsgGUID: BZvzD7JwQsWqvAq4aUIf3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45765788"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45765788"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 20:53:11 -0800
X-CSE-ConnectionGUID: +rugh9WjSH+JrBIWnRnsdA==
X-CSE-MsgGUID: BF3cQvgFS2qxjoUB8kTOPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95947179"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2024 20:53:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLbCD-0007Rx-2e;
	Thu, 12 Dec 2024 04:53:05 +0000
Date: Thu, 12 Dec 2024 12:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: ot907280 <ot_cathy.xu@mediatek.com>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	linus.walleij@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>,
	ot907280 <ot_cathy.xu@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: Add support for MT8196
Message-ID: <202412121226.WW9Airfh-lkp@intel.com>
References: <20241211055454.17120-3-ot_cathy.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211055454.17120-3-ot_cathy.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_205312_464954_CDD55630 
X-CRM114-Status: GOOD (  10.88  )
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

Hi ot907280,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.13-rc2 next-20241211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ot907280/pinctrl-mediatek-Add-support-for-MT8196/20241211-140107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241211055454.17120-3-ot_cathy.xu%40mediatek.com
patch subject: [PATCH] pinctrl: mediatek: Add support for MT8196
config: arm64-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121226.WW9Airfh-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121226.WW9Airfh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121226.WW9Airfh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mtk_paris_pinctrl_pm_ops
   >>> referenced by pinctrl-mt8196.c
   >>>               drivers/pinctrl/mediatek/pinctrl-mt8196.o:(mt8196_pinctrl_driver) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

