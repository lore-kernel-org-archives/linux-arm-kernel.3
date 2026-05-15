Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA71CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 13:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrcveOzd/WWbNe570nvU8OaOmaachZXcBDZ79lMG6zk=; b=EMdyUZLHT1LYwUAWcj79YXdry9
	+f1O8ECKQgeAZViN2cr8osWBerw0wGXjM3F0+6jZiJsd7fVNgYCcqyiNd8qPVopeo7SehmqKIb3QO
	EYL2HpZy0j9WVIy2TMHt4jrYzqBroNaiqd4u1CBj94BK0RsOJmmHW5aGQtbFiEYLMdegX7Ye65o5y
	cxXUSBVSTmOVPH+qF3nlKPCkVEEEw2kjMFpWWh97rwUZlVbr0BnSJqAS4FvHi1tlilPd8TsU5AZe9
	0N3oneP0GDYwb8vynRFv4OUknR7gekdnhnM+bDFEpCiZ6bPDjJmAchmesHlqvTSuQxJWYXiH1Q0DS
	CqJuK8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNt1E-00000008VLW-1Byv;
	Fri, 15 May 2026 13:56:00 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNt1B-00000008VKt-0tA6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 13:55:58 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-65d071aac6eso10733195d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 06:55:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778853356; cv=none;
        d=google.com; s=arc-20240605;
        b=dwp+kg4qN7yBmcNc1DAmqjYkwgDzKDb3CgHwwvCO5vGtYIapDGURGw/b9avdDme/fG
         HWDglFBy8xrLNRphAYD0ppXR6dUV+XHRby/n39PKLc0zjdWez5XTXD+2AmbTAgxdP7p+
         5fAdwgo/BvgYmSGmCqpBRdpMsep8NqATWVyHdE1tzJ2qtdKrz6tybx6WzHw9IRPiOXJz
         K0PURE9D1ISwxWsm9NU+ScS9bifBqVOnFCBxVGkkDugi/pOSOX/EVvtZzW/PlcPefUp9
         40dgR5y9xtqKiVc6Q+VHrWc3abM05BbhalxKnM5S2tNGHiy8xWgn2IJAPzjWtttRxpaS
         DDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rrcveOzd/WWbNe570nvU8OaOmaachZXcBDZ79lMG6zk=;
        fh=fSoTTd1Y5Nx6YNSqKOy3LWKNH9gZbGyHCoEV8DVT+Xw=;
        b=WnE4fBuaewjI6ZWgi+RQTUMb7Leq9jPWp1q1O8iLkq9FvxsIcg/nOtbZJm32DZlt6E
         C6RvPuE+VVomxx/U/LhXFGYxN9eB6QvB/DtNWbzjmiAQnCRwquApFg3Gbx132ptlg1hG
         cCbDOQ7Z0ZYRJfl9g0mKWYky+O6c/2UfiNIDNVsr3L460nyDCQNXUA6Fk7DVLkTu5vbM
         exvqoJhyJg/cjmtovrp2Ub9JVVUin8/+W4ibL9ifNEHGwbuseireMR2/cBnPblXtdZ3E
         0qHmBiwR/EBVdi9MWuanuGDXyJBueidSCvA3mqSff7VXB9r8PlxbcERP0532wnxnQ5T/
         qdbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778853356; x=1779458156; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrcveOzd/WWbNe570nvU8OaOmaachZXcBDZ79lMG6zk=;
        b=spzXEsLRBgtXStW4n5PfhN74hZDU4hIa2Lc03fipkeiD0ZMS44px/1v48LtINv3wNH
         5kgry45Xxb74LVdZ4/hshQE63oYRIgPeEogGqe8AEUx1nOR+x3sprUJkNuCHQGgSzJ1s
         L2UVnK+6nF3OfQ5mWnlRM+ky/mvVGbD61E+g2rLp+q1hoGkGW4Vzz/vQZEw8U57nXs/8
         buShS3ZXhuWQp5R5QCr4Uj69YeQUx6bUBhWt3IL4JfVg0Qgxewkk6vqkFLpQ6fdDMf0X
         UD7/+mAx7JYlIAC5py65WTX2BZFdapv337ahnVd8sOVRFjttN9fxU8KclMBM+lHGXaaK
         IzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778853356; x=1779458156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrcveOzd/WWbNe570nvU8OaOmaachZXcBDZ79lMG6zk=;
        b=UKBsz21oxGsCAYxe7J4vDR6Vn24nx1rxvwPjIQTDhlKs7gieVbF1iAJE//srXUTu+P
         OlnLiKoL2SgQALQpJmG2tRFujZcgAYkQE77bUaRVUEWznqX33Ees1N8ebxv6DPBsj3DR
         1K+UYhtcOrYbxAS5lnJ30GupcIFKRVFSk7WaUf/qJLkwUFWCnbXBxHW+H2AkwutSoGCZ
         SCru8yBg3Od5EOyTwXCLCH728Cm7ythwOCKvrtHrUTmsY4984K3h9elWMJID4rQfZ+9o
         hnPwQxdRbSlaAcgrRdXRFiOB3jRKI6CN6pFwWubpgBSc47OiTBtKOQk8CNlS0dzCihLj
         UojA==
X-Gm-Message-State: AOJu0YwOcWekvvPQDZSthMMwdAKz1eRmG5Pn018M0dvfp5EwhdTjd7Tl
	c0RvQ3MVpv6lGSVVRmLIgPOWk1OrXnJtuXPoCSeiFRySoDZd+xwyAKfIgIlRdoBlxvWvY5A/bDE
	Jbd5KdIE3Ft+iFKXlwilWr+RjcVPlT/c=
