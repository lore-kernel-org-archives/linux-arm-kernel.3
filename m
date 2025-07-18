Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30979C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 05:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbhlxJiyVG3PmWSVuHMX5x31HK2jOeSSKF6Nv4cEW7w=; b=GzTeCy86MQq7t22WoSrTikKAMz
	mFHjl4mGmzc012ATtcgcIGKb8nE2wU9WSobybTqhQziMtJ9zsrlXQ9zFpkPQ60UqygqL8ebYD5qqr
	w0N75w5uRWjpii08d29naBWF29L81LHl63L/pUVDGTAvL356AQLpAqzM7Ygb2Df+QWQHQEH3m15Va
	lw1T59+MPs+yhvA8GCKTzT+8sLJDN//7Bn6eXvV6kualqJy9VZT3qu9jzlRx1q3IxT/WvISQLJa0I
	CFVvSmKKcdpi/3V7CmTGO18gVxUQ64jrtBQNosudrB2T7JEKmZtC7rVo6ruEJ9MHguaoCKBzCQtz1
	t6beV7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucdbh-0000000BiYV-1kid;
	Fri, 18 Jul 2025 05:26:05 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucdZF-0000000BiRB-27XR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 05:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752816213; x=1784352213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BQJ7u5QzwImJwqXT1jKBzsgWbTNy67I2QOWlDIjq+GQ=;
  b=e7RLYmTdNZw0TFrV6+WJM6r1eaddNYH0KwAnRPw/Trma9EQAOGsm1JEF
   KM5ng9j+woBaaYLkeoc+e3SrGb2l9QADB1oMugh3g+d1RzddyrltN1Lcm
   Sut9CQUAV3GNLkrLKhggfaaRXl+mozahbyfFFA13YwXv6M1LytRgin/Gp
   zZV+KbtY3p4/TNg1Ezmzuz0gljoaLl7VTH4bxJKmHDQy6yycD862nEC1R
   1sh3K7AinWBl+S3pU7MnNIAXCIovGcnk+a+1t9fnHvCC0TzOhPcWR3ld7
   od09VW1BHGjz1u4Z9no8EG/XD18ItpUYemmtm6ETUDG0LTQMNLRoX72w2
   Q==;
X-CSE-ConnectionGUID: oq/+gh5qTRao3P5HKxeKZw==
X-CSE-MsgGUID: XUabs+KYTv2Wf9bq4GIW4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="66553129"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="66553129"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 22:23:29 -0700
X-CSE-ConnectionGUID: 9YZ4ahgLSm6fv/JuvQz3FA==
X-CSE-MsgGUID: 1ennyicLQFSBDdJbAUwcQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="158087118"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jul 2025 22:23:23 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucdZ2-000EKN-0K;
	Fri, 18 Jul 2025 05:23:20 +0000
Date: Fri, 18 Jul 2025 13:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 20/24] media: i2c: maxim-serdes: add MAX9296A driver
Message-ID: <202507181514.fwoTNxka-lkp@intel.com>
References: <20250716193111.942217-21-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-21-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_222333_582182_CCD1CD4A 
X-CRM114-Status: GOOD (  12.59  )
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

Hi Cosmin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250716]
[also build test WARNING on v6.16-rc6]
[cannot apply to robh/for-next staging/staging-testing staging/staging-next staging/staging-linus arm64/for-next/core linus/master v6.16-rc6 v6.16-rc5 v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/media-mc-Add-INTERNAL-pad-flag/20250717-033901
base:   next-20250716
patch link:    https://lore.kernel.org/r/20250716193111.942217-21-demonsingur%40gmail.com
patch subject: [PATCH v6 20/24] media: i2c: maxim-serdes: add MAX9296A driver
config: i386-randconfig-063-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181514.fwoTNxka-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181514.fwoTNxka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181514.fwoTNxka-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/maxim-serdes/max9296a.c:1205:27: sparse: sparse: symbol 'max96714_rlms_reg_sequence' was not declared. Should it be static?

vim +/max96714_rlms_reg_sequence +1205 drivers/media/i2c/maxim-serdes/max9296a.c

  1199	
  1200	/*
  1201	 * These register writes are described as required in MAX96714 datasheet
  1202	 * Page 53, Section Register Map, to optimize link performance in 6Gbps
  1203	 * and 3Gbps links for all cable lengths.
  1204	 */
> 1205	const struct reg_sequence max96714_rlms_reg_sequence[] = {
  1206		{ MAX9296A_RLMS3E(0), 0xfd },
  1207		{ MAX9296A_RLMS3F(0), 0x3d },
  1208		{ MAX9296A_RLMS49(0), 0xf5 },
  1209		{ MAX9296A_RLMS7E(0), 0xa8 },
  1210		{ MAX9296A_RLMS7F(0), 0x68 },
  1211		{ MAX9296A_RLMSA3(0), 0x30 },
  1212		{ MAX9296A_RLMSA5(0), 0x70 },
  1213		{ MAX9296A_RLMSD8(0), 0x07 },
  1214	};
  1215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

