Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC89C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 14:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mte84v5/360dWxvpVk42a9RZf42Vr2nRCsPp/rTJ8sw=; b=xP1jwCCtiGkqTKKZLp7R+6Gz1K
	lCvkM1WO/lo4adROUBlwIPFjDHjWf7dgZNeO90r4jGyatUU/U7UuUGPYnVpHRPVfL3S0h1oc8A+tG
	de4zxFexHHqdJGzLHWyNxvnnA+2/yRVFzI2mBq2W/AK5egdpEhoVu7dcXyN04wcXPzmlqj2jIAB+6
	pX0O9Ehk1Znpgui8jbqEb9nniYR8a+KZsTaV78Yjzn8kqMQ6zxCwQVTk5tcvl7OkJnSm/3cwYxUZz
	aQdKX/XVttNZ2ypX7VwXybJLffZhS2C9tJzaGROXolHAWHUH+6bfCK4FtolYB/hSMpX2U1Jzwfeei
	35dIPsUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVWch-0000000GsRz-1RpI;
	Sat, 28 Jun 2025 14:33:43 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVWYb-0000000Gs1u-0gy9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 14:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751120970; x=1782656970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ypz8IC0WQ6kWJ6ifXzoS95qT1PT+UG1tXVjgJx0z6wA=;
  b=PqZtYjVETF4BcDUjU06RFGwUEOqXERyjMWWd8YdhJ4J9+B3BYWYoIG30
   8J/rjk8yRk7asUYtt23eN885GVuJftwi+YAqWdSyRLyy69H1R44K+VquT
   F9452/PI0ptPjRGbI6ggOzMiuKS0ZozP2KpioRwFzqLDIhOIBXRezqIgk
   Hn+wQPGSo0KJOdvpht8W1HxaDnFaZVHsY+99dlw73d1Nn8Q7CkBQC1kxZ
   onLvt04FRjnQ8JJsxbxiLsAaQJJfoyaDHNQ5A7a3m+XSM17ykyfu9qRz/
   Ql4o8FdmFecjkwT1qhjTM26Wl6WfYO+oeB3JfHPPaO7j0yUhB58kcbCd0
   w==;
X-CSE-ConnectionGUID: ggetIdA1QRiUJpkcwCCfMA==
X-CSE-MsgGUID: EnBFFb7ERampaoyjfjdjGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="64466453"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="64466453"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 07:29:29 -0700
X-CSE-ConnectionGUID: gMWJbyT6QEO4lAfQvVx2Bw==
X-CSE-MsgGUID: 8sRXDiwWRweoATfN5/zrNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="152433805"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Jun 2025 07:29:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVWYV-000X6s-0K;
	Sat, 28 Jun 2025 14:29:23 +0000
Date: Sat, 28 Jun 2025 22:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
Message-ID: <202506282233.n54Z23oc-lkp@intel.com>
References: <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_072929_263964_534AD94F 
X-CRM114-Status: GOOD (  12.57  )
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

