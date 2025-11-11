Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EAECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 23:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfSphR+3zkc3ca5t+ekeHVOKX60kamodZsUsUQPEe+8=; b=ktdd5iB0r2pTfFe2UihB/DhaS2
	XvfqinE7Mcb3fLHZDJnlrcleRADleC1I+LusxXQaUZFZgDx2PrIsHtlB3wfd62bE/bpyx1GSOH82T
	ftEauPKMvpGOU5otlMXywo3axzwEBvekjxh3dBlhw1rzy+FhZ8p3I1rQ9FOthyFjRkUGRKI9QJvZo
	0u5MX6pbuYRKBer/UMMSIcxdEXzJE+MYNI0gW42e7dVRcYJZ7oMn+sAnvsL2wA8mfHtF0dZYEpyqX
	kAm9YFmCVtbl4w+vMGFJiZFEtk4mhDNQn+DwSjtOvD6hTcaM4SZV7c3Bz9Bxke7JIBDaZvEtvNrFM
	KVuQ5Rxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIxqd-00000007sm1-2q0f;
	Tue, 11 Nov 2025 23:32:27 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIxqb-00000007sld-1ig2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 23:32:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47777136777so17505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 15:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762903943; x=1763508743; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfSphR+3zkc3ca5t+ekeHVOKX60kamodZsUsUQPEe+8=;
        b=mkEAwClWmhSdlHqKHFsgRmSbxmuO/LwOwdkYuO83Fg/czQIIPTHUz7qT1aTICHusEi
         8Ua2OVPkl3vROkMP7+ROzGSvZSBDOrPAP9x/rJ49aRoIUroyZtS4sfWiAhdmoBXbP/oy
         7Q/FPCpT3YwyxH9O+b0EZTRaYEM2C0JR3GKCX/HUpNgv9TlopIuXDuf5jiprq7HxOt9h
         oY3tNMoBRHLELxIelZaU6QVMIoeAPMJi6pYPNU7ifYA7c9uTGvgan5fsfs5H8J+R5Qz5
         YXGu4yyh6bVqmSQ4MfMGM49YVBOuzDLI7BImsLFxigpGOCZxOHiXsg/OjSr9bLJ3L5iK
         YZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762903943; x=1763508743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DfSphR+3zkc3ca5t+ekeHVOKX60kamodZsUsUQPEe+8=;
        b=nFznXcoNM0qBjjN2N/T516KINfEWkTCifJ2MZeXS3Q7f05+p3jU95eTSm/zCD6qhF2
         8dxVWjlWaJJmj7r45DR9T/ZCum+OSxWJeltH5EdoEqimg9bWPYkjZH+2rFxyWqxG68mT
         vsrx+C7vGyOLlIeSH4YlQQPoGSs1x9FYtxMzXwlb8SEokJXoOabrlfyt1eiXRZsOOft/
         tmRSwKfngSs+XBJSEQ6Df4/52ydnhZqmsm3kVnvgO87XkitWgxMLosq08Toqfo003uQY
         J+Jwa2vB5uAVncQMgVZuOH8CQGXJLORug+/p2L/nxW7Dqp2GlSMt7n1ZTjXOaJOCixXd
         kCfg==
X-Forwarded-Encrypted: i=1; AJvYcCWTqZGVDoPB7ZmrUHPdiVRW9+3JC4AbMQXXfjnFzFjIHU3oh6IJjLjrdls2ZWho4KC9j03hpUrI3h/KB2luHsXk@lists.infradead.org
X-Gm-Message-State: AOJu0YyNce7IpQe5PZhktyUl2EZ5PR+IGEA3tquk0wQdHhLvh+j0gMBv
	wXQDAo4vPxbsNltHK7AsECgEjKOr0QSoahNBuI3/CYORcUZlEfJzK33e7L1ei9MGp5EIpre4XHn
	Iqfw1KcDsJoaKenM+etETSKCRv4GL5Qh5JdGAItSY
X-Gm-Gg: ASbGncsu+NatXHVWb1aXWAAXFpNQSp64H2ReGZiPYXzLNP89RyqFPyFvh1mFBs+av3J
	7EJ6pbjXMeNEmHY8k7dAZxMGECIdqcV7JBS8rAP7nv3Bc0SL5itCJPlPktPXx1Al0ufoye1QZyD
	J92TZyudI4VEjbsunIdYqlC8ptDZ2J2BhGOygd/KAx2tmSpQfIY3yxEinv/lT49S7jjE62uaNyO
	cTOmaQSXLUKb6dbTgF5wPEi8UqsLO2XsreZYDCbleInZ3hRdVMA9wAp7QKMKKGZg4Mx/+S572gU
	AYIcGVkNMxJ6foov93Q9wokPhA==
