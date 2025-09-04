Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35464CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 06:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7qTV76ULDduJGVAW5YsdUFJhj9UbsymbqAIaKqb9Ys=; b=DXU5REmNEz/RVHoPch++/ykxHZ
	x0JsZp4nFugGOj8IwElZpVT9v0GW8ydSd7tdCldzPVI8sQSvZnxM5yk+UacoWlczlVtWzilDcbOzu
	0Lyej+dhrdNJDpqp43Wx9owVgBvvPQ5CTI2RtFWWKjhKr6Mr2bjE/9aJ8dTC5sOYns1hO0QVImSms
	H2a0kFjCZy+5Tdjlx6AcvxbXrniibA1NiyNgRxlZl1wM/krYNGjQ9W8YQnXDljXYTMy00iX6+GPBV
	i7fhWkUlSlBOKbnFuaLJbsfR2As6h8SfQIH8RMn677DDgSq6mkA3owOLzpVLCicOKHum8OKf09Zrz
	a0ApY2xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3Um-00000009Xbh-22XL;
	Thu, 04 Sep 2025 06:30:56 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3Oe-00000009ViG-1bOy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 06:24:38 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24456ce0b96so7580555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 23:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756967075; x=1757571875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7qTV76ULDduJGVAW5YsdUFJhj9UbsymbqAIaKqb9Ys=;
        b=eI7TZyXz5ktIhDJsKAAMe3nvBwE5U39EKjzVGer3P0WV1fIM0ZbHJT3MwUOmqXilsV
         L0YsJ1n3yWsNGwcnXn9NVTt+qSqXcENYyIC8sWRJ7Fm8bOFWZz1yBlRQKgIl/tYwc+4q
         LWyhXFfpCHqpW1M5jQ8XfN8eoPMVsAdhjcH/N3bZDrpl95mBCU6Y66n6jLHWY9i+zqRX
         OIu+wX6U+i/wG42Y8aCCHuGoQ/RIHaUhEjKnO0PY79QGEZ7BpxlK9UgEP32KkTTBYLE1
         8SqKuCE+uZ3XVVYdYHqoJ2s5oC7y9b/9mYBKk/sU4mWn5KAtwWR4DuUhlNAn/WOHBN0m
         uclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756967075; x=1757571875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7qTV76ULDduJGVAW5YsdUFJhj9UbsymbqAIaKqb9Ys=;
        b=jKHBDiQS75h2f+gMUwL4VxYCnxPz6xX3zVwXmVgD5t50XMGXX7+OsxojsINMvefc/Q
         F9rPSz1rxp3SHxroqey0iLOyMkXWuKuxGCaSR5/GiHmDH1UdvNht8Z3SQ4sF6EY7nOIA
         3OpBabt1Z/2G3Vw3WJoRQ2LiMbqCMcw3ipVVzgpqDW98yVNIZlX1iovnUvJ1/Y7l2Yb2
         n5yyfHtXUSBT/Xrc2qpbN1Sr4EUo5g8LE7HWz7mL6Vo9yQ5af86jRJcM1SrqNSaTgZyI
         iiE9It+MQxUhGaTL+wB1jB/37Layyr6tQpQ/kfVaRB1dvrE9VHNyZqRxgrNDvmPq7AZc
         ZkWA==
X-Forwarded-Encrypted: i=1; AJvYcCULatHdmsZ6oncSswvksfrpZohNeKs8DfkFsKF+xZbdN1/LAtowJ4BUdufhngAVz3kYm7Dbpa3uKXzL4imQj+7T@lists.infradead.org
X-Gm-Message-State: AOJu0YwxQ5cwVJaLmtFaufk1VZn8cLgSufpdxYCsY50kFLYcD8QPaRtE
	0IWAq/4jEqFSLIHRXNxydz5N2nYWT6SeBGqSd8mwK3joqsz5laNKYfeB3E0kpMkKC21LwrgK559
	zTykmHw6bzyIa7Flhmt6CUBjD9uFLV62w4G+stAmsyg==
X-Gm-Gg: ASbGncsblbsc1+KZUjwsDjIrJy4r7jLxOxYjiOnRq+FYEmX0OmoyeAdDXVIp8X722rJ
	5iUjXyNIoBxtVF221rEHJnb3SfPQ+pJIy99B/5i78/OFP+cor5iPOSamrZiVM3r+iBXQy0UNEzi
	Pbb/Ek4yNONA9ofCvc82AAljXMW3D9rHuzs5yUVAo1VbuIXx96dRMZYlbGKEsLmK43NZmiFgYkE
	k3cmQC782pNk92v5zo8
