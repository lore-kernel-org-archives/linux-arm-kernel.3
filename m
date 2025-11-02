Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35242CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 17:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KII0rEuHP6zJPeVNRRcFfn+3TOvwgm31vtAZEVIz33k=; b=44aMib2l+sc81kBD54RB/+hszx
	cdkm3NRMrpNob0dKAhP73XfhhwcPEp179GF+U4YA0Khk/TH8F1lr9Ax8I2TZvVPNz/hrC05Ma9cK1
	3fIzOTjjPWezzjzTTFDwSwJq7Wwbvgx/VJKgGWDFbkpHmf/XkzT+PftXcATsYIhekFdquy6m4Aq43
	/MeMWHKP1MUVKCKeyhw8gIfqorzsAhY/MJW+6aAqQbD5BFB5xxWTzGsW61imyGPkIiCaneAAPYDK/
	ClbMJqLkXckI4ZZIkIdqzYJz3ltCBzICalOiTUdVwJIUZhSO4Wb6+QfGseYP1xD4q3XFEV//7g3Gw
	fjLbnEpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFcAd-00000008hyb-2b0F;
	Sun, 02 Nov 2025 17:47:15 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFcAa-00000008hyG-1wx0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 17:47:13 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-294f3105435so263885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 09:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762105631; x=1762710431; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KII0rEuHP6zJPeVNRRcFfn+3TOvwgm31vtAZEVIz33k=;
        b=IWDHV9atJzauuXrH/qn6F/KGpdyZ9JB57QhMl+UchC7M6lrSoKycFbaqoGzmvKwy3t
         g7pPSsw0wjacSDuMUWmL+0fdP/V3Q+8B5TuhRFAv6p94vMbT1WsNl2yZP2CiFYGNcOZp
         FRtjajJtGTPb4g+aJ8BxrNYEnpjVAJkt18wqGnYCHFJtHjimdJAZ5WMtni96MuBJbWsK
         lrjYSwHc7BD8gb3OU3/IB/+MsX4eJH2zlbwVsffkQozzDriVc5KTfad97VwZ4k195BqU
         qCl24+HhC6fdzdirwYuoVcQt6Ow3osltxuWuPm7ANA0LBGvy098bxM0hpAvAww2f1WZF
         FQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762105631; x=1762710431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KII0rEuHP6zJPeVNRRcFfn+3TOvwgm31vtAZEVIz33k=;
        b=g7VSY9MPgb7ENwK2SbI4tqMGbfiHJhwWlyv+L9LK58R7O9HwcSul3a/U3OP0W5PTvZ
         vEuYKMrB5g7pSCBhD6TjiR+V3cKvlmxK+4lHv7V8ywO1ZK/ACiUj1k3bxHOpDI4mPkH8
         uhrc6ODo7fT/VrBSRhJknWPA6ZEC296v/wMYuHa/903A3a+ad5PrdO9KyEsn79Emg5sh
         2NIB7Pp0rVIBO0zdf5q+Jv+NWFuu6xY0gb3YLXfnT1hhWWLEZJKTj3WU9KsjuiIqkwvT
         nOIc9dgdO7KdrmrGj8jcioKG1JHHye9sQG+mJUft8CHzzKTrXvjGCGG23jkVZ9irdsSG
         9FeA==
X-Forwarded-Encrypted: i=1; AJvYcCXLgzxxGaB7x0PGd12JKmLaZBjw0yObk5CgWdfl7AAltsqG0AShitwHrhRFEtZKCBhRj44AG4bKoHmUsEROfxV6@lists.infradead.org
X-Gm-Message-State: AOJu0YxGljuN1bFqt2kdalZYm6TDxa2CzxJNQi5K4DE4isEQmy4rlwrK
	4NugUZDjqiYkTCYrxj3JhE/m8eugVvqh1fecNySEKrroSEISnqBHYbWALmZU90M0bjtcGmiCwqZ
	mZcjLgF1e4qT2WjL2JC6Unbv5tHcjiJV0myP2mwqH
