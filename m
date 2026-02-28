Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17532FEE4F7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 20:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0EO3MAT0PhT89XNAI/GfjfNbmwU/BmzVjMk+UmCPwQ=; b=qFxTsHNt/zPhvZu+53WL2Z5U0Q
	TNWPJSJG3NWdiy++lCaW1mrXjYK9OY8FA+wCBdIha2dSwr1nauWVjcVp7nDjr8bRHX8rBM5m39o5G
	i9RhsL+AnCn6lRAKcWAd4NiYh+FMBjtl6wI/oRX2v6Hq4JEhmQlMjheTIfOkDasyj8Rrq8s7MIRlA
	X0URERyFpiIeWkpuc42/gyii2uZiZUmMPuXqP+gDVWyeES7t3nzUQ63SWBjmVBlHaSaSxQ6ue+El3
	BophexO35Zu1VFVjpEZMKcO9r9Ry/6k1+3E98KBgZ7Qkl5veMdjtGFTbjLOs5eTQd8KwTBnxWppHs
	rsCxJgWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwQjF-0000000AF84-47XW;
	Sat, 28 Feb 2026 20:15:58 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwQjC-0000000AF7g-0PV7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 20:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772309754; x=1803845754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pf2ZqDiNTaVpou8OCsl9k0nAKVHkTrsQ8rYWDuqHje8=;
  b=W6XiScxmEOz2bHSeC6zCjlHfu3o9oRI6AafLrmzeu2xxYVLN0t/trisy
   GOZmoPo7M14BzRZwPkOZkJgwIfOgs1oOhy4/TxR5o3Pc1By1svIdCx1OD
   J5n0vHmyH6vlcCaGtIij/aalIZn6E4EK4ALt54ZMFtp5omNCy3+K+aKGQ
   2Mnx9nWRqaHnVip7+7FFxyQxFRBPnbN9LEY/7CaKc5QF1qc83KWHw1+dx
   xcKr4WAQX4AycP9B7yKzy0tkfQKBpEZZ12Sp57K7Cb4Dj4zLFm4xNjzQj
   yrKz2KP+EIUCjf/5ni4VE5Ub1PDqxl4TUmlyysIhrpVVYSbJAu+2ME4ju
   A==;
X-CSE-ConnectionGUID: CagjuwSYRyyk7iK77DdpPA==
X-CSE-MsgGUID: rxRz3WsIQRKjazmMUTERIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="84001428"
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="84001428"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 12:15:53 -0800
X-CSE-ConnectionGUID: +7+h/CCuRO2AFQu/kS6OeQ==
X-CSE-MsgGUID: ekF6cjXETo6a1NGSKrOlSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="214980288"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Feb 2026 12:15:50 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwQj5-0000000009v-0A1G;
	Sat, 28 Feb 2026 20:15:47 +0000
Date: Sun, 1 Mar 2026 04:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: Badhri Jagan Sridharan <badhri@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, amitsd@google.com,
	Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101: Enable AVS APDO
Message-ID: <202603010422.kDnbXirr-lkp@intel.com>
References: <20260227083954.3529857-1-badhri@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227083954.3529857-1-badhri@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_121554_151668_5D66D60D 
X-CRM114-Status: UNSURE (   9.61  )
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

Hi Badhri,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5d692f20de6311fa507c952adc3487c641edee00]

url:    https://github.com/intel-lab-lkp/linux/commits/Badhri-Jagan-Sridharan/arm64-dts-exynos-gs101-Enable-AVS-APDO/20260227-164153
base:   5d692f20de6311fa507c952adc3487c641edee00
patch link:    https://lore.kernel.org/r/20260227083954.3529857-1-badhri%40google.com
patch subject: [PATCH v2] arm64: dts: exynos: gs101: Enable AVS APDO
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260301/202603010422.kDnbXirr-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603010422.kDnbXirr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603010422.kDnbXirr-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi:177.10-30 Unexpected 'PDO_SPR_AVS_SNK_APDO'
   Error: arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi:177.35-36 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

