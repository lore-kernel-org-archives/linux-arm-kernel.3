Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ABFC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOAbDah6RV9jYM1zNoWAGqg/MqUKQrzhe+9UX/Uz71M=; b=FpJhsSAmXWbZ0RvteHhZ9ZpdiG
	GPJtv8cQsOKQOP5+CzMuAcQCyHOY+jsLhHUJZRoM82X9YrsLzrmpI3DaYdEqST0uCl8PwLqiQEfSM
	kDl/T87mzr0XZSIAEbtEIET51Ir9Gqc83jSTXW6Dl1HTs1Ol4YDWMoGXva+QB/ZSbvtsjM009LbXT
	srZoZXV+j5Zw4oqDHNERIcHC/yLnz8ZS8yBzA3tQwNKdlMnv3W+/C6MK/Cnyt4sIyyz+T7fHLmBD9
	dkcVA++OdYcu3Xry0Z0b/qvO0mtAhITcqn6Z9H4okHl2foVT0oT3HZ5CQBuZuKwNf30bJyHnyELwj
	tX7v3ooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfw0-0000000GIkA-1q84;
	Fri, 20 Jun 2025 17:53:52 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfjO-0000000GGMP-2KiW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 17:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750441251; x=1781977251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NRGSRyTah5ICBT0QVblczXDuitpxn/LFY+zhFSrKnus=;
  b=KEYSZ7IcR++AAyn3Kfl/qsrDYhoJITcyBzcUm6lgzHo4SzvIcVig3amv
   alnKdLxh5GbptWo8uc+FyP9CTr0CAsdw1yqp7j+DbLiEZh5fnC9xSZ56q
   lEZRrrewJYK/9NTR+rVSjyhUlGUJlyee2hQ/Q/oGZOOGHSDtmSzm5l7vY
   bJsAo17RxxKLCbK9y3M/zsNDIZhb65EXJA06SZQ4Hx+3DUJ/rYrX7M6mc
   MKzPZ3ixloXxH90Z3XBbS/BgjzXIx7ikgdURMH1vPSDpqng0lB28lRPeR
   HGQdcsa3AqgFpOA7r+j5X3RO22ex9AYHBYwfo3I5NEZuIhwprYj9UXOVu
   w==;
X-CSE-ConnectionGUID: In9L3rIaTmWoRhcHHDz8fA==
X-CSE-MsgGUID: eCiFZbLwT1GD47Ee0FBbQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52586072"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="52586072"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 10:40:50 -0700
X-CSE-ConnectionGUID: RH6NSA+vRnOBwGunq1Sriw==
X-CSE-MsgGUID: 967yrwNfSTCe7ac8Cpd9sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="150459518"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Jun 2025 10:40:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSfjI-000M1Q-0R;
	Fri, 20 Jun 2025 17:40:44 +0000
Date: Sat, 21 Jun 2025 01:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <202506210114.2Ix0TkA0-lkp@intel.com>
References: <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_104052_116266_083BCE08 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

[auto build test WARNING on 4325743c7e209ae7845293679a4de94b969f2bef]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/firmware-arm_scmi-bus-Add-pm-ops/20250620-114042
base:   4325743c7e209ae7845293679a4de94b969f2bef
patch link:    https://lore.kernel.org/r/20250620-scmi-pm-v1-2-c2f02cae5122%40nxp.com
patch subject: [PATCH 2/2] firmware: arm_scmi: power_control: Set SCMI_SYSPOWER_IDLE in pm resume
config: arm-randconfig-002-20250621 (https://download.01.org/0day-ci/archive/20250621/202506210114.2Ix0TkA0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506210114.2Ix0TkA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210114.2Ix0TkA0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/scmi_power_control.c:363:12: warning: 'scmi_system_power_resume' defined but not used [-Wunused-function]
     363 | static int scmi_system_power_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/scmi_system_power_resume +363 drivers/firmware/arm_scmi/scmi_power_control.c

   362	
 > 363	static int scmi_system_power_resume(struct device *dev)
   364	{
   365	
   366		struct scmi_syspower_conf *sc = dev_get_drvdata(dev);
   367	
   368		sc->state = SCMI_SYSPOWER_IDLE;
   369	
   370		return 0;
   371	}
   372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

