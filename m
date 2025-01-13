Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092A1C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 17:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNi4ttNXrfrXDMynei5+HVfxxr2BRc6T71jVjH9tT8o=; b=axpidWdVyGP/5O8U9+FwgRpsgy
	yQYR+XypNKXvKHt1El4WHHYhiC3d7cg5fZqvc4jWyhhI069y7I++wNKVMAZXRfxA+rb2S3X/rwYUx
	S8x/79p0ppWhAZ6lkHmjaYTsFF/ij2jue9gVlu/exBvK+KKd5e0d4nPF2100yajMuO2gt6/4ixqC8
	TqddFKHWutMFMCOspUaXQ1nty5pUA240xF7mfPhSFGYtqF4lbWsHrcMNhs8tzFbl5SkQlX6mMAMvn
	dwzFNpFjyvxfmnmD4Pi/O79GJPB+bswA+U238VsKDLvAtnqT/xfM/EsYwmosGiiQOKATHF740z3ov
	UM+VBZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNo8-00000005y6I-3OL7;
	Mon, 13 Jan 2025 17:00:56 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNmr-00000005xlD-40r8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 16:59:39 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-21661949f23so132881645ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 08:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736787576; x=1737392376; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lNi4ttNXrfrXDMynei5+HVfxxr2BRc6T71jVjH9tT8o=;
        b=HCNPl27gaUzZXif+Ems2r5KHDFPmnLCD4I/97wd2HZBm7b4BX5FyBySMpgZxccidMK
         RoPP3a67kfal1JAJDp39jEve92h65m2h6D/E3DR2QHBlpH62vI4rFeT9C6fzW50f+55U
         IRFC4VSMEKpQLL1LRGALwD6Ft4eD79LAwdf6qmhIiTdYpyZ1RLeGusH+PoIKzSIJb9SO
         I41u6WMqux2PHbZ45yTxoWUUADUmkO1gj+kNnc1yYosfN+J8rLLsDWRUPxRVIMngDVRf
         bqreX7Kp3mqbLVrMqVQdvBxneIQCncGJGlHahucYflI2T+/oSAvAkhXxfwwaH/nJYPWt
         X2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736787576; x=1737392376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNi4ttNXrfrXDMynei5+HVfxxr2BRc6T71jVjH9tT8o=;
        b=au+pmMibHDywCPfzQvo8S32Fw9x+yikoUxnkMXoa3RTT7H7SPejRxHRu8Zk3rO2Yr9
         4GSmAz7rC65QbHSNAoxpczyl0KGmS4gdGOvfwQ/0uBtwXMmdSHWZOjXZEcxYF0Llw/hq
         jpuqNTbYXlBUFmSowNhgCaIJ8/OM6rmpLhH2WrBV7OasuAaUvniATUR1KZr3XqK3949a
         jsaoSQz2UEQVReEI5IFO80NO8vzofCC1tgxoLOSw3FcVGI2iw0UbF/5g5jx9K1jIBum1
         f5VQzvWn02SMCzTfJa0oBol4Lz3eFZE7gdMEfFzx4+QYcJu1JrYThF0ZmyD4+YPw33zR
         g/vg==
X-Forwarded-Encrypted: i=1; AJvYcCUpM7qFv4XthqCOrfOMYwl5U/TQZUPzlHUxdoTL34ru/y3nl8xi48y2U2as81EcnyGuT5w7WVhNb84cAfG9342t@lists.infradead.org
X-Gm-Message-State: AOJu0YzZy++mkysFctN+9aSHp/+NEgrH8485Ce/RECC8awm7xuUcD+It
	t2z1P6AQ7VHxXm5Xjv+gRE9pTCIkSW39wNmIJdOas/lpo+jyO6aoqXYct+AOCN9AGw3FKjBau9L
	2yQ==
