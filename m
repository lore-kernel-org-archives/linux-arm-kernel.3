Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F6BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xF1sqIOUpbvfsdCRUFMHXbIdIvZD46hUNTeCFx2AS8=; b=vLSIjZcvX4Vibnf/VGSNWKlBJH
	43jLZ7DBcKjBSsDW5xZF57sGt0eAWAyrdrbDloE+efrOL5nVwoYNAn2d1nBlm/KWgxq164HSIjLSD
	nlY3dKQAbtKhhXOk4Cfh5kvtHv/JsoFWvay/JjErAurNGHqxPLIOZ7c3PiZ/gHj3KniYoKjUk0k9r
	JittRyMAc0UmxbUbIfaUAWm4EZ+LfoIdnX09qbbs38nMAV5650Q5mJPD/4KGEmF6WP5EdH6Vh9znO
	ok8KqCVlIwqgUOH5Gu19PUdXsjJscTioeUDTRp09wE8qsMexaf4hmspNJHbbtqTUud1M5gbHbEnDf
	iwfD6inQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgmM3-0000000D6k6-0Ofy;
	Sat, 08 Feb 2025 15:02:47 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgmKd-0000000D6X4-2fVM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 15:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739026880; x=1770562880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oUdNE/knSRZTMNI0GM2ibbe2wOyiIi4OxLXFL6CD6aw=;
  b=WZpMVik58pyN/F9hQ8vtRNproFK2UHlViNsgSeiU0iinjvapAV+aSKsq
   1MrH5FhHeoCIbB1PncnnmJO/V4lFnzdSMKn0v6mdTgvNfM6G3z+I38cJa
   gx09CEvWXx6KAf0m/ncClMTtrnzyB5OpA3Z5eoguRzwWKSH9Pt9FDenKM
   eWHgSqmxEsP/BuhhAWUnOGdq/5If3vM70H3PpkOiDArZ595HnkMmpaoEV
   QgQ5++shYkY22UKUmdZZQWNzE0CQiFRhT0Fs0xYqDQiKhMCro23JFYMGF
   MkyGi+u2ThYZv/fUz8b3nnB0vLtLtGgNr1O+nBM+/aAsAZjButL5BITyP
   Q==;
X-CSE-ConnectionGUID: Qyd92eMnSdKNodcNCenhVA==
X-CSE-MsgGUID: e022RpD0RCuLLqQCj+NLfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39783863"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39783863"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:01:15 -0800
X-CSE-ConnectionGUID: cFMuT3VZQoi7gUylQgT/aA==
X-CSE-MsgGUID: 6RgaP+1PQOuJ1OaQbZZftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="111613881"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2025 07:01:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgmKQ-00109B-1f;
	Sat, 08 Feb 2025 15:01:06 +0000
Date: Sat, 8 Feb 2025 23:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
	kernel-team@android.com, willmcvicker@google.com,
	peter.griffin@linaro.org, daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v7 2/3] firmware: add Exynos ACPM protocol driver
Message-ID: <202502082233.qjIDyD3Z-lkp@intel.com>
References: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_070119_756832_5FE7542C 
X-CRM114-Status: GOOD (  10.62  )
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

Hi Tudor,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Tudor-Ambarus/dt-bindings-firmware-add-google-gs101-acpm-ipc/20250207-233333
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250207-gs101-acpm-v7-2-ffd7b2fb15ae%40linaro.org
patch subject: [PATCH v7 2/3] firmware: add Exynos ACPM protocol driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250208/202502082233.qjIDyD3Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082233.qjIDyD3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082233.qjIDyD3Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/samsung/exynos-acpm.c:646: warning: expecting prototype for acpm_put_handle(). Prototype was for acpm_handle_put() instead


vim +646 drivers/firmware/samsung/exynos-acpm.c

   640	
   641	/**
   642	 * acpm_put_handle() - release the handle acquired by acpm_get_by_phandle.
   643	 * @handle:	Handle acquired by acpm_get_by_phandle.
   644	 */
   645	static void acpm_handle_put(const struct acpm_handle *handle)
 > 646	{
   647		struct acpm_info *acpm = handle_to_acpm_info(handle);
   648		struct device *dev = acpm->dev;
   649	
   650		module_put(dev->driver->owner);
   651		/* Drop reference taken with of_find_device_by_node(). */
   652		put_device(dev);
   653	}
   654	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

