Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4B8CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXWxOyVDhhNuII6gzr2ZqIIKMYZWzjDs2IKIrhfkpow=; b=FRiJbiA2/iY6NzMbnxFkltzHML
	rHETOtOUHfzKIVp3/rhpno/qeVzfyZr01ZgDJMCQhVEl6ddHRF0PIpzzc8G5b1WkWaW6sD+5db49i
	7dPN5J6mLl1iNf2xCUiPSNn7X/Mlc/6xM4HMYDT28OQlle3mInjhp05zBSiugVsEx8rJ24YEsgblX
	etWWnvUnB6uKPbDHnkUquiDGeaZomXECBT9m+juO+SW+NF5hPvhDpVzsDkY9ZmO0qAtQw9FpkIEfl
	+kePzxjPw2zwtAEbq5nOw7esLiOP2arVMlw8vJAaELUFzG3lDwKHKoJiOgXwd5YZeF7LjiSJh/gK6
	4lF4jG/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObau-0000000Gd1f-0DAG;
	Thu, 27 Nov 2025 12:59:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObas-0000000Gd1T-0dIB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:59:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2628F60141;
	Thu, 27 Nov 2025 12:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21B8C4CEF8;
	Thu, 27 Nov 2025 12:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764248368;
	bh=9FAZ+a3Saa3K2w/qcM5YJymiW3fVjUChcc0PgFLP3kM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fI4FSWoNziNxUPbDB6JkgJO1Yjnf6Bti878Qij6lf/sDn7w/gHEsxCWtwUKbfzIC7
	 1qXgeeNkfSyJhRfPo/0VWdYXYX4XMehPWqREme+oOWuyDGHPw8cDGW7ToctKEVSehA
	 ui5RCOiknFcesTzXJ2Ca6+7A1XjGiV6XEAGWE3VL9D8J+DKMcpJ1Z6B9X3diNElvPw
	 qwN9QiVjiXoWMzyQg5SknYsw+Gd2nxZApTimNOLjRHI5fhnt7oOZWcydR97/QNxkz7
	 +PgzdNbs94jarrIsGJ+qTzv5SBvS+hsNRz7eC90oioecBC1ZZaQmSWaMBECtd/ovl+
	 GIp6SjbV/s45w==
Date: Thu, 27 Nov 2025 12:59:22 +0000
From: Will Deacon <will@kernel.org>
To: Zizhi Wo <wozizhi@huaweicloud.com>
Cc: jack@suse.com, brauner@kernel.org, hch@lst.de,
	akpm@linux-foundation.org, linux@armlinux.org.uk,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	wozizhi@huawei.com, yangerkun@huawei.com,
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com,
	xieyuanbin1@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
Message-ID: <aShLKpTBr9akSuUG@willie-the-truck>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
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

