Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCA5D59F6D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 07:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ot7CTaOEn9MEJkbjFKG93I03AklZCblxqt7tGVu1gvM=; b=qpVq/OqiaDLiQnvBi5Mz8H3QKD
	Z/m+qnzAyuNh8PltO3exir5vBKRtNqYkNseoFofDnBIWfz+qTVk3hjM1JDmFniHoK/dQQNIKlck5b
	NxoZYb+Hi6E9feiCtksyjy8DCSS122dUp9T64DfjKW1kZtjJrllo2JKdZSDR0ZLzU02/FJkEpSjL3
	/z7jyyfa/mUgA98zCCYr6nXFKE7DVRlukUih/U/pVu0MDL7Qh30Wos3WlWYbY7osLbPJyYczhp00s
	65JAry7nU+bsxFLVkV30FCvEQc12nkSINwkTR73FmO8B9RbEQHvghV/xzK5qxCFKsZi+PjuGaVo0m
	WVLTxcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUJhM-00000001U1v-1lLK;
	Sat, 13 Dec 2025 07:05:48 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUJhI-00000001U14-1o49
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 07:05:45 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59434b28624so20474e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 23:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765609539; cv=none;
        d=google.com; s=arc-20240605;
        b=kn1mxfmumGunW6UHlDhPsYjiO6Q7oqnpqzK5IRuq/wS6YbWHUlCgUL4BxsqVrnPtfs
         VpkbB2SvOXCcfECUDCnQwVnod6N8ySDMXWM9+VuvoOD3nnIvocMK4H1gR9ayDqwru+bO
         sjGZLbZNhg6S/baz5MSh9VGLZWyMP8OktR5FaaPE9rBXEMulDIx0RcTYV0TJueZYex62
         7uMDuwmZf3b3vNTYX4qiTsNHorWroaV+h14xAWuavBpkDxKXJ/vD9RlpveclhdFfdv3X
         rMoy3OurQyuXs6G2rtPMv0mKFHrpdzq91GIBsOXBT2VwsYpgHtom/HcZe3jThxpTQaKT
         YIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ot7CTaOEn9MEJkbjFKG93I03AklZCblxqt7tGVu1gvM=;
        fh=KhDFHFmdayrhEXcavmL9yg7C9T+Nosvn0nALkJBnQs8=;
        b=Fgit6/z7u+snnMKaA8yMSYIbi39BB9UiErolj9OL8Ah2IBaIXGDiWGtdeGXs+Ub3gJ
         bgFZTd86zbqGPqnZ82WVyu2fqgj2Ke/or0tSbYt3+vMbsIcygX2OhHasZBosjahtR16i
         GoD9Za4mpt3f9KFddco/ZZlv9/oJ6xhHn3jDE+XGvR3HIJikyLzpY9I+nYXjN+jUIm9r
         jtMblPyjcyl0AsQBd6S37P5NAB1E/L+XqwiZo+Kg0tnzCojDGSBX41e1/oa7bhsKgK3H
         pAakNLzdfSvODeae4KuBs3O7zfS8Ln5NCjD4s98fuaNMDc68P572e1YMZY0ej5FUXrmE
         q95g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765609539; x=1766214339; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ot7CTaOEn9MEJkbjFKG93I03AklZCblxqt7tGVu1gvM=;
        b=M8WXMRXFucLO32z7ZPZLi/w20iukbAYt5Bd2LXbYB5QW7sxi9BLJ+fyAmK+peckAj6
         lupTq2pm8yJr7BQxDad0NrC7e5MBtSTfuyJ68juOJ3TKXPyNvsCJE1S/xBPLgpyLzgw3
         se8YYzxswoyXtNODKOCGGnDIeKlpolWfixHc1LrUKG8AsQejEQvHozXmbHPxlYd4A1FE
         Mza/hsxiWc85w9w50tZCyrELKtoWdxBs3GG3ArCuIRoFUogbtKKMkKFEdovL3PlNxjLj
         jSmQ27rKQBmEFW3dz4DK2Z5SUy4m8DPLgl/Rh8lDNs66c0horuL9OjOO4paQ0h9Qoh5T
         7xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765609539; x=1766214339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ot7CTaOEn9MEJkbjFKG93I03AklZCblxqt7tGVu1gvM=;
        b=GSI3sozVItaa+4pB8toOInJZHsD2PyFDHbl4bwznwsMc+RxIw+spcPrYWp527UGBFk
         PO2KjKrJXxMhy0gr7uVQh8JdfgHlZJ7jki5n9fQ+EWAyRJonesa19x9mEeiRQUKCPVJP
         Po19yjaUupcaMBS8uUsTwQo7oUL46pAcaDPrFBnhdIYaZ8klMZgfT52UPUx9nwwtsOIO
         +HUKRZRZLTa3H1uY2yFz65vj9Zl9FNTbZj7TiP1mA3FsydP6aO1re5h/YlCP9egOJHOD
         Ts98Iyn8oM6EWM2dC1tT/LtpLklslHP/OV6X5peuVg0iH+gHQI+aGRYw1E8iZJv2suhZ
         15aA==
X-Forwarded-Encrypted: i=1; AJvYcCVLpgIQMR7ksvCi6rxfyF7XLNuHWqPVOvqpf+XG7YXbfNEg7panLN3gwAlI2T/UUgO/LJRgVdhNDXW39o9I44+t@lists.infradead.org
X-Gm-Message-State: AOJu0YzJR8dbP1HUKxq+zr8VxuzF+EzqlGYfMmlEZpRklpgklFl+11iq
	dckqGhcbg5SJVH9nb5LQkU4KRX43mDO7CAUTahjg8VWBDuc+we6QX2yoC08neW5nUHvY09SNzlU
	d7jw9LNLPN/q12IEMS8gdbFfI3FpbYqcaB4fXprns
