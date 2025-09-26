Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A197FCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q184UYcB8USHI8/Gl+wcEL7IgQOCmWfgZZA6BkRSvBw=; b=cLixHnlqski0nxVpjorpsoSZql
	H4s1NM3Pc47wekDucPH6RsO4qAKihVOC5wcqSvD8051X1m+HMXqpH8PPlDAW0KZTpX0ydcRYwrw6Y
	+HOqKBVPqNyGyCSm1VIf4y3SmVU/vd6KnPt1VliPGX0lpwLQbb8VFGNRQjTfd93Td2TkzTFrFBikv
	bzLNlPfYtKvfBXwr4w5o2GY4cREozIzA2fZYy2YPF40p83dnBpJ/G7Z3Dtl92/ssYXd+Wkh8GS/Yf
	dy1py2xqm9lfqGfyj07Z3D3oYCBMWq14Ynk/rgNIunxp8BHtKYKz0felSIaFqQ8fky25rIZ7ulhmO
	DQKVKPtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2890-00000001PGo-3UgP;
	Fri, 26 Sep 2025 13:05:50 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v288y-00000001PEh-0ITo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 13:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758891948; x=1790427948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5EckeHvLXOfXBu+wiRZ3U0nu3PJn69N0Omj53rP0XeY=;
  b=BFKUHGgqY28TRaEAC02bnfhx/Wu+efTzlRhFIU3rFiDO6OOzsbpXU5lD
   zFxplLjiez0RGauc75sxeGYb/GmgP/h/GKtuRBGCdxMV5umNpenhoygX4
   GxxZ3meefeDUCNmSaw1SJnl56WrPPkDDrYyi0JvI7L/Tv6zkdBFcqvIyk
   bZuI/32e3DT5r/DWyMXY7ek+oFBVJ9V5PVpre/Ai13ZT6QM58sSTmtJ4q
   lFnjW8OfYiaBFHDKPjYK9x/GJcgrp7rOIjwHjbZisoY+77FfIVoRgJY0f
   nLaaDO/tXVyERIg8wGIs6KR1P9GlKGuuGfrLm7AJoYiukbFCJy9yScJBN
   A==;
X-CSE-ConnectionGUID: p8rdppQATnu8i78nprJBIA==
X-CSE-MsgGUID: 6s6bpKNRTK6sDk+O2L6tiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78656094"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="78656094"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 06:05:48 -0700
X-CSE-ConnectionGUID: bpvbqfG6SXy3K8p9KFjrog==
X-CSE-MsgGUID: rGbEM9WqQCOK7rxoIgHIkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="182777895"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Sep 2025 06:05:43 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v288q-0006F7-0z;
	Fri, 26 Sep 2025 13:05:40 +0000
Date: Fri, 26 Sep 2025 21:05:31 +0800
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
Subject: Re: [PATCH 10/10] firmware: arm_scmi: Use new Telemetry traces
Message-ID: <202509262034.xwphcmtO-lkp@intel.com>
References: <20250925203554.482371-11-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925203554.482371-11-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_060548_155939_134290C1 
X-CRM114-Status: GOOD (  12.20  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on trace/for-next linus/master v6.17-rc7 next-20250925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Marussi/firmware-arm_scmi-Define-a-common-SCMI_MAX_PROTOCOLS-value/20250926-044350
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250925203554.482371-11-cristian.marussi%40arm.com
patch subject: [PATCH 10/10] firmware: arm_scmi: Use new Telemetry traces
config: nios2-randconfig-001-20250926 (https://download.01.org/0day-ci/archive/20250926/202509262034.xwphcmtO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509262034.xwphcmtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509262034.xwphcmtO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/telemetry.c: In function 'scmi_telemetry_tdcf_blkts_parse':
>> drivers/firmware/arm_scmi/telemetry.c:1039:46: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1039 |         trace_scmi_tlm_collect(bts->last_ts, (u64)payld,
         |                                              ^


vim +1039 drivers/firmware/arm_scmi/telemetry.c

  1017	
  1018	static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
  1019						    struct payload __iomem *payld,
  1020						    struct telemetry_shmti *shmti)
  1021	{
  1022		struct telemetry_block_ts *bts;
  1023	
  1024		/* Check for spec compliance */
  1025		if (USE_LINE_TS(payld) || USE_BLK_TS(payld) ||
  1026		    DATA_INVALID(payld) || (PAYLD_ID(payld) != 0)) {
  1027			trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, 0);
  1028			return;
  1029		}
  1030	
  1031		/* A BLK_TS descriptor MUST be returned: it is found or it is crated */
  1032		bts = scmi_telemetry_blkts_lookup(ti->dev, &ti->xa_bts, payld);
  1033		if (WARN_ON(!bts))
  1034			return;
  1035	
  1036		/* Update the descriptor with the lastest TS*/
  1037		scmi_telemetry_blkts_update(shmti->last_magic, bts);
  1038	
> 1039		trace_scmi_tlm_collect(bts->last_ts, (u64)payld,
  1040				       bts->last_magic, "SHMTI_BLK_TS");
  1041	}
  1042	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

