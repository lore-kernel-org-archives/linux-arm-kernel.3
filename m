Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783FFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 22:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ouQM0W6rpy+hi197i8Zk+lTDosT4d/QAcoc26c/0W4=; b=Xpo+2pGVRYPz7qIN27DzHzL66o
	R6ax7kuaRs+XfqgWbte2JF90f2TFeNw35N1sxXIVMB6wc5dMqAfBx8bisx8e+vxwle9YMSwy3psom
	QtXrSqLtzTA8vtwB8rJKmUHfziVPGAx2b94+k57WWioamZq78qh17yxnF3SlRCKAs7Ys29QxKMqeb
	Li4J+bma7u+xv5TO6WqB55e7+L8mCaiDAPQONayig+cRt+xQPsZgCuTpPDeMGWtGEoZHpenkg/jkg
	0Ph0RduU3RhWQQ+Qsf6BQ641g+iMo5irzeiVmjLUjT0RlZy/PzhP7J0lIz2HtdZIouaIL6ESMUXkt
	BHgqIkwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSZh-00000006lkQ-1LTm;
	Mon, 13 Jan 2025 22:06:21 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSXh-00000006lJY-3bwK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 22:04:19 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef728e36d5so8622366a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 14:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736805856; x=1737410656; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ouQM0W6rpy+hi197i8Zk+lTDosT4d/QAcoc26c/0W4=;
        b=4PiTZw/OUNTIU4CN8WL0ikJ0Q6ZlfZn52KOH8oA7F/brvVDJDWVyKy3ZpdXQ1PRoCc
         Zzl9KfBZW2MgX56okOSUCs4V8WOtoO+Zr0CjP2zfK/OLvi1XuPjcmdhLeRP3E86MpsS2
         53kApNW7TcJn12A6VOXzHiN/bVUD6jaLiesw7OIqtCJTIpY+iwbsMCEAEBMPGDLWhknr
         6M6CuVSs4Ax0UA5yyMUexOKHYj9KgKpPJmSYWchXwF5EVDbhHq+pHZxq2h2M9IHvU2Sn
         lcy7kOnzqMUhrH+G6/+4LzTM5TiaHXxnDYSRQP0oTR9S3BRcX2l2K5EaxaFyUoCbHKZi
         3CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736805856; x=1737410656;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ouQM0W6rpy+hi197i8Zk+lTDosT4d/QAcoc26c/0W4=;
        b=SRbRHZE59G7RELz1sVp3Co3iWj+vq0PngZBEbqOw11SnRFvFdn7DAjw5VYS8wkStdU
         IkqLDAZzEI8VHLnizqMZ7pJL9uSppPa4zo4rL+XUAnjRSP7yUhcvag7MpQMLPBGSha4k
         IbQ0WPRGh71UXGI/YOZ1ZlHNZNOZ9NPiuk9n5m9+62arbbuW/QOpoDChCpIZnYkzsy/A
         cR96L/28aFJuJNk731UlRSoDLWsBw0PK/VQEZ8Eq9smOEBBDOPdsA5sSMUZ1ctj+pO5V
         iyB/aorVpfuNxrP05ANuwUiTIGZOnbaTJNJPjWwASGg805UGx4ZKyD9Cz7cPUCye85+6
         TWNA==
X-Forwarded-Encrypted: i=1; AJvYcCVAFiH2FeKNBWjh5f57oIflBD6Tug2wkqz2ZDTBanejb1+VFFlDzS/FckxBRP24Y+2O+F8gVNISCkiioVmAw/WS@lists.infradead.org
X-Gm-Message-State: AOJu0YwlNPpbQ+6/ss/R9ORjuL7q09vZ1sojTS6tGWlatrXHetYT4xWM
	sxyc/73iGORZgDWeU4mBrqMjGU+uyr40e43uTwfL5SQg4WpEsHkxjltDS5FS6rNccL+MW1FMwgH
	jRQ==
X-Google-Smtp-Source: AGHT+IHPN8TIZGkXrQIWMGITx0F8fOm3vw8dMWb7JVx/B9HZzRXtZecChEPlXNK7/wkOh+HdmqOb1zcL5aE=
X-Received: from pjbdb14.prod.google.com ([2002:a17:90a:d64e:b0:2e2:9021:cf53])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f90:b0:2f6:f107:faf8
 with SMTP id 98e67ed59e1d1-2f6f107fe30mr4478474a91.24.1736805856584; Mon, 13
 Jan 2025 14:04:16 -0800 (PST)
