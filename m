Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D85F103E18D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+J9NjUAUi3Q32TWNqZhgxNnfvrgpj3srU74InCa1cc=; b=4cLxSXj1V9jaRUu1bXjvpyGXAd
	hJ0ePc8iOxfrQHc4Djel04/btMvUPSlWd7DzqKdwuNwLnUUKZGHvCN91MHYUJPpo57GdYgWA06xMg
	Od7HofYv/gcXtAXz9P1z3iiPkPuAqFWFq411AQBlku9wlztMvLyCnPoH+ttrO6xPId4glJmZ7tvsk
	OhZK7oQWfmxuwrEq54kD+e9NMVPG/6bM4VNCgzNC4I0FagDhPi6YiZBRr26ynsmLIuHfDsqFbUqLw
	BislMF6NFBd54Uz0B6UcxZe8i5yCij0suCO7PYzA6ahZHO9fcHPrCzIGpXsDDP2tF37V+KovGg3ao
	2xhqDaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rmr-00000008aNB-1uc6;
	Wed, 18 Mar 2026 14:22:17 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rml-00000008aKb-3EOi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 14:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773843732; x=1805379732;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tWCUa9WlKPfTUUpFlkiDicbAtrIdM4cty8tHD9a537s=;
  b=Jyaz9UIEqEDYfnOZoBjEK0M52rgENXDH+kl30Aaco4afgLohC117QNdH
   0wMavqV7ztLW6k7rTSOq8HNeM8VXeY+unZpzkm9/lPbWqLMiI/49LHRLx
   0y9AFIUHGDEipG9RqvaWlgMnKr2jjYY/PFUjBpUPADwKoB1N/FsBpt28g
   UNPEIH9dZGSvNaby8vVAZMwU+f2h4OJGNHFtLUNucXbfbj2DDuZUaA/6F
   cAD7ADC09L1iLmP8QZnuzm2uLV/gqnbGsm9o+8nutSNsHpMp2BWxo51MX
   gYPRA5oyAXBHDucNTWchW8Tmb58/Kvd7tGCaXBV+rORS+L3R1hTzhZ6wd
   w==;
X-CSE-ConnectionGUID: +VAs24IlRUaTSpkY0/+Cjw==
X-CSE-MsgGUID: GV0Q2LP0T52NI9SpLBw0yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74786180"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74786180"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 07:22:07 -0700
X-CSE-ConnectionGUID: yufXEIZgRL20iyeNJJdb3w==
X-CSE-MsgGUID: ibZa+GXeShSztrVAQAZfMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="245666299"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2026 07:22:03 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2rmZ-000000002zj-3zuC;
	Wed, 18 Mar 2026 14:21:59 +0000
Date: Wed, 18 Mar 2026 22:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v2 7/8] firmware: smccc: lfa: Register DT interrupt
Message-ID: <202603182202.gpyCz2RF-lkp@intel.com>
References: <20260317103336.1273582-8-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317103336.1273582-8-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_072211_861528_3E2F9655 
X-CRM114-Status: GOOD (  16.96  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, oe-kbuild-all@lists.linux.dev, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Andre,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on arm/for-next arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master nferre-at91/at91-next v7.0-rc4 next-20260317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Przywara/dt-bindings-arm-Add-Live-Firmware-Activation-binding/20260318-082717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260317103336.1273582-8-andre.przywara%40arm.com
patch subject: [PATCH v2 7/8] firmware: smccc: lfa: Register DT interrupt
config: arm64-randconfig-004-20260318 (https://download.01.org/0day-ci/archive/20260318/202603182202.gpyCz2RF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182202.gpyCz2RF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182202.gpyCz2RF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_register_dt':
>> drivers/firmware/smccc/lfa_fw.c:878:16: error: implicit declaration of function 'devm_request_threaded_irq'; did you mean 'devm_request_region'? [-Werror=implicit-function-declaration]
     878 |         return devm_request_threaded_irq(dev, irq, lfa_irq_handler,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                devm_request_region
>> drivers/firmware/smccc/lfa_fw.c:880:42: error: 'IRQF_COND_ONESHOT' undeclared (first use in this function)
     880 |                                          IRQF_COND_ONESHOT, NULL, NULL);
         |                                          ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:880:42: note: each undeclared identifier is reported only once for each function it appears in
   drivers/firmware/smccc/lfa_fw.c:881:1: warning: control reaches end of non-void function [-Wreturn-type]
     881 | }
         | ^
   cc1: some warnings being treated as errors


vim +878 drivers/firmware/smccc/lfa_fw.c

   863	
   864	static int lfa_register_dt(struct device *dev)
   865	{
   866		struct device_node *np;
   867		unsigned int irq;
   868	
   869		np = of_find_compatible_node(NULL, NULL, "arm,lfa");
   870		if (!np)
   871			return -ENODEV;
   872	
   873		irq = irq_of_parse_and_map(np, 0);
   874		of_node_put(np);
   875		if (!irq)
   876			return -ENODEV;
   877	
 > 878		return devm_request_threaded_irq(dev, irq, lfa_irq_handler,
   879						 lfa_irq_handler_thread,
 > 880						 IRQF_COND_ONESHOT, NULL, NULL);
   881	}
   882	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

