Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0309C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fvz2+8biO67pJfPaWniCW3tJmBALyd98POOu9ayPvbk=; b=YZpaAf1SeIJNid2zYVG/uNc9CN
	XxJnTAJsCBuAZ9tMILnS2vh3KHQ9ujxT11ZJomH+yxqN5pLPI+TPE2bEiWoUTQuP/Ku8EouAW3W+c
	yl65+1crMd+9r4iIfoz6zl5M/THrep8q2ulDhrMjwiZNHGEmx4ZhcCObCWjGiNQ6sadZL7hPlMvM/
	hXEBzXjGvqUDfR+OYKHXLI1sQXuqfGCxI+z0H6dc57SjF0XJ5CqizMjvGxjfgn+iT6TMzygj+deYn
	JpiqoOPxkgKhSO7lCVMIgo9AiLX1iIXQC9Pc+pVLpwZ7NS2kI6o2KK6zpi7aBj96dsR8bR0NLO8/z
	EyY/8SqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWYp-0000000G9y0-2sHk;
	Thu, 01 May 2025 16:14:55 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWWv-0000000G9qH-2krX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 16:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746115978; x=1777651978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A1YogmnGMKTMHm2zxZV4DBdy5txg2qSLdm1FpVZUDM0=;
  b=geawPvntPZzqy3F0omyRwD3vY4gSEKb0TQUXX3nTLd9sjtGAnGVwKHo2
   mfKUG5KDq1QsIrkDPZNya67pnf9/hllaL9CzluAu9HWAAOwH9l/6sZTAP
   A4ohvcWCGLHWY4ZSK4Xk3OOn0ioIlON9DoIbufIWj3uL9/6y1cX/OyK+f
   mfzaNPUihcUaBbKjdiuOA4hY6BFNmVUGDcM70W0LKLEEvH8wCn650yKBw
   ruvRip7p0qcm+xY9l1OBvSBftiLUmWBLzZL4P3kc2HzzWHs36/Xwxo+rV
   7OyiOJ1mQqaFnMSh8RdMcZz021HZYP9d7T5t30RAq48Yz0RckgLM2vzXK
   A==;
X-CSE-ConnectionGUID: QEeXp9CNT/KGM0uynOdbdA==
X-CSE-MsgGUID: XibCORVqSc+RJ1Bwup5+Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="35412794"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="35412794"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 09:12:54 -0700
X-CSE-ConnectionGUID: FCjyJbt1S+SNYnF+XFQtRQ==
X-CSE-MsgGUID: HvgOkt6kReO2rla3g5Jwvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="171656049"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 May 2025 09:12:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAWWk-0004FN-2D;
	Thu, 01 May 2025 16:12:46 +0000
Date: Fri, 2 May 2025 00:12:28 +0800
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
Message-ID: <202505012344.lIxS3e4X-lkp@intel.com>
References: <20250430103236.3511989-2-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430103236.3511989-2-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_091257_737549_4E7EEEAE 
X-CRM114-Status: GOOD (  11.68  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus geert-renesas-devel/next geert-renesas-drivers/renesas-clk robh/for-next arm64/for-next/core linus/master v6.15-rc4 next-20250501]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu/soc-renesas-r9a08g045-sysc-Add-max-reg-offset/20250430-183951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250430103236.3511989-2-claudiu.beznea.uj%40bp.renesas.com
patch subject: [PATCH 1/8] soc: renesas: r9a08g045-sysc: Add max reg offset
config: arm64-randconfig-001-20250501 (https://download.01.org/0day-ci/archive/20250501/202505012344.lIxS3e4X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505012344.lIxS3e4X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505012344.lIxS3e4X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/renesas/r9a08g045-sysc.c:23:3: error: 'const struct rz_sysc_init_data' has no member named 'max_register_offset'
      23 |  .max_register_offset = 0xe28,
         |   ^~~~~~~~~~~~~~~~~~~
   drivers/soc/renesas/r9a08g045-sysc.c:23:25: warning: excess elements in struct initializer
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

