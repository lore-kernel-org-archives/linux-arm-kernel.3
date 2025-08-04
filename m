Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB9BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 12:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktd0JN0bhMpCqOyvDaN3st69xiJStXvUJcRQtdXWfaU=; b=sTtK5WKgwsyU8e9I8kTc1KDZqL
	42JYe8A7IfSFRwTT/MObX8Y7z2ZoWbVV+meC9X0eveLiGc/yXMx2tMjYfrUKh10uWghuAKE24vLz1
	abjKnyxTz3ZyR0X0lTzp6XByJtwRhW3CJ/6L7Y9atr2zTYA3SmwDItWfacyy5mKBCXpGZOj1W3K2y
	S0lENXf2qis8ZUN/6vvuNoS28pffbjig90RcrMUceeL7EEooHmqiT8KrGQUOubjXONPHWLe7Ygsh1
	9xWGehzyRyy60zBEKF7rY9NKvxU1K2fbLzBCRiSnSdsraA59PQovIricMkFn53gYsym/uLyl23TSl
	JvXvueRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuRu-0000000AODt-3mvz;
	Mon, 04 Aug 2025 12:37:56 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiu8U-0000000ALnv-3r6p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 12:17:53 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7682560a2f2so4112943b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 05:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1754309865; x=1754914665; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ktd0JN0bhMpCqOyvDaN3st69xiJStXvUJcRQtdXWfaU=;
        b=QDiYxSIXSTo4dZm19u0ToDDuwr8VnILqkx8GauY0x+HZhZLse54kwTFwkyPnxOjPOm
         E5n4O82G23lpNzPT7qOi3d6VT1txCuw8ZL996U20+nLbGcdqcFy7iIroW9DF7OYYVFus
         A4i04GuebDzun2aF23AxzNMCUJhmpeZwAWCARncvPvkwDr5dcMNkWw/qM2w3jct53fX1
         Amz6EOMNmpZb97qqQe7N1d4iagRDXzK50BA6ZXnL1NeqmlDxMgjJ5/W5pjqUhXZ5aA50
         Wi2jLeFoK7s+Ms/cIhRERGKNXdsN6AKvY0iwA367yz9ZReDQIUFDJxzaJAZwSKdfsFVL
         0ICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754309865; x=1754914665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktd0JN0bhMpCqOyvDaN3st69xiJStXvUJcRQtdXWfaU=;
        b=ulqeVBH2cJP6+vwH7Fcp8t7RsNBaaekRIW5J+dGLZKnlINuHJLuqbUv00dVqTNgyQy
         t9w8UIhPuuK9RdW4k6iNB0EqAWfvk5KIKOJwFNL6hrsXM3qmOJLDzE58EeWoK3T8KZZ6
         oI7oGgGBMZvBOFuLsVPbTt/0rv2eIPVFWYR1knCLpjdQjSHjm4kcu6kFYIpdkeoCtSbc
         JVxoFy7kOUKy2nSSUOJSjZFRrIcLE9D5Pv7ZBO7HkqN869rJE7uwKEGpcrwM42xRRnno
         Bo+yVwHIuXaIttQsfYVZSQkcXFfx5dEEmld9dGVadknmTIq7aTCSE68OUxSSFsNHWzTD
         7eXw==
X-Forwarded-Encrypted: i=1; AJvYcCWumxm2+Pa0U/BO+qb+3HiHG3iAtrIQZxUehPJRok35Tz1MzRRr53FG4zi/2fhHxbOjdGM6cJCd2ipKcBiXLKUp@lists.infradead.org
X-Gm-Message-State: AOJu0Yys4Kvjzv++7/iCBZlJ7UPCFcUlZF2Meioqp2OS5YW5avRIhfmD
	psWBz7xjGY1CN41EiY2sov3pIopK0ItI/M/XL1avKx8r/Q5MrbWFyQdb9bhq3uNixO0az8Mmfky
	NdL9De2QnfZHospmpkusSOTwUi8ZMZ0J+qm2kk642xHfialbvLSpZDGiYISuncjtV/Mh9pHyc3/
	nKJ4Jn6QlmLA==
X-Gm-Gg: ASbGncv0caSVA8z5Wgy7a/iBblM8xXo1Jd8iMzBrbG/FOgl/VN/TfgOmntIXD9I7yLD
	JpuYNm9YZeQq2PzbVuqjTSms/6yF9Rny1Dj2JW7eCvx2qJWWqNJjLGKq1PaHHL6tFougoG902eD
	MCcGppcACEVdxy46fSQX4Av6oaUTmarbabNg6VzHEvpNxh0kn7bOqE9JlJJp4eYBiefPzC702AB
	PQ3ysRAGAcOouccmqUN1kXsFkdti5y2TYyAiwZi+MQNlhMe1q+YGArRF5qU+Ed2/9Pvl9o8leg2
	g6kAprQKbtnElGHqibM2Uu17BAtHB7IM5a7RPnDqz0dRPPEhywIgEwq5reE6OMXrlfwXMOKB4HK
	BQIeG8LvooIYRJTxKryC6Q4JWRujva8Xxf43MC4ZTbbUcPARIeUgeDY0SkcUy
X-Google-Smtp-Source: AGHT+IF5p6gKayCUrAAvuWYcfZabjhqxiReCyBd2h1TZV7/HKyAQbFyYs3JUb60Q0quq7V+1kO2U/w==
X-Received: by 2002:a05:6a00:189d:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-76beaa83acbmr11450110b3a.11.1754309865033;
        Mon, 04 Aug 2025 05:17:45 -0700 (PDT)
