Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53DBFD7061
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2spmyqEbYSe5Avm1c8N0AoCJK5z7omUHcYdoteouIG4=; b=Yy2uHeXvgVR4pc3mK6DGRYA8i/
	US+fQlP4vBJAkIT+q8eKBPzXn6OgV6HdhMN/gXReHMnRlgEAv4IE7OQAyAo7dKjROrDgLFTgxfOpr
	J50fAtZWlNURRqx+eUGTWjBGXH+wHecF8j1OWOV8+d5XPQ7PVYKwGxJ05ethmVRfHG6YJXcwlQclt
	Ytibaw1dIGQA1KFo530KFwp+OnE6VYELIJZYpW4jk+2oYA+pYUD4LxGrLS1yjgvLNys8GMFjw8OWi
	otwHJ9yPgArfvXZZYAzmPT3zoP+pKa89A1OonQg4LoMLQSm8JTPZ6pWP6iXYXQmL7mdJkScPDW7wI
	5G+bgXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RNz-00000005xNr-3vUJ;
	Tue, 17 Mar 2026 10:10:51 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RNx-00000005xNV-3ZDu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773742250; x=1805278250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pjLtVEXYu6Ezm9WVwTnSwzGyT6cFbKsaKtpF/hqBJGc=;
  b=aDE7hnPVGPloTKynfjaPxCcfKxync+NScFdw9AUWhktJwAMdsu6PV3IJ
   /IYwwNnVOcgfxzu6WS1eKNVq6Poe+lPey2Mt1rFLz6h9PnWceUVuj3ksA
   CK8Nn/ZZQ5JlIz2mMhnzpb51vphiS+LjPyEnJCaa9x1UKD2dIpHG4Pn+Z
   PhaS4BsAwpZGrvv3eiLVYMsSbxWGX6osoyWeP/+oJRm2sTWmfin0i+gk4
   iyWIALcbWJMcAeCZqI23TgGLHemmB5y1P8igyuxTjc3zv+jZrcbROeonv
   JGGW8R4ZW9y1q+pAXjwRb95+RhfBAxU9xdKjXqA+wMkxt8whnkjmp//NZ
   Q==;
X-CSE-ConnectionGUID: z8FdMAboT/SpecOpBRyMDg==
X-CSE-MsgGUID: 7zaFrYuzR9u6OM+9fv8hoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73947787"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="73947787"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:10:47 -0700
X-CSE-ConnectionGUID: rZW/vNdCSgKXquYHdxLMXA==
X-CSE-MsgGUID: P9pMYPriQluzlqeXNUdWPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="224396867"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Mar 2026 03:10:43 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2RNo-000000000Dd-19DE;
	Tue, 17 Mar 2026 10:10:40 +0000
Date: Tue, 17 Mar 2026 18:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v15 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
Message-ID: <202603171821.OtWlpARW-lkp@intel.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-6-1777f14ed319@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-6-1777f14ed319@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_031049_944634_20DB2A2A 
X-CRM114-Status: GOOD (  11.83  )
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

Hi Jie,

kernel test robot noticed the following build errors:

[auto build test ERROR on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/coresight-core-refactor-ctcu_get_active_port-and-make-it-generic/20260315-052703
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-6-1777f14ed319%40oss.qualcomm.com
patch subject: [PATCH v15 6/7] coresight: ctcu: enable byte-cntr for TMC ETR devices
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260317/202603171821.OtWlpARW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171821.OtWlpARW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171821.OtWlpARW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c:177:3: error: cannot jump from this goto statement to its label
     177 |                 goto out;
         |                 ^
   drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c:179:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     179 |         guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
         |         ^
   include/linux/cleanup.h:419:2: note: expanded from macro 'guard'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:300:3: note: expanded from macro 'CLASS'
     300 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:18:1: note: expanded from here
      18 | class_raw_spinlock_irqsave_constructor
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:24:1: note: expanded from here
      24 | __UNIQUE_ID_unlock_802
         | ^
   drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c:179:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/cleanup.h:419:15: note: expanded from macro 'guard'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:168:2: note: expanded from macro '__UNIQUE_ID'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:12:1: note: expanded from here
      12 | __UNIQUE_ID_guard_801
         | ^
   1 error generated.


vim +177 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c

   156	
   157	static int tmc_read_prepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
   158	{
   159		struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
   160		struct ctcu_byte_cntr *byte_cntr_data;
   161		int ret = 0;
   162	
   163		/* byte-cntr is operating with SYSFS mode being enabled only */
   164		if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_SYSFS)
   165			return -EINVAL;
   166	
   167		byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
   168		if (!byte_cntr_data || !byte_cntr_data->irq_enabled)
   169			return -EINVAL;
   170	
   171		if (byte_cntr_data->reading)
   172			return -EBUSY;
   173	
   174		/* Setup an available etr_buf_list for byte-cntr */
   175		ret = tmc_create_etr_buf_list(etr_drvdata, 2);
   176		if (ret)
 > 177			goto out;
   178	
   179		guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
   180		atomic_set(&byte_cntr_data->irq_cnt, 0);
   181		/*
   182		 * Configure the byte-cntr register to enable IRQ. The configured
   183		 * size is 5% of the buffer_size.
   184		 */
   185		ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata,
   186				       etr_drvdata->size / MAX_IRQ_CNT,
   187				       byte_cntr_data->irq_ctrl_offset);
   188		enable_irq_wake(byte_cntr_data->irq);
   189		byte_cntr_data->buf_node = NULL;
   190		byte_cntr_data->reading = true;
   191	
   192	out:
   193		return ret;
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

