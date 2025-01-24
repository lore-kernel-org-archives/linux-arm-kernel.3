Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF62FC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 04:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G61Z7AtRw9pYB1luCJ+gP3LAK8YB9ebW/zQnPLwNUMQ=; b=ev/ceux+AhSHSJnQBySMDIrWPT
	fC/ychlA9RrZVMoc8572iZiUf46OawkUmt6qNhNXDko2xh0UklQYs8TyNqlkvc/Jxk44c01dKt0ST
	wamCdkpM5HgAA1NRdAzlnWMST/QZDwGG7WnD1krtGsYLOuVmdh5rsnRdyHvAYVmzfU/lf3ZNdYVZi
	IztUg7PtHx614o3epU9hkoM8WZGnrm4WU5VtzDSpMxCpHxWwG+5eH6ANJS+Nidsl/g/1GspXJvsWD
	04sE45Vmlzap2/B7gNQw5j5d80/y9rAYfiRjTLRS/Bno1MQHNlBtme4nowZysI31svkKPDF3W1PfK
	dZLuVJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbB47-0000000DrsN-1l2E;
	Fri, 24 Jan 2025 04:13:07 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbB2n-0000000Drnj-2UqX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 04:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737691906; x=1769227906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jCliCqH9ud0GLTM7b/xWwloQkS4OyN5sqqdPDtXblVo=;
  b=TEXIIFTGxPm3I0iVcV//7jzPWaE9taisYXpe+gODeDbBV8yn5bQF50W7
   16RULUo/lCFLl7BVWZEoXpZ3hbJB4fmBk1Us+/pybTjMoJs3UiTkfQv6H
   DvFg3W4uFEGfOjXfAB8HbUpzS/o6dJZl1W/JzZAAb+ujFdTC3K5kwwVqr
   EilOZ7RGdsNP8cf8+eDd2ld9XYvdKK06lj7FySe8NhJUIF4a0NBNKiVxl
   F64u6FwL/y3VWSR71eY/O3DYYA4vIQRKWcFVdlqm2gvfuS26ftQH+uE0C
   NZiP5ML30kA5XGD7i+wUXg1fehbgR5WAP8yFM/QDK+qcD37OyDHsFF3Cx
   A==;
X-CSE-ConnectionGUID: DjTk2tpETquurYZpZcSSpg==
X-CSE-MsgGUID: uZOnFS0/QY2/GkYm5YCurA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37475487"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="37475487"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 20:11:44 -0800
X-CSE-ConnectionGUID: NOpEyIMyQP2jMN0VJml8TQ==
X-CSE-MsgGUID: QoqUchVYRu+8UvM4RR+nfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112623071"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jan 2025 20:11:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbB2g-000c8B-1f;
	Fri, 24 Jan 2025 04:11:38 +0000
Date: Fri, 24 Jan 2025 12:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/5] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
Message-ID: <202501241148.0CI9mBP5-lkp@intel.com>
References: <20250121-imx-lmm-cpu-v1-2-0eab7e073e4e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-imx-lmm-cpu-v1-2-0eab7e073e4e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_201145_664487_7A640915 
X-CRM114-Status: UNSURE (   9.77  )
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

[auto build test WARNING on 0907e7fb35756464aa34c35d6abb02998418164b]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/firmware-arm_scmi-imx-Add-i-MX95-LMM-protocol/20250121-231254
base:   0907e7fb35756464aa34c35d6abb02998418164b
patch link:    https://lore.kernel.org/r/20250121-imx-lmm-cpu-v1-2-0eab7e073e4e%40nxp.com
patch subject: [PATCH 2/5] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
config: arm64-randconfig-r122-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241148.0CI9mBP5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241148.0CI9mBP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241148.0CI9mBP5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c:139:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned long @@
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c:139:19: sparse:     expected restricted __le32 [usertype] flags
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c:139:19: sparse:     got unsigned long
>> drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c:140:19: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c:140:19: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c:140:19: sparse:    right side has type unsigned long
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c:141:19: sparse: sparse: invalid assignment: |=
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c:141:19: sparse:    left side has type restricted __le32
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c:141:19: sparse:    right side has type unsigned long
>> drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c:173:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c:205:32: sparse: sparse: restricted __le32 degrades to integer

vim +139 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c

   119	
   120	static int scmi_imx_cpu_reset_vector_set(const struct scmi_protocol_handle *ph,
   121						 u32 cpuid, u64 vector, bool start,
   122						 bool boot, bool resume)
   123	{
   124		struct scmi_imx_cpu_reset_vector_set_in *in;
   125		struct scmi_xfer *t;
   126		int ret;
   127	
   128		ret = scmi_imx_cpu_validate_cpuid(ph, cpuid);
   129		if (ret)
   130			return ret;
   131	
   132		ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_RESET_VECTOR_SET, sizeof(*in),
   133					      0, &t);
   134		if (ret)
   135			return ret;
   136	
   137		in = t->tx.buf;
   138		in->cpuid = cpu_to_le32(cpuid);
 > 139		in->flags = start ? CPU_VEC_FLAGS_START : 0;
 > 140		in->flags |= boot ? CPU_VEC_FLAGS_BOOT : 0;
   141		in->flags |= resume ? CPU_VEC_FLAGS_BOOT : 0;
   142		in->resetvectorlow = cpu_to_le32(lower_32_bits(vector));
   143		in->resetvectorhigh = cpu_to_le32(upper_32_bits(vector));
   144		ret = ph->xops->do_xfer(ph, t);
   145	
   146		ph->xops->xfer_put(ph, t);
   147	
   148		return ret;
   149	}
   150	
   151	static int scmi_imx_cpu_started(const struct scmi_protocol_handle *ph, u32 cpuid,
   152					bool *started)
   153	{
   154		struct scmi_imx_cpu_info_get_out *out;
   155		struct scmi_xfer *t;
   156		int ret;
   157	
   158		*started = false;
   159		ret = scmi_imx_cpu_validate_cpuid(ph, cpuid);
   160		if (ret)
   161			return ret;
   162	
   163		ret = ph->xops->xfer_get_init(ph, SCMI_IMX_CPU_INFO_GET, sizeof(u32),
   164					      0, &t);
   165		if (ret)
   166			return ret;
   167	
   168		put_unaligned_le32(cpuid, t->tx.buf);
   169		ret = ph->xops->do_xfer(ph, t);
   170		if (!ret) {
   171			out = t->rx.buf;
   172			if ((out->runmode == CPU_RUN_MODE_START) ||
 > 173			    (out->runmode == CPU_RUN_MODE_SLEEP))
   174				*started = true;
   175		}
   176	
   177		ph->xops->xfer_put(ph, t);
   178	
   179		return ret;
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

