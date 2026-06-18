Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B77FCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 08:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c45y9wnnyb2cnPIO+srEHNjmV4JorsdhhQBjkEOIpgM=; b=OOsnVRLYOlX6wzVppdHAOjZneF
	BTnrTee6RSGc778WCBMCq0sgxmvUKeVNShpjAFw6+u+hQOoDb2bmmrPP0Lsu79B9+Ul0nwfko5a9W
	AL7CJPenu/Eaxeu+3JfhtqnBebNmHjBMkZRpb8K4g0G0B8Kd8i73FCuSGJH5p5Rd+AJ7Spf/5TrWJ
	X/m5WplFUD7+tlcFWNW/i7wPsLvxVz1wsKcak8qruXRVsvCV5snsgTqeqDALfk1u2+sWw48Wtz8OF
	KE8UYQw/Pt62vXSeRpNN6V1KPKtGaaABg1pt88hHJweOo5HH83gFDCyKF0fRcF1RhOclhImz1kf2Q
	llV3RZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7xR-00000000pqj-2wl6;
	Thu, 18 Jun 2026 08:18:42 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7xP-00000000pqG-3SeV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 08:18:41 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-51765531803so210661cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 01:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781770718; cv=none;
        d=google.com; s=arc-20260327;
        b=CiVV9zqBYMn/xB/e03zVyfJ4aWdVurtQxFReJiTPDWjLrpPdiFAr3GuSvAUHI2/hp/
         e0S32wHLQWybM2i5QdH74iQHmMQ6gUuJBndt6+248ChUPbzlC2opJAoTFGivcFHb1lZ1
         CteQBrp2VJIuqFz5RSl3MIask3chMRVnRFsRh9yVaaXNSZib3AMdCF6+TRFfeV5h0hPN
         Tj91q2Zn9vqZx8qreIw+fMyTXyzM4WGbFUz15u2CUr3mNPkrKEaQIfx7e/+UHJc6ufgS
         bh/h6pLvMXSfPhunyIwGKEsYimm5McuzoH5N2CpZVWbllId8DyxOB4kk92WHk9iU6ErP
         dcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c45y9wnnyb2cnPIO+srEHNjmV4JorsdhhQBjkEOIpgM=;
        fh=WjQhw0ytgfPDQLY3YRaRHYWC0+s8tmBaro5bPujPzaM=;
        b=sbnMWqcvaXVlWeIYhX69Jq/+qhsBZZlcW/quPya4c5yXixDcShnCHAqKD3xdYrgF7s
         5Ft3URKMwLZM9r5nTAM8WvFHJhJdUaNyBPc2dYII8S5TNIHzY+blK9Dk4S+2uVq6UOsa
         aWo9APsW7hspnTrdn2zKthK+1GRBIFDonamP0JJr7AlKwWM1L4aFJ7pZUNi0WLzuw2fx
         QlUnRIhnnnfLUBtbPPVPq5/a+/kxmgf2GoxXNuNRg4p1JtOSE1VxZ+fiO+VtngT28YDb
         M2tWU4Ry6NNL3aJ1p9U0d7MBYtsP+IC7CfeFpnwMrxEevaxbLPk3E4RVwln7f4+NiyBt
         KDTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781770718; x=1782375518; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c45y9wnnyb2cnPIO+srEHNjmV4JorsdhhQBjkEOIpgM=;
        b=UNidw++ALi6XVhb4YFYQlUwjjFouAWWYH/K7ll1tkVBhDi67GTHNnC4buZCu+kO5J6
         +XtlsJljMATRCUr+IMrV4J/f6qAh6J1s82RHZd+njELzedrG6karFrpGX3XExm6nXx+s
         Vjv9UJI/x1o84ysi0qfzN/imrJr6IJxwKQKDaUUMkf5D/gNKiiz/iNrISScKmj1YoWC7
         VtjfkxDEnmUWG9NGe/zD8QeU9BiGHffOy5yg+7pZWSvJAFiBsISL2GAIeqLRzI4AHn6M
         sj2FdV1tTDHdu/Ao5Y2nPA3iyTRcXH5a/pA9WFD3M7reEtgx3BRYsVI2fnfV/9CF75Zi
         E2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781770718; x=1782375518;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c45y9wnnyb2cnPIO+srEHNjmV4JorsdhhQBjkEOIpgM=;
        b=er/HYKnt2vTBKj7A5nAxJmq4r2feS5L6DY6mVZnAhuvWe+5cl+eaIHl6KG4o5XopUb
         A1DPbkchfVDxtz3keqqxtoX1G4aUMHhDi58VNbfIade9G9LppxYb4KC/MZ/2ZPHPSZlL
         G0Cuiv1YB93GBJ+u7IAt2YYJtzs0ARvP5lIRCrP7g6A+us2y/E+aKOPX9jzmpx8j4URK
         hEWYsGDnO97MFv65bD4EZJ28Jli1FFs5c+1HoxAZaHKZtZ+xbdhGgZsMDoHnrVdRmrev
         PyjiD7m+E/mdLOAezfkNbp432ttLGzKPTE+skvmgo5wJRattKxFIr2aEhqpWPDQllkwT
         XhGA==
