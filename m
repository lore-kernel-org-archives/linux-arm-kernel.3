Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C91E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 02:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRt+96Gegx7rRnN2Q/gp2rlKwaEMn38Kcq3DDDffPQM=; b=nwAxDBc3vsfO0l/Upr3UB/n4dj
	nTHI9ivQqLePLEiaMnb+PbL0vjNZvYrjt4B1OJ/Kvw41QKnnzIKB7yMyVwB3n+AHWpgPC+eATGmY/
	xCHbTZcD0XlB2nzUvA3UCZjIFbEegk1o3sgfuAoNUnSgqC3/tBQVUjLdvHA34hJ3H8DX6hDOCtdxx
	vExwpD9At8DaSdMqUopSezmAF1DucDXIwH8MNpuAnpgXMjKuq+gZ1oQbNTGPWb9RfgX0+FnJLHY5D
	V+7xIqk9ryAuIREHpmGd7tZxTG0oL8DVPwMi7tTSfZIVmkjk75JXplchaJGClPI4wMUx5n/PqfguA
	n1H93C7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUFyx-0000000G168-1SdW;
	Sun, 05 Jan 2025 02:03:11 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUFxl-0000000G0zs-2YgH;
	Sun, 05 Jan 2025 02:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736042517; x=1767578517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LXcv4FdNNG3Tf6TIBN0iAcj8De3t94GyOe4c1VqhcLM=;
  b=jLIbLRjvkZlpe0e5OaAbHAZLJbgzk3lQFPeAtk4SAyp7f5y7HlEXuqvW
   JIneX3LEJPog8HkleICQ6jrvBcKM4v8FwjNfYCgRt7NajpCqGgcFWfK/i
   /hxngz9/95FGJ1sQEuXMgBx7jqwzKU8FlVN2YmGQEQ3I9Y+x5Vh0+54ho
   7CKoWqcRI/VltiWhb1//4LtgcOvvSpXiRxmqxq8vbpwIc5SwnXZHohIbF
   8tr9aNcej/fRXhi63v4e68Hc/QTGHQOs6e70BLbtoBlboUknpSuV2zoTN
   H6mfRs/AOUUJZKxaDCTNOAINfL/8Xqcm9u+Laq9aNsuyt1dQ/kn8WVpDD
   Q==;
X-CSE-ConnectionGUID: XPkq2i4eSEiFtgsqDNAxkA==
X-CSE-MsgGUID: taP4p6kxRLytXOID5UJAvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="61605949"
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="61605949"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 18:01:51 -0800
X-CSE-ConnectionGUID: qLFuF0vNQA2LiuIb2jLmTA==
X-CSE-MsgGUID: RPZ5+PsPT0yYnydOcdVMkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="102627239"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jan 2025 18:01:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUFxa-000BO3-1e;
	Sun, 05 Jan 2025 02:01:46 +0000
Date: Sun, 5 Jan 2025 10:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 1/2] pmdomain: airoha: Add Airoha CPU PM Domain support
Message-ID: <202501050957.aylo1fso-lkp@intel.com>
References: <20250104181305.28185-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104181305.28185-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_180157_692894_CB0D498D 
X-CRM114-Status: GOOD (  13.30  )
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

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/cpufreq-airoha-Add-EN7581-CPUFreq-SMCCC-driver/20250105-022153
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250104181305.28185-1-ansuelsmth%40gmail.com
patch subject: [PATCH v8 1/2] pmdomain: airoha: Add Airoha CPU PM Domain support
config: arm-randconfig-004-20250105 (https://download.01.org/0day-ci/archive/20250105/202501050957.aylo1fso-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501050957.aylo1fso-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050957.aylo1fso-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:135:10: error: 'struct platform_driver' has no member named 'remove_new'; did you mean 'remove'?
     135 |         .remove_new = airoha_cpu_pmdomain_remove,
         |          ^~~~~~~~~~
         |          remove


vim +135 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c

   132	
   133	static struct platform_driver airoha_cpu_pmdomain_driver = {
   134		.probe = airoha_cpu_pmdomain_probe,
 > 135		.remove_new = airoha_cpu_pmdomain_remove,
   136		.driver = {
   137			.name = "airoha-cpu-pmdomain",
   138			.of_match_table = airoha_cpu_pmdomain_of_match,
   139		},
   140	};
   141	module_platform_driver(airoha_cpu_pmdomain_driver);
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

