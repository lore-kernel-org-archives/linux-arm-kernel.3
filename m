Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E6DEDF152
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhioMr+TlEkKghKMNX83e9mEkIV+C0EY/uR4/Y90u/g=; b=kJ4QlKg+c4gRSVZrrNMI1knpcC
	cVD3JJFr1u0TXxoJ+lFCpW6Z0ExwfwS3uJ+OEUG6d1h5sDkiYwzhDFS5C4y0qoXgOlv9bLFXBpYWd
	CuHme7C5YHW24b9YzS32e7jvv29ifR+wpXKBhzqO5w4XkKQJcKmhNQI6AS2pnoqftZ7mTOk00U9PG
	Fnj0l3EKaBnAYmWFh3Tc1wSiqdrXc6S1Eo9aZftLZD3Df8Xx8+fDg252CMWyTG9OPXxLFZeMn0Cxc
	fJcSwtqx5J8+l2cowU7XfD08nh9WmnOJFQ9TjJuQLpGRSDh+3iGPmgGpmXaDeJn62c8dXHYjXzFVj
	hZpG1now==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1h-00000003MpR-3hrx;
	Fri, 13 Feb 2026 11:07:57 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1f-00000003MoR-0F1D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 11:07:57 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5069a785ed2so343531cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 03:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770980873; cv=none;
        d=google.com; s=arc-20240605;
        b=ad/xuQfIIQ/1u6Lou+h/n7NtSPR60P5E6+Fw0k6X3kwJvfujwqvQNrZr59c7qnuSnZ
         kBWgLu037CV00f/xST3Wlb5f7sLWB3gIO1v3ULUJ3zt4JGShii4yIY2rdb1a2eFEbQLQ
         pL6sH8A/7C8c5LuStXtgb2AQ0Em4YiYwVg1IFQ3HWxR/8jF6taFSJFj/TziGoLNtDl8/
         367tdJSb8BxZEyFflXbhI0Nc/IY+XWwYdDgYV5E5w1geYr5YPqgMJfp+fdT0pZk/xjJu
         rFOT2NF4f5P+xT2h1imdxSp10T3RE+Yc0y15x1nz6bIzlHErSNE116VcmEODoMtvaewi
         4h/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BhioMr+TlEkKghKMNX83e9mEkIV+C0EY/uR4/Y90u/g=;
        fh=820zr5DyRGrrKi+yv9ntjFfyb7Tw0r/fBaF8tEBQWpM=;
        b=FtYHEz3Jhe7XO3a1l/nUQq/2wwBkuRjj9JVXCwWNxCitYh16dSLg5vx/tVZyYEZT4+
         AsCoA9UnUTbcUPhDB7jg+PTrNmm6dYLjmMjI/fAotV84qyXlcTT1aqgFko8FqY1GK400
         aFt1Fm2NWczin7yHjKvDd4l04jzYM0xrizwXCrbflPpyJGw7tHcsAGDjfktf5R1CcUGr
         aQvpfrPPKCulQEPjhsYBSr5rGsY174WU1h9pB9KSsO1BM0jkxXGNFZiybfqwegSaBsP6
         gGxKE+Z5kKOwnKIC49I78/dh6il1wNCr0N8kNg4K9O746UBFwwldZtBTtpfBvJzYvTlF
         /3WQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770980873; x=1771585673; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BhioMr+TlEkKghKMNX83e9mEkIV+C0EY/uR4/Y90u/g=;
        b=1uFcSww8/lSSO5/qxlK8fqhWhhxmGDAVfItc8ok1F2x12AE7Ya1LP+1r9JO49W2x1H
         QXUDHj32MQyOl71bgB8azWkNGwjCXSYbltakwtxvTAmu1kKCzzl/JxyTbcDQFKsfXU2m
         //rpPg7aJAAg9xuJC48CB49Iv28/KofjhOqJ/eIIm83Y3YvLTeJNXHQgUadJUskSkjj3
         JjAw0K+tukVfsljwUKjfNp33GGmWih5pbwANIYsnAD07vVDdC1Ybb/K1GSFkL31uHfM7
         4p7xS0GhENuGSeCBs3av6pagUaCAIT7w5g6i7YTsjfNdKJRJy6i/UqwsK4IyeCeyl5eT
         PQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980873; x=1771585673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhioMr+TlEkKghKMNX83e9mEkIV+C0EY/uR4/Y90u/g=;
        b=eoavtkanJ0wAfOwrZ0lZpiAF7cCEAJOC/qF+n4Die6IMxpH5e5iD1fmElZ1tQp+cp4
         izCR9+ClRXBGEUNYhZexrhDnevBCWPNk09dUav3Qjkc7O0msc46iHSCwk4KCxt/S8ncd
         Fq8f85lM/WUcSNKeCVoT74lFhROipvmkClkEGBYKn2lZtUgfylTM56zsu8N0tFNRv0wf
         VlrRq4uUpsctsOnaWyICZjZI9ZPQt/qAggGerAM/JTAusF8jRMWPw+W2OjLYHgGDLsUf
         Aech7tQPrYxvV9k9bwz4u06fINtsG6KyFoJyr9boksgZnTawewQkVzC6wPtCp2fuZ8x8
         sf4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyTg3pkeldoA/RsPJ5XR+6v8Jd+4OJF7r9CwZE0XIXFXGGaoKAi1ZjKLgwgerNPrXtu7kPZ5r2fWgXHw9bQAzp@lists.infradead.org
