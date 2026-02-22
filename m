Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07549C636B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 20:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2/zSsN0ZphntQc+eR+dJyrmvjXaa4Ou1pt58IXRg+A=; b=QrxtxuRZzL2shbfGXG/JSxDt2u
	HmxSURW8WYh6KP/TMqc6xMbCEb25scwi8geS2V/YRIO3ynvCR/t5p+L4cFwsuHqx0PYspGkOwMdBB
	CXs+Ckcpk0nUJnO3766rOdv/oNRp/nSbrnFhYN2J+DEXyzDeq+IVmJUYq8t+uQtOokY7xWEkZAdLF
	rPuJ8mxnYwMv2oZIAUS8uKM8Q8wVvWQbYnM5ZYBoR4PN42tTtSWVADE4xkgVCCOMTwZ+Jv4285AHA
	UvJV+ZA18c9dqB4AcTUovdmTscErXSIE20TlGFPapeKuIPbyUSnGnFetevIucrNZUKK+L6G8uD40j
	04a+ZGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuG4b-0000000Gv9R-0dXp;
	Sun, 22 Feb 2026 20:29:01 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuG4Y-0000000Gv8h-2oMd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 20:28:59 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5033b64256dso715761cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 12:28:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771792137; cv=none;
        d=google.com; s=arc-20240605;
        b=A6q9IHd1QJ9HHOqN/+kNvvJjp3oGvJs2DRbjZJLblSaFbdruYITnkfpIVkGaOp4c36
         45hrI+l3kO51dHiuDlMWye7MLhsj7BXZmmTBAY++ypQRPmC/xyJ1VaeHKsy7Y2Ooyqwx
         JZ/xBEkFdwB1byi6uYwKhZtYYASfaDn2UcdZ7UhPgWVfjBIC0tItgvCQnZVHxcA1AJlx
         NqWNDgEX19pTQZZvxysny74mDT3koYAMYNRYa/ijH+St12evlcOazXMHBR8JbZG69Z06
         KvPxyI34SFjXtLYgELAgO1IcVrav9930yO4hBrNAzJ+w/2KgrfVff5IxeIjEpBrSBh5O
         Gkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F2/zSsN0ZphntQc+eR+dJyrmvjXaa4Ou1pt58IXRg+A=;
        fh=scOgl5UuiTUUJVDxPTlsr6OD6QT3kqz5xoqEg6X1+Mk=;
        b=WdiMTJA+w1cuR1IcvIq3cqUEI6k+wIstn5Do7NUVzvNspxBarWa4mdkHybl4tXDPEE
         MBsXG7MhwcVG1w2f0nFdejSjqx5geqXDN/s1DqRXR8ehGl9O5GVc32YZXtDRC24EtDbs
         JtrkpArcPvdXWv5FOcFG3hBqwq5/cs+80AAKtXoACboVIbpsBumV4vzg8dpe4FPr3mkc
         EjPq9is3jYcxjpmKF40qSim/K/1ZkufkwI3GMj+ZR0Z5kPoLwvWu0+xU/pRtrUbW2I/o
         wltIvFh0T1J5eLxqv+vYEtJ2DvfCPQ/Hw/mG3frzdlN4Ate5BbRIvhSl+ITPNuRmjkDi
         p62Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771792137; x=1772396937; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F2/zSsN0ZphntQc+eR+dJyrmvjXaa4Ou1pt58IXRg+A=;
        b=jvj8SAfN1oMycIJF5K5jx1JER6bcoldMbpqThb+b6I0z/wR/srfDAcJcHDGqXSCLRq
         OUtHeKmRli7DcdGziuMea4EXSVPH7nSP/GklbZ2kzLMhmIn4ZaEWUoT0qdkS2hG3OZlR
         1TPetpdkICf2ysgcnJQFgyU9Ttn6LJyJrVVj6p5VhmN+f+dVMOzK8hPiSqpSEpr9pXHu
         SrbQ+kCyEIYytYKySL55/TiSaJQdEG9JVjQh0sJC6usqRFYgF0M7Misks3cRKrbbrwgr
         ZT79pu9CXvKai3hMh0G+dRo7UrYcZtXdvGyr9+WX782ltZGc6ptdzAcCohnAqaTGHsOu
         IGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771792137; x=1772396937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2/zSsN0ZphntQc+eR+dJyrmvjXaa4Ou1pt58IXRg+A=;
        b=am5NaEE11/O+wo5AZ3WbXA4GaDoX7rNbcRnFbuV9KmVlxgT7C6hTZPbtpV/YlbulpO
         AF02TKhCa1JRpEdWoXeFJpuWygoiuAGQrG7IJ6eJTmqW7Eem+YcYUm8cBT3JaRdYYh5Y
         VxadHyl8XgvpVhhCWPHF+B4mvAAeG4a9bDrssc7939wZVlop7+rA15DvnMokupicZuff
         6wjPgbPEQEmrFWn3d5mMJvAPzWkTGBxNcIkmNY3zL1wDp8ACVlDdaXGQpiKQJzZaS9OU
         6qXyC9B2fEMGSZnOU4t70SET1kNVJrpCBv+ZhV6HeaPaI3XWhrGtE78AbSFt5dSl/jyw
         FjqA==
