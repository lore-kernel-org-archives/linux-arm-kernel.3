Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71500D6B6B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 17:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9WDz4F5wGEkG7DOHlMhT13DYM6QWNTW6fdYH8Os0MQ=; b=OxWBoGUKXQvUXjkKfAW9vOH4su
	RNqBNZuQsmin1oi7mhKLg6rb9xU7zNuvr3vIOR3YLVvv1GJJe8Z2VtDlBWGr8/QZfgCo1vp1r+Ilq
	RTNzQ4/t+c8t3qZgP9kI6a50iyeRwdTGbWKzr63WhiO66E6Hs1t1aMYdWH9fcP6SqYvoQyWx76mlN
	sYxGzwrqiDV+kip+MMGq5uWRreJAvy3sHmXZCYW+Lcj848mvcMAjTy/rGhHhDR3s8Rmw6wxNmtwDM
	9DN5nV9iJhb0cqA88PjMds8/+Ysttn/5nSt84FyUJk6xLbxDAg0+FTzxr2qitftJGXOjpk6w08lDm
	3q9dyWIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CVL-00000001HY8-1hkB;
	Wed, 30 Oct 2024 17:29:11 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CTh-00000001HME-1qPR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 17:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730309249; x=1761845249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cNl2/fGvTSjZNQLFBkNM+rzYZRnqnD+u3xoD1T4iY6s=;
  b=BqaG4V9PIgfJlyir7u/5ea9LTsd5nGrtcHBBKi4jRjRpcbnB54AjPRkK
   /Gjs0/94+GHvbcunnB2LkF09TuI/VgJI2jIaOndlXwcGEDuYeP8NF2bvK
   Kfr5WO4HNWQoSQqZhA/boXLZQjYsjKFDoiJyBsCWPHJJuKParvYR4HgwS
   2OCZuQcv8piuVYUp92Ket3EckSMoQBnfHyv3mwkPYxpxsda+SaKrEL9S7
   d48yMHhxADbXeeCmzG3ueG82FtvqfWwuBiPaUhwDjgVY0qhhBA/yqvaEs
   HpCzs5yT7ZGD5MwrwYrrZfbX+6P7h66hn7mY6oavJFd3NlQ/xyqJFHqC7
   g==;
X-CSE-ConnectionGUID: KnlYoDtrQZCusWZtZg+7GQ==
X-CSE-MsgGUID: Dxy5pRQNQDC/PLY+72qSMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29921829"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="29921829"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 10:27:29 -0700
X-CSE-ConnectionGUID: 6PCfgC5OTUS4DQd1LF/Lxg==
X-CSE-MsgGUID: qrB5aKwZRLOcSUPXwHEs7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87169933"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Oct 2024 10:27:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6CTb-000f8v-2x;
	Wed, 30 Oct 2024 17:27:23 +0000
Date: Thu, 31 Oct 2024 01:26:45 +0800
From: kernel test robot <lkp@intel.com>
To: alice.guo@oss.nxp.com, alexander.stein@ew.tq-group.com,
	wahrenst@gmx.net, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v3] soc: imx: Add SoC device register for i.MX9
Message-ID: <202410310126.WFKQ7LtM-lkp@intel.com>
References: <20241030091336.3901440-1-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030091336.3901440-1-alice.guo@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_102729_652461_398D863A 
X-CRM114-Status: GOOD (  13.01  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.12-rc5 next-20241030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alice-guo-oss-nxp-com/soc-imx-Add-SoC-device-register-for-i-MX9/20241030-171525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241030091336.3901440-1-alice.guo%40oss.nxp.com
patch subject: [PATCH v3] soc: imx: Add SoC device register for i.MX9
config: x86_64-buildonly-randconfig-002-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310126.WFKQ7LtM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310126.WFKQ7LtM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310126.WFKQ7LtM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx9.c:84:34: warning: 'imx9_soc_match' defined but not used [-Wunused-const-variable=]
      84 | static const struct of_device_id imx9_soc_match[] = {
         |                                  ^~~~~~~~~~~~~~


vim +/imx9_soc_match +84 drivers/soc/imx/soc-imx9.c

    83	
  > 84	static const struct of_device_id imx9_soc_match[] = {
    85		{ .compatible = "fsl,imx93", },
    86		{ .compatible = "fsl,imx95", },
    87		{ }
    88	};
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

