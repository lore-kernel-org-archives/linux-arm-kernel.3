Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E809CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtnXaqdbVR8gOvpEPR+6l9cfgKr6bsCXJtfhHUXOVv8=; b=Vjd0NIL/utPYC7w/aTxM++EJyT
	pJDUAlfO+lSgdD0bBddP1Mr/ruf+VdwAbvO6fZers3bVwWrOStI255+DpogLo6/kJrGCCX+vmadO3
	KRPYD7IjhRkLUd1mlWq49hxUcn8tKjAzKe3T6lFqyHX0ilxxA4Y5Fiy5KwSKvQcz9Fs85YnvR1WoW
	6GzMEkrfwb0hM0i/ZZ2eOnKBXIp7So9G/AylW2j/wqeKUBM9xWOrx/H84PKS/dNlFBpyOekISt1pO
	Udh+EMFd9bgqEXA5kanGn4PPpvOwGC4KQjvCkNuFIrAeNavWYZydl+qQ+ZXptoWYZ6lEr+DVizLjT
	9tsp7lDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt1d-00000006XiY-3lUj;
	Fri, 31 Oct 2025 17:34:57 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt1a-00000006Xgo-2NBa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:34:56 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33baf262850so2926886a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 10:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761932093; x=1762536893; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LtnXaqdbVR8gOvpEPR+6l9cfgKr6bsCXJtfhHUXOVv8=;
        b=2qj7q/SPnSzAJWmUBZOwFnAJRi1bVMZE4leSeHsOE87g0MVN+52wGnSgpUAzf60VUz
         DUXb2JITJp0PKZVNPF/zQ992bK2koe6YPvKGFEcCxKV4sjbzFPz3UKERLhwVkAY2j13p
         BYstnDl6AiImMc5sRxzOCbW7Qm0jiB0L+0nfX8hgCzD5w9j+mb9fUiEiSVPBZKfT6ahQ
         gk/QuMmnxy62x/41wj2Nft39tCxozY9TlcbWfNJwgWfBg7JQFqPPkK0OMnEmh1BdX1n2
         3CxSrZ/uTblAdIlhMJHF80LoPjpJVQnDxWPXJW5avVNG1aDuBT2U95RjzqjyJKJitZhp
         +LSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761932093; x=1762536893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtnXaqdbVR8gOvpEPR+6l9cfgKr6bsCXJtfhHUXOVv8=;
        b=AeVUeUikuu59AHyh8lmges/lL1WGCi7EF1UQqUkdXrkSLCMhsFXJyTOSXtx915/zks
         o+duv8daFBVYJ7Mfr5ucOyIazr/OshwmtlOtdPKAzOGGBRiywialfrkca3vHHFEI44Hx
         kwgU4E+KWPy5SYZyTw6/PMMRjXfKFJTOuAJqySVkOqPEDAyBVDo0DGFBRC51SzC5Z7cz
         Qq7p8yVoFBSdqWWFPLHEKfTrNV+hKkkBK1MF5nU+INibMIDT2PVgxP3OkAESoGLrZ65r
         osk9jIgR6do65SMUXjAeoumMWo88O9rmWJ/M+uM+eu3rvKvQYqJRAiWQCjh8tgSSu4DZ
         5Ftg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ/+bZqvxMUu5fO+yQ55fSA+/YvrDbXkRTAQyw7pmOc9bNyyaPFHeDl+dlO3TCGCVv9EU/aSsqkNeUjMYVXa9A@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvpy+FTx2zHr4R6y1P6g/VmYRtKEXmJ0jhkiSLPka/WtO6tZCu
	TUguhrjtsqrnU96ksHasshk3Y6Ngt95dWZamR/VdHrtCzXPWfSRiOmRGNz995psF3YoAWardDqY
	GrDpu2Q==
X-Google-Smtp-Source: AGHT+IEhd62pQuR9tjnc3Il5ckB3BFxieNfGOf0XAASHT7mISEiuLVbYaHxfkZsCDA/umOxHYLwWX5NLxe4=
X-Received: from pjbmg14.prod.google.com ([2002:a17:90b:370e:b0:33e:34c2:1e17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc4b:b0:32e:5646:d43f
 with SMTP id 98e67ed59e1d1-3408306e65fmr6078929a91.19.1761932092859; Fri, 31
 Oct 2025 10:34:52 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:34:51 -0700
In-Reply-To: <aQRyyieyDrZZMpIt@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <20251030200951.3402865-27-seanjc@google.com>
 <aQRyyieyDrZZMpIt@yzhao56-desk.sh.intel.com>
Message-ID: <aQTzO7D1O02zQbcD@google.com>
Subject: Re: [PATCH v4 26/28] KVM: TDX: Guard VM state transitions with "all"
 the locks
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth <michael.roth@amd.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_103454_599619_AAEF26D7 
X-CRM114-Status: GOOD (  16.87  )
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

On Fri, Oct 31, 2025, Yan Zhao wrote:
> On Thu, Oct 30, 2025 at 01:09:49PM -0700, Sean Christopherson wrote:
> > Acquire kvm->lock, kvm->slots_lock, and all vcpu->mutex locks when
> > servicing ioctls that (a) transition the TD to a new state, i.e. when
> > doing INIT or FINALIZE or (b) are only valid if the TD is in a specific
> > state, i.e. when initializing a vCPU or memory region.  Acquiring "all"
> > the locks fixes several KVM_BUG_ON() situations where a SEAMCALL can fail
> > due to racing actions, e.g. if tdh_vp_create() contends with either
> > tdh_mr_extend() or tdh_mr_finalize().
> > 
> > For all intents and purposes, the paths in question are fully serialized,
> > i.e. there's no reason to try and allow anything remotely interesting to
> > happen.  Smack 'em with a big hammer instead of trying to be "nice".
> > 
> > Acquire kvm->lock to prevent VM-wide things from happening, slots_lock to
> > prevent kvm_mmu_zap_all_fast(), and _all_ vCPU mutexes to prevent vCPUs
> s/kvm_mmu_zap_all_fast/kvm_mmu_zap_memslot

Argh!  Third time's a charm?  Hopefully...

> > @@ -3170,7 +3208,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
> >  
> >  int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
> >  {
> > -	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
> > +	struct kvm *kvm = vcpu->kvm;
> > +	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
> reverse xmas tree ?

No, because the shorter line generates an input to the longer line.  E.g. we could
do this if we really, really want an xmas tree:

	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
	struct kvm *kvm = vcpu->kvm;

but this won't compile

	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
	struct kvm *kvm = vcpu->kvm;

