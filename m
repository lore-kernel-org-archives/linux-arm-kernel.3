Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27E2E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 00:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DftPL8326UAsz4FZjKeYPUXF6bE+WvYDND7zuo6rld8=; b=ZHsdxrXdBqdHOtdoLyfxI7OtwE
	BiiwNuwKVnCzYAVvfI8cUpkM/uh8eygwS4FNFaQriJ8ztx+ViJAhD59aDJtFOrBhlXQvOl5F5O6zz
	HRg6tfbNvthcxwc63of+4xoaZN62MMZ41FDOZPWWY4khpdtCPwWfwe36rbOKG5Yldwg1A4GIejaqc
	Tn0DDL1XE14uTIU33RFjuOzztXdN0mpWV6nm3XsDIhMl0herqsavJ3Qjd/6zTyrsuR5Q6FbenRt2Q
	2LbSc7ACpP/kdWjLIoNjG8EqecwU916yBsR3VLozbNYMv1/+EuKibU5ijjk1J3YsuFiR8PJa5KgkX
	VlIEHj8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX8ku-00000003iku-1rsQ;
	Mon, 13 Jan 2025 00:56:36 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX8je-00000003idC-3ozh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 00:55:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-215770613dbso44845105ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 16:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736729718; x=1737334518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DftPL8326UAsz4FZjKeYPUXF6bE+WvYDND7zuo6rld8=;
        b=GyK/4wH0GOr3BKopQDTEDRS6pBlUoYJiDo2TRoSNekSO2MFOdguwXGmO/6yoGRSelQ
         IAX/KpJjzhTESThuxrKzaDrhNBgsq5QnjUwd6mcFM8v0MAdm2zH10c1oadrAb1ZZSWyb
         7+bRDjm8R+XrntXhEbSq27Jw5/hXXLHUVQ9hS18S+yGk0fiVnKClIRF+Lsb4+9GmIryU
         rp+9F6+lFXI1XIEpUGXyBITNagncD8LYgB4bzfYGgGpyAKrHYoUVbJ3mMJpk6y4nCN7x
         FthkNznVsjYUH38DGuCDD2Q02RpPuJAl7k5xk0p0hhqoPEVQlSEqvSsLV9apocv85x0u
         Wf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736729718; x=1737334518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DftPL8326UAsz4FZjKeYPUXF6bE+WvYDND7zuo6rld8=;
        b=gdh6CulnBewU+6EURHViXjG57Xpb6o+eXSPkbNKKtmR3GmS7d4EtWtvIXi9EeMeR63
         3zTzdhjge5daJ6T6qUDRU83xEaGAkVyAIjgr2YIJRg1Cs6c10MmxbrnCr5omSuekkZao
         nX9YT9hAa4tdpBbeRnuTq5wwM9s7Tmen+addhjlKyQf1e1TsqV/UStQ7j4G9E73P7ZxO
         bacKmDFp+pDZuqwuObCXhHFIG3NcPEzqHFO5DSrQtYcfVS8LRVtYEj+9YlQTuO76VPrT
         1YA4zJhAaYiSofE6cDRxDoWFeOq/DdU9iTcCOosj7qqhW3HjNaJXs53oImSt0XqntAkC
         VmOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2gPN7FWp68iz32Pf6oNnU/R7SBv0RXY1fBe+mf+DaN9Cr/X9xljN9584GUrSLZUaR+AIku0A3ETHkxism6AyG@lists.infradead.org
X-Gm-Message-State: AOJu0YyinzS/0lgiUxyn7M1MXiAXE8MP/6W+jXUV2Ft7VUp8DiqIvBpW
	HrOsJvABQiKeRkGruZOOAJEECoWltLuVg92Gjrh8K/CrLmMuvWwP
