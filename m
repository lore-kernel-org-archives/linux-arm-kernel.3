Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5B3C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+akt4Dp6cmOPFSL8kMH30g7Rp+2DiyUojQn0D3oWqI=; b=WLa2Hkcrx7dOFVyPRwb5nCzuNa
	a5wWzznibmel+tgjYQWFqLJEOUGhmQ4AYB9zw0bkG9UsQVlwgPjRBW2nUzBuxM5ukKAziqn6Mnj9M
	tBXufRTh7C++oB/ukm5OqNO34T/qmt8gQ5YxchRB6YwIPLrSx+KfIelCiMwaw/sEok3JfXb5YTod2
	nQzLw0tkb63pWjDvzvTK4QUI/Cs3XusZlF1LDRfPpvcG0TpAHJORs6QsCVaJN6TjUmlbNnVACVxzj
	zVCOVsaEhuO985DaAocQwCqBDxJcNgkwEybGOqZ8X8lnzzW3EEEHbyipVlzYzix0to/KkCVp4INoR
	QTeoEugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOJk-0000000AcDT-3Jia;
	Tue, 03 Jun 2025 09:52:24 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOHY-0000000AbZE-2XDg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:50:09 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-87dfe906a87so1407776241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 02:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748944207; x=1749549007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+akt4Dp6cmOPFSL8kMH30g7Rp+2DiyUojQn0D3oWqI=;
        b=mV1erddsNgSldWMhRL3LbCQ3TEsddmZmaU6TjASaLywcTG1nseAjDXsN8ftMbGE1ND
         185U0tnF0eH4rjqL75ANy20pzailn3AfRhMko8V2KM2luHw7qm7s16d3uDG73RiRvHXg
         ZZnVm4tZPdXlWR2FhjnaPXhp0tojXIofqhFq/1Vs0d7V3HagpDmQbN9yalqVMlcskgy9
         vO/7vx5PniOrN7IuXEKH8X4gk6M+mHn3cW75bnWK/Y4HSvlBufP1g/Ic8VDwj0eWxzNT
         97nkE7Huw8KZOCK7I7Rib85vXVx7d4wrEyJQiygT6/uYBBYHs6xWi0giFqDM/TBCuzpC
         nbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748944207; x=1749549007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+akt4Dp6cmOPFSL8kMH30g7Rp+2DiyUojQn0D3oWqI=;
        b=iLtE/cBIblisYZYem/bQ1pCSofOHCY53VOWoS1xwNtookvRth/LLW72mlqI6UV6C3s
         FmwBdbvgXooUNR6+kmjyKzn0uqaXXfOFi3sD6KL0Q8bS9mxzB7lYnVnU7VtEpxZjVyjh
         rAxLWDsc+C32cJAjrTZz38s5j5r/JfXwfd1xSF+69zh0Woz/yKyvWUzOGn7AonUBEViT
         o+IfMjTIKPu8V9qzhGNLj3qETclTMp4IwfOJxzxzR4cUhxpWiCbj1cz1mG9Rrr9g3UCU
         LxrLeD30zMNh7Auh+dQOQ73yZEVWLVCGOe+drstmGuv27Bne9Zc/NrnPQ84eGPeLr/8p
         KFMg==
X-Forwarded-Encrypted: i=1; AJvYcCU1co7nysS0kLNbRWvpGlrnp0AH8ek6JEbGcrTX/3ilfnMYBbb68coi5m95ViCgPTOjxco7sO6y2VLGFaBneuNR@lists.infradead.org
X-Gm-Message-State: AOJu0YzxDnHYgPcI0LHO4d7On5qST7kXaiZG16TzKGlc/GZNnDyDR5tG
	Fg4nKYVaPT6fXzj6c3sJGl/xKT083ufOc/995oH9uEi2HaUKFrnsmf3tc0wkqAjEfBoUUPsy5pb
	eenq6AEXD8Ol1nLUGapbVMCBhzCgek6w=
X-Gm-Gg: ASbGncvzjWj8A5UbZhQrQI8kG1S6FZI5JRFG9bj8r3KbKwbpA4aEvLhKO+XgSSqZMsq
	lsJygcT2l/la6LE7SMSO4fqg6kW44HUoavPHfMYJvjAQBNY5eleiNOT5s2Y56oz3cIz0fkx/kgE
	HI6ny3dPFAdEFS9LUd0lC8qQhjVaw9dzgX6TSbmljMPNCq
X-Google-Smtp-Source: AGHT+IGdphO3eSjpshfA1ahQtVxmSC0SjGRr0bfVfc6RhBBzixX2doriuCFFelSDmFBYmpd4w0OdVdQjoqLM/q838Cg=
X-Received: by 2002:a05:6102:3a0b:b0:4e5:a398:b6fa with SMTP id
 ada2fe7eead31-4e6ecd2e74fmr12727388137.3.1748944207155; Tue, 03 Jun 2025
 02:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
