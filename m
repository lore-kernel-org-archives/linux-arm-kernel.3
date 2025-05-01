Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3141C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2LHGKpZYLksBxm5tJNfmY+BBUVfKBD3DWOouB09Lhs=; b=hSFL+4tMfzLVqAH4THPy/qXbQo
	xF/QKmWiS7clFkARfGpIvUGTGYLGtKK8LMG+Lr+ALU6dgNXNDzpMNwlVsChjhkp6UTqoAOLA/I/EV
	6RUz4klyabQpJvlJrCJY9k7Qjx9cWHsO4LqcL7rjWBKYnXIc0AN52Js8P//w324iIITcJDC/ZM4k+
	PXiJlmA3pEnCG5OsrJ7daT0C5BSLK3dfCBOf8hfurQWOIsWo5aHa/mP0cNpOiAqajJg34QYxowtH1
	f7c1dkJUI365LuqQOqR/dU8UQphyb9bZ4yK8Hh2KBlPhTUiw7c6qUdOT8QHqT7sZhUlYFFdX7VjyN
	gEcCcZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQEI-0000000F7PE-0s6V;
	Thu, 01 May 2025 09:29:18 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQCO-0000000F7Fw-2Go1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 09:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746091640; x=1777627640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z3FUNBSpbmp7v3k/CJmY5lFbQ1TQFPplgNK+yntHNR8=;
  b=YSYBLFa9CAOFq2NgOGgUtydC1LwrF9lUJobN7oVMEwG22EuUt7MpTQQ+
   7GZasUNS0/3zI55kL2tw2q5VlFH7Ot7HyS2FcIPSvIJM/tiN31dmIfhU6
   vYQ8vuC0zD6B/GjnepEYI777JyvhPL6rx77INFCfDJBZjM8Af7zolQ52B
   t89w8lWC/Qf1GTLxrxidJ4yohT3n8t8z9m89DHKcPDBeU68gFZ+Sm7qqU
   WFh2tZavde5KuEXS0cojjwGl4VXicmuE9140y96dnFm06l92XIilEGLe8
   Drl7lWTGeRAv8s13vt9/88VRALe2VxHMBJHC7OlbN5gBi5lYbTTzBmqav
   A==;
X-CSE-ConnectionGUID: FbnFCC9mQpGmqI/S8KxXoQ==
X-CSE-MsgGUID: TATUOebCRLiU0ZAK5PIamA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="51584509"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="51584509"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 02:27:18 -0700
X-CSE-ConnectionGUID: I/qWFAg7SGqQ9mZHJC7ZZA==
X-CSE-MsgGUID: o9QTmBoyRuqRtpnZz5bIJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134088028"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 May 2025 02:27:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAQCE-000453-1I;
	Thu, 01 May 2025 09:27:10 +0000
Date: Thu, 1 May 2025 17:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, bhelgaas@google.com,
	lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	saravanak@google.com, p.zabel@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 1/8] soc: renesas: r9a08g045-sysc: Add max reg offset
Message-ID: <202505011714.p63Hj7Fe-lkp@intel.com>
References: <20250430103236.3511989-2-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430103236.3511989-2-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_022720_656740_11B78563 
X-CRM114-Status: GOOD (  11.90  )
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

Hi Claudiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus geert-renesas-devel/next geert-renesas-drivers/renesas-clk robh/for-next arm64/for-next/core linus/master v6.15-rc4 next-20250430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu/soc-renesas-r9a08g045-sysc-Add-max-reg-offset/20250430-183951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250430103236.3511989-2-claudiu.beznea.uj%40bp.renesas.com
patch subject: [PATCH 1/8] soc: renesas: r9a08g045-sysc: Add max reg offset
config: arm64-randconfig-001-20250501 (https://download.01.org/0day-ci/archive/20250501/202505011714.p63Hj7Fe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011714.p63Hj7Fe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011714.p63Hj7Fe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/renesas/r9a08g045-sysc.c:23:3: error: 'const struct rz_sysc_init_data' has no member named 'max_register_offset'
      23 |  .max_register_offset = 0xe28,
         |   ^~~~~~~~~~~~~~~~~~~
>> drivers/soc/renesas/r9a08g045-sysc.c:23:25: warning: excess elements in struct initializer
      23 |  .max_register_offset = 0xe28,
         |                         ^~~~~
   drivers/soc/renesas/r9a08g045-sysc.c:23:25: note: (near initialization for 'rzg3s_sysc_init_data')


vim +23 drivers/soc/renesas/r9a08g045-sysc.c

    20	
    21	const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
    22		.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
  > 23		.max_register_offset = 0xe28,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

