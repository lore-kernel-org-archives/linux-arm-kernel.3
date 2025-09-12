Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2F2CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 00:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4K9hmE0/Fx+jhdDSAZ5UlUxLxvwWNTOGKavjGuAawqQ=; b=UfCLnl2F1YpXbx+zTwM/cBnGbv
	VvoxwimnbbSVb+dlLg9eRu0OzQY7h3w9eSoj09+ZU1KC1iQyXxrXtXfoGB+3Z33hQdHKhwvuMUWRN
	kiVCCnyKMkej1fgUzf4+fZLVwHmxR5VP6C0QMIka33xMguuGR/3Px4CL+ukykFmDGNJpQFvJYl0qu
	3zX7MgZU/GN8/+dv9j6LoluNn9zNWSJKMWX+pWU6ezzX2/spGPoZczUoTouBXuemBmOqqIr4+Cnpv
	/HbVWeNsEWwjBASNY0R5cM+ZKXom0XOc7kj1OEtJwuTMcnyk88rrl7WqHj6VkocNNcgKy8nY9K3zb
	tioB/hWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwrL7-00000006120-2C9k;
	Fri, 12 Sep 2025 00:08:33 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwrL4-0000000610U-10tx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 00:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757635710; x=1789171710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UxcuXC6sExcpG8BeW6MP7jgxfMtnH1Fa8tN/NA404Fg=;
  b=NPcHy8dVB0iuvC5pQB64RBtcao1jIpE4xNT+WfIoc/WSsQ75R+37P58c
   j3IIdXvUFDH8lYPJDBAJ5lLBJJ83lmlCDV5m5T4W9XzedVbOHPbeL8njA
   bw8DaUSrV1jEnmw9ExrNVk4SfQSBjqoWx7zyiB5Xr6pYxMMXHuMDuvrWf
   84bWNdm6L2ukojSLkBe2dh48i/1Ku4AgbuRIVv7s1CglNKSN0D/NK7iMH
   iRFLL8UxUlW8OUNsLt4H3VYcZBmS8jhNpfOuyQuY9f5vFcfKtbTEJ6osK
   iEf3tP4b8a3x7ziE6tg33BdIsf4IVRDl03pUOyFBHvCyP3VENFyOgCVYi
   Q==;
X-CSE-ConnectionGUID: zmoXSDRuRlCl0xGFcwB7gg==
X-CSE-MsgGUID: XA0p6taoRfyPrZypKihfhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60040655"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60040655"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 17:08:29 -0700
X-CSE-ConnectionGUID: JkE15ZKyT4Wcs/nc8sjVrw==
X-CSE-MsgGUID: jm0+/LUrS322nD6lO7OCzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="178163399"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Sep 2025 17:08:26 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwrKx-0000iO-2Z;
	Fri, 12 Sep 2025 00:08:23 +0000
Date: Fri, 12 Sep 2025 08:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	arm-scmi@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: imx: sm-misc: Dump syslog info
Message-ID: <202509120758.omltrDMi-lkp@intel.com>
References: <20250910-sm-syslog-v1-2-5b36f8f21da6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-sm-syslog-v1-2-5b36f8f21da6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_170830_324164_DE74CBF2 
X-CRM114-Status: GOOD (  12.18  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 65dd046ef55861190ecde44c6d9fcde54b9fb77d]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan/firmware-arm_scmi-imx-Support-getting-syslog-of-MISC-protocol/20250910-223316
base:   65dd046ef55861190ecde44c6d9fcde54b9fb77d
patch link:    https://lore.kernel.org/r/20250910-sm-syslog-v1-2-5b36f8f21da6%40nxp.com
patch subject: [PATCH 2/2] firmware: imx: sm-misc: Dump syslog info
config: i386-buildonly-randconfig-004-20250912 (https://download.01.org/0day-ci/archive/20250912/202509120758.omltrDMi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509120758.omltrDMi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509120758.omltrDMi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/imx/sm-misc.c:54:39: error: use of undeclared identifier 'SZ_4K'
      54 |         void *syslog __free(kfree) = kmalloc(SZ_4K, GFP_KERNEL);
         |                                              ^
>> drivers/firmware/imx/sm-misc.c:54:39: error: use of undeclared identifier 'SZ_4K'
>> drivers/firmware/imx/sm-misc.c:54:39: error: use of undeclared identifier 'SZ_4K'
   drivers/firmware/imx/sm-misc.c:56:13: error: use of undeclared identifier 'SZ_4K'
      56 |         u16 size = SZ_4K / 4;
         |                    ^
   drivers/firmware/imx/sm-misc.c:64:14: error: use of undeclared identifier 'SZ_4K'
      64 |                 if (size > SZ_4K / 4) {
         |                            ^
   drivers/firmware/imx/sm-misc.c:64:14: error: use of undeclared identifier 'SZ_4K'
   drivers/firmware/imx/sm-misc.c:64:14: error: use of undeclared identifier 'SZ_4K'
   7 errors generated.


vim +/SZ_4K +54 drivers/firmware/imx/sm-misc.c

    49	
    50	static int syslog_show(struct seq_file *file, void *priv)
    51	{
    52		struct device *dev = file->private;
    53		/* 4KB is large enough for syslog */
  > 54		void *syslog __free(kfree) = kmalloc(SZ_4K, GFP_KERNEL);
    55		/* syslog API use num words, not num bytes */
    56		u16 size = SZ_4K / 4;
    57		int ret;
    58	
    59		if (!ph)
    60			return -ENODEV;
    61	
    62		ret = imx_misc_ctrl_ops->misc_syslog(ph, &size, syslog);
    63		if (ret) {
    64			if (size > SZ_4K / 4) {
    65				dev_err(dev, "syslog size is larger than 4KB, please enlarge\n");
    66				return ret;
    67			}
    68		}
    69	
    70		seq_hex_dump(file, " ", DUMP_PREFIX_NONE, 16, sizeof(u32), syslog, size * 4, false);
    71		seq_putc(file, '\n');
    72	
    73		return 0;
    74	}
    75	DEFINE_SHOW_ATTRIBUTE(syslog);
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

