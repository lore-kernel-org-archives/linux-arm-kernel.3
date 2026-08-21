Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07142C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 11:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGdy+s6vvPVR2eFIPkWzRLCO2S6RRjq3+ZNaOFZQhkk=; b=ZJyKcb+Q5rzdyxy6o47UvNPQ0S
	rNdUKfByEQ4ZmbS35EOxeCD3XFl5pE8gzdcr+GJaYU3gHCamu9Oq9rS24tfpJiQp+JMxMHWjrWjx+
	17x+jvT0aN8Lsz19OamwqDdg/3DE9nFU/gtr2nzwURYXLJbV/X7Y9Vm6XBpsFuN0QBAC6XHVskR0A
	GIzDMzpNcbyKjrgStE51yrnZVaRsUKUEu3d7mk7YcZViFn4PomAUroHUhBQK50lkCSiI9RkK+ZxHS
	S05bpFcHs1SMSaDDpTX/vDJUjkobyvdRE3e7l5aTe+wfPY796R4es4rtfFgFIRshjFPuKNH/QOCqK
	3RhYiPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxN9t-0000000D9fg-1aHg;
	Fri, 21 Aug 2026 11:11:37 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxN9q-0000000D9eX-2BBI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 11:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787310695; x=1818846695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G4qsN+t5UgXO9pKDlrGNxXYn6SnistljpZuq4z5UJsc=;
  b=gsC3ufmjxgEsFe/CzgboKjJhVFHpUxlNUnsqoR3f+uqFxgTYwR3/V+Bz
   1K/5X+9cXlKM3sD/fOLBzwETlsAkHJbHTTxxIznzKm+e59/9xtPdmfK/A
   fpo9DYVGPd1qDgeK4CghxT60h1flm/sOPB38z4PXdHxCSNAtKUEiMV1uC
   YjEEEyBjLPzXsWn2N8KmlUTaftEVlc0q+Wwj3kHhr+/Mqj9yRhJtaTCnz
   7SVrKbDmLhyUU85wRMRT0gBZs29FVO2aeQ22C9lN/vflxgk/Fch0j2P5E
   C0Jyjgxd21QmRlU7MC+9ZNinixytL5/UkLHLh7s9zPzvED3x3hIFyJrkZ
   A==;
X-CSE-ConnectionGUID: 9vwiD1QZTBW743mQgI4ovA==
X-CSE-MsgGUID: UZLeUcH3TjOgCl3oY7dhEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87776343"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87776343"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:11:34 -0700
X-CSE-ConnectionGUID: /pKJlKLZQBS+cJSz6ZSKFw==
X-CSE-MsgGUID: I0Z0KE3kQI2pfkI7eWmRew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="289846566"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2026 04:11:31 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxN9k-00000000pmz-2UIv;
	Fri, 21 Aug 2026 11:11:28 +0000
Date: Fri, 21 Aug 2026 19:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Michal Simek <monstr@monstr.eu>, Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: Re: [PATCH v5] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
Message-ID: <202608211944.Zpc0ks4e-lkp@intel.com>
References: <20260820-i2c-xiic-restore-runtime-pm-teardown-v5-1-ca5db9605508@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-i2c-xiic-restore-runtime-pm-teardown-v5-1-ca5db9605508@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_041134_635933_46D4B69B 
X-CRM114-Status: GOOD (  10.78  )
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

Hi Abdurrahman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d58772d8520c7ef247c4b95c9bd76d3a25da9ff5]

url:    https://github.com/intel-lab-lkp/linux/commits/Abdurrahman-Hussain/i2c-xiic-restore-non-managed-runtime-PM-to-fix-clk-WARN-flood/20260820-052507
base:   d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
patch link:    https://lore.kernel.org/r/20260820-i2c-xiic-restore-runtime-pm-teardown-v5-1-ca5db9605508%40nexthop.ai
patch subject: [PATCH v5] i2c: xiic: restore non-managed runtime PM to fix clk WARN flood
config: openrisc-randconfig-r072-20260821 (https://download.01.org/0day-ci/archive/20260821/202608211944.Zpc0ks4e-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211944.Zpc0ks4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608211944.Zpc0ks4e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/i2c/busses/i2c-xiic.c:106 struct member 'irq' not described in 'xiic_i2c'
>> Warning: drivers/i2c/busses/i2c-xiic.c:106 struct member 'irq' not described in 'xiic_i2c'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

