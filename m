Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C296C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 21:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3K7K/pwctkQQPOlxIR0V2TBfqxVpiAfQjlilP+qM7RA=; b=UKMC/oXwkQWPDY1bczHU6h78go
	7hbmBR2HNdgGIVFIa0SWbUPT4D5ukh/ZoLQdly2XRGofjJ7Jz3Y41btVzO/fossQGkSKBPotCf5oY
	tNhJkzPbXBn4FDOeCRsQXDdQdT8KMSYxZlZlirwK1IZfSYBikaQf+O+1Vrs930xoH6JD7erto4Jn3
	FZoHn5MtFlFFnywZSDfFvKs9uVo1zieAiDO/AONRGCt6MAu+ggzITQvj96cUzfppmgZFYh9skahOJ
	G6bm5KkxqyFdDnALYC+hi6jEoVQVxEAUg0xzft+RYwHIbLqTaS2TmQAq06FU3JYAZjVaM3H32BM4K
	qRi+axlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZzmp-00000006V0w-03PG;
	Mon, 20 Jan 2025 21:58:23 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZzlX-00000006Umm-0WNT;
	Mon, 20 Jan 2025 21:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737410223; x=1768946223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+EFqRv2B6bqOUlGn1H//PxFNhb+WsAIIPmOfXe+iHC8=;
  b=V37ATh1lWVFnsqHao6c/GxdbOuWiaTb4GvJ4xPhhBAPirQvfNrOck+0V
   oWwl0CjwekViewrAxcLOjW13cXVSS4lyeySUH59jX1egH2MUU6USHWiy3
   tA0jfc7TnsJ1C2QOo2twOfHtN6Uy5SZ0Go/Zpjs1P5fwZf8TGK7MmmYhc
   zBfEIIQ/ku5hTF6vf5Kd1u9VG6VyMJYqKjdpkWuJ+RR3w6+n75GWpUjev
   Rwe86qcXShnJ5TVI8JHwUv+PtfJz4NeQE7nZN3uICnMgMdkikOjszh4+m
   TO6pV9HPBvjiWlxwtLBM9QEwjt+haoQBR5HiB/reDW1U2qEZNFT/mes4z
   A==;
X-CSE-ConnectionGUID: GvedlxLBRhC95nvBeqtL0Q==
X-CSE-MsgGUID: I4+90S/3QFSzIBZo8Ihr9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="40629214"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="40629214"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 13:56:58 -0800
X-CSE-ConnectionGUID: laPeCXdRQ/G3Fm2+VJSATA==
X-CSE-MsgGUID: ZjP2SWxcQoqHHk8fpcJepg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="111612110"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jan 2025 13:56:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZzlL-000XGZ-2v;
	Mon, 20 Jan 2025 21:56:51 +0000
Date: Tue, 21 Jan 2025 05:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
Message-ID: <202501210513.GCec6kts-lkp@intel.com>
References: <20250110074458.3624094-3-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110074458.3624094-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_135703_167326_AF8A931A 
X-CRM114-Status: GOOD (  10.45  )
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

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13 next-20250120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Hewitt/Revert-drm-meson-vclk-fix-calculation-of-59-94-fractional-rates/20250110-154701
base:   linus/master
patch link:    https://lore.kernel.org/r/20250110074458.3624094-3-christianshewitt%40gmail.com
patch subject: [PATCH 2/2] drm/meson: vclk: fix precision in vclk calculations
config: arm-randconfig-r072-20250118 (https://download.01.org/0day-ci/archive/20250121/202501210513.GCec6kts-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210513.GCec6kts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210513.GCec6kts-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/gpib/fmh_gpib/fmh_gpib.o
>> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/meson/meson-drm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

