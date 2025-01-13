Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464E2C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwan4230Eb0GWwMOhozfXQlgkrr0Jk3ApSxALReE/p0=; b=t9lCJRYN0ivNO9E39yDtT2BAoL
	/VeXhQ0y/rAbGf869fCfJ5t++fDlXO6vINrqT4aDMjQHPmEHbIcT0VthV/uXD5IsYAOIe4zMc7SPE
	Cxw0hTK6WBlZy5bGxlrvkeAD+N50QtNwVGMD4Ec5l/uw14avUvTU29YAwKDUo2NvD7cfZwawhfgdv
	frnGv1VCbi1WkPbYFZ0OCblEVUKKIpu81Z6LG5aYJAh7nHQC0Dtg/13vTINAOKrXhpcA+L9F8lc+0
	RAS8O+6zmDf+4DAuLkywgm+4+/ks0taCfZZzJg1lQ6x0LVMGKFtwdXT8vAChctUGnir374hlZb+71
	rp/tx70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPfR-00000006J07-1E28;
	Mon, 13 Jan 2025 19:00:05 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPeB-00000006Iop-41ZH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 18:58:49 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ee6dccd3c9so7844750a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 10:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736794726; x=1737399526; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uwan4230Eb0GWwMOhozfXQlgkrr0Jk3ApSxALReE/p0=;
        b=0O/9VHYbypvUEf+WHrBQiYMIZJEEHUiTP+/FB5zztewebat5Hb0msRWlQGl9qByxhz
         qp7QE4aGrw+tfI4WZPwGdES84LOVieChldXsv+w2B42773pBYR4NRLfqYuITfSPiE3fv
         Sbyq6NGmMXl5huOc5zWO8NTGyQUBjBY1Rj7b4KspWnxFdWRujia5fknISAW2dpJPjHqS
         nWVo7QAY1ULZ94Noprhj/nULiAvpGEBhn+SCynCCk+gfqDCZ4FxDfgHWwi2KxD0/iATQ
         Ty9BcvtAgwQok3NnKgerd1EshlBJpU3S/aBn7DrZh5EK/wGLio6+uoJYEhWl6oQQRueP
         hOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736794726; x=1737399526;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwan4230Eb0GWwMOhozfXQlgkrr0Jk3ApSxALReE/p0=;
        b=e8Q4rnLHqvyRf+5b9tiIWNgjpU53kh2wCGqS0vtNEkTOlw8LnS3y5r3XM/ozL9haW9
         JS3ufzr4EX8F2Dg16KZGEjeWEwFdOwf2wCA1hNq3ZJRx3850euwd6kvK5UXmSerk9n7p
         6XrtMD8YRQ9gr3Tk1OzkGCCI+u4YpnjYGTm53okWAuFMw1nM3qx5eR/iZBL8+kyJMXV/
         rxCKslt98FyBlGfcm9eEpqF4CdZqh60RcKv5mUgrbeCNcbJSJHDaonEedbRBvPF2xIDV
         e6lLMfUNeCEKxFtWZ56GipyXpB0ZZCNQekObJzsV8pUMeZVJJnkexQqNlXYq6eIxLgoE
         WqTg==
X-Forwarded-Encrypted: i=1; AJvYcCU+wSKUVMxOrh8YvOlqLJJ5x2tTKYcaJcIE1AeYFeW3M9zCrGN39FJLinsz0lg3Zwfjyg2APxUmsS/CqbuYC8QJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyt/qE0TgZ36/Z2geCmpvE+b8d868VyXWM67YozoxdA1yov37U
	w5/lu7RnXSla/RRbVYIeKVKz4Y8yLMcf8vNuwKeaIjZRJ2fMi5dH6Vx509Q65O6oMLGrDH9z1wK
	2oA==
X-Google-Smtp-Source: AGHT+IH9c5/wT/tYnT2Ksuswivrz3/1NK3niqf+jjzVEmdiTAN7aTx3Xg3pUiP1uOtfflIlyc1vt7cYUYYg=
X-Received: from pfbfd28.prod.google.com ([2002:a05:6a00:2e9c:b0:727:3b66:ace])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2181:b0:725:ae5f:7f06
 with SMTP id d2e1a72fcca58-72d2201b86emr33470701b3a.23.1736794726627; Mon, 13
 Jan 2025 10:58:46 -0800 (PST)