Date: Mon, 13 Jan 2025 14:04:15 -0800
In-Reply-To: <87bjwaqzbz.wl-maz@kernel.org>
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com> <20250111012450.1262638-4-seanjc@google.com>
 <87ikqlr4vo.wl-maz@kernel.org> <Z4U03KRYy2DVEgJR@google.com>
 <86ikqiwq7y.wl-maz@kernel.org> <Z4ViZb7rruRiN-Oe@google.com> <87bjwaqzbz.wl-maz@kernel.org>
Message-ID: <Z4WN3_wUZ1H_e7ou@google.com>
Subject: Re: [PATCH 3/5] KVM: Add a common kvm_run flag to communicate an exit
 needs completion
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Michael Ellerman <mpe@ellerman.id.au>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_140417_911336_BB8CB74C 
X-CRM114-Status: GOOD (  33.18  )
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

On Mon, Jan 13, 2025, Marc Zyngier wrote:
> On Mon, 13 Jan 2025 18:58:45 +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> > 
> > On Mon, Jan 13, 2025, Marc Zyngier wrote:
> > > On Mon, 13 Jan 2025 15:44:28 +0000,
> > > Sean Christopherson <seanjc@google.com> wrote:
> > > > 
> > > > On Sat, Jan 11, 2025, Marc Zyngier wrote:
> > > > > Yet, you don't amend arm64 to publish that flag. Not that I think this
> > > > > causes any issue (even if you save the state at that point without
> > > > > reentering the guest, it will be still be consistent), but that
> > > > > directly contradicts the documentation (isn't that ironic? ;-).
> > > > 
> > > > It does cause issues, I missed this code in kvm_arch_vcpu_ioctl_run():
> > > > 
> > > > 	if (run->exit_reason == KVM_EXIT_MMIO) {
> > > > 		ret = kvm_handle_mmio_return(vcpu);
> > > > 		if (ret <= 0)
> > > > 			return ret;
> > > > 	}
> > > 
> > > That's satisfying a load from the guest forwarded to userspace.
> > 
> > And MMIO stores, no?  I.e. PC needs to be incremented on stores as well.
> 
> Yes, *after* the store as completed. If you replay the instruction,
> the same store comes out.
> 
> > > If the VMM did a save of the guest at this stage, restored and resumed it,
> > > *nothing* bad would happen, as PC still points to the instruction that got
> > > forwarded. You'll see the same load again.
> > 
> > But replaying an MMIO store could cause all kinds of problems, and even MMIO
> > loads could theoretically be problematic, e.g. if there are side effects in the
> > device that trigger on access to a device register.
> 
> But that's the VMM's problem. If it has modified its own state and
> doesn't return to the guest to complete the instruction, that's just
> as bad as a load, which *do* have side effects as well.

Agreed, just wanted to make sure I wasn't completely misunderstanding something
about arm64.

> Overall, the guest state exposed by KVM is always correct, and
> replaying the instruction is not going to change that. It is if the
> VMM is broken that things turn ugly *for the VMM itself*, 
> and I claim that no amount of flag being added is going to help that.

On x86 at least, adding KVM_RUN_NEEDS_COMPLETION reduces the chances for human
error.  x86 has had bugs in both KVM (patch 1) and userspace (Google's VMM when
handling MSR exits) that would have been avoided if KVM_RUN_NEEDS_COMPLETION existed.
Unless the VMM is doing something decidely odd, userspace needs to write code once
(maybe even just once for all architectures).  For KVM, the flag is set based on
whether or not the vCPU has a valid completion callback, i.e. will be correct so
long as the underlying KVM code is correct.

Contrast that with the current approach, where the KVM developer needs to get
the KVM code correct and remember to update KVM's documentation.  Documentation
is especially problematic, because in practice it can't be tested, i.e. is much
more likely to be missed by the developer and the maintainer.  The VMM either
needs to blindly redo KVM_RUN (as selftests do, and apparently as QEMU does), or
the developer adding VMM support needs to be diligent in reading KVM's documentation.
And like KVM documentation, testing that the VMM is implemented to KVM's "spec"
is effectively impossible in practice, because 99.9999% of the time userspace
exits and save/restore will work just fine.

I do agree that the VMM is likely going to run into problems sooner or later if
the developers/maintainers don't fundamentally understand the need to redo KVM_RUN,
but I also think there's significant value in reducing the chances for simple
human error to result in broken VMs.

