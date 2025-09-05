Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F981CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJnhSI4zKDT3ImFhZhJBvG+6tvoITddVraqHrrqOWpc=; b=gJFQ/pMTdDVIa1AZoV8XCKm5PD
	saS65cGWQI2p1yExwEahV/BpIKJnOk/tmQ7ROjp0aDHMRz0COchlEs6JHcPuwBRT71fZqX8gyHnI8
	ERH/P4pkRMocvAF/3De1xm9dFeXDYHxnYuqC0Y5LgUjsFY8lu4x00lnP3ndlzYwotXf5/wcZHtnVh
	8speFrog8sBvMhLfSWYsB/8/Z88drzOJ3J783yOQSC/01oQPxZ+hIiWRKfMrPB6NhpJK331vcnx/E
	FdCpIePccn5KKCtEqtZSkNaIdlZPzKcS5uinqfoXb+vXGfq6tqdINsA92p31CBquWQIsBmwAEuhrr
	gaQWxtVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTBu-00000000t6Q-052V;
	Fri, 05 Sep 2025 09:57:10 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRjD-00000000Kj4-2jCY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:23:29 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-77243618babso1985540b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 01:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757060606; x=1757665406; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJnhSI4zKDT3ImFhZhJBvG+6tvoITddVraqHrrqOWpc=;
        b=bo2bYEg0OX5SN5y5PV7eGQAF3OOwMia/AxB/0IYbYrI3jIIzfaLe/+q9RIQKkr9tgs
         IanxpyLLfLUl1VVMmGfRUpf9GO52sfd/udARaxTjXT6oBRiyETzf0dw2DpEef1HNF3MV
         Jjhr/R5PlZOdmRcD8GXaTNNZULQf+iJ/msxBoy34qQhlqVEbOfaLjBTXYoEjFCtc1/RV
         y5i0zCwsEKNwPXBHF1Ss60bvWCy5yfu6qkxVym1O1BeZ4w2lhiBNXGMAN83UKJsob5bc
         AqqPtlAOb4iTFDOUGYAIf6DE84LskgXhzjZFx5z4J9SZqedTiDWqf3W0gLNf+51fimO6
         MpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757060606; x=1757665406;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XJnhSI4zKDT3ImFhZhJBvG+6tvoITddVraqHrrqOWpc=;
        b=VFREP9M27peykLd3bpy1eaqOJFKdFszJHMQsIODiyuZ8IaucCbXBKQHD61qqu7ERsO
         JwmNeJMEOkPZtfCKlxLR75jj9FdMZidO+bNauN7A/UeunN6tvE+WG5oHLHJRRNbgxxbb
         uk6kuNFC+zeLqJbrokxZnq6ThczaDw/bW7/yh3+KAwSZhYiaoapvltmhDVI2TED/uGsy
         xWKu8mLQmJ9eYX1CwW8vFqmpz+7V3UAoeBx91IhQNGuDu2F7+W/zb0HBKG15l7yv/IoD
         I5AsDJQntb7wtOuqY+OKj0H2lSt047zTDj9l8Wu9St++7pmurpyVv5G5/I/C2YJjk5R8
         SX6g==
X-Forwarded-Encrypted: i=1; AJvYcCULCv9e5YFmvmADlU8Tcm24eBvo4GukU189YHISF3JOimM61ncLmVkHLbSU7q8OTqzqC5xaMgacdwL+a584j6D1@lists.infradead.org
X-Gm-Message-State: AOJu0YwH9H5qtM+fOINp0Rv6SGUb5eOHRXXPJXnzaHiuXubovoU3lV0N
	MSzB/4gMlIfnepwiW37g8oz9NFz+1H21i6gxUUebqxtCOxfJeNB8n0V6YgbT7lT4SKvnPQqk1sS
	YnE+TkQ==