X-Forwarded-Encrypted: i=1; AJvYcCXNu8gul9gPKGcBcDijr3wvr/5G5k2M21p0Kvs1DZHkKMZjviLmIXR4lXEqEl7shy6F878XLZQe4tShFsI5tyJ7@lists.infradead.org
X-Gm-Message-State: AOJu0YwZaKord9M7+GQM/SypzC3l98A7c5+kNEeZfvOhT/ZSZhyh0loP
	vBcZgEHdDWby7cwDkEWzsjGGx04WO67sfAnr1ZKdwLfJ/QymdPeyZvImZYSmvbLB1cU7Ca+kc4a
	SQJl3iMxY72eQ/RzIrTvzIZf+fFLp8dFwYPnEAzpG
X-Gm-Gg: AZuq6aL9WioXn0uoQ1Kct5rbBQ3ZdLId+AlZ2YXYvi+/Yy0yBwyb1bKygzXQ2hwNTVl
	ayimqzvDRMqFoz/zUCVUdM53i4MiI0o6IEvj1/SNeCLQiOiWanKw6PxzK+V4dBROsV2KRiTVxmf
	Ryw02ul1b0whDIN04yQxS74mpnSSeXRjZ0xGx3Hr4Z/WiThVcQazLQhDa8U9Z5FwGhZQ4Qf8XA9
	cuAuWBUu5bLf4QgdcGaV2Gls4+JaPXCA4gZfJ0JzKQLmiQ1zKWKLe0XXm5c0DUT8glvhd8ksvNJ
	+HaVPu1V
X-Received: by 2002:ac8:7dc1:0:b0:4f0:2e33:81aa with SMTP id
 d75a77b69052e-5070e893faemr12700351cf.11.1771792136883; Sun, 22 Feb 2026
 12:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20260222141000.3084258-1-maz@kernel.org> <CA+EHjTy4p-Mbfr86NR9n1LgHC0EWrkdVjYb8O3z7k=Lv1entQg@mail.gmail.com>
 <878qckehh9.wl-maz@kernel.org>
In-Reply-To: <878qckehh9.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 22 Feb 2026 20:28:19 +0000
X-Gm-Features: AaiRm50cURl-e3Du3IJOwxV9NVX2guzIAipyh62nI0lRBrHVyFZMVoDigEP_TR8
Message-ID: <CA+EHjTxtFZU24rwh3zeiJjHgV2_g_HfJvMFJDC3WNKCLa58kaA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Fix protected mode handling of pages larger
 than 4kB
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_122858_738726_830FE048 
X-CRM114-Status: GOOD (  42.50  )
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

