Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DD0D3A66B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/l2svaTzZ+AiDvUzyRRzZRqHQoQCXsogemwGjfJUps=; b=Dr2d1fI9bvqrO1Ofe0ff58Uda8
	KOUMqWsiIWUQHQ1RzOj4MLMiba0x3yRAnQWyg9f9ERRV5yMFTp4Kp2sfrAscpp4FY5dzIwwEJC6Ta
	Mj3B7z0Ji0Rd/VS6Qe6pJ8nRrhiQnoQARDLXQkNm6wrpGHFk52zGCIi8clADReDVj4buC7PVQUHnu
	CpsJDxFqjUTnu6dfjUUixjHutYz3As53dknQ10zxgliEhFaRG+F0QpGJmry25Hesfl+twRyqqEnCb
	KEPkwNj+Zx1v1YgpSOj5LcxaevNUYKprZFG3O7hgBsZ/EWx6J0YFXQEYWiPJDSh9u2cDZtNvWqxPJ
	EXaXdWGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5npY-0000000EpyM-35cS;
	Tue, 29 Oct 2024 15:08:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nm3-0000000EoSU-2y6o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:04:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDC51113E;
	Tue, 29 Oct 2024 08:05:14 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 754203F73B;
	Tue, 29 Oct 2024 08:04:43 -0700 (PDT)
Date: Tue, 29 Oct 2024 15:04:41 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Peter Xu <peterx@redhat.com>,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH hotfix 6.12 v2 4/8] mm: resolve faulty mmap_region()
 error path behaviour
Message-ID: <ZyD5iXikMzotl9mU@arm.com>
References: <CAHk-=whD9MrPwPMBgVG16T_u+my8xYtZg2tUGz932HeodVX7Bg@mail.gmail.com>
 <438f50c5-8b8c-444f-ae85-10e5151f3f24@lucifer.local>
 <57mgmdx7wgfwci3yo3ggkmcnm3ujamgkwcccm77ypvmer5tegn@opiq3ceh2uvy>
 <ykzmur56ms7fm4midi6tbncjvcvf7ue4lp7e4orblrmwnefw3e@oa3enlpdrcrr>
 <bea02efe-a695-49e0-b15c-2270a82cadbf@lucifer.local>
 <CAHk-=whpXVBNvd0NJpw9=FGcuTuThwtfcKeM3Ug=Uk6kpChCPA@mail.gmail.com>
 <0b64edb9-491e-4dcd-8dc1-d3c8a336a49b@suse.cz>
 <CAHk-=wgE8410gu3EabjNEHhOYh1dyYwt23J62S4a9SYcwZUFhw@mail.gmail.com>
 <1608957a-d138-4401-98ef-7fbe5fb7c387@suse.cz>
 <cf1deb9b-c5c4-4e85-891d-62ecf9a04e0f@lucifer.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf1deb9b-c5c4-4e85-891d-62ecf9a04e0f@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_080447_864164_982535D0 
X-CRM114-Status: GOOD (  28.24  )
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

Hi Lorenzo,

Thanks for trying to fix this.

On Mon, Oct 28, 2024 at 10:14:50PM +0000, Lorenzo Stoakes wrote:
> From 247003cd2a4b5f4fc2dac97f5ef7e473a47f4324 Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Mon, 28 Oct 2024 22:05:44 +0000
> Subject: [PATCH] mm: perform MTE check within arm64 hook entirely
> 
> It doesn't make sense to have shmem explicitly check this one arch-specific
> case, it is arch-specific, so the arch should handle it. We know shmem is a
> case in which we want to permit MTE, so simply check for this directly.
> 
> This also fixes the issue with checking arch_validate_flags() early, which
> would otherwise break mmap_region().
> 
> In order to implement this we must pass a file pointer, and additionally
> update the sparc code to accept this parameter too.
> 
> We'd ideally like to have eliminated the arch_calc_vm_flag_bits() case, but
> we risk inadvertently changing behaviour as we do not have mmap() flags
> available at the point of the arch_validate_flags() check and a MAP_ANON |
> MAP_HUGETLB case would be accepted for MTE currently, but a MAP_SHARED |
> MAP_HUGETLB would not.
> 
> This is likely an oversight but we want to try to keep behaviour identical
> to before in this patch.

MAP_HUGETLB support for MTE is only in -next currently, so there
wouldn't be any ABI change if we also allowed MAP_SHARED | MAP_HUGETLB.
In 6.12, MAP_HUGETLB is not allowed to have PROT_MTE.

> So continue to check VM_MTE_ALLOWED which arch_calc_vm_flag_bits() sets if
> MAP_ANON.
[...]
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 4ba1d00fabda..e87f5d6799a7 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2733,9 +2733,6 @@ static int shmem_mmap(struct file *file, struct vm_area_struct *vma)
>  	if (ret)
>  		return ret;
> 
> -	/* arm64 - allow memory tagging on RAM-based files */
> -	vm_flags_set(vma, VM_MTE_ALLOWED);

This breaks arm64 KVM if the VMM uses shared mappings for the memory
slots (which is possible). We have kvm_vma_mte_allowed() that checks for
the VM_MTE_ALLOWED flag as the VMM may not use PROT_MTE/VM_MTE directly.

I need to read this thread properly but why not pass the file argument
to arch_calc_vm_flag_bits() and set VM_MTE_ALLOWED in there?

-- 
Catalin