X-Gm-Gg: ASbGncvwJnhTElHFKD7+gwBP7TQv9dw3/3xSRRMa0EtNIoBgX3tAbyYpxvaXx8nz0bj
	NvDlYgND5RZ2cI3BNvQhhBmzdv2d0deofX+vyBimKIqZYAduvPKEdf1YEq0Z+Z/SyQ+a5u8KJHt
	dx+5hP9/iriak5AR/JhWv7uOf5nbeBya4dsc7O234wBc4yf999+MoEcdIK/TIZNXPEkFRkVt4qa
	GYQ76NaYovcjs3CGUKRUi6g3B2pl0UZtIxQN/5Wwd9pjN1SKHoC3e2LJpjUzoQvVmYtuoYc+w==
X-Google-Smtp-Source: AGHT+IGG9F1Er2bG5TSrr2OpZDZVkjQzcKICjNEJ9vHXeZ+mexJpGH0IchELhzuL7eByYOBhW4HmP9B4zELmb/dqhOw=
X-Received: by 2002:a17:903:1a70:b0:295:28a4:f0f5 with SMTP id
 d9443c01a7336-29556476c7amr4174515ad.5.1762105630545; Sun, 02 Nov 2025
 09:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <20250917190323.3828347-4-yang@os.amperecomputing.com> <f24b9032-0ec9-47b1-8b95-c0eeac7a31c5@roeck-us.net>
 <933a2eff-1e06-451e-9994-757d66f4b985@arm.com> <bee6b93d-aa2e-4335-9801-89f02eb3eccc@arm.com>
In-Reply-To: <bee6b93d-aa2e-4335-9801-89f02eb3eccc@arm.com>
From: Guenter Roeck <groeck@google.com>
Date: Sun, 2 Nov 2025 09:46:59 -0800
X-Gm-Features: AWmQ_bnMEz8GO9MzH233NO5db-z7Bmfbe6ztlqyQevDwzDO-wftIEZg07Dc86zc
Message-ID: <CABXOdTci3ftUD1Cn116mXMPUC4VhZx+6sK=GiH6q55YGPxfHAA@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] arm64: mm: support large block mapping when rodata=full
To: Ryan Roberts <linux@roeck-us.net>
Cc: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com, 
	ardb@kernel.org, dev.jain@arm.com, scott@os.amperecomputing.com, 
	cl@gentwo.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_094712_556128_FF129208 
X-CRM114-Status: GOOD (  53.96  )
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

