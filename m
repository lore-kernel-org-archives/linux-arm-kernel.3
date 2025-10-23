Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947CACCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGj/4U8Cjm7Jzuo0N797IrKS+KWnd9Al6qyj+0gj5DU=; b=iNou3QuC8Qa/HQKkVZ7C0Ak1r2
	LsStw/s78iKpFuk/TtFkiNEqoc/CklYdnIOUm0Z98dRr86oIl9P0ZCn2YDYQrbNJEWa7rhr8Y+tHH
	DCmC0tW5SaxwKAicGNHlrX5ch8MIXk4zhfSFH9NWEcCgm2+ScPSt9Y0uft/5dy7vZAlwxt4h2ogRU
	1P8Gv+7Y4A7nIAT2DfCRJW8nIgOPGmPsS3EB2xaoE8TIc6nle1tSIRXWCPR4nTe9OzpE2LTqHanWq
	XcNe850gGwky0wNXZjALw6pvKZdyvpDiP5CEsFLuSMIRm64rL2g+uc1ZaWKQGwRPKdzITkr2HJJca
	/fLF+Tfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBx12-00000006iwK-3qGE;
	Thu, 23 Oct 2025 15:14:12 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBx0y-00000006iuW-0wjD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 15:14:11 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33dadf7c5c0so1016357a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 08:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761232446; x=1761837246; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGj/4U8Cjm7Jzuo0N797IrKS+KWnd9Al6qyj+0gj5DU=;
        b=etxsONN1RpZiTrf+VxD43bLWM1ygNaDp24NTSL93O/L1+GAu7pRWehjF24KOm9w4/I
         xmgcsgBXM/rhWGZ+jd2Rirxk7q+HFVoA40OdhhkKIKBWw5tiXWG0yj195eBbJpBBgbHL
         9L2DEww3IC36EwFIfUmTIE0Ow2RRCA930eskUNVO3P6w8pHA7k6UL5LKZC5ZmSoFCyr1
         kA6gEyZGuCpez/j+Zu9trcdkKTIM21BUeesDiin1/sBwn6nMOZjQDpAkuwzlWtspyaQD
         XkfDGq6Ik3bNYmgnYJRP9ayknyyKePa3NoaTSmH43AokVoXmzP91INyffOFfC0pj81E1
         CyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761232446; x=1761837246;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGj/4U8Cjm7Jzuo0N797IrKS+KWnd9Al6qyj+0gj5DU=;
        b=wl7rECQBUtisD0LgatpBHag2KpVhlD6G6Mgp9IETXGfU6bt+/fysA+wHdAQ6fEJ9ZI
         rUtg6AEhTjQT523uR1C0oCbWspmYLxJlxQ2Vxt+ly4WEaAFotdWOE/L4FurGexgFiD6V
         3bMtLd95borvB7p5LcHPk7ZGpNTbprMFZAu+ZM431XZpmxaIgZk75i6Yi2En1pPnLBEY
         8VSG8dhZZ+Tyiz1cOJRgrkzxeaEy3DAK5Yc8P/hozIqNB0IQWcmOxUPTACnhf0+BYJuM
         3smdFt6KoM1GMi+jd+oCLf4Dv/xQ/GtarrNt2YJDPbtHNZeyKp6ZBAP0YUCLk0vCRShT
         p2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWwPmx86lpXy9DpTyzC9U27/N/JKrkvWCHbKVFXQcx3aArUS1DgY+ve88loFO81MWYRrPR2berRq/WVSfs34AHY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs09KcPHzW8MdnTd/vEJF5e5ckvb4QPLrI53CoJBM5+hcKGuuT
	07nmJpSMEtqGsK4qZL5NNpJn+pCHdr+TjpSqBOxQAiLDjYuEehqvrdrbN61cr6VLt0c05VvUuPV
	6Lu2m4Q==
