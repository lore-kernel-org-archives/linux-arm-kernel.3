Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826FDC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULf5p4iyc/rpc+brScYeHoFj0F/8Xr7XnVO3qStJl20=; b=eNJYFZQjz8Hl2+qqGV7yqHx1Od
	l6lLHynCkt8sB+kywGCjN4SQtCUBM4MCaNSI0FSE3UmtjNrmYmnz8m6gTQ1/D5FGM5bLjSNCHU6Rs
	nespYdL20UALS1629uk0lp6qFcJg81LnfUHqtYrc1E6hbdvd1TdLyWOauEEnBJoEMZ8BQQVkDrJpZ
	GVix8hGdMTKhiZZPGAcW0YY5XHToNS8yZAM7tS9kG7wrN4gsaBn9vZYXdkPRdmFGqdTmW3zZChY8Q
	iYO8nrUgYiJfExx2TbphHLihBM3uM4xMTtonww9mDtVsnL/W3pYkR2M00600rFg8qYKQlRo+ZlY1A
	DvxLbsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Rs-0000000DShv-0964;
	Fri, 11 Jul 2025 01:21:12 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2LP-0000000DPXW-32xI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 01:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752196472; x=1783732472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q6bgf8nbsmbq7qhLfWYwY4RarY9tPzXyKzdsj2l6iwc=;
  b=AUVkKRShHyqQVggD0hmWZ2EPddyPK5yICgjqwS/ziVzYNw+AuppgIqvW
   PB8vxo0Jz0SG6l4ATmExWkvO3XEOn6cuSQXPgjxrAp+BPmLmJlYfUvXTP
   w7koSzkKbZ/uKP43JEbfw8HZVFg76ytCEHapDAhThxWdCy10WgQiUzRww
   fUblfuXsJX8GCKzQWwcwDXtMmNPmF/cmrbwh0+x3ZCcRTgIB7CL/mJaky
   eiUs6lzsTbKdW8Xy2F4wQJf6H46pa02Z7rGY4buMpamJ4Ab0Ifohyg7yg
   ww/hx9Qlc1fUgHuvtcbHkprf1M4f80jrRSZbpsnVCkZUwYL5a47hxbKmC
   w==;
X-CSE-ConnectionGUID: DiJR29eIQtK3m9niUM6NyA==
X-CSE-MsgGUID: GZf6BH3dQEy0wotScOvy+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65940551"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="65940551"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 18:14:29 -0700
X-CSE-ConnectionGUID: vsVsUFYdRBmlwmDGaNYNHA==
X-CSE-MsgGUID: b/jQH0PhRbS5yqpTSE21Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="187242746"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Jul 2025 18:14:21 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua2LC-0005h9-0j;
	Fri, 11 Jul 2025 01:14:18 +0000
Date: Fri, 11 Jul 2025 09:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Elliot Berman <elliotb317@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Andre Draszik <andre.draszik@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v10 01/10] power: reset: reboot-mode: Add device tree
 node-based registration
Message-ID: <202507110849.ahNmViin-lkp@intel.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_181431_806455_7FDDCF3C 
X-CRM114-Status: GOOD (  14.17  )
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

