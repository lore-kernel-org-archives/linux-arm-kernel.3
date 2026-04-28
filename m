Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47715FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 14:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXGQeShfh02U1wpxLV3lnM8sw0Cqx8U4IJOmflxKdf4=; b=af/r17ijHmYtjV2yxiNVtNRUsf
	CpsSoecXmH9H+0aRru1teE801k6eWSmNtArsuP4xmSoZVrMFKxrC11uWyQYknewUA2m5c8FO16u5X
	Zek8QApwpGbU9FAzNBkc8sUYfe0dO3ROw+loe421rcyFTYKM0zgEVQSM1PdIJalUfMQ6XUAROuRTH
	+e4XRFUG0eu/0ANLjHeRjukyriLIP3VJ8hAETlGIuy78QiVB2ayzINegcnskQOlvnPv2addIAeknb
	jftaYrS1wojt0s10M/PMgqtBxjFnMVb4QPygHlPpFrHRGrkUJrFxBg2anYmzsHUp0LCtR6SA9TRh7
	sU6W3gSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjKi-00000001dYB-0VLH;
	Tue, 28 Apr 2026 14:22:40 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjKf-00000001dXK-1Ctd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 14:22:38 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-50e61648f10so656441cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777386156; cv=none;
        d=google.com; s=arc-20240605;
        b=DMS+zivNVU2XVk9tQZkib8DgJP/T4lP9jIbveHAPcx265HUSxYsm7MkW/qbGxo7SL8
         3epiZtRK3n/IH/Yz74dzVGEPxF0VTtwkjenNaiOj1+iOTjcApkj+UZrIzs9c7J08R/Ol
         /We5dOfP70SPtx+4h4oJLl2nwIn6QSMqj5UrpqLekFklv0wSZPUNz1cf3CXpNY5N+DQ0
         s1Kxyzgr/D4TzzjXoXAGgL7P/7zILtt21z1u1dncXJJAULytaS7T2pwQB+UT9EagcNFX
         7IVoK3vnQtuuhI9HXZRa2WTosH0dS91yTwxigKu3WXMVxSxuyMB/bgtrTDspKyqOiP5c
         4TuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uXGQeShfh02U1wpxLV3lnM8sw0Cqx8U4IJOmflxKdf4=;
        fh=/EHj+fjA4Bk7HuIxVrWIZEOonTiqJXgxOvtQAlYqD/0=;
        b=aSqmRWAaUZGN5ul15PFARfVsmiKnx1LIL0mQUISSTL2vVUTKWBd4cM74Nu6QJFn+2/
         Pcf762IBKnhWY9pyPcQGCOCUImUlXWyrzGkXz878shQqGeEc/vgq9YDKw6OfWCTvV62B
         dzdCyo74rgaKCOFeSadIlmkBbXIvuOTwu3EHWS/Ml4cB6suFDKXp5hHm7X1HhFb6xQAx
         q6rbiu/SKHAQ0PN+3nac1yn8mr3YrpGr8p4eRY3csXRKa/lFGvzt3u3J+/biG8TZqi1J
         H4lwY8NqkpxkRDqm5/clUa69IZ/8WtVHrtquE7I0nbmqk39KYMb6pRFPuZmKQj9QEI0h
         9ihQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777386156; x=1777990956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXGQeShfh02U1wpxLV3lnM8sw0Cqx8U4IJOmflxKdf4=;
        b=l/QaDqxoCKFHuhehwLMi6Nq15lh2Mdf6KWydxzQyPyz031TEFHGl/ija52tJ6auSMg
         swjXONKF02An9Z3SSgAnT+8zazRPOZRNGQuVqJXd2t6xpLH/+vbabhAUxr6a3P2nuuY6
         cnKZpo+LjWSd/tfktsyyYWZVANuKBHMAT8eTOP1wqWQRJk7c0SsPItTbL3WS//n3wWuF
         yTdyZJDOOwJnXaP9qicjqCN3RZFoolHWm7Wxow+YnYpjRWkDbQlyEySpGCTVfZiCmzPK
         6B7fh+8aQpLB+EQjPDzwHzUEb/rTB1BmB0xRWOQBrEHuND2MqRII8+6YHHOyLrLyqYkC
         QrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386156; x=1777990956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uXGQeShfh02U1wpxLV3lnM8sw0Cqx8U4IJOmflxKdf4=;
        b=rTd97LpFdF0IzTZDA9kXYlgs2DquBW+/9pKxUCtG2nrfw1dbXVkTlsgczCqGizi/VF
         hRYQfoUo97GB9Yat/rSlLZ+MYeNM7DLQ0701aKx7YA0gZYDLQlHJCwZtA3ozmue9SkXE
         rbjIH9VH/+woZ4hqyoPJkx7mIFC9muoCnS5cKc9194b8fAXQi3RqqU8Pg65XYNrtUf9u
         XrGsXcJqPzEin0x68vEojT8pwv7fpXpIxkhNqT1+6P8+WC/eEjiiYWLJ33CiBGvYUTuF
         QJK18SbzBp8+jxrcsaUmfrleUno5AO2DTQlRYBWLKjfsoznE6hfHOouPVNmtyRgoMMHg
         OZXA==
