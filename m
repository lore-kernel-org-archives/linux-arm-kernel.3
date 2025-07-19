Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A24C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 23:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhMwNJOd9FZVOhRRBAOkvTD+Anwjv6SEL6toUQ2o+iM=; b=gTQM6a8rqLfyQxZmPtGmiKkEx8
	8kQCxbyXj0cJ5IjrnyViS3PdAs7TTMdcLaIS5fzkGmWGjaxyyRu+t7yJiJBFBvX0VnSS1BNSn9nko
	PYDUGTEqG1oRf1USidDsiGfz9I+RhYWgveR8moiJyjKCEo1zlYrya+8dT/LpSenk3f2HYElvSEa0p
	r5U1UprYear8i0QygKDuxX0VRHVGxjDU4OI7AIZHfgYfkpB/UTy+9LBgjFrhtO16VBZSlRnG8oDnx
	Y8m/xC3poLoyStQclxADsVasmG3NQ1apCU0HGuchjXJdGJNoWTaNvPzebqliIMldRU91mwY/CqqAe
	hIUFocOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udH5s-0000000Ejeg-3S1Q;
	Sat, 19 Jul 2025 23:35:52 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udH3Q-0000000EjYd-0ap1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 23:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752968000; x=1784504000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hkcfo0IKkyD5A7QFzFl7rBu/pNqfb8/o8DBVlpAhK4c=;
  b=KdRZNI93OsM7pIgvUGfBi2tBb2/+4+6wrOMECFysYXPIDABZei2i9luA
   Ita1tQGbCyuVs2isX95UpromQPniW46aMhsqdQoi4YDi1ZOUBUYFGXJTN
   V5sOUZWPY4vkPNqDvw4vXZLpxyLqKdt7FgqNWUyvYDmD43edWpcezrFUe
   QC3S1zX6xSV2oybOmU58tddy08S4L0ua5lx30IsfxrHUy9DiMBrlTwaen
   xjfa10YOd/JMs24fDP7x4vT1mjOXMdG0xAOCKMSqRW/+dOrm1ll+0OOZq
   pQjz4g8C124xBT+Zd6w3ZSXIvcqd2/TqEccu3DZ/9z8FF8NUYJTHq1fE3
   A==;
X-CSE-ConnectionGUID: eiNpjmTqQr+vXlzXCZnZ6Q==
X-CSE-MsgGUID: LSUN3bsUR7mm3K503ZHQUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="59012755"
X-IronPort-AV: E=Sophos;i="6.16,325,1744095600"; 
   d="scan'208";a="59012755"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 16:33:15 -0700
X-CSE-ConnectionGUID: RGBL5xe5TVKBQO3eztAvDQ==
X-CSE-MsgGUID: Dvsz0yNITWe2Jfo3X1qbxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,325,1744095600"; 
   d="scan'208";a="159210283"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jul 2025 16:33:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udH3F-000FqD-2t;
	Sat, 19 Jul 2025 23:33:09 +0000
Date: Sun, 20 Jul 2025 07:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>, bpf@vger.kernel.org,
	Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Maxwell Bland <mbland@motorola.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH bpf-next v11 2/3] cfi: Move BPF CFI types and helpers to
 generic code
Message-ID: <202507200719.dWqamnJW-lkp@intel.com>
References: <20250718223345.1075521-7-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718223345.1075521-7-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_163320_223224_182E1790 
X-CRM114-Status: GOOD (  10.73  )
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

Hi Sami,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0ee30d937c147fc14c4b49535181d437cd2fde7a]

url:    https://github.com/intel-lab-lkp/linux/commits/Sami-Tolvanen/cfi-add-C-CFI-type-macro/20250719-063535
base:   0ee30d937c147fc14c4b49535181d437cd2fde7a
patch link:    https://lore.kernel.org/r/20250718223345.1075521-7-samitolvanen%40google.com
patch subject: [PATCH bpf-next v11 2/3] cfi: Move BPF CFI types and helpers to generic code
config: x86_64-randconfig-123-20250719 (https://download.01.org/0day-ci/archive/20250720/202507200719.dWqamnJW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507200719.dWqamnJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507200719.dWqamnJW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cfi.c:39:24: sparse: sparse: symbol '__bpf_prog_runX' was not declared. Should it be static?
>> kernel/cfi.c:42:28: sparse: sparse: symbol '__bpf_callback_fn' was not declared. Should it be static?

vim +/__bpf_prog_runX +39 kernel/cfi.c

    31	
    32	/*
    33	 * Declare two non-existent functions with types that match bpf_func_t and
    34	 * bpf_callback_t pointers, and use DEFINE_CFI_TYPE to define type hash
    35	 * variables for each function type. The cfi_bpf_* variables are used by
    36	 * arch-specific BPF JIT implementations to ensure indirectly callable JIT
    37	 * code has matching CFI type hashes.
    38	 */
  > 39	typeof(*(bpf_func_t)0) __bpf_prog_runX;
    40	DEFINE_CFI_TYPE(cfi_bpf_hash, __bpf_prog_runX);
    41	
  > 42	typeof(*(bpf_callback_t)0) __bpf_callback_fn;
    43	DEFINE_CFI_TYPE(cfi_bpf_subprog_hash, __bpf_callback_fn);
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