On Sun, Nov 2, 2025 at 7:09=E2=80=AFAM Ryan Roberts <linux@roeck-us.net> wr=
ote:
>
> On 02/11/2025 10:31, Ryan Roberts wrote:
> > On 01/11/2025 16:14, Guenter Roeck wrote:
> >> Hi,
> >>
> >> On Wed, Sep 17, 2025 at 12:02:09PM -0700, Yang Shi wrote:
> >>> When rodata=3Dfull is specified, kernel linear mapping has to be mapp=
ed at
> >>> PTE level since large page table can't be split due to break-before-m=
ake
> >>> rule on ARM64.
> >>>
> >>> This resulted in a couple of problems:
> >>>   - performance degradation
> >>>   - more TLB pressure
> >>>   - memory waste for kernel page table
> >>>
> >>> With FEAT_BBM level 2 support, splitting large block page table to
> >>> smaller ones doesn't need to make the page table entry invalid anymor=
e.
> >>> This allows kernel split large block mapping on the fly.
> >>>
> >>> Add kernel page table split support and use large block mapping by
> >>> default when FEAT_BBM level 2 is supported for rodata=3Dfull.  When
> >>> changing permissions for kernel linear mapping, the page table will b=
e
> >>> split to smaller size.
> >>>
> >>> The machine without FEAT_BBM level 2 will fallback to have kernel lin=
ear
> >>> mapping PTE-mapped when rodata=3Dfull.
> >>>
> >>> With this we saw significant performance boost with some benchmarks a=
nd
> >>> much less memory consumption on my AmpereOne machine (192 cores, 1P)
> >>> with 256GB memory.
> >>>
> >>> * Memory use after boot
> >>> Before:
> >>> MemTotal:       258988984 kB
> >>> MemFree:        254821700 kB
> >>>
> >>> After:
> >>> MemTotal:       259505132 kB
> >>> MemFree:        255410264 kB
> >>>
> >>> Around 500MB more memory are free to use.  The larger the machine, th=
e
> >>> more memory saved.
> >>>
> >>> * Memcached
> >>> We saw performance degradation when running Memcached benchmark with
> >>> rodata=3Dfull vs rodata=3Don.  Our profiling pointed to kernel TLB pr=
essure.
> >>> With this patchset we saw ops/sec is increased by around 3.5%, P99
> >>> latency is reduced by around 9.6%.
> >>> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
> >>> MPKI is reduced by 28.5%.
> >>>
> >>> The benchmark data is now on par with rodata=3Don too.
> >>>
> >>> * Disk encryption (dm-crypt) benchmark
> >>> Ran fio benchmark with the below command on a 128G ramdisk (ext4) wit=
h
> >>> disk encryption (by dm-crypt).
> >>> fio --directory=3D/data --random_generator=3Dlfsr --norandommap      =
      \
> >>>     --randrepeat 1 --status-interval=3D999 --rw=3Dwrite --bs=3D4k --l=
oops=3D1  \
> >>>     --ioengine=3Dsync --iodepth=3D1 --numjobs=3D1 --fsync_on_close=3D=
1         \
> >>>     --group_reporting --thread --name=3Diops-test-job --eta-newline=
=3D1    \
> >>>     --size 100G
> >>>
> >>> The IOPS is increased by 90% - 150% (the variance is high, but the wo=
rst
> >>> number of good case is around 90% more than the best number of bad
> >>> case). The bandwidth is increased and the avg clat is reduced
> >>> proportionally.
> >>>
> >>> * Sequential file read
> >>> Read 100G file sequentially on XFS (xfs_io read with page cache
> >>> populated). The bandwidth is increased by 150%.
> >>>
> >>
> >> With lock debugging enabled, we see a large number of "BUG: sleeping
> >> function called from invalid context at kernel/locking/mutex.c:580"
> >> and "BUG: Invalid wait context:" backtraces when running v6.18-rc3.
> >> Please see example below.
> >>
> >> Bisect points to this patch.
> >>
> >> Please let me know if there is anything I can do to help tracking
> >> down the problem.
> >
> > Thanks for the report - ouch!
> >
> > I expect you're running on a system that supports BBML2_NOABORT, based =
on the
> > stack trace, I expect you have CONFIG_DEBUG_PAGEALLOC enabled? That wil=
l cause
> > permission tricks to be played on the linear map at page allocation and=
 free
> > time, which can happen in non-sleepable contexts. And with this patch w=
e are
> > taking pgtable_split_lock (a mutex) in split_kernel_leaf_mapping(), whi=
ch is
> > called as a result of the permission change request.
> >
> > However, when CONFIG_DEBUG_PAGEALLOC enabled we always force-map the li=
near map
> > by PTE so split_kernel_leaf_mapping() is actually unneccessary and will=
 return
> > without actually having to split anything. So we could add an early "if
> > (force_pte_mapping()) return 0;" to bypass the function entirely in thi=
s case,
> > and I *think* that should solve it.
> >
> > But I'm also concerned about KFENCE. I can't remember it's exact semant=
ics off
> > the top of my head, so I'm concerned we could see similar problems ther=
e (where
> > we only force pte mapping for the KFENCE pool).
> >
> > I'll investigate fully tomorrow and hopefully provide a fix.
>
> Here's a proposed fix, although I can't get access to a system with BBML2=
 until
