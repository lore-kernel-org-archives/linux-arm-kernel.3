Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D24DD5806E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 12:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7ZsJLgH7EJzomT/OPbscdiTb7j7tI+Uck1UKkacBNc=; b=tqW6koCNBe7Jizmu9cR6OS84mY
	Kp/R1wZLel31kibBPhvgJ5QnIA1vxTzO+dEtU/owKCudxzYdZB27Nqq91sWg8gWofEmIyUgFMVTcw
	XZJF/XpENb4iE0MuvpC2jab/GBfhZ3ZUtW4EgBHBpT2rwTXVVWJd1FGfnkkLlN1EIXodkVkuwcvtZ
	EOwUBd4YMKnSY/JgrMBMQ8HZJx08+v3ygUop02AuWPjJSgvrp576idND0K3uJ2d9BtOA5qzsqk43u
	JJmCskk8LdL7Bjvs5+gIJQ5XA1ZFq716KJIns23TRVBe2/LWVqdCIrLjy9cY55rS0XNQ7cUTXnjeD
	e9zStosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXnH-00000007xds-2Ruy;
	Mon, 25 Nov 2024 12:02:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXmK-00000007xXd-17xk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 12:01:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-432d7d5fcd6so80405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 04:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732536078; x=1733140878; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w7ZsJLgH7EJzomT/OPbscdiTb7j7tI+Uck1UKkacBNc=;
        b=TxIA8HvxEC/kyn/9RjQiBrmy0bScYu4zRxWG/V3+X2E4Xz3GyAHONlsMqIhGxI5ZtQ
         xNvSXYU2guHlgrfNTyw59A+hnBM8hbSPc5tgackqUWUWJ2Icvvc8pX4iRhQ8jAhXs237
         gNzWJPfNC6+B0k0z4Gd9jVsXaaRjAmHbPGxaxNstM5PKD3fyyQce0ijClJWS1LR76yd4
         eraWvpJskv3TbHklzOZOwA8TpWPGrv31Ct0RwGZIDkcQhgmtfmwb1xYKF+92crLk3HCd
         +Pcbz96r+m09rvIN9HnL2yI8J8s15KODXNwF6MHlIPQ4Wl1stjxDeFRzzlSTF4fuOlnY
         cFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536078; x=1733140878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7ZsJLgH7EJzomT/OPbscdiTb7j7tI+Uck1UKkacBNc=;
        b=m4nUurP20d3pz+3BNwrABdPRlVV5phHPrNhWwy4AF6zvnh67eFROg+ADSIGsOvydax
         A6+dbHCI3WDon3W6sJw7jc/HcAcJMf7nQxUh6tbV4j0pJZMd0JL2o8cZ9V+WfPeTqE7V
         h7cZfpsn+AyHzvcDWDnE/IGYcMMtJmqqKJwmgdyuI9BLxFiwQWAxY6iKBrshU/QCEadJ
         +rxXAsdl2aio/o9qNYYC0z/40cqvCjRcurBjBc91vUgc/gf1MVB0YjtfUTtCEW1d+HEg
         5H4D2XTxld9ijWCi8ss2Rwu0bbt8SJHt6tsCCMJQq/Ykdj1tHV6O9j8NzPt2GSj5BWPq
         7KCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWog4EEQvnw0RytmTqQ++hX4KL8JlWpZMuOOt1iiXZ1CeYHMHgEQ0mH9PU3eryjyH0W2YcZ27cgS8sMOiImE/Wg@lists.infradead.org
X-Gm-Message-State: AOJu0YyhQX8NUJg9AWPu0SzFrH5lF5C0VtHLQSTPxw3Aug24dClqxp0T
	o+BHhT4/+zZRK7c9jDvtQIvQZAxnTZSLYxdhndV/3gC7Usha9GcR1RWA4kTvv4IM6kvguaofvnC
	/GKxJQJ/YY8SCQa4fha2KKg/LOSDGWVNdBblH
X-Gm-Gg: ASbGncsg/FUhm2FK38NRJmdaHiK5pEqPg7/UnG/ILARQNfXjFsVnRJFwr41GLIHOVG+
	jsJDqHz4E8h/7CKrczD2FpLvcXX4sLw==
