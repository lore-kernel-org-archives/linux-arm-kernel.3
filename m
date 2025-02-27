Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F270C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qfwAKHnTduYh9WVRV2fjARbrab5NBY3Zz90WxtrY78=; b=RVHp7fMNGJH99jGew3ky6HjQ4i
	8yrjKPdN0gcySKOlnCOKKbGBfM8+urzZCakpsJS3g9yhG487dzCHqvE0ba9msb8DbxoTYqAmJYTuv
	Sz5hsp5PMUkYittcGSa7ILvcGVbWqdb8Iu66Jye4dtTtQFgB+k4LAMFDbfabZuIZS82ZSqAcYCNq3
	c+VfgKkvAECjr0EKKNsa/FZKRY7FhPYAnsh7kAkQ1v5iMBsgRwlrMJShU/dAKq2+fZm940UXUPlC1
	3y9CY+VP+hKbyqE4HXDFQowY6yoATx+8Ed64Ylcpdm8WDzXPkH1OmZj64w7+Jdr642Gw3JtNl1Wbt
	DW4deeiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjlQ-00000008bfE-3UR3;
	Thu, 27 Feb 2025 19:41:44 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tni0g-00000008FGk-2PMW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740678563; x=1772214563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hbOcWRR965qL+r3t+KOoQIZ6pqo51J3oCtyYdu/MbP8=;
  b=dlj0/z71zM2koZnLgKpZ2VRKew8MSA8c4AG08ydelH067L0tVsIj/Z8L
   Qa/gCvZs91gz/oDVMkNmXpyVDGW67E0rrVoN0ShKnzt9+HpJvLLuVeYck
   Uuq7Fhh6ZwNXOP6Q4B3qMPJ6Ap/m3RsU5Zp7nqrWEgnBqYN3OQ0lXf5jT
   AB5U7YG7FNGD+RogVQ7WsKzd3wCZD2Lz/WUDhg5ZN+LlnZvZa8OVTY8p3
   UA7jIDuBPWSn4GKNkkS7gF49wvz+3Gj1EL3MAQO/5tN2aNzqEp6VPSRZH
   Y/vFqxVWaFJqZbXEFRIXTX4CaAeVaeUjvuHtr8S+R0Ho4URIPBX8/zX/I
   Q==;
X-CSE-ConnectionGUID: vyB64+XZQtibg/4MF7033Q==
X-CSE-MsgGUID: AAeaT9dCTdqekhHoHZh1sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41503215"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="41503215"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 09:49:16 -0800
X-CSE-ConnectionGUID: od8b3YkhQHOqc5lLH407AA==
X-CSE-MsgGUID: qM2gFwLiQoGeQ9Pbh3oF7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117753696"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Feb 2025 09:49:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tni0R-000DnH-0q;
	Thu, 27 Feb 2025 17:49:07 +0000
Date: Fri, 28 Feb 2025 01:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: Menglong Dong <menglong8.dong@gmail.com>, rostedt@goodmis.org,
	mark.rutland@arm.com, alexei.starovoitov@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
	mhiramat@kernel.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, mathieu.desnoyers@efficios.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	dongml2@chinatelecom.cn, akpm@linux-foundation.org, rppt@kernel.org,
	graf@amazon.com, dan.j.williams@intel.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2] add function metadata support
Message-ID: <202502280123.BNaCYT2A-lkp@intel.com>
References: <20250226121537.752241-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226121537.752241-1-dongml2@chinatelecom.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_094922_652306_799EBB9F 
X-CRM114-Status: GOOD (  14.19  )
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

Hi Menglong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/add-function-metadata-support/20250226-202312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250226121537.752241-1-dongml2%40chinatelecom.cn
patch subject: [PATCH bpf-next v2] add function metadata support
config: i386-randconfig-062-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280123.BNaCYT2A-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280123.BNaCYT2A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280123.BNaCYT2A-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/kfunc_md.c:12:23: sparse: sparse: symbol 'kfunc_mds' redeclared with different type (different address spaces):
   kernel/trace/kfunc_md.c:12:23: sparse:    struct kfunc_md [noderef] __rcu *[addressable] [toplevel] kfunc_mds
   kernel/trace/kfunc_md.c: note: in included file:
   include/linux/kfunc_md.h:16:24: sparse: note: previously declared as:
   include/linux/kfunc_md.h:16:24: sparse:    struct kfunc_md *extern [addressable] [toplevel] kfunc_mds
   kernel/trace/kfunc_md.c:186:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct kfunc_md *md @@     got struct kfunc_md [noderef] __rcu * @@
   kernel/trace/kfunc_md.c:186:20: sparse:     expected struct kfunc_md *md
   kernel/trace/kfunc_md.c:186:20: sparse:     got struct kfunc_md [noderef] __rcu *
