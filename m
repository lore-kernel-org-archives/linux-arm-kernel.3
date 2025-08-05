Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F3DC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjX1yDKhoAMYocT3xj/0AsKA7BcblHg4H+9czODs6Ds=; b=vDhBa687YCOI2hs+uw+a8qDE2W
	DfvLtYK2HMlTB2uefg6JAowa/GxKMLz/nhatuKfBmQaUbG0PrO3Ygr+CkGk2t9X7IBCD9dSAw3i28
	Gzg46OpP7eI3DwcfB53b2YZN18LXIWhOgEIk4BHPUtZoropvmhZRA1k5llaCb9FmKWybuAIMdSvHJ
	Culss2vGDtWDhpOnk2xf6bAucR3qdFrPSHBlCcFZLD14lXx2pGMzx1SqTXrygv44+5V43+zsmEnij
	+lVkusPBmopYMuW15aPJeBiMYk49QEqF8+ifIP8hPMUY8T7pnBfBS7129i/XZltgsYVgCwQ7Wd2ao
	cdPPAD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujL8y-0000000DNkf-23lH;
	Tue, 05 Aug 2025 17:08:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJxj-0000000DChu-0VgF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 Aug 2025 15:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tjX1yDKhoAMYocT3xj/0AsKA7BcblHg4H+9czODs6Ds=; b=VobGBmACQ0+U4K3hU2f/aFut0K
	I4f8EVeBr288+O88ttQzVxBwgyBX8u9Fih9F0BIf6/xuxgaCNUEV1GThVC35Poam2kZ/9zpFJhzSD
	Y0Cad1H0/xQP6+WZr1FLsxqPvMj/9SfaWElMD6NHGzyv4YzeccYOQqus5fwS5jAHP8bsbki0nMrmb
	mZl2tdgqUtciz5AeDyBmlqabWKPEswN7xLW+SGYD46UKO50eLlYKbdy0Z9ApGri00/ULvvEi3xxEh
	WRl7z04Sb5qfsujnN4dH/AIPMtvlMjmYNDxsuXCrSs0QKBI2jt/2Pb5m4EWWZKyVoyTTCJR3dhJWL
	TYzqpGaA==;
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJxf-0000000E7Go-3dwK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:52:25 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4b07a5e9f9fso469541cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 08:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754409141; x=1755013941; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tjX1yDKhoAMYocT3xj/0AsKA7BcblHg4H+9czODs6Ds=;
        b=QR5BYSSUyRow8CA7aH3TRrMsddEbPlZwX+SLtBQwWjpHT0R/MZYkK5SmsPmOS5CMR8
         eVZEs1jp18H8KCdhLII2A7b2ga2S1XqEbMbaXwOyuceSD3o1A6Et7PwMbDHYw4b9YEcO
         PqBfllCe1bV4YehfoioJLNBLHtNqnoRfFfDTrDziURkW1fuW1vD/WyDU8TSCKH0JUHCN
         XGSWZt65h1KLWkLG2QpmXHYcCPWb6FO+wccJw7PXZAp9tKXUvg/YKYurq1Y7lVA5SNvo
         fu0u7MtSdK/xepkIzHZV3hvk5JE0mH5NnAwdQ5e2XgQa6HIW/lbZ5ETJrm4dnJerjylZ
         lMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754409141; x=1755013941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjX1yDKhoAMYocT3xj/0AsKA7BcblHg4H+9czODs6Ds=;
        b=UnB+3RQETOPUes9SvS9i/xo1PE2HEoOjNe/WxgfkS3iKS21KPoyK8w8PQSHSLaiAha
         KX+BCi5lsWFKm2wbpk53hi3qt86J/Fbb+Zmu0d0YY2VZi4ZoXoFb7TtPGWcW84ba3d4l
         NsuMrDtt7iHQ6NMiUbxVmUFvTojKwjpfVBljzmLNYAxH318WsaO6ZzNIeRRfbj+YbX5G
         gI2Gfut+ZvMPUcHBU96or7vrCL7uX6lCCHSrVrhIOo6o9AFiXUsTIN4+AUYSml1ZPiF7
         ccNaHU8bOdFj47ndsO84bXAkpD5gtkHsetcux9GFqVxJx0jyPz1uOdh+UofFeGrqzjPE
         IfmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUttXlmRpj5U8cJPz/bN5Ft/l2p4bbqmgD75cwMrUrkPAYMhVC4XokA6Bps4vQZNps36nMdDmqu8PSk4zjY++EB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Hy+/PM82eA/yJSRKKXlFMxUoNRLZbebl4LQ8/GApF4oD+Yhe
	SSvEGSq0QPDsTGBio5tcCfRFbYMI2lqgja6WYxDC1St/K2qb1fo/gBi1kopB15eHu0oXYLi3hGV
	jj0MhzEdfKTj6BTC4Op2nm59oNMz6cNRR0I5uAOjK