[auto build test ERROR on 58ba80c4740212c29a1cf9b48f588e60a7612209]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivendra-Pratap/power-reset-reboot-mode-Add-device-tree-node-based-registration/20250710-172104
base:   58ba80c4740212c29a1cf9b48f588e60a7612209
patch link:    https://lore.kernel.org/r/20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85%40oss.qualcomm.com
patch subject: [PATCH v10 01/10] power: reset: reboot-mode: Add device tree node-based registration
config: i386-buildonly-randconfig-006-20250711 (https://download.01.org/0day-ci/archive/20250711/202507110849.ahNmViin-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507110849.ahNmViin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507110849.ahNmViin-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/power/reset/reboot-mode.c:15:9: warning: 'pr_fmt' macro redefined [-Wmacro-redefined]
      15 | #define pr_fmt(fmt)     "reboot-mode: " fmt
         |         ^
   include/linux/printk.h:397:9: note: previous definition is here
     397 | #define pr_fmt(fmt) fmt
         |         ^
>> drivers/power/reset/reboot-mode.c:86:10: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      86 |                 info = kzalloc(sizeof(*info), GFP_KERNEL);
         |                        ^
>> drivers/power/reset/reboot-mode.c:86:8: error: incompatible integer to pointer conversion assigning to 'struct mode_info *' from 'int' [-Wint-conversion]
      86 |                 info = kzalloc(sizeof(*info), GFP_KERNEL);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/power/reset/reboot-mode.c:94:4: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      94 |                         kfree(info);
         |                         ^
   drivers/power/reset/reboot-mode.c:139:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     139 |                 kfree(info);
         |                 ^
   1 warning and 4 errors generated.


vim +/kzalloc +86 drivers/power/reset/reboot-mode.c

    13	
    14	#define PREFIX "mode-"
  > 15	#define pr_fmt(fmt)	"reboot-mode: " fmt
    16	
    17	struct mode_info {
    18		const char *mode;
    19		u32 magic;
    20		struct list_head list;
    21	};
    22	
    23	static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
    24						  const char *cmd)
    25	{
    26		const char *normal = "normal";
    27		struct mode_info *info;
    28		char cmd_[110];
    29	
    30		if (!cmd)
    31			cmd = normal;
    32	
    33		list_for_each_entry(info, &reboot->head, list)
    34			if (!strcmp(info->mode, cmd))
    35				return info->magic;
    36	
    37		/* try to match again, replacing characters impossible in DT */
    38		if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
    39			return 0;
    40	
    41		strreplace(cmd_, ' ', '-');
    42		strreplace(cmd_, ',', '-');
    43		strreplace(cmd_, '/', '-');
    44	
    45		list_for_each_entry(info, &reboot->head, list)
    46			if (!strcmp(info->mode, cmd_))
    47				return info->magic;
    48	
    49		return 0;
    50	}
    51	
    52	static int reboot_mode_notify(struct notifier_block *this,
    53				      unsigned long mode, void *cmd)
    54	{
    55		struct reboot_mode_driver *reboot;
    56		unsigned int magic;
    57	
    58		reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
    59		magic = get_reboot_mode_magic(reboot, cmd);
    60		if (magic)
    61			reboot->write(reboot, magic);
    62	
    63		return NOTIFY_DONE;
    64	}
    65	
    66	/**
    67	 * reboot_mode_register - register a reboot mode driver
    68	 * @reboot: reboot mode driver
    69	 * @np: Pointer to device tree node
    70	 *
    71	 * Returns: 0 on success or a negative error code on failure.
    72	 */
    73	int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np)
    74	{
    75		struct mode_info *info;
    76		struct property *prop;
    77		size_t len = strlen(PREFIX);
    78		int ret;
    79	
    80		INIT_LIST_HEAD(&reboot->head);
    81	
    82		for_each_property_of_node(np, prop) {
    83			if (strncmp(prop->name, PREFIX, len))
    84				continue;
    85	
  > 86			info = kzalloc(sizeof(*info), GFP_KERNEL);
    87			if (!info) {
    88				ret = -ENOMEM;
    89				goto error;
    90			}
    91	
    92			if (of_property_read_u32(np, prop->name, &info->magic)) {
    93				pr_err("reboot mode %s without magic number\n", info->mode);
  > 94				kfree(info);
    95				continue;
    96			}
    97	
    98			info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
    99			if (!info->mode) {
   100				ret =  -ENOMEM;
   101				goto error;
   102			} else if (info->mode[0] == '\0') {
   103				kfree_const(info->mode);
   104				ret = -EINVAL;
   105				pr_err("invalid mode name(%s): too short!\n", prop->name);
   106				goto error;
   107			}
   108	
   109			list_add_tail(&info->list, &reboot->head);
   110		}
   111	
   112		reboot->reboot_notifier.notifier_call = reboot_mode_notify;
   113		register_reboot_notifier(&reboot->reboot_notifier);
   114	
   115		return 0;
   116	
   117	error:
   118		list_for_each_entry(info, &reboot->head, list)
   119			kfree_const(info->mode);
   120	
   121		return ret;
   122	}
   123	EXPORT_SYMBOL_GPL(reboot_mode_register);
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

