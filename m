Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28526C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9GN/9Nt3vZP1g4PXg+O1YxepiT+zT9oJT9rhlVkhGw=; b=e3LXP8lgAdhLlrhyyY8gBBKDmb
	DSqTIc3lKSsfhaS2dlciCI1oRXaXCYQsBKXIuy3W7PwegnurGsaLRxBfMoXCTovZ/olOVOLm7WBZs
	TQrcHduVl0a4rCMykhNGYG/BDu/2LgLxV7KLd1G589WcA0XxvNJRwA4JQDZ689vPLtltcFafMlo0i
	BLGoBYt4QeWhY9Who+kP+Afa7LQsyMua6wJ0jG+OQaxFXA6PF4Fyyh23Zd/TOqbl3K26WPyGbuFzq
	YO8OS3ktTd0mCFV8CBXM6j05Qd/vNb++FatCT/wZQC2OUD5J7XkZEH5CUZNBLyMXPF62rLVZGBSe2
	aGPkEgqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXN4k-00000005nxp-2sWJ;
	Mon, 13 Jan 2025 16:14:02 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMcB-00000005hIy-2BuT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:44:32 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-216717543b7so114001565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 07:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736783070; x=1737387870; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f9GN/9Nt3vZP1g4PXg+O1YxepiT+zT9oJT9rhlVkhGw=;
        b=akXHQBcobt55w39MHjzFp/QpNrOZfSWXv0vY2EAYR2iHf8atJCPButl7qZgO518+HH
         8Cj84KZKBpjrC78GWCRBpcjDzCkQ/0VNAR0+A85NMwEmsS0OvsOmuaA+IlQSF+AI/fpb
         LH7JnOBY0w0qopa4c2//Vb5HlGCs1dWfw8zV4rbUFZEeSOkerWK/hJGQw6Jsw1ZPMaYW
         Y4vStfQ/hljb/9jExtJRYH1IWVDZgvU65X5bE5m7+kOY8bATSSbUlVWLAQidfze9ZoWb
         zyG6Kg/Z99ocGEmVPfKyQbeR65/GtTU+PvXhTk8ERxAkgSR7zrpcm/H/bHfElTGPhMzJ
         cf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736783070; x=1737387870;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9GN/9Nt3vZP1g4PXg+O1YxepiT+zT9oJT9rhlVkhGw=;
        b=nANVQvZMdOn9ci2GBCy9RoR6KdAPWPYZbZ76b3R+KK8jl9bOQCVcUf1bn6kmyopUwf
         owPD+owOCkLlsCpm9V9Phkyfu6IJQlkJvOnqD/NKh4IDxFMqRc9JEnlgvnF1c3UzXN8L
         zmC/tiUFs5xxGZkKtvnYoeRrNudmmSCb1BennKSB21w2KBPVVIz2diB04cOn5AxUIsYX
         y/sRzEK9IC6V4m95Wro6UW2pDvnjTlmkNnTheLOEkkQbmiyB+pLKUyKDSCyF/NiYIpd2
         KZiFoJ0fLos1Q6imRV0j+XvarTl/OkW/+h3J+P2hqI/lTyJSV4pzfvkIoKbidnjYOhsF
         ob1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDdPoc/3zBs1dcCnkFh6k8hOADDxq2bhxs5mhE3VBrX3kYPjEJdBwpcNsEP3pNKjwOB0+kKyqvKWbwoFSWCBFA@lists.infradead.org
X-Gm-Message-State: AOJu0Yyci82VhkT48p2oqZrjv8zhd4lxH66SsiWyrFl9nYJv7X/tFr0g
	XCDGml/2ZT/W+sQlu6SdOFpvKrEo1MXffB91CyMPvOMx2fZWechFBk9VjXPSIqrmuzIF8cMkkyM
	Q4Q==
X-Google-Smtp-Source: AGHT+IHIQyazhiyyUpnFFe5650540BmH10WSCzq7nQUkxQTSPWj6gISntiQcqyGsVty8NrTJi6F4Z/IpKIc=
X-Received: from pfbfh41.prod.google.com ([2002:a05:6a00:3929:b0:72a:bc54:8507])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3993:b0:1e1:adb9:d1a6
 with SMTP id adf61e73a8af0-1e88d0f000fmr33694244637.41.1736783070268; Mon, 13
 Jan 2025 07:44:30 -0800 (PST)
