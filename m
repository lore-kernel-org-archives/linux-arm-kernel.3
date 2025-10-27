Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BB8CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJ/ihzhnBg2h+OIog5s51f1nDJzu1yBHwy2SCCUQ1bo=; b=SYj6LNcld7Ty2CYw8eBubRgc4a
	VIF8GeZhVD78hDxH4H+C5dOyr42BGOuBqnkW4IuMRM6r0GMiaUoSn3bYEPeRH0mSogskT9BcRx4dg
	aKFewXRJvLwDGTv2UMuj2Xef0MxDJW3L2XJvdX5ZRSc5ZE/Va77SPPRHQJIbylPHXUDDvB/jH6zih
	Gq3xdmfkNr9X/D0poKu5ZW92+adg5T++kectYnCJxd2gaaUqjN/eTEeaB3uApbwfaZ2wLingw8sVo
	1sDFBUJ/3hMcwa+sV7iiuWB9b5syM52BluJvy7dYT3IaHi2H2dqDA3gEbvTI4P0Qr8qniBNqyTVcp
	wF3dgxTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSlM-0000000EeK4-45nN;
	Mon, 27 Oct 2025 19:20:17 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSlJ-0000000EeIO-1cDj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 19:20:15 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-294a938fa37so45156845ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 12:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761592812; x=1762197612; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ/ihzhnBg2h+OIog5s51f1nDJzu1yBHwy2SCCUQ1bo=;
        b=n4y/XYJpxZT47gkE17oanNSpUzIHRSa8/lHwHWyIGnDreQveRJsc9TtirCII2alHmC
         C6wB9mu16rlgSy288A4eyouvM/QgvGv+4/NYOB+vIW/3mKavVFZmg4QO+bWjPGRszmRm
         yVge6w1sfoiBdWthgMmrQAdn1EZlE2BYgpIPaptncXr1zyffos/a8m5b54iXDqHBB5Nq
         aGCnvFGxUFS7leQAgnn/qFlD69PjLBF38v8UeDeYX/TsNK5CXhalbIg+393nXn6bBESY
         UIAKzaEN5fpAoVzv3mRgTN3BuZH+xwNDLOHKDJ7tg5l2Ozws+u2qsWXKcRpbXm7mmQUS
         kcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761592812; x=1762197612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ/ihzhnBg2h+OIog5s51f1nDJzu1yBHwy2SCCUQ1bo=;
        b=aoD85e/B3+fB5ZHS49K0xPY/egw4gA4YX/SW0tBCxPYQf2bGYw6/L2Tgl1mPr5jCAB
         Mh8sfn4xG6y0zB74wektorhwNzjR/UqUTaWnaCvw7TR4Bwy0Tm6l3dxOTtw0VlvRQz0R
         Bu357i/8fkmtRYo7CmedmImohaDZsLxzpQSdx6ozwwi/kGr35Lq47sd/lB7GtdqAzxRC
         fyXy9aT8drZrnbf7PeoXc1VJtBjw6FBi8VQkiGXAx5I1P3TWRctJTQi1jAo5GfWt7K2v
         ZZ83Z7FXfVuYohf6alflWGjfs1ERxZ3uTse9mkdfrKvjHBooA32+Z5sk+gNHE7wcyOHd
         qLsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBEsSuZEzFkORr2ghW7H3SpOcByrlme+tjefNBG1aelxo8g9ySxFjUt97ovGEa/vwiHKzOPANCgIW6YC2BkLPI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1TZQBLkk1MSa8ry58lPcMDcvuQUmyDbdUe1iHjBD9OQk3I5/C
	9MhkLkGktwHUlKSFJO0J8xWI0smxcHWwqNQEmxVuYx/Vjmvt4cI6eH87KnhFJozfMORn7SXA3Qh
	loXi9Lg==
