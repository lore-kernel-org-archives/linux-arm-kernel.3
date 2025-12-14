Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09FCD5B160
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 02:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzC/qDcVmajsO4atkJ22J/nrUssq8U63nk/Xu3qYLpM=; b=YTotakDZHmFUgnh1cZvHs5/Ho1
	dFkEUz/VpR8rkzGfFKpgxezn8u4kkmSa9FNDARSZgWL51T5iWdUl7zF4KfGoI9/FmH8IfdL240+7c
	wEDUtfbPlMBOyPnImxntxLmPycPWr3mHb9nTgrFe7MxN7t5NRDDSR2smWMbH2fMVPlcIdOUdP4ORN
	XH9hvWyrgBVvRlNsGwDULnu/fpfzh+lzrHyreeUPAoyyTAu2DjquEiAsWuh+nNoeL0nfIyJIib3fX
	ZIaSNew5YBiFxaDZ9Mm1wbLaV/k3QbYk8uqHEJ/LdSTOo+dLBXv80nuwQL9kEbYP/z3G0d8lVRamT
	e7CaynfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUc6K-0000000274d-44Wt;
	Sun, 14 Dec 2025 02:44:48 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUc6I-0000000274I-1Fdv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 02:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765680286; x=1797216286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OpZre1ZbJKF8udkzRRD8kMmJKN4XssmMfDeDAHs25MI=;
  b=S7ANaeqwl3bKIuSUOeM97PUojf1fBPC6g6zm5M0GMNybR9QnezGDn2W5
   fVD9ZmztiORb1Hr7ByZnwX1UAdHcu5IWmH+HnIUzfl3YORi5fdJKf3xa1
   T2CgF+6mwnZE5Kgv4FfyJdEPECEvdL4x4w/8vN/JWpGJre4MNI5t442bf
   gSN5AK3YHFP4dk+PJB+vmK/Qw6UOANYAOSzg7c+J9J2QthRrZ1NrcUrzl
   MTl4xJSAiX99LGTgUmu035zfn31yWNzYFHWwialKr+iBC+h9XZv8YZXy2
   /i2Kg/qH7v65lKeGGpSFdNjDKWOeUfbs/ugvjCYlFele+e2QEDRLrEfmU
   w==;
X-CSE-ConnectionGUID: J4TpTfqOQxO9JO0AU1KIYw==
X-CSE-MsgGUID: dnQOs8GGSOeEy+H0NNTisA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="90282322"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="90282322"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 18:44:44 -0800
X-CSE-ConnectionGUID: uuVL35UCQ9i0K8VntsaC8g==
X-CSE-MsgGUID: VhPSKb22Q9SaBgR6ilo5Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="228491153"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Dec 2025 18:44:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUc69-000000008Tp-32vO;
	Sun, 14 Dec 2025 02:44:37 +0000
Date: Sun, 14 Dec 2025 10:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v21 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <202512141039.nVscnjzl-lkp@intel.com>
References: <20251212-imx-se-if-v21-3-ee7d6052d848@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx-se-if-v21-3-ee7d6052d848@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_184446_432111_4D121199 
X-CRM114-Status: GOOD (  11.01  )
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

Hi Pankaj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4a26e7032d7d57c998598c08a034872d6f0d3945]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20251212-172535
base:   4a26e7032d7d57c998598c08a034872d6f0d3945
patch link:    https://lore.kernel.org/r/20251212-imx-se-if-v21-3-ee7d6052d848%40nxp.com
patch subject: [PATCH v21 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
config: powerpc-randconfig-r131-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141039.nVscnjzl-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141039.nVscnjzl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141039.nVscnjzl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/imx/ele_base_msg.c:77:52: sparse: sparse: non size-preserving pointer to integer cast

vim +77 drivers/firmware/imx/ele_base_msg.c

    16	
    17	int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
    18	{
    19		struct se_api_msg *tx_msg = NULL;
    20		struct se_api_msg *rx_msg = NULL;
    21		dma_addr_t get_info_addr = 0;
    22		u32 *get_info_data = NULL;
    23		int ret = 0;
    24	
    25		if (!priv)
    26			return -EINVAL;
    27	
    28		memset(s_info, 0x0, sizeof(*s_info));
    29	
    30		tx_msg = kzalloc(ELE_GET_INFO_REQ_MSG_SZ, GFP_KERNEL);
    31		if (!tx_msg)
    32			return -ENOMEM;
    33	
    34		rx_msg = kzalloc(ELE_GET_INFO_RSP_MSG_SZ, GFP_KERNEL);
    35		if (!rx_msg) {
    36			ret = -ENOMEM;
    37			goto exit;
    38		}
    39	
    40		if (priv->mem_pool)
    41			get_info_data = gen_pool_dma_alloc(priv->mem_pool,
    42							   ELE_GET_INFO_BUFF_SZ,
    43							   &get_info_addr);
    44		else
    45			get_info_data = dma_alloc_coherent(priv->dev,
    46							   ELE_GET_INFO_BUFF_SZ,
    47							   &get_info_addr,
    48							   GFP_KERNEL);
    49		if (!get_info_data) {
    50			dev_dbg(priv->dev,
    51				"%s: Failed to allocate get_info_addr.", __func__);
    52			ret = -ENOMEM;
    53			goto exit;
    54		}
    55	
    56		ret = se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
    57					  ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ,
    58					  true);
    59		if (ret)
    60			goto exit;
    61	
    62		tx_msg->data[0] = upper_32_bits(get_info_addr);
    63		tx_msg->data[1] = lower_32_bits(get_info_addr);
    64		tx_msg->data[2] = sizeof(*s_info);
    65		ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
    66				       ELE_GET_INFO_RSP_MSG_SZ);
    67		if (ret < 0)
    68			goto exit;
    69	
    70		ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
    71					      ELE_GET_INFO_RSP_MSG_SZ, true);
    72	
    73		memcpy(s_info, get_info_data, sizeof(*s_info));
    74	
    75	exit:
    76		if (priv->mem_pool)
  > 77			gen_pool_free(priv->mem_pool, (u64)get_info_data,
    78				      ELE_GET_INFO_BUFF_SZ);
    79		else
    80			dma_free_coherent(priv->dev, ELE_GET_INFO_BUFF_SZ,
    81					  get_info_data, get_info_addr);
    82	
    83		kfree(tx_msg);
    84		kfree(rx_msg);
    85		return ret;
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

