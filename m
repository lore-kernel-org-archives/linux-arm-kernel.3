Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB5AC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PxF5y08A38YpdaMcqzOlRCenhTDSuzrVTjgj8T8DAM=; b=RnsqjMpIhAp7GUotmpCOM/XTyR
	queyI8eKdfnmCa1Jq7PclxleVDweRL29mGzDsez7n3QzvizYGh/zxgaF4bRRUo9C+jcGaz8YC2mqo
	TsfT2eIZc9bZFiAY0mmMjLKRH64/5xu6HlhnMtZERISQpJsFFSiBo6Y67NXs/RGKEZ2Z+CHOXDWjf
	lbZBltgGCGnh3UrGAnxVZWDTJQTUyJJCFufRWk8aqXHltOaenbS8YhTgAgoQxqMbPcn1nmf0FcfKt
	7f/Vv5NK2Ta9ptrpdcOAKNktSwlgRnHWIIox75gCnzJ0qaTCAx9SwSi7xg2qSurL7Ex+06lYEpu+N
	BZ11JonA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujMgj-0000000DaxZ-0ALN;
	Tue, 05 Aug 2025 18:47:05 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujMe6-0000000Dage-40Lc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 18:44:24 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4b0673b0a7cso99881cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 11:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754419462; x=1755024262; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0PxF5y08A38YpdaMcqzOlRCenhTDSuzrVTjgj8T8DAM=;
        b=bklKzYyzuowIMkY2ddDc6HTTYRxxt1YGRirNn6FJdx3ZE4ulGoApdeclsfIEP9dNiO
         hieclbVrDYXEkEexgT7U0D4vDkmDCVW76Pkgozg7LNDdmNqnhlDcm4Xv9ow4qHVxUq+E
         wR9TnotP00jC14CDYGFQrAYdFJkbtblDcRlUISC2WuzPqzYr8onzefQo6gSnO2zFmwlg
         pbSvPF3XUO3aLUse/+yh5tbHiexn2vkU2x6BKwSV4H/qdOu+fVMjG3LGTkeklb/k93kh
         NdLHP3ynmZcgnNVPQP5uPeDH0bJXxaj22TCJr2lLNppPvSUcZLGQ+bKjAJ8rcQsSd/R0
         +TLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754419462; x=1755024262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0PxF5y08A38YpdaMcqzOlRCenhTDSuzrVTjgj8T8DAM=;
        b=t4dUytCzzfXiL4tBsLWyEix54Q0ygOaRSNaymVHobZcUCoC8eM9zHRiJ0roi/mczEu
         +m1jOhrei0Pq3Z4KEXC+9LXfMNeJ1SDX7vmUhIHTh/Ydyd3GRPzBif20xqwdsPfnHD30
         6tykXzB8zl54p21UVLulTrZ7oAdG2zls5JtAtyzw2Faw1iAtnqh9TeFuweS2fY0EaHxd
         zcabDHEIg8QBmYYmuccz7ESi5p34m2EzzUS5zGZmoK4qrlDVcInU96RcLj+suXCFf51U
         KgYjVbBLENXy+zIpMRHXiLpZbjcFl3wFHAECD9ZjjCPpBJze6x79rUpGZaeLkurNJiBe
         HRoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyQuQc820EIkbQrE9IXluKiyIWdYomgdMbUVZrjk7p3CrelrjRYZNhwWtYrrPzlXTKjf4sGkUBedclhpob13FF@lists.infradead.org
X-Gm-Message-State: AOJu0YybNIoNG8yT5pb+c3QyXoOMSaGqrxOtsZA9nEeml5gMv/CQTS5e
	EL5tFEAsuX5byfng5qa8meNkOCES58mpp3TJw7PWVJCKRJ9xJUIZjfr5q4s2gj4rIvWx4nXrRrD
	RC/j5POs3Q/1vdUHaYAnWl9vc2KTSJvbxTHylXpLR
