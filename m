Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD47C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 04:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUwZ3iHMc9vqq4FBHCAKfHPYHZF8G3S9wk5W4pPz8sg=; b=GYKpS8cfwng89NY933UQDS6LjG
	Arq7I8O9ox42/Hb/qesgiwcHhZy16WIQzpAgTTxoQaU9Rm1mpiu85r+0BdSFsv+tGtZWhoS4RXoRD
	fTWkEW+zLwNl/GAaehytEYfBkPEdYGSYFW19GeEGwEFkV5ODvYdaafdzng7lHdlWw+/CYN6hubJoV
	EMPKQvvABLpmcgEWiIa75zP+5OFR6sN2IaARGKYYVtlKTw1Ep2Bfl084R28ikW6NqmwlEXgO3bWd4
	pbHdI2TCVm0N87yY6FkTDG3RoXUMD2vMEMDK/oaTm98ZjG5TMMR+F9JcJiFQyrs+vOvb5AY2+HpFZ
	yCimWRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvqSj-0000000GpDz-1Yhj;
	Sat, 22 Mar 2025 04:27:57 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvqR0-0000000Gp8z-1vFy;
	Sat, 22 Mar 2025 04:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742617570; x=1774153570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l6gLWnT6/12qsoTDy2FceFIUC2G5PMom7qnN2lEPN3k=;
  b=S+gP4nQ9Mm6hZoXUl1ONDU6Y8i85SWQAOwtgpzhfiM+edQdDePTqTOfA
   hzV7fNH1SrHgwZJ7WguX/K0NS1+z2blYFzw58uXLQUqN5phFJ5b/fuNLt
   b9q2NhjQzpghVrTLR6HJrlc+wuxb1uxP2dc2I+i0jaTYxhTM0SFoYgbz2
   h6YWyYvfGqxWK+8YV96XPLI61jPDptz5X65m9wRT/uiiUKuMdPrAfwvJs
   gk6xTKOVK8WmMzqjbPull1AeeR3AxkJ+ph5nC0FoqvkZzFkYfms2R/uTH
   o7sNE20a7AM+SKdu7/s60vMA5UIUEG5VR6XXydzA54Quj0DZp6JOil4yu
   A==;
X-CSE-ConnectionGUID: 6BagZ6OZS+e/waI2hbmE/w==
X-CSE-MsgGUID: g/kj7/KFTG2clDVB9CGbhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="61412185"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="61412185"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 21:26:08 -0700
X-CSE-ConnectionGUID: BDa8yezbSx6cDg3x6ouRdw==
X-CSE-MsgGUID: zZHs0fnYTTWhNsfWtpN6Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="154578188"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Mar 2025 21:26:05 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvqQt-0001vL-1q;
	Sat, 22 Mar 2025 04:26:03 +0000
Date: Sat, 22 Mar 2025 12:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use
 GIC ITS
Message-ID: <202503221203.7E0Oa0zG-lkp@intel.com>
References: <20250308093008.568437-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308093008.568437-2-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_212610_539941_0FF96DF1 
X-CRM114-Status: GOOD (  11.24  )
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

Hi Chukun,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on linus/master v6.14-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chukun-Pan/arm64-dts-rockchip-rk3568-Move-PCIe3-MSI-to-use-GIC-ITS/20250308-173422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250308093008.568437-2-amadeus%40jmu.edu.cn
patch subject: [PATCH 1/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
config: arm64-randconfig-r071-20250321 (https://download.01.org/0day-ci/archive/20250322/202503221203.7E0Oa0zG-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503221203.7E0Oa0zG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221203.7E0Oa0zG-lkp@intel.com/

All errors (new ones prefixed by >>):

   also defined at arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts:597.10-605.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi:368.10-373.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts:518.10-522.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts:273.10-279.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dts:75.10-80.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts:103.10-110.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts:503.10-509.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts:361.10-369.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts:551.10-556.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
--
   also defined at arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts:133.10-140.3
>> ERROR: Input tree has errors, aborting (use -f to force output)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