> tomorrow at the earliest. Guenter, I wonder if you could check that this
> resolves your issue?
>
> ---8<---
> commit 602ec2db74e5abfb058bd03934475ead8558eb72
> Author: Ryan Roberts <ryan.roberts@arm.com>
> Date:   Sun Nov 2 11:45:18 2025 +0000
>
>     arm64: mm: Don't attempt to split known pte-mapped regions
>
>     It has been reported that split_kernel_leaf_mapping() is trying to sl=
eep
>     in non-sleepable context. It does this when acquiring the
>     pgtable_split_lock mutex, when either CONFIG_DEBUG_ALLOC or
>     CONFIG_KFENCE are enabled, which change linear map permissions within
>     softirq context during memory allocation and/or freeing.
>
>     But it turns out that the memory for which these features may attempt=
 to
>     modify the permissions is always mapped by pte, so there is no need t=
o
>     attempt to split the mapping. So let's exit early in these cases and
>     avoid attempting to take the mutex.
>
>     Closes: https://lore.kernel.org/all/f24b9032-0ec9-47b1-8b95-c0eeac7a3=
1c5@roeck-us.net/
>     Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rod=
ata=3Dfull")
>     Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index b8d37eb037fc..6e26f070bb49 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -708,6 +708,16 @@ static int split_kernel_leaf_mapping_locked(unsigned=
 long addr)
