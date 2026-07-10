Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0ECC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1W19wWSuG0iYCLEvXWxpxOAlCnPTIm0FeKu7uLWgRBU=; b=dgv7gXLJIwRzK/9HCreJRwfG3P
	wjtZTvY4quqHUxZ4WNZNYnJrSFT0JgYlU3soaRlW/robcoc2MPwzLJd7E4NEbtkTMli6qI+8zOE2a
	NB+A93gC8F8jDUIU/TZgrgozdsK4ZsnHj2gkVvTXK9Ji1ffWtlAOtVlnAZLkK1xvG7TdMF3XjiuNH
	jrfRprRw+XrAP0SBvgPPPLGlvjMNoEm3ObbPfYGRyFfHXGh0nShqR0U0So8Gwpp04MzOSXEIQFpeH
	5/PDSYXEgh1lfCVHENCNHk1bSx+MzVFv4LGK2mISbXAUMeHcpBqtN1WWvIDh8MLho6jMDvSwEiY/A
	RFhSltBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9el-00000004qcU-2VJs;
	Fri, 10 Jul 2026 11:44:35 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9ej-00000004qc6-2kb5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:44:34 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-448df16ab34so304162fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 04:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783683872; cv=none;
        d=google.com; s=arc-20260327;
        b=ZXZCsS/hvIOBA3kwQLMBmPuDJRM65osBJ+brQ0Z+C+rjZTI+yubZULb/iazLavMIug
         UIwtUSrdI8QNUErBM/EeKspd0nSKMgHMYW/JJsXCVQ2Ceb4kfnKnfF5BB/BWk8/k9sO1
         MpYlUT2MufNpsn6t2mMk02wRjwiVphehbiqxy/odkZ0wEOtDTDri5P2Cu+7NoQXf3jit
         QZNnCIFD00+ieLC6rm6iokL8+JXVt8oLv8YkHNWx5L6EfSOpKJWpo6pmnchlIp6xAhL3
         bwi4xlkE8mgtSW192cVS0BycQRTqZ6e/wgA5i5TxEfbj7LVqG63kSNcFKIwJlFlk1yYC
         5EzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1W19wWSuG0iYCLEvXWxpxOAlCnPTIm0FeKu7uLWgRBU=;
        fh=UFOMs9cYnqf4/vzm9kEpqFJT1T3tg9efDqamKl4bsns=;
        b=Gl3jVQhiPjbJimBxBjDDR3cBNX3rGQblf3N0Xv1IbeBnLV8+8oe1/ef8FwlX/xZCAc
         3u9EB02wfRJKXMnkZw86DqH78sySVWEZbSCICfi5+aupQSfnRBEkVJDHx8GCW9wSQOYs
         9OqTWL3Y73uoVyuXoJwrOskes9YiwiG0t9/LwYuufF9/g3+YQ0dtjC5dknJ3JHLTMH0z
         lhnWmcjrfic52Wyxuc9eZbWs+p9Ei27gddoKLPpArrwutbPMf3YYC/C6TqIqrGwrf6pb
         IneqzbmYvG6vfRgyi51Ppv8hsIHCX5WgyPzFLRbxiVkLCCtqgCMfe65nf1A1VnRQjF3s
         Kjtw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783683872; x=1784288672; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1W19wWSuG0iYCLEvXWxpxOAlCnPTIm0FeKu7uLWgRBU=;
        b=RHl3w/ulk3Pb4jdihxPMPVIQ+tIfjap7uuUdLgzEaTE4qkTN9YE5DeB1Ro4yusHGAA
         JIHmj3gRgrhCXZzr+GbCl2ansXtv5t+B7SCRcdazY4zQbKJyC/JK6T+5L2qv6JUsaoXw
         BVCOKUMb9C5GTClc1nYS7NvjU2olTsgZbedVZO3fmsBL2UxELAfyimR8S0PupCZnU2H9
         /WnxvryLdRcubGSQGxIIwnVozYOTh/YRmPX6hED8UtET4caW/sUHgCASsmCp1+J6xtGx
         jZKK3Iv8Blst7LP61IM1P5oDBRkUDJe+9KexVFqxO9iX/+XeNFRu5ma2djDZ40N/nfd/
         /v3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683872; x=1784288672;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1W19wWSuG0iYCLEvXWxpxOAlCnPTIm0FeKu7uLWgRBU=;
        b=Bq2Gop6MOSKiKir5KeB5mZaiIlhp26M0fAEtrbEVc4i0Is1OEua8bMXQ7A/VBDYLdr
         l70BxwF/H+/Htt7I3MU3M415BAj2GPI/YJKHmXbi29YmD+GB5i00IFiZqdWB1y0BoH8I
         Dbk16Nl7sm59mLRJU5dHxTuyLf77dMguP/D/8J9iKdWKX8pi5Ki8xb/VUR72CJbjdV2u
         Zj28l6Hu5zRjZFCk1L+um/EpREpgQcWwo2OjuEz2HKcqBw1MHOfS+vp3hCWIZmDvhX9S
         2nigyWhpIszX/FqFkS/XRfOakkyhw3N9ZFoW3Hiomo0kxP55wJVm9PykYHPN0A35HYlP
         sr9w==
X-Forwarded-Encrypted: i=1; AHgh+RpQ5JhnZa3yo6ArCP1r9zx81O2/Jo5n4YfoPyk1OBDNg1yAV7xfZGAZZJ5qOUGctgUBeq2SzDwW8mB5CzjJY3S1@lists.infradead.org
X-Gm-Message-State: AOJu0YwEzbGB5p9FvbMFkd9X1GKqPstHyJsdd/sWLUL7o0VRzubCcKYh
	ShQmCzXgqW6HT9IEanbYiFdakD8dGtBtX6EmBgo+lu/eCDCVCrIX8Xbu8SdzmR0FxIolhM+jRCz
	39qEww/6AdIhAkByHLoXAoDNruLn2Ro8=
