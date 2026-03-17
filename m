Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2C0F33819
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wy903wlfjtiJhF4fSetGa3zEAMUsJvIeBXoF3fyvig4=; b=E0wUWS+CLHkFFpHO+jouwvm6Jh
	BCdeHjCdXy2K1vkht3nW0JPt4l/1LtvYXkgVWBK+MN/t8HEIanvcwrtJf1KEda9U2ScgBS5+3/jEc
	e3chmzN4/ekxUfmu/SjLKakBskhlQJVNJGdaSjY5HYCYwC7QowVBuVhYPqqnis1D/IOpKgkTsSGJB
	gzgsNSer4KGoZ2fdpdh2BkB7v8n+E01lH3Mw/UxrwvJYWcXqGxTTu6wWgT5heUzqMtKf+kW5MPB1D
	YCNvHepxDirpfjTaGcWXsI/zHjKtZp/3+lzd1Fm7JmreDM6YeedX3O9T3CVcVVFx7u5jbiBSf1wYr
	Rwbd350w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q2X-00000005kh8-3W1B;
	Tue, 17 Mar 2026 08:44:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q2W-00000005kgp-0QjN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 08:44:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Wy903wlfjtiJhF4fSetGa3zEAMUsJvIeBXoF3fyvig4=; b=SU57S9weKaL+c2pwyDlwsgu5qz
	WaEabcxjifymqoQlVipWcPe2LYAMsdfE/68mshK7QjEFLmBh/qsmPOgfiPe69GvlRx8w4ht7nGFj3
	7l8gyYVRbrNOUciWosTPkzAK+dLdi7Q2+l3yr0JQU+bYf2RsgSTxBnaNEP/8Cai3qhhE/weGDQPg7
	xbopUlpmlZZrsQzzmsT4mLYBnPEtcBGzshOYY9IsZsWuEv8qEqZ9C/ZGJVRkZX+UjNtdCH3bMBlxj
	86GXxshDtHJw4bPFl7pZLSDIAdE4JAHsZ74Ho7WgrTplcxCA4a8xrgtMh2TK+J1NkmoTVh4Gm7x56
	zA3C/7GQ==;
