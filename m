Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B72C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eZv0v0RPsaRBDEnnpvD31HKBEhLM68+tgkU8WpLqeDU=; b=UcQnOA+EmR19QerFmi1kDJZqUI
	jvUzGa5S9wzwDkeny3/oO9pLW2xgmosfrnLZN4eb2LfLjZUoueThwNCeMEJxjYu5dikuric7BgNzA
	kmmQEk7H6uLeqs78lCvVcdmI+SYWs8PdQtMAM7zJ7t4XrmP+S3LmXnboL4elsd6ksN3w1saNtxyS/
	9qzuAJ7/BmpdWAScMEfalcTEQRwFIWHrN4wlor3xy8c3SDz9bU/Loxb4kOtVnc/74yCCFiZbGtyfP
	7oI4wjwBqF+sZfiR74yowsPIIcCi4OmF3V4vQsFQK+S5F2g3l/DQ1diq24VGIaCktjWwsn1GaOAFw
	59H+84iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Mvt-0000000FAly-1Jvz;
	Sun, 06 Apr 2025 10:08:53 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Mu8-0000000FAhY-2Dfg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 10:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743934025; x=1775470025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ogaiLm7zY7ExBvhU0wCaTIh4FloWzuJpR27AS/K70I=;
  b=L8YAh5f8+Nu9VyQ+CjdJeqMviIS/2KCQoIGLUi3q1HwO/69Fa8xrOF7P
   UOPISR4LStkxxo7oJNQbH7Qwbo7sqB356KMLYk95STNq2b5MgUtim4WBq
   LYGYPO162cqRHoeEuE5Sw2twkl75gVk8sLKaSTsRXOWGfZrt+r+hADluy
   oDhcp/CNX/CpuF4qySvQrK33eQQuTBeoyQ1Scs5PZPZs4yJUZI7eAedWM
   PkTqrBbOHEbzxYPZUWawc2y3xPM+Hzm6bE0XjtHI6KgqhSae8UI2LYJ2d
   x6Et4dWmF35bIRh448V1ud0+OTG+gZOKvfrFZBaIU+SR1Hzea3pJND9uY
   A==;
X-CSE-ConnectionGUID: 3nJw1+YNQdOfe6AK6a9P8Q==
X-CSE-MsgGUID: lsxQO8ETQ2CrBaJJD2V1zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45233983"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45233983"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 03:06:58 -0700
X-CSE-ConnectionGUID: +l1EkKxwQsCeiPffdfRl3g==
X-CSE-MsgGUID: FKlNzjpRTdqTodCMG5Daeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128009202"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2025 03:06:57 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1Mtz-0002Xd-0w;
	Sun, 06 Apr 2025 10:06:55 +0000
Date: Sun, 6 Apr 2025 18:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 17/25] kernel/irq/irqdomain.c:916:29: error:
 'const struct irq_domain_ops' has no member named 'get_info'
Message-ID: <202504061741.GTuVK3RN-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_030704_651685_56FE45EE 
X-CRM114-Status: UNSURE (   8.68  )
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
config: powerpc64-randconfig-002-20250406 (https://download.01.org/0day-ci/archive/20250406/202504061741.GTuVK3RN-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504061741.GTuVK3RN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504061741.GTuVK3RN-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq/irqdomain.c: In function 'irq_populate_fwspec_info':
>> kernel/irq/irqdomain.c:916:29: error: 'const struct irq_domain_ops' has no member named 'get_info'
     if (!domain || !domain->ops->get_info) {
                                ^~
   kernel/irq/irqdomain.c:921:20: error: 'const struct irq_domain_ops' has no member named 'get_info'
     return domain->ops->get_info(info);
                       ^~
   kernel/irq/irqdomain.c:922:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +916 kernel/irq/irqdomain.c

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
   922	}
   923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

