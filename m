Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB80C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 23:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRuU/m5dc5FtJi/f3Rrw2anhfRohi0i8yf3iq1OlqJ0=; b=daDa4xcbiNGJ57Q9/XiAEjnOqn
	x9nXZm3gU8bXeGHLJAP02ayaxFsgdKF/TiBFlKfGLLFRxLjEl7I1nfc1wzEp0S6/B8Sug/ZS4oeGL
	hrC0fVT2NnxR8xE0ZqrffApq6IHEr7yCdqgJdUG1W/LQEDEkxeufFEyWqSMfZynkQV2YxNHezokEY
	xOFwE266x8FJRaN4hv7P4KsUSecwu4q9hV26lARztriSaajC7vWRU+kHP3d5USTJGBnFd5NEU76za
	bQUdnJ6d8jNzM4u94gmrSDOgBDBoqP6+uYLku2ll7GnMkF1mXjBPcvWA6f3+zTkkdzWIYY6rrCItf
	g+QBuE5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHWaO-0000000EO4v-1cDz;
	Tue, 20 May 2025 23:41:28 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHWYE-0000000ENpO-48Vt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 23:39:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-443d4bff5dfso222935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 16:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747784352; x=1748389152; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRuU/m5dc5FtJi/f3Rrw2anhfRohi0i8yf3iq1OlqJ0=;
        b=d/ylXy/NCiw1OoyzeEwgmVGqwVkW8Qe5gLOd+fL7qkSal606obg6Ow87kAmTbR69vB
         ypLmhSvxC4sRjIqNpOhPgZk5QhdH3LUaQc5atrlDEe8Wg2xVLBHZLtc2EdEnuINOYzRt
         tZxUXY2MmTEz3KVJkz5bkQKUCiF1PmbNzcJMQ8P+wx6WnUCvFPUvNgWi6T7Y40oYK0fP
         4cfuBDTWEHmwl1mJOMKtgYj73kiG12xDp7gLzjrDq74uxnpVi8gg/Unsh3iH/lkirmIL
         aoGniBALhY5ZraiYYaGyqcplkktksDiXhSfh5JMv+jdsUE3ryKaZhq30rwSEiVEiZ+Aa
         1XQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747784352; x=1748389152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRuU/m5dc5FtJi/f3Rrw2anhfRohi0i8yf3iq1OlqJ0=;
        b=ZvQ2wTlA1Z/8KH3USkXpTiKBGmSVvdfKKLoDykoNRSgGGS5XCGtW7LUgH4FaA5hV9x
         QnBkriQx4DIuYJiEAKf9+8C1KmFNJdGDsqwZYQJYOvqk+3cFlwnOCRujCAIaWAZiH6o8
         VG1zd/swTGiwakSWwzXQ+wcfjdmN6EDXGd5S/s94R9EtbFDaOHQ5U8TWQCdsDTKP3UR7
         K9Seg99KHVyjVcUeuSs+ChftinDYGbMEZQZXzQH4Mp+Gq/hzAMsUcugGId4qCpyNlqm0
         HyWeQx/KYbiOa7wcGq3a9PMacGz0c0NW1ASy4MnwanZpPTrE/tOwWhvmED8cTizfsftx
         OR+g==
X-Forwarded-Encrypted: i=1; AJvYcCV2A6NiyOTvryWLfWYP1yNqi8LlaEhraBis13u3vPQzxu+jM83SY2BKFTJ1caVvkNc3UP3Euv/EltYAm80HPSbT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx546sXO/Oc9G0CyeoGp+BsNn8VcRvRYJ0sDFmvsPJUwR/ia+b
	wQtBS1yYXjlGxMgc3BJA12Nu/knnPvfZArZM6tk0G1gqhtC5QbzEVEYg4LmENLcr/Ha00ZN2saZ
	CZoDuKqMEBexol0yyVZDtfvqSSsuzyMKkww/+8EuK
X-Gm-Gg: ASbGncvb3068O232Ts2bd2iGrRsy8foZ4oZl74eJ+NshOHZYSWg0F8NDj+s0wEW5NrP
	p4HzzGRC0aOL+jVlWwmPpspTKjPgivpgtYWAbEbqOJG+goT/aCaYdl6YhjATvsFa3PEIehY+syJ
	h8Oaki8WhC9oI3ZJi4KlnO+23ySxIpq0ssUYkqMCTKkJqIVzLbrQfoYwuTdu8ioZLRR68zfqRt
