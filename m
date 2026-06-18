Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A8ECD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 01:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=07ixWa7CowS3y566xYgdTDtfKDQzcKoK3/aSNkb6U2U=; b=gWs6xni9Fd1jetD13qtMwsYpmf
	cF+Gg/J6XPdjtSb6vJKhEdxgCtRnsYGPxAUrURmdZl2OoLsv+/VBO4TGJ1kqzomWd0ycjsET0pdth
	j+aliiIDKH7MaM4bou8ppavybmec68UupIPZLe62xrda9nGJ8t1dnx6OdTsdynllKHsuJtf3pQEr1
	1KZ3DqKGS1ufwTHEm2Gv4Q7jCSmGl/xj5pXZOEbyVjl9ifNjAnbSBtGmgd+3lKVshu4t8TGmDudcr
	9TXOjs8YIWNGx8vWefBWsp4gXPsXw6D4kPRNMbFVci1DAdjUzwS3PcT8xkpOVa9SuwPpzqa7Wd4DV
	WTN5TTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1aW-00000000U5L-34w3;
	Thu, 18 Jun 2026 01:30:36 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1aT-00000000U51-1j94
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 01:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781746233; x=1813282233;
  h=date:from:to:cc:subject:message-id;
  bh=rikrzvMbwE83Q3o23a5nIJneGy+IZo3Mb538f9x2/84=;
  b=aSGqknekUee64Lv7J/KE9w1j5o5qhSJZkok+wiS2PcPEgCQiYlI1vQGG
   dlTHLaS1p4jMXwWGsNP4yq2y7BSf5qtl6GKbsvY+3oy8st2p9zF/KZbFV
   x7OhdhONoOnPGdMur+1jZtleD13QARFFIfQoOUUfBK8Hh66lfOIMhF/XI
   T/SIa6Ijt5C73gGATdU44KgE6gJ26gSujHNmgi7r9QlVYcUmj2/9x3/5z
   nnf3nUOWTdPD4Oq+Qs0a9nX9P94Lo112BTsGmv1Hp+bn9nHA2avz0L61E
   //YAA7GL+5QpVYv5hYP/sf0Lbf3fHiNVecRJPAE5dx/sCupsBaSCwN8nf
   w==;
X-CSE-ConnectionGUID: mwjHaUHIQnmJlqH5VH9QvQ==
X-CSE-MsgGUID: 1YH4pLeVTlSHa4JeGG3Hzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93683036"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="93683036"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 18:30:31 -0700
X-CSE-ConnectionGUID: PAwLA+5bRl2TYcrX7pe6fw==
X-CSE-MsgGUID: EyMFud9aQea+0+JsFa9uvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="252536545"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2026 18:30:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa1aN-00000000V9w-066E;
	Thu, 18 Jun 2026 01:30:27 +0000
Date: Thu, 18 Jun 2026 09:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-power-domains-v7.1 6/11]
 include/linux/mfd/dbx500-prcmu.h:408:19: error: redefinition of
 'prcmu_abb_read'
