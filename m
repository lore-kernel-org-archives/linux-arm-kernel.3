Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DB2CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFP7K7Lzf/qFmjwBHFqhDwhsq/kaKAVcEgRqthL+0Is=; b=POyXBeQOWoRh5sycRTCCAAH/Kn
	6xhWwiDdwa7jaoPo4p3XZfg05vUHLPnZyhsc/to9K2B/QRO0d5mxrkgsCqHxek3Ok/jxV6NVvSUal
	b42sZ9SCKQgPBVDjOuxdU1hIUCewBC209UzK0KVOPNvpL9ipO/yzVCpWk4sprVZKqPWPtc0s2RenH
	NwUFChvCxRLH0rFzLi4RKOWHX6kDtQdlJ7xkCnGTmrmF3+xlkMxA7it0W9jzyoDYFgWrZpdImeb3o
	8GbDroEdouElDB5H6kT9YQu/DOVb6GSkkS3uNsbUzNTmB5je9bIAC2l9R3doM8mwTKvJ5PFXVm4u9
	MSAK8ngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCOF-00000003CX7-3JIc;
	Wed, 13 May 2026 16:24:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCOC-00000003CWK-0fiH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778689490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LFP7K7Lzf/qFmjwBHFqhDwhsq/kaKAVcEgRqthL+0Is=;
	b=IJf3EkUfuVP4EsPAtaDOgkireDU7uR4TstpDJDtLqAIjeCV3hsTLkJnWAZzSPqyCkxmaUD
	efp5MASCG2R0mob1qdxgpjp8EB5Cy1RAD+2tPEXSyLmAOtEBM4OfRdNEdVYch1lWII7yQ2
	FvLLFilFz3HDyNe+AnDPAgLbhQjmsNs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-E_RGYOhKP4CDGPEKK8Yrpw-1; Wed, 13 May 2026 12:24:48 -0400
X-MC-Unique: E_RGYOhKP4CDGPEKK8Yrpw-1
X-Mimecast-MFC-AGG-ID: E_RGYOhKP4CDGPEKK8Yrpw_1778689487
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-44bf1ac8893so6120907f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778689487; x=1779294287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFP7K7Lzf/qFmjwBHFqhDwhsq/kaKAVcEgRqthL+0Is=;
        b=tWe/q22wwTSL+QJzqrSdncA1uLGYuUxtwgRKQHCw3NRo6EZA2XvK039WF49Bgq3wl/
         aU5P9K5o3XJ0FTY4cc0vtWREBGQLOYPFHFiuktNf0ub4cuaHeqyeId7Q6ojoP6z37DNv
         ZaE717ik37kUOTWwm431FMn7W20YHoBYtif7fp4yotXocVmUa1ZE5gzg2Q35N9mERea8
         lG6mVZLrZde/pD7xdcxgE1p5aKFq2Zv/SVuWpCm/Dho8+4noA/OV3q9XX9zahptP+jxk
         vomqf6lyj26aUDJyh3aIC7RgM/mUkQ+GwofZSZhlFssnNbgI/Qok/T9BPotJajzvVCOe
         /gcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lNds1KlsvkL2AHbZQ+z0xy3+yHZ0RcvCaCuqnPP6ZZbvplrh6M8dbmDnW5mSbmNM+ZtS0nDEE+e+Pg2S2MlnH@lists.infradead.org
X-Gm-Message-State: AOJu0YzSvREXCfRoX2u9N0BrgyDB+MqPtw1v68UBRwmeFbV8cyUSBXI+
	Jb8yWmXZjCasB1lgZ5ntst33BRxOIRKBj9FgfB+znuHsf6YUl2o5y3CwX8wgxKhraiDbdZHk/Mz
	vwrNarTnUVrz0Hp9ATgKXJi+d+Bi9wSGv80pcgSH0v6x5nIRd3hDY8+G7ju45jOZHU954s7VHld
	KjU+nBRhP20RpaG9jGZKzCzzKTeyHxMAj4mxeIfC3YY7O+W+xRFuE=
X-Gm-Gg: Acq92OHi3KPJBKtnfUSvtEw6qLl/yi8z4R8qNb6rOkS65J/E8+y6vE4LevnbhNTlOX3
	XrO7+uxulBQ/q/F0m8NANE/OAEDIeGcVfgpi6sc6t3SwYk47rRIDT2aWhwwWYDENCu5u4+fq3H4
	fb05C+mu9dz0Vm09FA7DQN/ZuiieygwQvjnPnS9zG8mGStiuvGCNZeHhkEL2IkYMIFTqg4uy18A
	TNzvGy4r9Ma6Ipe9WvFO8kNxlBfVKeRLMj8ICNVNR1/x3JPYlGwByGWaZ8lPBzksnbmbqBIHahD
	hLph1yej
X-Received: by 2002:a5d:5d0b:0:b0:43d:7d24:b4ff with SMTP id ffacd0b85a97d-45c7b85de69mr5836094f8f.40.1778689486798;
        Wed, 13 May 2026 09:24:46 -0700 (PDT)
X-Received: by 2002:a5d:5d0b:0:b0:43d:7d24:b4ff with SMTP id
 ffacd0b85a97d-45c7b85de69mr5836059f8f.40.1778689486387; Wed, 13 May 2026
 09:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <6856b269d2af706eae397e0cf9c1231f89d9a932.camel@infradead.org>
 <6afc4b95-3c15-4d71-877d-19b84e91ce05@redhat.com> <57bc082f4824d6114d3156744c25986effc29aca.camel@infradead.org>
 <baff82ca-6321-4b16-aa61-b2d6d60b6535@redhat.com> <86h5obya2r.wl-maz@kernel.org>
 <48b06e5655d56ff6eda30e563b34894fa0eb2f07.camel@infradead.org>
 <ba08dfe9-932b-40c3-9fdf-fc891d52e1d8@redhat.com> <d9d4471a7f5ec1e297b3ca07f42a59090aa91e15.camel@infradead.org>