X-Gm-Message-State: AOJu0YwyPVa8P1sSVq5fEFkLp7gb1qF7TkEJ5KeEL4CFu8jX5jRQEQk6
	rqU5LzxHjZP8vLzuhwYc48eZVleTLbIbeIEaGCN+hGRIkSCXJ+4/WqNxxvG4j6DlRFNSVt8THfY
	Bv8dcMykzURkLidR7XFPckiz9skR0wxYZyR6UhsyO
X-Gm-Gg: AZuq6aIsF+UpHxIjcxY0P2IIGlWSDkW4jpxqH/jJLSfJJlUFstxyFURVquREQ+RPvgO
	Wqc29x3SarYqYGmPGGSF2DwyEkx7lKOYjblRLUy6hmh4bjc1b97J8He/k841gNfm2ytcy8GfWlK
	YwNQNuLUNN4x0jJo18hpXZ274efsmu3UA9GHTHDTYbe5UZPi8LJuOp2KCIeQOkTmR+gJXS4MK69
	WWg0UDUYgoqCzkNJ5ZPt0sd8ZlUadwe0OQW5rC7FYH6GgvKINMgq4N+lijLP1PZLoIdgvBfnBG7
	sfeL8FU/
X-Received: by 2002:ac8:5794:0:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-506a8434debmr6596891cf.5.1770980872383; Fri, 13 Feb 2026
 03:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20260212090252.158689-1-tabba@google.com> <20260212090252.158689-3-tabba@google.com>
 <86ecmoc3dk.wl-maz@kernel.org>
In-Reply-To: <86ecmoc3dk.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 13 Feb 2026 11:07:16 +0000
X-Gm-Features: AZwV_QgSdg6ZxR7oLi_wuOeoAvMjVYMSeO2-E9Trn8UZX41x8tt3ScmTFjatuKs
Message-ID: <CA+EHjTx1xjPCd0w56YDF42W=-HtKm9DYxUwGPd+2u-zmiSw9CQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] KVM: arm64: Fix ID register initialization for
 non-protected pKVM guests
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_030755_174727_1C4F5BD0 
X-CRM114-Status: GOOD (  32.10  )
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

On Fri, 13 Feb 2026 at 11:03, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 12 Feb 2026 09:02:51 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > In protected mode, the hypervisor maintains a separate instance of
> > the `kvm` structure for each VM. For non-protected VMs, this structure is
> > initialized from the host's `kvm` state.
> >
> > Currently, `pkvm_init_features_from_host()` copies the
> > `KVM_ARCH_FLAG_ID_REGS_INITIALIZED` flag from the host without the
> > underlying `id_regs` data being initialized. This results in the
> > hypervisor seeing the flag as set while the ID registers remain zeroed.
> >
> > Consequently, `kvm_has_feat()` checks at EL2 fail (return 0) for
> > non-protected VMs. This breaks logic that relies on feature detection,
> > such as `ctxt_has_tcrx()` for TCR2_EL1 support. As a result, certain
> > system registers (e.g., TCR2_EL1, PIR_EL1, POR_EL1) are not
> > saved/restored during the world switch, which could lead to state
> > corruption.
> >
> > Fix this by explicitly copying the ID registers from the host `kvm` to
> > the hypervisor `kvm` for non-protected VMs during vCPU initialization,
> > since we trust the host with its non-protected guests' features. Also
> > ensure `KVM_ARCH_FLAG_ID_REGS_INITIALIZED` is cleared initially in
> > `pkvm_init_features_from_host` so that `vm_copy_id_regs` can properly
> > initialize them and set the flag once done.
> >
> > Fixes: 41d6028e28bd ("KVM: arm64: Convert the SVE guest vcpu flag to a vm flag")
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c | 37 ++++++++++++++++++++++++++++++++--
> >  1 file changed, 35 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index 12b2acfbcfd1..267854ed29c8 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -344,6 +344,8 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
> >
> >       /* No restrictions for non-protected VMs. */
> >       if (!kvm_vm_is_protected(kvm)) {
> > +             clear_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &host_arch_flags);
> > +
> >               hyp_vm->kvm.arch.flags = host_arch_flags;
>
> Can't you just have
>
>                 hyp_vm->kvm.arch.flags &= ~BIT_ULL(KVM_ARCH_FLAG_ID_REGS_INITIALIZED);
>
> since there are no atomicity requirements here?

I'll fix this.

> >
> >               bitmap_copy(kvm->arch.vcpu_features,
> > @@ -471,6 +473,36 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
> >       return ret;
> >  }
> >
> > +static int vm_copy_id_regs(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +     struct pkvm_hyp_vm *hyp_vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
> > +     const struct kvm *host_kvm = hyp_vm->host_kvm;
> > +     struct kvm *kvm = &hyp_vm->kvm;
> > +
> > +     if (!test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &host_kvm->arch.flags))
> > +             return -EINVAL;
> > +
> > +     if (test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags))
> > +             return 0;
> > +
> > +     memcpy(kvm->arch.id_regs, host_kvm->arch.id_regs, sizeof(kvm->arch.id_regs));
> > +     set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
>
> This looks a bit odd. Can you have another vcpu doing this in
> parallel? You seem to be holding vm_table_lock at this stage, so
> that's probably OK,  but I'd have expected something like:

You're right, it cannot happen in parallel, but another vCPU could
have beaten this one to it.

>
>         if (test_and_set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags))
>                 return 0;
>
>         memcpy(kvm->arch.id_regs, host_kvm->arch.id_regs, sizeof(kvm->arch.id_regs));
>
> which makes the intent slightly clearer.

I agree. I'll fix this too.

Thanks,
/fuad

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

