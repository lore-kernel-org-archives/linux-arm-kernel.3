Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039E6E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 07:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iPuGa5HCPzSMoHYKVJCU6quqj6Ftm6FTmJ8Y7jrKjY=; b=HKVkegPjQLkC334Vnq9vxjCP41
	iFVFhvrn5RGFyB7UCjoJljgp2HHdr1EoWDFT2Wz237i1oPlf3X5CQA1NGrMKBGOqoZntUx3j7d3vo
	Bzjz21630oQYApB0rA9EMMG9Lh5Zn01Co5522M9Su57sUCq2amgMsNFwyORHduUaxc13pdbbNmbqL
	yXttndO3rR+wi12oGCPyACeig9ScjYTvKS2xG5//MMbeSnQzWtBVAaG8vEtB7o1erDI4x3GcwYwR/
	NfjUQoBzy9/KBCmDgSQdpWAwJUsPWMVeKz9RGm4aCT0D0f+5LwAFnQPx+mZblUc0c7CNBMSSpkHdU
	pjXlCWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN5gr-00000009IAJ-2alv;
	Mon, 16 Dec 2024 07:38:53 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN5fi-00000009Hya-3zKw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 07:37:44 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3003c82c95cso31617471fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Dec 2024 23:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734334660; x=1734939460; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iPuGa5HCPzSMoHYKVJCU6quqj6Ftm6FTmJ8Y7jrKjY=;
        b=Wbfihs4hqqHzPw5J00xESTvZPn8zdnbAm0b2jzmD4yjcndue0KyCJhjpOdqZG85C/l
         aJgyBJeeIJQnrPwk+5/S5zys9uq5iDRTErB9fT7R/ZTcbjtYPpBz61fubGSLvMzcw79C
         ELuyQRWf8UBOj7pv9JVfGRh38AIngjSlMwt6voOJQ+zCsSzK30BUSSD/gpC9hSEb59it
         e/6jNmvUvLkg73wWmK6TivZLG1P1JOCWwdbpdWdz0SwfWqvRFa6sbKvckLNEB8ZQTDMD
         DNqh+Mwao8q/0Z1qT8QF5k4J+aWmUA4PIiySsrNz/a0rK+ZwpkIJoH+t42kCm62fqz8G
         041w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734334660; x=1734939460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iPuGa5HCPzSMoHYKVJCU6quqj6Ftm6FTmJ8Y7jrKjY=;
        b=GZvLzXi37bCcHGaMpJhrNy15vEqCf1MTJ+JdbV3XPC3kfDtgfuVVRJadtqrnVq5Mul
         wuIPj6drAgwERILyjb8TaBUSQQJg36JZ/kkYX0ZQkO34obHDYcA7qC4zdgrBqrRiisGO
         q9xXEYcQvgHoh7GGB5rk6kEK0ZgqwSabULoibglxacp/5FFgyPzg27JXp0pm41VwMmu3
         ejrAdzUNnnN55HIdyj+8+H+S98uHqYdA2ofh10SEhjx4tQSh1hutEI8yzpo8udEx8TQC
         2OIJjPsQEsVat9Eloa7d+rf49CmGWDS+whA+TYCsiWcEVRMHe3O3c22YsYZCQ1d2cpL1
         3TDw==
X-Gm-Message-State: AOJu0YxZkNDx0enyWW8hUHNLSamrHLdzKMn+gJIcCQrovxsbLYQHkQ47
	+dVN8seD+d1yXjWErz3CQDhiAG5/cczxA+H+3piayDBw4S+Uxhd7n9u5GYg8ESPSx5U2Dz0EzFa
	Nu2yeLBGFw0935kpnb83WjOltLJA=
X-Gm-Gg: ASbGnctXw0oGWPYwAlSRwZHHvN82BaZ21zyTxWFidGds6YKCX/8wqAzsYz5/6cBXe1a
	oS0Ct/W8m5rq9DqOSDknDCZG1l2NsRvMamNsLjA==
