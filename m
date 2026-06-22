Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA96CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4c6b6JJaSBLlb1nvUx6oYOg7Wq9Q5dUNaZHbrnZFblw=; b=c2bZmmfmM9Vwi0I78ef5yqMgM+
	uKl+WXVajz46MjCsG2aVTbVd5a3kgo9ifRt5hgFSiNcovCWr4gJWE73iGedf7Y2o5mAupS640LpfR
	oeQO2wYXiURKwOUVj22uIzjSZUE0E6fyFB1oe216ejvoCM1C1Dkcn84tfMuLFJaeWmTumIKmhribj
	yJ78IL351NnC6rqULwncxGxjHAIujdLrYpa6CtCN7drXBvKixguNrbQDUKxnZq/dhZ717NtEYP4yo
	eIQYXNMN46vD9891nXvDFWJk3XXBJXNHMgvphH7qzW8j8tORZE/HEsZlO4anZeCKbwoVJ1DhWcF2G
	oaORtb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbg5-00000004oXe-3Yut;
	Mon, 22 Jun 2026 10:14:53 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbg3-00000004oXJ-2vQd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 10:14:52 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5177d1ff061so502511cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 03:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782123289; cv=none;
        d=google.com; s=arc-20260327;
        b=MyXaFoX9sZu/8pkjYOHQxRLQdhRgaN710/sPdrQKFCbqvDmMCfgzP8v14E7soAGsP3
         Q9LzBbw0jQBsy97vKnk/iPHoJRxIyhGPlzylzFKMDIuLz96wlJG7OkXMAC2/PGJCW/UX
         xbvHlYbKRe+u05y84JICumyfusgUPupu67nf6pM+waJp80Kx7+Yw5KrBI7QdAfV/7Mad
         Ez18YAAy4JE/0QjWm7MrS3MgHPa4coDcreXOy1XoUil2bcyXAL1+/ZB8LERYfIHFAEzn
         JB/eeilBg3YYsONq1bZVDWOPSatqQAY/P2aD/IVLJs5s5qAeRI2d1+YAGNn0tM8OrA3w
         xbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4c6b6JJaSBLlb1nvUx6oYOg7Wq9Q5dUNaZHbrnZFblw=;
        fh=3TlBPhaHArl+M0SSifsQNuKYKPO8IHWAtiEz/Sv2MNE=;
        b=o21IwT5G/qo/aC8wpqoxJq6ktI21F+j49iu+a/YDrXeiZwCwhR8tLIscHLH4QyhMZt
         Hu4TX+ampQddqGAUp9hulrxht2FmxnSOXMS0jPZx0KPub50k0AQMDKviR7aSFxDSDcx/
         M/MEV0viCG5RL4D6P9DP8cS7rQF6sLxV9I4rmMIUlZAGOsM7DTj2B/j4jFl5QPSmA4ab
         9dMJJG5JWgDLny1z5QupeQ/7fwHBYcwQf8QsjLLy5QK+u11UkPgQwUHdbmC5BCoqEL+j
         O+m9L4NYguo2d0FSCDRTwsoVNA5AkNls6vA5FciQYOGZBQP+02CNw3L7R5I04yL+4F2Z
         OxDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782123289; x=1782728089; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4c6b6JJaSBLlb1nvUx6oYOg7Wq9Q5dUNaZHbrnZFblw=;
        b=jbsWN+LqPnzeU4iI0pqOCPTN3SHdVcHYrO7TUeK1yXBGBOCGUc7AYsPsLnbMnRX4zS
         UEQGTgqj9q73MiclQNDApo9o7hhf9TT4Tf7qSHi9u4DiOxwy/6vVl5KQQD1rUVrkzKHi
         sD5w71wrLQdmL1oSSvGjHD0aMtqCA5UxVcHJaN0ktHQ/n+xGZInFDZgiAFW0pe5WzXD+
         GDj6bX209oj5N7/2gGg7vcxlNGRVr8iJRXXcUh3au0pM5j7KOzRgLfx/If4c1WMiJxCh
         Y73e8854cnGFFugv1Wk9i4pmtZAd+/e40fIrmkh/ruyQPnNDk2ofhjfXFxmC0nveC5im
         r+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782123289; x=1782728089;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4c6b6JJaSBLlb1nvUx6oYOg7Wq9Q5dUNaZHbrnZFblw=;
        b=n0ZMUwFNxv5lxSlFCGe1ubd3VcpJ/IxAR7WWi0/nij+CVDQ017l4FzBgbWyVo41mqv
         9WsY0yc6Ir7/kx5E8/rdxu4enSJXizBbRZmnBS8P12PywmlrQYy0qWVwgffFzyzLYEov
         9ybheKZ+iTFhzBz8TiPGF0IYdKccyycEEq9afzZCDb5Q7wx8JowGsaZY7lu8KKeHuqsb
         FZ9D5egFOJHvAltO92fi943ssCEPwlAcBCU6Fwp75accWD9ift4Q9jtIl/EaZIq/3r8l
         sB7yWUc/4ZucSlfa45yfsSq5wswpvh5+rw8+nsfUZC8eCnx0uSixxi6pGw/6YyWcP643
         LjKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bvAHsOXl8sAN3w/slr7I+LHblhZB9euB6EZt+ocf926y3SPEf5+cb5+uBojIX+iNZvPlTIy4/JPugkdX9+nva@lists.infradead.org
