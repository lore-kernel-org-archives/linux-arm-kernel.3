Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A954EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 18:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRyzivglUXHi+CSowKHU8/7C4vJL/HC+2qMhWjhVOvQ=; b=Cc40hnFqq1CMkcQwRRSwMCLml3
	Vlp4R8CWQRw7RG9Hujj/+J3aC7Ys9JyycrTQeMk0FTq3wQ63x0ps5lxw7RRa4tu08ZLEmNL72AA1g
	QM43qLkTm68BZtkGjclQTlvMjnAwdalWP6lKJOr3ls2lHEoQyjSUm+LT7rBqbrQ5RjStld4PgsZ8+
	M8AvzeQX8rNb+0gPkjdP543Lr1qpK2F0lOK/SYTPc6Nt+ogJuHh/+kVgJ9EDlkP7jCZ2v/5LQ0kFV
	MH0WTxrXDCefFMSecYYxladJ7e9sHKdTyxocVP0knogFr+RZm/0Sk1o97fkr9qArxjuBCEkscOYjG
	sQYaYIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uee5m-00000005ju6-1wKg;
	Wed, 23 Jul 2025 18:21:26 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uee3J-00000005jaK-1Mst
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 18:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753294733; x=1784830733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ea97RbKqqqhOvAPLdIIsZmefZy32CMZIYXKm105GNys=;
  b=WhY9A7emigBtyM3CONaeI8rAh3Ky1Fq4WkgNIF8AEF4HxSdi7J8AVurZ
   RWRQtYlhY9v3xZpaCIYstAk5MxsdlkmkNtRHCM07qLiEOl/JdIe6V4OyZ
   dbupnKE2vxzqn3JJr2hIjcYwRZxho3GRXWbaoO9joxFflIkTAhKFkGteA
   rx7imKFxjkqkIEkZuoPSbe7B39G0qsUf1ZhKLUdyk1jT8ULceArpwL1h/
   Ul288fpWcVtGeXzX8aGPVdE2t6GAvSFkqKf+HGmNn/mnFuHDaVXOAbt90
   QT5QIEleuqu8heQpKvVA4HIHliKBtCtjDfQSAT740FkS7uPasjrS7g69E
   Q==;
X-CSE-ConnectionGUID: w9ONLdlTTy6E70DcNbkfRg==
X-CSE-MsgGUID: UZGIDMGrQOCm99efQU9qEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55737701"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="55737701"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 11:18:52 -0700
X-CSE-ConnectionGUID: lVwVXVxUQVquUtvAZ9/OWg==
X-CSE-MsgGUID: 41nWruodScyeeaIfeOni6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="163904488"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jul 2025 11:18:50 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uee3D-000Jff-1y;
	Wed, 23 Jul 2025 18:18:47 +0000
Date: Thu, 24 Jul 2025 02:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>, suzuki.poulose@arm.com,
	mike.leach@linaro.org, alexander.shishkin@linux.intel.com,
	alexandre.torgue@foss.st.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	james.clark@linaro.org, mcoquelin.stm32@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: Re: [PATCH v5] coresight: Replace scnprintf/sprintf with
 sysfs_emit()/sysfs_emit_at()
Message-ID: <202507240249.8WCThmh3-lkp@intel.com>
References: <20250722184106.3290455-1-chelsyratnawat2001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722184106.3290455-1-chelsyratnawat2001@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_111853_381538_0AE9B30A 
X-CRM114-Status: GOOD (  11.70  )
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

Hi Chelsy,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250722]
[cannot apply to atorgue-stm32/stm32-next soc/for-next linus/master v6.16-rc7 v6.16-rc6 v6.16-rc5 v6.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chelsy-Ratnawat/coresight-Replace-scnprintf-sprintf-with-sysfs_emit-sysfs_emit_at/20250723-024400
base:   next-20250722
patch link:    https://lore.kernel.org/r/20250722184106.3290455-1-chelsyratnawat2001%40gmail.com
patch subject: [PATCH v5] coresight: Replace scnprintf/sprintf with sysfs_emit()/sysfs_emit_at()
config: arm64-randconfig-001-20250723 (https://download.01.org/0day-ci/archive/20250724/202507240249.8WCThmh3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507240249.8WCThmh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507240249.8WCThmh3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-etm4x-sysfs.c:127:20: error: use of undeclared identifier 'bu'
     127 |         return sysfs_emit(bu, "%#lx\n", val);
         |                           ^~
>> drivers/hwtracing/coresight/coresight-etm4x-sysfs.c:1336:26: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const char *' [-Wint-conversion]
    1336 |                 size = sysfs_emit(buf, size, "addr_cmp[%i] unused\n", idx);
         |                                        ^~~~
   include/linux/sysfs.h:492:39: note: passing argument to parameter 'fmt' here
     492 | int sysfs_emit(char *buf, const char *fmt, ...);
         |                                       ^
   2 errors generated.


vim +/bu +127 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c

   118	
   119	static ssize_t numvmidc_show(struct device *dev,
   120				     struct device_attribute *attr,
   121				     char *buf)
   122	{
   123		unsigned long val;
   124		struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
   125	
   126		val = drvdata->numvmidc;
 > 127		return sysfs_emit(bu, "%#lx\n", val);
   128	}
   129	static DEVICE_ATTR_RO(numvmidc);
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

