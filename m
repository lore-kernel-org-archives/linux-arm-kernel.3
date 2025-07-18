Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB799C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 00:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6Qvu7oiMgfZ2q4N5+oW48A16Z6NATYRW88w2rN9WUs=; b=NGx/glZTK+y4hT6Crm8L1IajJ0
	5z1CoFs9lnSIj5lmjlB5syfaU9Km9oQ35KcSKlttznY4IqyQX+BDI7JeefOcN5z3yYWQmCCO9rYda
	Ii7T0BUl0FEDbYuHGyvCNJbKUubavRr65viEbCQVk0zGagIMTo/3+3ywzxM3HBghE2eIYZtjjs0A4
	vzGZwK7Adzrs42ga48vkT2ATMrTX63nejZcQbD7AdWuE0TTFJERn9UYrOEsjZg/Guy7gtMisGiuGY
	Iuup2YIcowmfDwEibAa9VTYvbmw14ORCbf2eKoatzZOojiy6Qzf/+pa6hOa9MXHWV47BLHeJQipZR
	cs1qUpVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucYyi-0000000BQ01-1xUd;
	Fri, 18 Jul 2025 00:29:32 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucYwF-0000000BPpU-3FLJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 00:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752798420; x=1784334420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2s19iaScvlr4LwAAreqq4qXppS14HcVbmVXKdPkbTUI=;
  b=W1vwmZySqjfHMSEVUxcIZcqpmpYwNhRIRFoFFfJ/H3kUBGtqOzBwQjyV
   tok2GNCRiVdVGTKMDUPwjcLNtQyqK2yYKKjtCneosAj7qBPgq0mmqgUEJ
   R3Q7D/KaLhOvUoasiUzbcCAO9eD7rex4tlZSSQs2G6s9sIEuA+vDJ9Pvy
   j7J/Iw2GVP1n9DGXTU8PZspRJyTT9bjrJbY2R9CwUr09gUnVjlXp5iUqE
   bYaOhXbhYt7SzBDfEFN+uSSXXwVCb4Gg7oZE7Cemgke0NPhFuL4cIPNth
   bVR3KvRB6m5Gta2OKWTH14M9YugBqb4BX1wH/SAmv0CEbB5gVzjF5SZEx
   A==;
X-CSE-ConnectionGUID: poutGV/yTLmdl25BSwKzrA==
X-CSE-MsgGUID: VL53rvO7Qfu7ICVaRiGbrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54946769"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="54946769"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 17:26:58 -0700
X-CSE-ConnectionGUID: xa/s9jE6RMq3L4doVCOfqA==
X-CSE-MsgGUID: CgZsOIq0Ti2sZFV1e55NhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="181642955"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jul 2025 17:26:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucYw7-000E9v-08;
	Fri, 18 Jul 2025 00:26:51 +0000
Date: Fri, 18 Jul 2025 08:25:55 +0800
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
Message-ID: <202507180835.07NwogM6-lkp@intel.com>
References: <20250716193111.942217-16-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-16-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_172659_861359_AD6AFFA7 
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
config: nios2-kismet-CONFIG_I2C_ATR-CONFIG_VIDEO_MAXIM_SERDES-0-0 (https://download.01.org/0day-ci/archive/20250718/202507180835.07NwogM6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250718/202507180835.07NwogM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180835.07NwogM6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_ATR when selected by VIDEO_MAXIM_SERDES
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

