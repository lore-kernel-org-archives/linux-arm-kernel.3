Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67085D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUOzF3SR4AYKkptzzIkO1KpHc4LaMt9hjccp5my63I4=; b=zdbt7v14kc5kyOaXRnI35TaM+Z
	64A8VT3lT4re2a0cFRp73cJvoU2f+/+NF+s1iW1Dbkewaq0dIxxSwOMiH0HRWcnHYc8Dq1gSMAuDk
	LwHJXjmcfjjhyc5cTeEX3bvgtKaMb5y9181fLiqfXELJ2LquH9FrT6aZifhHdYE0QvpeT3a3stHY+
	qWzdpyk3+/ojC8wO/Wx7kgkeggKIA8GPXIOyVi2FKLBkKZSOGEGWzl2g0RNlfWRTQSJo9EQI5JUV2
	u/CUMIJeJffsvYjqUOvn5y21a9dLKeCmet4c01joDQiAQdV4W0B/WWeOOzfZtPCLnf3kUr3+AAOvG
	0NjoWe/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOxXC-00000000QOK-3Cpb;
	Fri, 28 Nov 2025 12:25:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOxXA-00000000QNd-1kDO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 12:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D144640467;
	Fri, 28 Nov 2025 12:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA2FC4CEF1;
	Fri, 28 Nov 2025 12:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764332707;
	bh=w//MMNaJ76/6XmuFlJvBo5HIxOMDYwo1z3nrqJzcqPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFYuo7O6PCmDiLmkZeeh6nVMNHkwYIYbsLmfcKYnkYNKUATjFpjfTZFq3Q+28KE7g
	 ylt9vg//gd1+4k8VyYXowAEW5KYWTyqqH8fDxCjY7xCdp0JYC8lbiAvqFTPDSDuzVd
	 ZZNkKSnMf7l6FLFaN4UTLygN0pK+cATxNDnYUILy8odb1QsWZhW9MIh21tT3yRxRKR
	 pKfcxYFqWNwThsn7KLBSaNRF1fHII9S2TmQ2dqm3qTKUm2S1BIPmkAq6tPt30ayMfV
	 tVfq4PWAJPQDJP9s/Mj6hQm3sivZGux0EL/3BnsxPBqKy22MZCFiBrON583IqSyDV9
	 Ng7LVaqtx5vZQ==
Date: Fri, 28 Nov 2025 12:25:01 +0000
From: Will Deacon <will@kernel.org>
To: Zizhi Wo <wozizhi@huaweicloud.com>
Cc: jack@suse.com, brauner@kernel.org, hch@lst.de,
	akpm@linux-foundation.org, linux@armlinux.org.uk,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	yangerkun@huawei.com, wangkefeng.wang@huawei.com,
	pangliyuan1@huawei.com, xieyuanbin1@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
Message-ID: <aSmUnZZATTn3JD7m@willie-the-truck>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <aShLKpTBr9akSuUG@willie-the-truck>
 <9ff0d134-2c64-4204-bbac-9fdf0867ac46@huaweicloud.com>
 <39d99c56-3c2f-46bd-933f-2aef69d169f3@huaweicloud.com>
 <61757d05-ffce-476d-9b07-88332e5db1b9@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61757d05-ffce-476d-9b07-88332e5db1b9@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_042508_522107_E7A08B0F 
X-CRM114-Status: GOOD (  32.79  )
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

