Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CDFCDB466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 08:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4aLRA0sObdyQwkUt9lWTZbbvG2GGrfM8jRkE/wqXXI=; b=d+UnDfefdTBNwUGvI3rXqFBHvT
	5rIdblHFAqgNN2q5GJ3xSEucWJuZbkV1pXm3WGsOiku7CvvOeVjk33O/k5EILr0QT0bY9io85x2Gt
	0RiUnT3M3gsscKLmHdfyuTNUdqlAPe8DT+Ag2EIoDjJFPZPlT21MHaGSQq1/Ejm5exvNwpYxyaILd
	VKmgyYYeXvKi1/xZerx4errX0KgRYrSNdV+LX1iD41qoNsQ/Nio9V/kkEyX2gh342XmbIKHz+IB/q
	blBub1lTwcJy2Wklde0U7aEujAgMBgEkTug1GkmNvaD6s/5H3CCXuiUeeSbpl3wAf5ZLyOfYlhtBi
	tcNV6isw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaLv-00000004gwZ-1Z99;
	Mon, 22 Jun 2026 08:49:59 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaLs-00000004gw5-1bDf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 08:49:57 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-460166910e6so2292734f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 01:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782118193; x=1782722993; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G4aLRA0sObdyQwkUt9lWTZbbvG2GGrfM8jRkE/wqXXI=;
        b=qD0n7KTTfm/ZI5oYXUAp3+bqpUAysqUZS9Y95hcf2QPwhTzkw1j1x2WBAZk45IqAMb
         708iU31Oqwp4q1KD5zjf9WTBEtNAJWz33+S5Y0wTcH9Jbh9V4d+6BkX+oOcQacVfc2ZK
         vKIHrUtle85tMHmxwprVPi+ik46ye1sfRf4hBcd3X+XJA8tbZeiZX89QhW2Qr+EhDZdb
         F2MU9jcaSxgJ/wDB54XMDvgksyixmIrZmyByuzHui/SWoGaWrYplhIgXPOYVkoGBvb56
         RtoMhX4IUge+3vziVFGaaOrriKZEvprCl+0OstEJeBsDBnAWIMeK8XmWiLQhOA0Xp4v9
         mv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782118193; x=1782722993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4aLRA0sObdyQwkUt9lWTZbbvG2GGrfM8jRkE/wqXXI=;
        b=OsgtcWZ1rERYk1bS5EYytrKwcjn1KyE3xD6rw0VxHXMCFqdfnmZ5uB7pzpX4T1e8L+
         TfK7kW2yc7oUx3znGC/ulIacnXe5OBr6wqifLLiAzbx0a9m2uV1pHBgKYNTXEzbSnK0K
         4ORouWaCNCazy4LCwCXH617y++QhIopvj9HEzoLxsV7o2QeQuetcmr3Ul/kEwEV+CeN+
         qkfoU4c8pSV95r83A0HxQ15Fj+kmL1t5P57L8BkwAXcdAgBME5zLbwLTu8CHToU799Rn
         RKbKWwcorTNtAgC8y5tH2Zx2rcGeweT39ossVRhtBfmcCrLXeaka7K+TYlA4Lq0bBvog
         Ahpw==
X-Forwarded-Encrypted: i=1; AFNElJ/jFuS+va4HK3kTtvjS9LERWP3U1qIGiZ5YUj+Qx+5j3L1nIj015XXIAvAdCHReoVxm7QDbd7CDocBdcVzgiat6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxli5QczBCoQ+J8DrkzlN4m2305gPYb2V7FXA1QR99hjRcHpVrO
	QdFHnvSxTtK/2Q6VdbYWDtA3m5wKoXd2qsUZjByxGkF5R3yqJQBb1MJx5iFm3HE0oA==
X-Gm-Gg: AfdE7cnQI+AcCdipQGvKssy3MwdwZTC5dDiQLm+4yphWHFlXHozn97J1sjTd/bu4q1c
	zhr6Jfw7+EVctU/aEj06czCHp83M4AggNXulsqlFO7p+RYz62A2rZBbE1GNfThqUxTeYdwuKh18
	FjxW5B1KwRG0p1bXmTx6r+IJBvR5fO+6M9JU8s6FXWBdxedBjoGsF9pWGuZ57CDPr8tKVeOhhiM
	tbcx9VLV0ZJ2NCeHOzVncayr+ztgx/+aKh4u7frm73hDGS1kA0nK76Ds68cMb/NkN5BGXsutey6
	dW6Evs5zoiR8c0uziNGhgZPN3YDxwdNbj+U2A6nJGVYz+PT9DdzCGNUbjNVuglDLkiYoCXc0xa0
	khtL+BTnwUSW0I8Z57tCa+oleb/kNAmnUj3AXdUPE7VLEi1tz13HFKu/kqhY1IR6q2PIZtHOsOO
	ZoUUe2K2eZ9Xfk+UXjhPsvI4jk4g7BPYGPF8MD/DUjmUTPJGSdqyYvd0+H
X-Received: by 2002:a05:600c:19c8:b0:492:4cc7:de73 with SMTP id 5b1f17b1804b1-4924cc7df3dmr124550365e9.31.1782118192788;
        Mon, 22 Jun 2026 01:49:52 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492492338dasm195354755e9.1.2026.06.22.01.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:49:51 -0700 (PDT)