Received: from zenbook (1-162-100-196.dynamic-ip.hinet.net. [1.162.100.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd22csm10541915b3a.65.2025.08.04.05.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:17:44 -0700 (PDT)
Date: Mon, 4 Aug 2025 20:20:15 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, mark.rutland@arm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com
Subject: Re: [PATCH v1 1/8] KVM: arm64: Rename pkvm.enabled to
 pkvm.is_protected
Message-ID: <574cl7kjaxdpmpthrdkysvsr266o76anmhblrxqgomlfbgeexa@vhsj33febheg>
References: <20250729120014.2799359-1-tabba@google.com>
 <20250729120014.2799359-2-tabba@google.com>
 <szsqsx77mjo4kdawzcboud4eawuvz3sye4grmx5n74qzze26ap@xbfwc44ruetx>
 <CA+EHjTxMoVD=ViS8rC+4oiLojQpobfnxHMBSx7qOLSwU_v_J=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxMoVD=ViS8rC+4oiLojQpobfnxHMBSx7qOLSwU_v_J=g@mail.gmail.com>
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_051751_245889_9F712282 
X-CRM114-Status: GOOD (  38.66  )
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

On Mon, Aug 04, 2025 at 08:00:46AM +0100, Fuad Tabba wrote:
> Hi Wei-Lin,
> 
> On Sun, 3 Aug 2025 at 07:09, Wei-Lin Chang <r09922117@csie.ntu.edu.tw> wrote:
> >
> > Hi Fuad,
> >
> > I am reading some pKVM code and would like to ask for help on some
> > questions to make sure my understanding is correct:
> >
> > While looking at the code I don't see pkvm.enabled, or now
> > pkvm.is_protected really assigned, is pkvm development going to add the
> > ability to let the user pick whether they want to start a protected VM
> > (host EL1 can't access VM memory and registers, mostly) or not (like
> > nVHE mode VMs) in the future?
> >
> > Also, since when running pKVM (kvm-arm.mode=protected) the user can't
> > yet choose the VM to be protected or not, the current state is that all
> > VMs started by pKVM is protected, is that understanding correct?
> >
> > Sorry if I missed anything.
> 
> You're absolutely right. We are in the process of upstreaming pKVM,
> especially support for protected VMs. As you've noticed, upstream code
> doesn't yet support that. This series is meant to help facilitate
> that.
> 
> To get an idea of what we hope to upstream, you could have a look at
> what we have in Android:
> 
> https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12
> 
> What we have in Android is a new VM type, KVM_VM_TYPE_ARM_PROTECTED,
> that you would set on VM creation (when running in protected mode) to
> designate a VM as protected. That would set is_protected (or enabled)
> to true.
> 
> I hope this helps.

Got it, thank you so much for the explanation!

Thanks,
Wei-Lin Chang

> 
> Cheers,
> /fuad
> 
> >
> > Thanks,
> > Wei-Lin Chang
> >
> > On Tue, Jul 29, 2025 at 01:00:06PM +0100, Fuad Tabba wrote:
> > > The 'pkvm.enabled' field in struct kvm_protected_vm is confusingly named.
> > > Its purpose is to indicate whether a VM is a pKVM protected VM, not
> > > whether the VM itself is enabled or running.
> > >
> > > For a non-protected VM, the VM can be fully active, yet this field would
> > > be false. This ambiguity can lead to incorrect assumptions about the VM's
> > > operational state and makes the code harder to reason about.
> > >
> > > Rename the field to 'is_protected' to make it unambiguous that the flag
> > > tracks the protected status of the VM.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > ---
> > >  arch/arm64/include/asm/kvm_host.h | 4 ++--
> > >  arch/arm64/kvm/hyp/nvhe/pkvm.c    | 2 +-
> > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > > index 3e41a880b062..55dc7cd83e40 100644
> > > --- a/arch/arm64/include/asm/kvm_host.h
> > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > @@ -252,7 +252,7 @@ struct kvm_protected_vm {
> > >       pkvm_handle_t handle;
> > >       struct kvm_hyp_memcache teardown_mc;
> > >       struct kvm_hyp_memcache stage2_teardown_mc;
> > > -     bool enabled;
> > > +     bool is_protected;
> > >  };
> > >
> > >  struct kvm_mpidr_data {
> > > @@ -1522,7 +1522,7 @@ struct kvm *kvm_arch_alloc_vm(void);
> > >
> > >  #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
> > >
> > > -#define kvm_vm_is_protected(kvm)     (is_protected_kvm_enabled() && (kvm)->arch.pkvm.enabled)
> > > +#define kvm_vm_is_protected(kvm)     (is_protected_kvm_enabled() && (kvm)->arch.pkvm.is_protected)
> > >
> > >  #define vcpu_is_protected(vcpu)              kvm_vm_is_protected((vcpu)->kvm)
> > >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > index 338505cb0171..6198c1d27b5b 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > @@ -406,7 +406,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
> > >       hyp_vm->host_kvm = host_kvm;
> > >       hyp_vm->kvm.created_vcpus = nr_vcpus;
> > >       hyp_vm->kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
> > > -     hyp_vm->kvm.arch.pkvm.enabled = READ_ONCE(host_kvm->arch.pkvm.enabled);
> > > +     hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
> > >       hyp_vm->kvm.arch.flags = 0;
> > >       pkvm_init_features_from_host(hyp_vm, host_kvm);
> > >  }
> > > --
> > > 2.50.1.487.gc89ff58d15-goog
> > >

