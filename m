Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAFCCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 22:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nHLKXQqv4xz0J0kuaY8JRE9WZ/zUW409TFegAHOiMc=; b=pfcy/pGRj3k581Ut25OsWj9S2d
	L+APlbDY90foIUujZJYhRJ18e78Bn4A3orfD87c8w8QmayfamUpEUD1onBF9CqJYFRhiT+QSh8/Ap
	H6rS/F5ZiBJR7gvEboXqmaOnoulZbSXl4N7Yt5PFpBKU9ISg5R2Qzuw3US3eifTJ7V+YUqGwkxqj7
	xb0g2YBIAtwl6XYauoxoaPHug3ysgPl92ORDvrrKa8p201tids9fCsy4B1YB4CR35+gqmHq8wtWWh
	3J/drZEoX5ElMiODruzUaR4ftmj0OwdVeRSoZ64c+445vByYn8g+spP7pXuovL4qMYQkwveh1RguK
	dOv+wF4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7iSL-0000000AtKI-04LP;
	Sat, 11 Oct 2025 22:52:53 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7iSI-0000000AtJA-18Ed
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 22:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760223170; x=1791759170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GVmOG10TROUdeXmJov1L7XMMndm0Uh+AWCht1noS0Ts=;
  b=VJx6p7o8usroJdhyBRzBQcuVHCmDDspvAvlyYP9liXpCXu5RYquLBtgi
   ft5+4CQ+zn88Gw16mx+1Uhtl/rdkwGv54/mj5P4TxVGAiJuwHlUh4WUXE
   NxVPBcTIjQP48JYoAeKFpEgH8k3llNEjHuqTYU7quXX1qXgrcjLp0fCAZ
   PTy5uBEBGJQX+fEVnUs2N4jWUSRLnddAWkhKy946e7T2F+fkchU2P/Esw
   ob3GHI62iWqRBnWQbf8UvCIwwuwDgFnJE54iw3ty4WnDehZAAHtbFhTE4
   cL73q2DUqlkkpLo5/qwj9Se68uaYh3jGxkX2+oxTT/XKFREXtlvRHyT+h
   g==;
X-CSE-ConnectionGUID: oce6r8NySAmzXm5IL4uaLA==
X-CSE-MsgGUID: jO4n6e2yT2G56Du7CcUQ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="80045087"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="80045087"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 15:52:44 -0700
X-CSE-ConnectionGUID: nQuqMc/sT76CwsSU/yNfug==
X-CSE-MsgGUID: 6LVI2JFbRTmGaB+sfAiRJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="186548731"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2025 15:52:41 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7iS7-000427-1M;
	Sat, 11 Oct 2025 22:52:39 +0000
Date: Sun, 12 Oct 2025 06:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>, Frank Li <frank.li@nxp.com>,
	arm-scmi@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/2] firmware: imx: sm-misc: Dump syslog info
Message-ID: <202510120607.1JmlmOTI-lkp@intel.com>
References: <20251011-sm-syslog-v2-1-v2-2-f43a3f6b32e4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011-sm-syslog-v2-1-v2-2-f43a3f6b32e4@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_155250_356879_ACBF111B 
X-CRM114-Status: GOOD (  11.33  )
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

Hi Peng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2b763d4652393c90eaa771a5164502ec9dd965ae]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan/firmware-arm_scmi-imx-Support-getting-syslog-of-MISC-protocol/20251011-193459
base:   2b763d4652393c90eaa771a5164502ec9dd965ae
patch link:    https://lore.kernel.org/r/20251011-sm-syslog-v2-1-v2-2-f43a3f6b32e4%40nxp.com
patch subject: [PATCH v2 2/2] firmware: imx: sm-misc: Dump syslog info
config: i386-buildonly-randconfig-001-20251012 (https://download.01.org/0day-ci/archive/20251012/202510120607.1JmlmOTI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120607.1JmlmOTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510120607.1JmlmOTI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/imx/sm-misc.c:55:17: warning: unused variable 'dev' [-Wunused-variable]
      55 |         struct device *dev = file->private;
         |                        ^~~
   1 warning generated.


vim +/dev +55 drivers/firmware/imx/sm-misc.c

    50	
    51	static int syslog_show(struct seq_file *file, void *priv)
    52	{
    53		/* 4KB is large enough for syslog */
    54		void *syslog __free(kfree) = kmalloc(SZ_4K, GFP_KERNEL);
  > 55		struct device *dev = file->private;
    56		/* syslog API use num words, not num bytes */
    57		u16 size = SZ_4K / 4;
    58		int ret;
    59	
    60		if (!ph)
    61			return -ENODEV;
    62	
    63		ret = imx_misc_ctrl_ops->misc_syslog(ph, &size, syslog);
    64		if (ret)
    65			return ret;
    66	
    67		seq_hex_dump(file, " ", DUMP_PREFIX_NONE, 16, sizeof(u32), syslog, size * 4, false);
    68		seq_putc(file, '\n');
    69	
    70		return 0;
    71	}
    72	DEFINE_SHOW_ATTRIBUTE(syslog);
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