Date: Mon, 13 Jan 2025 07:44:28 -0800
In-Reply-To: <87ikqlr4vo.wl-maz@kernel.org>
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com> <20250111012450.1262638-4-seanjc@google.com>
 <87ikqlr4vo.wl-maz@kernel.org>
Message-ID: <Z4U03KRYy2DVEgJR@google.com>
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
X-CRM114-CacheID: sfid-20250113_074431_561424_96F8377F 
X-CRM114-Status: GOOD (  32.89  )
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

On Sat, Jan 11, 2025, Marc Zyngier wrote:
> On Sat, 11 Jan 2025 01:24:48 +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> > 
> > Add a kvm_run flag, KVM_RUN_NEEDS_COMPLETION, to communicate to userspace
> > that KVM_RUN needs to be re-executed prior to save/restore in order to
> > complete the instruction/operation that triggered the userspace exit.
> > 
> > KVM's current approach of adding notes in the Documentation is beyond
> > brittle, e.g. there is at least one known case where a KVM developer added
> > a new userspace exit type, and then that same developer forgot to handle
> > completion when adding userspace support.
> 
> Is this going to fix anything? If they couldn't be bothered to read
> the documentation, let alone update it, how is that going to be
> improved by extra rules and regulations?
> 
> I don't see how someone ignoring the documented behaviour of a given
> exit reason is, all of a sudden, have an epiphany and take a *new*
> flag into account.

The idea is to reduce the probability of introducing bugs, in KVM or userspace,
every time KVM attaches a completion callback.  Yes, userspace would need to be
updated to handle KVM_RUN_NEEDS_COMPLETION, but once that flag is merged, neither
KVM's documentation nor userspace would never need to be updated again.  And if
all architectures took an approach of handling completion via function callback,
I'm pretty sure we'd never need to manually update KVM itself either.

> > +7.37 KVM_CAP_NEEDS_COMPLETION
> > +-----------------------------
> > +
> > +:Architectures: all
> > +:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> > +
> > +The presence of this capability indicates that KVM_RUN will set
> > +KVM_RUN_NEEDS_COMPLETION in kvm_run.flags if KVM requires userspace to re-enter
> > +the kernel KVM_RUN to complete the exit.
> > +
> > +For select exits, userspace must re-enter the kernel with KVM_RUN to complete
> > +the corresponding operation, only after which is guest state guaranteed to be
> > +consistent.  On such a KVM_RUN, the kernel side will first finish incomplete
> > +operations and then check for pending signals.
> > +
> > +The pending state of the operation for such exits is not preserved in state
> > +which is visible to userspace, thus userspace should ensure that the operation
> > +is completed before performing state save/restore, e.g. for live migration.
> > +Userspace can re-enter the guest with an unmasked signal pending or with the
> > +immediate_exit field set to complete pending operations without allowing any
> > +further instructions to be executed.
> > +
> > +Without KVM_CAP_NEEDS_COMPLETION, KVM_RUN_NEEDS_COMPLETION will never be set
> > +and userspace must assume that exits of type KVM_EXIT_IO, KVM_EXIT_MMIO,
> > +KVM_EXIT_OSI, KVM_EXIT_PAPR, KVM_EXIT_XEN, KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR,
> > +KVM_EXIT_X86_WRMSR, and KVM_EXIT_HYPERCALL require completion.
> 
> So once you advertise KVM_CAP_NEEDS_COMPLETION, the completion flag
> must be present for all of these exits, right? And from what I can
> tell, this capability is unconditionally advertised.
> 
> Yet, you don't amend arm64 to publish that flag. Not that I think this
> causes any issue (even if you save the state at that point without
> reentering the guest, it will be still be consistent), but that
> directly contradicts the documentation (isn't that ironic? ;-).

It does cause issues, I missed this code in kvm_arch_vcpu_ioctl_run():

	if (run->exit_reason == KVM_EXIT_MMIO) {
		ret = kvm_handle_mmio_return(vcpu);
		if (ret <= 0)
			return ret;
	}

> Or is your intent to *relax* the requirements on arm64 (and anything
> else but x86 and POWER)?

