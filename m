Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E4FCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 04:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTBLRGUnkRZyk/CE2NkZcFXGgkEZASpU/prI+WBvaPY=; b=2zw2xNi5Yj3sZcnFDH7KY1GIlp
	U2gWQzdHpaOtNm3R2EEtglLOhVA/mXn2HgwRKfbWvGZZ0TTZJwk2MSoE3yEfOfGW85soJoKk5kPfi
	qx6Es8kpgYGsKYeXl9bLOVjFZ4eDaMHBNdD4lSxMyIoP8/S2CgtWhuhm9ilKiFS0V357SKuIHeB+Q
	gXnwQa6H7aFWzbhxmqmOyvTfQzOHJj2nizifyRhlZDDlElRk9ylU/jJD396xKCEbQkYNtAO3g/hBB
	O+7kKa0ZPV0+dkODI+KLOFvWcXKbU7upRsEH/MS3ld4tPjZ10DLS5fqOcuGtWbmpaHGT62B6rWzO2
	gKJGzPbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74do-00000007eWL-0YON;
	Fri, 10 Oct 2025 04:22:04 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74dk-00000007eVq-11eh;
	Fri, 10 Oct 2025 04:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760070120; x=1791606120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V8lVhg40i6i3dzj7FEuSEzfEDeikzBVx4RlBJVsKO+g=;
  b=DyAy+Jo4mSgYOR5KmbPibrOkd2rPrfTgo324XWTlKgGM39bhTU1t9Xgf
   wDAGaFJzzQ8/0ew4Dl5T72D7Gk2vDneAJylkNYu4Tp6uiHm8PrQLP1e0l
   +c1O8zZSpAqoBaFC0nkSv7Z42XG9xcyyHBHaNKpslXaffL43/CtzaXz3m
   /5jtg+Aaysg8YJF7HDnG13dxbKDQtygcSE35yG42/9mlDxNePnp6K1YzC
   YXxLBlrIbFxzMHGg/3NbOwZQ+Wrf6DGJO0QLIwMf0jGBDj6H3O1cC58G0
   3rPrH5oyvJZR+C70ms06LqCEy6tWrJlW99sHqvGln30AAMvlKhEnAYez3
   w==;
X-CSE-ConnectionGUID: yrt+Ktq+Qs+bVgtHA2JNPg==
X-CSE-MsgGUID: +jsXbuhESxGjIOaGvcJXXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="79931638"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="79931638"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 21:22:00 -0700
X-CSE-ConnectionGUID: 7bOHdkV+SSOVseicgkDGvw==
X-CSE-MsgGUID: Ilpw6yfLTLq+oUU9z57IIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180572606"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Oct 2025 21:21:56 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v74dd-00028h-2m;
	Fri, 10 Oct 2025 04:21:53 +0000
Date: Fri, 10 Oct 2025 12:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH 11/19] arm64: dts: amlogic: A4: Add peripherals clock
 controller node
Message-ID: <202510101124.3xwn3STp-lkp@intel.com>
References: <20250930-a4_a5_add_clock_driver-v1-11-a9acf7951589@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-a4_a5_add_clock_driver-v1-11-a9acf7951589@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_212200_293899_0BB707E0 
X-CRM114-Status: UNSURE (   9.33  )
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

Hi Chuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuan-Liu-via-B4-Relay/dt-bindings-clock-Add-Amlogic-A4-SCMI-clock-controller/20250930-174011
base:   01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
patch link:    https://lore.kernel.org/r/20250930-a4_a5_add_clock_driver-v1-11-a9acf7951589%40amlogic.com
patch subject: [PATCH 11/19] arm64: dts: amlogic: A4: Add peripherals clock controller node
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251010/202510101124.3xwn3STp-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101124.3xwn3STp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101124.3xwn3STp-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:119.19-20 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