Message-ID: <202606180825.vUSQntkJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_183033_573635_66662A55 
X-CRM114-Status: UNSURE (   8.95  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-power-domains-v7.1
head:   b2481ed07ce2ef552c0104079bdcde6d532ec16b
commit: a5269e25e37c9ec0e13756f8fc3d109eaa291721 [6/11] pmdomain: st: ux500: Control DB8500 EPODs
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260618/202606180825.vUSQntkJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606180825.vUSQntkJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180825.vUSQntkJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pmdomain/st/ste-ux500-pm-domain.c:13:
>> include/linux/mfd/dbx500-prcmu.h:408:19: error: redefinition of 'prcmu_abb_read'
     408 | static inline int prcmu_abb_read(u8 slave, u8 reg, u8 *value, u8 size)
         |                   ^~~~~~~~~~~~~~
   In file included from include/linux/mfd/dbx500-prcmu.h:212:
   include/linux/mfd/db8500-prcmu.h:638:19: note: previous definition of 'prcmu_abb_read' with type 'int(u8,  u8,  u8 *, u8)' {aka 'int(unsigned char,  unsigned char,  unsigned char *, unsigned char)'}
     638 | static inline int prcmu_abb_read(u8 slave, u8 reg, u8 *value, u8 size)
         |                   ^~~~~~~~~~~~~~
>> include/linux/mfd/dbx500-prcmu.h:413:19: error: redefinition of 'prcmu_abb_write'
     413 | static inline int prcmu_abb_write(u8 slave, u8 reg, u8 *value, u8 size)
         |                   ^~~~~~~~~~~~~~~
   include/linux/mfd/db8500-prcmu.h:643:19: note: previous definition of 'prcmu_abb_write' with type 'int(u8,  u8,  u8 *, u8)' {aka 'int(unsigned char,  unsigned char,  unsigned char *, unsigned char)'}
     643 | static inline int prcmu_abb_write(u8 slave, u8 reg, u8 *value, u8 size)
         |                   ^~~~~~~~~~~~~~~
>> include/linux/mfd/dbx500-prcmu.h:424:19: error: redefinition of 'prcmu_config_clkout'
     424 | static inline int prcmu_config_clkout(u8 clkout, u8 source, u8 div)
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/mfd/db8500-prcmu.h:608:19: note: previous definition of 'prcmu_config_clkout' with type 'int(u8,  u8,  u8)' {aka 'int(unsigned char,  unsigned char,  unsigned char)'}
     608 | static inline int prcmu_config_clkout(u8 clkout, u8 source, u8 div)
         |                   ^~~~~~~~~~~~~~~~~~~
>> include/linux/mfd/dbx500-prcmu.h:486:19: error: redefinition of 'prcmu_ac_wake_req'
     486 | static inline int prcmu_ac_wake_req(void)
         |                   ^~~~~~~~~~~~~~~~~
   include/linux/mfd/db8500-prcmu.h:648:19: note: previous definition of 'prcmu_ac_wake_req' with type 'int(void)'
     648 | static inline int prcmu_ac_wake_req(void)
         |                   ^~~~~~~~~~~~~~~~~
>> include/linux/mfd/dbx500-prcmu.h:491:20: error: redefinition of 'prcmu_ac_sleep_req'
     491 | static inline void prcmu_ac_sleep_req(void) {}
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/mfd/db8500-prcmu.h:653:20: note: previous definition of 'prcmu_ac_sleep_req' with type 'void(void)'
     653 | static inline void prcmu_ac_sleep_req(void) {}
         |                    ^~~~~~~~~~~~~~~~~~


vim +/prcmu_abb_read +408 include/linux/mfd/dbx500-prcmu.h

fea799e3d3ab84a Mattias Nilsson 2011-08-12  407  
fea799e3d3ab84a Mattias Nilsson 2011-08-12 @408  static inline int prcmu_abb_read(u8 slave, u8 reg, u8 *value, u8 size)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  409  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  410  	return -ENOSYS;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  411  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  412  
fea799e3d3ab84a Mattias Nilsson 2011-08-12 @413  static inline int prcmu_abb_write(u8 slave, u8 reg, u8 *value, u8 size)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  414  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  415  	return -ENOSYS;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  416  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  417  
3c3e489831b601e Mattias Nilsson 2012-03-08  418  static inline int prcmu_abb_write_masked(u8 slave, u8 reg, u8 *value, u8 *mask,
3c3e489831b601e Mattias Nilsson 2012-03-08  419  	u8 size)
3c3e489831b601e Mattias Nilsson 2012-03-08  420  {
3c3e489831b601e Mattias Nilsson 2012-03-08  421  	return -ENOSYS;
3c3e489831b601e Mattias Nilsson 2012-03-08  422  }
3c3e489831b601e Mattias Nilsson 2012-03-08  423  
fea799e3d3ab84a Mattias Nilsson 2011-08-12 @424  static inline int prcmu_config_clkout(u8 clkout, u8 source, u8 div)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  425  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  426  	return 0;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  427  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  428  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  429  static inline int prcmu_request_clock(u8 clock, bool enable)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  430  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  431  	return 0;
6b6fae2b890826c Mattias Nilsson 2012-01-13  432  }
6b6fae2b890826c Mattias Nilsson 2012-01-13  433  
6b6fae2b890826c Mattias Nilsson 2012-01-13  434  static inline long prcmu_round_clock_rate(u8 clock, unsigned long rate)
6b6fae2b890826c Mattias Nilsson 2012-01-13  435  {
6b6fae2b890826c Mattias Nilsson 2012-01-13  436  	return 0;
6b6fae2b890826c Mattias Nilsson 2012-01-13  437  }
6b6fae2b890826c Mattias Nilsson 2012-01-13  438  
6b6fae2b890826c Mattias Nilsson 2012-01-13  439  static inline int prcmu_set_clock_rate(u8 clock, unsigned long rate)
6b6fae2b890826c Mattias Nilsson 2012-01-13  440  {
6b6fae2b890826c Mattias Nilsson 2012-01-13  441  	return 0;
6b6fae2b890826c Mattias Nilsson 2012-01-13  442  }
6b6fae2b890826c Mattias Nilsson 2012-01-13  443  
6b6fae2b890826c Mattias Nilsson 2012-01-13  444  static inline unsigned long prcmu_clock_rate(u8 clock)
6b6fae2b890826c Mattias Nilsson 2012-01-13  445  {
6b6fae2b890826c Mattias Nilsson 2012-01-13  446  	return 0;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  447  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  448  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  449  static inline int prcmu_set_ape_opp(u8 opp)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  450  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  451  	return 0;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  452  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  453  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  454  static inline int prcmu_get_ape_opp(void)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  455  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  456  	return APE_100_OPP;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  457  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  458  
686f871b7109e7e Ulf Hansson     2012-09-24  459  static inline int prcmu_request_ape_opp_100_voltage(bool enable)
686f871b7109e7e Ulf Hansson     2012-09-24  460  {
686f871b7109e7e Ulf Hansson     2012-09-24  461  	return 0;
686f871b7109e7e Ulf Hansson     2012-09-24  462  }
686f871b7109e7e Ulf Hansson     2012-09-24  463  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  464  static inline int prcmu_set_arm_opp(u8 opp)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  465  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  466  	return 0;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  467  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  468  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  469  static inline int prcmu_get_arm_opp(void)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  470  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  471  	return ARM_100_OPP;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  472  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  473  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  474  static inline int prcmu_get_ddr_opp(void)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  475  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  476  	return DDR_100_OPP;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  477  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  478  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  479  static inline void prcmu_system_reset(u16 reset_code) {}
fea799e3d3ab84a Mattias Nilsson 2011-08-12  480  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  481  static inline u16 prcmu_get_reset_code(void)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  482  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  483  	return 0;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  484  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  485  
5261e101198e7ef Arun Murthy     2012-05-21 @486  static inline int prcmu_ac_wake_req(void)
5261e101198e7ef Arun Murthy     2012-05-21  487  {
5261e101198e7ef Arun Murthy     2012-05-21  488  	return 0;
5261e101198e7ef Arun Murthy     2012-05-21  489  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  490  
fea799e3d3ab84a Mattias Nilsson 2011-08-12 @491  static inline void prcmu_ac_sleep_req(void) {}
fea799e3d3ab84a Mattias Nilsson 2011-08-12  492  

:::::: The code at line 408 was first introduced by commit
:::::: fea799e3d3ab84ac675de7e48a13a79fb76b6e63 mfd: Create a common interface for dbx500 PRCMU drivers

:::::: TO: Mattias Nilsson <mattias.i.nilsson@stericsson.com>
:::::: CC: Samuel Ortiz <sameo@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

