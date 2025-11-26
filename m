Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CF1D10F5F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbmsDT5sWfaM9kD74mgCnnztyljRQSjz1T2Ch0Nw0cc=; b=eAa+ttOffBPrqfMB87h6fvtZ4E
	liOloYzO85vQd/SSiJWV2uCALrLc3uQCKnXhd/BTonhbw3nAnia2FaOLzvm1nBZLVj88bQxbLMZ50
	lzX5LzCFXoKcJDtNvzE1FFDaPr8KYXtB9Hg7TwXeW8ATswAzmcalB/fj2QVE7H/UHS+Yiu/hKzh1F
	Ap+dRuakuIxoxPlXUk3qDhUJLiUVFWcrNySUm1dj+1irl/I1+0kSoat+VeV6swTVjs+ZoK8XQUNs5
	fCu6SEe1+tvpl1s/JNBvZ3C8OWGeVZmQs+7Vp9cG5ldwIYJu2WEGrgl8S2+CilD6zEeD+hXJQJrYO
	Xm66+VlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHHZ-0000000FAiv-2Dx6;
	Wed, 26 Nov 2025 15:18:13 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHHV-0000000FAiC-2JAS;
	Wed, 26 Nov 2025 15:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764170289; x=1795706289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OAQISPswKJq25SzgGqswUw+2peV2QjQp+1X2kjl7i/E=;
  b=oFZKGhWSgSweT/tnejrWEuCqOsmiODdukIYa1yeD0/iCI1WzXQr9cqtr
   YBClRJ5vwuyiv4k/1CfpEz/dTxEiyofLzjGVnej/9JyY7TpP9q8FjfdDC
   wpbj8iPF9EYGbsYVN7YPbOkuQVzCAy8kXe1mvqlp3HaI0tPqKq0W8xTk8
   CPXgDKUW/8ELRDiUXbiS8a00ki77YS7GBGk/1v4oTY+XRc8sv0LnY76Xs
   5WtVX1AtNYkBR6L2fHFA9KiviFJhvHzDgZhKWXtU6SBcgkkehseb0T58Q
   KAa39G3i0l1ZnjkoCDsYfC3kE96TqTFFo/V/oHqZZXno3U9FjV4s8uIgq
   A==;
X-CSE-ConnectionGUID: TCtfhiIaQ2azMurQR1/U+g==
X-CSE-MsgGUID: xzJ5Tfz9Ski7g7GAJX+GQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76534667"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76534667"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:18:09 -0800
X-CSE-ConnectionGUID: xKcInju7QGe/+joUlWElfA==
X-CSE-MsgGUID: S+2yY/40TsKNxFP41vkcbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192851038"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Nov 2025 07:18:02 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOHHM-0000000032V-21UG;
	Wed, 26 Nov 2025 15:18:00 +0000
Date: Wed, 26 Nov 2025 23:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH net-next 7/9] net: pcs: xpcs: allow lane polarity
 inversion
Message-ID: <202511262216.TzyLet3B-lkp@intel.com>
References: <20251122193341.332324-8-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122193341.332324-8-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_071809_759561_F5B287D4 
X-CRM114-Status: GOOD (  10.73  )
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

Hi Vladimir,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Oltean/dt-bindings-phy-rename-transmit-amplitude-yaml-to-phy-common-props-yaml/20251123-033900
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251122193341.332324-8-vladimir.oltean%40nxp.com
patch subject: [PATCH net-next 7/9] net: pcs: xpcs: allow lane polarity inversion
config: arm-spear6xx_defconfig (https://download.01.org/0day-ci/archive/20251126/202511262216.TzyLet3B-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511262216.TzyLet3B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511262216.TzyLet3B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: phy_get_rx_polarity
   >>> referenced by pcs-xpcs.c:821 (drivers/net/pcs/pcs-xpcs.c:821)
   >>>               drivers/net/pcs/pcs-xpcs.o:(xpcs_do_config) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: phy_get_tx_polarity
   >>> referenced by pcs-xpcs.c:829 (drivers/net/pcs/pcs-xpcs.c:829)
   >>>               drivers/net/pcs/pcs-xpcs.o:(xpcs_do_config) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

