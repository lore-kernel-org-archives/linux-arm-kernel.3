Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFB7CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/Xj6MIfy2rEr0XBSI3mnq/0U/KV/IGQQqiSFVW/GHE=; b=iwKkE5ZIwZsaP+x2jShC+cP4/7
	wJ0TOL0QCyhQkElpUdJIQbv5QeH1ve1HE7c8HauzZGA73bO5AjaEh2X2dAnUlIX+eqZihtzYREmbD
	WPWCabQZhvN+UTMlk6GTVX8bIRcQ9FFjxkHZHcPkL8ie7ySgYfm6117YALRkvAy42BGDyoIWv7npm
	TUHink1C1Fz1UPsX/f2JZW5t6Q0BU3fvaR4U8Pd74CSbE0ScrhGk98w0AJqLsy+WVO4EDGkhzUYOv
	uVByUUrH0ZrSMpqavQO8vfajPKM47K2Qg1y+jzcKdzvDALBoiCyMDKLMCLNNYMSgrMCfJbwkxBteB
	1/SNSMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29U1-000000021H5-2G4z;
	Fri, 26 Sep 2025 14:31:37 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29Ty-000000021EI-0Lr4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 14:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758897095; x=1790433095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NVDGDPSRfBOg+IYM2GGQj9xeTSDqNKFZs6gh3u8/io4=;
  b=RHdOn7/CeTM+HOr8J9NFfz+AWFmrXLJbyRHsIDlAkLRyWO6g7WQo01Oz
   7WEofFvnXmz1IHV+K15/j/N2R72apBe7gxco38Hpf9xZBNlC4YRJ8tbcZ
   NSMqvO928wmToqiLSKCwAhUbUxKLcP20ohQAGnFW3qPYhnWN9gA3QfX6d
   /jXuxjwgGI9oOKvbKM2r9yj+2GvfPPdNxheM27ix081O/EPUp2879wOPA
   DPGnzCIxOGKfqEKh/0XKWWBaftyp5U8jwaUI3JGgprBSTWrqYGwuCCwl1
   jP11YiQhV0QHYiLDOJYfDvTB3UAexyBlR8VPUPoBYVjyPD43uXuMnX3fg
   Q==;
X-CSE-ConnectionGUID: vET/0Te+QVKOeHXpgrSqBw==
X-CSE-MsgGUID: tTlEtkjJTgO6DS1B6y0c3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61183958"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61183958"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 07:31:33 -0700
X-CSE-ConnectionGUID: 5AKesJxsQhWElaZ1Al31ag==
X-CSE-MsgGUID: U1ZXK4swSF2PMznGtDjUgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="208377174"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2025 07:31:29 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v29Tc-0006JR-30;
	Fri, 26 Sep 2025 14:31:18 +0000
Date: Fri, 26 Sep 2025 22:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, d-gole@ti.com, souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH 04/10] uapi: Add ARM SCMI definitions
Message-ID: <202509262227.VZVSICFi-lkp@intel.com>
References: <20250925203554.482371-5-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925203554.482371-5-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_073134_160112_6998E25E 
X-CRM114-Status: GOOD (  11.71  )
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

Hi Cristian,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on trace/for-next linus/master v6.17-rc7 next-20250925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Marussi/firmware-arm_scmi-Define-a-common-SCMI_MAX_PROTOCOLS-value/20250926-044350
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250925203554.482371-5-cristian.marussi%40arm.com
patch subject: [PATCH 04/10] uapi: Add ARM SCMI definitions
config: x86_64-buildonly-randconfig-005-20250926 (https://download.01.org/0day-ci/archive/20250926/202509262227.VZVSICFi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509262227.VZVSICFi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509262227.VZVSICFi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/scmi.h:43:1: error: C++ style comments are not allowed in ISO C90
      43 | ///TODO more flags
         | ^
   ./usr/include/linux/scmi.h:43:1: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