X-Google-Smtp-Source: AGHT+IGOoaM7iUnf0v0aEQenNPMbZX7T/9Rp6+XXRcBOMI/kWtHC1wFoi9txS3/EaMmCMufV90GE3ir42ciJ7WuyrRM=
X-Received: by 2002:a05:600c:4f06:b0:42c:9e35:cde6 with SMTP id
 5b1f17b1804b1-4348bdae14amr2761825e9.2.1732536078343; Mon, 25 Nov 2024
 04:01:18 -0800 (PST)
MIME-Version: 1.0
References: <20241122110622.3010118-1-tabba@google.com> <20241122110622.3010118-8-tabba@google.com>
 <86jzcsvmba.wl-maz@kernel.org>
In-Reply-To: <86jzcsvmba.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 25 Nov 2024 12:00:42 +0000
Message-ID: <CA+EHjTwuTgH1gdoSuZu_A0MxOuFnt3PGTBdMAnfMnSOh8QAQLQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] KVM: arm64: Rework specifying restricted
 features for protected VMs
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, james.clark@linaro.org, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_040120_308029_B0CDA2BE 
X-CRM114-Status: GOOD (  29.44  )
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

Hi Marc,

On Sun, 24 Nov 2024 at 12:38, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 22 Nov 2024 11:06:17 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > The existing code didn't properly distinguish between signed and
> > unsigned features, and was difficult to read and to maintain.
> > Rework it using the same method used in other parts of KVM when
> > handling vcpu features.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  .../arm64/kvm/hyp/include/nvhe/fixed_config.h |   1 -
> >  arch/arm64/kvm/hyp/nvhe/sys_regs.c            | 356 +++++++++---------
> >  2 files changed, 186 insertions(+), 171 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h b/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
> > index 69e26d1a0ebe..37a6d2434e47 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
> > @@ -198,7 +198,6 @@
> >       FIELD_PREP(ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_APA3), ID_AA64ISAR2_EL1_APA3_PAuth) \
> >       )
> >
> > -u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id);
> >  bool kvm_handle_pvm_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code);
> >  bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
> >  void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > index 3aa76b018f70..cea3b099dc56 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > @@ -28,221 +28,237 @@ u64 id_aa64mmfr1_el1_sys_val;
> >  u64 id_aa64mmfr2_el1_sys_val;
> >  u64 id_aa64smfr0_el1_sys_val;
> >
> > -/*
> > - * Inject an unknown/undefined exception to an AArch64 guest while most of its
> > - * sysregs are live.
> > - */
> > -static void inject_undef64(struct kvm_vcpu *vcpu)
> > -{
> > -     u64 esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT);
> > -
> > -     *vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
> > -     *vcpu_cpsr(vcpu) = read_sysreg_el2(SYS_SPSR);
> > -
> > -     kvm_pend_exception(vcpu, EXCEPT_AA64_EL1_SYNC);
> > -
> > -     __kvm_adjust_pc(vcpu);
> > -
> > -     write_sysreg_el1(esr, SYS_ESR);
> > -     write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
> > -     write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
> > -     write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
> > -}
> > +struct pvm_feature {
> > +     int shift;
> > +     int width;
> > +     u64 mask;
> > +     u64 max_supported;
> > +     bool is_signed;
>
> Most of this is very similar to struct arm64_ftr_bits. Can you align
> the types and names with it? And do you really need 'mask', which can
> be derived from shift and width?

Ack. I stored mask since it's already there in sysreg-defs.h, but I'll
recalculate it.

> max_supported as an unsigned value is also potentially troublesome for
> signed features. And does it need to be 64bit wide?

It doesn't need to be 64 bits. I will make it a u8. As for the sign,
the function that handles it, get_restricted_features(), uses bit
manipulation to handle it, since the sign bit is bit 3 for most (or
all) id regs, rather than rely on the sign, which is why I went with
unsigned.

> > +     bool (*vcpu_supported)(const struct kvm_vcpu *vcpu);
>
> We really need to find a way to kill this. The two features that stick
> out badly are SVE and PAuth, and I don't see why we can't eventually
> track them at the VM level instead (despite the userspace API).

It is actually being tracked per vm, and only calculated once per vm.
I went with the name vcpu_supported, since the functions (or macros)
it will point to are vcpu_has_ptrauth() and vcpu_has_sve(). I could at
least rename it here to vm_supported(), in anticipation of a wider
change.

That said, this should be fixed for all of kvm/arm64. I'll see if it's
a simple patch to add to this series as a respin, or something for
later.

Thanks again!

/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