X-Gm-Gg: ASbGncvZWyMKAfeiaoQDVARBWFK4MrRDJb3p0ZRxvyBHwZEcsxgNPKSDUYc7eWmTm/F
	BKOeqa08Jpt9lF7wlNt+r7h/eQvo/5cEbJs+iVaCssLGgjZIqt/MXq7GADEmSe6MMZARZRsXBbo
	hfbJxAaSNEH3tKsRRRpBPle0oSGOsQof0VgEICG5chiUDHRoyEx7/4nVRcV5W0jl6e+Ye/P2k5+
	o1cN7+oCH7u4owJkXR30AsEtyZQCbcPAmRRFydgonRkRk2XCGT4WnKkd/29WXO5ZamB01mADZmH
	xZI=
X-Google-Smtp-Source: AGHT+IHJb4rm8dh2mYTH8DrjYzBNHLloKyhUrkK2np0t5gjJsH2XzcUI/ZXVpWr7Siu7WH20wTT76Q==
X-Received: by 2002:a17:90a:da88:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-2f548f3fdfbmr21532944a91.33.1736729717704;
        Sun, 12 Jan 2025 16:55:17 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:39b5:3f0b:acf3:9158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f5593d08a8sm7315585a91.9.2025.01.12.16.55.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jan 2025 16:55:17 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: lkp@intel.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	baolin.wang@linux.alibaba.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	chrisl@kernel.org,
	dave.hansen@linux.intel.com,
	david@redhat.com,
	gshan@redhat.com,
	hpa@zytor.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	kirill.shutemov@linux.intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mark.rutland@arm.com,
	mingo@redhat.com,
	oe-kbuild-all@lists.linux.dev,
	ryan.roberts@arm.com,
	shahuang@redhat.com,
	tglx@linutronix.de,
	v-songbaohua@oppo.com,
	wangkefeng.wang@huawei.com,
	will@kernel.org,
	x86@kernel.org,
	ying.huang@intel.com,
	yosryahmed@google.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
Date: Mon, 13 Jan 2025 13:55:04 +1300
Message-Id: <20250113005504.2271-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <202501061535.zx9E486H-lkp@intel.com>
References: <202501061535.zx9E486H-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_165518_951546_A3CB6E9C 
X-CRM114-Status: GOOD (  18.17  )
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

On Mon, Jan 6, 2025 at 9:23 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Barry,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-set-folio-swapbacked-iff-folios-are-dirty-in-try_to_unmap_one/20250106-112638
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20250106031711.82855-3-21cnbao%40gmail.com
> patch subject: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
> config: i386-buildonly-randconfig-002-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061535.zx9E486H-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061535.zx9E486H-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501061535.zx9E486H-lkp@intel.com/

Sorry. My bad, does the below fix the build?

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index cda35f53f544..4b62a6329b8f 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -280,7 +280,7 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
 static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 					     struct mm_struct *mm,
 					     unsigned long uaddr,
-					     unsignd long size)
+					     unsigned long size)
 {
 	inc_mm_tlb_gen(mm);
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));

>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/x86/include/asm/uaccess.h:17,
>                     from include/linux/uaccess.h:12,
>                     from include/linux/sched/task.h:13,
>                     from include/linux/sched/signal.h:9,
>                     from include/linux/rcuwait.h:6,
>                     from include/linux/percpu-rwsem.h:7,
>                     from include/linux/fs.h:33,
>                     from include/linux/cgroup.h:17,
>                     from include/linux/memcontrol.h:13,
>                     from include/linux/swap.h:9,
>                     from include/linux/suspend.h:5,
>                     from arch/x86/kernel/asm-offsets.c:14:
> >> arch/x86/include/asm/tlbflush.h:283:46: error: unknown type name 'unsignd'; did you mean 'unsigned'?
>      283 |                                              unsignd long size)
>          |                                              ^~~~~~~
>          |                                              unsigned
>    make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=998720002
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1263: prepare0] Error 2 shuffle=998720002
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=998720002
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:251: __sub-make] Error 2 shuffle=998720002
>    make: Target 'prepare' not remade because of errors.
>
>
> vim +283 arch/x86/include/asm/tlbflush.h
>
>    279 
>    280  static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>    281                                               struct mm_struct *mm,
>    282                                               unsigned long uaddr,
>  > 283                                               unsignd long size)
>    284  {
>    285          inc_mm_tlb_gen(mm);
>    286          cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
>    287          mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
>    288  }
>    289 
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