X-Gm-Gg: AfdE7cmrjUae2JNZj04w+CZVaeT8628KKo10UZJRpj3cwMMqYueuh16F91b3lUg/w+0
	K0/WsKWOG/DPC3PN1DvCcO2XhbYxECFfVExFS9s2gw8R01NWZSKn63o56XkB9ITobYUrUr9sjEi
	xvQg499w4ETFJ0b6LaEZPt4imZiO09LKtNX3Mk7NRYXR1Ue8uRjj+bhP99K/DqSIYE2NZrA9YdT
	BUFPK1KmvbqPkeR1h8woWZgBvr+L6RngK3GoLq0MyGSSQdOnxdYCRlvqi2z15ppToGpIfGGAbff
	DxHbH9+O4psYG/imO9KQxupbdA8=
X-Received: by 2002:a05:6870:524b:b0:448:71f4:a28 with SMTP id
 586e51a60fabf-4516373d9d4mr7087933fac.2.1783683872003; Fri, 10 Jul 2026
 04:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
In-Reply-To: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
From: David CARLIER <devnexen@gmail.com>
Date: Fri, 10 Jul 2026 12:44:20 +0100
X-Gm-Features: AUfX_myjz4e4hoeh8KGxFCShwyc8M_PHWmZnYqgvQliJ8DmTRF2ndSu2LOcWe1M
Message-ID: <CA+XhMqwpDGYSQvDKrFz9XuQFiaz8_rgW0LupEzFhehSrFvUZaw@mail.gmail.com>
Subject: Re: [PATCH 0/2] mm: fix UAF caused by race between ptdump and vmap
 pgtable freeing
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Toshi Kani <toshi.kani@hpe.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_044433_709667_61C4ECC5 
X-CRM114-Status: GOOD (  31.02  )
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

On Fri, 10 Jul 2026 at 11:50, Lorenzo Stoakes <ljs@kernel.org> wrote:
>
> Kernel page table walkers fall into two broad categories - those ranges
> where no exclusion is required via walk_kernel_page_table_range_lockless()
> and those where exclusion is required via walk_kernel_page_table_range()
> or walk_page_range_debug().
>
> The former category is used only by arm64 arch code operating on ranges it
> both wholly owns and does not concurrently write.
>
> The latter category consists of kernel page table walkers operating on
> ranges that are wholly owned (but which need exclusion against concurrent
> writers).
>
> The lock used for exclusion is the mmap lock, and for kernel ranges this
> the mmap lock on init_mm.
>
> ptdump is a special case being both the only user of
> walk_page_range_debug(), and the only case in which it walks ranges it does
> not own.
>
> This presents a problem, as page tables may be freed under ptdump. And
> indeed there is a use-after-free bug in the kernel as a result, which this
> series addresses.
>
> vmap promotes page tables to huge leaf entries where possible, freeing the
> lower leaf page table when it does. It does this with no meaningful locks
> held against concurrent ptdump walks.
>
> As a result, use-after-free can currently occur. This series addresses the
> issue by having the vmap huge promotion logic acquire the mmap read lock
> while both setting the huge page table entry and freeing the prior leaf
> page table.
>
> The ptdump code already acquires the mmap write lock, so by doing so we
> ensure that the ptdump walker only ever observes either the huge page table
> entry or the existing page table entry, and nothing is freed underneath it.
>
> A mitigation for this issue was already applied for arm64 in commit
> a93b45fd397 ("arm64: Enable vmalloc-huge with ptdump"), which this series

seems it should be fa93b45fd397.

Cheers.
> has to deal with carefully.
>
> This mitigation resolves the issue by acquiring the mmap read lock on
> init_mm on vmap page table free if a ptdump is in progress.
>
> However the fix in this series would cause a deadlock if we were to simply
> apply it for arm64 without also reverting the change.
>
> This is because vmap may acquire the read lock before ptdump attempts to
> acquire the write lock, which then gets queued, and rwsem starvation rules
> mean that the (unacknowledged) nested mmap read lock in the arm64 code
> would also block, meaning the original read lock is never released and thus
> deadlock.
>
> This series works around this by #ifndef CONFIG_ARM64'ing the mmap read
> lock in vmap logic, then partially reverting commit
> a93b45fd397 ("arm64: Enable vmalloc-huge with ptdump"), keeping the
> enablement of huge vmap support, and removing the ifdeffery with the
> partial revert patch.
>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
> Lorenzo Stoakes (2):
>       mm/vmalloc: acquire init_mm read lock on huge vmap promotion
>       Revert "arm64: Enable vmalloc-huge with ptdump"
>
>  arch/arm64/include/asm/ptdump.h |  2 --
>  arch/arm64/mm/mmu.c             | 43 ++++-------------------------------------
>  arch/arm64/mm/ptdump.c          | 11 ++---------
>  include/linux/mmap_lock.h       |  1 +
>  mm/pagewalk.c                   | 22 +++++++++++----------
>  mm/vmalloc.c                    | 41 ++++++++++++++++++++++++++++++---------
>  6 files changed, 51 insertions(+), 69 deletions(-)
> ---
> base-commit: a635d6748234582ea287c5ffeae28b9b23f91c7e
> change-id: 20260710-series-vmap-race-fix-2a4cac988938
>
> Cheers,
> --
> Lorenzo Stoakes <ljs@kernel.org>
>

