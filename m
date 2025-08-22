Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08E7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuwbF9eB3t485vQKBVN40mCG9D/kAybvLkn5/BUf8wY=; b=o9k46CrEYi9eAwMQOKyWgxVrxS
	PI2FeSsoeF1QGFjGJm0byF1c5rHSYpgHgMy6YlvNc2Qf7Vjaci3RcOG0dFEJRyA1kv9rL83ypZXlG
	5jUiAe590j5CKO2clnVO6w054fmvHB53fkmIUqtrq4RFF2moSOxmWqkHyNQH0nDCXzpeBp/X+W+0b
	+FFCHoOsic9GF08xlpNMd0ZBXuwU9xvPpDrtFL/Lf168cBek2PAkcpHmvv1yc7OiRo7X74VFbBdpL
	tOVa2uNJwieTetXDYgLFNTylQw8TQQtdYLPiO7sUnrHEKRnT2xxDEZfKUcT24Z3GfK4IWcHlmv/Cr
	93O7XetA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkgF-00000004W98-0bGZ;
	Sat, 23 Aug 2025 09:36:59 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upaLy-00000003bbv-03mN;
	Fri, 22 Aug 2025 22:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755902122; x=1787438122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R5PaTuYrgUIRNnUfVveRfz0LrC26l6MrG1wU0QZXikE=;
  b=iqjNhe5OiU9p5ROQxaRmNJHGkiI1tM6jawwDtNOObUvjr0lm+ICwaI6c
   Z0tGPEEiRO1nRUkSWH5eVOBATEKvzEFkNcqaCUahuCm/5WWVZ4wJLvswr
   Y+IXRR5BJazDHKbcQRaUh4OkGUyEJDnByGA4P+at87P9Im3XPI3LBBk1R
   zfuHNrn+EJqJngYRZ5Dv4xSD+n22pAitFqx/LfPnhLqICVNKSewafdZJe
   rdNY5xFctmHl/CV7c0ovPgd2SIvFsLLypdAEjn+VhGOnmOh7negB9Go7u
   N76/OjDHBo4kWG6Sp1YN24MVUm6WRKiavHqZQcTfRmrc/cDjjR8haeul6
   Q==;
X-CSE-ConnectionGUID: okyIvHAXSQ+nlih/fnkXzw==
X-CSE-MsgGUID: S66dYBbdTMupHIRTmo9lvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="62046732"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62046732"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 15:35:18 -0700
X-CSE-ConnectionGUID: 6jX73bC2T3Opq9Yjcn+fYQ==
X-CSE-MsgGUID: ILGDVUOPTqi4GxU0i/InIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173076860"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Aug 2025 15:35:16 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upaLp-000LtD-3C;
	Fri, 22 Aug 2025 22:35:13 +0000
Date: Sat, 23 Aug 2025 06:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 2/3] net: airoha: Add airoha_ppe_dev struct
 definition
Message-ID: <202508230602.GmZrkmas-lkp@intel.com>
References: <20250822-airoha-en7581-wlan-rx-offload-v2-2-8a76e1d3fec2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-airoha-en7581-wlan-rx-offload-v2-2-8a76e1d3fec2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_153522_122225_0E2DE28B 
X-CRM114-Status: UNSURE (   9.40  )
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

Hi Lorenzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on a7bd72158063740212344fad5d99dcef45bc70d6]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/net-airoha-Rely-on-airoha_eth-struct-in-airoha_ppe_flow_offload_cmd-signature/20250822-151720
base:   a7bd72158063740212344fad5d99dcef45bc70d6
patch link:    https://lore.kernel.org/r/20250822-airoha-en7581-wlan-rx-offload-v2-2-8a76e1d3fec2%40kernel.org
patch subject: [PATCH net-next v2 2/3] net: airoha: Add airoha_ppe_dev struct definition
config: powerpc64-randconfig-003-20250823 (https://download.01.org/0day-ci/archive/20250823/202508230602.GmZrkmas-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230602.GmZrkmas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230602.GmZrkmas-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/airoha/airoha_eth.h:16,
                    from drivers/net/ethernet/airoha/airoha_npu.c:15:
>> include/linux/soc/airoha/airoha_offload.h:31:15: error: unknown type name 'airoha_ppe_dev'
      31 | static inline airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev)
         |               ^~~~~~~~~~~~~~


vim +/airoha_ppe_dev +31 include/linux/soc/airoha/airoha_offload.h

    24	
    25	static inline int airoha_ppe_dev_setup_tc_block_cb(struct airoha_ppe_dev *dev,
    26							   void *type_data)
    27	{
    28		return dev->ops.setup_tc_block_cb(dev, type_data);
    29	}
    30	#else
  > 31	static inline airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev)
    32	{
    33		return NULL;
    34	}
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

