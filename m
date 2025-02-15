Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69125C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 17:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7VBrSVMZpSJoHv4xzrvkvw2IcsFr7wdRngttH2c7ec=; b=nUha2f7WLNkM2QHqqgM17eNIxL
	ZCka38GtwrDRjqkWTPvAkF7CJuD/uwjTKpBEyRLgYdMjJoTiPNVZdxIOYpaX44yd/CZabaxIAeACF
	2HK6YHfVJEnYs2oYSKa5nztQ3a808/wFTURorzegXYDsOz3jdMInUteqbAv9Pf+1zWNT0eBIRzz4R
	WBCpHwbBgGW//EAbwh2ZLAv0F58zobN+0/dijwVneB36fllfGDGmHDRbb2RydYoWSbcbsNqgHTUAJ
	C9gRLBoBC9NDj9kISQoV9bp+fFVXSvtXHajf/RQhQwuKVtox3aS2gXPKoJb2j8kpgeytTlq4uHiZh
	yUvQFV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjLnW-00000000T5E-0lZ0;
	Sat, 15 Feb 2025 17:17:46 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjLm4-00000000Sz0-1A3f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 17:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739639776; x=1771175776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Equsm08FQ5ieBMbjiGQm0NyEsM2olvsgtLG0zKJlMKo=;
  b=B7lWyjEYMFQ5yuFVozBPxXyp88SyjX+lNzEhcfEiNuPEVeotsFANg7J9
   +mkbqJdXKlx8kb6AVelTbe4iA6daDgDKJlpMWVZaPGR5wlY05bgFHbp9u
   oPobxeapNRCsbum6wn6lMGkQuL21ff19Txa13WO5/6MIDTc4xVbS6jZwF
   7YPjbEl5obK3IZr70k9MtUUfmO45qW5a6QTCOniAQnb9nirUBOts74q8n
   8EJFWTUv2FwoyYzrtVsC2V5/q9yPq0JOwDjLrcDIXz/gOihs4HLGAx6DA
   MEYJdaC9uma4EpY7sMlT4CYN6PuGTvQTUHxhWpiqdnUyK8y3gfPRTeboh
   Q==;
X-CSE-ConnectionGUID: ezDUmuUTQYekhpBKzCaBow==
X-CSE-MsgGUID: c1b0HyOwQTGbAttsYTq4Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40403674"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="40403674"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 09:16:12 -0800
X-CSE-ConnectionGUID: Yd7RnQbmTgWJdCCXOEjokw==
X-CSE-MsgGUID: Dzd1IWb1TXSPnX7Q8e5WhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144654676"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Feb 2025 09:16:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjLlw-001B1v-0e;
	Sat, 15 Feb 2025 17:16:08 +0000
Date: Sun, 16 Feb 2025 01:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] MAINTAINERS: add entry for Samsung Exynos2200 SoC
Message-ID: <202502160050.nTezfbL3-lkp@intel.com>
References: <20250215130702.170851-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215130702.170851-1-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_091616_393446_5FFAFAF3 
X-CRM114-Status: GOOD (  12.30  )
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

Hi Ivaylo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/MAINTAINERS-add-entry-for-Samsung-Exynos2200-SoC/20250215-210923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250215130702.170851-1-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v1] MAINTAINERS: add entry for Samsung Exynos2200 SoC
reproduce: (https://download.01.org/0day-ci/archive/20250216/202502160050.nTezfbL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160050.nTezfbL3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/clock/samsung,exynos2200-clock.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2-phy.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

