Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6183EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZtLXGVg1Em1/TNcTgLGGkMH88UfSkr7QGPOVW0gpB8=; b=n3dFdVlZlQrUpIRAp46KED6gRj
	a9sgNke2Iyw1IRPbYPcBtDVxsrb7btmZMIIyrn9VXEgpaPa5/xhrXF1THgRpWYhlxcJNpVpV4KXW9
	oW1iGv0WrrAOOB9bZjUvWLgMB4oONQYW4XUASY1w2i6G8+RPP88pd7xYB4WXx1EyJL2S0yfuln8hf
	ik3ZHykiP0GHpSeV0kk/O93Dq9earMzQlaNWjRRijtKk5aswQJR/2THzz6DXATLnJwOWfHHHB9L2o
	HgAMDYDlpmfX4N02uiGr9/VvV/PQweTvajFhPKB6DUbWHCr2As2dKaSmCkjvY84BHW9zxievec90B
	+XK2QIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9Nx-00000001rFp-0W3o;
	Thu, 20 Feb 2025 16:26:49 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9Fq-00000001ok3-2m9x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740068307; x=1771604307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9RlNbYnLFzVjYgxQyd9KBfI9XCJfe/tCHW00K82XgB4=;
  b=VNlekTg75J0qAfGXfCvz0vp9dqZZQvGYx1+ARWw+GevfDx2ZXEEsqZnY
   EP12CT5KYU2m5qe/J5UdIeollr3MxqD8LeOG46/PH5IlfUSQv1TT5bNTR
   oN1bDImQ7RLyF2Wt4+7LndeRXNa5rtyqrnQfWe6DeM1CqnB0co3wmKq/B
   /rufj10FsJRtDmVRPq4jy/wkk8gWpU1aBcjP++YIz7VNKE6hAK2LTJXaR
   wLsxEJ6u4j9zZzcyzZauVn4+Xu1botvPUdM5oxzgpK4C4w7g2pPzllIq0
   rM2mkWK0OWKRhgpbL4pakdx4bF+W7dYCVlJ7mOj4miR39qMoy08g/L31b
   g==;
X-CSE-ConnectionGUID: Stx85OJSRGWZyW9Yv18miA==
X-CSE-MsgGUID: EFFQslHyQgWRzTCE5tt3bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="63329822"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="63329822"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 08:18:26 -0800
X-CSE-ConnectionGUID: MUBFVS80SV+FEOQ9rn5jww==
X-CSE-MsgGUID: 0PpoekXBQF2IG16mnDk74Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="138294951"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Feb 2025 08:18:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl9Fj-0004UJ-01;
	Thu, 20 Feb 2025 16:18:19 +0000
Date: Fri, 21 Feb 2025 00:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>,
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
Subject: Re: [PATCH v3 7/9] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <202502210037.162FN3PM-lkp@intel.com>
References: <21b9af362b64a1d9c2a13cc46242dd6955996c46.1739967040.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21b9af362b64a1d9c2a13cc46242dd6955996c46.1739967040.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_081826_737280_54F86CBB 
X-CRM114-Status: UNSURE (   9.68  )
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

Hi Matti,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5bc55a333a2f7316b58edc7573e8e893f7acb532]

url:    https://github.com/intel-lab-lkp/linux/commits/Matti-Vaittinen/dt-bindings-ROHM-BD79124-ADC-GPO/20250219-203748
base:   5bc55a333a2f7316b58edc7573e8e893f7acb532
patch link:    https://lore.kernel.org/r/21b9af362b64a1d9c2a13cc46242dd6955996c46.1739967040.git.mazziesaccount%40gmail.com
patch subject: [PATCH v3 7/9] iio: adc: sun20i-gpadc: Use adc-helpers
config: i386-buildonly-randconfig-002-20250220 (https://download.01.org/0day-ci/archive/20250221/202502210037.162FN3PM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210037.162FN3PM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502210037.162FN3PM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_iio_adc_device_alloc_chaninfo" [drivers/iio/adc/sun20i-gpadc-iio.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