X-Gm-Message-State: AOJu0YyurbNVCMHhU3TUSl0x7ihenTfSdVYdjI6Slqn8VufRqS+XDtd5
	pN7KT0JBshvuypeZw+w7HHfrrHwn/k4TT3Gw/09a+gZC5s+n18qhZ2PJbQEwSAg4aEFKJgaikMb
	xfdLPw07wY5vV8UnihijqDaX1rdAcj7YU/8seTrEz
X-Gm-Gg: AfdE7cksk436VF9Iie98IV3cNf1YQnp92bwDdtoFUhqu95e/P5tR5/AjaqZjmngIRmr
	3dES+7LQ0fY9WZZ4azrHZ+xhwS1FsCuitLhe/rTBTlSN1Z34CCPr4Sxsmt4PzTHs/u+b71zVh95
	Ry1Z6W22L/yJ+zDNMzsPipLvsPdYdVv5NDe6KiMFKjCTYbyMGerfzLfvgsxXlQWvLl5110EU2XA
	QRwp4HbWkKoNajElUYGUYJQ/Elv4vu4AbT3qgfHAjTA9rS1mw8Xn5xh6Yuhln8Qy2WLlxcBLpet
	DqEFIPqB
X-Received: by 2002:a05:622a:2b08:b0:517:99ea:ab7a with SMTP id
 d75a77b69052e-519e4ab67d5mr23266481cf.26.1782123288572; Mon, 22 Jun 2026
 03:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260619070719.812227-1-tabba@google.com> <20260619070719.812227-9-tabba@google.com>
 <ajVAV5ct0xdLn1KX@google.com> <CA+EHjTz13obYHAZYCW+zpH1RB953FseP9koXydeoLqmn6UONHQ@mail.gmail.com>
 <ajj3KzUrZZ1-2UQZ@google.com>
In-Reply-To: <ajj3KzUrZZ1-2UQZ@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 22 Jun 2026 11:14:11 +0100
X-Gm-Features: AVVi8CdpMK8FMnv9bhBXfcc28TenXa4-d-BsEgeEJUz6o79oKv2h1yruz0fVKMA
Message-ID: <CA+EHjTwB8OGpK1sJwNXktqDXYhweujUTKfdOdRggsKYF5srk5A@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] KVM: arm64: Implement lazy vCPU state sync for
 non-protected guests
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Quentin Perret <qperret@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_031451_779814_701AA1E6 
X-CRM114-Status: GOOD (  34.18  )
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

