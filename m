Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A881FC55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 21:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ijj4vdGluIomNxLmquFU6pFVXzJ7ScyjET2Aj3N8QSA=; b=Nl/vo8TT6g5oIWZ0vfVwthaSqi
	cXs+Ox8/MGQ2yBUk39xQRQWIwjk25B9nAEIYSSZKRwCHedt9CpTCfcoe911rNgzIyOREuSQFxRn/E
	5gyIVx9vDZbQlEyhh5E/s1eO3iCrN92c7jSr+GowLMuo3uEW4/cnDApxUvCWjCOt8AwVj/5P1i8iH
	AZWsojS4B7GsyhEP45N3/IUwAVf5pK6GWDVVu/YjlWPw8K22QV4JxvjafXhbjOr/DBRjC/5NFV8Cv
	X4ghecHsawWPbWkj3r3SfxxDw/i9AiDTQlS1JfG/OHAlgEXfqZJMVs7y1ZoVaWDfyLhZz/9vJOel1
	VUTenL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpv0p-0000000DdMz-31fO;
	Fri, 31 Jul 2026 21:43:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpv0o-0000000DdMR-0P1Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 21:43:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 75D2943E98
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 21:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E701F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 21:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785534205;
	bh=Ijj4vdGluIomNxLmquFU6pFVXzJ7ScyjET2Aj3N8QSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X4fN3hI0eISr4yL7s8jIga4xCyftseWBmBZzcaOoyYE5MbI29mtKq1/FILmpMlhcV
	 nH22vmKiUBCmGokVAYhvZjvWdUwEGuIEwVneCx849AX36zIuEY7W91cTz80KEEMS24
	 JaMLR0QsJaqTiOt4jDKbfmJox7wnK7MseTB2MhfxHu+QnH79//4ITl58reAMYxSUs2
	 QXFBklaEIdF5Ge8MnDHBVggpqeGUMSbN9DHNNINEAl8axXBDYOUEQ28xKT4oKDQ3NO
	 v8V/rNrAZCwfU3yi7FcfyKnLAR/gjT+EyoGkuTbJ2ICQo+DBzFZnSJcY8AME6ve0To
	 jnhpsje7PEptw==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c167bda216fso216902966b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 14:43:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrq0FtHAYo2ZzW9I6wPu8IECYPF5keXgKg8cOnSIYN3gii2K6djzgrFupSlQ0WF1EH5BH7y4flyy2ZB9RbFbslF@lists.infradead.org
X-Gm-Message-State: AOJu0YwWeGJF4h1venMbQjLSajCNAR9PT5pGPrieXW1SPTmAPLe+FJcp
	xGn8y1G4wfJuCH2OZw2krQ/tJMT1xDkHRSKZie4C5rVvfDJpxMC0o80sgPlrdWJw+O+UEGEZWs6
	qWdmm5y3RJngKrQdqAOV/+WeaJPgloMA=
X-Received: by 2002:a17:907:5c7:b0:c16:9bd:39cb with SMTP id
 a640c23a62f3a-c1fe83c9c78mr65074866b.52.1785534204316; Fri, 31 Jul 2026
 14:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com> <CAO9r8zO-eCz-4Gpa_FUjRKPaDj82PP7et7KON4S5QfhRU2J-Ug@mail.gmail.com>
 <am0Wkak_vhy1n_xu@google.com>
In-Reply-To: <am0Wkak_vhy1n_xu@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 31 Jul 2026 14:43:12 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNmjinr53exDSwVKooosz1w2=4qexRF88u21AFwUpfFJQ@mail.gmail.com>
X-Gm-Features: AUfX_mxmaz6udCEjo0Ly-CUEkoOgpG40UmqWTnodi_oXGgnlaAp6cc87pxxAuL4
Message-ID: <CAO9r8zNmjinr53exDSwVKooosz1w2=4qexRF88u21AFwUpfFJQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] KVM: selftests: Add more syscall wrappers, fix hardware_disable_test
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jul 31, 2026 at 2:41=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Fri, Jul 31, 2026, Yosry Ahmed wrote:
> > On Fri, Jul 31, 2026 at 12:56=E2=80=AFPM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > >
> > > Third time's a charm.  Sorry for the spam.
> > >
> > > Buried in the middle of this is a fix for the hardware_disable_test w=
here
> > > it can end up with a runtime of multiple minutes when running a preem=
ptible
> > > kernels on a large NUMA system.  Turns out my analysis/guess in v1 wa=
s wrong;
> > > the problem isn't direct CPU contention, it's that letting the worker=
s do any
> > > amount of "real" work on any CPUs leads to pthread_create() slowdowns=
 from
> > > the perspective of the caller.
> >
> > How long does the test take to run with this series?
>
> Less than 5 seconds if nothing else is running.  ~12 seconds if I run it
> concurrently with mmu_stress_test using default settings, and ~25 seconds=
 if I
> run it on an overloaded system (naively running all selftests in parallel=
).

Cool, I will stop skipping it after this series lands then :)

