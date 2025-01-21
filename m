Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04314C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 04:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCHIuyllCbEvGhB8ZhLY3eiF7ea/e+TGQlrY3TscTek=; b=vca3wqXtYNuTtSSnnypafpTP2Z
	yOGd7PsVcJv7pks/y40OWiWgwLsfT1ysskbl6IwhEHIk7nnCZvK5hcRoDCW546vEDT86kJ/QNTdct
	8QdJQqajp+nfap1RQGa3mqmaSiRLc/jofwE3V/Y8f/WF1Fan07TA9iqma/xlh5nBKT8RKknEDnvJF
	DFAkjqgqHa1LYZlNWFz+Ws4gKvrx3GfGVtiGahsdzL92XYNwaqMN+nwSNSDVzggw/opwyCaa2EAES
	1dVnWVV67f5DQLbWKeoMPurZTLKhrJKKhQKzJbWoz9AaLuK4OATzV6OibvqnlR74R7Oo6q3TWkM5Y
	GVHQ/fzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta5py-00000006rbr-01oN;
	Tue, 21 Jan 2025 04:26:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta5of-00000006rY6-06HT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 04:24:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-215740b7fb8so330075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 20:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737433479; x=1738038279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCHIuyllCbEvGhB8ZhLY3eiF7ea/e+TGQlrY3TscTek=;
        b=ixnZy8wFGPEuh5+/boYZEjnJDV0PcdSJDswqDSJXQBynU1248vBz2JK4/WMh5vZAbp
         RGAryxApLvNRBOJPQTc4onzCo4oo4NZ+YEix06XfTTGnRQB+/IsOmObp1HAgRiaOBZQs
         BhvyfAOB+jD+qAOs032oynxdTGRNpw3/87Zp2ND1mvOO+QldGp1hMLVeGwm2gVTgRFgf
         ZUYRtYfJ/cBNBWSRyKnpYgrn0QlIicjjH/ILcwqKSWEcCgoCscsLbjVM0pi3BhHDs494
         3HVHqwFishkP7UdsefTYR5xomDdrVsgh0Toypz1KOG7F5XAYTWO7fcPGHaBPmNqNzbO+
         8yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737433479; x=1738038279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCHIuyllCbEvGhB8ZhLY3eiF7ea/e+TGQlrY3TscTek=;
        b=YA8/shGXUu3e3uokJHDZGt8JDrqbeU+PldZDifLIH6OjMUbU10G1r/wLpcNDYAUaJi
         fujcRQLKzxiSrs36RxCBUlh4KFZDkzJBrblf2QQYmPXg29yrm6BI94OQiI8vG3IsC/Nh
         DLU0IN6ZQNIaMJcfYSuYjocikeUV9NLtgwcX20qrHzz0u7lvyB1Ypf7IyOBJ4NxEAMCN
         1cihiE5LdL3ZkmXy8S+KSLHLIK47730Almsve67x73CwDuOk7jCXEu0jGqrvEVucIIfT
         hIcqmnTmtBldx/3em67eBqz6jsim5B9b86RC40F+wp6SKndqBqGAsJ+rSFy6FPIAwSwh
         1YKw==
X-Forwarded-Encrypted: i=1; AJvYcCWId+PgAsAGD8aL/FE2IGD2AGr1zptvoN68VG83vksdMPS5vMxtkN02LRFH/NgW8RXL+neoZW76+ZhAYMFzonfU@lists.infradead.org
X-Gm-Message-State: AOJu0YzPPgUUS/6QlXeziUGloNWw+cc4OSwmiFcEHYJdD1CJejrq0NLg
	t/EtvBgRVxZ1O9i3sxjbVLcEnY8E/rKR7dDPhc6AO7MhEtjeV4RmBm9Y1HNv1tj9JJsanOIxnF2
	xA3TvNgA/PnbrIXJZ+gNRjxDPiVvTaiB4secf
X-Gm-Gg: ASbGncv2oCh48uFTEDuy7pRwG/Q+5tbCUXe+ea0vfAX5kvakYQrkn1ePuoilim906MA
	pMfnlPtcA9b4UzEA985fUlfnKSjeDJnSzpGzFGKNMAK9647lSXTXxhXLIzUCh0sK/072mQwuXve
	p1p/3i+A==
X-Google-Smtp-Source: AGHT+IHxtlEPWJVSdhR6rrakC31zpMurRjTirZiq5bee0Zk7X+dmUx5SDeFxWcpkjSx7Vdpec3Sqtnl2AlPVMCHAbco=
X-Received: by 2002:a17:903:2404:b0:215:98fd:cb04 with SMTP id
 d9443c01a7336-21c61dccf33mr4540225ad.25.1737433479373; Mon, 20 Jan 2025
 20:24:39 -0800 (PST)
MIME-Version: 1.0
References: <20250120151514.1769597-1-lokeshvutla@google.com> <86sepdv4xn.wl-maz@kernel.org>
In-Reply-To: <86sepdv4xn.wl-maz@kernel.org>
From: Lokesh Vutla <lokeshvutla@google.com>
Date: Tue, 21 Jan 2025 09:54:26 +0530
X-Gm-Features: AbW1kvabEKtOD-nLKTX9gYTsSARLIVR3-5bisQwyCI_CiI_yRSu2JSnqikAmF5I
Message-ID: <CAOcHnfPdq9F6qqN=kCrUSRSstgsY74MQO4uPKyz4CgPbWKsxhw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Flush hyp bss section after initialization of
 variables in bss
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, sachinparekh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_202441_085205_A5EBDBCF 
X-CRM114-Status: GOOD (  36.18  )
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

