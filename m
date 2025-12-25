Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153C9E7AD47
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 10:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3VuhndEv9Xsa06AIbYm5KvxEQyv5/0zCxCqxfiNmzU=; b=2HyUesvqqrevi0eNeaYumoLS7A
	pxCHjkQ8LdEhAS8Oah2C2pXmxngn8FHZ75dVzTMhh9oplxB64XwYt5i5gzO88TaDw+fjWibNCIfMn
	1yUkNbzAY0+xklMseXNCY3Vba12LB3tQSYaKwCOkE2iXqxBA07724udplQp6QMMfSC/M54/T2GjQQ
	Mwt6rdNwl5wl6Lv5JXUndIrfTTsfzKXKzkCyO5832sgE5ug/G4nf7wVvaJcY5FDXFNrqw3+Kf0ePn
	BblBY/uz3p/Yv/ie3RRWnMcugYGvhyRBV/opzvKPROAs6xwKT9burcc0snyZIxcZFtRgoR7snAKOr
	OJB+e6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYiPl-00000000Jkl-4BdA;
	Thu, 25 Dec 2025 10:17:50 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYiPi-00000000JkJ-0Xpn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 10:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766657866; x=1798193866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z2zkTqgnaCZ2l0dBJOIwxsTOjEU6LlBHNrA3F5oZGwE=;
  b=iuKcjUPOcFK5K9uyzJyNNSiLHbLP5ziVqFVeRyUFamHvvC/GwvQDoI5x
   eFA7JTWw6pWaf/zvH5wbB24kYFCtGyhAX1dsfIl2QA0zcY2se306VbD1V
   c0/yGLynAulHFECFOLDjgKPYpk0c/7cxg4NQ5GqyZDJhTPzSdIna4YDNM
   hzuWfgYWsocWHJQxU374IFA9RluLBYMr0ls6bQ1xiCH/D0FyZUvtwZyON
   M+0r+zpsGyNxdJmx81ZQiPpg+KcfAjV+64+YYHd1I59uvxQ8y6LQw1rsS
   90B8DJfwUatdmP7wN7xbGxamMt02Oc1v7cBoVGnEGhuGCHMANdCu2szD5
   A==;
X-CSE-ConnectionGUID: xj5U/be0Sm+f0cTLpj4ffg==
X-CSE-MsgGUID: xCmwhzUWQCmdpK7b7SILow==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="71043625"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="71043625"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 02:17:44 -0800
X-CSE-ConnectionGUID: e9oWw/OmSZmybIlP8sqXOQ==
X-CSE-MsgGUID: 6Y9eA6kYTQSsOs36kMHSbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="204698249"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Dec 2025 02:17:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYiPJ-000000003yb-0W6B;
	Thu, 25 Dec 2025 10:17:30 +0000
Date: Thu, 25 Dec 2025 18:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v18 01/10] power: reset: reboot-mode: Remove devres based
 allocations
Message-ID: <202512251820.e0ZKwuCc-lkp@intel.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-1-32fa9e76efc3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-1-32fa9e76efc3@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_021746_321001_45C42336 
X-CRM114-Status: GOOD (  11.93  )
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

Hi Shivendra,

kernel test robot noticed the following build errors:

[auto build test ERROR on cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivendra-Pratap/power-reset-reboot-mode-Remove-devres-based-allocations/20251224-011508
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20251223-arm-psci-system_reset2-vendor-reboots-v18-1-32fa9e76efc3%40oss.qualcomm.com
patch subject: [PATCH v18 01/10] power: reset: reboot-mode: Remove devres based allocations
config: powerpc64-randconfig-r072-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251820.e0ZKwuCc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251820.e0ZKwuCc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251820.e0ZKwuCc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/power/reset/reboot-mode.c:94:10: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      94 |                 info = kzalloc(sizeof(*info), GFP_KERNEL);
         |                        ^
>> drivers/power/reset/reboot-mode.c:94:8: error: incompatible integer to pointer conversion assigning to 'struct mode_info *' from 'int' [-Wint-conversion]
      94 |                 info = kzalloc(sizeof(*info), GFP_KERNEL);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/power/reset/reboot-mode.c:120:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     120 |         kfree(info);
         |         ^
   drivers/power/reset/reboot-mode.c:145:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     145 |                 kfree(info);
         |                 ^
   4 errors generated.


vim +/kzalloc +94 drivers/power/reset/reboot-mode.c

    66	
    67	/**
    68	 * reboot_mode_register - register a reboot mode driver
    69	 * @reboot: reboot mode driver
    70	 *
    71	 * Returns: 0 on success or a negative error code on failure.
    72	 */
    73	int reboot_mode_register(struct reboot_mode_driver *reboot)
    74	{
    75		struct mode_info *info;
    76		struct mode_info *next;
    77		struct property *prop;
    78		struct device_node *np = reboot->dev->of_node;
    79		size_t len = strlen(PREFIX);
    80		u32 magic;
    81		int ret;
    82	
    83		INIT_LIST_HEAD(&reboot->head);
    84	
    85		for_each_property_of_node(np, prop) {
    86			if (strncmp(prop->name, PREFIX, len))
    87				continue;
    88	
    89			if (of_property_read_u32(np, prop->name, &magic)) {
    90				pr_err("reboot mode %s without magic number\n", prop->name);
    91				continue;
    92			}
    93	
  > 94			info = kzalloc(sizeof(*info), GFP_KERNEL);
    95			if (!info) {
    96				ret = -ENOMEM;
    97				goto error;
    98			}
    99	
   100			info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
   101			if (!info->mode) {
   102				ret =  -ENOMEM;
   103				goto error;
   104			} else if (info->mode[0] == '\0') {
   105				kfree_const(info->mode);
   106				ret = -EINVAL;
   107				pr_err("invalid mode name(%s): too short!\n", prop->name);
   108				goto error;
   109			}
   110	
   111			list_add_tail(&info->list, &reboot->head);
   112		}
   113	
   114		reboot->reboot_notifier.notifier_call = reboot_mode_notify;
   115		register_reboot_notifier(&reboot->reboot_notifier);
   116	
   117		return 0;
   118	
   119	error:
 > 120		kfree(info);
   121		list_for_each_entry_safe(info, next, &reboot->head, list) {
   122			list_del(&info->list);
   123			kfree_const(info->mode);
   124			kfree(info);
   125		}
   126	
   127		return ret;
   128	}
   129	EXPORT_SYMBOL_GPL(reboot_mode_register);
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

