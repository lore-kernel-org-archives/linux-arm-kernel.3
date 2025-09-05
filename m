Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CE7CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9FAMAwKb9GlFbqFePz07zPDAIQCDZGG7K5Xfr8FjoY=; b=iu/vA9yjZbcXJEsMFoQ+c0A6+S
	pS5G8Qamk2k7mUPvCKyc4Xuc2UKHbRs3cFCY3qG7gkw+4qQIR5gbqfXEW1qzKYIM/NfIs6ddqf/EM
	oOYCGPnc/42soZj09/31fOzwfA7r0Thnh1rU/fzIUTpYuTBuCLcqHxneb69+XtWQMRt/Yv0D+xqWr
	wLIrvHvl8cU8bTDlh+ObhlLXU5aV2rph+TU1xZ8yGqKZUD0YjEeQnVLSThfWpN5m5EDtX3AvbBWcl
	VX4vSBNL/VZQFw8coMFga7GaAK/RRbolyB3acQMFFlXDRGOyFh4qyPCIini5DC/5MRQboy+CXifnd
	xJ7RCAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugXv-00000005W9l-0yvD;
	Sat, 06 Sep 2025 00:12:47 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uucD8-00000004CFU-2gXG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 19:35:04 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32bb1132c11so1159150a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 12:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757100902; x=1757705702; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9FAMAwKb9GlFbqFePz07zPDAIQCDZGG7K5Xfr8FjoY=;
        b=gO5u3P5mFhdDuTf6XQSVSb9xWxq7q4lN0ZP3bR050ZwIUWI0z2Iji0SPLirYO+ffph
         P0fD3+SW7WjTy2fJ0wsnC6jzZERoi8ttJZaS17g65y2m3wJaV6JRKo5IbDncbSUGYvMB
         hQ7AZVWthMmy1rE8OH3DVeziPa8P1flZIbC4aucYCDNQqilmyTKIEQ/bi4KRMB3ypz8R
         4MoURq4opA7ExNjFCPnExXp4LkDxagQRyYxLullDzqQzeIqtEkXvuqo4TJrIkvX0shLU
         MVm6t4vGALM5fXdAXRXcL6Nah1ckylPVnHgH1o3RdqmsswB10BYyynFHPQU9ZnTdgkZO
         2wFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757100902; x=1757705702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9FAMAwKb9GlFbqFePz07zPDAIQCDZGG7K5Xfr8FjoY=;
        b=NNkUpQqYrBliMXPqiQGqRFRV014ozswJGHxU0btIu9N7OE0GnEhCM5kWGjepxVd/RN
         RqwJeaYADu4Z7hbl6CBB4nXq3+THUu2uD97zZ/QyccOQBL+cKyCVQXK6wtToujwU18ev
         JmEz5hND/TPdUz6IW3Y3/ERftRkcRM79XZkn3S4x+u6dv7weMKDgIInmaRP/9QvFdiby
         abRL2STidJp65L092ID6yNICuQSe0KFy22ZDww6TqfdZPhhYGmU/nTsk3jDxy19Tproh
         akCzyw/rgJAOt/PZv12hv9L2KeEcIr1X+TaDXP/WgszJfaCJptBEPWuBFKowytUpkTPv
         s04g==
X-Forwarded-Encrypted: i=1; AJvYcCXBC26Y/5HmHtov14aMF2N32/Cc9XDhKs0lECpFpNrVvLF7ZjV4cQprCfjRisIZLvKFkkL52WXhwV/83nODaO17@lists.infradead.org
X-Gm-Message-State: AOJu0YyItZq89wpcRHRE2EvkLDD+QS1wxWZ9uHcYflLWM1YoQliyMN95
	NwhfthYrckOv4tA5MgiMin3Fv2XBHrnqWpU6sMGfZF8Dp8EWYEGYvBAqg1f0w5He08H/nra0v11
	OkcU6T/ZMN7zxVSxFN2v2p5W5/QPaMMi1wQabYao5BQ==
X-Gm-Gg: ASbGncsw/fJOJBPUWSHTua8I5/6AjubY+KJY90smVBaaKDsuJiljb2+M57eVmb6IpGF
	yDYt61NjGKqWXdzYfup4Dny5J9zEg+sAis4+FUbYWEVAurNJ901GHE/jo6UtreziWyt/T8APueL
	7N2oBAH1cqWVLGcuVMMbiQPakjDMDb1ZGpHWsZsNbOW4z/v241Pp8QOTlCbE5kP2v3ILcDzzVoq
	azHr4PKOG0ZFi9wUuQ4y8J2ugzNGg==
