Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB37E63CBF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 19:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlawI5NtmWwYtoR/DU0jILnGmf/VxlTwsi+lYo/4ks0=; b=4MTr3rW8RaGJM7/Nqw7lZYaD7g
	JRgeI/RF+ZDhe/bhTANuWyeQyAcZQmRew/2iRJwaDhlObkiseOR5Ij/zDK5ji+9TiWpqIcXoSj84C
	6LMYClRaHovDO4ALUQabO/vzz+izzO4lTPi+tSKnHrZ11pbU82E8W44VrPS8h7Cdq6gSO4EamQAfV
	Y5Ix22MpOdLuNoeORNXbVCHM81CdANpYP+c1CaFZszBru8m1pUEtoxkO1YSogczKeBMlhrtryNymT
	dWk6WMO9X1f/aa+8guoshrt+X7fYECSG0/nkIteaRMj9C9BjF/EqexH17CaIOrTzHnE+VTgFaq8Xz
	lfcJku1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk6EI-0000000BSsN-21at;
	Sun, 25 Jan 2026 19:57:02 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk6EE-0000000BSrv-2bFh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 19:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769371019; x=1800907019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qTKxnEAJp/Ki0VGMVmpt0zh+HCdIB1MFyEaQiBTjsxg=;
  b=gfF/PvdaG2yM4lnrUp+rN+5yfasJtNUx2BbHmPxmhxI3Riywis6MVROO
   9ZSfdOL+K/c3veMpPP7JZIErINIPrbM3HJ/3in9UgfX8lfwPVgV3irFRi
   O0WrJSs4yNvtC/egkV3bhpDLMyqSUpxvzTeJzgZdYZIqHPucfwoZXFdxd
   6QOKxOnmSy4LHbct1YtSKziXm4VVen2yF5VogRcYjs6TV/o6tvehpf3md
   3IcXA9C1xpNCuVL5DtpnwAJaKT8G02oI0tovoF/bf/2zIvq2KC3MD+zXi
   RQKjfSHfLvTzAyP678rnwQi5CqmHU//HuH0qK9d8kdxziLeIZ4t5mwUbo
   Q==;
X-CSE-ConnectionGUID: ZBXDe7lcSuWMA+xxfnlDhQ==
X-CSE-MsgGUID: PK+EWSXwRzmVM5HGtYPqBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70601013"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="70601013"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 11:56:56 -0800
X-CSE-ConnectionGUID: BvjibUp4RkOnR7Ek7NSQDQ==
X-CSE-MsgGUID: D0xhRt44Qv2cUqSn23xRjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207564226"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Jan 2026 11:56:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk6E5-00000000Wba-1WlU;
	Sun, 25 Jan 2026 19:56:49 +0000
Date: Mon, 26 Jan 2026 03:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Lee Jones <lee@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michael Reeves <michael.reeves077@gmail.com>,
	Hector Martin <marcan@marcan.st>, Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH v5 1/2] power: supply: Add macsmc-power driver for Apple
 Silicon
Message-ID: <202601260326.ZuabPAK0-lkp@intel.com>
References: <20260126-b4-macsmc-power-v5-1-302462673b18@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-b4-macsmc-power-v5-1-302462673b18@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_115658_709542_6FB44D29 
X-CRM114-Status: GOOD (  12.90  )
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

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Reeves-via-B4-Relay/power-supply-Add-macsmc-power-driver-for-Apple-Silicon/20260125-211800
base:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
patch link:    https://lore.kernel.org/r/20260126-b4-macsmc-power-v5-1-302462673b18%40gmail.com
patch subject: [PATCH v5 1/2] power: supply: Add macsmc-power driver for Apple Silicon
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260126/202601260326.ZuabPAK0-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260326.ZuabPAK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260326.ZuabPAK0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/power/supply/macsmc-power.c:559:3: error: call to undeclared function 'emergency_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     559 |                 emergency_sync();
         |                 ^
   1 error generated.


vim +/emergency_sync +559 drivers/power/supply/macsmc-power.c

   531	
   532	static void macsmc_power_critical_work(struct work_struct *wrk)
   533	{
   534		struct macsmc_power *power = container_of(wrk, struct macsmc_power, critical_work);
   535		u16 bitv, b0av;
   536		u32 bcf0;
   537	
   538		if (!power->batt)
   539			return;
   540	
   541		/*
   542		 * Avoid duplicate atempts at emergency shutdown
   543		 */
   544		if (power->emergency_shutdown_triggered || system_state > SYSTEM_RUNNING)
   545			return;
   546	
   547		/*
   548		 * EMERGENCY: Check voltage vs design minimum.
   549		 * If we are below BITV, the battery is physically exhausted.
   550		 * We must shut down NOW to protect the filesystem.
   551		 */
   552		if (apple_smc_read_u16(power->smc, SMC_KEY(BITV), &bitv) >= 0 &&
   553		    apple_smc_read_u16(power->smc, SMC_KEY(B0AV), &b0av) >= 0 &&
   554		    b0av < bitv) {
   555			power->emergency_shutdown_triggered = true;
   556			dev_emerg(power->dev,
   557				  "Battery voltage (%d mV) below design minimum (%d mV)! Emergency shutdown.\n",
   558				  b0av, bitv);
 > 559			emergency_sync();
   560			kernel_power_off();
   561		}
   562	
   563		/*
   564		 * Avoid duplicate attempts at orderly shutdown.
   565		 * Voltage check is above this as we may want to
   566		 * "upgrade" an orderly shutdown to a critical power
   567		 * off if voltage drops.
   568		 */
   569		if (power->orderly_shutdown_triggered || system_state > SYSTEM_RUNNING)
   570			return;
   571	
   572		/*
   573		 * Check if SMC flagged the battery as empty.
   574		 * We trigger a graceful shutdown to let the OS save data.
   575		 */
   576		if (apple_smc_read_u32(power->smc, SMC_KEY(BCF0), &bcf0) == 0 && bcf0 != 0) {
   577			power->orderly_shutdown_triggered = true;
   578			dev_crit(power->dev, "Battery critical (empty flag set). Triggering orderly shutdown.\n");
   579			orderly_poweroff(true);
   580		}
   581	}
   582	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

