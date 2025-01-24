Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BDFC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 02:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGDhpCeU/tycigAOibtSPsGCf8Cu27SWkmjLwUeeJ98=; b=UIZccF0lx3G2SKgZfHc49oIVcm
	MWSSbJp7ZW4sR6oCnXlS6715Rl6LZL1XT4wk/J4AiFdekr9dMYqHOF7XEk6r2VLFimfD4veLmTWD9
	1fb/e6m/8fQJJsodhVf9JR6/kt3SGyemvhJfCvITf4zue587cwi2+12yPD5jH9qPI2AHZ7Nqxrxws
	uqp8az5I8qs/jxORV+L8h8fteraPlb8FdhhietvqkVpFkdDqkAOv4i7BuAK6ofhKwbtcEqDYqPGNp
	jn5Txb5ggPn7mn0QePN3E7VzqxCNvLM3gYQM2MYkC0Aezd3LimO0g0u+aJGtfiY4VtlixcfEG/6Ji
	Vw/aLkAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb9hc-0000000Dl9f-1tzY;
	Fri, 24 Jan 2025 02:45:48 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb9fT-0000000Dkkk-3IsD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 02:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737686616; x=1769222616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Jxf1MIkAme+I3DGHNaJEUWbgACy1KWQtq6VUX4R9y8=;
  b=ePkpJR3Km2FmQYsy9jHHhYbjHQF2Y5ayFkbjpKQ7bx21pOLUnLex5PQ6
   rds9EDSrY1DHheXrehoTmdm5yqKpur3s8/MkTyn8iEiSU1y5QXdroeZFj
   uoAS6YyWMIVoY/CxwBLqT+YNppjV8sXInPKd27nCoKJOauqs+DGZj5tBX
   yrV/tWdZlpwWZ0HV7VoG1EemUPBtFxQ0LI1Pgaa/3tcdNRRlnaMdCGd6u
   /7AN8QPeIMSe+5koS9PseTZWRv8cL1JkWSVukM2NisAHR+29GUoIKoy0D
   a9AyV+qJ4xQQUQxr9PRy8GGftWAsVHHwcrKSv9F8rhZzrdMBHsQlcVVrB
   Q==;
X-CSE-ConnectionGUID: Ce3Cg9w1QjCTsFIymfUJtQ==
X-CSE-MsgGUID: Cso2BtGtQBWoRID7TIgfOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38469255"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="38469255"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 18:43:33 -0800
X-CSE-ConnectionGUID: 8pdSFtXJRIKb07fDND+IjQ==
X-CSE-MsgGUID: C4DkUGYDQ9OFFE7AKWijjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="138519430"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2025 18:43:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb9fL-000c2x-1X;
	Fri, 24 Jan 2025 02:43:27 +0000
Date: Fri, 24 Jan 2025 10:43:12 +0800
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
Subject: Re: [PATCH 1/5] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <202501241025.6reKesXZ-lkp@intel.com>
References: <20250121-imx-lmm-cpu-v1-1-0eab7e073e4e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-imx-lmm-cpu-v1-1-0eab7e073e4e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_184335_876213_26766A1A 
X-CRM114-Status: UNSURE (   9.38  )
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
patch link:    https://lore.kernel.org/r/20250121-imx-lmm-cpu-v1-1-0eab7e073e4e%40nxp.com
patch subject: [PATCH 1/5] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
config: arm64-randconfig-r122-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241025.6reKesXZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241025.6reKesXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241025.6reKesXZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c:189:32: sparse: sparse: restricted __le32 degrades to integer

vim +189 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c

   172	
   173	static int scmi_imx_lmm_protocol_attributes_get(const struct scmi_protocol_handle *ph,
   174							struct scmi_imx_lmm_priv *priv)
   175	{
   176		struct scmi_msg_imx_lmm_protocol_attributes *attr;
   177		struct scmi_xfer *t;
   178		int ret;
   179	
   180		ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
   181					      sizeof(*attr), &t);
   182		if (ret)
   183			return ret;
   184	
   185		attr = t->rx.buf;
   186	
   187		ret = ph->xops->do_xfer(ph, t);
   188		if (!ret) {
 > 189			priv->nr_lmm = SCMI_IMX_LMM_PROTO_ATTR_NUM_LM(attr->attributes);
   190			dev_info(ph->dev, "i.MX LMM: %d Logical Machines\n",
   191				 priv->nr_lmm);
   192		}
   193	
   194		ph->xops->xfer_put(ph, t);
   195	
   196		return ret;
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