X-Google-Smtp-Source: AGHT+IEmTo+oS9URXfIuKouUY0B0Y62o5TMKaVmZC8slqtUcsFC1AZMBLwucs8WQvvTTsv5lG6xeERtZDgSchwhBuX8=
X-Received: by 2002:a05:600c:2e49:b0:439:961d:fc7d with SMTP id
 5b1f17b1804b1-443ae3dbdfdmr4250875e9.6.1747784352208; Tue, 20 May 2025
 16:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250505161412.1926643-1-jiaqiyan@google.com> <20250505161412.1926643-3-jiaqiyan@google.com>
 <86zffcefk9.wl-maz@kernel.org>
In-Reply-To: <86zffcefk9.wl-maz@kernel.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Tue, 20 May 2025 16:39:00 -0700
X-Gm-Features: AX0GCFtfiDim2rVM9--MtRE7iY2zI_cJEhnOXz73-OdjqCpU57FjKEAM9M0zDCo
Message-ID: <CACw3F52v_WSR=HkmeW7be+YRFkUzA-n-=mVHHw4wvJK7ongkYQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] KVM: arm64: Set FnV for VCPU when FAR_EL2 is invalid
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_163915_025571_B8D031D0 
X-CRM114-Status: GOOD (  30.50  )
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

On Fri, May 16, 2025 at 8:33=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Mon, 05 May 2025 17:14:08 +0100,
> Jiaqi Yan <jiaqiyan@google.com> wrote:
> >
> > Certain microarchitectures (e.g. Neoverse V2) do not keep track of
> > the faulting address for a memory load that consumes poisoned data
> > and results in a synchronous external abort (SEA). This means the
> > faulting guest physical address is unavailable when KVM handles such

Actually this is not relevant to the code, I think it is just
sufficient to say "This means that FAR_EL2 holds a garbage value and
therefore kvm_vcpu_get_hfar holds a garbage value too".

> > SEA in EL2, and FAR_EL2 just holds a garbage value.
>
> I don't understand. FAR_ELx holds a *virtual* address, and never a
> physical address (that'd be PFAR_ELx).

Sorry my writing is misleading. If you are still interested, the
scenario I meant to describe is
1. There is a SEA taken by KVM when memory load from the guest
consumes poisoned data.
2. The guest physical address (or IPA) of the poisoned data will not
be available in HPFAR_EL2 per architecture register documentation [1].
3. Although HPFAR_EL2 is unusable, KVM can still attempt address
translation with the guest virtual address in FAR_EL2 to get the
poisoned IPA.
4. However, FAR_EL2 is not valid on certain microarchitectures (e.g.
Neoverse V2), so in the end it is just impossible for KVM to know the
poisoned IPA.

Does this clarify things? But again, it is confusing and will be removed.

[1] https://developer.arm.com/documentation/ddi0601/2025-03/AArch64-Registe=
rs/HPFAR-EL2--Hypervisor-IPA-Fault-Address-Register?lang=3Den


>
> >
> > In case VMM later asks KVM to synchronously inject a SEA into the
> > guest, KVM should set FnV bit
> > - in VCPU's ESR_EL1 to let guest kernel know that FAR_EL1 is invalid
> >   and holds garbage value
> > - in VCPU's ESR_EL2 to let nested virtualization know that FAR_EL2
> >   is invalid and holds garbage value
> >
> > Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> > ---
> >  arch/arm64/kvm/inject_fault.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_faul=
t.c
> > index a640e839848e6..b4f9a09952ead 100644
> > --- a/arch/arm64/kvm/inject_fault.c
> > +++ b/arch/arm64/kvm/inject_fault.c
> > @@ -81,6 +81,9 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool =
is_iabt, unsigned long addr
> >       if (!is_iabt)
> >               esr |=3D ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT;
> >
> > +     if (!kvm_vcpu_sea_far_valid(vcpu))
> > +             esr |=3D ESR_ELx_FnV;
> > +
>
> I don't understand what this has anything to do with the uarch details
> you talk about in the commit message. If the VMM inject an exception,
> surely it has populated the exception context itself. I don't even see
> how we'd end-up here (__kvm_arm_vcpu_set_events? seems unlikely).
>

KVM_SET_VCPU_EVENTS is indeed the case this commit wants to fix.
Instead of populating the exception registers itself, VMM can use
KVM_SET_VCPU_EVENTS to let KVM do that per existing KVM doc [2], e.g.
when VMM handles the KVM_EXIT_ARM_SEA introduced in the previous
commit. The intent is to tell guest, for example, to not use FAR_EL1.

[2] https://www.kernel.org/doc/html/v5.10/virt/kvm/api.html#id3

>         M.
>
> --
> Without deviation from the norm, progress is not possible.