>         return ret;
>  }
>
> +static inline bool force_pte_mapping(void)
> +{
> +       bool bbml2 =3D system_capabilities_finalized() ?
> +               system_supports_bbml2_noabort() : cpu_supports_bbml2_noab=
ort();
> +
> +       return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map=
() ||
> +                          is_realm_world())) ||
> +               debug_pagealloc_enabled();
> +}
> +
>  static DEFINE_MUTEX(pgtable_split_lock);
>
>  int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
> @@ -723,6 +733,16 @@ int split_kernel_leaf_mapping(unsigned long start, u=
nsigned long end)
>         if (!system_supports_bbml2_noabort())
>                 return 0;
>
> +       /*
> +        * If the region is within a pte-mapped area, there is no need to=
 try to
> +        * split. Additionally, CONFIG_DEBUG_ALLOC and CONFIG_KFENCE may =
change
> +        * permissions from softirq context so for those cases (which are=
 always
> +        * pte-mapped), we must not go any further because taking the mut=
ex
> +        * below may sleep.
> +        */
> +       if (force_pte_mapping() || is_kfence_address((void *)start))
> +               return 0;
> +
>         /*
>          * Ensure start and end are at least page-aligned since this is t=
he
>          * finest granularity we can split to.
> @@ -1009,16 +1029,6 @@ static inline void arm64_kfence_map_pool(phys_addr=
_t kfence_pool, pgd_t *pgdp) {
>
>  #endif /* CONFIG_KFENCE */
>
> -static inline bool force_pte_mapping(void)
> -{
> -       bool bbml2 =3D system_capabilities_finalized() ?
> -               system_supports_bbml2_noabort() : cpu_supports_bbml2_noab=
ort();
> -
> -       return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map=
() ||
> -                          is_realm_world())) ||
> -               debug_pagealloc_enabled();
> -}
> -
>  static void __init map_mem(pgd_t *pgdp)
>  {
>         static const u64 direct_map_end =3D _PAGE_END(VA_BITS_MIN);
> ---8<---
>
> Thanks,
> Ryan
>
> >
> > Yang Shi, Do you have any additional thoughts?
> >
> > Thanks,
> > Ryan
> >
> >>
> >> Thanks,
> >> Guenter
> >>
> >> ---
> >> Example log:
> >>
> >> [    0.537499] BUG: sleeping function called from invalid context at k=
ernel/locking/mutex.c:580
> >> [    0.537501] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: =
1, name: swapper/0
> >> [    0.537502] preempt_count: 1, expected: 0
> >> [    0.537504] 2 locks held by swapper/0/1:
> >> [    0.537505]  #0: ffffb60b01211960 (sched_domains_mutex){+.+.}-{4:4}=
, at: sched_domains_mutex_lock+0x24/0x38
> >> [    0.537510]  #1: ffffb60b01595838 (rcu_read_lock){....}-{1:3}, at: =
rcu_lock_acquire+0x0/0x40
> >> [    0.537516] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0=
-dbg-DEV #1 NONE
> >> [    0.537517] Call trace:
> >> [    0.537518]  show_stack+0x20/0x38 (C)
> >> [    0.537520]  __dump_stack+0x28/0x38
> >> [    0.537522]  dump_stack_lvl+0xac/0xf0
> >> [    0.537525]  dump_stack+0x18/0x3c
> >> [    0.537527]  __might_resched+0x248/0x2a0
> >> [    0.537529]  __might_sleep+0x40/0x90
> >> [    0.537531]  __mutex_lock_common+0x70/0x1818
> >> [    0.537533]  mutex_lock_nested+0x34/0x48
> >> [    0.537534]  split_kernel_leaf_mapping+0x74/0x1a0
> >> [    0.537536]  update_range_prot+0x40/0x150
> >> [    0.537537]  __change_memory_common+0x30/0x148
> >> [    0.537538]  __kernel_map_pages+0x70/0x88
> >> [    0.537540]  __free_frozen_pages+0x6e4/0x7b8
> >> [    0.537542]  free_frozen_pages+0x1c/0x30
> >> [    0.537544]  __free_slab+0xf0/0x168
> >> [    0.537547]  free_slab+0x2c/0xf8
> >> [    0.537549]  free_to_partial_list+0x4e0/0x620
> >> [    0.537551]  __slab_free+0x228/0x250
> >> [    0.537553]  kfree+0x3c4/0x4c0
> >> [    0.537555]  destroy_sched_domain+0xf8/0x140
> >> [    0.537557]  cpu_attach_domain+0x17c/0x610
> >> [    0.537558]  build_sched_domains+0x15a4/0x1718
> >> [    0.537560]  sched_init_domains+0xbc/0xf8
> >> [    0.537561]  sched_init_smp+0x30/0x98
> >> [    0.537562]  kernel_init_freeable+0x148/0x230
> >> [    0.537564]  kernel_init+0x28/0x148
> >> [    0.537566]  ret_from_fork+0x10/0x20
> >> [    0.537569] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> [    0.537569] [ BUG: Invalid wait context ]
> >> [    0.537571] 6.18.0-dbg-DEV #1 Tainted: G        W
> >> [    0.537572] -----------------------------
> >> [    0.537572] swapper/0/1 is trying to lock:
> >> [    0.537573] ffffb60b011f3830 (pgtable_split_lock){+.+.}-{4:4}, at: =
split_kernel_leaf_mapping+0x74/0x1a0
> >> [    0.537576] other info that might help us debug this:
> >> [    0.537577] context-{5:5}
> >> [    0.537578] 2 locks held by swapper/0/1:
> >> [    0.537579]  #0: ffffb60b01211960 (sched_domains_mutex){+.+.}-{4:4}=
, at: sched_domains_mutex_lock+0x24/0x38
> >> [    0.537582]  #1: ffffb60b01595838 (rcu_read_lock){....}-{1:3}, at: =
rcu_lock_acquire+0x0/0x40
> >> [    0.537585] stack backtrace:
> >> [    0.537585] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        =
W           6.18.0-dbg-DEV #1 NONE
> >> [    0.537587] Tainted: [W]=3DWARN
> >> [    0.537588] Call trace:
> >> [    0.537589]  show_stack+0x20/0x38 (C)
> >> [    0.537591]  __dump_stack+0x28/0x38
> >> [    0.537593]  dump_stack_lvl+0xac/0xf0
> >> [    0.537596]  dump_stack+0x18/0x3c
> >> [    0.537598]  __lock_acquire+0x980/0x2a20
> >> [    0.537600]  lock_acquire+0x124/0x2b8
> >> [    0.537602]  __mutex_lock_common+0xd8/0x1818
> >> [    0.537604]  mutex_lock_nested+0x34/0x48
> >> [    0.537605]  split_kernel_leaf_mapping+0x74/0x1a0
> >> [    0.537607]  update_range_prot+0x40/0x150
> >> [    0.537608]  __change_memory_common+0x30/0x148
> >> [    0.537609]  __kernel_map_pages+0x70/0x88
> >> [    0.537610]  __free_frozen_pages+0x6e4/0x7b8
> >> [    0.537613]  free_frozen_pages+0x1c/0x30
> >> [    0.537615]  __free_slab+0xf0/0x168
> >> [    0.537617]  free_slab+0x2c/0xf8
> >> [    0.537619]  free_to_partial_list+0x4e0/0x620
> >> [    0.537621]  __slab_free+0x228/0x250
> >> [    0.537623]  kfree+0x3c4/0x4c0
> >> [    0.537625]  destroy_sched_domain+0xf8/0x140
> >> [    0.537627]  cpu_attach_domain+0x17c/0x610
> >> [    0.537628]  build_sched_domains+0x15a4/0x1718
> >> [    0.537630]  sched_init_domains+0xbc/0xf8
> >> [    0.537631]  sched_init_smp+0x30/0x98
> >> [    0.537632]  kernel_init_freeable+0x148/0x230
> >> [    0.537633]  kernel_init+0x28/0x148
> >> [    0.537635]  ret_from_fork+0x10/0x20
> >>
> >> ---
> >> bisect:
> >>
> >> # bad: [3a8660878839faadb4f1a6dd72c3179c1df56787] Linux 6.18-rc1
> >> # good: [e5f0a698b34ed76002dc5cff3804a61c80233a7a] Linux 6.17
> >> git bisect start 'v6.18-rc1' 'v6.17'
> >> # bad: [58809f614e0e3f4e12b489bddf680bfeb31c0a20] Merge tag 'drm-next-=
2025-10-01' of https://gitlab.freedesktop.org/drm/kernel
> >> git bisect bad 58809f614e0e3f4e12b489bddf680bfeb31c0a20
> >> # bad: [a8253f807760e9c80eada9e5354e1240ccf325f9] Merge tag 'soc-newso=
c-6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> >> git bisect bad a8253f807760e9c80eada9e5354e1240ccf325f9
> >> # bad: [4b81e2eb9e4db8f6094c077d0c8b27c264901c1b] Merge tag 'timers-vd=
so-2025-09-29' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> >> git bisect bad 4b81e2eb9e4db8f6094c077d0c8b27c264901c1b
> >> # bad: [f1004b2f19d7e9add9d707f64d9fcbc50f67921b] Merge tag 'm68k-for-=
v6.18-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m6=
8k
> >> git bisect bad f1004b2f19d7e9add9d707f64d9fcbc50f67921b
> >> # good: [a9401710a5f5681abd2a6f21f9e76bc9f2e81891] Merge tag 'v6.18-rc=
-part1-smb3-common' of git://git.samba.org/ksmbd
> >> git bisect good a9401710a5f5681abd2a6f21f9e76bc9f2e81891
> >> # good: [fe68bb2861808ed5c48d399bd7e670ab76829d55] Merge tag 'microbla=
ze-v6.18' of git://git.monstr.eu/linux-2.6-microblaze
> >> git bisect good fe68bb2861808ed5c48d399bd7e670ab76829d55
> >> # bad: [f2d64a22faeeecff385b4c91fab5fe036ab00162] Merge branch 'for-ne=
xt/perf' into for-next/core
> >> git bisect bad f2d64a22faeeecff385b4c91fab5fe036ab00162
> >> # good: [30f9386820cddbba59b48ae0670c3a1646dd440e] Merge branch 'for-n=
ext/misc' into for-next/core
> >> git bisect good 30f9386820cddbba59b48ae0670c3a1646dd440e
> >> # good: [43de0ac332b815cf56dbdce63687de9acfd35d49] drivers/perf: hisi:=
 Relax the event ID check in the framework
> >> git bisect good 43de0ac332b815cf56dbdce63687de9acfd35d49
> >> # good: [5973a62efa34c80c9a4e5eac1fca6f6209b902af] arm64: map [_text, =
_stext) virtual address range non-executable+read-only
> >> git bisect good 5973a62efa34c80c9a4e5eac1fca6f6209b902af
> >> # good: [b3abb08d6f628a76c36bf7da9508e1a67bf186a0] drivers/perf: hisi:=
 Refactor the event configuration of L3C PMU
