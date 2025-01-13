Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706F9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 00:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0V56Sb7sqNGix6HQ1QvO1EkN6QyGEMwBCv4yPDzPp8o=; b=XMYfzHcvIW8YvjgWQoelPyQz9G
	2IPazq84BF4gWMepbTU/GdZBXg8MsXo8SRqr+JFZJGlxpVjy8aUv3ZrpCqb7zTarxdnEvtusQ0u3p
	JrIKwUUtDLYX7AvqRgbwVOVBUGxR8SoYcirbBXiwX3JIZDo0FEO+0CgXdokZTW58DsKUv7Cge5UEt
	TCmCyJpxhBmsLU0PxcHh77WwQQpxDq06WQT9C0kd01xnFf4M5SkOrOYGTZzAdTthgk3PTQtEFh1Os
	0oy+BRowYdxHDmQmKDDtYaZioaOMwaQMdQRqy0QrpOTSCU4m0JzTN1BT2nEk29EMH4vCoZiJJ0SBf
	IhTJXDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX8mF-00000003j3M-0I2x;
	Mon, 13 Jan 2025 00:57:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX8ky-00000003imB-41Mo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 00:56:42 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2156e078563so54172435ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 16:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736729800; x=1737334600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V56Sb7sqNGix6HQ1QvO1EkN6QyGEMwBCv4yPDzPp8o=;
        b=Y9kMudBtFilnPuzTyS4D0JY69fPMJfjLDPgHRnuT2vqIwiGo8TS5doKpn9NhaIEGCl
         GFKhz8E27fRRPHjClYLDGIjS0iPOvorcHTRkaW4tjRXNb6luOLOQyyLw8oMleesNGGMM
         /5Y5BnA8qduyr2MPaIvv0Mf0P5/y0FveYrZ8UlSfgsvaeSOABxteEJ9IWghdLld2aNM3
         6/PSbsI9RbyCIJlutgvmev/FmjHWbPXW4O3Y+vnQxK0piafkS6Kl05I1uRY5hhqLCTvb
         cjLIKbUmgt0NEQLAlmElbziA7O64cb50gnoUk79c0lnd5iAj88rOVBh6z4bsLZ8Q3sVE
         sEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736729800; x=1737334600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0V56Sb7sqNGix6HQ1QvO1EkN6QyGEMwBCv4yPDzPp8o=;
        b=fgOkilRooTGtxsyMxFAo6Dgqsiu8PInU66F03YxeeDMgVmcme2OQuZea8o2FPX7rBw
         7roYJeewoDFut0IzPkTbWQQoM0ZSsAwwfV1qrVjaqCFJO0CdgECCK1KkOGZnYPMnLiY8
         fJzoAthpWhc1OeogkI2wknYyYtCF4N2u0MvIgd61iSZwy1j6y6tYMY81Kwb1sTAI5O2i
         /jJ6smxwi/kHdCtKDQvZkpE9h8B1YO9ZUtSZoSEFsOxnjlmDZLmcbwkCbIu/u6w2YXfW
         EkBenO18HEb9gQg1xinx3VpoLWLvESh58GSi3vLa2XqSwvs78ZN81YkSODAIr6fJ0u5p
         8PDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBf6HVysNCfl5msXt6Tdb0G0+FWW5fE5I0y/kfcjS2jWCf3srCOQTcFwAHmgo8qVFkS70nBh4bA6sTzKIjzN5l@lists.infradead.org
X-Gm-Message-State: AOJu0YyW9z6IRCxFTuOUVbUQ+fdRnSKh+GvvOfCkvOhtECPQF1h9YtW6
	jgT7Z3ZqH5CLQH7UQ8c3GrMiYFuPAszf6fwF225j9k9Ktefe2dXT
X-Gm-Gg: ASbGncuoVOGyTMHOvkG5lLqr9DQ0IAvDx/4lS4Zo9ty+EuafFqAvcxTNerE5JWQV6zn
	Be3eeCiKCFFWt6sTmLCpDtdprmAayBmvhPZ4oQVrClGGWDfGLHkfm++sNiOvwj0Vq61M2thLJo5
	L0B9XqAvz5iWF1NDoggqviyWIczmQkQqxbwIOhA8jYIHKTD6zT8y4NvwDJ2lAoBmDieXuFscrdg
	5PXXhTfpuDSC8EQJAP/PxOpu02G2IbFlydztMYxyCMZRpaE31uSBbLaA9IPZtyZTY0=
