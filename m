Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7A6E67481
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 19:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PeR8b7fxhywr1YkZkpgmBE5GLqifYFgqyw8GjyZWfc=; b=rD1tzI/Trz0XnkJ3zj1CWO4zEw
	ZF0w5BBq3hLfxFMups4JuKUPnkUEFP8zewkTTksxZTSg5TIFPAVHPbLLkTzKtgBEaAZTmvQkvFV1i
	pU1APA8LYByCDY61ZAPVk1dyIOcAfdK89KAyIkES+IUYYXnFYc+IALAcslkivhioiwgnmXF6xHevS
	+ljUyP/avAKWf3Fp7QSiqm8wLu6gqrz9FIt46vjE3XLKEiwopwAjBZlFbY4FRa7Xtq2jhSmLtAxZe
	CxdGS423+T39+ex7rshW/MgdoVZOaGkOBY6mawGEuSx+kImrSlcbIfy9fra3WJTinA2AJ62Assgh/
	2/I2vULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX2my-0000000BrAc-1TyT;
	Sat, 20 Dec 2025 19:38:52 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX2ms-0000000Br9f-2ncO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 19:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766259527; x=1797795527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1GWReUGplOwGxcytr02vQVe2hYUxmjhJo00fyQ3IrEk=;
  b=F/ER3M2RIYhvMJQVCCvYAGQXcgRvmUqnYVXbA0ji2HpMMfEnsd479brC
   5ShwzxmdZvVfNj8x4M7wcij9Kck9p3rkaBrdaa77sX2NrTmroTtPS4G54
   6yQdbvXrJwx3t3Nd1o+d5b/K2rsO+1BcVimzjR612K4o0PZu65J2b3Dsc
   0ZRgpQcrQFXOTWykvdfFtcojabYqWlZzNMYwkK2tUG4nRGbdjVvcVHG80
   NhvDp4QIJSMFDwlWON6pfFnpI2Tur530IkI4+kPkr9jEDhUp06axXR3P5
   SUSnZdKx0j42DpmtoqvxT6WTnbHWcZtuILhU27SOjwg7OAJzn9BRKD5TO
   g==;
X-CSE-ConnectionGUID: IV5LNJwwQtadVyG7xiC92A==
X-CSE-MsgGUID: MU1d+Z6CRXi0UTWga0+rmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85599370"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85599370"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:38:46 -0800
X-CSE-ConnectionGUID: 4UvXX/ZDQCemeNPyxn8PdA==
X-CSE-MsgGUID: n4ZP9A7dTKKU/y9jQj5Wjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198907422"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2025 11:38:42 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2ml-0000000054r-2AIJ;
	Sat, 20 Dec 2025 19:38:39 +0000
Date: Sun, 21 Dec 2025 03:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: Re: [PATCHv5 bpf-next 9/9] bpf,x86: Use single ftrace_ops for direct
 calls
Message-ID: <202512210241.4wuAmCHu-lkp@intel.com>
References: <20251215211402.353056-10-jolsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215211402.353056-10-jolsa@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_113846_801559_BC509046 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

Hi Jiri,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/ftrace-bpf-Remove-FTRACE_OPS_FL_JMP-ftrace_ops-flag/20251216-052916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251215211402.353056-10-jolsa%40kernel.org
patch subject: [PATCHv5 bpf-next 9/9] bpf,x86: Use single ftrace_ops for direct calls
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20251221/202512210241.4wuAmCHu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b324c9f4fa112d61a553bf489b5f4f7ceea05ea8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210241.4wuAmCHu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210241.4wuAmCHu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:367:9: error: call to undeclared function 'direct_ops_del'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     367 |                 ret = direct_ops_del(tr, old_addr);
         |                       ^
   kernel/bpf/trampoline.c:367:9: note: did you mean 'direct_ops_free'?
   kernel/bpf/trampoline.c:298:13: note: 'direct_ops_free' declared here
     298 | static void direct_ops_free(struct bpf_trampoline *tr) { }
         |             ^
>> kernel/bpf/trampoline.c:381:9: error: call to undeclared function 'direct_ops_mod'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     381 |                 ret = direct_ops_mod(tr, new_addr, lock_direct_mutex);
         |                       ^
   kernel/bpf/trampoline.c:381:9: note: did you mean 'direct_ops_free'?
   kernel/bpf/trampoline.c:298:13: note: 'direct_ops_free' declared here
     298 | static void direct_ops_free(struct bpf_trampoline *tr) { }
         |             ^
>> kernel/bpf/trampoline.c:404:9: error: call to undeclared function 'direct_ops_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     404 |                 ret = direct_ops_add(tr, new_addr);
         |                       ^
   kernel/bpf/trampoline.c:404:9: note: did you mean 'direct_ops_free'?
   kernel/bpf/trampoline.c:298:13: note: 'direct_ops_free' declared here
     298 | static void direct_ops_free(struct bpf_trampoline *tr) { }
         |             ^
   3 errors generated.


vim +/direct_ops_del +367 kernel/bpf/trampoline.c

   360	
   361	static int unregister_fentry(struct bpf_trampoline *tr, u32 orig_flags,
   362				     void *old_addr)
   363	{
   364		int ret;
   365	
   366		if (tr->func.ftrace_managed)
 > 367			ret = direct_ops_del(tr, old_addr);
   368		else
   369			ret = bpf_trampoline_update_fentry(tr, orig_flags, old_addr, NULL);
   370	
   371		return ret;
   372	}
   373	
   374	static int modify_fentry(struct bpf_trampoline *tr, u32 orig_flags,
   375				 void *old_addr, void *new_addr,
   376				 bool lock_direct_mutex)
   377	{
   378		int ret;
   379	
   380		if (tr->func.ftrace_managed) {
 > 381			ret = direct_ops_mod(tr, new_addr, lock_direct_mutex);
   382		} else {
   383			ret = bpf_trampoline_update_fentry(tr, orig_flags, old_addr,
   384							   new_addr);
   385		}
   386		return ret;
   387	}
   388	
   389	/* first time registering */
   390	static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
   391	{
   392		void *ip = tr->func.addr;
   393		unsigned long faddr;
   394		int ret;
   395	
   396		faddr = ftrace_location((unsigned long)ip);
   397		if (faddr) {
   398			if (!tr->fops)
   399				return -ENOTSUPP;
   400			tr->func.ftrace_managed = true;
   401		}
   402	
   403		if (tr->func.ftrace_managed) {
 > 404			ret = direct_ops_add(tr, new_addr);
   405		} else {
   406			ret = bpf_trampoline_update_fentry(tr, 0, NULL, new_addr);
   407		}
   408	
   409		return ret;
   410	}
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