On Sun, 22 Feb 2026 at 18:55, Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Fuad,
>
> On Sun, 22 Feb 2026 17:58:00 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Sun, 22 Feb 2026 at 14:10, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > Since 3669ddd8fa8b5 ("KVM: arm64: Add a range to pkvm_mappings"),
> > > pKVM tracks the memory that has been mapped into a guest in a
> > > side data structure. Crucially, it uses it to find out whether
> > > a page has already been mapped, and therefore refuses to map it
> > > twice. So far, so good.
> > >
> > > However, this very patch completely breaks non-4kB page support,
> > > with guests being unable to boot. The most obvious symptom is that
> > > we take the same fault repeatedly, and not making forward progress.
> > > A quick investigation shows that this is because of the above
> > > rejection code.
> > >
> > > As it turns out, there are multiple issues at play:
> > >
> > > - while the HPFAR_EL2 register gives you the faulting IPA minus
> > >   the bottom 12 bits, it will still give you the extra bits that
> > >   are part of the page offset for anything larger than 4kB,
> > >   even for a level-3 mapping
> >
> > Matches the ARM ARM.
> >
> > > - pkvm_kvm_pgtable_stage2_map() assumes that the address passed
> > >   as a parameter is aligned to the size of the intended mapping
> >
> > nit: pkvm_kvm_pgtable_stage2_map() -> kvm_pgtable_stage2_map()
>
> Actually, that's pkvm_pgtable_stage2_map(). kvm_pgtable_stage2_map()
> itself isn't affected.

Right, I meant to remove the kvm, not the pkvm. It is indeed
pkvm_pgtable_stage2_map().

> >
> > > - the faulting address is only aligned for a non-page mapping
> > >
> > > When the planets are suitably aligned (pun intended), the guest
> > > faults a page by accessing it past the bottom 4kB, and extra bits
> > > get set in the HPFAR_EL2 register. If this results in a page mapping
> > > (which is likely with large granule sizes), nothing aligns it further
> > > down, and pkvm_mapping_iter_first() finds an intersection that
> > > doesn't really exist. We assume this is a spurious fault and return
> > > -EAGAIN. And again.
> > >
> > > This doesn't hit outside of the protected code, as the page table
> > > code always aligns the IPA down to a page boundary, hiding the issue
> > > for everyone else.
> > >
> > > Fix it by always forcing the alignment on vma_pagesize, irrespective
> > > of the value of vma_pagesize.
> > >
> > > Fixes: 3669ddd8fa8b5 ("KVM: arm64: Add a range to pkvm_mappings")
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > Cc: stable@vger.kernel.org
> > > ---
> > >  arch/arm64/kvm/mmu.c | 12 +++++-------
> > >  1 file changed, 5 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > > index 8c5d259810b2f..aa587f2e28264 100644
> > > --- a/arch/arm64/kvm/mmu.c
> > > +++ b/arch/arm64/kvm/mmu.c
> > > @@ -1753,14 +1753,12 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > >         }
> > >
> > >         /*
> > > -        * Both the canonical IPA and fault IPA must be hugepage-aligned to
> > > -        * ensure we find the right PFN and lay down the mapping in the right
> > > -        * place.
> > > +        * Both the canonical IPA and fault IPA must be aligned to the
> > > +        * mapping size to ensure we find the right PFN and lay down the
> > > +        * mapping in the right place.
> > >          */
> > > -       if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE) {
> > > -               fault_ipa &= ~(vma_pagesize - 1);
> > > -               ipa &= ~(vma_pagesize - 1);
> > > -       }
> > > +       fault_ipa &= ~(vma_pagesize - 1);
> > > +       ipa &= ~(vma_pagesize - 1);
> >
> > nit: Since we're changing this code anyway, should we use the ALIGN
> > macros instead?
>
> That'd be ALIGN_DOWN() then, as ALIGN() really is ALIGN_UP(), and
> that'd be counter-productive.  Something like:
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index aa587f2e28264..3952415c4f83b 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1757,8 +1757,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>          * mapping size to ensure we find the right PFN and lay down the
>          * mapping in the right place.
>          */
> -       fault_ipa &= ~(vma_pagesize - 1);
> -       ipa &= ~(vma_pagesize - 1);
> +       fault_ipa = ALIGN_DOWN(fault_ipa, vma_pagesize);
> +       ipa = ALIGN_DOWN(ipa, vma_pagesize);

Yup, that's what I had in mind.

>         gfn = ipa >> PAGE_SHIFT;
>         mte_allowed = kvm_vma_mte_allowed(vma);
>
> > Reviewed-by: Fuad Tabba <tabba@google.com>
> >
> > and using 4, 16, and 64KB pages:
> >
> > Tested-by: Fuad Tabba <tabba@google.com>
>
> Ah, great! I couldn't be bothered with 64kB, and only used 16kB in NV
> to debug quickly and then bare-metal to verify the fix.
>
> Thanks!

Thank you!
/fuad

>
>         M.
>
> --
> Jazz isn't dead. It just smells funny.

