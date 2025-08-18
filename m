Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BD8CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 00:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJghPZDANcUiW5wXtsrqlleYuYJUnUmNG7Z7BobLTXA=; b=xhd83Tcxhhr4x2BZbQe8P5bH+T
	VlrTVVP7xU/QmYCaSlgoYeNlGvJCBB5w/Os1nc+r2Mn4F/KCeE0+w6hLs+gfS81AlR0/+LblMn3UT
	m2QtV4M+TN5EXuKjHVwwhw8todgRR9cy4T6+V+02lGxooYWGK5n06qQhkcLa4MggEqAq3QZ0fvqNi
	Vz9het/XTXbU0/GCP03quE0cSUtZEIueJYzX8iHk4kQhETtDJdkyicEwlPaoCCL2bBaWqeY21llKI
	pckjA4ASoKI0shmUn8iS8Z5a2OaGURyPuk/vh8p1U55GSUBu6gYtkLQOUQ2JZP2lauoxAnWOV7w2o
	9yKqo0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unnYs-00000006Bfk-0RtY;
	Mon, 18 Aug 2025 00:17:18 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unnWI-00000006BWs-27HJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 00:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755476078; x=1787012078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cXw8V/2WdskHtmRrZ40s0eLq9HPcJIsdXKFvs+zG3Fs=;
  b=Bu2oZkq8Y3i9bPiQ6Vm1l+T0E7HYqdWp7qML5U7X3QxABREvoH5uswPO
   mCJMU+lJgXcylk1s9lY3vJM5x7m2TYQFOANt7J70lt5Hx2pxiYJCeSZLD
   kV2pmxquDv9boNpc6xH2GyW3oUDsd0MXUFdKoMSngY50ojZrGEx+mqWvF
   EL9Vd+8LwzxEmL6xjlq1t1rZye4BhkWun00IAsWBRzAjY/1Guj0VS9ivJ
   NMvu1F7L8Ae2xlxwTjX4wWGPgBkiAuJsWzU6HOVFw1YOg0qT8vNAhlPNX
   DkNppZFYYaKghbWOnXLco8pOhVbsXwAHuem6cYNu3sJvJbFoPUz48yZqb
   w==;
X-CSE-ConnectionGUID: O7VQ4xW4SyybUW6oveqqRA==
X-CSE-MsgGUID: TsHoR/UpSJaBBrBBLE4Kew==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68409220"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68409220"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 17:14:34 -0700
X-CSE-ConnectionGUID: rPkKLnjSQ5CNumytd/zTcA==
X-CSE-MsgGUID: Yli3IW/hTpGQPtHWPRWhLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="168250450"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Aug 2025 17:14:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unnW6-000DnH-1M;
	Mon, 18 Aug 2025 00:14:26 +0000
Date: Mon, 18 Aug 2025 08:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, ryabinin.a.a@gmail.com,
	glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
	vincenzo.frascino@arm.com, corbet@lwn.net, catalin.marinas@arm.com,
	will@kernel.org, akpm@linux-foundation.org,
	scott@os.amperecomputing.com, jhubbard@nvidia.com,
	pankaj.gupta@amd.com, leitao@debian.org, kaleshsingh@google.com,
	maz@kernel.org, broonie@kernel.org, oliver.upton@linux.dev,
	james.morse@arm.com, ardb@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, david@redhat.com,
	yang@os.amperecomputing.com
Cc: oe-kbuild-all@lists.linux.dev, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH v3 1/2] kasan/hw-tags: introduce kasan.write_only option
Message-ID: <202508180747.PxkbPnyA-lkp@intel.com>
References: <20250816110018.4055617-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816110018.4055617-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_171438_587090_6D72CD62 
X-CRM114-Status: GOOD (  10.42  )
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

Hi Yeoreum,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Yeoreum-Yun/kasan-hw-tags-introduce-kasan-write_only-option/20250816-190300
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250816110018.4055617-2-yeoreum.yun%40arm.com
patch subject: [PATCH v3 1/2] kasan/hw-tags: introduce kasan.write_only option
config: arm64-randconfig-r053-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180747.PxkbPnyA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180747.PxkbPnyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508180747.PxkbPnyA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/kasan/hw_tags.c: In function 'kasan_enable_hw_tags':
>> mm/kasan/hw_tags.c:433:21: warning: comparison between 'enum kasan_arg_mode' and 'enum kasan_arg_write_only' [-Wenum-compare]
     433 |  if (kasan_arg_mode == KASAN_ARG_WRITE_ONLY_ON &&
         |                     ^~
   mm/kasan/hw_tags.c:435:18: warning: comparison between 'enum kasan_arg_mode' and 'enum kasan_arg_write_only' [-Wenum-compare]
     435 |   kasan_arg_mode == KASAN_ARG_WRITE_ONLY_OFF;
         |                  ^~
>> mm/kasan/hw_tags.c:435:18: warning: statement with no effect [-Wunused-value]
     435 |   kasan_arg_mode == KASAN_ARG_WRITE_ONLY_OFF;
         |   ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +433 mm/kasan/hw_tags.c

   423	
   424	void kasan_enable_hw_tags(void)
   425	{
   426		if (kasan_arg_mode == KASAN_ARG_MODE_ASYNC)
   427			hw_enable_tag_checks_async();
   428		else if (kasan_arg_mode == KASAN_ARG_MODE_ASYMM)
   429			hw_enable_tag_checks_asymm();
   430		else
   431			hw_enable_tag_checks_sync();
   432	
 > 433		if (kasan_arg_mode == KASAN_ARG_WRITE_ONLY_ON &&
   434		    hw_enable_tag_checks_write_only()) {
 > 435			kasan_arg_mode == KASAN_ARG_WRITE_ONLY_OFF;
   436			kasan_flag_write_only = false;
   437			pr_warn_once("System doesn't support write-only option. Disable it\n");
   438		}
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