X-Google-Smtp-Source: AGHT+IHoFdxbuDjv07lVFMl22mnM/aIaMh25mvdbBCgh16ExZRzUOIBxo9SxO6MD4xOcEcTHtD3JYnMx67qXTku5mb0=
X-Received: by 2002:a17:902:d50c:b0:248:a642:eeeb with SMTP id
 d9443c01a7336-2493ef4dc88mr252425775ad.15.1756967075366; Wed, 03 Sep 2025
 23:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
 <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com> <aLIR3deQPxVI2VrE@google.com>
In-Reply-To: <aLIR3deQPxVI2VrE@google.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 3 Sep 2025 23:24:24 -0700
X-Gm-Features: Ac12FXyqcoq544W7rcjvkJ9YZPU7FqUqKJEMd-35Lr5ym4GwFkYYv0iByho1HQ4
Message-ID: <CAHBxVyHFkNtFdX-vciPvYnTOH=GXvHVW7hjFrLA4MFr9wqWVvQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250903_232436_552556_FA79A832 
X-CRM114-Status: GOOD (  32.51  )
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

On Fri, Aug 29, 2025 at 1:47=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Fri, Aug 29, 2025, Atish Patra wrote:
> > The arch specific code may need to know if a particular gpa is valid an=
d
> > writable for the shared memory between the host and the guest. Currentl=
y,
> > there are few places where it is used in RISC-V implementation. Given t=
he
> > nature of the function it may be used for other architectures.
> > Hence, a common helper function is added.
> >
> > Suggested-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  include/linux/kvm_host.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 15656b7fba6c..eec5cbbcb4b3 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -1892,6 +1892,14 @@ static inline bool kvm_is_gpa_in_memslot(struct =
kvm *kvm, gpa_t gpa)
> >       return !kvm_is_error_hva(hva);
> >  }
> >
> > +static inline bool kvm_is_gpa_in_writable_memslot(struct kvm *kvm, gpa=
_t gpa)
> > +{
> > +     bool writable;
> > +     unsigned long hva =3D gfn_to_hva_prot(kvm, gpa_to_gfn(gpa), &writ=
able);
> > +
> > +     return !kvm_is_error_hva(hva) && writable;
>
> I don't hate this API, but I don't love it either.  Because knowing that =
the
> _memslot_ is writable doesn't mean all that much.  E.g. in this usage:
>
>         hva =3D kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writ=
able);
>         if (kvm_is_error_hva(hva) || !writable)
>                 return SBI_ERR_INVALID_ADDRESS;
>
>         ret =3D kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_=
sta));
>         if (ret)
>                 return SBI_ERR_FAILURE;
>
> the error code returned to the guest will be different if the memslot is =
read-only
> versus if the VMA is read-only (or not even mapped!).  Unless every read-=
only
> memslot is explicitly communicated as such to the guest, I don't see how =
the guest
> can *know* that a memslot is read-only, so returning INVALID_ADDRESS in t=
hat case
> but not when the underlying VMA isn't writable seems odd.
>
> It's also entirely possible the memslot could be replaced with a read-onl=
y memslot
> after the check, or vice versa, i.e. become writable after being rejected=
.  Is it
> *really* a problem to return FAILURE if the guest attempts to setup steal=
-time in
> a read-only memslot?  I.e. why not do this and call it good?
>

Reposting the response as gmail converted my previous response as
html. Sorry for the spam.

From a functionality pov, that should be fine. However, we have
explicit error conditions for read only memory defined in the SBI STA
specification[1].
Technically, we will violate the spec if we return FAILURE instead of
INVALID_ADDRESS for read only memslot.

TBH, I don't save much duplicate code with the new generic API now.
If you don't see if the generic API will be useful in other cases, I
can drop that patch and changes in the steal time code.

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-stea=
l-time.adoc#table_sta_steal_time_set_shmem_errors
>         if (!kvm_is_gpa_in_memslot(vcpu->kvm, shmem >> PAGE_SHIFT))
>                 return SBI_ERR_INVALID_ADDRESS;
>
>         ret =3D kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_=
sta));
>         if (ret)
>                 return SBI_ERR_FAILURE;