Received: from mgamail.intel.com ([198.175.65.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q2N-00000008REh-0Hle
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 08:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773737067; x=1805273067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=reN1ExzdLEqD8HVCpoyL9v3MG4Jeymcn9UW3+OEgzww=;
  b=Ce9AaGlzX1vBdDzARMUirVMfLHLeIYVyY2xmFZoADJvoScmogjJRtkE7
   Nxv2iEAyYBrKCIm6+ZnIv8tS+cmnA+ZuaEqtJ5xLMa8wxUy5MF95qRKIv
   HUPZwUxKxe1CrDS+mJxh9Vbk3M574XcyU1sRILDnDmeeUlAT6BCWOKnUA
   666oad+PsfQ8RrlGlPScF7djBOjxJFIp66QNCo3qYupLtKRwTCFnQ/X+G
   desMwLnP3BIqF41Vp7YXX8N73iVyiBF3BmWkfQecEJX87GgC7hsOJjVGb
   EW1gWmPzH5eiIv/TciKmL4A+3SJKLe0FbLPIyt2u5F5MlbufdqBuzFe+m
   Q==;
X-CSE-ConnectionGUID: LFKaf7TZT36MAYQTAVy1AA==
X-CSE-MsgGUID: EOStQr0VTB2ggi9VCHlDnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74946578"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74946578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:44:21 -0700
X-CSE-ConnectionGUID: i4TMYhh1SJmDtT9VPYv95A==
X-CSE-MsgGUID: MwtWjn/sSB+XIPDkipta6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221432349"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2026 01:44:17 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Q29-0000000004j-3H6m;
	Tue, 17 Mar 2026 08:44:13 +0000
Date: Tue, 17 Mar 2026 16:43:31 +0800
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
Subject: Re: [PATCH v15 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Message-ID: <202603171518.XQOgdjNN-lkp@intel.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-2-1777f14ed319@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-2-1777f14ed319@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_084427_518107_903B74D9 
X-CRM114-Status: GOOD (  14.07  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/coresight-core-refactor-ctcu_get_active_port-and-make-it-generic/20260315-052703
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-2-1777f14ed319%40oss.qualcomm.com
patch subject: [PATCH v15 2/7] coresight: tmc: add create/clean functions for etr_buf_list
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260317/202603171518.XQOgdjNN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171518.XQOgdjNN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171518.XQOgdjNN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-tmc-etr.c:1979:50: warning: variable 'flags' is uninitialized when used here [-Wuninitialized]
    1979 |                 raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
         |                                                                ^~~~~
   include/linux/spinlock.h:283:37: note: expanded from macro 'raw_spin_unlock_irqrestore'
     283 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                                                   ^~~~~
   drivers/hwtracing/coresight/coresight-tmc-etr.c:1969:21: note: initialize the variable 'flags' to silence this warning
    1969 |         unsigned long flags;
         |                            ^
         |                             = 0
   1 warning generated.


vim +/flags +1979 drivers/hwtracing/coresight/coresight-tmc-etr.c

  1957	
  1958	/**
  1959	 * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
  1960	 * @drvdata:	driver data of the TMC device.
  1961	 * @num_nodes:	number of nodes want to create with the list.
  1962	 *
  1963	 * Return 0 upon success and return the error number if fail.
  1964	 */
  1965	int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
  1966	{
  1967		struct etr_buf_node *new_node;
  1968		struct etr_buf *sysfs_buf;
  1969		unsigned long flags;
  1970		int i = 0, ret = 0;
  1971	
  1972		lockdep_assert_held(&drvdata->spinlock);
  1973		/* We dont need a list if there is only one node */
  1974		if (num_nodes < 2)
  1975			return -EINVAL;
  1976	
  1977		/* We expect that sysfs_buf in drvdata has already been allocated. */
  1978		if (drvdata->sysfs_buf) {
> 1979			raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
  1980			/* Directly insert the allocated sysfs_buf into the list first */
  1981			new_node = kzalloc_obj(*new_node, GFP_KERNEL);
  1982			if (IS_ERR(new_node))
  1983				return PTR_ERR(new_node);
  1984	
  1985			raw_spin_lock_irqsave(&drvdata->spinlock, flags);
  1986			new_node->sysfs_buf = drvdata->sysfs_buf;
  1987			new_node->is_free = false;
  1988			list_add(&new_node->link, &drvdata->etr_buf_list);
  1989			i++;
  1990		}
  1991	
  1992		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
  1993		while (i < num_nodes) {
  1994			new_node = kzalloc_obj(*new_node, GFP_KERNEL);
  1995			if (IS_ERR(new_node)) {
  1996				ret = PTR_ERR(new_node);
  1997				break;
  1998			}
  1999	
  2000			sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
  2001			if (IS_ERR(sysfs_buf)) {
  2002				kfree(new_node);
  2003				ret = PTR_ERR(sysfs_buf);
  2004				break;
  2005			}
  2006	
  2007			/* We dont have a available sysfs_buf in drvdata, setup one */
  2008			if (!drvdata->sysfs_buf) {
  2009				drvdata->sysfs_buf = sysfs_buf;
  2010				new_node->is_free = false;
  2011			} else
  2012				new_node->is_free = true;
  2013	
  2014			new_node->sysfs_buf = sysfs_buf;
  2015			list_add(&new_node->link, &drvdata->etr_buf_list);
  2016			i++;
  2017		}
  2018	
  2019		/* Clean the list if there is an error */
  2020		if (ret)
  2021			tmc_clean_etr_buf_list(drvdata);
  2022	
  2023		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
  2024	
  2025		return ret;
  2026	}
  2027	EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
  2028	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

