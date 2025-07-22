Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBCDC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 17:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQYM9H1kjx/ByUKtk9cHHUvKVU75K8B1boj53lcuhOc=; b=KUFqIoY7QK+WpnSI/9QnZYZJX4
	UDC+NyOMQnHXFNHbp6+hPczxRmRNAuD9nsRSo6rVqhg4ENByKnoSKIyRriPUmM6jHiEOXWth2boet
	b6Jycj9MX19GQQOATrbFNZtPvETMBWy2c4RYRWhAuXyJcSWzS1qDwJre49ZTNojR1YI4Fm3yVHwcI
	1pTo01P1+hKQ0xRJxVywWXIn6kG7m7SOqaRKro8sAvXURWq81iFDm99wQ2mdJsmHmx8UyMlJBgKuv
	daZ18MeY2HB95ZXmQbNdhXEcDd+J4T2BfWNk2LEpPN9pq1g6dwpClQ9YToLGel2Oxd8ZQlYirKm4u
	vR/jfyyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueH7B-00000003BZ5-08le;
	Tue, 22 Jul 2025 17:49:21 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFbA-00000002z5r-2lj0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 16:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753200733; x=1784736733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wc7sZ3S0IslTIoF+msfigfhqbg/qOeWHRUi0QWVAODE=;
  b=noRFXw3mo9g61CC5++4ueHBHZ0cw7imw5C7X2M5sZtOxTRI+hup2Jo01
   /U060LWnLAyg45zr1upY3BQmGiBkFzWmbl61Y80scD9QoOINgShlz6W5q
   lIl6CM331qHiDeC8CxcbGMpVCfb41Ak45j+t99wxbQmii2bGLOKEp4V4M
   7qo9eLI1bPCRMpO4B4EtLvS97lAYXV6u6fAN65gVUgakLsrlOfV7MT2wH
   7+B/0PBXCv+JimlTmC+0UuZay1Ibr0Xi0o+dzZHaGBgOzt9uRbzesgbL4
   vQCWer7fTno2FU/earI0WP6D2tResf0rMYYTjQH6D3iCprprMt4712Lns
   A==;
X-CSE-ConnectionGUID: X23HcPDITc60U1Nqr7UfOQ==
X-CSE-MsgGUID: HLzXup6DQIqtERf1JHtXHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="59120003"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="59120003"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 09:12:13 -0700
X-CSE-ConnectionGUID: alaIQqnqRbeNo2GEbzjqGQ==
X-CSE-MsgGUID: hA7iUIOoRXahbK6So4MVsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="164835899"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jul 2025 09:12:05 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueFb0-000IVT-21;
	Tue, 22 Jul 2025 16:12:02 +0000
Date: Wed, 23 Jul 2025 00:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Dmitry Baryshkov <lumag@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Elliot Berman <quic_eberman@quicinc.com>,
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v12 4/8] firmware: psci: Implement vendor-specific resets
 as reboot-mode
Message-ID: <202507222304.UhUacchO-lkp@intel.com>
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-4-87bac3ec422e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-arm-psci-system_reset2-vendor-reboots-v12-4-87bac3ec422e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_091212_737093_6950A01E 
X-CRM114-Status: GOOD (  10.16  )
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

Hi Shivendra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 97987520025658f30bb787a99ffbd9bbff9ffc9d]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivendra-Pratap/power-reset-reboot-mode-Add-device-tree-node-based-registration/20250722-023323
base:   97987520025658f30bb787a99ffbd9bbff9ffc9d
patch link:    https://lore.kernel.org/r/20250721-arm-psci-system_reset2-vendor-reboots-v12-4-87bac3ec422e%40oss.qualcomm.com
patch subject: [PATCH v12 4/8] firmware: psci: Implement vendor-specific resets as reboot-mode
config: arm-kismet-CONFIG_REBOOT_MODE-CONFIG_ARM_PSCI_FW-0-0 (https://download.01.org/0day-ci/archive/20250722/202507222304.UhUacchO-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250722/202507222304.UhUacchO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507222304.UhUacchO-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REBOOT_MODE when selected by ARM_PSCI_FW
   WARNING: unmet direct dependencies detected for REBOOT_MODE
     Depends on [n]: POWER_RESET [=n]
     Selected by [y]:
     - ARM_PSCI_FW [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

