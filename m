Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DE9D5E12A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 04:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSKJzjh5rurwLh+xIWMq383kU498LySuuCRBu3PfCQM=; b=4iDd9ZSkJbW/yywWf+QkI6M3of
	MRORUr0K6yTB5PSy0tom7xfPwVTjzN3W9wv19h1pu0DYYLodDkWWF/hmHWLIXY9IUE1forD0OiWQl
	mhqn/fEmaiucmF6SrX6U3GRqNAqCHFfPownLsi4lDyW+bJMr5M93FaU5vs240t9i7SqeeSZnKAkzI
	V+zW4prZekKw+GiqXvANayAgGy8uQ1StFhV238CoogAyUCundFzhBlLSw4xkYK/SiqlZ1mRwPIHTi
	y4HNNdeJPIfyexgc/RBKPMFViROgbrShgpyodRQosQ200oGaZGDz+ydlz31CQccpRNN0U1PGSo3Kk
	WG40N4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9H3D-00000009KSr-2Z6Q;
	Fri, 08 Nov 2024 04:56:51 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9H1N-00000009JxU-2uRf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 04:54:59 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539e617ef81so6456e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 20:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731041695; x=1731646495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSKJzjh5rurwLh+xIWMq383kU498LySuuCRBu3PfCQM=;
        b=Nq21BtwjM628AKkxKCRzck7NTI7+X5J891dWaX3vxaql5+f30RcxsReZRt/7pcBETx
         pziTr6fDZmeZl/G67T+Ofkc8q4utJk4Mp6R+qrIeVzHQVF7vAouFOdmh1NdyyqmVFKUr
         kUMf009Ezo++tg6V4rc0xDU2lSrng+G4xbVM264HHkU3UEivyAsD5lRcWRIVqxwPvOQZ
         MMXhnMqzWpT9a5kBiKa5VfzkjOM6CgXuxrr6k8c14LFN198r1m4cIpq7JMVE/NTWXwAw
         l2Bgl/xzkmIorCwDlxOwLcqdjKlUz91URAO0UoLulTtTPndlVkBs9F6Oz8WQGUX/2BWg
         CNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731041695; x=1731646495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSKJzjh5rurwLh+xIWMq383kU498LySuuCRBu3PfCQM=;
        b=fcrndOxwibLy/BAjYQJ0SHmsOjrJTfOwK6vMkumIkzID8x81TjzifNXy2H3aVJMiTY
         zeu7NyYCnJ/pJSa2khdXfmlfNczcM261Wm82tx/47HLVGYKmzGoTfCfn4ugdw7zaaImA
         ortiHFlb4zRIF7SeDxR5Ep/wgzY08ZQcuRIgSHPgzo0aoMsa90nzWj8jj7BaAE4nTOER
         FwDY1Ske5hJfYNOv6/o8oIFQgHQfC+iuYp5OBeoNY81ATVSEt3a9+Gjhxsg0G3/TT/ph
         3NSRXA4w6Hrx37AIH0QPsv6QRGMvmzEaovJf/BGsQCbAUc6qWXkGKcl9s/YPK4O88EvY
         45pw==
X-Forwarded-Encrypted: i=1; AJvYcCVYY3NljL4Sjp4oqLZBoXGZlSe+OdRKVbythReb0ERXFSKxOqDJ2Ip9uli6+ms0gU/0Ysk/6y0/X1ADBcFKtfim@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv2i0OBkG7i/ILxD5hd2WSRqEOwyLSfWvm2SPtahBsYxp0YBvV
	3PP+ThyrRFPZKsBxnbI3gc1cpZmABHLvyigTgIRqfejfzECOfs/qyA05TUI9/2fzK51qLmNkGrJ
	KPZDsTcURcwV9JT33SZegUJvHDW8M1NijxKFA
X-Gm-Gg: ASbGncuZiLlbrXNCSDQ1EIXfRxWnnfknRIcDM2jL3e76jS7AqJ0MLWs2th7TSuB3ZER
	Pb0Btd9L8mwbvnyMMaPa+01tp1SA68GQC9IOrB16nvcVzqz4r0GlmTN9MVtMAsPOW
X-Google-Smtp-Source: AGHT+IGKIXIuAP01ZsVM+BlzRdxZ0Zhznc/LCRKvW3Ub125dSvD8M1+JFH8FKnICGQVhmKF54W/LE3eK5eVmHfeVlwM=
X-Received: by 2002:ac2:4e44:0:b0:53c:7652:6c97 with SMTP id
 2adb3069b0e04-53d811f1d2cmr527773e87.2.1731041694586; Thu, 07 Nov 2024
 20:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20241031212104.1429609-1-jiaqiyan@google.com> <ZyP6whdv4bmsI13x@linux.dev>
In-Reply-To: <ZyP6whdv4bmsI13x@linux.dev>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Thu, 7 Nov 2024 20:54:43 -0800
Message-ID: <CACw3F53Mz_5pqFRyZtQBuF2Qq9314ANnOc360SNM5DtkCNweaw@mail.gmail.com>
Subject: Re: [RFC PATCH v1] KVM: arm64: Introduce KVM_CAP_ARM_SIGBUS_ON_SEA
To: Oliver Upton <oliver.upton@linux.dev>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	pbonzini@redhat.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, duenwen@google.com, 
	rananta@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_205458_079900_6ED05C38 
X-CRM114-Status: GOOD (  41.33  )
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

Hi Oliver,

Sorry for getting back to you late...

