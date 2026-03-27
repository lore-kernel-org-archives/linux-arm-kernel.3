Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D81610F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 20:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwAKLwoYIfJJCtkX3cFuEqma6KKhnGBwbiyeffmGJmE=; b=Y3NJxdkRXFBdzycLsiZYgHgXAa
	zSfM548LP7kwgd0fxfcYI1nR3oqp3OSVEl0mKHFQHsvmBbQe8d8dD54KyovtSlodGH6FIuF8qwPXS
	IQrDjIff7OFtVAPp7HhnVoT2beaXYoCDxzGFdgNyDUjyCLr7nYOJMXQWZKVRsXbgqiwOldqNGynMF
	P3R1cpn9YGYWx64Yv4zaZXvS8KzticBzo/QZReUj5OI0T7lFMjVwJtbgulvr2C6HkSyJQnx3shy70
	FwrGSSCZaIT1Z0Rqa8czxKDcE7DS2gQWEI2TwCEpK+Gna/7x/INjtS+c+zcbtheipzoml3QZhQ6kp
	kRMd/iLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6EGD-00000008CmI-0Rz9;
	Fri, 27 Mar 2026 20:58:29 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6EGA-00000008Clu-2NnJ;
	Fri, 27 Mar 2026 20:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774645106; x=1806181106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SQR0YyvvNKZ19ivSH0b+y9Tjg/QCeOc1Y/8TMEN1CZY=;
  b=lD6nwNrxz5fEkD/rjuOV/yxrAuQSTOwl4XbcnbF5GgdjSX38135XdgRt
   1jGaLB4w635yI3iSNpzbtuAf9BHn4pNucgulT8ZeDCbCJwDsQDQ8IG7mT
   egbC3bJcXw8F07ZXa5HNnwdJwTwy6JD6WPi8Y8GkPWQPUZGvJbGD7hd+J
   uPVZcBUMrb1YhQsX25g166hzCC1jHQCesDbv8nmHbpDehobPlHjAJVKYz
   GRoSZe8bH0je5cRr3EYc3UWJEWFXRbSDKAH7g/uucXr6DEKt9SetUFMs7
   U87VseAAnxkEcYgAVNkHHEbaaHlFXpYugF+IMjL/1gmNw+Yz0BDn2gyyw
   w==;
X-CSE-ConnectionGUID: ueADmfm/QhSKh2E3AG6VfA==
X-CSE-MsgGUID: DeegcGaCQpavz+6wngkC4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75439709"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75439709"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 13:58:25 -0700
X-CSE-ConnectionGUID: UYhKLyDwTgG2QT2x7s+T8g==
X-CSE-MsgGUID: hT6cdgmqQ9CvuiYlrtr0LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="221023310"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Mar 2026 13:58:21 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6EG2-00000000Ak1-2ELz;
	Fri, 27 Mar 2026 20:58:18 +0000
Date: Sat, 28 Mar 2026 04:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v3 3/4] irqchip/ast2700-intc: Add KUnit tests for route
 resolution
Message-ID: <202603280415.xv0eHt8u-lkp@intel.com>
References: <20260326-irqchip-v3-3-366739f57acf@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-irqchip-v3-3-366739f57acf@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_135826_674304_EAC3B22C 
X-CRM114-Status: GOOD (  11.34  )
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

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-interrupt-controller-Describe-AST2700-A2-hardware-instead-of-A0/20260327-190127
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260326-irqchip-v3-3-366739f57acf%40aspeedtech.com
patch subject: [PATCH v3 3/4] irqchip/ast2700-intc: Add KUnit tests for route resolution
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260328/202603280415.xv0eHt8u-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280415.xv0eHt8u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280415.xv0eHt8u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-ast2700-intc0-test.c: In function 'aspeed_intc0_resolve_route_c1i1o1mc0i2o1':
>> drivers/irqchip/irq-ast2700-intc0-test.c:351:1: warning: the frame size of 1296 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     351 | }
         | ^
   drivers/irqchip/irq-ast2700-intc0-test.c: In function 'aspeed_intc0_resolve_route_c1i2o2mc0i1o1':
   drivers/irqchip/irq-ast2700-intc0-test.c:292:1: warning: the frame size of 1296 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     292 | }
         | ^


vim +351 drivers/irqchip/irq-ast2700-intc0-test.c

   293	
   294	static void aspeed_intc0_resolve_route_c1i1o1mc0i2o1(struct kunit *test)
   295	{
   296		struct device_node intc0_node = {
   297			.fwnode = { .ops = &intc0_fwnode_ops },
   298		};
   299		struct aspeed_intc_interrupt_range c1ranges[] = {
   300			{
   301				.start = 0,
   302				.count = 1,
   303				.upstream = {
   304					.fwnode = &intc0_node.fwnode,
   305					.param_count = 1,
   306					.param = { 510 }
   307				}
   308			},
   309		};
   310		static const u32 c1outs[] = { 0 };
   311		struct aspeed_intc_interrupt_range resolved;
   312		struct aspeed_intc_interrupt_range intc0_ranges[] = {
   313			{
   314				.start = 192,
   315				.count = 1,
   316				.upstream = {
   317					.fwnode = NULL,
   318					.param_count = 0,
   319					.param = {0},
   320				}
   321			},
   322			{
   323				.start = 208,
   324				.count = 1,
   325				.upstream = {
   326					.fwnode = NULL,
   327					.param_count = 0,
   328					.param = {0},
   329				}
   330			}
   331		};
   332		struct aspeed_intc0 intc0 = {
   333			.ranges = {
   334				.ranges = intc0_ranges,
   335				.nranges = ARRAY_SIZE(intc0_ranges),
   336			}
   337		};
   338		const struct irq_domain c0domain = {
   339			.host_data = &intc0,
   340			.fwnode = &intc0_node.fwnode
   341		};
   342		int rc;
   343	
   344		rc = aspeed_intc0_resolve_route(&c0domain, ARRAY_SIZE(c1outs), c1outs,
   345						ARRAY_SIZE(c1ranges), c1ranges,
   346						&resolved);
   347		KUNIT_EXPECT_EQ(test, rc, 0);
   348		KUNIT_EXPECT_EQ(test, resolved.start, 0);
   349		KUNIT_EXPECT_EQ(test, resolved.count, 1);
   350		KUNIT_EXPECT_EQ(test, resolved.upstream.param[0], 510);
 > 351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