X-Google-Smtp-Source: AGHT+IHqWqyZqFIuzyIZvE/SUKQfYYN6g516wmc4GuFbgQsfUPht0NsXKsfItF2EyucT/HQ/Jt/iNNsDf0c9xrLH2sg=
X-Received: by 2002:a17:90b:3c44:b0:32b:6223:262 with SMTP id
 98e67ed59e1d1-32bbcb945aemr5935479a91.3.1757100901459; Fri, 05 Sep 2025
 12:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
 <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com> <aLIR3deQPxVI2VrE@google.com>
 <CAHBxVyHFkNtFdX-vciPvYnTOH=GXvHVW7hjFrLA4MFr9wqWVvQ@mail.gmail.com> <aLqd9bKB6ucarR3e@google.com>
In-Reply-To: <aLqd9bKB6ucarR3e@google.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 5 Sep 2025 12:34:48 -0700
X-Gm-Features: Ac12FXzDuYbaevvtu1cjWIBdIgE-JZvhAwCG0_v0qb1Ic8gyKF3DjAY5IEIX5wM
Message-ID: <CAHBxVyE7Tp97GfbH=deaA7gqWQXByno3O3OHbHDJCJ=J7FUQvw@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] KVM: Add a helper function to check if a gpa is in
 writable memselot
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_123502_726333_B4786A56 
X-CRM114-Status: GOOD (  32.35  )
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

On Fri, Sep 5, 2025 at 1:23=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Wed, Sep 03, 2025, Atish Kumar Patra wrote:
> > On Fri, Aug 29, 2025 at 1:47=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > On Fri, Aug 29, 2025, Atish Patra wrote:
> > > > +static inline bool kvm_is_gpa_in_writable_memslot(struct kvm *kvm,=
 gpa_t gpa)
> > > > +{
> > > > +     bool writable;
> > > > +     unsigned long hva =3D gfn_to_hva_prot(kvm, gpa_to_gfn(gpa), &=
writable);
> > > > +
> > > > +     return !kvm_is_error_hva(hva) && writable;
> > >
> > > I don't hate this API, but I don't love it either.  Because knowing t=
hat the
> > > _memslot_ is writable doesn't mean all that much.  E.g. in this usage=
:
> > >
> > >         hva =3D kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &=
writable);
> > >         if (kvm_is_error_hva(hva) || !writable)
> > >                 return SBI_ERR_INVALID_ADDRESS;
> > >
> > >         ret =3D kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(z=
ero_sta));
> > >         if (ret)
> > >                 return SBI_ERR_FAILURE;
> > >
> > > the error code returned to the guest will be different if the memslot=
 is read-only
> > > versus if the VMA is read-only (or not even mapped!).  Unless every r=
ead-only
> > > memslot is explicitly communicated as such to the guest, I don't see =
how the guest
> > > can *know* that a memslot is read-only, so returning INVALID_ADDRESS =
in that case
> > > but not when the underlying VMA isn't writable seems odd.
> > >
> > > It's also entirely possible the memslot could be replaced with a read=
-only memslot
> > > after the check, or vice versa, i.e. become writable after being reje=
cted.  Is it
> > > *really* a problem to return FAILURE if the guest attempts to setup s=
teal-time in
> > > a read-only memslot?  I.e. why not do this and call it good?
> > >
> >
> > Reposting the response as gmail converted my previous response as
> > html. Sorry for the spam.
> >
> > From a functionality pov, that should be fine. However, we have
> > explicit error conditions for read only memory defined in the SBI STA
> > specification[1].
> > Technically, we will violate the spec if we return FAILURE instead of
> > INVALID_ADDRESS for read only memslot.
>
> But KVM is already violating the spec, as kvm_vcpu_write_guest() redoes t=
he
> memslot lookup and so could encounter a read-only memslot (if it races wi=
th
> a memslot update), and because the underlying memory could be read-only e=
ven if
> the memslot is writable.
>

Ahh. Thanks for clarifying that.

> Why not simply return SBI_ERR_INVALID_ADDRESS on kvm_vcpu_write_guest() f=
ailure?
> The only downside of that is KVM will also return SBI_ERR_INVALID_ADDRESS=
 if the
> userspace mapping is completely missing, but AFAICT that doesn't seem to =
be an
> outright spec violation.

Yes. That's correct. That can still be considered as invalid address.
I will revise the patch according to this.
Thanks for the suggestions.

