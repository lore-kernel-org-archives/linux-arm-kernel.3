Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429F5D5B159
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 22:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzyOe3+DtIPHpcfNUmc11UY6KHmkIniOGMfZMHd1pGY=; b=nVHIUQnRtGDa3eJurnYJ0KYGTe
	XH+zZh//joB81on8uru8ihRaAAPsOgOnXqbJDO8xM02ZgHLMDYVcztEQnTAmSXKIci82m6qkqfGjc
	cjRyUkKjJGCDkeXRgOOzlFEp9aZNxIZpbi5esMOSCmgXbSjoQ2DS7nncOD0IkqiA+V4EzQBRSCzVw
	vih9bXdF6+yA81e8noKt1IEiGltSMve1Av+6dQ89CYEt/2gtMLAnOpHB4MObePXLXlBORh/8rE2x8
	f87M0TMoRJ7KwaYWHlBhJUze67pE8qhYTO/ET9Egz0xHQ6maHDN8mw6Uwpy9/x+mprN3WU1JJaJg6
	uSF5updA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYG5-00000001xfq-32gE;
	Sat, 13 Dec 2025 22:38:37 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYG2-00000001xfR-1lxE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 22:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765665514; x=1797201514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x9IUiptFECE3cW/GDCvzyiGlrgVLo6L8ed3LxBK68RM=;
  b=Iv7at3biU8FhyRj7aC2hzjtbcO1X2QEgsFnQF1wTwCsIz1w/j6D+osSa
   UTIjiY4a4AjC2uJS9eGmWkRh0qEdAp6eULjz/QLKja00+4xF8ceaC/D1w
   TYIZOPbvhv3RK0Y+rnzVeMUJo9DvL83erxoq7j/faOguZ+rPKZs1dB+Yn
   zM8xfGOMGB5fP+qH0zrdf9+8rBO185SHA6Z0o5tIIv7VF3PZba3EPtrxK
   jdEoRuwUQjDVisR2/9Uj7/yVaiMvv8Gih3l0IXhzH9WvZTobE4JRkbimO
   oGIH8B8W7iQejz/Tk+oYw/c6KeqXQrLlcmgjPzFxRMQdEvJy+u2Z50+yk
   A==;
X-CSE-ConnectionGUID: UUV1jwBjT86ONaWtOlXJYg==
X-CSE-MsgGUID: /c3V5gjfTde7dEUzXTKEKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67585005"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67585005"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 14:38:30 -0800
X-CSE-ConnectionGUID: C5+MoIrRSh6bNB54VCqnTg==
X-CSE-MsgGUID: oGNlm5zrS7S3sfRx771FLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202300259"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2025 14:38:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYFr-000000008HD-3sy5;
	Sat, 13 Dec 2025 22:38:23 +0000
Date: Sun, 14 Dec 2025 06:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	"Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 6/8] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
Message-ID: <202512140637.VrfgC1Tj-lkp@intel.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-6-6bd65bc8ef12@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-6-6bd65bc8ef12@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_143834_564731_4195D955 
X-CRM114-Status: UNSURE (   8.76  )
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on d358e5254674b70f34c847715ca509e46eb81e6f]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Perrot-Schneider-Electric/dt-bindings-vendor-prefixes-Add-AAEON-vendor-prefix/20251212-154458
base:   d358e5254674b70f34c847715ca509e46eb81e6f
patch link:    https://lore.kernel.org/r/20251212-dev-b4-aaeon-mcu-driver-v1-6-6bd65bc8ef12%40bootlin.com
patch subject: [PATCH 6/8] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
config: mips-randconfig-r051-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140637.VrfgC1Tj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140637.VrfgC1Tj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140637.VrfgC1Tj-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "aaeon_mcu_i2c_xfer" [drivers/gpio/gpio-aaeon-mcu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

