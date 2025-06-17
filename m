Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26C9C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5Zyre//7L5S9K+V+4OPyWpG1CcHuDNKjA2A/jB3Ga8=; b=wgjwvMmg9G0SWxTASvBTsDf6yT
	uickEU9XHHnLnkeDJk2JSDm57Z9RB9Wn84dz+tgxLGudhPFfhe/SXlzkY+vN3MAXgh2c+RrG2xYWq
	V9gVAICtIbTBRH0RcbR/7kCh7PzczF+/saew7aD7pQ16gU+kqN5yMYYuk5rjUBvW2AW7RlPnJ8d7T
	s6z7FKIIMI0Ej21jEP1GeGWUiquNc+ngGjJUm7hv+I5wiClHgW8W1HTZnIbQiauwunESrVsDYrK2U
	om8wKB6pBS2ZbAi+any58yYhedtCcilxfm4/qLpAz0eHxfPVcRcHINJ8Su8cboXF9lX0w+c3PBzOV
	Nvt9OsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZrn-000000080cX-0b86;
	Tue, 17 Jun 2025 17:12:59 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZFT-00000007t5Q-1KZ6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 16:33:24 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7377139d8b1so5467322b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750178002; x=1750782802; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5Zyre//7L5S9K+V+4OPyWpG1CcHuDNKjA2A/jB3Ga8=;
        b=mDPByK3Ea4L2UnXXXfc7tSXtwVkI3ZtBHaDJUVW4wODM0Rom2eggNIUSHA1WThzsQ6
         B/gX9BuV47m5e+sEuDygZtUEDu6CTaV8tpVWIhHOKPPphGjP0oxnZJo5HrvlgkTvysFN
         XAQjhQc6p0j244QVPhT09+57BGc4dvZdhc0Ez1QLIYpflTHxZ8Unw6A767gYFN4AkOy0
         qMQBvOiVmaCyBI8gtv1hNl+KqD7KboBf6yd8/ziS+OKhgi064WDFRcBkjHgl54cz6u6E
         MHB85a6JQWzXIvueX7OtxsqsYLHYZb28w+E0/sNqHdqsKLcmAL2oD3s577hNaekB8cjB
         rawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750178002; x=1750782802;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m5Zyre//7L5S9K+V+4OPyWpG1CcHuDNKjA2A/jB3Ga8=;
        b=exnRLXuYRdzY9pnRIM7AdAMZAwxJNUmKF2HFcYcCovyXOBX0euTMIeypwtzSIGAa2d
         EqkBrxijM72kaT1dBw9DM+HlaK9CIuRTvTls2BspJhb/DordvhPYfLVkmR8XeoMZPKQx
         NLUTJ5vlPlC/QqikeQeRDCXh44uoNePFyxFJAh3mqVa3/83ER1Ch9xuQS+s2cYtCS5R8
         0ku+BF4BYtlmFsUKTF+JQvjtJt1sKlT5LgZ7jE+YC6w83yE5lFe1tbZgrHGkZj7fXeZ3
         82bDc/nM1ayVEPwhORUeDilE8J66txTmQ23KJ5TYdXgIYKfv+wixfBZ82vgzagde1bWd
         oq2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTP124Nsld+w5yXbmS3+UhYOQXA099Gc+sR27d5yVHnIrzs6xCBhnt/tJRjd8EX6vnW6LAcKUalFYqb4QfhdiN@lists.infradead.org
X-Gm-Message-State: AOJu0YzcFoKk+TuvW0RVpKmzAhaCIp1GlTfLtLQn8gjkeEm4xh+w/KWQ
	azXlpl9/mgWGhmrVfb/yvuFB4p541uLaGch/88iyFBBFlrqR4/Yj9WqnXtdJzJdGZQCRwfNGS9p
	5psUDDw==
X-Google-Smtp-Source: AGHT+IGznCbVopLyCbJY+8Q1ZM+hTyrpfcDqYdoxZ7oVyP5z618lCsgFgNDzhTDn4xHf3X8k9i95X2JuvoQ=
X-Received: from pgbdh21.prod.google.com ([2002:a05:6a02:b95:b0:b2e:b370:6975])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3298:b0:1f5:5a0b:4768
 with SMTP id adf61e73a8af0-21fbd558b04mr20200215637.21.1750178001731; Tue, 17
 Jun 2025 09:33:21 -0700 (PDT)
