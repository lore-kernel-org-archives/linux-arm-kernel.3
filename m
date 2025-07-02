Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BC1C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 06:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoltMgvC1GjC/2oh7d9MIIZTnOeywvYJ4WTTpPH1a08=; b=4aIm8zm4UAdr+NAaljO6qdWeqp
	+oswT7DseiZY+W/TJsSwfIYZTclN+m61UyoOgjfWwtEqwrJiKyJfN0yNgG12agLfuWk0EggmFKDYU
	DIM5ucsahtdUt3cVxED3MaQlyJVF20m0igA2XZrcSubbmoSadZ3jwA5oUg6kPq11gqVQs8ALYj+UY
	KpADznJuA9xTrvuzrr1jtSLxPOjEueJceVWVJFn/QJmoc4N4HkhBxuvkjKhGxAObLeMbaMncOvvPo
	yG18HSOKj4tLDLvQLVcumLMao8hkHcze6KJYDFZUMusFlDx0RZ4+Ue8FNlpjM16Ap9S9e3PzCD+SS
	GsjR4UVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWr6d-00000007QCu-2BiA;
	Wed, 02 Jul 2025 06:38:07 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWr3O-00000007Pa2-1pzM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 06:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751438086; x=1782974086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hMZ4282zP/9HuvYTYZaNGB5P3n+SJekOKkZamRjOEJw=;
  b=jCwkdvfQaZ7/EXiTrvL33o7cUt4QwieHJCtIF0rh7zAzvBcZF/uJVr/b
   oSd5eWXzkcZbghGK8aJGtShww1OCGNrQMmIH032pnq9/Jma90j5GOO/5y
   qbpNpRbZhckS0UucVQ1xVdpEQZY+rE/ooWV98PzeFYt3bsQ82R+XG9lyP
   1xWKB6zQ1q4xOrZIZ+EjzaWjn4LtWDlC0FULkGQwH4ynU4KPdf33xCbAK
   vX2I9ws/qO7c+kTEhRFAN1O2RYA/dohMNM/V+sTpFzdSEU8NZ70GGzRY/
   JHBf1WvzB3oVXGspW16abUrrFoCX/j/6I5r/uAGX7HJy4YOE7gkeP3nOM
   g==;
X-CSE-ConnectionGUID: 4/SFQte+TrWw7G7+A0GSIg==
X-CSE-MsgGUID: zoKBrXq+SkWmkdTMK+AkXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52952519"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="52952519"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 23:34:45 -0700
X-CSE-ConnectionGUID: Hn/PqNkoQmKfqs1+lkfu1w==
X-CSE-MsgGUID: yanwPjBFQRCnQ9a08djl4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153390776"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 23:34:41 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWr3G-0000G6-2m;
	Wed, 02 Jul 2025 06:34:38 +0000
Date: Wed, 2 Jul 2025 14:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Levi Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v2 11/28] coresight: Populate CPU ID into the
 coresight_device structure
Message-ID: <202507021422.Zj4Hv0CG-lkp@intel.com>
References: <20250701-arm_cs_pm_fix_v3-v2-11-23ebb864fcc1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-11-23ebb864fcc1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_233446_489244_D2945DFF 
X-CRM114-Status: GOOD (  15.89  )
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

Hi Leo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 66701750d5565c574af42bef0b789ce0203e3071]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Yan/coresight-Change-device-mode-to-atomic-type/20250701-230354
base:   66701750d5565c574af42bef0b789ce0203e3071
patch link:    https://lore.kernel.org/r/20250701-arm_cs_pm_fix_v3-v2-11-23ebb864fcc1%40arm.com
patch subject: [PATCH v2 11/28] coresight: Populate CPU ID into the coresight_device structure
config: arm-randconfig-004-20250702 (https://download.01.org/0day-ci/archive/20250702/202507021422.Zj4Hv0CG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021422.Zj4Hv0CG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021422.Zj4Hv0CG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-dummy.c:182:11: error: incompatible integer to pointer conversion assigning to 'struct device *' from 'int' [-Wint-conversion]
     182 |         desc.dev = -1;
         |                  ^ ~~
   1 error generated.


vim +182 drivers/hwtracing/coresight/coresight-dummy.c

   113	
   114	static int dummy_probe(struct platform_device *pdev)
   115	{
   116		struct device *dev = &pdev->dev;
   117		struct device_node *node = dev->of_node;
   118		struct coresight_platform_data *pdata;
   119		struct dummy_drvdata *drvdata;
   120		struct coresight_desc desc = { 0 };
   121		int ret = 0, trace_id = 0;
   122	
   123		drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
   124		if (!drvdata)
   125			return -ENOMEM;
   126	
   127		if (of_device_is_compatible(node, "arm,coresight-dummy-source")) {
   128	
   129			desc.name = coresight_alloc_device_name(&source_devs, dev);
   130			if (!desc.name)
   131				return -ENOMEM;
   132	
   133			desc.type = CORESIGHT_DEV_TYPE_SOURCE;
   134			desc.subtype.source_subtype =
   135						CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS;
   136			desc.ops = &dummy_source_cs_ops;
   137			desc.groups = coresight_dummy_groups;
   138	
   139			ret = coresight_get_static_trace_id(dev, &trace_id);
   140			if (!ret) {
   141				/* Get the static id if id is set in device tree. */
   142				ret = coresight_trace_id_get_static_system_id(trace_id);
   143				if (ret < 0) {
   144					dev_err(dev, "Fail to get static id.\n");
   145					return ret;
   146				}
   147			} else {
   148				/* Get next available id if id is not set in device tree. */
   149				trace_id = coresight_trace_id_get_system_id();
   150				if (trace_id < 0) {
   151					ret = trace_id;
   152					return ret;
   153				}
   154			}
   155			drvdata->traceid = (u8)trace_id;
   156	
   157		} else if (of_device_is_compatible(node, "arm,coresight-dummy-sink")) {
   158			desc.name = coresight_alloc_device_name(&sink_devs, dev);
   159			if (!desc.name)
   160				return -ENOMEM;
   161	
   162			desc.type = CORESIGHT_DEV_TYPE_SINK;
   163			desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_DUMMY;
   164			desc.ops = &dummy_sink_cs_ops;
   165		} else {
   166			dev_err(dev, "Device type not set\n");
   167			return -EINVAL;
   168		}
   169	
   170		pdata = coresight_get_platform_data(dev);
   171		if (IS_ERR(pdata)) {
   172			ret = PTR_ERR(pdata);
   173			goto free_id;
   174		}
   175		pdev->dev.platform_data = pdata;
   176	
   177		drvdata->dev = &pdev->dev;
   178		platform_set_drvdata(pdev, drvdata);
   179	
   180		desc.pdata = pdev->dev.platform_data;
   181		desc.dev = &pdev->dev;
 > 182		desc.dev = -1;
   183		drvdata->csdev = coresight_register(&desc);
   184		if (IS_ERR(drvdata->csdev)) {
   185			ret = PTR_ERR(drvdata->csdev);
   186			goto free_id;
   187		}
   188	
   189		pm_runtime_enable(dev);
   190		dev_dbg(dev, "Dummy device initialized\n");
   191	
   192		ret = 0;
   193		goto out;
   194	
   195	free_id:
   196		if (IS_VALID_CS_TRACE_ID(drvdata->traceid))
   197			coresight_trace_id_put_system_id(drvdata->traceid);
   198	
   199	out:
   200		return ret;
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