In-Reply-To: <20250530152445.2430295-1-ryan.roberts@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 3 Jun 2025 21:49:55 +1200
X-Gm-Features: AX0GCFvnuBi9XQmk2yPV4q8ADSSK-euG69kT8A6SLKTtKahFIzprIUZvZjsk9F8
Message-ID: <CAGsJ_4wfhA6C2dV+a=dnx=EKRmrt80ujrh6KrepJ_P8JqCbPnw@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry
 remains valid
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_025008_667503_A01D2786 
X-CRM114-Status: GOOD (  36.63  )
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

On Sat, May 31, 2025 at 3:24=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
>
> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
> a parallel reclaim leaving stale TLB entries") describes a race that,
> prior to the commit, could occur between reclaim and operations such as
> mprotect() when using reclaim's tlbbatch mechanism. See that commit for
> details but the summary is:
>
> """
> Nadav Amit identified a theoritical race between page reclaim and
> mprotect due to TLB flushes being batched outside of the PTL being held.
>
> He described the race as follows:
>
>         CPU0                            CPU1
>         ----                            ----
>                                         user accesses memory using RW PTE
>                                         [PTE now cached in TLB]
>         try_to_unmap_one()
>         =3D=3D> ptep_get_and_clear()
>         =3D=3D> set_tlb_ubc_flush_pending()
>                                         mprotect(addr, PROT_READ)
>                                         =3D=3D> change_pte_range()
>                                         =3D=3D> [ PTE non-present - no fl=
ush ]
>
>                                         user writes using cached RW PTE
>         ...
>
>         try_to_unmap_flush()
> """
>
> The solution was to insert flush_tlb_batched_pending() in mprotect() and
> friends to explcitly drain any pending reclaim TLB flushes. In the
> modern version of this solution, arch_flush_tlb_batched_pending() is
> called to do that synchronisation.
>
> arm64's tlbbatch implementation simply issues TLBIs at queue-time
> (arch_tlbbatch_add_pending()), eliding the trailing dsb(ish). The
> trailing dsb(ish) is finally issued in arch_tlbbatch_flush() at the end
> of the batch to wait for all the issued TLBIs to complete.
>
> Now, the Arm ARM states:
>
> """
> The completion of the TLB maintenance instruction is guaranteed only by
> the execution of a DSB by the observer that performed the TLB
> maintenance instruction. The execution of a DSB by a different observer
> does not have this effect, even if the DSB is known to be executed after
> the TLB maintenance instruction is observed by that different observer.
> """
>
> arch_tlbbatch_add_pending() and arch_tlbbatch_flush() conform to this
> requirement because they are called from the same task (either kswapd or
> caller of madvise(MADV_PAGEOUT)), so either they are on the same CPU or
> if the task was migrated, __switch_to() contains an extra dsb(ish).
>
> HOWEVER, arm64's arch_flush_tlb_batched_pending() is also implemented as
> a dsb(ish). But this may be running on a CPU remote from the one that
> issued the outstanding TLBIs. So there is no architectural gurantee of
> synchonization. Therefore we are still vulnerable to the theoretical
> race described in Commit 3ea277194daa ("mm, mprotect: flush TLB if
> potentially racing with a parallel reclaim leaving stale TLB entries").

Hi Ryan,

Sorry for bringing up another question late, but your explanation made me
reconsider whether I might also be wrong in arch_tlbbatch_flush(). Specific=
ally,
try_to_unmap_flush() needs to ensure that all TLBI operations from other CP=
Us
for all involved memory contexts have completed. However, as you pointed
out, a DSB ISH alone cannot guarantee this.

This makes me wonder if we should take inspiration from RISC-V or x86 and u=
se a
cpumask to track all CPUs that have pending TLBIs. Then, we could use IPIs =
to
explicitly request those CPUs to issue DSB ISH, ensuring their TLB
invalidations are fully completed.

I mean something similar to what x86 and RISC-V do, but using just a
simpler approach like issuing DSB ISH on the relevant CPUs.

void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
{
        on_each_cpu_mask(&batch->cpumask, __ipi_flush_tlbi, NULL, NULL);
        cpumask_clear(&batch->cpumask);
}

static void __ipi_flush_tlbi(void *info)
{
        dsb(ish);
}

Sorry for the mess I made earlier.

>
> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending().
> This aligns with what the other arches that implement the tlbbatch
> feature do.
>
> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown durin=
g page reclamation/migration")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/t=
lbflush.h
> index eba1a98657f1..7d564c2a126f 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -323,13 +323,14 @@ static inline bool arch_tlbbatch_should_defer(struc=
t mm_struct *mm)
>  }
>
>  /*
> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
> - * synchronise all the TLBI issued with a DSB to avoid the race mentione=
d in
> - * flush_tlb_batched_pending().
> + * If mprotect/munmap/etc occurs during TLB batched flushing, we need to=
 ensure
> + * all the previously issued TLBIs targeting mm have completed. But sinc=
e we
> + * can be executing on a remote CPU, a DSB cannot guarrantee this like i=
t can
> + * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
>   */
>  static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>  {
> -       dsb(ish);
> +       flush_tlb_mm(mm);
>  }
>
>  /*
> --
> 2.43.0
>

Thanks
Barry