Date: Tue, 17 Jun 2025 09:33:20 -0700
In-Reply-To: <qusmkqqsvc7hyuemddv66mooach7mdq66mxbk7qbr6if6spguj@k57k5lqmvt5u>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-15-seanjc@google.com>
 <qusmkqqsvc7hyuemddv66mooach7mdq66mxbk7qbr6if6spguj@k57k5lqmvt5u>
Message-ID: <aFGY0KVUksf1a6xB@google.com>
Subject: Re: [PATCH v3 13/62] KVM: SVM: Drop redundant check in AVIC code on
 ID during vCPU creation
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_093323_364163_E298377D 
X-CRM114-Status: GOOD (  21.26  )
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

On Tue, Jun 17, 2025, Naveen N Rao wrote:
> On Wed, Jun 11, 2025 at 03:45:16PM -0700, Sean Christopherson wrote:
> >  static int avic_init_backing_page(struct kvm_vcpu *vcpu)
> >  {
> > -	u64 *entry, new_entry;
> > -	int id =3D vcpu->vcpu_id;
> > +	struct kvm_svm *kvm_svm =3D to_kvm_svm(vcpu->kvm);
> >  	struct vcpu_svm *svm =3D to_svm(vcpu);
> > +	u32 id =3D vcpu->vcpu_id;
> > +	u64 *table, new_entry;
> > =20
> >  	/*
> >  	 * Inhibit AVIC if the vCPU ID is bigger than what is supported by AV=
IC
> > @@ -291,6 +277,9 @@ static int avic_init_backing_page(struct kvm_vcpu *=
vcpu)
> >  		return 0;
> >  	}
> > =20
> > +	BUILD_BUG_ON((AVIC_MAX_PHYSICAL_ID + 1) * sizeof(*table) > PAGE_SIZE =
||
> > +		     (X2AVIC_MAX_PHYSICAL_ID + 1) * sizeof(*table) > PAGE_SIZE);
> 						    ^^^^^^^^^^^^^^
> Renaming new_entry to just 'entry' and using sizeof(entry) makes this=20
> more readable for me.

Good call, though I think it makes sense to do that on top so as to minimiz=
e the
churn in this patch.  I'll post a patch, unless you want the honors?

> Otherwise, for this patch:
> Reviewed-by: Naveen N Rao (AMD) <naveen@kernel.org>
>=20
> As an aside, there are a few static asserts to validate some of the=20
> related macros. Can this also be a static_assert(), or is there is=20
> reason to prefer BUILD_BUG_ON()?

For this particular assertion, static_assert() would be fine.  That said,
BUILD_BUG_ON() is slightly preferred in this context.

The advantage of BUILD_BUG_ON() is that it works so long as the condition i=
s
compile-time constant, whereas static_assert() requires the condition to an
integer constant expression.  E.g. BUILD_BUG_ON() can be used so long as th=
e
condition is eventually resolved to a constant, whereas static_assert() has
stricter requirements.

E.g. the fls64() assert below is fully resolved at compile time, but isn't =
a
purely constant expression, i.e. that one *needs* to be BUILD_BUG_ON().

--
arch/x86/kvm/svm/avic.c: In function =E2=80=98avic_init_backing_page=E2=80=
=99:
arch/x86/kvm/svm/avic.c:293:45: error: expression in static assertion is no=
t constant
  293 |         static_assert(__PHYSICAL_MASK_SHIFT <=3D
include/linux/build_bug.h:78:56: note: in definition of macro =E2=80=98__st=
atic_assert=E2=80=99
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
arch/x86/kvm/svm/avic.c:293:9: note: in expansion of macro =E2=80=98static_=
assert=E2=80=99
  293 |         static_assert(__PHYSICAL_MASK_SHIFT <=3D
      |         ^~~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:203: arch/x86/kvm/svm/avic.o] Error 1
--

The downside of BUILD_BUG_ON() is that it can't be used at global scope, i.=
e.
needs to be called from a function.

As a result, when adding an assertion in a function, using BUILD_BUG_ON() i=
s
slightly preferred, because it's less likely to break in the future.  E.g. =
if
X2AVIC_MAX_PHYSICAL_ID were changed to something that is a compile-time con=
stant,
but for whatever reason isn't a pure integer constant.