[auto build test WARNING on ecb259c4f70dd5c83907809f45bf4dc6869961d7]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan/firmware-arm_scmi-imx-Add-documentation-for-MISC_BOARD_INFO/20250627-140736
base:   ecb259c4f70dd5c83907809f45bf4dc6869961d7
patch link:    https://lore.kernel.org/r/20250627-sm-misc-api-v1-v1-7-2b99481fe825%40nxp.com
patch subject: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
config: x86_64-buildonly-randconfig-005-20250627 (https://download.01.org/0day-ci/archive/20250628/202506282233.n54Z23oc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506282233.n54Z23oc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506282233.n54Z23oc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/imx/sm-misc.c: In function 'syslog_show':
   drivers/firmware/imx/sm-misc.c:58:18: error: implicit declaration of function 'kmalloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
      58 |         syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
         |                  ^~~~~~~
         |                  mm_alloc
>> drivers/firmware/imx/sm-misc.c:58:16: warning: assignment to 'struct scmi_imx_misc_syslog *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      58 |         syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
         |                ^
   drivers/firmware/imx/sm-misc.c:64:17: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
      64 |                 kfree(syslog);
         |                 ^~~~~
   drivers/firmware/imx/sm-misc.c: In function 'system_info_show':
>> drivers/firmware/imx/sm-misc.c:97:14: warning: assignment to 'struct scmi_imx_misc_system_info *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      97 |         info = kmalloc(sizeof(*info), GFP_KERNEL);
         |              ^
   cc1: some warnings being treated as errors


vim +58 drivers/firmware/imx/sm-misc.c

    46	
    47	static ssize_t syslog_show(struct device *device, struct device_attribute *attr,
    48				   char *buf)
    49	{
    50		struct scmi_imx_misc_sys_sleep_rec *rec;
    51		struct scmi_imx_misc_syslog *syslog;
    52		int ret;
    53		size_t len = 0;
    54	
    55		if (!ph)
    56			return 0;
    57	
  > 58		syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
    59		if (!syslog)
    60			return -ENOMEM;
    61	
    62		ret = imx_misc_ctrl_ops->misc_syslog(ph, sizeof(*syslog), syslog);
    63		if (ret) {
    64			kfree(syslog);
    65			return ret;
    66		}
    67	
    68		rec = &syslog->syssleeprecord;
    69	
    70		len += sysfs_emit_at(buf, len, "Wake Vector = %u\n", rec->wakesource);
    71		len += sysfs_emit_at(buf, len, "Sys sleep mode = %u\n", rec->syssleepmode);
    72		len += sysfs_emit_at(buf, len, "Sys sleep flags = 0x%08x\n", rec->syssleepflags);
    73		len += sysfs_emit_at(buf, len, "MIX power status = 0x%08x\n", rec->mixpwrstat);
    74		len += sysfs_emit_at(buf, len, "MEM power status = 0x%08x\n", rec->mempwrstat);
    75		len += sysfs_emit_at(buf, len, "PLL power status = 0x%08x\n", rec->pllpwrstat);
    76		len += sysfs_emit_at(buf, len, "Sleep latency = %u\n", rec->sleepentryusec);
    77		len += sysfs_emit_at(buf, len, "Wake latency = %u\n", rec->sleepexitusec);
    78		len += sysfs_emit_at(buf, len, "Sleep count = %u\n", rec->sleepcnt);
    79	
    80		kfree(syslog);
    81	
    82		return len;
    83	}
    84	
    85	static DEVICE_ATTR_RO(syslog);
    86	
    87	static ssize_t system_info_show(struct device *device, struct device_attribute *attr,
    88					char *buf)
    89	{
    90		struct scmi_imx_misc_system_info *info;
    91		int len = 0;
    92		int ret;
    93	
    94		if (!ph)
    95			return 0;
    96	
  > 97		info = kmalloc(sizeof(*info), GFP_KERNEL);
    98		if (!info)
    99			return -ENOMEM;
   100	
   101		ret = imx_misc_ctrl_ops->misc_discover_build_info(ph, info);
   102		if (ret)
   103			goto err;
   104	
   105		ret = imx_misc_ctrl_ops->misc_cfg_info(ph, info);
   106		if (ret)
   107			goto err;
   108	
   109		ret = imx_misc_ctrl_ops->misc_silicon_info(ph, info);
   110		if (ret)
   111			goto err;
   112	
   113		ret = imx_misc_ctrl_ops->misc_board_info(ph, info);
   114		if (ret)
   115			goto err;
   116	
   117		len += sysfs_emit_at(buf, len, "SM Version    = Build %u, Commit 08%x\n",
   118				     info->buildnum, info->buildcommit);
   119		len += sysfs_emit_at(buf, len, "SM Config     = %s, mSel=%u\n",
   120				     info->cfgname, info->msel);
   121		len += sysfs_emit_at(buf, len, "Silicon       = %s\n", info->siname);
   122		len += sysfs_emit_at(buf, len, "Board         = %s, attr=0x%08x\n",
   123				     info->brdname, info->brd_attributes);
   124	
   125		ret = len;
   126	err:
   127		kfree(info);
   128		return ret;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