X-Forwarded-Encrypted: i=1; AFNElJ8Bfrs48iplICcA686ot1dMdFiEjA/J9p1nb3to9EOHAFOHXgL9xmPRvkF4vPbdpoBMtxqGdyNKLaEIg58K/9U1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3F9ZMsgXpJqZc1lGEOP8jY16ZnR6BYxGovEEBfzbZgTVEOezi
	MCRFRfPifwWaDWaSMNeiiGyBDDDE8URJBavuEEXQx3IqWrh/jwK176iV56X2tDoHk99ZR5bzlm3
	klqs9OJQTVJtZjOw6XU+Zqx6FsUC7/FKCLBbwc7Zw
X-Gm-Gg: AeBDieuonqYSKZ5Re7+d17tZEtojSGPoOnskcC2xomD2pLteMyBYwCUEFi0GduwazZ3
	eGTXG46WRW4eRyYi92CT95xfjUKGB3aHq7vagnPlzmypToY+MaeIXBNyC4fZuaZKRyYVG2sts8y
	OS+fYhilxXuopRHJPy9mCzk0uM/Pai/hpDOCeYjo4VMH7lQGwrtUcMTyKKJW9TQRbcN4oC1CUWD
	cgIzFoqbah+pSIzLeHnYHy5Rhkwyw9y6vm6dlc4xxj+0GeGAsOFIZQiAWq1H88f8m48a8LA64td
	0S1fEMKGCoZaFVb3Pa/cWi77Y+S2VBfiwiv+OVEvZuZXqRs7SVRguKWIjaV7JkE=
X-Received: by 2002:a05:622a:14a:b0:50f:be7b:923a with SMTP id
 d75a77b69052e-5100dd824admr13692471cf.9.1777386155175; Tue, 28 Apr 2026
 07:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260428103008.696141-1-tabba@google.com> <20260428103008.696141-3-tabba@google.com>
 <afC7H1fu4vFzTRTt@willie-the-truck>
In-Reply-To: <afC7H1fu4vFzTRTt@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 28 Apr 2026 15:21:58 +0100
X-Gm-Features: AVHnY4IcRutI69cs69i--7xOx374S2gpBibzxSLDc-9Cnq9PVlW1EEta-ioTBlc
Message-ID: <CA+EHjTy=xvvBN0UyK2bO6J-GuUZnHRwjjdrhkK8Vr+iridWCfg@mail.gmail.com>
Subject: Re: [PATCH 2/8] KVM: arm64: Synchronise HCR_EL2 writes on the guest
 exit path
To: Will Deacon <will@kernel.org>
Cc: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, 
	vdonnefort@google.com, catalin.marinas@arm.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_072237_341240_C336A1B2 
X-CRM114-Status: GOOD (  32.66  )
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