On Mon, Jan 20, 2025 at 9:44=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Mon, 20 Jan 2025 15:15:14 +0000,
> Lokesh Vutla <lokeshvutla@google.com> wrote:
> >
> > To determine CPU features during initialization, the NVHE hypervisor
>
> s/NVHE/nVHE/

ok

>
> > utilizes sanitized values of the host's CPU features registers. These
> > values, stored in u64 idaa64*_el1_sys_val variables are updated by the
> > kvm_hyp_init_symbols() function at EL1. To ensure EL2 visibility, the
>
> visibility *with the MMU off*

ok

>
> > data cache needs to be flushed after these updates. However,
> > individually flushing each variable using kvm_flush_dcache_to_poc() is
> > inefficient.
> >
> > These cpu feature variables would be part of the bss section of
> > the hypervisor. Hence, flush the entire bss section of hypervisor
> > once the initialization is complete.
> >
> > Motivation for this change:
> > * Since the existing variables are not flushed from EL1, the
> >   id_aa64pfr0_el1_sys_val is seen as 0 from EL2.
> > * based on this value check_override macro in hypervisor skips
> >   updating the sve (cpacr_el1) at finalise_el2_state.
> > * The default value for cpacr_el1 enables the sve traps to EL2.
> > * With sve enabled, during the context switch from EL0 -> EL1 (which is
> >   much later in the boot process), the sve registers are saved/restored=
.
> > * Since sve traps are enabled, accessing sve registers at EL1 caused a
> >   trap to EL2.
> > * However, hypervisor is not ready to handle sve traps at this stage
> >   causing the below kernel crash during the boot:
>
> Drop this section, it doesn't bring much to the discussion.
>
> >
> > [    0.320850][    T1] Run /init as init process
> > [    0.321392][    T1] kvm [1]: nVHE hyp BUG at: [<ffffffc08112ee8c>] _=
_kvm_nvhe_$x.24+0x254/0x254!
> > [    0.321522][    T1] kvm [1]: Cannot dump pKVM nVHE stacktrace: !CONF=
IG_PROTECTED_NVHE_STACKTRACE
> > [    0.321635][    T1] kvm [1]: Hyp Offset: 0xffffff6e60000000
> > [    0.321710][    T1] Kernel panic - not syncing: HYP panic:
> > [    0.321710][    T1] PS:634023c9 PC:000000522112ee8c ESR:00000000f200=
0800
> > [    0.321710][    T1] FAR:0000000000000000 CPACR:0000000000310000 PAR:=
0000000000000800
> > [    0.321710][    T1] VCPU:0000000000000000
> > [...]
> > [    0.322251][    T1] Call trace:
> > [    0.322292][    T1]  dump_backtrace+0x100/0x180
> > [    0.322355][    T1]  show_stack+0x20/0x30
> > [    0.322410][    T1]  dump_stack_lvl+0x40/0x88
> > [    0.322471][    T1]  dump_stack+0x18/0x24
> > [    0.322523][    T1]  panic+0x13c/0x364
> > [    0.322578][    T1]  nvhe_hyp_panic_handler+0x148/0x1cc
> > [    0.322646][    T1]  do_sve_acc+0xec/0x260
> > [    0.322706][    T1]  el0_sve_acc+0x34/0x68
>
> This is essentially content-free, given that there is no
> backtrace. Please drop this.

Sure.. will drop the above 2 sections in v2.

>
> >
> > Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System =
Registers")
> > Suggested-by: Fuad Tabba <tabba@google.com>
> > Signed-off-by: Lokesh Vutla <lokeshvutla@google.com>
> > ---
> >  arch/arm64/kvm/arm.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index a102c3aebdbc..5d3b2069a2d5 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -2661,6 +2661,12 @@ static int __init init_hyp_mode(void)
> >               }
> >       }
> >
> > +     /*
> > +      * Flush entire BSS since part of its data is read while the MMU =
is off.
> > +      */
> > +     kvm_flush_dcache_to_poc(kvm_ksym_ref(__hyp_bss_start),
> > +                             kvm_ksym_ref(__hyp_bss_end) - kvm_ksym_re=
f(__hyp_bss_start));
> > +
> >       return 0;
> >
> >  out_err:
>
> I don't understand how this fixes anything. At this stage, the
> hypervisor has already been initialised, and I expect it will have
> evaluated the wrong values.
>
> Even worse, I strongly suspect that by the time you perform this, S2
> is enabled on the host, and that the BSS is off-limit. Which means it
> could fault and send you to lalaland.
>
> Have you actually tested this with upstream?
>
> I would have expected the clean operations to be called from
> kvm_hyp_init_symbols(), which runs before EL2 gets initialised in
> protected mode.

Sorry my bad.. Actually we started flushing each variable and tested
the solution. With this we observed that the hypervisor is able to read
the data properly with MMU off. Then kept optimizing the solution by
flushing the entire bss and moving around the place of flushing..
I guess it got lucky in the last run with this wrong placement.
Will add the flush in kvm_hyp_init_symbols() and post v2.

Thanks and Regards,
Lokesh



>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