>> kernel/trace/kfunc_md.c:98:25: sparse: sparse: non size-preserving pointer to integer cast

vim +98 kernel/trace/kfunc_md.c

    10	
    11	static u32 kfunc_md_count = ENTRIES_PER_PAGE, kfunc_md_used;
  > 12	struct kfunc_md __rcu *kfunc_mds;
    13	EXPORT_SYMBOL_GPL(kfunc_mds);
    14	
    15	static DEFINE_MUTEX(kfunc_md_mutex);
    16	
    17	
    18	void kfunc_md_unlock(void)
    19	{
    20		mutex_unlock(&kfunc_md_mutex);
    21	}
    22	EXPORT_SYMBOL_GPL(kfunc_md_unlock);
    23	
    24	void kfunc_md_lock(void)
    25	{
    26		mutex_lock(&kfunc_md_mutex);
    27	}
    28	EXPORT_SYMBOL_GPL(kfunc_md_lock);
    29	
    30	static u32 kfunc_md_get_index(void *ip)
    31	{
    32		return *(u32 *)(ip - KFUNC_MD_DATA_OFFSET);
    33	}
    34	
    35	static void kfunc_md_init(struct kfunc_md *mds, u32 start, u32 end)
    36	{
    37		u32 i;
    38	
    39		for (i = start; i < end; i++)
    40			mds[i].users = 0;
    41	}
    42	
    43	static int kfunc_md_page_order(void)
    44	{
    45		return fls(DIV_ROUND_UP(kfunc_md_count, ENTRIES_PER_PAGE)) - 1;
    46	}
    47	
    48	/* Get next usable function metadata. On success, return the usable
    49	 * kfunc_md and store the index of it to *index. If no usable kfunc_md is
    50	 * found in kfunc_mds, a larger array will be allocated.
    51	 */
    52	static struct kfunc_md *kfunc_md_get_next(u32 *index)
    53	{
    54		struct kfunc_md *new_mds, *mds;
    55		u32 i, order;
    56	
    57		mds = rcu_dereference(kfunc_mds);
    58		if (mds == NULL) {
    59			order = kfunc_md_page_order();
    60			new_mds = (void *)__get_free_pages(GFP_KERNEL, order);
    61			if (!new_mds)
    62				return NULL;
    63			kfunc_md_init(new_mds, 0, kfunc_md_count);
    64			/* The first time to initialize kfunc_mds, so it is not
    65			 * used anywhere yet, and we can update it directly.
    66			 */
    67			rcu_assign_pointer(kfunc_mds, new_mds);
    68			mds = new_mds;
    69		}
    70	
    71		if (likely(kfunc_md_used < kfunc_md_count)) {
    72			/* maybe we can manage the used function metadata entry
    73			 * with a bit map ?
    74			 */
    75			for (i = 0; i < kfunc_md_count; i++) {
    76				if (!mds[i].users) {
    77					kfunc_md_used++;
    78					*index = i;
    79					mds[i].users++;
    80					return mds + i;
    81				}
    82			}
    83		}
    84	
    85		order = kfunc_md_page_order();
    86		/* no available function metadata, so allocate a bigger function
    87		 * metadata array.
    88		 */
    89		new_mds = (void *)__get_free_pages(GFP_KERNEL, order + 1);
    90		if (!new_mds)
    91			return NULL;
    92	
    93		memcpy(new_mds, mds, kfunc_md_count * sizeof(*new_mds));
    94		kfunc_md_init(new_mds, kfunc_md_count, kfunc_md_count * 2);
    95	
    96		rcu_assign_pointer(kfunc_mds, new_mds);
    97		synchronize_rcu();
  > 98		free_pages((u64)mds, order);
    99	
   100		mds = new_mds + kfunc_md_count;
   101		*index = kfunc_md_count;
   102		kfunc_md_count <<= 1;
   103		kfunc_md_used++;
   104		mds->users++;
   105	
   106		return mds;
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

