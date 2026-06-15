Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D05CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3phygt89mT1L7d+3MFHcmDG0z7MbIjyRqhevKospxxM=; b=nzRjiGpFnxUDWWLcBfmu6x4vOf
	jX2DhwIig4RR3ogtd1c6QSqAKfDj38x4LMlWeq2MJaOk8EtoTHItrszh3DGwFxc8nXIqB5TGGQOKy
	4esHCSv3NiicvBMyUzUTT9WEt8YousKCX3wBSg2Xu/+7IGZv833A9DKsjlSxXJvmJd1VxmVb8VJ2m
	NofZL2zwEMb1zVvnmYMU5uDxN/ZhsHzsHzxMf1OMi/xUZxueWrM50LbJsGKIvrg3z5pTo2tkde1Iq
	ecReQDLywE7DaNn8yeG5pET541/FD+iwxfzeXU3tZSv6FgDk5vEkARJeWVFHOznh3YzlMWVOy18S8
	mEP97PnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7OB-0000000EIul-0Elf;
	Mon, 15 Jun 2026 13:30:07 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7O8-0000000EIuG-2aI8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:30:06 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-51765531803so75991cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 06:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781530203; cv=none;
        d=google.com; s=arc-20240605;
        b=Sxq11kAfosu8TGNxsd01f7O/UpdhiHRpRQQR40dJuSVjXBnoRfndy9VF/IH3IHT5cW
         spfGrnEThTTOx0Sy52jovUtM5OsQYCssJA3ZMHBe8IxwHe6LMedmuFZLiDjLkdy7N4SX
         reAtQSyUvnUdUB7+awWmxllbh4EmtQnuNlyLkmmqxobb3vG+vsoIc3L4amWJmt1xg226
         PYNJOW6KvV9g4N8kmKpKE9ycztzT0ySj/1ZoRSQa1Q9U1kBJk86MrOoT+fmU57VWB1KL
         YxIzub9uI/lXxjHcHDw2zmaWMMXMZkUQqumtpPxeiSEAFqqyP2zBvnwWwpfFPEPNi3sp
         wc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3phygt89mT1L7d+3MFHcmDG0z7MbIjyRqhevKospxxM=;
        fh=V2bbN1+DzppZqSXTu7OOBsz8YnVHLjwrMAxk0RsxKZE=;
        b=bj0IsSON7L753HyQWO4sXgVz9yNRybrGkpaIjH11KKlFF56yniifUYErCMTw0IihNh
         XE2bMbrQAy0nadV4I+O2fdIeNj5Jr9nV7wnUghchIs0OP0Lanrj0iOxbWA3fYO5HtkQG
         we81LSQ3dgJXaGyKhQPcIun6z22K/QyFfnHX0lIZKPFoH+2bEoYRvC+VI34KLUV49AVd
         h5wBXwcMernUxy6kYRtNHlYpoWlkokJ7QFxWQhDbQPSe98UiFKC2i34qtYpAU5L0yH6n
         ghH4sWFlGoR8WDFidrdwOq/bMZYYwiBlj7xp/8qTzHWDm5FIYv3CCnlYc8CO4uFhtGVT
         7YMQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781530203; x=1782135003; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3phygt89mT1L7d+3MFHcmDG0z7MbIjyRqhevKospxxM=;
        b=lVS+CFNt3DXfkJhIwb4faCX6Wzp9rmmRElv8nBfm5yjl7TpPiHUm3aGFL7OtAgRJhE
         eP4/Pkz4Sb5lvGorWXWJ6KEfcX0t0IzWmek6CRVPBhrAwAB8NbRjHd4COVAQltNZg1Xy
         UbfjbOEqaqK3ho4jNqzYsSA/+O6tPCOweQGt14iZ48PSKPBi3UaWpYUu396GZo148asu
         u07f5fw88XRVF0yAZV3IgK5zCYtEuUmC3y2lc5Av3vT0CegLKC5k2cjqC/9qA3uWf47F
         cizXMRPxOQVExoYn3YmUFLEjjH2j1pcy2M5KnqcNKQieMXwItjhbg3qjMHR4CnA1y3pB
         cXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781530203; x=1782135003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3phygt89mT1L7d+3MFHcmDG0z7MbIjyRqhevKospxxM=;
        b=CNUw6sIklVI+B1Qk2MOm/v8Ohvjl97Fde4Ql+GMjEyNvf1tdPenpu2oGsvWTgvv8FM
         tEizl+CqLSsyhlUYpMKZgvNbcKzaevLWinr0XN/WdM7MK/JFkDOtzTt+tMEy8r4KS3kJ
         aE+8wMKcLqnVOcPfjJPw0l6zNPzJNlo0YLcZTMmez3OYofZe9gG8iE+iqO/X5Wm8lvnP
         RGO22wLqMDiVT5IOwvSys4I/W0XXXZoCk7We0O/mWs34FLKLofR6/tzAd6P2S99p+cP2
         s+EQpl7PrV/1Eschz/St15bfFC9jVnAfvGvpFPB69tkSzcQ286hgbtghh2k8I1ermWcA
         gZRA==
X-Forwarded-Encrypted: i=1; AFNElJ+dzmA8SvRoL1f1IgpuFOJaVFSijRVvPYq8UezNRwEfpfbTUHUljqFkRSdNFc5msVUI3wspfwlz1km595rfPSL2@lists.infradead.org
X-Gm-Message-State: AOJu0YwW0MvnFWA0lLXj9S13QRO0lMrFG4Y7tmrpWwt9+hG4U/extJUX
	4zGlC+kLdY6Q8wKPsAJeEQ5oSBcpFAaNczfBZ4m7PX0JpDHhrW9IOskFoBDA4mtfQGNatWiPcWu
	YzTZkuC+hZ6m8FuqBimhBsuZV46Bdp0/DmhMFzFzkH4goBu4eXMEIcMUypI0=
