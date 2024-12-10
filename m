Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFCAE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 05:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igTCdYyaIwphD0t1U/rZIfnFeA86mrVY3DRJjFLu4Co=; b=r7Q41rv598xnGW8vCWoydLXcsd
	xUHfLpm5xR0yc3hWQWDkUMmRZWHxXMbJjOUJXkFCKul/O8aadK0TjMNO/EbfOylgKRDaK4unEZs7J
	G2bvJZik99RNNGO2uLuaZSsSklZ4IcIFLdCjbJ3n0AeRjyJoL3EKvjRiWnWycaOyMOgODPUcVub2R
	t81QMrXr9xVx3o25+EX+WneqYASUqcSrI9gvaverl9Sz1CmBLZG8sCRVYlVNA7Hi0oqNNqxujj/l1
	RW60AVv3svx88EpIIyVsFu+RXMBt//DPpEr8AlBAwRpswN2AGQPHqJguLZO1b4rNzjtjeekplJTTa
	O5yd7yvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKsks-0000000AHIr-2al0;
	Tue, 10 Dec 2024 05:25:54 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKsit-0000000AGtW-0e3q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 05:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733808232; x=1765344232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+yvIxadNHP2tMjc38a6nuEX5dE9n2JekZyl1HOaVL4I=;
  b=O0XYpNFX/PUmwCzs4Ufs2A4EhnjJP+c6bqeqq7jH56zvqIo44lwKOYfi
   6jXRdAh9JBGft5sSImRj2250VJwV6mxT3MR+tebxrSz4LZhyFhE7Fqir8
   sM4A8W8BaGY2gV4WRgFrNRfZzi6g54RIaGjKQBTWfqdfuBTZ84ER8NRfT
   l8AY7RtQ1fPoNfbO3KWpN7lEOB8uz5Be6zaevdwvUpJAsMJCAgy5OSUWQ
   S7grLx0yHuU8UoAHr3nkawSx8hj8+TeVqKpNZMtVSeEIopmxpTnlLvNaC
   mtVreUSslXFxVeGjPgfD5lZu756jnm+J0+rzvxPVCWzcCfY30S5I5qY4N
   A==;
X-CSE-ConnectionGUID: Lwv2OG8tQTSjRCFpef01yQ==
X-CSE-MsgGUID: bIgM9t0hRG2ZfMW0dbtjnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56616477"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="56616477"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 21:23:50 -0800
X-CSE-ConnectionGUID: SyTKH2znT7iIfSGI/sbSmg==
X-CSE-MsgGUID: 8BL6lDlHTTuI51xf1CTxPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="95134854"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Dec 2024 21:23:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKsil-00058Z-1M;
	Tue, 10 Dec 2024 05:23:43 +0000
Date: Tue, 10 Dec 2024 13:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <202412101248.CBSpbBCZ-lkp@intel.com>
References: <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_212351_267577_CF64D619 
X-CRM114-Status: GOOD (  10.79  )
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

Hi Ciprian,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on robh/for-next linus/master v6.13-rc2 next-20241209]
[cannot apply to arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-rtc-add-schema-for-NXP-S32G2-S32G3-SoCs/20241206-151308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20241206070955.1503412-3-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241210/202412101248.CBSpbBCZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101248.CBSpbBCZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101248.CBSpbBCZ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__udivdi3" [drivers/rtc/rtc-s32g.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/rtc/rtc-s32g.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

