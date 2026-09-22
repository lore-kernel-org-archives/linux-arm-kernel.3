Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1301C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsMfNykkK/cvGUxGrrzkLoJGO5iJ1c5hJgEqfch5614=; b=aHjVcQNdCMKKPUfWMFSFLaz+O4
	/JtNoFsW2O0DoloozbBwi8r/XbMMnj5YRrvOn4Q0oKMlpus/69KeFM2ao2W3O2FVvIXuJdSxoz3sE
	2SlASBSJsbD+1mJfc+pkWaB43+OPnlV6lxziz/5rcYuA7ykEqgDH92gWAyG7Fbg4sBigHsOBl9NOP
	qsbJh15rufqbwj5VFPPoZeTS5+JtnmwCrcWMa18D7KrVwUDgJ1IqT0C55pgn5+C1A1SxvIrZronn/
	/cksnQXHmxRCaTglWnr013hc5LOrtwu2bQVdaXjFKMIkH2hZTPktzdhYMdzLhInJ1lkgvEkM3YSFq
	TM0nzNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95VX-00000006Kyd-1sDu;
	Tue, 22 Sep 2026 18:46:23 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95VU-00000006KyB-3q7x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 18:46:22 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so227556a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790102779; x=1790707579; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsMfNykkK/cvGUxGrrzkLoJGO5iJ1c5hJgEqfch5614=;
        b=jpQ2XLvbEh2fD8ttm4os5/GWrfsPHTpfGY3jXSRYA1YN/TpB1sUvrIwFbmKlsVJLAP
         cbornbhf5KG3ydUiMxdzIbL/YAIONvpwJonF1VjKeZsOmzYZ6egyWv4aiBS4R65tTXFL
         ZmxWRYC8meMW73XTkUi0a1YQBx1EyEJcWK2vi7cdvVa9UKGaVFnDacZlo5BISRhzUMrO
         8lTjwxbAgmni1enMWEEBxbTYzCXGTEnO5R97yrbeqQiQkByMMT1vPu/sFQUhy8XzDAj1
         UtxgT5YMGShGLgSKjr3nPh1kyaDyTohS5EB8t60BIipp5DMpuTqKazjX9MY+q2DV3EVA
         yrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102779; x=1790707579;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wsMfNykkK/cvGUxGrrzkLoJGO5iJ1c5hJgEqfch5614=;
        b=pK+i1kBMFWvetF8JVsITkc8XMPxU78zY34AyKkWpUVjRGVaAd6Ga5x+04qleYs1Fop
         B7meFiN5YLlLLqy/vz+pXEx35tpGoS95A2WWss1ttf4OiD4mLMw9gXTfKHT5R+rcGRGe
         v5okCWOmWouPpcRDxD+Wad02Xi8r1mOl5IdRXRrV96OV4UuSm/l6GompFC554pNTQeHq
         8RzPiv/xKnL/b5m9ScM+4MvOEFIwlwg+f1iV9pM1Gu2d4gME6xIF65hPHlV7Qrrfy+LW
         fAIwOJpdmheSbYQshuJebq8SCgcsnKv0/wj2Xk8gSkSZwLP3mw424hQq2bcrRcfy1QBe
         FUvg==
X-Forwarded-Encrypted: i=1; AKwUvBx0cy4OrPlbQwEyG3iWbFAeqeNe8hMaq4sSFjZcFTnFiABbHVuX6UZoOYLJHp8SpvKkPPm5DZeOCMNshUFxl+TL@lists.infradead.org
X-Gm-Message-State: AFuF++n+nscHw0SB30kM6GP9SfiynLwmzC2MAgQGUd5WTbsDhmtZZpqA
	7Z8zawgd/9hbcWD1Zx/8v5KYDemv0z7uW2fBmH29SHFo9gAzZV/Wk37yuev89weffXcuFYP7yTV
	skKPO7g==
X-Received: from pgdh8.prod.google.com ([2002:a05:6a02:5188:b0:cc5:1d7c:ddeb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1bc3:b0:3dd:a197:cf2a
 with SMTP id adf61e73a8af0-3ddf82c4849mr289558637.78.1790102779162; Tue, 22
 Sep 2026 11:46:19 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:46:18 -0700
In-Reply-To: <arLJ4AbNN9Y_IUna@gremlin>
Mime-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org> <arKxjsxuO1F5ExrY@kernel.org>
 <arK5n9HrbZMCOHOt@google.com> <arK5ynpRi7VbY7Ek@gremlin> <arK8seJVT9wYgVCP@google.com>
 <arLD-eZ6dRvfZ52q@kernel.org> <arLJ4AbNN9Y_IUna@gremlin>
Message-ID: <arLM-vJDoO7gQJXM@google.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
From: Sean Christopherson <seanjc@google.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_114620_956212_1C68F823 
X-CRM114-Status: GOOD (  30.78  )
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

On Tue, Sep 22, 2026, Lorenzo Stoakes (ARM) wrote:
> On Tue, Sep 22, 2026 at 11:07:53AM -0700, Oliver Upton wrote:
> > On Tue, Sep 22, 2026 at 10:36:49AM -0700, Sean Christopherson wrote:
> > > On Tue, Sep 22, 2026, Lorenzo Stoakes (ARM) wrote:
> > > > On Tue, Sep 22, 2026 at 10:23:43AM -0700, Sean Christopherson wrote:
> > > > > Rather than have kvm_arch_vcpu_allow_pre_fault_memory(), what if we add a more
> > > > > generic kvm_is_vcpu_loadable()?  That way we don't need to worry as much about
> > > > > the return value, the connection to vcpu_load() is obvious, and we don't need to
> > > > > add another pre-check if future (or cleaned-up existing?) ioctls want to do
> > > > > vcpu_load() in common code.
> > > >
> > > > ...this is exactly what I started out with.
> > > >
> > > > But then you are in a pickle, because _really_ you need to do that check in
> > > > vcpu_load(). Which is a void function. Which is called by every single
> > > > architecture all over the place.
> > > >
> > > > So you'd have actually no way of signalling the error back.
> > > >
> > > > Of course those places are arch code and you could say 'arches should know
> > > > better and if they call it it's fine not to call the arch 'can you load'
> > > > function.
> > >
> > > Yes, that's my vote.  It'd be easy enough to clarify that "rule" with a comment
> > > in linux/kvm_host.h.
> >
> > I feel like trying to make this generic will wind up under-documenting
> > the single example we have with the pre fault ioctl. Putting the comment
> > into a header practically guarantees that nobody will read it either.
> >
> > I'd favor doing something like below and sticking the comment inline in
> > the ioctl handler. Unless I'm missing something blatantly obvious, I
> > don't see why the x86 or s390 pre-conditions can't be tested early too.

Oh, they definitely can.  I'm a-ok with using kvm_arch_pre_fault_allowed() on
s390 and x86, the only option I am against is adding kvm_arch_pre_fault_allowed()
but then not using it on architectures that obviously perform that exact check.

> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -3961,6 +3961,11 @@ bool __weak kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu)
> >  	return false;
> >  }
> >
> > +int __weak kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
> > +{
> > +	return 0;
> > +}

There should be no need for a __weak placeholder since this code is guarded by
CONFIG_KVM_GENERIC_PRE_FAULT_MEMORY=y.  I.e. force architectures to define the
API.  I don't think it's a coincidence that all of arm64, s390, and x86 ended up
with restrictions; pre-faulting is far from a simple operation.

Actually, that's an argument for a dedicated kvm_arch_pre_fault_allowed() versus
a generic kvm_is_vcpu_loadable(): it helps force future architectures to actually
think about when exactly pre-faulting is safe.

