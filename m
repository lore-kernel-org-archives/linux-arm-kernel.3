Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B60CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39u56EAv9c6L1rCo88qNgkJ/+c7k2MkmfTVcFdxBydc=; b=I18BxdqFGDoWdp4wm8z8HkZJSX
	mRWP1sMokLWi5Eipn+fboAIOq4mTedLD00krI4shRAEfEU4yfqu9UMyZQAVlCxL6quqFnZXCMWc2H
	8aYO3H+Xg1MmaGPB58FIrK1N+J9bAVjxpJJAJZaefJw6CzFF++dHEZA0U90LUUOtRbWDUce3KWtRq
	UP7+H7aPNIkktHQJBGUKgez95tJxaO8/+CI9r1SYZ12RemLFFHQRljpCBt5HXZbfiAALi9JAP4ggd
	Ae2Pfp9JI8nLMraQauXHd41+UfXweJUQmf4ua+4omnTEGctYNhzuGfapdIIclFlHm940L7cAWB0S8
	X1lF/hlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw320-00000009PW1-1Z9y;
	Tue, 09 Sep 2025 18:25:28 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw31x-00000009PUe-1uPf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757442325; x=1788978325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jP+QEcU702l7EMgJt/L66MErc+79C+UsveNcHCtgkgk=;
  b=Q7WUnC/QMWkxekBzCVOLmB3aYyLNeu5bDbDNaDXdZW0FF6Fp6Pg2SbrE
   8vl8PPJnv4/Jrd3G6t9FxcOEh0j87RCPIV3ZQWAmcscqrPMDGCB6/sM8s
   qaYYaA7jS8qIKCscg3yBDc+/DtmiZGSB2/8fvQE4nrEJxU6t5AR/Ea1z7
   HRY3T28bScLUsynLWQ4QRg0ETj94dgMdFz65qqTFf2h6qrYWk+LU+XNby
   /byNQB7K/XnqL7oPcwWDn1SjDIYvUEo6uOJgkGGhpJARYmWgb1i2n4v8g
   das2T6treSh9aDO2/YQq0KOYeOD588NtCkPhSVe4mq+cTnI03N9BD/Cwa
   A==;
X-CSE-ConnectionGUID: XhyqcnqNRv+N4EN340tnOg==
X-CSE-MsgGUID: 4h28Zsm6TBOu4NvBHaU7RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63569056"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="63569056"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 11:25:24 -0700
X-CSE-ConnectionGUID: ABg3IuvfQsWOZJ/S88AArw==
X-CSE-MsgGUID: aTfHsRBlTh+Cedlmx8R+9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="173552913"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2025 11:25:21 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uw31r-0005Al-0r;
	Tue, 09 Sep 2025 18:25:19 +0000
Date: Wed, 10 Sep 2025 02:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Denzeel Oliva <wachiturroxd150@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: exynos990: Add UART nodes for PERIC0/1
Message-ID: <202509100100.bccnVSbn-lkp@intel.com>
References: <20250907-perics-add-usinodes-v2-6-58f41796d2d3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907-perics-add-usinodes-v2-6-58f41796d2d3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_112525_505369_6942C872 
X-CRM114-Status: GOOD (  11.00  )
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

Hi Denzeel,

kernel test robot noticed the following build errors:

[auto build test ERROR on 98ee0e036cfedf543c4728a604fd7870d0000efd]

url:    https://github.com/intel-lab-lkp/linux/commits/Denzeel-Oliva/dt-bindings-soc-samsung-exynos-sysreg-Add-Exynos990-PERIC0-1-compatibles/20250908-061748
base:   98ee0e036cfedf543c4728a604fd7870d0000efd
patch link:    https://lore.kernel.org/r/20250907-perics-add-usinodes-v2-6-58f41796d2d3%40gmail.com
patch subject: [PATCH v2 6/8] arm64: dts: exynos990: Add UART nodes for PERIC0/1
config: arm64-randconfig-003-20250909 (https://download.01.org/0day-ci/archive/20250910/202509100100.bccnVSbn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509100100.bccnVSbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509100100.bccnVSbn-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/exynos/exynos990.dtsi:517.4-5 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

