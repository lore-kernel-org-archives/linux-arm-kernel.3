Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A6FCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 19:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eK0v281iYVPia0lyLExRJRG//zVF6ouwpLtZL/1qNs=; b=1TLK8PrnMLXj31C8jExNEGYmv5
	foYLYp/bIVWIZIPffIUkz/rcV2ltaxmuA1W1vJYrQJ4rPP9AxMKCpKhEnDylqAU9TUrRhGnpE+X7O
	Ip5qFaNq51rVin4zx5qlNa5DzQX2cKxZDJqgOfBjX+G/4MR3Ds3kYp819GxaWtc7Xjw5HpX9bs3eT
	bkGMZGwBHIpwORsNDmfQJRT8IviK5GfAdpEntGieH0GZGdKv/9S8lnagnXbOJbDohjdu2/l1qhuSs
	B1/Yizq75hi154GuXtsQ4jCVwJrsVmf/+ib2d/mYawFlDD6AL29S/JO8rWCQjuOf8vJ6LCWgFDGrg
	PTZSuK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EXh-000000046Zb-33DE;
	Fri, 26 Sep 2025 19:55:45 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EXe-000000046Yq-42Rz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 19:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758916543; x=1790452543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4/en2714ap2ZFqNCP8kfV+5pkoXY0sMtWwJD4mcaga8=;
  b=DtgCjDJU8P69N8w69sxKyJuxS46oOW/msfAlfQC0Ow0Dgl9r1QlPBjwH
   nCTzlnqoAbdmQfcG1uCOGcd951hQSXCq/Njvl/8r2lVr343KZnCTcRrBU
   mWhPsTXZR1OqWZjH34BiJdauPIBFcWlrKL+2FtvXPmkj62IJmlPPU9BwC
   OPbG/af1uWVrrsOrG8cowy4jgupGbD4yIWHhvwbYVgQrzsBCWgDprCSHY
   lgf5HKMkEOhUju30fmnEXkJ8PhzlwR90dKkhfQln335QeKfipWff8ezoz
   Z7jCZc+5MSvLDKkx1MCyDM6LJHeMdCupp0UOYOM+DmKx64Cxf20/oQgYr
   A==;
X-CSE-ConnectionGUID: ShDSA1MpSHaaJOQ+AcHb9A==
X-CSE-MsgGUID: ntp4L8B2RnSuFpPlZh8GHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="60466216"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="60466216"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 12:55:42 -0700
X-CSE-ConnectionGUID: Aia+2FF5Rby5L8KX9go0PQ==
X-CSE-MsgGUID: 4x1ZUZK/SzmGTdvzOp6sJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="177545552"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Sep 2025 12:55:37 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2EXR-0006YZ-3A;
	Fri, 26 Sep 2025 19:55:34 +0000
Date: Sat, 27 Sep 2025 03:54:36 +0800
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
Message-ID: <202509270354.Nlj2JlQL-lkp@intel.com>
References: <20250925203554.482371-11-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925203554.482371-11-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_125543_056576_7E47A39F 
X-CRM114-Status: GOOD (  10.65  )
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
[also build test WARNING on trace/for-next linus/master v6.17-rc7 next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Marussi/firmware-arm_scmi-Define-a-common-SCMI_MAX_PROTOCOLS-value/20250926-044350
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250925203554.482371-11-cristian.marussi%40arm.com
patch subject: [PATCH 10/10] firmware: arm_scmi: Use new Telemetry traces
config: m68k-randconfig-r131-20250926 (https://download.01.org/0day-ci/archive/20250927/202509270354.Nlj2JlQL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270354.Nlj2JlQL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509270354.Nlj2JlQL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct eplg *_e @@     got void [noderef] __iomem *eplg @@
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse:     expected struct eplg *_e
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse:     got void [noderef] __iomem *eplg
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1699:24: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1861:25: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1861:25: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1861:25: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1861:25: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1861:25: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1861:25: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1873:33: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1873:33: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1873:33: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1873:33: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1873:33: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1873:33: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1873:33: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1873:33: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1873:33: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1873:33: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1873:33: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1873:33: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1876:40: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1876:40: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1876:40: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1876:40: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1876:40: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1876:40: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1876:40: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1876:40: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1876:40: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1876:40: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1876:40: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1876:40: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1908:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] grp_id @@     got int grp_id @@
   drivers/firmware/arm_scmi/telemetry.c:1908:21: sparse:     expected restricted __le32 [usertype] grp_id
   drivers/firmware/arm_scmi/telemetry.c:1908:21: sparse:     got int grp_id
   drivers/firmware/arm_scmi/telemetry.c:1909:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:1909:22: sparse:     expected restricted __le32 [usertype] control
   drivers/firmware/arm_scmi/telemetry.c:1909:22: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:1910:22: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:1910:22: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1910:22: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:1912:22: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/telemetry.c:1912:22: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1912:22: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/telemetry.c:1921:63: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int num_dwords @@     got restricted __le32 [usertype] num_dwords @@
   drivers/firmware/arm_scmi/telemetry.c:1921:63: sparse:     expected unsigned int num_dwords
   drivers/firmware/arm_scmi/telemetry.c:1921:63: sparse:     got restricted __le32 [usertype] num_dwords
   drivers/firmware/arm_scmi/telemetry.c:1922:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int *dwords @@     got restricted __le32 * @@
   drivers/firmware/arm_scmi/telemetry.c:1922:58: sparse:     expected unsigned int *dwords
   drivers/firmware/arm_scmi/telemetry.c:1922:58: sparse:     got restricted __le32 *
   drivers/firmware/arm_scmi/telemetry.c:907:24: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:907:24: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:907:24: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:907:24: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:919:32: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:919:32: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:919:32: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:919:32: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1025:13: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1025:35: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1026:13: sparse: sparse: dereference of noderef expression
>> drivers/firmware/arm_scmi/telemetry.c:1039:51: sparse: sparse: non size-preserving pointer to integer cast
   drivers/firmware/arm_scmi/telemetry.c:1048:25: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1075:15: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1075:15: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1075:15: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1075:15: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1078:21: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1079:34: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1079:34: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1079:34: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1079:34: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1080:28: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1117:24: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1117:46: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1121:13: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1124:14: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1161:26: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1524:16: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1524:16: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1524:16: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1524:16: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1527:35: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1527:35: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1527:35: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1527:35: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1664:21: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1667:21: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1673:21: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1673:21: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1679:24: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1682:30: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1684:36: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1685:43: sparse: sparse: dereference of noderef expression
   drivers/firmware/arm_scmi/telemetry.c:1686:36: sparse: sparse: dereference of noderef expression

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