X-Google-Smtp-Source: AGHT+IEFVyoAcKs88ZinjKACl2in26RA2Ulg4hwVbiPwjRL/ixynji4/f1TVt67UUXxDpe/cHBTPN/6zNnOi8MU74rE=
X-Received: by 2002:a05:600c:4f50:b0:477:73f4:26b with SMTP id
 5b1f17b1804b1-47787e10f86mr299925e9.3.1762903942551; Tue, 11 Nov 2025
 15:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20251013185903.1372553-1-jiaqiyan@google.com> <20251013185903.1372553-2-jiaqiyan@google.com>
 <7a61bcf9-a57d-a8e9-a9b8-4eacef80acd3@arm.com> <CACw3F51_0A8CuCgzcvoA3Db=Wxo8mm5XZw5in+nTKrst+NCcqw@mail.gmail.com>
 <aRMHfS1-K4E4UCbc@kernel.org>
In-Reply-To: <aRMHfS1-K4E4UCbc@kernel.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Tue, 11 Nov 2025 15:32:10 -0800
X-Gm-Features: AWmQ_bnzli5IDq508gd9gl_I2k2ye51PrgqB8PlLzeSpUSiMz9YXG-gXISoy5Ow
Message-ID: <CACw3F51x4sxwSm0ZGeO-Mk3Q3b7iwY-9cnxCveXkc6MF5RGnyA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] KVM: arm64: VM exit to userspace to handle SEA
To: Oliver Upton <oupton@kernel.org>, Jose Marinho <jose.marinho@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, duenwen@google.com, 
	rananta@google.com, jthoughton@google.com, vsethi@nvidia.com, jgg@nvidia.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_153225_492471_5452DD4D 
X-CRM114-Status: GOOD (  39.11  )
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