X-Gm-Gg: Acq92OE/5yYxym9hsPwzm1ZSIYit4rCth4/AtZWzdDhUxWGsRsNaiyAtHeOrxkeWtTG
	GhEOS1KirVyURUGOVGTq/S8ljZZRucXKEXGIWRD2wwaTEXMB3QCjcj5PblJ2DTbes3Ly1ixQN3L
	5Z22feNOkmzLilGMYDtXRbh+PmaX2rc+sLS+BjkejEuxjinMEl98H50Qq8eTB8ac24aOC+yVXwm
	GKR7/esdvmZRpTpA+T9hFwvzseCl4v2eeg3/hYEd+7z85cjgk1A8pwTDPgMDfjihXLkBfhKh50u
	rKCv
X-Received: by 2002:a05:690c:5c07:b0:7b3:edc7:9b8f with SMTP id
 00721157ae682-7c9561735f4mr44744847b3.0.1778853356094; Fri, 15 May 2026
 06:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260514171304.2034930-1-ekffu200098@gmail.com>
In-Reply-To: <20260514171304.2034930-1-ekffu200098@gmail.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 15 May 2026 22:55:45 +0900
X-Gm-Features: AVHnY4LOIUMnAeXhKKqWLQgBm8BBYBHc4lftCWLFhZ7eDe_7u-ldMtVH-Mzy5ck
Message-ID: <CABFDxMHngr+cyjZdiJTZATh2D5jC=qO+92B1VVrr0w9TNtx6nw@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: use u32 for FDT size in fixmap_remap_fdt()
To: catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_065557_590293_DF6536B9 
X-CRM114-Status: GOOD (  24.16  )
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

On Fri, May 15, 2026 at 2:13=E2=80=AFAM Sang-Heon Jeon <ekffu200098@gmail.c=
om> wrote:
>
> fixmap_remap_fdt() uses a signed int for the FDT size, so a malformed
> totalsize bigger than INT_MAX wrongly passes the MAX_FDT_SIZE check.
> Then create_mapping_noalloc() is called with a huge size and triggers
> a BUG_ON() in the MMU code, with no diagnostic about the malformed FDT.
>
> Change the FDT size from int to u32, which is the return type of
> fdt_totalsize(). So a malformed totalsize no longer wrongly passes the
> MAX_FDT_SIZE check, and setup_machine_fdt() prints a pr_crit
> diagnostic for it, not a BUG_ON in the MMU code.
>
> Fixes: 61bd93ce801b ("arm64: use fixmap region for permanent FDT mapping"=
)
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  arch/arm64/include/asm/mmu.h | 2 +-
>  arch/arm64/kernel/setup.c    | 4 ++--
>  arch/arm64/mm/fixmap.c       | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 5e1211c540ab..a6b388ef4c3f 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -68,7 +68,7 @@ extern void create_mapping_noalloc(phys_addr_t phys, un=
signed long virt,
>  extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
>                                unsigned long virt, phys_addr_t size,
>                                pgprot_t prot, bool page_mappings_only);
> -extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t p=
rot);
> +extern void *fixmap_remap_fdt(phys_addr_t dt_phys, u32 *size, pgprot_t p=
rot);
>  extern void mark_linear_text_alias_ro(void);
>  extern int split_kernel_leaf_mapping(unsigned long start, unsigned long =
end);
>  extern void linear_map_maybe_split_to_ptes(void);
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 23c05dc7a8f2..7cabac0546dc 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -169,7 +169,7 @@ static void __init smp_build_mpidr_hash(void)
>
>  static void __init setup_machine_fdt(phys_addr_t dt_phys)
>  {
> -       int size =3D 0;
> +       u32 size =3D 0;
>         void *dt_virt =3D fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL);
>         const char *name;
>
> @@ -182,7 +182,7 @@ static void __init setup_machine_fdt(phys_addr_t dt_p=
hys)
>          */
>         if (!early_init_dt_scan(dt_virt, dt_phys)) {
>                 pr_crit("\n"
> -                       "Error: invalid device tree blob: PA=3D%pa, VA=3D=
%px, size=3D%d bytes\n"
> +                       "Error: invalid device tree blob: PA=3D%pa, VA=3D=
%px, size=3D%u bytes\n"
>                         "The dtb must be 8-byte aligned and must not exce=
ed 2 MB in size.\n"
>                         "\nPlease check your bootloader.\n",
>                         &dt_phys, dt_virt, size);
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index c5c5425791da..c692e6ac2405 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -134,11 +134,11 @@ void __set_fixmap(enum fixed_addresses idx,
>         }
>  }
>
> -void *__init fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t p=
rot)
> +void *__init fixmap_remap_fdt(phys_addr_t dt_phys, u32 *size, pgprot_t p=
rot)
>  {
>         const u64 dt_virt_base =3D __fix_to_virt(FIX_FDT);
>         phys_addr_t dt_phys_base;
> -       int offset;
> +       u32 offset;

Also sashiko found another issue with malformed total size. And I
think that can be resolved by the following changes.

        *size =3D fdt_totalsize(dt_virt);
  +     if (*size < sizeof(struct fdt_header))
  +             return NULL;

Before sending a separate patch about malformed totalsize. First, I'd
rather check reviewers' opinions.

1. Do we need to care about malformed totalsize? (including addressed
by the current patch)
2. Does the above change need to be merged with the current patch or not?

Looking forward to your feedback.

Best Regards,
Sang-Heon Jeon

>         void *dt_virt;
>
>         /*
> --
> 2.43.0
>

