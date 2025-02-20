Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0F2C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8i8NHUpLU1lNymOiuinj3CiGxQRUTvt7Qzv9Ox/cVY=; b=2AhUtasU/cWHaM1zHbigV4+FZp
	t06xYgrKJE9DySJ3Z6vqfZjNXDum02E3apc5o1x0msRDOvwNbiaVvcW+gVCFueZEUksuA6FwztgYN
	UiqBDVNsP1dC5pkApRdx0+CFk/Y4io5HOjKfag+77bIAjuDcXno+dZ+EcRevuROKAy4O5QPrTi0vC
	hg+PjW5X5iesGO4xDN4T0lUABTgc3m1LMXyn+p9CITfwMvXRFj6/dtU8Y3zrl/IDHMpbrkqUS+nOa
	kZDy6HoYpvg8Z9Ueg6JaYicgODTiGw2U1NiynuES9MUMwWQ4kog3/uCwOx/Vqy39y1sf0NVvXOFr5
	HUNFycZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl98t-00000001mSM-2UFm;
	Thu, 20 Feb 2025 16:11:15 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl95z-00000001lbc-0MnF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740067695; x=1771603695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5UKuSJfQdQ3wxkz3CXu365iXRHx0PfplKe3AL6w5Cms=;
  b=R2H11IkQHZ8OIDz+GePSZq7iLEXJ6p1DsjvTbbwXScEfgpK7WwBURaUM
   zN1HlFZNsydSU4OHQU6CL4QJ++uv0/bwQGEXa25qLpqWPrtwQ/yHgNdtT
   E1bQzkskP3I4BH0CKAJXBQhXy0Y7Ee5buEHPvjCgsm2nwO69h67MLUHD2
   L2Gkt2mGleJZcn0xUXa5I33yIfyYDFiKTWQfwAHrXczAxwMbufYpKc5hq
   Q7nUB7+xyc/2KtyTfsjCk/5RTECNvnxUAFDeRBfPCOfaF/zryj4HRhsR5
   GZVFa80k3MBB+aSJp+Wzf/b/qbfOd6TinWg9hHJov/cXMk4KAGMKQ2lwc
   Q==;
X-CSE-ConnectionGUID: M8OXxOieSf2+EbsroZLwNg==
X-CSE-MsgGUID: rSRS4UbPQ8+c1kEpl/mmRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41111091"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="41111091"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 08:08:12 -0800
X-CSE-ConnectionGUID: XpRPYF38T1i0MknHmzmydw==
X-CSE-MsgGUID: nmfcKGLnQPKtGGWmAwquGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="145937707"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Feb 2025 08:08:05 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl95l-0004Tv-20;
	Thu, 20 Feb 2025 16:08:01 +0000
Date: Fri, 21 Feb 2025 00:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 6/9] iio: adc: rzg2l_adc: Use adc-helpers
Message-ID: <202502202332.jrEGhoBM-lkp@intel.com>
References: <25c5d22f6f0cbd1355eee2e9d9103c3ee71cebdc.1739967040.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25c5d22f6f0cbd1355eee2e9d9103c3ee71cebdc.1739967040.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_080815_152451_8AF8B23A 
X-CRM114-Status: GOOD (  10.15  )
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

Hi Matti,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5bc55a333a2f7316b58edc7573e8e893f7acb532]

url:    https://github.com/intel-lab-lkp/linux/commits/Matti-Vaittinen/dt-bindings-ROHM-BD79124-ADC-GPO/20250219-203748
base:   5bc55a333a2f7316b58edc7573e8e893f7acb532
patch link:    https://lore.kernel.org/r/25c5d22f6f0cbd1355eee2e9d9103c3ee71cebdc.1739967040.git.mazziesaccount%40gmail.com
patch subject: [PATCH v3 6/9] iio: adc: rzg2l_adc: Use adc-helpers
config: i386-buildonly-randconfig-005-20250220 (https://download.01.org/0day-ci/archive/20250220/202502202332.jrEGhoBM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502202332.jrEGhoBM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502202332.jrEGhoBM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_iio_adc_device_alloc_chaninfo
   >>> referenced by rzg2l_adc.c:324 (drivers/iio/adc/rzg2l_adc.c:324)
   >>>               drivers/iio/adc/rzg2l_adc.o:(rzg2l_adc_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