On Mon, 22 Jun 2026 at 09:49, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> [...]
>
> > > > diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> > > > index 54aedf93c78b..8963621bcdd1 100644
> > > > --- a/arch/arm64/kvm/handle_exit.c
> > > > +++ b/arch/arm64/kvm/handle_exit.c
> > > > @@ -422,6 +422,20 @@ static int handle_trap_exceptions(struct kvm_vcpu *vcpu)
> > > >  {
> > > >       int handled;
> > > >
> > > > +     /*
> > > > +      * If we run a non-protected VM when protection is enabled
> > > > +      * system-wide, resync the state from the hypervisor and mark
> > > > +      * it as dirty on the host side if it wasn't dirty already
> > > > +      * (which could happen if preemption has taken place).
> > > > +      */
> > > > +     if (is_protected_kvm_enabled() && !kvm_vm_is_protected(vcpu->kvm)) {
> > > > +             guard(preempt)();
> > > > +             if (!(vcpu_get_flag(vcpu, PKVM_HOST_STATE_DIRTY))) {
> > > > +                     kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
> > > > +                     vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> > > > +             }
> > > > +     }
> > > > +
> > >
> > > Could we remove this update here and let handle_exit_early() do the sync
> > > regardless of the SError injection? One of the main point of handle_exit_early()
> > > is to do things under !prempt().
> >
> > Agreed on the move: handle_exit_early() is already preempt-off, so the
> > guard() goes away. Not on every exit though. handle_exit_early() runs
> > on every exit, and sync_hyp_vcpu() only copies PC/PSTATE/fault back
> > for a non-protected guest; the GPRs and sysregs cross solely via
> > __pkvm_vcpu_sync_state. Syncing unconditionally would pull the full
> > context back on plain IRQ exits, which is the copy this patch avoids.
> > So I will gate it on trap-or-SError and drop the
> > handle_trap_exceptions() block.
> >
> > >
> > >
> > > >       /*
> > > >        * See ARM ARM B1.14.1: "Hyp traps on instructions
> > > >        * that fail their condition code check"
> > > > @@ -489,6 +503,22 @@ int handle_exit(struct kvm_vcpu *vcpu, int exception_index)
> > > >  /* For exit types that need handling before we can be preempted */
> > > >  void handle_exit_early(struct kvm_vcpu *vcpu, int exception_index)
> > > >  {
> > > > +     bool inject_serror = ARM_SERROR_PENDING(exception_index) ||
> > > > +             ARM_EXCEPTION_CODE(exception_index) == ARM_EXCEPTION_EL1_SERROR;
> > > > +
> > > > +     /*
> > > > +      * An SError injected below writes the host ctxt; for a non-protected
> > > > +      * guest, sync from the hyp vCPU and keep it dirty so it isn't dropped.
> > > > +      */
> > > > +     if (is_protected_kvm_enabled()) {
> > >
> > > Should we test !kvm_vm_is_protected(vcpu->kvm) here, as the
> > > PKVM_HOST_STATE_DIRTY is only updated for p-guests everywhere else?
> >
> > Yes. The flag is only ever set for non-protected guests, so clearing it
> > for a protected one is a no-op, but gating it matches the invariant.
> >
> > Both fold into one block in handle_exit_early():
> >
> >       if (is_protected_kvm_enabled() && !kvm_vm_is_protected(vcpu->kvm)) {
> >               if (inject_serror ||
> >                   ARM_EXCEPTION_CODE(exception_index) == ARM_EXCEPTION_TRAP) {
> >                       kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
> >                       vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> >               } else {
> >                       vcpu_clear_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> >               }
> >       }
> >
> > I will fold this into the next respin.
>
> Ah yes of course, I was hoping we could just have a switch here, just like
> handle_exit() does, but that's not possible because of ARM_SERROR_PENDING().
>
> Perhaps it would look cleaner if done in a separate function
> handle_exit_pkvm_state()?

Agreed, that reads better. Pulling it into handle_exit_pkvm_state()
also gets inject_serror out of handle_exit_early(), which only used it
for this. Done for the next respin.

Cheers,
/fuad

>
>
> >
> > Thanks for the reviews!
> > /fuad
> >
> > >
> > > > +             vcpu_clear_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> > > > +
> > > > +             if (inject_serror && !kvm_vm_is_protected(vcpu->kvm)) {
> > > > +                     kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
> > > > +                     vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> > > > +             }
> > > > +     }
> > > > +
> > > >       if (ARM_SERROR_PENDING(exception_index)) {
> > > >               if (this_cpu_has_cap(ARM64_HAS_RAS_EXTN)) {
> > > >                       u64 disr = kvm_vcpu_get_disr(vcpu);
> > >
> > > [...]

