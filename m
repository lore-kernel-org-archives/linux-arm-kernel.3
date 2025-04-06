Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9135C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kYzJ3NGNrw50ms+M82cr8hrVGsydeiDbIG9Xoh/QA1g=; b=SaU47VOkqKTjfxNT5hx4HfJWcE
	6ZY1u5WV82TCvcZpKnPEbrdcyrXlvPtyfB1NVQPVg3S3Hm5p52adWnH3iHdvZjFJ3Q9sczKzxSETP
	2thevdp8DUrDxEZHU5NgVyE9yDiNEpZwUAlM3xtA8Xg44dT9+kz2BAmP9d94SSSVmCbqCNR8afvqI
	1/Jbp8r+yvhUZDNNtPfkfPJ7nvfRblPkndlnTDDPefm6Pih0j1iJDw3TsvcetmR/PQhqD2Q1eNyRy
	4kvuYdR3WnIjCAgUdm+lxHIWy8YYExM883VawhUiL25UuFf9pVnB0/B1GN/Jjh+1xhkXWHlPQhkum
	3I7ECehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Lxo-0000000F66R-0FNx;
	Sun, 06 Apr 2025 09:06:48 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Lw4-0000000F5zw-1R6D
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 09:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743930300; x=1775466300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E8hi38LiB256y8aFjkvsxWygggRGilL+mns0Wk67p5k=;
  b=N8EsPT1J2EHjFurtXEYQ58xoLHwDk9ysM47oQKlJSP0GR09/EPZcGTQU
   XGc75tryRFl8eLPlSC189kxClwa0i1M41tSol29Jvx9YXli4dkD1GhyEJ
   jaRlDY6btM8erOoeErlqCd24B28zyaQGN4tf/L6EyJeuGG0MSb3a2yfwH
   OTp+W4cgFTydmWQ/G8CN8HOrNMbsY5wEkdA4XJfaK5a4eb0SQMzeQxPSP
   wSmSdHfi8oSmee9lOJ2Sxb4rRFc2Y3DzUbxemm7WBI8VLhYLenlkRevuO
   S6GBcmNvxW5E80id6c5/oyMcJ+61Jsuf+zJIGS8R2J8Sb9uob3dmef0yw
   Q==;
X-CSE-ConnectionGUID: g4tJvvfvTz2eqy9cJmASWQ==
X-CSE-MsgGUID: 2SCpOwROSRuFEAPHuKsvQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="49175874"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="49175874"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 02:04:52 -0700
X-CSE-ConnectionGUID: 3F0V8q8NRB6gOysNhrHJlw==
X-CSE-MsgGUID: r1gfQllhQfWWAL+rGtNYmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132823443"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Apr 2025 02:04:51 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1Lvt-0002Vn-1u;
	Sun, 06 Apr 2025 09:04:49 +0000
Date: Sun, 6 Apr 2025 17:04:27 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 17/25] kernel/irq/irqdomain.c:922:1:
 warning: control reaches end of non-void function
Message-ID: <202504061643.olUiUk0A-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_020500_419573_7A26408E 
X-CRM114-Status: UNSURE (   9.41  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/ppi
head:   aefa1f7be0ec85eaa2d21637deea85660d4c153a
commit: 56d963e82dae51037c004093c820370a4ad96cba [17/25] WIP
config: powerpc64-randconfig-002-20250406 (https://download.01.org/0day-ci/archive/20250406/202504061643.olUiUk0A-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504061643.olUiUk0A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504061643.olUiUk0A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/irqdomain.c: In function 'irq_populate_fwspec_info':
   kernel/irq/irqdomain.c:916:29: error: 'const struct irq_domain_ops' has no member named 'get_info'
     if (!domain || !domain->ops->get_info) {
                                ^~
   kernel/irq/irqdomain.c:921:20: error: 'const struct irq_domain_ops' has no member named 'get_info'
     return domain->ops->get_info(info);
                       ^~
>> kernel/irq/irqdomain.c:922:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +922 kernel/irq/irqdomain.c

   910	
   911	int irq_populate_fwspec_info(struct irq_fwspec_info *info)
   912	{
   913		struct irq_domain *domain;
   914	
   915		domain = fwspec_to_domain(&info->fwspec);
 > 916		if (!domain || !domain->ops->get_info) {
   917			info->flags = 0;
   918			return 0;
   919		}
   920	
   921		return domain->ops->get_info(info);
 > 922	}
   923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