On Thu, Oct 31, 2024 at 2:46=E2=80=AFPM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> Hi Jiaqi,
>
> Thank you for sending this out.
>
> On Thu, Oct 31, 2024 at 09:21:04PM +0000, Jiaqi Yan wrote:
> > Currently KVM handles SEA in guest by injecting async SError into
> > guest directly, bypassing VMM, usually results in guest kernel panic.
> >
> > One major situation of guest SEA is when vCPU consumes uncorrectable
> > memory error on the physical memory. Although SError and guest kernel
> > panic effectively stops the propagation of corrupted memory, it is not
> > easy for VMM and guest to recover from memory error in a more graceful
> > manner.
> >
> > Alternatively KVM can send a SIGBUS BUS_OBJERR to VMM/vCPU, just like
> > how core kernel signals SIGBUS BUS_OBJERR to the poison consuming
> > thread.
> > In addition to the benifit that KVM's handling for SEA becomes aligned
> > with core kernel behavior
> > - The blast radius in VM can be limited to only the consuming thread
> >   in guest, instead of entire guest kernel, unless the consumption is
> >   from guest kernel.
> > - VMM now has the chance to do its duties to stop the VM from repeatedl=
y
> >   consuming corrupted data. For example, VMM can unmap the guest page
> >   from stage-2 table to intercept forseen memory poison consumption,
> >   and for every consumption injects SEA to EL1 with synthetic memory
> >   error CPER.
> >
> > Introduce a new KVM ARM capability KVM_CAP_ARM_SIGBUS_ON_SEA. VMM
> > can opt in this new capability if it prefers SIGBUS than SError
> > injection during VM init. Now SEA handling in KVM works as follows:
>
> I'm somewhat tempted to force the new behavior on userspace
> unconditionally. Working back from an unexpected SError in the VM to the
> KVM SEA handler is a bit of a mess, and can be annoying if the operator
> can't access console logs of the VM.

Ack, I also think involving VMM is preferable than injecting SError
directly to guest.

>
> As it stands today, UAPI expectations around SEAs are platform
> dependent. If APEI claims the SEA and decides to offline a page, the
> user will get a SIGBUS.
>
> So sending a SIGBUS for the case that firmware _doesn't_ claim the SEA
> seems like a good move from a consistency PoV. But it is a decently-sized
> change to do without explicit buy-in from userspace so let's see what
> others think.

Sounds good, I will wait for a couple of more days, and if the opt-in
part isn't necessary to anyone else, I will remove it from the next
revision.

>
> > 1. Delegate to APEI/GHES to see if SEA can be claimed by them.
> > 2. If APEI failed to claim the SEA and KVM_CAP_ARM_SIGBUS_ON_SEA is
> >    enabled for the VM, and the SEA is NOT about translation table,
> >    send SIGBUS BUS_OBJERR signal with host virtual address.
> > 3. Otherwise directly inject async SError to guest.
>
> The other reason I'm a bit lukewarm on user buy in is the UAPI suffers
> from the same issue we do today: it depends on the platform. If the SEA
> is claimed by APEI/GHES then the cap does nothing.

Good point, yeah, the path of KVM handling SEA and sending SIGBUS
should be treated as fallback code to APEI/GHES.

>
> > +static int kvm_delegate_guest_sea(phys_addr_t addr, u64 esr)
> > +{
> > +     /* apei_claim_sea(NULL) expects to mask interrupts itself */
> > +     lockdep_assert_irqs_enabled();
> > +     return apei_claim_sea(NULL);
> > +}
>
> Consider dropping parameters from this since they're unused.

Ack, will do in the next revision.

>
> > +void kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
> > +{
> > +     bool sigbus_on_sea;
> > +     int idx;
> > +     u64 vcpu_esr =3D kvm_vcpu_get_esr(vcpu);
> > +     u8 fsc =3D kvm_vcpu_trap_get_fault(vcpu);
> > +     phys_addr_t fault_ipa =3D kvm_vcpu_get_fault_ipa(vcpu);
> > +     gfn_t gfn =3D fault_ipa >> PAGE_SHIFT;
> > +     /* When FnV is set, send 0 as si_addr like what do_sea() does. */
> > +     unsigned long hva =3D 0UL;
> > +
> > +     /*
> > +      * For RAS the host kernel may handle this abort.
> > +      * There is no need to SIGBUS VMM, or pass the error into the gue=
st.
> > +      */
> > +     if (kvm_delegate_guest_sea(fault_ipa, vcpu_esr) =3D=3D 0)
> > +             return;
> > +
> > +     sigbus_on_sea =3D test_bit(KVM_ARCH_FLAG_SIGBUS_ON_SEA,
> > +                              &(vcpu->kvm->arch.flags));
> > +
> > +     /*
> > +      * In addition to userspace opt-in, SIGBUS only makes sense if th=
e
> > +      * abort is NOT about translation table walk and NOT about hardwa=
re
> > +      * update of translation table.
> > +      */
> > +     sigbus_on_sea &=3D (fsc =3D=3D ESR_ELx_FSC_EXTABT || fsc =3D=3D E=
SR_ELx_FSC_SECC);
>
> Is this because we potentially can't determine a valid HVA for the
> fault? Maybe these should go out to userspace still with si_addr =3D 0.

No, it is not related to the availability of a valid HVA. In this
patch, as long as it decides to sigbus_on_sea, si_addr can be 0 if a
valid HVA isn't available when !kvm_vcpu_sea_far_valid (OR when
HPFAR_EL2 cannot be translated from a valid FAR_EL2, which I think
requires some improvement).

The code here wants to limit SIGBUS _BUS_OBJERR_ to only SEA and
parity+ECC error, similar to the code here (for SEA)
https://elixir.bootlin.com/linux/v6.11.6/source/arch/arm64/mm/fault.c#L771
and here (for synchronous parity or ECC error)
https://elixir.bootlin.com/linux/v6.11.6/source/arch/arm64/mm/fault.c#L779.

>
> --
> Thanks,
> Oliver

