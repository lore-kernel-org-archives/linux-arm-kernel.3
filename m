Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9409C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoVQvyf6Ktrtcf13EFvfIMMEKjGOoXUNiMhTj+aYFes=; b=bxSgO7IECTjjc8kE2thb2wzUX7
	/mcmf0UniAehjZFom8Qz55OcgBmJQCs+efYQ4v3pgGUs+cWWZOscrc6VxzkdHAGrfxKZMt6z4Qt/R
	FIvWvwBtWxiJlp5gseJg8nozuqB/toYxF+OY1u6LMbde9jXacira8KvYcOHkxB4+nekd4GgyVYinv
	GJwO7Dn0Aj3P2OL5QVdvYh2y9rLb2SE/R+sJGpK1t62TutKRBIq4AePhiNq8VKbi7SKJbrCc/QK6V
	4l6+G5FSorvoeKkhTxU9vaXmyqCny2j/YqFxbY8OA5zbcN/OEyBytSlkP2fRmLgKPDXJMqxEVRf91
	KzmKZjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTfD-00000008azQ-2Y6a;
	Wed, 09 Jul 2025 12:12:39 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRxZ-00000008IHz-0Jmc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752056609; x=1783592609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2+N4smsYfrl5HTf8MH0tIEMC4qA9EcZ/1I6Yj3gLik4=;
  b=ML9NsAJ0VDQgJbosLA28TQ1NKp2wTlYJ8v7tvguQGMfympOykBTUj4Bs
   Q0MIaCm3x/zboMNBrCxTN9BalaH6bgUeJilSH+WA0XnwQcjkH1JPCPgbO
   VF7FBgiTITnjOYoH0kDaKoA2feiSULthuhW/T+C4hDdHSNTL0NkexZBZO
   xlq73f8RENfIaIUneUrcOIC/6ho6fdDr+/iJLk49sMGflwHiKz0ulA4Xg
   zXVJoOGbIpT2DsRNueRgAVL0ZsKHTdf5+vS2gzJOsZw3h0aDKT2MoL0gh
   WsPuepi1tHpGFWlkMyfoOzDMXYcWDi8zkMFrENTZnINRD9D00hE1DBunj
   Q==;
X-CSE-ConnectionGUID: i9OsOHdmTWmG5uYlLTxi9g==
X-CSE-MsgGUID: Hf32U9pKR8OVB3OC4hpBKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79750720"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="79750720"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 03:23:19 -0700
X-CSE-ConnectionGUID: nA7HpcjlRkSUBS07mOfahw==
X-CSE-MsgGUID: 2ZH4Zb0hTQCxpOErnia7Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="160057178"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jul 2025 03:23:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZRxG-0003OT-0W;
	Wed, 09 Jul 2025 10:23:10 +0000
Date: Wed, 9 Jul 2025 18:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, David Wronek <david@mainlining.org>,
	Karel Balej <balejk@matfyz.cz>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, soc@lists.linux.dev,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH v16 3/5] arm64: Kconfig.platforms: Add config for Marvell
 PXA1908 platform
Message-ID: <202507091803.RBsXE3aX-lkp@intel.com>
References: <20250708-pxa1908-lkml-v16-3-b4392c484180@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-pxa1908-lkml-v16-3-b4392c484180@dujemihanovic.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_032329_127905_4046641B 
X-CRM114-Status: UNSURE (   9.72  )
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

[auto build test WARNING on d7b8f8e20813f0179d8ef519541a3527e7661d3a]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi/dt-bindings-mmc-sdhci-pxa-restrict-pinctrl-to-pxav1/20250709-011510
base:   d7b8f8e20813f0179d8ef519541a3527e7661d3a
patch link:    https://lore.kernel.org/r/20250708-pxa1908-lkml-v16-3-b4392c484180%40dujemihanovic.xyz
patch subject: [PATCH v16 3/5] arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
config: arm64-kismet-CONFIG_I2C_GPIO-CONFIG_VIDEO_MMP_CAMERA-0-0 (https://download.01.org/0day-ci/archive/20250709/202507091803.RBsXE3aX-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250709/202507091803.RBsXE3aX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091803.RBsXE3aX-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_GPIO when selected by VIDEO_MMP_CAMERA
   WARNING: unmet direct dependencies detected for I2C_GPIO
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (GPIOLIB [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - VIDEO_MMP_CAMERA [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && I2C [=y] && VIDEO_DEV [=y] && (ARCH_MMP [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