> >> git bisect good b3abb08d6f628a76c36bf7da9508e1a67bf186a0
> >> # good: [6d2f913fda5683fbd4c3580262e10386c1263dfb] Documentation: hisi=
-pmu: Add introduction to HiSilicon V3 PMU
> >> git bisect good 6d2f913fda5683fbd4c3580262e10386c1263dfb
> >> # good: [2084660ad288c998b6f0c885e266deb364f65fba] perf/dwc_pcie: Fix =
use of uninitialized variable
> >> git bisect good 2084660ad288c998b6f0c885e266deb364f65fba
> >> # bad: [77dfca70baefcb988318a72fe69eb99f6dabbbb1] Merge branch 'for-ne=
xt/mm' into for-next/core
> >> git bisect bad 77dfca70baefcb988318a72fe69eb99f6dabbbb1
> >> # first bad commit: [77dfca70baefcb988318a72fe69eb99f6dabbbb1] Merge b=
ranch 'for-next/mm' into for-next/core
> >>
> >> ---
> >> bisect into branch:
> >>
> >> - git checkout -b testing 77dfca70baefcb988318a72fe69eb99f6dabbbb1
> >> - git rebase 77dfca70baefcb988318a72fe69eb99f6dabbbb1~1
> >>   [ fix minor conflict similar to the conflict resolution in 77dfca70b=
aefc]
> >> - git diff 77dfca70baefcb988318a72fe69eb99f6dabbbb1
> >>   [ confirmed that there are no differences ]
> >> - confirm that the problem is still seen at the tip of the rebase
> >> - git bisect start HEAD 77dfca70baefcb988318a72fe69eb99f6dabbbb1~1
> >> - run bisect
> >>
> >> Results:
> >>
> >> # bad: [47fc25df1ae3ae8412f1b812fb586c714d04a5e6] arm64: map [_text, _=
stext) virtual address range non-executable+read-only
> >> # good: [30f9386820cddbba59b48ae0670c3a1646dd440e] Merge branch 'for-n=
ext/misc' into for-next/core
> >> git bisect start 'HEAD' '77dfca70baefcb988318a72fe69eb99f6dabbbb1~1'
> >> # good: [805491d19fc21271b5c27f4602f8f66b625c110f] arm64/Kconfig: Remo=
ve CONFIG_RODATA_FULL_DEFAULT_ENABLED
> >> git bisect good 805491d19fc21271b5c27f4602f8f66b625c110f
> >> # bad: [13c7d7426232cc4489df7cd2e1f646a22d3f6172] arm64: mm: support l=
arge block mapping when rodata=3Dfull
> >> git bisect bad 13c7d7426232cc4489df7cd2e1f646a22d3f6172
> >> # good: [a4d9c67e503f2b73c2d89d8e8209dfd241bdc8d8] arm64: Enable permi=
ssion change on arm64 kernel block mappings
> >> git bisect good a4d9c67e503f2b73c2d89d8e8209dfd241bdc8d8
> >> # first bad commit: [13c7d7426232cc4489df7cd2e1f646a22d3f6172] arm64: =
mm: support large block mapping when rodata=3Dfull
> >
>

