Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD49AD2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 21:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=papPZKfgf6g/LbJ81R5zzJITyEsbG0T8vhhaW/ftuF4=; b=XkOHiwz9N3fwtwOztAsZRT34CW
	OhoKJTKWszdZcIH/1v+ZmpsnhVx3zarsvxhnADNqzguY1QqADlAfS4fJRNWrVyBUsxvAwGfjJea42
	JZRQA6b52mfDe7xxTAxv8m3qZLrE+RDaMTn7U92zsuYkKGC9kTc2DczkmtdX8uFJT96w0DPY1D6bU
	KyeK0evR4kdvnNN7JXiJ5sxLWzynlRnY7he+RBF2dgpuCrc89Mv8RcfAzci/3tK7OrRMc843llNNa
	Xy3luw3/DT2fMdVgpJxYOvP96xUeKsRK2eIIoYTFKrR4vo70QWk75xXwSvtzRlU9lZbE6yoDJhLnu
	K24DKiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf32v-00000004WKb-3yMF;
	Sun, 11 Jan 2026 21:32:25 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf32t-00000004WK8-1fBM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 21:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768167144; x=1799703144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Nk1rOCbYTkMcERaK9hA5ecLevxlzHGu0FanXnLo6Jw=;
  b=CXNmXYPInLxVjdoVmQbViWNpA+KWkKMMEcV5nZL1Dj/trvquMkp5vsBT
   5bDvRszPq56XnM9LWbWbWd5NIdkyCSK04bQ7WwjOdVjh4Ywn+hTuqzqZa
   mf3i98UFl08zTquH0DbXi80XCV8V1iYL+76VjR4jJdq07PiGyPUTZLNRq
   Kd7Tqffs45s9PZXH4mQ6/pj3yZ2bwklYEbnRiFfKUyd3bJQEr1n7oeOcs
   Afvq/hSqqhGxxTlz/2ZIqOZECvZHEHOldAxPxYDnaOgdwpJXgqO5b8uxP
   eY9F7D+lKYYgehaxiFI5gDLB5JxD/gnNHOx9OAilFXKwyg7+k9UXUbKXU
   Q==;
X-CSE-ConnectionGUID: P5VJsuA0Tzu9x1QuWiYZZA==
X-CSE-MsgGUID: E4lVf2VTRa+zm+4ZGUP8nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69435573"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69435573"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 13:32:22 -0800
X-CSE-ConnectionGUID: 8cAx/cjoTwGAmwzQCdIpvw==
X-CSE-MsgGUID: 6suiHwoSQlSMXPzUIGBzvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204649709"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jan 2026 13:32:19 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf32m-000000000Uf-3gDj;
	Sun, 11 Jan 2026 21:32:16 +0000
Date: Sun, 11 Jan 2026 22:32:12 +0100
From: kernel test robot <lkp@intel.com>
To: "Duje =?utf-8?Q?Mihanovi=C4=87"?= <duje@dujemihanovic.xyz>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [soc:newsoc/pxa1908 3/5] kismet: WARNING: unmet direct
 dependencies detected for I2C_GPIO when selected by VIDEO_MMP_CAMERA
Message-ID: <202601112252.ESeFIwHK-lkp@intel.com>
User-Agent: s-nail v14.9.25
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_133223_502333_0B2B9A99 
X-CRM114-Status: UNSURE (   7.61  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git newsoc/pxa1908
head:   f3e7970d0e65d98ce964a997e9e990d802bffdfc
commit: 1eb07e99ef39808612e12edaac6ef10f27485a27 [3/5] arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
config: arm64-kismet-CONFIG_I2C_GPIO-CONFIG_VIDEO_MMP_CAMERA-0-0 (https://download.01.org/0day-ci/archive/20260111/202601112252.ESeFIwHK-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260111/202601112252.ESeFIwHK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601112252.ESeFIwHK-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_GPIO when selected by VIDEO_MMP_CAMERA
   WARNING: unmet direct dependencies detected for I2C_GPIO
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (GPIOLIB [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - VIDEO_MMP_CAMERA [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && I2C [=y] && VIDEO_DEV [=y] && (ARCH_MMP [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