X-Gm-Gg: ASbGnctdz5HoaGmDan/Vu6hO6xodQFjiNHjtwmR4W2YIn1RNGqmRJL0XUgjiP7ks2QV
	HVkw75ZwHjGU3w1LnKyWIsIK88Mdt/T84os7LsJrS9PQyfFEkdYSTWhYBVHjxHZ6TZc1bM0IPis
	wy7L6fdwkPMDsKLcSH7nrVCtXHEWubGpuu6pmuiuhAEO05lrakbi5Y7ALEW/N9KmtkJCiByEVeQ
	JdIJfTW
X-Google-Smtp-Source: AGHT+IGbRK8JECKTHipEp5ScNvysVry8hhcYGrLgedBJ1sNn4eetXEItpZTcRmxnSLaIkN5bfay/z2pwDKVSvv1QGc4=
X-Received: by 2002:ac8:5fd6:0:b0:4b0:8318:a95 with SMTP id
 d75a77b69052e-4b084f118f8mr4295551cf.8.1754409140243; Tue, 05 Aug 2025
 08:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135617.831971-1-tabba@google.com> <20250805135617.831971-3-tabba@google.com>
 <aJIXerl04PDah1db@willie-the-truck>
In-Reply-To: <aJIXerl04PDah1db@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 5 Aug 2025 16:51:43 +0100
X-Gm-Features: Ac12FXyK_iYmZ8yIpjR9FKi_Zz057gBdcMrKioHmqRePthAo7QCB0owev24d6vs
Message-ID: <CA+EHjTwaz=TnTJRxZmmCNY7bJyNrmXtPdEUW65en4=khcL_aag@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] KVM: arm64: Make vcpu_{read,write}_sys_reg
 available to HYP code
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_165224_158703_211BFDAF 
X-CRM114-Status: GOOD (  30.05  )
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

Hi Will,