X-Google-Smtp-Source: AGHT+IGyk+8DKCi3tYCJowX0kgLUyc4PpyLVM16G5qza1KYeH4GEBaOP8pzea9wQFWKumE2t1taaAoPvn3M=
X-Received: from pjbrm7.prod.google.com ([2002:a17:90b:3ec7:b0:330:6c04:207])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:570e:b0:32e:7ff6:6dbd
 with SMTP id 98e67ed59e1d1-33e21dedc9fmr9424992a91.0.1761232446100; Thu, 23
 Oct 2025 08:14:06 -0700 (PDT)
Date: Thu, 23 Oct 2025 08:14:04 -0700
In-Reply-To: <aPnbIDxGlcAyI9vy@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-20-seanjc@google.com>
 <aPnbIDxGlcAyI9vy@yzhao56-desk.sh.intel.com>
Message-ID: <aPpGPF8McvI3-OO7@google.com>
Subject: Re: [PATCH v3 19/25] KVM: TDX: Assert that mmu_lock is held for write
 when removing S-EPT entries
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
	Michael Roth <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_081408_267471_2A195868 
X-CRM114-Status: GOOD (  25.76  )
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

On Thu, Oct 23, 2025, Yan Zhao wrote:
> On Thu, Oct 16, 2025 at 05:32:37PM -0700, Sean Christopherson wrote:
> > Unconditionally assert that mmu_lock is held for write when removing S-EPT
> > entries, not just when removing S-EPT entries triggers certain conditions,
> > e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
> > Conditionally asserting implies that it's safe to hold mmu_lock for read
> > when those paths aren't hit, which is simply not true, as KVM doesn't
> > support removing S-EPT entries under read-lock.
> > 
> > Only two paths lead to remove_external_spte(), and both paths asserts that
> > mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
> > handle_removed_pt() via KVM_BUG_ON()).
> > 
> > Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
> > that wait_for_sept_zap is guarded by holding mmu_lock for write.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/vmx/tdx.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index e517ad3d5f4f..f6782b0ffa98 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -1711,8 +1711,6 @@ static void tdx_track(struct kvm *kvm)
> >  	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
> >  		return;
> >  
> > -	lockdep_assert_held_write(&kvm->mmu_lock);
> Could we also deliberately leave lockdep assertion for tdx_track()?

Can do.

> This is because if we allow removing S-EPT entries while holding mmu_lock for
> read in future, tdx_track() needs to be protected by a separate spinlock to
> ensure serialization of tdh_mem_track() and vCPUs kick-off (kicking off vCPUs
> must follow each tdh_mem_track() to unblock the next tdh_mem_track()).

Does this look/sound right?

From: Sean Christopherson <seanjc@google.com>
Date: Thu, 28 Aug 2025 17:06:17 -0700
Subject: [PATCH] KVM: TDX: Assert that mmu_lock is held for write when
 removing S-EPT entries

Unconditionally assert that mmu_lock is held for write when removing S-EPT
entries, not just when removing S-EPT entries triggers certain conditions,
e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
Conditionally asserting implies that it's safe to hold mmu_lock for read
when those paths aren't hit, which is simply not true, as KVM doesn't
support removing S-EPT entries under read-lock.

Only two paths lead to remove_external_spte(), and both paths asserts that
mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
handle_removed_pt() via KVM_BUG_ON()).

Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
that wait_for_sept_zap is guarded by holding mmu_lock for write, and keep
the conditional assert in tdx_track() as well, but with a comment to help
explain why holding mmu_lock for write matters (above and beyond why
tdx_sept_remove_private_spte()'s requirements).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index dca9e2561270..899051c64faa 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1715,6 +1715,11 @@ static void tdx_track(struct kvm *kvm)
 	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
 		return;
 
+	/*
+	 * The full sequence of TDH.MEM.TRACK and forcing vCPUs out of guest
+	 * mode must be serialized, as TDH.MEM.TRACK will fail if the previous
+	 * tracking epoch hasn't completed.
+	*/
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
 	err = tdh_mem_track(&kvm_tdx->td);
@@ -1762,6 +1767,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
 
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
 	/*
 	 * HKID is released after all private pages have been removed, and set
 	 * before any might be populated. Warn if zapping is attempted when

base-commit: 69564844a116861ebea4396894005c8b4e48f870
--

