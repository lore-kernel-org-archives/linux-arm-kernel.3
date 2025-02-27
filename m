Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C658C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBKUGSmGWbrc2XucagjHUdKGFYi/mVfeD9rSvtYVZAY=; b=hV4SjvAqfxwWGTdS1v2t8mflRM
	ba3aKgiCyrPeYhqIpLQ7IwgyMpez1VMYX5BLLn0EOMcWW8uFxAMwnuRJ2ER3Bh1rxUtwfHunaIegm
	4M0nqk7soDKFBXAeVNcxW0+WxTZ0Rgy3Z4uYZcHKjRtPhLC9ZNDWGcfZE/5MYCYrxq6EpAibBODR6
	LB7Qp/JFDF7lddwzgJUHhd+CRgDqU9RYJP2ZrMaS07g64OlLyxzhygJczIIGvqE0ujhn7QUxFwtx1
	DrrUpoLrhPZbgrUnula5xYQ7nL2UBxdxNEWLsqDRPleEY9Y5Mwk3omT6KNmjLxMFgROrByn6ktJqu
	QJXTlqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjP-00000008Y9Q-2pWv;
	Thu, 27 Feb 2025 19:39:39 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngos-000000085Gc-39c1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 16:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740673987; x=1772209987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BD4f1tzirgqPmQ5M6W5JBi3601o80CXVHLpgb/NNKms=;
  b=O5iKsNbjnROiM3hGa2DXU/Zta0fqwBF/CDrirkknyKDhrFUj5oeJMfuC
   cSMrlRsLYNAw8GFO/QRSNcq0vQRQdtne7pDJ7pe/ivLlYhQYw76UGD4n3
   G+Jq0RH1o628s3/xv5jg0BiBnmgZcNCQFj/HXHms4BEe01TmNccAECVwE
   M2g6o6gbuQiYc9GLwqIYK6Mscx1PP6Fcz3Cs9imiO17mKBL7bAVrAjPMg
   4LAvTmq11nOlPLxTCC5whJcz3CqxxSOkOt/FkkeuUP8dnmrtRQ3wj3f5l
   aj5zPvG+eSAiDswaHys5wQ2teLutEsCwF2Hnq4M9/y+4ctfRFkgMofM13
   Q==;
X-CSE-ConnectionGUID: a4cTg8GeSiGxu0474Vj0Rg==
X-CSE-MsgGUID: rzv0edEWQ7yr08hgH5wq6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52985984"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52985984"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 08:33:06 -0800
X-CSE-ConnectionGUID: MWXNu6UFS3qVgsk7wMMXFQ==
X-CSE-MsgGUID: Ykyo5a2lRQ6WUsTSyMn8Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="140304005"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Feb 2025 08:33:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tngoj-000Dhm-2B;
	Thu, 27 Feb 2025 16:32:57 +0000
Date: Fri, 28 Feb 2025 00:32:28 +0800
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
Message-ID: <202502280004.QmU2zIb5-lkp@intel.com>
References: <20250226121537.752241-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226121537.752241-1-dongml2@chinatelecom.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_083306_800499_CDAADB12 
X-CRM114-Status: GOOD (  10.15  )
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
config: x86_64-randconfig-r112-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280004.QmU2zIb5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280004.QmU2zIb5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280004.QmU2zIb5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/kfunc_md.c:12:23: sparse: sparse: symbol 'kfunc_mds' redeclared with different type (different address spaces):
   kernel/trace/kfunc_md.c:12:23: sparse:    struct kfunc_md [noderef] __rcu *[addressable] [toplevel] kfunc_mds
   kernel/trace/kfunc_md.c: note: in included file:
   include/linux/kfunc_md.h:16:24: sparse: note: previously declared as:
   include/linux/kfunc_md.h:16:24: sparse:    struct kfunc_md *extern [addressable] [toplevel] kfunc_mds
>> kernel/trace/kfunc_md.c:186:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct kfunc_md *md @@     got struct kfunc_md [noderef] __rcu * @@
   kernel/trace/kfunc_md.c:186:20: sparse:     expected struct kfunc_md *md
   kernel/trace/kfunc_md.c:186:20: sparse:     got struct kfunc_md [noderef] __rcu *

vim +186 kernel/trace/kfunc_md.c

   169	
   170	/* Get a exist metadata by the function address, and NULL will be returned
   171	 * if not exist.
   172	 *
   173	 * NOTE: rcu lock should be held during reading the metadata, and
   174	 * kfunc_md_lock should be held if writing happens.
   175	 */
   176	struct kfunc_md *kfunc_md_find(void *ip)
   177	{
   178		struct kfunc_md *md;
   179		u32 index;
   180	
   181		if (kfunc_md_arch_exist(ip)) {
   182			index = kfunc_md_get_index(ip);
   183			if (WARN_ON_ONCE(index >= kfunc_md_count))
   184				return NULL;
   185	
 > 186			md = &kfunc_mds[index];
   187			return md;
   188		}
   189		return NULL;
   190	}
   191	EXPORT_SYMBOL_GPL(kfunc_md_find);
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

