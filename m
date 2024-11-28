Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DADD70DEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 21:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDMjTOuGtPUw82lHORYORPiQXD+NzzCkmH5YorP33YE=; b=GEx004ec59HKwg6YqlOUFQkmrX
	0DQfEfqhZnUF2GtbDhbpv4zybdADYNek38iVWkIksAiSLnVmYDwX39tq7Uy49MPo+R4j6oQvRpQIe
	muoBTJ2m2lfbolRoGjFcLE183nFYKYveWF6iGwTq+XfJFxFdqCY7O9reuxAE3wxUFoNE6GWaD1oy8
	Nv6yVK5mNh9+98OU2zsehBYuW2zeNSijMNfxHJ9bLcfMsb/nKBNVRyV/TFNqQ5vZaGD/qj852LXOH
	oQ60zxXN8B9cySv6mz4pjMrfM1gGUhBeICa6RU3Eu/YUARBfuXuTCl1721pann+Cd5gWTUgfWN9wb
	Jtx7ZYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGlvF-0000000GQjq-1jSa;
	Thu, 28 Nov 2024 21:19:37 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGluE-0000000GQXm-1VNa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 21:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732828714; x=1764364714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GO+N933rH1qIyupawKjaT9KoZU7mSDCkyHjVeWZvROM=;
  b=PUZgGkEkobURdM/tp95e+nNbQKtpyoPuEPKBTwSHSwia+N9QEE1pVFMS
   9BhEcozWNSKFehwWbxb3x81akp6z2CJY9ABSyN2DEbQMsJa/dxxF6EIek
   KANNzT6M669czHcipmw7BBiXFNGzfrgdzFxWv16W4xwPs8VjYwRMEPoCx
   yRBt02sKAdzoONfBfkqRJK0htN4fBYXufWVaTq3gyp2mb5bq9Cei6Gzh6
   NdXJ+Dt7qXd02s1BZNHUGfg0RIQ5CSkroGj8i1R5asrj0ElsG3kXWXlTD
   R4T8iKflTEdSzTZkNwP1Cib/r/XDk0joAIuNFx17u97BV1aUfvqJO0SCQ
   g==;
X-CSE-ConnectionGUID: PUuLbTSrSMqbyimjvJuzeA==
X-CSE-MsgGUID: DZlyNVLuQH2MGdcRh5k5zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36999193"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="36999193"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 13:18:30 -0800
X-CSE-ConnectionGUID: yuXQn1uPTdemmEhda96acg==
X-CSE-MsgGUID: 9FrGQozmT5m6JkP2rMIpxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="129819816"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Nov 2024 13:18:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGlu3-000A3b-1H;
	Thu, 28 Nov 2024 21:18:23 +0000
Date: Fri, 29 Nov 2024 05:18:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <202411290700.vbqI1pTY-lkp@intel.com>
References: <20241126114940.421143-3-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126114940.421143-3-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_131834_405142_C653B10C 
X-CRM114-Status: GOOD (  14.75  )
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

Hi Ciprian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm64/for-next/core linus/master v6.12]
[cannot apply to abelloni/rtc-next next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-rtc-add-schema-for-NXP-S32G2-S32G3-SoCs/20241128-100010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241126114940.421143-3-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241129/202411290700.vbqI1pTY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290700.vbqI1pTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290700.vbqI1pTY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-s32g.c:109: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Convert a number of seconds to a value suitable for RTCVAL in our clock's


vim +109 drivers/rtc/rtc-s32g.c

   107	
   108	/**
 > 109	 * Convert a number of seconds to a value suitable for RTCVAL in our clock's
   110	 * current configuration.
   111	 * @rtcval: The value to go into RTCVAL[RTCVAL]
   112	 * Returns: 0 for success, -EINVAL if @seconds push the counter past the
   113	 *          32bit register range
   114	 */
   115	static int sec_to_rtcval(const struct rtc_priv *priv,
   116				 unsigned long seconds, u32 *rtcval)
   117	{
   118		u32 delta_cnt;
   119	
   120		if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, RTCCNT_MAX_VAL))
   121			return -EINVAL;
   122	
   123		/*
   124		 * RTCCNT is read-only; we must return a value relative to the
   125		 * current value of the counter (and hope we don't linger around
   126		 * too much before we get to enable the interrupt)
   127		 */
   128		delta_cnt = seconds * priv->rtc_hz;
   129		*rtcval = delta_cnt + ioread32(priv->rtc_base + RTCCNT_OFFSET);
   130	
   131		return 0;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

