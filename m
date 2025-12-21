Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8F6D68BD5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 11:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+TqO1PApOkcJAk4gfvO0uroOEOi82W6D0HT/iBhJkE=; b=LwJoV1Usm9b8tsVPoa5XmUL5az
	I8U8/Outyk+xKDpCNr19R0QTAHvnv9eZKxyvKtf0I6Ri27wCoMF1kvVEWpb/VjBjeibZDuCRfoyVb
	Pmd54hH+5GY/Sw6aHipz3BrGSOTKJcOLOLRJi6Q8/BvSb7TFhezwfKow0PndlEEF74h7yBhsNhNE2
	l+I902N0xQI2vpKndHT4DBZnpe0oNBLyyn6NEq4w0b2C2ewpD8DTpXUtGFzmkO9lXTvl/bjNnW2Sm
	17c5Cpd1hp6ZvB09X8hCCRf/mNBxH8YcF0NzZ5fNwJ7lJzmre17vHo+L1ehFsIFtD/2/oWzo+c1Td
	QVNjidEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXHKM-0000000CNZs-2nJd;
	Sun, 21 Dec 2025 11:10:18 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXHKJ-0000000CNZX-3EQ3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 11:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766315416; x=1797851416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+NPJn+Uf5wC2z6UBaOnYqECBNjAFZPmQkyUZemGCPe0=;
  b=lx/bjnNNVeXuWVmwxIbqo5eA2Z9DLT43Beis5nWJdrMBBdXDh1MRm8ui
   QGZF8fa0UlVuEV7WKj7wF0/vbz3SpMNL2SC4JSvAYloFalAjly7lN3xR8
   XyWYHI9Nk+BdixOoAkfMFmV1+tjEe62UtU7n1SByJYI67RFyFRJg+aUDj
   rrCil3M8CJJG413YI1ScKHzOt694cmz+BigBnutihgqzd59lj2LzMCkDm
   i/nL/5yBKY7m89yskhkxkY84fSUlptHNxYn3j+yLgDvrH2nU2lKXOJQd9
   YZat3MDjYyod0ChMnyC7dTif09VnXYvbAOxrx5A5eOSQK2DbpQx/MKEHy
   g==;
X-CSE-ConnectionGUID: x307Nho0Q4yKUaRxPYtbtg==
X-CSE-MsgGUID: EFqslQRFSKe5lUi8x966Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70775860"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70775860"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 03:10:13 -0800
X-CSE-ConnectionGUID: ybjirWJBTPmBN9WhcoaNmQ==
X-CSE-MsgGUID: ucpH1pf2T8KJGgjLFu6D+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198916761"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2025 03:10:09 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXHKB-000000005aj-1NhU;
	Sun, 21 Dec 2025 11:10:07 +0000
Date: Sun, 21 Dec 2025 19:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: Re: [PATCHv5 bpf-next 9/9] bpf,x86: Use single ftrace_ops for direct
 calls
Message-ID: <202512211826.gtdm52TX-lkp@intel.com>
References: <20251215211402.353056-10-jolsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215211402.353056-10-jolsa@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_031015_857279_44A9D819 
X-CRM114-Status: UNSURE (   9.74  )
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
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20251221/202512211826.gtdm52TX-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211826.gtdm52TX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211826.gtdm52TX-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/trampoline.c: In function 'unregister_fentry':
>> kernel/bpf/trampoline.c:367:23: error: implicit declaration of function 'direct_ops_del'; did you mean 'direct_ops_free'? [-Wimplicit-function-declaration]
     367 |                 ret = direct_ops_del(tr, old_addr);
         |                       ^~~~~~~~~~~~~~
         |                       direct_ops_free
   kernel/bpf/trampoline.c: In function 'modify_fentry':
>> kernel/bpf/trampoline.c:381:23: error: implicit declaration of function 'direct_ops_mod'; did you mean 'direct_ops_free'? [-Wimplicit-function-declaration]
     381 |                 ret = direct_ops_mod(tr, new_addr, lock_direct_mutex);
         |                       ^~~~~~~~~~~~~~
         |                       direct_ops_free
   kernel/bpf/trampoline.c: In function 'register_fentry':
>> kernel/bpf/trampoline.c:404:23: error: implicit declaration of function 'direct_ops_add'; did you mean 'direct_ops_free'? [-Wimplicit-function-declaration]
     404 |                 ret = direct_ops_add(tr, new_addr);
         |                       ^~~~~~~~~~~~~~
         |                       direct_ops_free


vim +367 kernel/bpf/trampoline.c

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

