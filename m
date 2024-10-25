Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAE7D149E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdTRq30m0XwXH4pHXGAC/PrgAQuHHnjfhDVOuntiU4Q=; b=YGN3JLWXOB29LOZgn+Dfye3emF
	WLExlHWH0RiEttuQvXkU+57VDAtm4cqD3Zhsjc8ni+G+x+jphGZ8tfIje0bJts6Xs8Hm2xG77sSx2
	76JpdVKoqUVr62VfcaVGyCMqsRRUO9A5NDgYw0pSKGV4ooiAgC5kHrn1XJp5BrwDnRFn5wngKuW3w
	2Jp5PR/TIu075i+H47VZjW6Jfze8h5fycqbI67cEWV4WYmGlLT6pZ0vfEy1YLicoPt54UZlvW8lfN
	dCUpzKiy0gWLjAU82hu5owQ2UPc+2HDxquQ9I4ZP1UG6SKg4Aprzs18Pu+ke50HzeiNvaQvCu8ahO
	l0zulsUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4P9G-00000004pKM-3s9Q;
	Fri, 25 Oct 2024 18:34:59 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OU5-00000004gVh-48Q6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729878746; x=1761414746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UtYL6tEz9hl+CXKoYPC2/xOLlz0ZwZXSI2NVSNsyDNo=;
  b=C4Us46T0+okdVgCJjaASYUWfEJReSXcwSP/9cjtXbruYsbwWVOpJLyE9
   kRKp+XPzRwAK0Ka6Ro4xe6z0ExasvgN1NOiC593C0ABM+2TThmFd5k+jL
   Rxu5ewNXTIxOzaChWL9ti87SMSMVWabGsHeKG+16D+9/i0AWFo3ZkTvN3
   qUYSaEXQJpTt9GVZbUUj8GkKrt4Yzpq1kV5+TBm2g0d34QT4tTOT73x2D
   akCchY8PdpyX5UayRjsIzSxWrQcJtx0n4DcEpZl/31hnOm8U5cwXMztc8
   BiJn7x7+jF4/SIHlXLll43HwCHrSM+kNK7BI2ZNRICPlj2TYA+mHp0CNo
   w==;
X-CSE-ConnectionGUID: Ri7B9s1qQ6uAohU5238pnA==
X-CSE-MsgGUID: jx/P0wz/RuOlqIV7mbivXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52110110"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52110110"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 10:52:25 -0700
X-CSE-ConnectionGUID: Gs8fPh/5Qa2QeLM9/DlmTQ==
X-CSE-MsgGUID: ec3pH9vCSLGfxnnHMxOYFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="81405415"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Oct 2024 10:52:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4OTy-000YhM-1w;
	Fri, 25 Oct 2024 17:52:18 +0000
Date: Sat, 26 Oct 2024 01:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: Re: [PATCH net-next v4 3/6] net: stmmac: Refactor FPE functions to
 generic version
Message-ID: <202410260107.eXOai3Uw-lkp@intel.com>
References: <cfc647f0d031517f9ec9095235a574aad9dc2c95.1729757625.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfc647f0d031517f9ec9095235a574aad9dc2c95.1729757625.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_105226_095692_1E5685D7 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

Hi Furong,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Furong-Xu/net-stmmac-Introduce-separate-files-for-FPE-implementation/20241024-163526
base:   net-next/main
patch link:    https://lore.kernel.org/r/cfc647f0d031517f9ec9095235a574aad9dc2c95.1729757625.git.0x1207%40gmail.com
patch subject: [PATCH net-next v4 3/6] net: stmmac: Refactor FPE functions to generic version
config: arm-sunxi_defconfig (https://download.01.org/0day-ci/archive/20241026/202410260107.eXOai3Uw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260107.eXOai3Uw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260107.eXOai3Uw-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.o: in function `stmmac_fpe_configure':
>> stmmac_fpe.c:(.text+0x140): undefined reference to `__ffsdi2'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

