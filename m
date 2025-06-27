Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2C1C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tklfs+CKEAeJTDJuULibQccH/emyo+qpVcDlmLSm2YQ=; b=eTK4c+MuwaOKgMLfWPjJsB59f9
	9AvN0KpbPoq/drFJoXSuexYlic3hr+lo0lm2r2CPhVUkVoKmbZT1FHEX4JY1pbk59oYqW91wtc1U/
	7bSTWJH4UrnSGNPPt0/oeRz9mPz9qmQW5HzeNKUpdU6HGTnjYg7EUhtccoV7Kopimb55us1On4P7P
	hgRyS00d8kdXv7+l0FGI9Uar86zByB/uCFD1M2DGRnhBntlvgUfhVhS8aPNw9pVOmYOw3GOOMdxme
	Sxl91YQuoVOlGq78Gg7xvd4iXDT4cVzWFVt9/b81E6og0ha+3ZqT8JZJu4rQWEYAAdnOhnQHF5lif
	adW08jxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEp1-0000000FeAu-3XIR;
	Fri, 27 Jun 2025 19:33:16 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVE8v-0000000FX6O-41oA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 18:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751050186; x=1782586186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=narcaFjXVhe4/7r7kPhjOLSPFF8lb9hRlbz3gP5dDG0=;
  b=M4puvIEsAVK2LiXScEm/iXID9GZFFGQhLAs6O97gLlIHEvSvq2JO8Oj5
   AFE4QMa/oWC3Kflskofu75qCO9oFzusxsPBhVx1ZoGJmH7n7NuOBQFcR5
   E3rHzO+Qy9UltjCJUZSaZE0lxmj5/WDP2xhbOOdem6cJ0MfQwf8t/bF/j
   o9Zo+rtauSGg337VlQzKkCbrAfJICN4BiWulUhZ7dCEOCMA/h98/3GX4a
   sAaoUk0x90pu5ppzADAPVv4jRIAQnqXWGgaUZ/1SeJ3t9lT2hs5hxi/JH
   jvWtyvPx4X8WnUKoNGQqhJhUs28pG/J0kuSTtJRwpMeWV2KFYN0kBe6tO
   w==;
X-CSE-ConnectionGUID: MKOv4uF4RH6+Z2sbcOMRiw==
X-CSE-MsgGUID: DwctU1xUSB23B8gmEPa2NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="78810500"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="78810500"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 11:49:37 -0700
X-CSE-ConnectionGUID: A7Edkv01Q/aVxm2Gt3qXJQ==
X-CSE-MsgGUID: Egm5CKSjSTaC/g/ScZ2zJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="152394717"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jun 2025 11:49:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVE8h-000WTG-3D;
	Fri, 27 Jun 2025 18:49:32 +0000
Date: Sat, 28 Jun 2025 02:49:20 +0800
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
Subject: Re: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
Message-ID: <202506280217.aZih1pGT-lkp@intel.com>
References: <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_114946_014329_FDA99C8E 
X-CRM114-Status: GOOD (  11.80  )
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

[auto build test ERROR on ecb259c4f70dd5c83907809f45bf4dc6869961d7]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan/firmware-arm_scmi-imx-Add-documentation-for-MISC_BOARD_INFO/20250627-140736
base:   ecb259c4f70dd5c83907809f45bf4dc6869961d7
patch link:    https://lore.kernel.org/r/20250627-sm-misc-api-v1-v1-7-2b99481fe825%40nxp.com
patch subject: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
config: i386-buildonly-randconfig-001-20250628 (https://download.01.org/0day-ci/archive/20250628/202506280217.aZih1pGT-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506280217.aZih1pGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280217.aZih1pGT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/imx/sm-misc.c:58:11: error: call to undeclared function 'kmalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      58 |         syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
         |                  ^
   drivers/firmware/imx/sm-misc.c:58:11: note: did you mean 'mm_alloc'?
   include/linux/sched/mm.h:16:26: note: 'mm_alloc' declared here
      16 | extern struct mm_struct *mm_alloc(void);
         |                          ^
>> drivers/firmware/imx/sm-misc.c:58:9: error: incompatible integer to pointer conversion assigning to 'struct scmi_imx_misc_syslog *' from 'int' [-Wint-conversion]
      58 |         syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/imx/sm-misc.c:64:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      64 |                 kfree(syslog);
         |                 ^
   drivers/firmware/imx/sm-misc.c:80:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 |         kfree(syslog);
         |         ^
   drivers/firmware/imx/sm-misc.c:97:9: error: call to undeclared function 'kmalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      97 |         info = kmalloc(sizeof(*info), GFP_KERNEL);
         |                ^
>> drivers/firmware/imx/sm-misc.c:97:7: error: incompatible integer to pointer conversion assigning to 'struct scmi_imx_misc_system_info *' from 'int' [-Wint-conversion]
      97 |         info = kmalloc(sizeof(*info), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/imx/sm-misc.c:127:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     127 |         kfree(info);
         |         ^
   7 errors generated.


vim +/kmalloc +58 drivers/firmware/imx/sm-misc.c

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
  > 64			kfree(syslog);
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

