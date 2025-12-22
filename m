Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D8DE677EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YetxDVR1VxI0DTAWYAmjhdeCk8r20I0WByPG5tUrY0=; b=zUeFlEGjVJofDBjmLqdLcqMn47
	YJnYtab0HQl2eZnyxKlDdpBqr7l1y232e1AkqR7vJskH+O7+7ieYrDC8/4d/51gCDVBI7tpUkqDHU
	99oZ8u3NRPAVM8r7Hbo5BxCMjrOODcGhw75w4jmYL6RvxJitVvgTh7eNiM+Khrnya478F7ICRAwUx
	UdKgRYZcZylA4w+MyaqnpNCydPIynPKW/2wIYKxkHzGvrPy1/qL54yNBia33MlPfPq5hrMHzlrhm1
	2IswFuMhym75tlDqePqmKVzzH/hYxQ7b+JIXWbr1MEwHrj5/niRtJKqIc+T4pAWjwNjOTcCiSUvYA
	Naano0vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhuc-0000000DvZn-3rRX;
	Mon, 22 Dec 2025 15:33:30 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhuZ-0000000DvZD-2eZO;
	Mon, 22 Dec 2025 15:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766417608; x=1797953608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oevZNtJK/umXqU3Iu+7UzKkPRbb+1+8qqTTjLfmC6wU=;
  b=nLtUs/LhEAnBvt6bihL23Pn0cNRrmkMviSJ58rnDeGjRvTuw4NHNG6zj
   8HnvSiwKmUUcj13zaiNICjLK913nY8MYkd7eWeESboY1j9Ey96oQVgsw0
   U41mgkra0X33H6FKBHa1Mpz186jQ3RqDgwSlwORuaPwI7EWS/TglzhuNS
   sOXXP7juZ85PJjBSI8axzd4AsRlE/eAxAJLGdw3a9ks4iyNE5W4LIxQuL
   enhBa/MKktvCQPXT7jP3KEps5pv0ZWNrIQY0VW27rECz07y6SR8i1yhdm
   jzvqgzgy1RYzzVbsIYTAtyUc2JxDy1TaxCeErfER/skoMdFlrqa6KCr9Q
   A==;
X-CSE-ConnectionGUID: YSWiR+hkQgGncmK8cR6WWg==
X-CSE-MsgGUID: KG2279M4RAuUxLHiBfqxkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68026716"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68026716"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 07:33:26 -0800
X-CSE-ConnectionGUID: ukAZI8NMSOiEtpG5QUZ/Uw==
X-CSE-MsgGUID: L8+GSCwISZyJ+reXBPVunA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="223033237"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2025 07:33:22 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXhuR-000000005Y0-3SMV;
	Mon, 22 Dec 2025 15:33:19 +0000
Date: Mon, 22 Dec 2025 16:32:53 +0100
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v10 5/7] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
Message-ID: <202512221600.vlUX9PF6-lkp@intel.com>
References: <20251215085349.10155-6-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215085349.10155-6-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_073327_772500_B27B8A09 
X-CRM114-Status: UNSURE (   9.99  )
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

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc2 next-20251219]
[cannot apply to robh/for-next rockchip/for-next arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-vendor-prefixes-Add-Verisilicon/20251215-165740
base:   linus/master
patch link:    https://lore.kernel.org/r/20251215085349.10155-6-benjamin.gaignard%40collabora.com
patch subject: [PATCH v10 5/7] media: verisilicon: AV1: Restore IOMMU context before decoding a frame
config: openrisc-kismet-CONFIG_VSI_IOMMU-CONFIG_VIDEO_HANTRO_ROCKCHIP-0-0 (https://download.01.org/0day-ci/archive/20251222/202512221600.vlUX9PF6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221600.vlUX9PF6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221600.vlUX9PF6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VSI_IOMMU when selected by VIDEO_HANTRO_ROCKCHIP
   WARNING: unmet direct dependencies detected for VSI_IOMMU
     Depends on [n]: IOMMU_SUPPORT [=n] && (ARCH_ROCKCHIP && ARM64 || COMPILE_TEST [=y])
     Selected by [y]:
     - VIDEO_HANTRO_ROCKCHIP [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_HANTRO [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