On Tue, Nov 11, 2025 at 1:53=E2=80=AFAM Oliver Upton <oupton@kernel.org> wr=
ote:
>
> Hi Jiaqi,
>
> On Mon, Nov 03, 2025 at 12:45:50PM -0800, Jiaqi Yan wrote:
> > On Mon, Nov 3, 2025 at 10:17=E2=80=AFAM Jose Marinho <jose.marinho@arm.=
com> wrote:
> > >
> > > Thank you for these patches.
> >
> > Thanks for your comments, Jose!
> >
> > >
> > > On 10/13/2025 7:59 PM, Jiaqi Yan wrote:
> > > > When APEI fails to handle a stage-2 synchronous external abort (SEA=
),
> > > > today KVM injects an asynchronous SError to the VCPU then resumes i=
t,
> > > > which usually results in unpleasant guest kernel panic.
> > > >
> > > > One major situation of guest SEA is when vCPU consumes recoverable
> > > > uncorrected memory error (UER). Although SError and guest kernel pa=
nic
> > > > effectively stops the propagation of corrupted memory, guest may
> > > > re-use the corrupted memory if auto-rebooted; in worse case, guest
> > > > boot may run into poisoned memory. So there is room to recover from
> > > > an UER in a more graceful manner.
> > > >
> > > > Alternatively KVM can redirect the synchronous SEA event to VMM to
> > > > - Reduce blast radius if possible. VMM can inject a SEA to VCPU via
> > > >    KVM's existing KVM_SET_VCPU_EVENTS API. If the memory poison
> > > >    consumption or fault is not from guest kernel, blast radius can =
be
> > > >    limited to the triggering thread in guest userspace, so VM can
> > > >    keep running.
> > > > - Allow VMM to protect from future memory poison consumption by
> > > >    unmapping the page from stage-2, or to interrupt guest of the
> > > >    poisoned page so guest kernel can unmap it from stage-1 page tab=
le.
> > > > - Allow VMM to track SEA events that VM customers care about, to re=
start
> > > >    VM when certain number of distinct poison events have happened,
> > > >    to provide observability to customers in log management UI.
> > > >
> > > > Introduce an userspace-visible feature to enable VMM handle SEA:
> > > > - KVM_CAP_ARM_SEA_TO_USER. As the alternative fallback behavior
> > > >    when host APEI fails to claim a SEA, userspace can opt in this n=
ew
> > > >    capability to let KVM exit to userspace during SEA if it is not
> > > >    owned by host.
> > > > - KVM_EXIT_ARM_SEA. A new exit reason is introduced for this.
> > > >    KVM fills kvm_run.arm_sea with as much as possible information a=
bout
> > > >    the SEA, enabling VMM to emulate SEA to guest by itself.
> > > >    - Sanitized ESR_EL2. The general rule is to keep only the bits
> > > >      useful for userspace and relevant to guest memory.
> > > >    - Flags indicating if faulting guest physical address is valid.
> > > >    - Faulting guest physical and virtual addresses if valid.
> > > >
> > > > Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> > > > Co-developed-by: Oliver Upton <oliver.upton@linux.dev>
> > > > Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> > > > ---
> > > >   arch/arm64/include/asm/kvm_host.h |  2 +
> > > >   arch/arm64/kvm/arm.c              |  5 +++
> > > >   arch/arm64/kvm/mmu.c              | 68 ++++++++++++++++++++++++++=
++++-
> > > >   include/uapi/linux/kvm.h          | 10 +++++
> > > >   4 files changed, 84 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include=
/asm/kvm_host.h
> > > > index b763293281c88..e2c65b14e60c4 100644
> > > > --- a/arch/arm64/include/asm/kvm_host.h
> > > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > > @@ -350,6 +350,8 @@ struct kvm_arch {
> > > >   #define KVM_ARCH_FLAG_GUEST_HAS_SVE                 9
> > > >       /* MIDR_EL1, REVIDR_EL1, and AIDR_EL1 are writable from users=
pace */
> > > >   #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS          10
> > > > +     /* Unhandled SEAs are taken to userspace */
> > > > +#define KVM_ARCH_FLAG_EXIT_SEA                               11
> > > >       unsigned long flags;
> > > >
> > > >       /* VM-wide vCPU feature set */
> > > > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > > > index f21d1b7f20f8e..888600df79c40 100644
> > > > --- a/arch/arm64/kvm/arm.c
> > > > +++ b/arch/arm64/kvm/arm.c
> > > > @@ -132,6 +132,10 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
> > > >               }
> > > >               mutex_unlock(&kvm->lock);
> > > >               break;
> > > > +     case KVM_CAP_ARM_SEA_TO_USER:
> > > > +             r =3D 0;
> > > > +             set_bit(KVM_ARCH_FLAG_EXIT_SEA, &kvm->arch.flags);
> > > > +             break;
> > > >       default:
> > > >               break;
> > > >       }
> > > > @@ -327,6 +331,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kv=
m, long ext)
> > > >       case KVM_CAP_IRQFD_RESAMPLE:
> > > >       case KVM_CAP_COUNTER_OFFSET:
> > > >       case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
> > > > +     case KVM_CAP_ARM_SEA_TO_USER:
> > > >               r =3D 1;
> > > >               break;
> > > >       case KVM_CAP_SET_GUEST_DEBUG2:
> > > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > > > index 7cc964af8d305..09210b6ab3907 100644
> > > > --- a/arch/arm64/kvm/mmu.c
> > > > +++ b/arch/arm64/kvm/mmu.c
> > > > @@ -1899,8 +1899,48 @@ static void handle_access_fault(struct kvm_v=
cpu *vcpu, phys_addr_t fault_ipa)
> > > >       read_unlock(&vcpu->kvm->mmu_lock);
> > > >   }
> > > >
> > > > +/*
> > > > + * Returns true if the SEA should be handled locally within KVM if=
 the abort
> > > > + * is caused by a kernel memory allocation (e.g. stage-2 table mem=
ory).
> > > > + */
> > > > +static bool host_owns_sea(struct kvm_vcpu *vcpu, u64 esr)
> > > > +{
> > > > +     /*
> > > > +      * Without FEAT_RAS HCR_EL2.TEA is RES0, meaning any external=
 abort
> > > > +      * taken from a guest EL to EL2 is due to a host-imposed acce=
ss (e.g.
> > > > +      * stage-2 PTW).
> > > > +      */
> > > > +     if (!cpus_have_final_cap(ARM64_HAS_RAS_EXTN))
> > > > +             return true;
> > > > +
> > > > +     /* KVM owns the VNCR when the vCPU isn't in a nested context.=
 */
> > > > +     if (is_hyp_ctxt(vcpu) && (esr & ESR_ELx_VNCR))
> > > Is this check valid only for a "Data Abort"?
> >
> > Yes, the VNCR bit is specific to a Data Abort (provided we can only
> > reach host_owns_sea if kvm_vcpu_abt_issea).
> > I don't think we need to explicitly exclude the check here for
> > Instruction Abort.
>
> You can take an external abort on an instruction fetch, in which case
> bit 13 of the ISS (VNCR bit for data abort) is RES0. So this does need
> to check for a data abort.

Agreed and thanks for correcting me, Oliver! I will fix this in v5.

>
> Thanks,
> Oliver

