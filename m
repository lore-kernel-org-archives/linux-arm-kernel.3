Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFA1C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSmhmMwSHeb/AFuavXUtAAJUBEhwOGfF4EtmeF2L3kI=; b=nMrr5h2IstvGUNLs/j1k1mkgsb
	e7rQUWvkLx2s10aOP2V6AVKm7G/wUvrNQDIExcV+51ZUXPSyfyCJOrD084RP2OZpQwEaVr/9BIxds
	CSxGs0H7MvxqwqwPnq/4qVPl8ohMcKHbNkjR8VSvMGiz3v3NqRoIHoMkq1QoQX8W+8FPtD1s/e+aU
	AHwfHOhgWYiEO9NzkPVKrSd46UcKZqdTnseQv20GIK8VJ4FzTrXcTiSUefOvcUF8ISHRzfVLiYrsJ
	ZKzxFd3RcF26GwL9Hnc9cjyoou1M/Li9ndw/gpIadcE1ApQhLxsnUbIejGmhQSBicft5K68HUQRJH
	GeZvw4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KOu-0000000CCJy-3ffp;
	Wed, 09 Sep 2026 15:39:52 +0000
Received: from out-100.mta1.migadu.com ([95.215.58.100] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KOm-0000000CCJ7-3n3m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:39:51 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=fzj4Ws8lKIWrjEiyGIpoIDsUvXAXaL99aEWk2VGWV7s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788968381; v=1; x=1789573181;
 b=k+X7BK/h2/0tNxgOBonwd/AlrjDRoqknyp6eIhgvZLPGI4Sf5KB+br97xvVmVbl1cMsy0IC7
 Gp8nvoIMN+jBlAJioNVQZAIQ96pTPpNmCO4BYip3egNgW3Xcqg0SsgIPiyyY+eEYx+0vd0gpCIA
 eaPuUmF9XD2ftoLI+1nUZ+8w=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fc101b41483c5a63;
	Wed, 09 Sep 2026 15:39:41 +0000
X-Mizu-Trace-ID: fc101b41483c5a63
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so8774e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:39:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVCnIhzUXCSmSlZpkhQRL5pZGVeMU7sUDkW7S+yK9t5SVSQPxvAJrBJ9RTk4QdNWxZPcO8GVwneOyjIfCWO4ZU@lists.infradead.org
X-Gm-Message-State: AFuF++mATq8DS7KxX3OtL2giY+yG8y2gtwtWA6dKAIFeki9QpCjGEZvA
	QG4ZGEZnihoxOU69ZwPEDPxrMCllnFEcTYoaDoV83TF8tYMMg10BMUnwSRan0hLn8qqhwdthw0v
	wY7ts5soEWk3y3IaVWBSp+y1NSqabgmuQT7Aj6sJn
X-Received: by 2002:a05:6512:1296:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5b764bb8a14mr142455e87.8.1788968380386; Wed, 09 Sep 2026
 08:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com> <20260807164322.2970811-3-sebastianene@google.com>
In-Reply-To: <20260807164322.2970811-3-sebastianene@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 9 Sep 2026 16:39:03 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw8H90YZmwbVu6gwe+2+D6QsDLybKcncLcCFSsK4kT+gw@mail.gmail.com>
X-Gm-Features: AcwNN1Xn11LM3S-N1a2DBr7wA2T25hY8d1olPDXuf0s4eEIGVNgdvX4H2BSTCmw
Message-ID: <CA+EHjTw8H90YZmwbVu6gwe+2+D6QsDLybKcncLcCFSsK4kT+gw@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] KVM: arm64: Donate MMIO to the hypervisor
To: Sebastian Ene <sebastianene@google.com>, Mostafa Saleh <smostafa@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org, 
	kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, seiden@linux.ibm.com, 
	tglx@kernel.org, vdonnefort@google.com, vladimir.murzin@arm.com, 
	yuzenghui@huawei.com, zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_083947_290487_B0BADE87 
X-CRM114-Status: GOOD (  21.62  )
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

Hi Mostaf, Seb,

On Fri, 7 Aug 2026 at 17:43, Sebastian Ene <sebastianene@google.com> wrote:
>
> From: Mostafa Saleh <smostafa@google.com>
...
> +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size)
> +{
...
> +       /*
> +        * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> +        * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> +        * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> +        *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> +        * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> +        */
> +       ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
> +                             addr, size, &host_s2_pool,
> +                             KVM_HOST_INVALID_PTE_TYPE_DONATION,
> +                             FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));

Before this patch the hyp linear map held nothing but memory, and this
adds the first device mapping to it. That places it outside
`fix_host_ownership()`, whose scope is the memblock list, so nothing
at init verifies the ownership. It's correct as written: the donation
writes the host stage-2 annotation itself.

This has already gone wrong once with the hyp stacks. The fix [1] adds
`pkvm_check_host_ownership()` over the private range, which fails init
on a leaf that isn't hyp-owned. I'd move this mapping there rather
than leave it outside any ownership walk.

...

> +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size)
> +{
...
> +               virt = __hyp_va(addr + offset);
> +               if (kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)virt, PAGE_SIZE) != PAGE_SIZE)
> +                       goto err_with_unmap;

Sashiko is right, even though this is benign for now. `ret` is still 0
from the `kvm_pgtable_get_leaf()` above, so a short unmap runs the
rollback and returns success. Could it set an error before the goto?

...

> @@ -1161,13 +1161,12 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>         kvm_pte_t *childp = NULL;
>         bool need_flush = false;
>
> -       if (!kvm_pte_valid(ctx->old)) {
> -               if (stage2_pte_is_counted(ctx->old)) {
> -                       kvm_clear_pte(ctx->ptep);
> -                       mm_ops->put_page(ctx->ptep);
> -               }
> +       /*
> +        * That also ignores stage2_pte_is_counted() instead of clearing
> +        * the PTE as the MMIO can be owned by the hypervisor.
> +        */
> +       if (!kvm_pte_valid(ctx->old))
>                 return 0;
> -       }

This changes `kvm_pgtable_stage2_unmap()` for every caller, for a
reason specific to `host_stage2_unmap_dev_all()`. The others are
`__unmap_stage2_range()` and the two guest unmaps in `mem_protect.c`;
as far as I can tell none is affected today, but
`stage2_pte_is_counted()`'s comment still describes the old behaviour.

What's changing isn't what the walk does, it's what counts as a
counted entry, and that isn't the same question for the host stage-2
as for a guest's. Could that be stated at the call site instead?

I couldn't work out what "That" refers to in the new comment.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260908110713.1540304-1-fuad.tabba@linux.dev/

>
>         if (kvm_pte_table(ctx->old, ctx->level)) {
>                 childp = kvm_pte_follow(ctx->old, mm_ops);
> --
> 2.55.0.654.g21b8a5bc05-goog
>