Date: Mon, 13 Jan 2025 10:58:45 -0800
In-Reply-To: <86ikqiwq7y.wl-maz@kernel.org>
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com> <20250111012450.1262638-4-seanjc@google.com>
 <87ikqlr4vo.wl-maz@kernel.org> <Z4U03KRYy2DVEgJR@google.com> <86ikqiwq7y.wl-maz@kernel.org>
Message-ID: <Z4ViZb7rruRiN-Oe@google.com>
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
X-CRM114-CacheID: sfid-20250113_105848_008795_73E8DA4A 
X-CRM114-Status: GOOD (  38.42  )
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
> On Mon, 13 Jan 2025 15:44:28 +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> > 
> > On Sat, Jan 11, 2025, Marc Zyngier wrote:
> > > On Sat, 11 Jan 2025 01:24:48 +0000,
> > > Sean Christopherson <seanjc@google.com> wrote:
> > > > 
> > > > Add a kvm_run flag, KVM_RUN_NEEDS_COMPLETION, to communicate to userspace
> > > > that KVM_RUN needs to be re-executed prior to save/restore in order to
> > > > complete the instruction/operation that triggered the userspace exit.
> > > > 
> > > > KVM's current approach of adding notes in the Documentation is beyond
> > > > brittle, e.g. there is at least one known case where a KVM developer added
> > > > a new userspace exit type, and then that same developer forgot to handle
> > > > completion when adding userspace support.
> > > 
> > > Is this going to fix anything? If they couldn't be bothered to read
> > > the documentation, let alone update it, how is that going to be
> > > improved by extra rules and regulations?
> > > 
> > > I don't see how someone ignoring the documented behaviour of a given
> > > exit reason is, all of a sudden, have an epiphany and take a *new*
> > > flag into account.
> > 
> > The idea is to reduce the probability of introducing bugs, in KVM or userspace,
> > every time KVM attaches a completion callback.  Yes, userspace would need to be
> > updated to handle KVM_RUN_NEEDS_COMPLETION, but once that flag is merged, neither
> > KVM's documentation nor userspace would never need to be updated again.  And if
> > all architectures took an approach of handling completion via function callback,
> > I'm pretty sure we'd never need to manually update KVM itself either.
> 
> You are assuming that we need this completion, and I dispute this
> assertion.

Ah, gotcha.

> > > > +The pending state of the operation for such exits is not preserved in state
> > > > +which is visible to userspace, thus userspace should ensure that the operation
> > > > +is completed before performing state save/restore, e.g. for live migration.
> > > > +Userspace can re-enter the guest with an unmasked signal pending or with the
> > > > +immediate_exit field set to complete pending operations without allowing any
> > > > +further instructions to be executed.
> > > > +
> > > > +Without KVM_CAP_NEEDS_COMPLETION, KVM_RUN_NEEDS_COMPLETION will never be set
> > > > +and userspace must assume that exits of type KVM_EXIT_IO, KVM_EXIT_MMIO,
> > > > +KVM_EXIT_OSI, KVM_EXIT_PAPR, KVM_EXIT_XEN, KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR,
> > > > +KVM_EXIT_X86_WRMSR, and KVM_EXIT_HYPERCALL require completion.
> > > 
> > > So once you advertise KVM_CAP_NEEDS_COMPLETION, the completion flag
> > > must be present for all of these exits, right? And from what I can
> > > tell, this capability is unconditionally advertised.
> > > 
> > > Yet, you don't amend arm64 to publish that flag. Not that I think this
> > > causes any issue (even if you save the state at that point without
> > > reentering the guest, it will be still be consistent), but that
> > > directly contradicts the documentation (isn't that ironic? ;-).
> > 
> > It does cause issues, I missed this code in kvm_arch_vcpu_ioctl_run():
> > 
> > 	if (run->exit_reason == KVM_EXIT_MMIO) {
> > 		ret = kvm_handle_mmio_return(vcpu);
> > 		if (ret <= 0)
> > 			return ret;
> > 	}
> 
> That's satisfying a load from the guest forwarded to userspace.

And MMIO stores, no?  I.e. PC needs to be incremented on stores as well.

> If the VMM did a save of the guest at this stage, restored and resumed it,
> *nothing* bad would happen, as PC still points to the instruction that got
> forwarded. You'll see the same load again.

But replaying an MMIO store could cause all kinds of problems, and even MMIO
loads could theoretically be problematic, e.g. if there are side effects in the
device that trigger on access to a device register.