X-Google-Smtp-Source: AGHT+IGzxYWm0tbkwANQHKte1ZrD6ajm4Ul4JqKrWyhZ4nm01na6Fa/9M40NPrsrME9FDL8oyW0k+A==
X-Received: by 2002:a17:902:cecd:b0:215:6995:1ef3 with SMTP id d9443c01a7336-21a83f3469cmr255885615ad.3.1736729800033;
        Sun, 12 Jan 2025 16:56:40 -0800 (PST)
Received: from Barrys-MBP.hub ([118.92.30.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22d134sm43087125ad.187.2025.01.12.16.56.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jan 2025 16:56:39 -0800 (PST)
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
Date: Mon, 13 Jan 2025 13:56:26 +1300
Message-Id: <20250113005626.2290-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <202501061736.FoHcInHJ-lkp@intel.com>
References: <202501061736.FoHcInHJ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_165641_029380_07AAEF54 
X-CRM114-Status: GOOD (  22.52  )
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

On Mon, Jan 6, 2025 at 11:08 PM kernel test robot <lkp@intel.com> wrote:
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
> config: riscv-randconfig-001-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061736.FoHcInHJ-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061736.FoHcInHJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501061736.FoHcInHJ-lkp@intel.com/
>

Sorry. My bad, does the below diff fix the build?

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 72e559934952..7f3ea687ce33 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -61,7 +61,8 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 bool arch_tlbbatch_should_defer(struct mm_struct *mm);
 void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 			       struct mm_struct *mm,
-			       unsigned long uaddr);
+			       unsigned long uaddr,
+			       unsigned long size);
 void arch_flush_tlb_batched_pending(struct mm_struct *mm);
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
 
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 9b6e86ce3867..aeda64a36d50 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -187,7 +187,8 @@ bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 
 void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 			       struct mm_struct *mm,
-			       unsigned long uaddr)
+			       unsigned long uaddr,
+			       unsigned long size)
 {
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
 }

> All errors (new ones prefixed by >>):
>
>    mm/rmap.c: In function 'set_tlb_ubc_flush_pending':
> >> mm/rmap.c:685:9: error: too many arguments to function 'arch_tlbbatch_add_pending'
>      685 |         arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from arch/riscv/include/asm/pgtable.h:113,
>                     from include/linux/pgtable.h:6,
>                     from include/linux/mm.h:30,
>                     from mm/rmap.c:55:
>    arch/riscv/include/asm/tlbflush.h:62:6: note: declared here
>       62 | void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +/arch_tlbbatch_add_pending +685 mm/rmap.c
>
>    663 
>    664  /*
>    665   * Bits 0-14 of mm->tlb_flush_batched record pending generations.
>    666   * Bits 16-30 of mm->tlb_flush_batched bit record flushed generations.
>    667   */
>    668  #define TLB_FLUSH_BATCH_FLUSHED_SHIFT   16
>    669  #define TLB_FLUSH_BATCH_PENDING_MASK                    \
>    670          ((1 << (TLB_FLUSH_BATCH_FLUSHED_SHIFT - 1)) - 1)
>    671  #define TLB_FLUSH_BATCH_PENDING_LARGE                   \
>    672          (TLB_FLUSH_BATCH_PENDING_MASK / 2)
>    673 
>    674  static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
>    675                                        unsigned long uaddr,
>    676                                        unsigned long size)
>    677  {
>    678          struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
>    679          int batch;
>    680          bool writable = pte_dirty(pteval);
>    681 
>    682          if (!pte_accessible(mm, pteval))
>    683                  return;
>    684 
>  > 685          arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
>    686          tlb_ubc->flush_required = true;
>    687 
>    688          /*
>    689           * Ensure compiler does not re-order the setting of tlb_flush_batched
>    690           * before the PTE is cleared.
>    691           */
>    692          barrier();
>    693          batch = atomic_read(&mm->tlb_flush_batched);
>    694  retry:
>    695          if ((batch & TLB_FLUSH_BATCH_PENDING_MASK) > TLB_FLUSH_BATCH_PENDING_LARGE) {
>    696                  /*
>    697                   * Prevent `pending' from catching up with `flushed' because of
>    698                   * overflow.  Reset `pending' and `flushed' to be 1 and 0 if
>    699                   * `pending' becomes large.
>    700                   */
>    701                  if (!atomic_try_cmpxchg(&mm->tlb_flush_batched, &batch, 1))
>    702                          goto retry;
>    703          } else {
>    704                  atomic_inc(&mm->tlb_flush_batched);
>    705          }
>    706 
>    707          /*
>    708           * If the PTE was dirty then it's best to assume it's writable. The
>    709           * caller must use try_to_unmap_flush_dirty() or try_to_unmap_flush()
>    710           * before the page is queued for IO.
>    711           */
>    712          if (writable)
>    713                  tlb_ubc->writable = true;
>    714  }
>    715 
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

