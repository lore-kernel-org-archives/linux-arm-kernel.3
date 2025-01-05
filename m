Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838C3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 04:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXLeifa0QlviQa7WPZjm73giBl6R07z/zq5dHzAUXig=; b=kwcpU1DFfZTtzaUymqbSP5UWXD
	Us+e7XDXSVXeqGU/P3vTL3GoQup2URiKl0udhMHQ+MeJk3q56feEHHqixpOQeRgCedr5ZXkUJtqLs
	jGeC7ryDfe/O8nm00OM0fRNDzsfZNRvpGM+7EbiWnMmdtlu0UPpfqKDiSQ5evnRcY7gnajTj9boTF
	bpkIPhv3yAGK0FlzqBIACsPgn/7UPMS/wS0LR9hhmrMv0Y2X6oRMo5plgkygnU9ZH7b/1/+Rh+Jok
	4cglLAKGIh1PGQeW+HpCzSMIhuksk5ZOI0QmozYaWk/gFeaFNST+i9pKzDFRygXky00Dqvd0FIPHK
	akDkvF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUHw4-0000000GEVc-1YwA;
	Sun, 05 Jan 2025 04:08:20 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUHus-0000000GEL7-0CPh;
	Sun, 05 Jan 2025 04:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736050026; x=1767586026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uTTXcYE2JlL0MwZNF4xf3gPhakQayiJl1mKH6vTKQMI=;
  b=Tn4QDaSghvXb0b81M+RoSz2ulK0IZafWLvNgopnbS2QriAxO6HJF67Za
   W80MXLofTHSazSS8w/UcB8QLNa+IO44zlndzyeRlS0sj4wosNth23paJy
   MWbpop8cPFiNIIcXJNr8W6TBIwhYcdFgCs0wNuYgPKED83gh/GQB9q27H
   UJoKctOvk9RcN23lFExv1MzPdSlB5AX4qj5C3i8Jlu39CTGhGuwkW4KZV
   yB0nqPS48d5vVEwhWcwaP1Rs/euKzbsWVO1OEcJe3wgczk3gRDmlb7GxY
   fLsKwRmTESao7rO3gns2sSZpICqGjqTlTPNOJF3ikEBM0AMKxSEEfzXv4
   w==;
X-CSE-ConnectionGUID: aFZNV1MrSiGv4sIpVKbJPw==
X-CSE-MsgGUID: tXP5Qd5ETRCphXlvO9g6RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="46906610"
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="46906610"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 20:07:01 -0800
X-CSE-ConnectionGUID: s5QBkrq/RlC6x0S1Bzo8Zg==
X-CSE-MsgGUID: T/KGlmm5Qo60f34HgbLZqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="106980210"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jan 2025 20:06:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUHui-000BRL-14;
	Sun, 05 Jan 2025 04:06:56 +0000
Date: Sun, 5 Jan 2025 12:06:24 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 1/2] pmdomain: airoha: Add Airoha CPU PM Domain support
Message-ID: <202501051127.3AKt5ZE9-lkp@intel.com>
References: <20250104181305.28185-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104181305.28185-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_200706_143903_060D3EFA 
X-CRM114-Status: GOOD (  13.40  )
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
config: arm64-randconfig-001-20250105 (https://download.01.org/0day-ci/archive/20250105/202501051127.3AKt5ZE9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501051127.3AKt5ZE9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501051127.3AKt5ZE9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:135:3: error: field designator 'remove_new' does not refer to any field in type 'struct platform_driver'
     135 |         .remove_new = airoha_cpu_pmdomain_remove,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


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