X-Gm-Gg: AY/fxX73X7ser32jSh0bjOUo/6YVvTO1wbPA6QVVrkDyMDBcSNuquFLpIlvPq9amgdD
	Y+pPRXh7XbWjHWzWEQvgJebvB7CsZxlJ/jt04vK1/XMPgklv9EBpGAJLfeVBlwEbigv34Qr1r2+
	zo9l/xI0A7yJOTZipYS4lKoEWYzXd01G6Ltp5Qkx7BRZYqD55V4gz0/rBl3E4QoQDwkkIC3hGBm
	0MxQ1q3c+GmWDtGtI9ic2JxzYmCKU3ikEiD60/yXAWPIKnNKErSRfMSkgjsZMEbQIXkedGy
X-Google-Smtp-Source: AGHT+IFxhjah2N2uFy306dItOjP0R93hkCDyo1Kn++vNhOwiYTt8khSjxmS7193oFeZUUiU7KewI20Oqx5FGrhIwBmA=
X-Received: by 2002:ac2:5de3:0:b0:594:43e1:ed43 with SMTP id
 2adb3069b0e04-598fe1eb38cmr60101e87.2.1765609539221; Fri, 12 Dec 2025
 23:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20251212161832.2067134-1-yeoreum.yun@arm.com> <20251212161832.2067134-3-yeoreum.yun@arm.com>
In-Reply-To: <20251212161832.2067134-3-yeoreum.yun@arm.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Sat, 13 Dec 2025 16:05:20 +0900
X-Gm-Features: AQt7F2rPm7R-wCwVHPTjXe_bQj-qNecTeNkHkP5H4J7QvG1ylb2YhWsPANW--u8
Message-ID: <CA+i-1C2e7QNTy5u=HF7tLsLXLq4xYbMTCbNjWGAxHz4uwgR05g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: mmu: use pagetable_alloc_nolock() while stop_machine()
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, hannes@cmpxchg.org, 
	ziy@nvidia.com, bigeasy@linutronix.de, clrkwllms@kernel.org, 
	rostedt@goodmis.org, catalin.marinas@arm.com, will@kernel.org, 
	ryan.roberts@arm.com, kevin.brodsky@arm.com, dev.jain@arm.com, 
	yang@os.amperecomputing.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_230544_522135_9191B15C 
X-CRM114-Status: GOOD (  22.61  )
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

On Sat, 13 Dec 2025 at 01:18, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
> linear_map_split_to_ptes() and __kpti_install_ng_mappings()
> are called as callback of stop_machine().
> That means these functions context are preemption disabled.
>
> Unfortunately, under PREEMPT_RT, the pagetable_alloc() or
> __get_free_pages() couldn't be called in this context
> since spin lock that becomes sleepable on RT,
> potentially causing a sleep during page allocation.
>
> To address this, pagetable_alloc_nolock().
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/mm/mmu.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 2ba01dc8ef82..0e98606d8c4c 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -475,10 +475,15 @@ static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>  static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
>                                        enum pgtable_type pgtable_type)
>  {
> -       /* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
> -       struct ptdesc *ptdesc = pagetable_alloc(gfp & ~__GFP_ZERO, 0);
> +       struct ptdesc *ptdesc;
>         phys_addr_t pa;
>
> +       /* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
> +       if (gfpflags_allow_spinning(gfp))
> +               ptdesc  = pagetable_alloc(gfp & ~__GFP_ZERO, 0);
> +       else
> +               ptdesc  = pagetable_alloc_nolock(gfp & ~__GFP_ZERO, 0);
> +
>         if (!ptdesc)
>                 return INVALID_PHYS_ADDR;
>
> @@ -869,6 +874,7 @@ static int __init linear_map_split_to_ptes(void *__unused)
>                 unsigned long kstart = (unsigned long)lm_alias(_stext);
>                 unsigned long kend = (unsigned long)lm_alias(__init_begin);
>                 int ret;
> +               gfp_t gfp = IS_ENABLED(CONFIG_PREEMPT_RT) ? __GFP_HIGH : GFP_ATOMIC;
>
>                 /*
>                  * Wait for all secondary CPUs to be put into the waiting area.
> @@ -881,9 +887,9 @@ static int __init linear_map_split_to_ptes(void *__unused)
>                  * PTE. The kernel alias remains static throughout runtime so
>                  * can continue to be safely mapped with large mappings.
>                  */
> -               ret = range_split_to_ptes(lstart, kstart, GFP_ATOMIC);
> +               ret = range_split_to_ptes(lstart, kstart, gfp);
>                 if (!ret)
> -                       ret = range_split_to_ptes(kend, lend, GFP_ATOMIC);
> +                       ret = range_split_to_ptes(kend, lend, gfp);
>                 if (ret)
>                         panic("Failed to split linear map\n");
>                 flush_tlb_kernel_range(lstart, lend);
> @@ -1207,7 +1213,14 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>         remap_fn = (void *)__pa_symbol(idmap_kpti_install_ng_mappings);
>
>         if (!cpu) {
> -               alloc = __get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
> +               if (IS_ENABLED(CONFIG_PREEMPT_RT))
> +                       alloc = (u64) pagetable_alloc_nolock(__GFP_HIGH | __GFP_ZERO, order);
> +               else
> +                       alloc = __get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
> +
> +               if (!alloc)
> +                       panic("Failed to alloc kpti_ng_pgd\n");
> +

I don't have the context on what this code is doing so take this with
a grain of salt, but...

The point of the _nolock alloc is to give the allocator an excuse to
fail. Panicking on that failure doesn't seem like a great idea to me?