In-Reply-To: <d9d4471a7f5ec1e297b3ca07f42a59090aa91e15.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 13 May 2026 18:24:32 +0200
X-Gm-Features: AVHnY4JneGWlgI2TZN3pA0snVaHMgFYvSCN-3eBEab4JAE5jQOEAQHtyebNrVkM
Message-ID: <CABgObfaM-JtNn2MuYXaiadQnLfAhTEaoHAcTG9=J6LkMcQCJ3A@mail.gmail.com>
Subject: Re: [PATCH] Documentation: KVM: Document guest-visible compatibility expectations
To: David Woodhouse <dwmw2@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, kvm <kvm@vger.kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Jim Mattson <jmattson@google.com>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Eric Auger <eric.auger@redhat.com>, Kees Cook <kees@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, kvmarm@lists.linux.dev, 
	linux-kselftest <linux-kselftest@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M4aRMe36ovW1tGjBZlr_34WOsYhPgF3WQaY4P-eQm98_1778689487
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_092452_273629_094CD289 
X-CRM114-Status: GOOD (  38.27  )
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

Il mer 13 mag 2026, 15:57 David Woodhouse <dwmw2@infradead.org> ha scritto:
> > x86 doesn't do bug-for-bug compatibility, thankfully - we have quirks
> > but only 11 of them, or about one per year since we started adding them.
> >   We only add quirks, generally speaking, when 1) we change the way file
> > descriptors are initialized, 2) guests in the wild were relying on it,
> > or 3) it prevends restoring state saved from an old kernel.  Is there
> > anything else?
> >
> > https://lore.kernel.org/kvm/e03f092dfbb7d391a6bf2797ba01e122ba080bcd.camel@infradead.org/
> > is an example of a bug that "no SW can make any reasonable use of".
>
> I actually believe that the focus on ICEBP was triggered by some weird
> gaming software's anti-DRM mechanism, and that it *did* affect actual
> guests in the wild?
>
> But yeah, *fixing* it should not have any adverse effects. That's the
> key.

Yep, so "bug for bug" is not it.

> > That is *also* obviously nonsense though, isn't it (see example above)?
> > The truth is in the middle, "once it is in the architecture" is likely
> > too narrow but "once it is in a Linux release" is way too broad.
>
> How about "once it is in a Linux release and guest visible, and unless
> we *know* that changing it in either direction underneath running
> guests cannot cause problems".
>
> > And besides, both miss the point of *configurability* which is the basis of
> > it all.
>
> Hm, configurability *is* the point, I thought.

Yes, and configurability goes way beyond bugs/quirks, which are to
some extent a red herring. Configurability for example says that "KVM:
arm64: vgic: Allow userspace to set IIDR revision 1" shouldn't be
controversial at all.

> > So we have the third case, "restoring state saved from an old kernel".
> > If this case arises, I do believe that Arm will have to deal with it and
> > introduce quirks or KVM_GET/SET_REG hacks.  Maybe it hasn't happened
> > yet, lucky you.
>
> We literally have those mechanisms already.

I am not talking about guest-visible changes across save/restore here,
but rather about round-trips through userspace. For example, see the
effect of KVM_X2APIC_API_USE_32BIT_IDS on KVM_GET/SET_LAPIC: it
couldn't be made the default, because userspace expects to take old
data returned by KVM_GET_LAPIC and shove it into KVM_SET_LAPIC. Sucks
but can't be avoided.

> See commit https://git.kernel.org/torvalds/c/49a1a2c70a7f which adds a
> new guest-visible feature in revision 3, but allowed userspace to
> restore the old behaviour by setting it to revision 2. All my patch above does, is make it possible to set it to revision 1 as
> well. Because https://git.kernel.org/torvalds/c/d53c2c29ae0d previously
> changed the behaviour and bumped the default to 2 *without* allowing
> userspace to restore the prior behaviour, and we've been carrying a
> *revert* of that patch.
>
> Why would we *not* accept such a patch?

Agreed. Even ignoring your revert, there's no reason why any upgrade
past 49a1a2c70a7f has to be from after d53c2c29ae0d.

> Marc seems terribly insistent that we SHOULD NOT
> restore the behaviour that older KVM offered to guests, and we MUST
> change it unconditionally underneath running guests, making these
> registers writable on upgrade... and reverting them to read-only for
> running guests on a rollback.
>
> And there we do have a very different viewpoint.

That's the design decision I mentioned, of not starting the guest
configuration from a clean slate. I believe it complicates things
because you have to design from the beginning with the ability to
rollback to old versions and to potentially detect conflicts
introduced by the rollback. This is exactly why
KVM_X86_QUIRK_STUFF_FEATURE_MSRS was introduced: "KVM's initialization
of feature MSRs during vCPU creation results in a failed save/restore
of PERF_CAPABILITIES. If userspace configures the VM to _not_ have a
PMU, because KVM initializes the vCPU's PERF_CAPABILITIES, trying to
save/restore the non-zero value will be rejected by the destination."
(https://lkml.org/lkml/2024/8/2/1032)

For Arm, however, it may be too late to change it; if not, I'll
happily watch you argue with Marc about it. But even without that,
this doc patch (and the idea that "Where a new kernel introduces a
guest-visible change, it provides a mechanism for userspace to select
the previous behaviour") should be uncontroversial.

Paolo


