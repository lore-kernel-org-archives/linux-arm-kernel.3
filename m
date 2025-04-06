Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADBFC36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 16:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZNzhcP+58tzl7neif3+9ZvEYUY999/jgt4z3xJWaHNk=; b=Pye1oLq9qyDKHI6LJmDeXPdj/j
	Ej1AUOuLrVvqKXHx0MmeTAFYQXmzg+5nmwmJRQRx1trsjiO5DIAlaUpNm6EWuIKthCCBkQbXARBDr
	KrUuIW5QVjO9w7tqPnkjVJHQYCjujSxGNcnVXDujgEIlC1gYRwoZtZrX9+O/ut9ddB+aVaYxmkbJi
	nuQDIgF/i8fs5CGTUIFD9ezZMOjmsXUFrZaXkELhZJw+TvVNroJZj3M6lU5AvE2snWwbPMOTaiiG8
	X4AcecnuIRqsxO9zW+9KulhhND69rAhy/o2xe9+y/12rg/hswzmeCEoZQaCv0jZLqgHWCV+sEqAyE
	csA6x8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1St9-0000000FXss-04oQ;
	Sun, 06 Apr 2025 16:30:27 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1SrO-0000000FXmb-2uaJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 16:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743956918; x=1775492918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2tnRdVF34BFIEQ+j55XIsruwWYVdNafgaJHyI9uxk2o=;
  b=ENofa0kNSnLC0WEcYwSPuUphzE1CUl7fYfp3wqPl828IyVpknyh+KYCr
   7ofaV/gJ8le8A6JAtRcYbz3lEJZ0EgxQe9QU1wzvVcMQaAKABhA9WI3Pc
   rzlHORzKZXW53lEiFm8ZezrUleftp8EwPKEsZjoiYCcKhHfT1q/48Xjz6
   9tT1YuRVhUC2oEIr7uCPRbAU4gIwdLgcYBQOnopdOj2LfDBGxN/kMHwcE
   WGj1RX+tcI4YPwdj9xF4Vx/NXieQE7XF3fPCIb5O72p1AK8Jlwfu/LTfw
   bBd04lR3hWRmnGm2CoNkpKfJfYq0KfjjB6lxRQd7R5cfj3jJsLGzMQuSj
   A==;
X-CSE-ConnectionGUID: 2rPI2TW2S9OWyujVpa/oQg==
X-CSE-MsgGUID: +ipnfTs6QByCJxVDEvDMZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="62885256"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="62885256"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 09:28:33 -0700
X-CSE-ConnectionGUID: nWxip8bcQx2MgZw8wTu0Qg==
X-CSE-MsgGUID: F2Aq/NdYSHu/2VL8+1QM3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128257378"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2025 09:28:32 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1SrF-0002hG-2T;
	Sun, 06 Apr 2025 16:28:29 +0000
Date: Mon, 7 Apr 2025 00:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 8/13] include/linux/irqdomain.h:765:12:
 warning: 'irq_populate_fwspec_info' defined but not used
Message-ID: <202504070043.zBFNF505-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_092838_780610_7B1553C1 
X-CRM114-Status: GOOD (  10.22  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/ppi
head:   2eb268faef9c9204898770ee24a676c213566794
commit: 069b6b94df996439ad61f8ad9f15617097a09fa9 [8/13] fixup! new affinity retrieval API
config: powerpc64-randconfig-002-20250406 (https://download.01.org/0day-ci/archive/20250407/202504070043.zBFNF505-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504070043.zBFNF505-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504070043.zBFNF505-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/of_irq.h:8:0,
                    from drivers/crypto/inside-secure/safexcel.c:16:
>> include/linux/irqdomain.h:765:12: warning: 'irq_populate_fwspec_info' defined but not used [-Wunused-function]
    static int irq_populate_fwspec_info(struct irq_fwspec_info *info)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c: In function 'safexcel_probe_generic.constprop':
   drivers/crypto/inside-secure/safexcel.c:1162:30: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      snprintf(irq_name, 6, "ring%d", irqid);
                                 ^~
   drivers/crypto/inside-secure/safexcel.c:1162:25: note: directive argument in the range [0, 2147483647]
      snprintf(irq_name, 6, "ring%d", irqid);
                            ^~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:1162:3: note: 'snprintf' output between 6 and 15 bytes into a destination of size 6
      snprintf(irq_name, 6, "ring%d", irqid);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:1667:32: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      snprintf(wq_name, 9, "wq_ring%d", i);
                                   ^~
   drivers/crypto/inside-secure/safexcel.c:1667:24: note: directive argument in the range [0, 2147483647]
      snprintf(wq_name, 9, "wq_ring%d", i);
                           ^~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:1667:3: note: 'snprintf' output between 9 and 18 bytes into a destination of size 9
      snprintf(wq_name, 9, "wq_ring%d", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/of_irq.h:8:0,
                    from safexcel.c:16:
>> include/linux/irqdomain.h:765:12: warning: 'irq_populate_fwspec_info' defined but not used [-Wunused-function]
    static int irq_populate_fwspec_info(struct irq_fwspec_info *info)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   safexcel.c: In function 'safexcel_probe_generic.constprop':
   safexcel.c:1162:30: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      snprintf(irq_name, 6, "ring%d", irqid);
                                 ^~
   safexcel.c:1162:25: note: directive argument in the range [0, 2147483647]
      snprintf(irq_name, 6, "ring%d", irqid);
                            ^~~~~~~~
   safexcel.c:1162:3: note: 'snprintf' output between 6 and 15 bytes into a destination of size 6
      snprintf(irq_name, 6, "ring%d", irqid);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   safexcel.c:1667:32: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      snprintf(wq_name, 9, "wq_ring%d", i);
                                   ^~
   safexcel.c:1667:24: note: directive argument in the range [0, 2147483647]
      snprintf(wq_name, 9, "wq_ring%d", i);
                           ^~~~~~~~~~~
   safexcel.c:1667:3: note: 'snprintf' output between 9 and 18 bytes into a destination of size 9
      snprintf(wq_name, 9, "wq_ring%d", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/irq_populate_fwspec_info +765 include/linux/irqdomain.h

   764	
 > 765	static int irq_populate_fwspec_info(struct irq_fwspec_info *info)
   766	{
   767		return -EINVAL;
   768	}
   769	#endif	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
   770	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