Date: Mon, 22 Jun 2026 09:49:47 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: Re: [PATCH v2 8/8] KVM: arm64: Implement lazy vCPU state sync for
 non-protected guests
Message-ID: <ajj3KzUrZZ1-2UQZ@google.com>
References: <20260619070719.812227-1-tabba@google.com>
 <20260619070719.812227-9-tabba@google.com>
 <ajVAV5ct0xdLn1KX@google.com>
 <CA+EHjTz13obYHAZYCW+zpH1RB953FseP9koXydeoLqmn6UONHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTz13obYHAZYCW+zpH1RB953FseP9koXydeoLqmn6UONHQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_014956_451556_5B54C47F 
X-CRM114-Status: GOOD (  31.26  )
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

[...]

> > > diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> > > index 54aedf93c78b..8963621bcdd1 100644
> > > --- a/arch/arm64/kvm/handle_exit.c
> > > +++ b/arch/arm64/kvm/handle_exit.c
> > > @@ -422,6 +422,20 @@ static int handle_trap_exceptions(struct kvm_vcpu *vcpu)
> > >  {
> > >       int handled;
> > >
> > > +     /*
> > > +      * If we run a non-protected VM when protection is enabled
> > > +      * system-wide, resync the state from the hypervisor and mark
> > > +      * it as dirty on the host side if it wasn't dirty already
> > > +      * (which could happen if preemption has taken place).
> > > +      */
> > > +     if (is_protected_kvm_enabled() && !kvm_vm_is_protected(vcpu->kvm)) {
> > > +             guard(preempt)();
> > > +             if (!(vcpu_get_flag(vcpu, PKVM_HOST_STATE_DIRTY))) {
> > > +                     kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
> > > +                     vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> > > +             }
> > > +     }
> > > +
> >
> > Could we remove this update here and let handle_exit_early() do the sync
> > regardless of the SError injection? One of the main point of handle_exit_early()
> > is to do things under !prempt().
> 
> Agreed on the move: handle_exit_early() is already preempt-off, so the
> guard() goes away. Not on every exit though. handle_exit_early() runs
> on every exit, and sync_hyp_vcpu() only copies PC/PSTATE/fault back
> for a non-protected guest; the GPRs and sysregs cross solely via
> __pkvm_vcpu_sync_state. Syncing unconditionally would pull the full
> context back on plain IRQ exits, which is the copy this patch avoids.
> So I will gate it on trap-or-SError and drop the
> handle_trap_exceptions() block.
> 
> >
> >
> > >       /*
> > >        * See ARM ARM B1.14.1: "Hyp traps on instructions
> > >        * that fail their condition code check"
> > > @@ -489,6 +503,22 @@ int handle_exit(struct kvm_vcpu *vcpu, int exception_index)
> > >  /* For exit types that need handling before we can be preempted */
> > >  void handle_exit_early(struct kvm_vcpu *vcpu, int exception_index)
> > >  {
> > > +     bool inject_serror = ARM_SERROR_PENDING(exception_index) ||
> > > +             ARM_EXCEPTION_CODE(exception_index) == ARM_EXCEPTION_EL1_SERROR;
> > > +
> > > +     /*
> > > +      * An SError injected below writes the host ctxt; for a non-protected
> > > +      * guest, sync from the hyp vCPU and keep it dirty so it isn't dropped.
> > > +      */
> > > +     if (is_protected_kvm_enabled()) {
> >
> > Should we test !kvm_vm_is_protected(vcpu->kvm) here, as the
> > PKVM_HOST_STATE_DIRTY is only updated for p-guests everywhere else?
> 
> Yes. The flag is only ever set for non-protected guests, so clearing it
> for a protected one is a no-op, but gating it matches the invariant.
> 
> Both fold into one block in handle_exit_early():
> 
>       if (is_protected_kvm_enabled() && !kvm_vm_is_protected(vcpu->kvm)) {
>               if (inject_serror ||
>                   ARM_EXCEPTION_CODE(exception_index) == ARM_EXCEPTION_TRAP) {
>                       kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
>                       vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
>               } else {
>                       vcpu_clear_flag(vcpu, PKVM_HOST_STATE_DIRTY);
>               }
>       }
> 
> I will fold this into the next respin.

Ah yes of course, I was hoping we could just have a switch here, just like
handle_exit() does, but that's not possible because of ARM_SERROR_PENDING().

Perhaps it would look cleaner if done in a separate function
handle_exit_pkvm_state()?


> 
> Thanks for the reviews!
> /fuad
> 
> >
> > > +             vcpu_clear_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> > > +
> > > +             if (inject_serror && !kvm_vm_is_protected(vcpu->kvm)) {
> > > +                     kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
> > > +                     vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> > > +             }
> > > +     }
> > > +
> > >       if (ARM_SERROR_PENDING(exception_index)) {
> > >               if (this_cpu_has_cap(ARM64_HAS_RAS_EXTN)) {
> > >                       u64 disr = kvm_vcpu_get_disr(vcpu);
> >
> > [...]

