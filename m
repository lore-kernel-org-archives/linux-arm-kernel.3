Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEC6D46BE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OUpzyWYenoPbaV0IkxeyyDfxafU9gExLRttDDgCmxM=; b=oGT7ELsVKPqdOUYx5uGNE+haop
	mwV36ufF7f0hQ+b94W3wSNyhWE+EPVgINUWcWmTfH46wMj8tj/11EPFneuGxguRoa49WXgrAqgr+r
	VRgqlbW8hG9kKO2WFlHbnxbZaepQ8VcIXEjr6H1POhZrkYkO5Lmu1N6XV6VFWmELrja4Cr6mmTV4B
	HifrD+twl0fnfVKhdrp/LqekO4Hb5dW1xMCIPCY5pPJL2clK6WX0fqyisZ2uhIEfepI0cQVgntDb8
	KVT7JIz9E97M2x34MLgzXwvOV24+HQJwl9+Q/3eKHXTQw2OR2f05wolBUlEAUwhUf6dfC8MC/oE7v
	8KmcN1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Zp-0000000GW1C-01o8;
	Wed, 28 Jan 2026 17:43:37 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Zn-0000000GW0p-1pxq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769622216; x=1801158216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g1jAkOyBexOK0ZIsA6MWbUTp4PeGmeSSzmktzpC4sZg=;
  b=RWLHydsPC18A6uOgX9ju2XY44+6UFsW0rU/WJpIjFHbknDXHryVzG25y
   e8zaYISXLB/wNrFcz2xo/HrK7yBXObN57QOaEHZSmgfzchonlbzdcusOw
   0vQuF41g0PeeLTfRT/VwjxB/UMpDcx/ayXBudV+iR8bLCfJmT7fDUE48H
   tUlPREG2vY0qAn86e19eXaBjesM+5MMbhi/fDYN08o0Lubdp3Fc46cPHv
   ZqZ6JO/jAjQIEQp/Bgs1eX/qqR+H/zL9miHoYbsOqt1GacZ6crvyAmLea
   /XFHnf7WK6n/3I8FS/MuIbYfN4U0Okba4NpOG1yUTU3ldKVJF4W+lzCLW
   w==;
X-CSE-ConnectionGUID: EM6wAhEITEmquyKKGBnxaA==
X-CSE-MsgGUID: qlutJL2lTiKm06IlCOmUIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96304446"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="96304446"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 09:43:35 -0800
X-CSE-ConnectionGUID: lXx90f1VRK+eSlHmKMrAxw==
X-CSE-MsgGUID: /7RCZ1ZZRD+YePQfVNi8Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="231278422"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2026 09:43:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl9Zg-00000000ae8-3lP1;
	Wed, 28 Jan 2026 17:43:28 +0000
Date: Thu, 29 Jan 2026 01:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com, Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v4 2/3] reset: cix: add support for cix sky1 resets
Message-ID: <202601290142.8FfZLLZk-lkp@intel.com>
References: <20260128093611.1932770-3-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128093611.1932770-3-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_094335_487715_480CAF49 
X-CRM114-Status: GOOD (  13.00  )
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

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-leds/for-leds-next linus/master v6.19-rc7 next-20260127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-reset-add-sky1-reset-controller/20260128-174335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260128093611.1932770-3-gary.yang%40cixtech.com
patch subject: [PATCH v4 2/3] reset: cix: add support for cix sky1 resets
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260129/202601290142.8FfZLLZk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290142.8FfZLLZk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601290142.8FfZLLZk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/reset/reset-sky1.c:322:35: warning: 'sky1_src_config' defined but not used [-Wunused-const-variable=]
     322 | static const struct regmap_config sky1_src_config[] = {
         |                                   ^~~~~~~~~~~~~~~


vim +/sky1_src_config +322 drivers/reset/reset-sky1.c

   321	
 > 322	static const struct regmap_config sky1_src_config[] = {
   323		{
   324			.reg_bits = 32,
   325			.val_bits = 32,
   326			.reg_stride = 4,
   327			.name = "src",
   328		},
   329	};
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