On Wed, Nov 26, 2025 at 05:05:05PM +0800, Zizhi Wo wrote:
> We're running into the following issue on an ARM32 platform with the linux
> 5.10 kernel:
> 
> [<c0300b78>] (__dabt_svc) from [<c0529cb8>] (link_path_walk.part.7+0x108/0x45c)
> [<c0529cb8>] (link_path_walk.part.7) from [<c052a948>] (path_openat+0xc4/0x10ec)
> [<c052a948>] (path_openat) from [<c052cf90>] (do_filp_open+0x9c/0x114)
> [<c052cf90>] (do_filp_open) from [<c0511e4c>] (do_sys_openat2+0x418/0x528)
> [<c0511e4c>] (do_sys_openat2) from [<c0513d98>] (do_sys_open+0x88/0xe4)
> [<c0513d98>] (do_sys_open) from [<c03000c0>] (ret_fast_syscall+0x0/0x58)
> ...
> [<c0315e34>] (unwind_backtrace) from [<c030f2b0>] (show_stack+0x20/0x24)
> [<c030f2b0>] (show_stack) from [<c14239f4>] (dump_stack+0xd8/0xf8)
> [<c14239f4>] (dump_stack) from [<c038d188>] (___might_sleep+0x19c/0x1e4)
> [<c038d188>] (___might_sleep) from [<c031b6fc>] (do_page_fault+0x2f8/0x51c)
> [<c031b6fc>] (do_page_fault) from [<c031bb44>] (do_DataAbort+0x90/0x118)
> [<c031bb44>] (do_DataAbort) from [<c0300b78>] (__dabt_svc+0x58/0x80)
> ...
> 
> During the execution of hash_name()->load_unaligned_zeropad(), a potential
> memory access beyond the PAGE boundary may occur. For example, when the
> filename length is near the PAGE_SIZE boundary. This triggers a page fault,
> which leads to a call to do_page_fault()->mmap_read_trylock(). If we can't
> acquire the lock, we have to fall back to the mmap_read_lock() path, which
> calls might_sleep(). This breaks RCU semantics because path lookup occurs
> under an RCU read-side critical section. In linux-mainline, arm/arm64
> do_page_fault() still has this problem:
> 
> lock_mm_and_find_vma->get_mmap_lock_carefully->mmap_read_lock_killable.
> 
> And before commit bfcfaa77bdf0 ("vfs: use 'unsigned long' accesses for
> dcache name comparison and hashing"), hash_name accessed the name byte by
> byte.
> 
> To prevent load_unaligned_zeropad() from accessing beyond the valid memory
> region, we would need to intercept such cases beforehand? But doing so
> would require replicating the internal logic of load_unaligned_zeropad(),
> including handling endianness and constructing the correct value manually.
> Given that load_unaligned_zeropad() is used in many places across the
> kernel, we currently haven't found a good solution to address this cleanly.
> 
> What would be the recommended way to handle this situation? Would
> appreciate any feedback and guidance from the community. Thanks!

Does it help if you bodge the translation fault handler along the lines
of the untested diff below?

Will

--->8

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index bf1577216ffa..b3c81e448798 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -407,7 +407,7 @@ do_translation_fault(unsigned long addr, unsigned int fsr,
        if (addr < TASK_SIZE)
                return do_page_fault(addr, fsr, regs);
 
-       if (user_mode(regs))
+       if (user_mode(regs) || fsr_fs(fsr) == FSR_FS_INVALID_PAGE)
                goto bad_area;
 
        index = pgd_index(addr);
diff --git a/arch/arm/mm/fault.h b/arch/arm/mm/fault.h
index 9ecc2097a87a..8fb26f85e361 100644
--- a/arch/arm/mm/fault.h
+++ b/arch/arm/mm/fault.h
@@ -12,6 +12,8 @@
 #define FSR_FS3_0              (15)
 #define FSR_FS5_0              (0x3f)
 
+#define FSR_FS_INVALID_PAGE    7
+
 #ifdef CONFIG_ARM_LPAE
 #define FSR_FS_AEA             17
 
diff --git a/arch/arm/mm/fsr-2level.c b/arch/arm/mm/fsr-2level.c
index f2be95197265..c7060da345df 100644
--- a/arch/arm/mm/fsr-2level.c
+++ b/arch/arm/mm/fsr-2level.c
@@ -11,7 +11,7 @@ static struct fsr_info fsr_info[] = {
        { do_bad,               SIGBUS,  0,             "external abort on linefetch"      },
        { do_translation_fault, SIGSEGV, SEGV_MAPERR,   "section translation fault"        },
        { do_bad,               SIGBUS,  0,             "external abort on linefetch"      },
-       { do_page_fault,        SIGSEGV, SEGV_MAPERR,   "page translation fault"           },
+       { do_translation_fault, SIGSEGV, SEGV_MAPERR,   "page translation fault"           },
        { do_bad,               SIGBUS,  0,             "external abort on non-linefetch"  },
        { do_bad,               SIGSEGV, SEGV_ACCERR,   "section domain fault"             },
        { do_bad,               SIGBUS,  0,             "external abort on non-linefetch"  },
diff --git a/arch/arm/mm/fsr-3level.c b/arch/arm/mm/fsr-3level.c
index d0ae2963656a..19df4af828bd 100644
--- a/arch/arm/mm/fsr-3level.c
+++ b/arch/arm/mm/fsr-3level.c
@@ -7,7 +7,7 @@ static struct fsr_info fsr_info[] = {
        { do_bad,               SIGBUS,  0,             "reserved translation fault"    },
        { do_translation_fault, SIGSEGV, SEGV_MAPERR,   "level 1 translation fault"     },
        { do_translation_fault, SIGSEGV, SEGV_MAPERR,   "level 2 translation fault"     },
-       { do_page_fault,        SIGSEGV, SEGV_MAPERR,   "level 3 translation fault"     },
+       { do_translation_fault, SIGSEGV, SEGV_MAPERR,   "level 3 translation fault"     },
        { do_bad,               SIGBUS,  0,             "reserved access flag fault"    },
        { do_bad,               SIGSEGV, SEGV_ACCERR,   "level 1 access flag fault"     },
        { do_page_fault,        SIGSEGV, SEGV_ACCERR,   "level 2 access flag fault"     },