X-Forwarded-Encrypted: i=1; AFNElJ+70q/Znnc4vsGEKquF2PFcJD1LZkCKj/XLdotKDcyCcKtIyOGxHnr2jXYUEsaqnNcKjF5I3wRODQ56NzDG7itv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy//fQ8V9CHdyL9B6ONskrW9y3+/r+kNQDFIbmDwoSo7sDY9SjG
	gfvt0jptSGhFlA/uTCCYEr1gb34lhlA7cxSK25u1Je+wHjpkSsfKUlfZkrfovTS3EARiT5dSBBv
	loQYXvspvVucdWeCwDOuAdzcoJWhjT4kmfGzHPfYB
X-Gm-Gg: AfdE7clQjNb2K1nfTUr0oOY8INjRwkBayD00/ylbqLufTrxIT3naXTi72uFdKNQZ6j+
	SMM667RG6DTOxP68hOtSwfrIUXBWC1Gonkk+5UxO5Ur/dKb14SAHyxAEa6WYUbzZAS+L0BU3qOA
	KjvJ5320DBdze/stvVsBxQi66gPYk5EzuM5yfhn12ikVix9PhzjQxAOsviTrjgJ+niy5cpWOmeb
	qq4ZOjr5tne6fhp04hBdGvVdEBPojKkdjdY3Cd6fJHXcxr2oEll8sxUaN3YniFC0CICmhKLOw==
X-Received: by 2002:a05:622a:60e:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-519c97442c5mr5265581cf.7.1781770717860; Thu, 18 Jun 2026
 01:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260614163336.3490925-1-tabba@google.com> <20260614163336.3490925-5-tabba@google.com>
 <86o6h8s2gx.wl-maz@kernel.org>
In-Reply-To: <86o6h8s2gx.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 18 Jun 2026 09:18:00 +0100
X-Gm-Features: AVVi8CeEsIe0WLVwg5GBkio2jYJMgyWACknxGyB7zwKW8NC6Ll8jR15uMdsNjAs
Message-ID: <CA+EHjTz1dtmmZ-JcJTEw6Pv+VephGEjpcNpt8zayUeESxcKyuw@mail.gmail.com>
Subject: Re: [PATCH 4/7] KVM: arm64: Set IL for injected FPAC exceptions
 during ERET emulation
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_011839_909193_B7D1A231 
X-CRM114-Status: GOOD (  19.41  )
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

On Thu, 18 Jun 2026 at 09:00, Marc Zyngier <maz@kernel.org> wrote:
>
> On Sun, 14 Jun 2026 17:33:33 +0100,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > The FPAC syndrome constructed during nested ERET emulation does not set
> > IL. For FPAC (EC=0x1C), IL reflects the instruction length. ERET and
> > its authenticated variants are always A64 32-bit instructions, so IL
> > must be 1.
> >
> > Fixes: 213b3d1ea161 ("KVM: arm64: nv: Handle ERETA[AB] instructions")
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/emulate-nested.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> > index dba7ced74ca5..4b39363cf891 100644
> > --- a/arch/arm64/kvm/emulate-nested.c
> > +++ b/arch/arm64/kvm/emulate-nested.c
> > @@ -2777,7 +2777,7 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
> >                */
> >               if (kvm_has_pauth(vcpu->kvm, FPACCOMBINE) && !(spsr & PSR_IL_BIT)) {
> >                       esr &= ESR_ELx_ERET_ISS_ERETA;
> > -                     esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_FPAC);
> > +                     esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_FPAC) | ESR_ELx_IL;
>
> In general, I prefer retaining information that is present in the
> source exception, rather than adding arbitrary bits without much
> context, even if we only support AArch64 for NV. In this case, I'd
> rather see this:
>
>                         esr &= (ESR_ELx_ERET_ISS_ERETA | ESR_ELx_IL);

Sounds good to me. I'll rebase on 7.1 and respin.

Cheers,
/fuad

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

