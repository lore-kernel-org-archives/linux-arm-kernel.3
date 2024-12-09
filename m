Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5868EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 04:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuciiP5+QAD8zCZdD8YgUArgrD449SrB8PxrgIBpS+o=; b=h8G4s+Hx5bSyZOJHbcyQBzKB7b
	xRTtdQl95BKGzTFgiAHjUq6H61e79caZVdNuEAdRSmf/GTIVFWfFcntnFnpS4SVp6GcUVT/sFmRXK
	Rb/HEZDlORpEeiPcpQs6v8NbDvOQJ0wVTz6UnF+h2s/hH1MyYThtbsW0nhhDO7SYnsSQnDimAMo45
	Y3UCmClB3u38qyLor5VT15FkxghqVhpRRdAYlF7aq2e4nxT49jrTjKMWMxhKeOODN8nyz/jPitB5N
	3Inf9Hs6OHc0vsWVHdg4aTB0U6iYxSKVgQp/0npFVliEwItab7Xu8X/qGUCLVqFiufmw9OLciS9KS
	IAaDF5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKUzs-00000006Mqx-19RC;
	Mon, 09 Dec 2024 04:03:48 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKUoa-00000006L9C-2KmN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 03:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733716328; x=1765252328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YuoC4uqSmc3wJVKeMeSTSV3DE3gZxiW5N310Ppia3gc=;
  b=dzTLqwsQJiDRpFAXtNQDb2PCnJqNI8eol208naD7e3wOyrUGnEeMC8RC
   FMkxPVOQCI3MbOmDpdexDkAQf3YxXPqZsxyPN2hZg8ZJjy5ZedIPHX+VW
   zSvqMsJfKMcFExfzEG3h/tvUxQQoKLkwnSOhcLTiD5VA5ehG6rXgQTLzg
   JQ/syGyzarpORfPXbkoHelpnZyZevAedquckmYCy8mSSbbzxJlhNsJl31
   qUfk2gOFutmfrEWAI2BSo5NVN3uaMvhcvjJalc0WRvPTxtFbdeRyWzJoF
   deI/cePArrxgwF/xCsDvFJEwO+vCmK85Ylp/CUkELM85DD1m52m9EQ/bV
   w==;
X-CSE-ConnectionGUID: V2b8y6m8SfCtV6BW79V5lA==
X-CSE-MsgGUID: ifY8nizbTVCujNgrHA11Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37928660"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37928660"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 19:52:08 -0800
X-CSE-ConnectionGUID: 61mX5yYjSXSM468V+JKzcA==
X-CSE-MsgGUID: SAu8U3K1RMygi8HUgCDklg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99898167"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Dec 2024 19:52:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUoS-0003kr-16;
	Mon, 09 Dec 2024 03:52:00 +0000
Date: Mon, 9 Dec 2024 11:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Chan <towinchenmi@gmail.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] MAINTAINERS: Add entries for Apple DWI backlight
 controller
Message-ID: <202412070751.g7TFM5AI-lkp@intel.com>
References: <20241206172735.4310-4-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206172735.4310-4-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_195208_614249_92215C1C 
X-CRM114-Status: GOOD (  11.07  )
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

Hi Nick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Chan/dt-bindings-leds-backlight-apple-dwi-bl-Add-bindings-for-Apple-DWI-backlight/20241207-013254
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241206172735.4310-4-towinchenmi%40gmail.com
patch subject: [PATCH 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412070751.g7TFM5AI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070751.g7TFM5AI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/video/backlight/apple,dwi-bl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