X-Google-Smtp-Source: AGHT+IF349552GT13Po4cUSXoxXNT8kDuTD1Q1OQDc9T2EDq42EP/PDKUPEXnt4B6nyuOStBDkTUDu8oxLg=
X-Received: from pfgu35.prod.google.com ([2002:a05:6a00:9a3:b0:772:8559:f89f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:734d:b0:24b:c7d9:88e4
 with SMTP id adf61e73a8af0-24bc7d99007mr7502786637.42.1757060606101; Fri, 05
 Sep 2025 01:23:26 -0700 (PDT)
Date: Fri, 5 Sep 2025 01:23:17 -0700
In-Reply-To: <CAHBxVyHFkNtFdX-vciPvYnTOH=GXvHVW7hjFrLA4MFr9wqWVvQ@mail.gmail.com>
Mime-Version: 1.0
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
 <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com> <aLIR3deQPxVI2VrE@google.com>
 <CAHBxVyHFkNtFdX-vciPvYnTOH=GXvHVW7hjFrLA4MFr9wqWVvQ@mail.gmail.com>
Message-ID: <aLqd9bKB6ucarR3e@google.com>
Subject: Re: [PATCH v5 6/9] KVM: Add a helper function to check if a gpa is in
 writable memselot
From: Sean Christopherson <seanjc@google.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_012327_688644_3FE8D870 
X-CRM114-Status: GOOD (  26.94  )
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

On Wed, Sep 03, 2025, Atish Kumar Patra wrote:
> On Fri, Aug 29, 2025 at 1:47=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Fri, Aug 29, 2025, Atish Patra wrote:
> > > +static inline bool kvm_is_gpa_in_writable_memslot(struct kvm *kvm, g=
pa_t gpa)
> > > +{
> > > +     bool writable;
> > > +     unsigned long hva =3D gfn_to_hva_prot(kvm, gpa_to_gfn(gpa), &wr=
itable);
> > > +
> > > +     return !kvm_is_error_hva(hva) && writable;
> >
> > I don't hate this API, but I don't love it either.  Because knowing tha=
t the
> > _memslot_ is writable doesn't mean all that much.  E.g. in this usage:
> >
> >         hva =3D kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &wr=
itable);
> >         if (kvm_is_error_hva(hva) || !writable)
> >                 return SBI_ERR_INVALID_ADDRESS;
> >
> >         ret =3D kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zer=
o_sta));
> >         if (ret)
> >                 return SBI_ERR_FAILURE;
> >
> > the error code returned to the guest will be different if the memslot i=
s read-only
> > versus if the VMA is read-only (or not even mapped!).  Unless every rea=
d-only
> > memslot is explicitly communicated as such to the guest, I don't see ho=
w the guest
> > can *know* that a memslot is read-only, so returning INVALID_ADDRESS in=
 that case
> > but not when the underlying VMA isn't writable seems odd.
> >
> > It's also entirely possible the memslot could be replaced with a read-o=
nly memslot
> > after the check, or vice versa, i.e. become writable after being reject=
ed.  Is it
> > *really* a problem to return FAILURE if the guest attempts to setup ste=
al-time in
> > a read-only memslot?  I.e. why not do this and call it good?
> >
>=20
> Reposting the response as gmail converted my previous response as
> html. Sorry for the spam.
>=20
> From a functionality pov, that should be fine. However, we have
> explicit error conditions for read only memory defined in the SBI STA
> specification[1].
> Technically, we will violate the spec if we return FAILURE instead of
> INVALID_ADDRESS for read only memslot.

But KVM is already violating the spec, as kvm_vcpu_write_guest() redoes the
memslot lookup and so could encounter a read-only memslot (if it races with
a memslot update), and because the underlying memory could be read-only eve=
n if
the memslot is writable.

Why not simply return SBI_ERR_INVALID_ADDRESS on kvm_vcpu_write_guest() fai=
lure?
The only downside of that is KVM will also return SBI_ERR_INVALID_ADDRESS i=
f the
userspace mapping is completely missing, but AFAICT that doesn't seem to be=
 an
outright spec violation.