X-Google-Smtp-Source: AGHT+IHS63Q6kudZHLBAZ4BJhW4K+vF5Mpn4FrFYNUREmn4GTgSj6jzvQ7PEVfOwJXgStCjHnEBU1/pcbfhxC5Tz9oc=
X-Received: by 2002:a2e:8608:0:b0:300:1bf1:df23 with SMTP id
 38308e7fff4ca-3025443fccbmr27413781fa.12.1734334660233; Sun, 15 Dec 2024
 23:37:40 -0800 (PST)
MIME-Version: 1.0
References: <20241213145809.2918-1-ubizjak@gmail.com> <86bjxfsdw0.wl-maz@kernel.org>
In-Reply-To: <86bjxfsdw0.wl-maz@kernel.org>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 16 Dec 2024 08:37:28 +0100
Message-ID: <CAFULd4YY0BvbjtF=6wG9CoZo7ZLpAOFCk_fzuQ5gVOQ2D3SR=A@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: timers: Fix percpu address space issues
 in kvm_timer_hyp_init()
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_233743_007322_1F3AE0CB 
X-CRM114-Status: GOOD (  23.49  )
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

On Fri, Dec 13, 2024 at 6:15=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Fri, 13 Dec 2024 14:57:52 +0000,
> Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > Cast return value from kvm_get_running_vcpus() in the __percpu
> > address space to the generic address space via uintptr_t [1]
> > to fix a couple of:
> >
> > arch_timer.c:1395:66: warning: incorrect type in argument 2 (different =
address spaces)
> > arch_timer.c:1395:66:    expected void *vcpu_info
> > arch_timer.c:1395:66:    got struct kvm_vcpu *[noderef] __percpu *
> >
> > sparse warnings.
> >
> > There were no changes in the resulting object files.
> >
> > [1] https://sparse.docs.kernel.org/en/latest/annotations.html#address-s=
pace-name
> >
> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Oliver Upton <oliver.upton@linux.dev>
> > Cc: Joey Gouly <joey.gouly@arm.com>
> > Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Cc: Zenghui Yu <yuzenghui@huawei.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/kvm/arch_timer.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> > index 1215df590418..a13bb9e8dc19 100644
> > --- a/arch/arm64/kvm/arch_timer.c
> > +++ b/arch/arm64/kvm/arch_timer.c
> > @@ -1392,7 +1392,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
> >
> >       if (has_gic) {
> >               err =3D irq_set_vcpu_affinity(host_vtimer_irq,
> > -                                         kvm_get_running_vcpus());
> > +                                         (void *)(uintptr_t)kvm_get_ru=
nning_vcpus());
> >               if (err) {
> >                       kvm_err("kvm_arch_timer: error setting vcpu affin=
ity\n");
> >                       goto out_free_vtimer_irq;
> > @@ -1416,7 +1416,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
> >
> >               if (has_gic) {
> >                       err =3D irq_set_vcpu_affinity(host_ptimer_irq,
> > -                                                 kvm_get_running_vcpus=
());
> > +                                                 (void *)(uintptr_t)kv=
m_get_running_vcpus());
> >                       if (err) {
> >                               kvm_err("kvm_arch_timer: error setting vc=
pu affinity\n");
> >                               goto out_free_ptimer_irq;
>
> I think the fix is worse than the current code, because there is no
> real semantics behind the pointer being passed to
> irq_set_vcpu_affinity(). All that is required is that it is a non-NULL
> pointer.
>
> I expect the following hack to work just as well and not suffer from
> any sparse indigestion. Untested though.

The proposed hack also fixes sparse warnings and fixes my percpu
checker errors, but as a functional change, I have no means of testing
the proposed change on a target processor. So, I can just give:

Acked-by: Uros Bizjak <ubizjak@gmail.com>

from a percpu checker perspective.

Thanks,
Uros.

