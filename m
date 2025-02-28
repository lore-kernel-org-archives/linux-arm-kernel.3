Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62499C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 00:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BImh1S2kbKsyQyrCBuIq+DgHkjKDEXOVfaeTnDNP39A=; b=PcUGAkMGTRriNjkFEf/wVCLKD3
	uULwV6/Tn5GiL2YHsKhiekc7Z2wmZdt1E0QiqWKdPlmT2lCnDcbfEEz9xqXxAKOS54k1BN4koaZl3
	i0Aq1aYt18VcAK/2At51lELWTc4opnNDbFnf2EPoWGpXmbt+Ia9FA5JumdXtzOVPfP92fdOW0bggD
	J9q+lssusbNm0rKhAakmL4eCpV3Y//NHmPmEjgXxgNDac230/snbuBgUnnCJv+/5mX7QCGwubvrB5
	wJnVSirw8nP1gACIQCGc+si6DWqFUHvQvae8Xt6USaEgRXaBRY4dZN24qJ0qsGCs/nI9DgFn6u0KS
	pq8MV2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnoVb-00000009JNV-1GZA;
	Fri, 28 Feb 2025 00:45:43 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnoU1-00000009JD3-3C2b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 00:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740703446; x=1772239446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eLeJvveqOt8R8zNm/BD89sPpR/xN6v9RWVXKbMNVdSw=;
  b=lWpl5BGNt99EryYp6YbgtCwJicC7i33EDLTyw4J98HbV5Gs255mx+1eg
   yPai6DkrLTZK6J4yKhQkhoPhmoSjfHiEYkxP0aoiJTYMy1E9RyJFCvShU
   w5UiPxADXRLBQBMpQMVG/3Qj39FhADAYSDWzqv8W3AZrmP/b2axUCq6AW
   l1eYS5klosPokK0If3r7xcnbVY8dL4OCIhDE5H3Yu/NViW3aeQJuusAQm
   gbHx6D/2aetPNpq+NXv94G1vNtrU/4xu0K1P8lLW8KAxBVYTx+1470sue
   QJ9AeDFDKowCzkyVypKpmbQzEc/ujNQoqA4n23NY+m57XDZAUDKNPxbFQ
   Q==;
X-CSE-ConnectionGUID: zy/h15vYTsSY3+EYIv0oKw==
X-CSE-MsgGUID: fUOO0bCOSjec9lz33LqPpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45402607"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="45402607"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 16:43:52 -0800
X-CSE-ConnectionGUID: byxxMEs1TTiX2LpHkc1grg==
X-CSE-MsgGUID: jshEyU3CSAGftBCl95s7dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="122313669"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Feb 2025 16:43:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnoTe-000EFG-2u;
	Fri, 28 Feb 2025 00:43:42 +0000
Date: Fri, 28 Feb 2025 08:43:12 +0800
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
Message-ID: <202502280842.nI3PwNwz-lkp@intel.com>
References: <20250226121537.752241-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226121537.752241-1-dongml2@chinatelecom.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_164405_844521_649C523E 
X-CRM114-Status: GOOD (  14.39  )
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
config: i386-buildonly-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280842.nI3PwNwz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280842.nI3PwNwz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280842.nI3PwNwz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/kfunc_md.c: In function 'kfunc_md_get_next':
>> kernel/trace/kfunc_md.c:98:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      98 |         free_pages((u64)mds, order);
         |                    ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CALL_PADDING
   Depends on [n]: CC_HAS_ENTRY_PADDING [=y] && OBJTOOL [=n]
   Selected by [y]:
   - FUNCTION_METADATA [=y]


vim +98 kernel/trace/kfunc_md.c

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

