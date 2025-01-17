Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B3CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 06:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXUYd63ny2n0WQjnNRfuQ6lSNKM5lNL1uEgNrFES0fo=; b=OluDJE+e9OTP8XGo2VoB2MaDpX
	3QFQc3hTv72kT67goWJHLHFctiYWYPPgOuBEn/HbueFyHfz4qZEmqvWth++R8z+YChgS1TpFEaLYp
	zi/zUA2YkSPrxd3RID0Pnix7tksWynGB6soxq84FM7u+SbZs40ig1YYqBHVIZkPZuL5pe0L85VuBb
	pCNY5/f6T2+ZdJzTiB/UJK2fw+Ehxgl3vfRsBjC911DkxL9ed4wn3uyLdM+suAnp9lEqOvCxOdB93
	bmcawuj49Kf0H0P+xSJk84myXU7V+Kh9vR+V3kUd+JZ+MUv2FjQJVko3BIjvD1gZ/63qdnUdlOtpu
	ZEb8kPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYfde-0000000H5bc-0ltY;
	Fri, 17 Jan 2025 06:15:26 +0000
Received: from [192.198.163.10] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYfcM-0000000H5Tf-2apE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 06:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737094446; x=1768630446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sz6DETrCSuVIvrFoZOEWFxSk1K1oBhDlzfT3ft3RyFw=;
  b=fiRbBt6orqVyzMZ7IWrI0FHR8MvqkqDEQWHCx0boD+ZsQOkymG1hCamE
   rnaRd+7Me2lFbh6vRFsbKApzFlxoYPCFoldXZlOBbJVvInVWtFa+DJB7c
   p5igezV83hBT4PXIPSWitKuy1CKnlMuJ2o1Qs2wysxww6VgMDgymgmQs5
   +nws8nkIl83R7Z7V+ebmvij+Kfts07JhMD4WHnO0LpmP+zFCjxkdx4DrI
   XEZyWeZ2iKd/sUQvr061bJG+3HzN9wL08o2h1+8M6Mp/hqMl8+RXlLiu4
   wzGP4siQndTQYpxkbgvIyT4Z8zGNntMLQvNn0YYl2GMqt3WoaOb18Wq2a
   Q==;
X-CSE-ConnectionGUID: rjV4iorgSiCkZXguKkMPVQ==
X-CSE-MsgGUID: iUS7ZU1cRQKULdQohWidsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48933807"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48933807"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 22:14:00 -0800
X-CSE-ConnectionGUID: OtmeHGkZRIi1ujQghhg20Q==
X-CSE-MsgGUID: tFe52pjKRT2DEsEbmXSIYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="106263542"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jan 2025 22:13:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYfc9-000Spr-1E;
	Fri, 17 Jan 2025 06:13:53 +0000
Date: Fri, 17 Jan 2025 14:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, David Wronek <david@mainlining.org>,
	Karel Balej <balejk@matfyz.cz>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v14 2/4] arm64: Kconfig.platforms: Add config for Marvell
 PXA1908 platform
Message-ID: <202501171330.0mw1PLZh-lkp@intel.com>
References: <20250115-pxa1908-lkml-v14-2-847d24f3665a@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-pxa1908-lkml-v14-2-847d24f3665a@skole.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_221406_674266_4BBBDEAB 
X-CRM114-Status: UNSURE (   9.78  )
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

Hi Duje,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5bc55a333a2f7316b58edc7573e8e893f7acb532]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi-via-B4-Relay/dt-bindings-marvell-Document-PXA1908-SoC-and-samsung-coreprimevelte/20250116-044350
base:   5bc55a333a2f7316b58edc7573e8e893f7acb532
patch link:    https://lore.kernel.org/r/20250115-pxa1908-lkml-v14-2-847d24f3665a%40skole.hr
patch subject: [PATCH v14 2/4] arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
config: arm64-kismet-CONFIG_I2C_GPIO-CONFIG_VIDEO_MMP_CAMERA-0-0 (https://download.01.org/0day-ci/archive/20250117/202501171330.0mw1PLZh-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250117/202501171330.0mw1PLZh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171330.0mw1PLZh-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_GPIO when selected by VIDEO_MMP_CAMERA
   WARNING: unmet direct dependencies detected for I2C_GPIO
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (GPIOLIB [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - VIDEO_MMP_CAMERA [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && I2C [=y] && VIDEO_DEV [=y] && (ARCH_MMP [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

