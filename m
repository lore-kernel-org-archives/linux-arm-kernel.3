Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87612C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 01:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewtGpU35DiuOl7YTXVyRk8R69HhmRKD27UFm9GGTCME=; b=eoUScc0H90ttKDBSYn+xCK+e9J
	r16w9bnIpuJrE49Og+AEIQZmKlGv4wx1GmJSGbdORbnlROfPYHNN//boyrCzrROS/36EosRaBxeix
	DV6rUD5Xp1PfOedVRh93FTFwz8cHW4265d4YuOFvGBT7LwFTUeg9fkFQSvR6Onla1+Elb6Mh2aHHY
	66LKr9eyhHeCF7uQNrZhL5fFmxBSbowGiuIOjDiI92avVK7962adF2ujUJGd2z0R4odCDnYGz+Kvf
	T9v8XIhEJ2tHnFgSNtAt2DS+sv+tyWOtF+ZThB6T6EYzjW+XWMyw18gF2ciCMaCDZcY4Axmxcz/gh
	GqgdrtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uca7y-0000000BTkm-0plS;
	Fri, 18 Jul 2025 01:43:10 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uca35-0000000BT1S-1PLh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 01:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752802687; x=1784338687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gxsb4twQZ7MutHEiCFwLHr/tvz7swWwvohxSb9zPqnI=;
  b=gu8O2m3QtT6P4Lu2eH7duf9b5S7bsaT/28YgRvjMP/UDzmNzDmpD5f6I
   /i1oelKweg3mvsb/fmdMrV/Fo/lrZOrPnqFwjNY7TQUX+aSxSBFlVtY8w
   IO0WR1ffnRDCp+P9lF9MwRR3/S9616e1AjIe432phxADhWDfpN9xw3o2/
   uZERsA2/eWU7GgPLv2StvAInWdpFqKMgydd53FaKKKBbfYnjat/TFNtK8
   llCQLfFzm2Vx2iYyNO+S/9RWbbELJYI3ru+OAf7vOgwxzxvyskA4/KjKS
   UTlI5mwUv0G65EZ66jQas0wfx98RdtxbzIfqccoUjfuiOU/B7l8+pegYq
   A==;
X-CSE-ConnectionGUID: UnT3PicaTqmF7/G/VLahiQ==
X-CSE-MsgGUID: Q/+bXWrGSAOvhc6tf55FSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72661796"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="72661796"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 18:38:03 -0700
X-CSE-ConnectionGUID: Z2UUVbOuQFuAmZyMGnYsEA==
X-CSE-MsgGUID: 5uXw69UySuOliODhA/VrLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="162216196"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jul 2025 18:37:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uca2u-000ECp-2C;
	Fri, 18 Jul 2025 01:37:56 +0000
Date: Fri, 18 Jul 2025 09:37:14 +0800
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
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 15/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer framework
Message-ID: <202507180909.8Mnk3jkp-lkp@intel.com>
References: <20250716193111.942217-16-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-16-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_183807_410485_85D8222D 
X-CRM114-Status: GOOD (  11.28  )
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
patch link:    https://lore.kernel.org/r/20250716193111.942217-16-demonsingur%40gmail.com
patch subject: [PATCH v6 15/24] media: i2c: add Maxim GMSL2/3 serializer and deserializer framework
config: nios2-kismet-CONFIG_I2C_MUX-CONFIG_VIDEO_MAXIM_SERDES-0-0 (https://download.01.org/0day-ci/archive/20250718/202507180909.8Mnk3jkp-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250718/202507180909.8Mnk3jkp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180909.8Mnk3jkp-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_MUX when selected by VIDEO_MAXIM_SERDES
   WARNING: unmet direct dependencies detected for I2C_MUX
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - VIDEO_MAXIM_SERDES [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for I2C_ATR
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - VIDEO_MAXIM_SERDES [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