X-Google-Smtp-Source: AGHT+IGEzxKOsu0TIx9JeJ8jo0iJqVMcVQCTPniC3ps1TgJ3BGzDUda18OgqbILlA0+mvKP7+G2jd9/+Iec=
X-Received: from pjbrs15.prod.google.com ([2002:a17:90b:2b8f:b0:33b:51fe:1a73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e5c4:b0:25d:1640:1d59
 with SMTP id d9443c01a7336-294cb378610mr8002455ad.8.1761592811798; Mon, 27
 Oct 2025 12:20:11 -0700 (PDT)
Date: Mon, 27 Oct 2025 12:20:10 -0700
In-Reply-To: <4809644b0ba02d0987ac56f4be7c426d0724cdef.camel@intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-21-seanjc@google.com>
 <4809644b0ba02d0987ac56f4be7c426d0724cdef.camel@intel.com>
Message-ID: <aP_F6tmzomRtdbpU@google.com>
Subject: Re: [PATCH v3 20/25] KVM: TDX: Add macro to retry SEAMCALLs when
 forcing vCPUs out of guest
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_122013_452670_FFE173C4 
X-CRM114-Status: GOOD (  24.83  )
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

On Fri, Oct 24, 2025, Kai Huang wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > Add a macro to handle kicking vCPUs out of the guest and retrying
> > SEAMCALLs on -EBUSY instead of providing small helpers to be used by each
> > SEAMCALL.  Wrapping the SEAMCALLs in a macro makes it a little harder to
> > tease out which SEAMCALL is being made, but significantly reduces the
> > amount of copy+paste code and makes it all but impossible to leave an
> > elevated wait_for_sept_zap.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/vmx/tdx.c | 72 ++++++++++++++----------------------------
> >  1 file changed, 23 insertions(+), 49 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index f6782b0ffa98..2e2dab89c98f 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -294,25 +294,24 @@ static inline void tdx_disassociate_vp(struct kvm_vcpu *vcpu)
> >  	vcpu->cpu = -1;
> >  }
> >  
> > -static void tdx_no_vcpus_enter_start(struct kvm *kvm)
> > -{
> > -	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
> > -
> > -	lockdep_assert_held_write(&kvm->mmu_lock);
> > -
> > -	WRITE_ONCE(kvm_tdx->wait_for_sept_zap, true);
> > -
> > -	kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);
> > -}
> > -
> > -static void tdx_no_vcpus_enter_stop(struct kvm *kvm)
> > -{
> > -	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
> > -
> > -	lockdep_assert_held_write(&kvm->mmu_lock);
> > -
> > -	WRITE_ONCE(kvm_tdx->wait_for_sept_zap, false);
> > -}
> > +#define tdh_do_no_vcpus(tdh_func, kvm, args...)					\
> > +({										\
> > +	struct kvm_tdx *__kvm_tdx = to_kvm_tdx(kvm);				\
> > +	u64 __err;								\
> > +										\
> > +	lockdep_assert_held_write(&kvm->mmu_lock);				\
> > +										\
> > +	__err = tdh_func(args);							\
> > +	if (unlikely(tdx_operand_busy(__err))) {				\
> > +		WRITE_ONCE(__kvm_tdx->wait_for_sept_zap, true);			\
> > +		kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);	\
> > +										\
> > +		__err = tdh_func(args);						\
> > +										\
> > +		WRITE_ONCE(__kvm_tdx->wait_for_sept_zap, false);		\
> > +	}									\
> > +	__err;									\
> > +})
> 
> The comment which says "the second retry should succeed" is lost, could we
> add it to tdh_do_no_vcpus()?

+1, definitely needs a comment.

/*
 * Execute a SEAMCALL related to removing/blocking S-EPT entries, with a single
 * retry (if necessary) after forcing vCPUs to exit and wait for the operation
 * to complete.  All flows that remove/block S-EPT entries run with mmu_lock
 * held for write, i.e. are mutually exlusive with each other, but they aren't
 * mutually exclusive with vCPUs running (because that would be overkill), and
 * so can fail with "operand busy" if a vCPU acquires a required lock in the
 * TDX-Module.
 *
 * Note, the retry is guaranteed to succeed, absent KVM and/or TDX-Module bugs.
 */
 
> Also, perhaps we can just TDX_BUG_ON() inside tdh_do_no_vcpus() when the
> second call of tdh_func() fails?

Heh, this also caught my eye when typing up the comment.  Unfortunately, I don't
think it's worth doing the TDX_BUG_ON() inside the macro as that would require
plumbing in the UPPERCASE name, and doesn't work well with the variadic arguments,
e.g. TRACK wants TDX_BUG_ON(), but REMOVE and BLOCK want TDX_BUG_ON_2().

Given that REMOVE and BLOCK need to check the return value, getting the TDX_BUG_ON()
call into the macro wouldn't buy that much.

