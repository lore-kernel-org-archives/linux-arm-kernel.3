Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981C0CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjT2ZNsV8AfEzmKZqwFXl+1QnND6/6cZCln0zdfGadQ=; b=XH8DxWHIWspBq3e9G9U2lBTtsA
	gzQsc2SeD61S07ivUQQN9tC3U4cy+P2aOev2dLMPYvioRWAqUcB9uunCV4+YePon5xaI8GySSLDYh
	3DT8cUNgt+RBQly0Fl6Bu/0JtBYgn4HXS1tZNfnGgipj84UL1VQBaVqKK4YI9eMn+7LrJgrHekMGd
	uCXtHm/g6LMhr/sOrTvH041NMlva27eUg/eLpNEfi3/PAJXfeRe21oHNSADrQQXGB8VAHXPEozCHX
	ZeJZN4irQBOhq8gyDUAGf4k4Fjdh4OVRJ2fIYrlcz6+IhCy/YzVdfVLPsa2u7XQ1hh7s63l8M5jiQ
	8VW2BVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImrx-00000007RBn-1ll2;
	Mon, 19 Oct 2026 12:53:37 +0000
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImrt-00000007RAv-2bX5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1792414413; x=1823950413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lG8ba8f3XvMZ016RxZR1uTEgZGmbv/N4GGCyJVqPUXg=;
  b=PY2dUxRCS21DaN37QzuZ5ubTwPYF2AhLTEaY+WGmF2tTh0D1g+VHlfzK
   pOZ/Krn/FwIZIzTyjNBSUHOxk54YX/3gVNBuAxRbeAimVyxXtCoNyIfTG
   Fe3TfbYNmoMhNWRuKOFBDZRqs105VAP+Kr69D3IlpyikH5HtazTCnNV8d
   aPH9ChxI1ZTagP8KdBwKjkk6BxqRIA7Z4j5vFR6vOzbDJMJoK/vGR850V
   uQNAOclXNRgyFo99/UIDg2MIyyLLWQ6VYjNYgdfi1yfdQY6sfPh9gLuJA
   3eEan6FIpP39gZyZ7DbYvxQry0Fqu4I/WUpBHNO0uAeV4UqgZTlISAn6Z
   Q==;
X-CSE-ConnectionGUID: /6D2nmHKQ1K6cELBWa5qlQ==
X-CSE-MsgGUID: TXCbHZayTomY7H6hS2lbCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="237587890"
X-IronPort-AV: E=Sophos;i="6.27,167,1786978800"; 
   d="scan'208";a="237587890"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 21:53:30 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 17D061C000D3
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 12:53:30 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id BE0C21000854
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 12:53:29 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.51.148])
	by az2nlsmom4.fujitsu.com (Postfix) with SMTP id 9EDCE2000233;
	Mon, 19 Oct 2026 12:53:21 +0000 (UTC)
Date: Mon, 19 Oct 2026 21:53:20 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: kernel test robot <lkp@intel.com>
Cc: Tomohiro Misono <misono.tomohiro@fujitsu.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 4/4] irqchip/gicv3: Add workaround for FUJITSU-MONAKA
 erratum E#030003
Message-ID: <atYOKfirjR1VqBZ3@FCCLS0092175.localdomain>
References: <20261016-monaka-fix-for-upstream-v2-4-fc7ede7f9f48@fujitsu.com>
 <202610171939.VWCcPPra-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202610171939.VWCcPPra-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_055333_956228_A610764F 
X-CRM114-Status: GOOD (  15.00  )
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

On 10/17 19:48, kernel test robot wrote:
> Hi Tomohiro,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Tomohiro-Misono/arm64-cputype-Add-FUJITSU-MONAKA-definition/20261016-190045
> base:   24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> patch link:    https://lore.kernel.org/r/20261016-monaka-fix-for-upstream-v2-4-fc7ede7f9f48%40fujitsu.com
> patch subject: [PATCH v2 4/4] irqchip/gicv3: Add workaround for FUJITSU-MONAKA erratum E#030003
> config: arm-defconfig (https://download.01.org/0day-ci/archive/20261017/202610171939.VWCcPPra-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171939.VWCcPPra-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610171939.VWCcPPra-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/irqchip/irq-gic-v3.c:1892:34: error: use of undeclared identifier 'ARM_CPU_IMP_FUJITSU'
>     1892 |         if (read_cpuid_implementor() != ARM_CPU_IMP_FUJITSU ||
>          |                                         ^~~~~~~~~~~~~~~~~~~
> >> drivers/irqchip/irq-gic-v3.c:1893:34: error: use of undeclared identifier 'FUJITSU_CPU_PART_MONAKA'
>     1893 |             read_cpuid_part_number() != FUJITSU_CPU_PART_MONAKA)
>          |                                         ^~~~~~~~~~~~~~~~~~~~~~~
>    2 errors generated.

Oops, I missed testing this with CONFIG_ARM=y. I will fix this in v3.

