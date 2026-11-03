Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBC2606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=asNfdXa5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R0WAjBPd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7hpI2iCSGoz71vPjJKjpaH2lhKVzdhV0IEDs+PYjGYI=; b=asNfdXa5HvMiPnDg1gtpRWeEDF
	s70D3++IY/2a0YWucAsXP5Wq+YIJ+dyyQ429KKFVu9GZ6GA5nKpJsCx7pwIJ8FdF7Z7kB9zN74Qje
	RmWoDlFY2f4JcfjqDmAwMKApnBR3tacPczZ1DjJhbfOwG4pqKO8y82wdqGYgl/AFIAPleOZ9RzcU0
	7AzaLOln9lBrAQ/f7cvZEL+DUAb0Jegb33nEEj10pA82hfZSYm+esiu2RqX8mNWhAOJJB6S7J5a1x
	D7o3/i5y2AqMBJH4BiJHDhlsqK7/eceEWguRit9iudT2x5CxP4hUqkyHKrJI/c5wc+qWeX08DQPNB
	iYCBVtzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO61n-00000000zwG-41Uk;
	Tue, 03 Nov 2026 04:21:52 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO61c-00000000zut-3w0e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793679694; x=1825215694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e/FUd/e/mAYT7IeYzGgwu4zSfKt4EcJEQsjr//9wYN8=;
  b=R0WAjBPdTEUY6GAYiaJXbG3tPxSuDfJJS0Zgf8sWKnaTet26ViWS3J+i
   9yvq36OwwI695NcxOf91ey3lwKbQBW2pVN1wIyb/xoWL+y4hsBiE4k89x
   7a3lE0IBrxS8irWD4Ecp11r04Y9+Fc3nqvtFDhTKMbVR5eBpKKcuCPBsb
   m8KMw+QLUDd/34pg/7RPJkZCD3Mrk81zjMlhE54m5UMXqWKO844F21nPL
   rFqw9uRS6HZaor6K4Uzhiwjer7HPw95PXKkQvd2mgO0jkM/Y21Bfxe4OF
   L2y9T+b+ELRARUGOGzUpVJewPuTDb7PcwNQN1Gvgu2pgMxPB0YcqADYvO
   w==;
X-CSE-ConnectionGUID: qZlZusvbQKGguZaLQNLx0w==
X-CSE-MsgGUID: 4ySDNP5HRIWWqv/GvOQrcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2495162"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2495162"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 20:21:23 -0800
X-CSE-ConnectionGUID: JaDX/0xDSXe4TwWItdmlvQ==
X-CSE-MsgGUID: C6+kcDqrTNGoQJ5+2a7VTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6633917"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Nov 2026 20:21:19 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xO61L-00000000iI4-2oC3;
	Tue, 03 Nov 2026 04:21:15 +0000
Date: Tue, 3 Nov 2026 12:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v5 RESEND 5/6] firmware: smccc: lfa: Register DT interrupt
Message-ID: <202611031233.vQxtNp7l-lkp@intel.com>
References: <20261102165421.3651202-6-andre.przywara@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102165421.3651202-6-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_202133_077800_54D1EAAF 
X-CRM114-Status: GOOD (  18.07  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, oe-kbuild-all@lists.linux.dev, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm64/for-next/core linus/master next-20261030]
[cannot apply to arm/for-next arm/fixes clk/clk-next kvmarm/next rockchip/for-next soc/for-next nferre-at91/at91-next shawnguo/for-next v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Przywara/dt-bindings-arm-Add-Live-Firmware-Activation/20261102-175415
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20261102165421.3651202-6-andre.przywara%40arm.com
patch subject: [PATCH v5 RESEND 5/6] firmware: smccc: lfa: Register DT interrupt
config: arm64-randconfig-1000-20261103 (https://download.01.org/0day-ci/archive/20261103/202611031233.vQxtNp7l-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611031233.vQxtNp7l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611031233.vQxtNp7l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_register_dt':
   drivers/firmware/smccc/lfa_fw.c:939:16: error: implicit declaration of function 'devm_request_threaded_irq'; did you mean 'devm_request_region'? [-Werror=implicit-function-declaration]
     939 |         return devm_request_threaded_irq(dev, lfa_irq, NULL,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                devm_request_region
   drivers/firmware/smccc/lfa_fw.c:940:66: error: 'IRQF_COND_ONESHOT' undeclared (first use in this function)
     940 |                                          lfa_irq_handler_thread, IRQF_COND_ONESHOT,
         |                                                                  ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:940:66: note: each undeclared identifier is reported only once for each function it appears in
   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_smccc_remove':
   drivers/firmware/smccc/lfa_fw.c:1034:9: error: implicit declaration of function 'devm_free_irq'; did you mean 'devm_free_pages'? [-Werror=implicit-function-declaration]
    1034 |         devm_free_irq(&sdev->dev, lfa_irq, NULL);
         |         ^~~~~~~~~~~~~
         |         devm_free_pages
   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_register_dt':
>> drivers/firmware/smccc/lfa_fw.c:942:1: warning: control reaches end of non-void function [-Wreturn-type]
     942 | }
         | ^
   cc1: some warnings being treated as errors


vim +942 drivers/firmware/smccc/lfa_fw.c

   925	
   926	static int lfa_register_dt(struct device *dev)
   927	{
   928		struct device_node *np;
   929	
   930		np = of_find_compatible_node(NULL, NULL, "arm,lfa");
   931		if (!np)
   932			return -ENODEV;
   933	
   934		lfa_irq = irq_of_parse_and_map(np, 0);
   935		of_node_put(np);
   936		if (!lfa_irq)
   937			return -ENODEV;
   938	
   939		return devm_request_threaded_irq(dev, lfa_irq, NULL,
   940						 lfa_irq_handler_thread, IRQF_COND_ONESHOT,
   941						 NULL, NULL);
 > 942	}
   943	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

