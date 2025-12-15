Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677C8D5B86F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEFbJeK7NytMHFA9UYqkwPI1iaiHJx5UezKUH+CPvgM=; b=dhwpRbe+5wRn49ccGmAtY692oU
	ImgHz9ktp1MGYc4atmn0W1o1XtCm2/YFXxg6bowAsLhZUYZ6TQTQyaJBV7rft02xTLKyCa6ftCiY4
	gN63GB/1WBauwA5KcZVJbuy2gZehQTEPdnduFQ1WryaP9+d9k+OshaoJCpwBOx9qoi6vyqS+6odxh
	s0vqaQITg5r+e5exukfjA/5Ysi3DaIB7jWETvBZRR+45f6LqYgkJ/izyspGO7D212rkgJijO/fRgk
	dMvOCLU0zZ7gkzgHEqmna4FzcgwEYBhL21ns+x78uFURVuOTfah/Ge0u79CGmLSHz/P8lE1IVCLlb
	Lp3MYsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG43-00000004HXm-3yvy;
	Mon, 15 Dec 2025 21:25:08 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG41-00000004HX0-0wJL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765833905; x=1797369905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QnAPE6e7tVNh1L4SSaHUKeQax1Y3ZxVhkUf81AdJuSk=;
  b=XiAZzpCbd07askg6ObSBukC6+p2ge/vfnCYSZYXlxnzja/ZfleIonwin
   R5wS9N3kl9ZAGwNOnUaOG0kiF2h36824LjP5dwCWD07Vr0rhqQ9FS9+/m
   etGdfT/ua5TVv//zLvnMunjTmJMudpB2eqTTdb5kb4Tcfd8CAketOFrG3
   fTNWuLbJ1NJR6w789Ny+Sa3ap8kViGRRPxVfJ8dN6Q14hV2hr81dOnk3i
   MK/VPumygenTbCUr1fy+VCdg++1q7Mh9MyecHsg4Sw1UwsvgdjA07NSFQ
   watPLsP3Izp8szCfhAgf22prZMCtZe1pSx6ihD3gEZLNm+QZ8omSn/mmd
   Q==;
X-CSE-ConnectionGUID: EsVycrSWT3Wv1opfyozLcA==
X-CSE-MsgGUID: fiykcUl7RPaPa0sCRSV2sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78865948"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="78865948"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 13:25:03 -0800
X-CSE-ConnectionGUID: MW024P1lTh2ip6Qrzm/vzw==
X-CSE-MsgGUID: 7U1AeipUR4OQQDD+ercKjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="228486639"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Dec 2025 13:24:57 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVG3U-000000000oT-3Boe;
	Mon, 15 Dec 2025 21:24:39 +0000
Date: Tue, 16 Dec 2025 05:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, arnd@arndb.de, catalin.marinas@arm.com,
	will@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
	Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [PATCH v8 12/12] cpuidle/poll_state: Wait for need-resched via
 tif_need_resched_relaxed_wait()
Message-ID: <202512160519.pKMkOXsP-lkp@intel.com>
References: <20251215044919.460086-13-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215044919.460086-13-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_132505_306093_9BE609F3 
X-CRM114-Status: GOOD (  10.60  )
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

Hi Ankur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master linus/master v6.19-rc1 next-20251215]
[cannot apply to arm64/for-next/core bpf-next/net arnd-asm-generic/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankur-Arora/asm-generic-barrier-Add-smp_cond_load_relaxed_timeout/20251215-130116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251215044919.460086-13-ankur.a.arora%40oracle.com
patch subject: [PATCH v8 12/12] cpuidle/poll_state: Wait for need-resched via tif_need_resched_relaxed_wait()
config: x86_64-randconfig-005-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160519.pKMkOXsP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160519.pKMkOXsP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160519.pKMkOXsP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: poll_idle+0x3b: call to tif_need_resched_relaxed_wait() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