X-Google-Smtp-Source: AGHT+IENu5ZK9kPpRwdS1+EeXpR6nVCXMTR+IXJJExBjfsTrkclg65OJwbQ4mKEvtimncd2M4JDnxOz3MCM=
X-Received: from plks12.prod.google.com ([2002:a17:903:2cc:b0:211:fb3b:763b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e74b:b0:215:5ea2:654b
 with SMTP id d9443c01a7336-21a83f3eebemr334554025ad.1.1736787576636; Mon, 13
 Jan 2025 08:59:36 -0800 (PST)
Date: Mon, 13 Jan 2025 08:59:35 -0800
In-Reply-To: <Z4R12HOD1o8ETYzm@intel.com>
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com> <20250111012450.1262638-4-seanjc@google.com>
 <Z4R12HOD1o8ETYzm@intel.com>
Message-ID: <Z4VGdxyswQ6qcKR0@google.com>
Subject: Re: [PATCH 3/5] KVM: Add a common kvm_run flag to communicate an exit
 needs completion
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_085937_994933_EDCA7D55 
X-CRM114-Status: GOOD (  19.74  )
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

On Mon, Jan 13, 2025, Chao Gao wrote:
> On Fri, Jan 10, 2025 at 05:24:48PM -0800, Sean Christopherson wrote:
> >Add a kvm_run flag, KVM_RUN_NEEDS_COMPLETION, to communicate to userspace
> >that KVM_RUN needs to be re-executed prior to save/restore in order to
> >complete the instruction/operation that triggered the userspace exit.
> >
> >KVM's current approach of adding notes in the Documentation is beyond
> >brittle, e.g. there is at least one known case where a KVM developer added
> >a new userspace exit type, and then that same developer forgot to handle
> >completion when adding userspace support.
> 
> This answers one question I had:
> https://lore.kernel.org/kvm/Z1bmUCEdoZ87wIMn@intel.com/
> 
> So, it is the VMM's (i.e., QEMU's) responsibility to re-execute KVM_RUN in this
> case.

Yep.

> Btw, can this flag be used to address the issue [*] with steal time accounting?
> We can set the new flag for each vCPU in the PM notifier and we need to change
> the re-execution to handle steal time accounting (not just IO completion).
> 
> [*]: https://lore.kernel.org/kvm/Z36XJl1OAahVkxhl@google.com/

Uh, hmm.  Partially?  And not without creating new, potentially worse problems.

I like the idea, but (a) there's no guarantee a vCPU would be "in" KVM_RUN at
the time of suspend, and (b) KVM would need to take vcpu->mutex in the PM notifier
in order to avoid clobbering the current completion callback, which is definitely
a net negative (hello, deadlocks).

E.g. if a vCPU task is in userspace processing emulated MMIO at the time of
suspend+resume, KVM's completion callback will be non-zero and must be preserved.
And if a vCPU task is in userspace processing an exit that _doesn't_ require
completion, setting KVM_RUN_NEEDS_COMPLETION would likely be missed by userspace,
e.g. if userspace checks the flag only after regaining control from KVM_RUN.

In general, I think setting KVM_RUN_NEEDS_COMPLETION outside of KVM_RUN would add
too much complexity.

> one nit below,
> 
> >--- a/arch/x86/include/uapi/asm/kvm.h
> >+++ b/arch/x86/include/uapi/asm/kvm.h
> >@@ -104,9 +104,10 @@ struct kvm_ioapic_state {
> > #define KVM_IRQCHIP_IOAPIC       2
> > #define KVM_NR_IRQCHIPS          3
> > 
> >-#define KVM_RUN_X86_SMM		 (1 << 0)
> >-#define KVM_RUN_X86_BUS_LOCK     (1 << 1)
> >-#define KVM_RUN_X86_GUEST_MODE   (1 << 2)
> >+#define KVM_RUN_X86_SMM			(1 << 0)
> >+#define KVM_RUN_X86_BUS_LOCK		(1 << 1)
> >+#define KVM_RUN_X86_GUEST_MODE		(1 << 2)
> >+#define KVM_RUN_X86_NEEDS_COMPLETION	(1 << 2)
> 
> This X86_NEEDS_COMPLETION should be dropped. It is never used.

Gah, thanks!

