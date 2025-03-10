Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83FFC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 07:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I//R11pZ/daiN1uG0GFWL5OWJgcHhql990ete3j3oC8=; b=MoCtr59xM0+h9wy+ZxYSchb4h4
	1x2oZncXpNVdorYaIk60lLNS3u9bBKW/9zjT5ail9MKmH0rkltEuopVdy7IiWQRWswzh3/Xu4aKfG
	RMGT49GDVbqf922Q9CtCEgr8pX3hUGVnk/P/aF7d38XZbarB4GyNSqBKRvMiY01xzNPzThAXhiOFK
	Drtw5bmRYr7VNwdBDMHcdWe7XXxGvS0pcI1tGoJR9dqcEAYkvmbxzXEmRYiKSyig9SuGmazNDMkuQ
	kMnrYNNb13N+Dd2DqyNLiefSD2N5qehPTefG/hNg9kstMEGBNDFst8MreNb7HET86qSryyijmKC7o
	USkYN+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trXeF-00000001lZK-3VYD;
	Mon, 10 Mar 2025 07:34:03 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trXZS-00000001kju-27pH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 07:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741591746; x=1773127746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ssEg4vPopMVhOA1s0W0lhcWOtIh6Cxqt2KYRDMOOri4=;
  b=czL7vwnTw6CJ/lNsel/aF9ybAEVaxVXPnccBLXbfJ9OdlJexA6OE8W9c
   wbkZDbh+hlgAIsUObvjC4Hq18GpOrjllLcu5JWWP5YCsxblQgYiomcJGp
   vpOn1lmXGfbB1QfF5Xj1bWT7mFbxhLIM7rStO2t3Rm0TO6xRlejrRQmuR
   GohQGNhM7B0ZyqVHXsRMv4pZ7gguarYAGXh3esSq7vh4zwrughP6tpehM
   Zug56pNa5MDqTUFK0hkAkqqXW4WFAseTQzvBgOvRHhCwfRxXvlVVGlRNk
   TsPQD8PCoBNp6EO61y+I3sJH/dqK2uJkF8sJ921/W2xAEvpr8I6CkIccR
   A==;
X-CSE-ConnectionGUID: DI/FHxlPR6mhBcxyn1LJLw==
X-CSE-MsgGUID: WUITYhPKT4e0oE6vJAvRlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="65017624"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="65017624"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 00:29:04 -0700
X-CSE-ConnectionGUID: iTIwBm7ARi+jwHUHMJcJjw==
X-CSE-MsgGUID: dq70DRYETUWoDTmHCnfvGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119847504"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Mar 2025 00:29:01 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trXZ9-0003wI-0V;
	Mon, 10 Mar 2025 07:28:50 +0000
Date: Mon, 10 Mar 2025 15:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Chen <kevin_chen@aspeedtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, derek.kiernan@amd.com,
	dragan.cvetic@amd.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Kevin Chen <kevin_chen@aspeedtech.com>
Subject: Re: [PATCH v2 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
Message-ID: <202503101519.AIZNCLz1-lkp@intel.com>
References: <20250304104434.481429-4-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304104434.481429-4-kevin_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_002906_610723_1AD53F2B 
X-CRM114-Status: GOOD (  11.69  )
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

Hi Kevin,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus robh/for-next linus/master v6.14-rc6 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Chen/ARM-dts-aspeed-g6-Add-AST2600-LPC-PCC-support/20250304-194530
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250304104434.481429-4-kevin_chen%40aspeedtech.com
patch subject: [PATCH v2 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
config: s390-randconfig-r112-20250310 (https://download.01.org/0day-ci/archive/20250310/202503101519.AIZNCLz1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250310/202503101519.AIZNCLz1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101519.AIZNCLz1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:14,
                    from include/linux/of_address.h:7,
                    from drivers/mfd/syscon.c:18:
   drivers/mfd/syscon.c: In function 'of_syscon_register':
>> arch/s390/include/asm/io.h:31:17: error: implicit declaration of function 'iounmap' [-Wimplicit-function-declaration]
      31 | #define iounmap iounmap
         |                 ^~~~~~~
   drivers/mfd/syscon.c:157:9: note: in expansion of macro 'iounmap'
     157 |         iounmap(base);
         |         ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_SYSCON
   Depends on [n]: HAS_IOMEM [=n]
   Selected by [y]:
   - ASPEED_LPC_PCC [=y]


vim +/iounmap +31 arch/s390/include/asm/io.h

cd24834130ac65 Jan Glauber 2012-11-29  26  
b43b3fff042d08 Baoquan He  2023-07-06  27  /*
b43b3fff042d08 Baoquan He  2023-07-06  28   * I/O memory mapping functions.
b43b3fff042d08 Baoquan He  2023-07-06  29   */
b43b3fff042d08 Baoquan He  2023-07-06  30  #define ioremap_prot ioremap_prot
b43b3fff042d08 Baoquan He  2023-07-06 @31  #define iounmap iounmap
b43b3fff042d08 Baoquan He  2023-07-06  32  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