On Fri, Nov 28, 2025 at 09:39:45AM +0800, Zizhi Wo wrote:
> 在 2025/11/28 9:18, Zizhi Wo 写道:
> > 在 2025/11/28 9:17, Zizhi Wo 写道:
> > > 在 2025/11/27 20:59, Will Deacon 写道:
> > > > On Wed, Nov 26, 2025 at 05:05:05PM +0800, Zizhi Wo wrote:
> > > > > We're running into the following issue on an ARM32 platform
> > > > > with the linux
> > > > > 5.10 kernel:
> > > > > 
> > > > > [<c0300b78>] (__dabt_svc) from [<c0529cb8>]
> > > > > (link_path_walk.part.7+0x108/0x45c)
> > > > > [<c0529cb8>] (link_path_walk.part.7) from [<c052a948>]
> > > > > (path_openat+0xc4/0x10ec)
> > > > > [<c052a948>] (path_openat) from [<c052cf90>] (do_filp_open+0x9c/0x114)
> > > > > [<c052cf90>] (do_filp_open) from [<c0511e4c>]
> > > > > (do_sys_openat2+0x418/0x528)
> > > > > [<c0511e4c>] (do_sys_openat2) from [<c0513d98>] (do_sys_open+0x88/0xe4)
> > > > > [<c0513d98>] (do_sys_open) from [<c03000c0>]
> > > > > (ret_fast_syscall+0x0/0x58)
> > > > > ...
> > > > > [<c0315e34>] (unwind_backtrace) from [<c030f2b0>]
> > > > > (show_stack+0x20/0x24)
> > > > > [<c030f2b0>] (show_stack) from [<c14239f4>] (dump_stack+0xd8/0xf8)
> > > > > [<c14239f4>] (dump_stack) from [<c038d188>]
> > > > > (___might_sleep+0x19c/0x1e4)
> > > > > [<c038d188>] (___might_sleep) from [<c031b6fc>]
> > > > > (do_page_fault+0x2f8/0x51c)
> > > > > [<c031b6fc>] (do_page_fault) from [<c031bb44>]
> > > > > (do_DataAbort+0x90/0x118)
> > > > > [<c031bb44>] (do_DataAbort) from [<c0300b78>] (__dabt_svc+0x58/0x80)
> > > > > ...
> > > > > 
> > > > > During the execution of
> > > > > hash_name()->load_unaligned_zeropad(), a potential
> > > > > memory access beyond the PAGE boundary may occur. For example, when the
> > > > > filename length is near the PAGE_SIZE boundary. This
> > > > > triggers a page fault,
> > > > > which leads to a call to
> > > > > do_page_fault()->mmap_read_trylock(). If we can't
> > > > > acquire the lock, we have to fall back to the
> > > > > mmap_read_lock() path, which
> > > > > calls might_sleep(). This breaks RCU semantics because path
> > > > > lookup occurs
> > > > > under an RCU read-side critical section. In linux-mainline, arm/arm64
> > > > > do_page_fault() still has this problem:
> > > > > 
> > > > > lock_mm_and_find_vma->get_mmap_lock_carefully->mmap_read_lock_killable.
> > > > > 
> > > > > And before commit bfcfaa77bdf0 ("vfs: use 'unsigned long' accesses for
> > > > > dcache name comparison and hashing"), hash_name accessed the
> > > > > name byte by
> > > > > byte.
> > > > > 
> > > > > To prevent load_unaligned_zeropad() from accessing beyond
> > > > > the valid memory
> > > > > region, we would need to intercept such cases beforehand? But doing so
> > > > > would require replicating the internal logic of
> > > > > load_unaligned_zeropad(),
> > > > > including handling endianness and constructing the correct
> > > > > value manually.
> > > > > Given that load_unaligned_zeropad() is used in many places across the
> > > > > kernel, we currently haven't found a good solution to
> > > > > address this cleanly.
> > > > > 
> > > > > What would be the recommended way to handle this situation? Would
> > > > > appreciate any feedback and guidance from the community. Thanks!
> > > > 
> > > > Does it help if you bodge the translation fault handler along the lines
> > > > of the untested diff below?
> 
> I tried it out and it works — thank you for the solution you provided.

Thanks for giving it a spin.

> At the same time, since I’m a beginner in this area, I’d like to ask a
> question.
> 
> The comment above do_translation_fault() says:
> “We enter here because the first level page table doesn't contain a
> valid entry for the address.”
> 
> However, after modifying the code, it seems that when encountering
> FSR_FS_INVALID_PAGE, the kernel no longer creates a page table entry,
> but instead directly jumps to bad_area.

FSR_FS_INVALID_PAGE indicates a last level translation fault (that's the
"page" part) so it's only applicable in the case where the other levels
of page-table have been populated already.

I wondered about checking !is_vmalloc_addr() too, but I couldn't
convince myself that load_unaligned_zeropad() is only ever used with the
linear map.

> I'd like to ask — could this change potentially cause any other side
> effects?

There's always the possibility but I personally think it's more
self-contained than the other patches doing the rounds. For example, I
don't make any changes to the permission fault handling path.

Will