X-Gm-Gg: ASbGncvQkHtNJZtmZKBEoWxbm64tWVNloaiaMIhmIvch/Ftrep5cnxD+BQ9QYuN41KR
	c4iMnP4hAf/ExuA5wyZK+RDmMPm6hpeM/NF4uNLaFEP4NezeMZFtaJFNNqmAOLc92B5OjILt22m
	C21URmnlqtWLrtFojYB5cEU8C/NPNIP7+kFifQYVmf88mTpnxb4H6xMQ6BDyQrrp0dtQV/u4A1X
	y6G3MWH
X-Google-Smtp-Source: AGHT+IG8aoeJB7I0f6JIa+/eNsj12PpL/1xAQoEUxQjKL9ZpIzyNXRrY+GpXP6I6aBoKI2tK45JiQ72Yo2WxAC/IrRU=
X-Received: by 2002:a05:622a:1a03:b0:4a6:fc57:b85a with SMTP id
 d75a77b69052e-4b090697c64mr418011cf.14.1754419461429; Tue, 05 Aug 2025
 11:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135617.831971-1-tabba@google.com> <20250805135617.831971-4-tabba@google.com>
 <86cy99a9wp.wl-maz@kernel.org>
In-Reply-To: <86cy99a9wp.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 5 Aug 2025 19:43:45 +0100
X-Gm-Features: Ac12FXwO9qw_EV3ciLp2SE0fBGATXymKWD32AKnjSHnkZm8XRrtP_adt5aM1ga4
Message-ID: <CA+EHjTzGLLR3rM5Dmn8S0bZ5mugB9x2e-_-nDp_zKNB77F3J2g@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] KVM: arm64: Sync protected guest VBAR_EL1 on
 injecting an undef exception
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_114422_999329_835CCA2A 
X-CRM114-Status: GOOD (  29.45  )
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

On Tue, 5 Aug 2025 at 19:41, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 05 Aug 2025 14:56:16 +0100,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > In pKVM, a race condition can occur if a guest updates its VBAR_EL1
> > register and, before a vCPU exit synchronizes this change, the
> > hypervisor needs to inject an undefined exception into a protected
> > guest.
> >
> > In this scenario, the vCPU still holds the stale VBAR_EL1 value from
> > before the guest's update. When pKVM injects the exception, it ends up
> > using the stale value.
> >
> > Explicitly read the live value of VBAR_EL1 from the guest and update the
> > vCPU value immediately before pending the exception. This ensures the
> > vCPU's value is the same as the guest's and that the exception will be
> > handled at the correct address upon resuming the guest.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > index bbd60013cf9e..b34b10be1ad7 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > @@ -253,6 +253,7 @@ static void inject_undef64(struct kvm_vcpu *vcpu)
> >
> >       *vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
> >       *vcpu_cpsr(vcpu) = read_sysreg_el2(SYS_SPSR);
> > +     vcpu_write_sys_reg(vcpu, read_sysreg_el1(SYS_VBAR), VBAR_EL1);
> >
> >       kvm_pend_exception(vcpu, EXCEPT_AA64_EL1_SYNC);
> >
>
> There is something I don't understand. vcpu_write_sys_reg() is only
> useful if you make use of the SYSREGS_ON_CPU flag. Which is only
> driven by the VHE code (in arch/arm64/kvm/hyp/vhe/sysreg-sr.c).
>
> As a consequence, this only writes to memory, since the flag is always
> false, and we take the following path:
>
> static inline void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
> {
>         u64 (*xlate)(u64) = NULL;
>         unsigned int el1r;
>
>         if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU))
>                 goto memory_write;
>
> [...]
> memory_write:
>         __vcpu_assign_sys_reg(vcpu, reg, val);
> }
>
> My conclusion so far is that you only ever need to write to the shadow
> view of the register, and that the previous patch serves no purpose.
>
> Am I missing anything?

No, you're not. I realized that when I replied to Will (patch 2). I'll
drop that patch and fix this when I repin.

Cheers,
/fuad

/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