On Tue, 5 Aug 2025 at 15:39, Will Deacon <will@kernel.org> wrote:
>
> On Tue, Aug 05, 2025 at 02:56:15PM +0100, Fuad Tabba wrote:
> > Allow vcpu_{read,write}_sys_reg() to be called from EL2. This makes it
> > possible for hyp to use existing helper functions to access the vCPU
> > context.
> >
> > No functional change intended.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_emulate.h | 184 +++++++++++++++++++++++++++
> >  arch/arm64/include/asm/kvm_host.h    |   3 -
> >  arch/arm64/kvm/sys_regs.c            | 184 ---------------------------
> >  3 files changed, 184 insertions(+), 187 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> > index 0720898f563e..1f449ef4564c 100644
> > --- a/arch/arm64/include/asm/kvm_emulate.h
> > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > @@ -224,6 +224,190 @@ static inline bool vcpu_is_host_el0(const struct kvm_vcpu *vcpu)
> >       return is_hyp_ctxt(vcpu) && !vcpu_is_el2(vcpu);
> >  }
> >
> > +#define PURE_EL2_SYSREG(el2)                                         \
> > +     case el2: {                                                     \
> > +             *el1r = el2;                                            \
> > +             return true;                                            \
> > +     }
> > +
> > +#define MAPPED_EL2_SYSREG(el2, el1, fn)                                      \
> > +     case el2: {                                                     \
> > +             *xlate = fn;                                            \
> > +             *el1r = el1;                                            \
> > +             return true;                                            \
> > +     }
> > +
> > +static bool get_el2_to_el1_mapping(unsigned int reg,
> > +                                unsigned int *el1r, u64 (**xlate)(u64))
> > +{
>
> I guess this needs to be 'inline' too, but...
>
> > +static inline u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
> > +{
> > +     u64 val = 0x8badf00d8badf00d;
> > +     u64 (*xlate)(u64) = NULL;
> > +     unsigned int el1r;
> > +
> > +     if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU))
> > +             goto memory_read;
> > +
> > +     if (unlikely(get_el2_to_el1_mapping(reg, &el1r, &xlate))) {
> > +             if (!is_hyp_ctxt(vcpu))
> > +                     goto memory_read;
> > +
> > +             /*
> > +              * CNTHCTL_EL2 requires some special treatment to
> > +              * account for the bits that can be set via CNTKCTL_EL1.
> > +              */
> > +             switch (reg) {
> > +             case CNTHCTL_EL2:
> > +                     if (vcpu_el2_e2h_is_set(vcpu)) {
> > +                             val = read_sysreg_el1(SYS_CNTKCTL);
> > +                             val &= CNTKCTL_VALID_BITS;
> > +                             val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
> > +                             return val;
> > +                     }
> > +                     break;
> > +             }
> > +
> > +             /*
> > +              * If this register does not have an EL1 counterpart,
> > +              * then read the stored EL2 version.
> > +              */
> > +             if (reg == el1r)
> > +                     goto memory_read;
> > +
> > +             /*
> > +              * If we have a non-VHE guest and that the sysreg
> > +              * requires translation to be used at EL1, use the
> > +              * in-memory copy instead.
> > +              */
> > +             if (!vcpu_el2_e2h_is_set(vcpu) && xlate)
> > +                     goto memory_read;
> > +
> > +             /* Get the current version of the EL1 counterpart. */
> > +             WARN_ON(!__vcpu_read_sys_reg_from_cpu(el1r, &val));
> > +             if (reg >= __SANITISED_REG_START__)
> > +                     val = kvm_vcpu_apply_reg_masks(vcpu, reg, val);
> > +
> > +             return val;
> > +     }
> > +
> > +     /* EL1 register can't be on the CPU if the guest is in vEL2. */
> > +     if (unlikely(is_hyp_ctxt(vcpu)))
> > +             goto memory_read;
> > +
> > +     if (__vcpu_read_sys_reg_from_cpu(reg, &val))
> > +             return val;
> > +
> > +memory_read:
> > +     return __vcpu_sys_reg(vcpu, reg);
> > +}
>
> ... isn't this now pretty huge to be inlining? Similarly for the write
> accessor. What does the bloat-o-meter script say?

In terms of the bloat-o-meter script:

add/remove: 4/4 grow/shrink: 27/5 up/down: 16720/-108 (16612)
Function                                     old     new   delta
vcpu_read_sys_reg                            648    4132   +3484
__vcpu_read_sys_reg_from_cpu                 428    2112   +1684
vcpu_write_sys_reg                           672    2016   +1344
get_el2_to_el1_mapping                       404    1616   +1212
is_hyp_ctxt                                  216    1256   +1040
__vcpu_write_sys_reg_to_cpu                  420    1232    +812
vcpu_el2_e2h_is_set                          296    1032    +736
...
Total: Before=33050106, After=33066718, chg +0.05%

Looking more carefully at the code, I should be using __vcpu_sys_reg()
and __vcpu_assign_sys_reg() directly, since we're !VHE. I'll fix it
when I respin.

Thanks!
/fuad

> Will
>