On Tue, 28 Apr 2026 at 14:50, Will Deacon <will@kernel.org> wrote:
>
> On Tue, Apr 28, 2026 at 11:30:02AM +0100, Fuad Tabba wrote:
> > MSR HCR_EL2 is not self-synchronising. Per ARM DDI 0487 M.b K1.2.4
> > (p.K1-16823) and B2.6.1 (p.B2-297), a Context Synchronisation Event
> > is required between an HCR_EL2 write and any subsequent direct
> > register access at the same EL that depends on the new value being
> > in effect.
> >
> > On the entry path, the HCR_EL2 write in __activate_traps is followed
> > by further EL2 sysreg work (MDCR_EL2, CPTR_EL2, VBAR_EL2, and on the
> > speculative-AT errata path SCTLR_EL1/TCR_EL1) before ERET into the
> > guest. None of those intervening accesses depend on the new HCR_EL2
> > value, and ERET is a CSE per ARM DDI 0487 M.b D1.4.4.1 rule RBWCFK
> > (p. D1-7209) conditional on SCTLR_EL2.EOS=3D1, which is set
> > unconditionally by INIT_SCTLR_EL2_MMU_ON (see the prerequisite patch
> > in this series). The requirement is therefore satisfied implicitly
> > on the activate path.
> >
> > The deactivate path is different: after write_sysreg_hcr() in
> > __deactivate_traps() further EL2 sysreg work runs before any natural
> > CSE - on nVHE, __deactivate_cptr_traps and the VBAR_EL2 write; on
> > VHE, the timer context save which reads CNTP_CVAL_EL0 under the new
> > TGE/E2H, and the EL1 sysreg restore. Add an explicit isb() at each
> > of the two deactivate sites.
> >
> > The practical impact today is bounded: HCR_EL2.E2H does not toggle
> > in either path, and the trap bits being changed primarily affect
> > EL1&0 behaviour. But the architectural rule should be honoured.
> > Note that write_sysreg_hcr() itself already issues isb() on the
> > Ampere errata path (sysreg.h), confirming the architectural
> > expectation; the fast path optimises that away.
> >
> > The fix is at the call sites rather than inside write_sysreg_hcr()
> > because the macro has many users (e.g. the activate path, at.c,
> > hardirq.h, ptrauth alternatives) where the immediately-following
> > code either reaches ERET or has another CSE; making the macro emit
> > an unconditional ISB would impose unnecessary cost on those
> > well-formed users.
> >
> > Fixes: 9404673293b0 ("KVM: arm64: timers: Correctly handle TGE flip wit=
h CNTPOFF_EL2")
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/switch.c | 11 +++++++++++
> >  arch/arm64/kvm/hyp/vhe/switch.c  | 11 +++++++++++
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe=
/switch.c
> > index 8d1df3d33595..9d7ead5a5503 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> > @@ -105,6 +105,17 @@ static void __deactivate_traps(struct kvm_vcpu *vc=
pu)
> >       __deactivate_traps_common(vcpu);
> >
> >       write_sysreg_hcr(this_cpu_ptr(&kvm_init_params)->hcr_el2);
> > +     /*
> > +      * MSR HCR_EL2 is not self-synchronising. Per ARM ARM K1.2.4 p.K1=
-16823
> > +      * and B2.6.1 p.B2-297, a Context Synchronisation Event is requir=
ed
> > +      * between an HCR_EL2 write and any subsequent direct register ac=
cess at
> > +      * the same EL that depends on the new value being in effect.
> > +      * The activate_traps path falls through to ERET (a CSE), but the
> > +      * deactivate path still executes further EL2 sysreg work (CPTR/V=
BAR
> > +      * writes below) before any natural CSE, so make the synchronisat=
ion
> > +      * explicit.
> > +      */
> > +     isb();
>
> Sorry, but I don't understand this. Please can you explain why you think
> that CPTR and VBAR have an ordering dependency on HCR_EL2? Preferably,
> the comment would talk about the specific fields that are relevant.

You're right, I misread the spec in my excitement to fix an issue
raised by my new and improved prompts. I went back to the access
pseudocode for the registers being written after write_sysreg_hcr():

- CPTR_EL2/VBAR_EL2 (nVHE) are direct EL2-only registers; their write
semantics at EL2 don't consult HCR_EL2.
- CPACR_EL1/VBAR_EL1/CNTP_CVAL_EL0 (VHE) redirect to their EL2
counterparts on ELIsInHost(EL2) =E2=80=94 i.e., HCR_EL2.E2H =E2=80=94 and E=
2H doesn't
toggle here. TGE isn't a condition for these EL2-level accesses.

So the whole "depends on the new value being in effect" doesn't
actually bite for any of the accesses I cited. I'll drop this patch.
The natural CSEs cover whatever real synchronisation is needed.

Cheers,
/fuad

>
> Will

