Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E88EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 07:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7I+wbIRGBRQUrwS9Hpg/79+X3FQgqV1UN/Y5D+k7Lc=; b=xHk3SX7VIxNipvJGGk24fZ3KwY
	7nD7OuEqfELvuF7b/tPKQYE/A+jY0OwMWoSTMI8Fz42meeCHaHl/nnf/OjKCQtoG46nJ9GAcmwGbi
	BynFDJKnAv92W/SNzv1x+1lMsonAKGgoqLV0NZ9b3MKAMAtVsfXRr4LRRa7ZsIF/UcFHqsPDToIQZ
	Kirf0p8GMK9fxDDx3TTHnpediE3xnbB2T8swbJm89fnDi7GpKXcO/sfFc50s5qGWtShf91LGQfzL6
	wu+0GPFs/fu+xjNZgF26YhSbYPBT/pcYrJCmjP1zlc7dwVKllPDB5oNfd5fYweDPoHneabBGQ/S6a
	M6Fj/4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTyXO-0000000EeEj-3l6E;
	Sat, 04 Jan 2025 07:25:34 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTyWD-0000000Edug-1V7M;
	Sat, 04 Jan 2025 07:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735975461; x=1767511461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hApevf4s8W35qlEae1IzG8ICVMdOQ9BpJ7wqh1gKCt8=;
  b=KzluGCsO/WVCG+K4T2FgA3PntQsqtuTpQ9Mr/x7cIHd4DIXtb5RBUJ1W
   VeieZDmvMgCZLAWkZEgaLW3Lx41w3XEZReOUe1/Nd5Yzj3DEKsYlMpd5y
   kJt2nyqpk7Fj4hvhx+eWGBhk3qUsnGYLhoIcdmFpITJNSo4pDgMCr1AqS
   n+VAq0z3TDwF4S9u/DzqfbQlH/m4kLTIlLG9YwMNobCZxKAXsLQqL+mhb
   0lmm8TvDzNYplfeHJugABAAj3CrVjJY4nkmJmT2er741vGW3zqIFA2q3N
   j5+NI5rI7wWYdgBpr3L1mW3qs2zxrucTLRjO67P8HitXKi4vUWVKsfzFC
   A==;
X-CSE-ConnectionGUID: UN6SC135SMuKohAtGVuf6g==
X-CSE-MsgGUID: uX3Fu0PlRimqFhlWMdsN2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="39030205"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="39030205"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 23:24:14 -0800
X-CSE-ConnectionGUID: /lzjVEECRMO8wtInbqsUSg==
X-CSE-MsgGUID: 3kwcATRGRHuLQHDtEimq8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102466773"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jan 2025 23:24:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTyW1-000Ajd-2s;
	Sat, 04 Jan 2025 07:24:09 +0000
Date: Sat, 4 Jan 2025 15:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jimmy Hon <honyuenkwun@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev, Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
Message-ID: <202501041500.EeQw8gzk-lkp@intel.com>
References: <20241229184256.1870-11-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229184256.1870-11-honyuenkwun@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_232421_406338_754566C8 
X-CRM114-Status: GOOD (  11.53  )
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

Hi Jimmy,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on robh/for-next linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jimmy-Hon/arm64-dts-rockchip-refactor-common-rk3588-orangepi-5-dtsi/20241230-064740
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241229184256.1870-11-honyuenkwun%40gmail.com
patch subject: [PATCH 6/7] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250104/202501041500.EeQw8gzk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041500.EeQw8gzk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041500.EeQw8gzk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts:53.1-7 Label or path hdmi1 not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts:60.1-10 Label or path hdmi1_in not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts:66.1-11 Label or path hdmi1_out not found
>> Error: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts:76.1-11 Label or path hdptxphy1 not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