X-Gm-Gg: Acq92OHYijTJWVlAUPy6OHuBw7tJ8PJ9+UMkf6/kRToZC4BXVnJpCd5ZXbdreEMM2tu
	bw7GyeRgWSpwO1sJDMta+RpqF2z5ZQd08QuUyxmma/KwNCCY31M8pmWQ8bZtjzgpb5zPuodwv+5
	m1WeO1cnMXw/7nBNBvR7oCLrosAH9/9639VVth206OIbKSFi4ygfR288TIngMug3jXsRQsjleMl
	zjS9nc71ilRXlNPQCNU9zpc9g2+c97X72MoWMynYG05I56Az8UGcqIgv8w1CgAuTd65ksRE9grA
	yLJ2MrTb
X-Received: by 2002:a05:622a:1188:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-519872df71amr1731631cf.5.1781530202283; Mon, 15 Jun 2026
 06:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com> <20260612065925.755562-6-tabba@google.com>
 <ai_5_CoRm-LdoVMm@google.com>
In-Reply-To: <ai_5_CoRm-LdoVMm@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Jun 2026 14:29:24 +0100
X-Gm-Features: AVVi8CcrTMGo9YYeBFMqIsQ3CD-jzDAcCVBgdTfRMO0b7ViZFUlAAkK2kzEwfHA
Message-ID: <CA+EHjTyRR3Rg3BT4guUy_VKw9jgZawKUhg7tv_H8iqSGW5Lsvw@mail.gmail.com>
Subject: Re: [PATCH v1 05/11] KVM: arm64: Make vcpu_{read,write}_sys_reg
 available to HYP code
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Per Larsen <perlarsen@google.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_063004_679762_35E16A05 
X-CRM114-Status: GOOD (  26.37  )
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

On Mon, 15 Jun 2026 at 14:11, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Fri, Jun 12, 2026 at 07:59:19AM +0100, tabba@google.com wrote:
> > The vcpu_{read,write}_sys_reg() accessors are host-only, so helpers
> > built on them such as kvm_vcpu_set_be()/kvm_vcpu_is_be() cannot be
> > shared with hyp code. Add _vcpu_read_sys_reg()/_vcpu_write_sys_reg()
> > inlines in kvm_emulate.h that dispatch on is_nvhe_hyp_code() to the
> > host- or hyp-side accessor. A follow-up series uses this to share that
> > emulation code at EL2.
> >
> > No functional change intended.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_emulate.h | 22 +++++++++++++++++++---
> >  1 file changed, 19 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> > index 5bf3d7e1d92c..aed9fc0b717b 100644
> > --- a/arch/arm64/include/asm/kvm_emulate.h
> > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > @@ -506,6 +506,22 @@ static inline unsigned long kvm_vcpu_get_mpidr_aff(struct kvm_vcpu *vcpu)
> >       return __vcpu_sys_reg(vcpu, MPIDR_EL1) & MPIDR_HWID_BITMASK;
> >  }
> >
> > +static inline u64 _vcpu_read_sys_reg(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
>
> I am not sure a single underscore is widely used in the kernel.
>
> Why not move __vcpu_read_sys_reg() and __vcpu_write_sys_reg() from exception.c
> to kvm_emulate.h? especially this already checks has_vhe().

Good point. has_vhe() already returns a compile-time constant
in hyp code and a runtime cap check at EL1, so it works in all
contexts. I'll move them to kvm_emulate.h and rename to
kvm_vcpu_read_sys_reg() / kvm_vcpu_write_sys_reg().

Cheers,
/fuad

>
> > +{
> > +     if (!is_nvhe_hyp_code())
> > +             return vcpu_read_sys_reg(vcpu, reg);
> > +
> > +     return __vcpu_sys_reg(vcpu, reg);
> > +}
> > +
> > +static inline void _vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg)
> > +{
> > +     if (!is_nvhe_hyp_code())
> > +             vcpu_write_sys_reg(vcpu, val, reg);
> > +     else
> > +             __vcpu_assign_sys_reg(vcpu, reg, val);
> > +}
> > +
> >  static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
> >  {
> >       if (vcpu_mode_is_32bit(vcpu)) {
> > @@ -516,9 +532,9 @@ static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
> >
> >               r = vcpu_has_nv(vcpu) ? SCTLR_EL2 : SCTLR_EL1;
> >
> > -             sctlr = vcpu_read_sys_reg(vcpu, r);
> > +             sctlr = _vcpu_read_sys_reg(vcpu, r);
> >               sctlr |= SCTLR_ELx_EE;
> > -             vcpu_write_sys_reg(vcpu, sctlr, r);
> > +             _vcpu_write_sys_reg(vcpu, sctlr, r);
> >       }
> >  }
> >
> > @@ -533,7 +549,7 @@ static inline bool kvm_vcpu_is_be(struct kvm_vcpu *vcpu)
> >       r = is_hyp_ctxt(vcpu) ? SCTLR_EL2 : SCTLR_EL1;
> >       bit = vcpu_mode_priv(vcpu) ? SCTLR_ELx_EE : SCTLR_EL1_E0E;
> >
> > -     return vcpu_read_sys_reg(vcpu, r) & bit;
> > +     return _vcpu_read_sys_reg(vcpu, r) & bit;
> >  }
> >
> >  static inline unsigned long vcpu_data_guest_to_host(struct kvm_vcpu *vcpu,
> > --
> > 2.54.0.1136.gdb2ca164c4-goog
> >

