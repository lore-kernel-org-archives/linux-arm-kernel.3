Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1008AC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 22:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IvAMOvcbhlU5W8QZLEdB4U1p9VX42TgZ9WfVdMPu+g=; b=LipHED/1n7MUCpTxwtIEvvtFjY
	4LIZfVfAqBVIH6RqZkgffgnkC0MKh80sHMCXQQQSSRz681Yuij09R72xWU5cB7KLDp7qiy9Nswidz
	d6JG0qyBiiG+wyvTl9qzh6zS0823bGyXslAnOtLl+Okvqkpf3FDDT7ry6S0kgZUy6WCl+3XD74wXq
	vvFm7IIukvnw6ogNS/zgPvsDDrpFqetGfiGOPEfN0ZFKxhvHeLFw5cDgXDiB7+UkPkLSx9MQ5RHqx
	rT3ARHmmork2KYLy7rHJL1vYMmkW4+ZG+IYVCVBtXYJ3G6LVoLyHNHCNTx4TR7wpivbGx8BJuXbMk
	x7OsVK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtG8-00000000E8t-363y;
	Tue, 29 Jul 2025 22:57:24 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtDf-00000000Df4-2LtW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:54:52 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31f030b1cb9so3515389a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829690; x=1754434490; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IvAMOvcbhlU5W8QZLEdB4U1p9VX42TgZ9WfVdMPu+g=;
        b=Wf+TJ7rqoLXk20INi0OHhqHSRQ6vG0GLDmy6i3d13c0thYpkwUbpY+iB6ju47Pz9az
         TTL7J/sxDrJa+jzSdjgRMxekkPPrf3uj3XzkRv1DbyGDwK2vlKZ6SBc/JOsWjVwL001j
         QWDOUP7Ulmc34Z6HlpOhZUQeI3CZ/YcM4G2bQX1d/U/6tjXf2EUHQwryu9a8F9GaLRtv
         uNAKE1lxqCgd+hM3ullwmEnzuFTSYm4Gpn/2wPr2IDGMZF0vIJjhOTJAIKrGDaVc4aKw
         lKDP2Da31CV7VmME9l7b0NUFYLPX5uozm9U6bpYehax+DjtHOaeTpjQqpmngGP6HLKVX
         yeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829690; x=1754434490;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9IvAMOvcbhlU5W8QZLEdB4U1p9VX42TgZ9WfVdMPu+g=;
        b=ijnyH25ZwB7CzhK2e3otAiMuXo+KKbt/5alufoVdhwvwc5rtaJ2dgoL6IR6FUIe/cz
         tnW5lEnK8f8wBZad2/waUEzwMgVQ29hQuS6lvrnGPbRpmuED53Gtt6SwHowxkr4ZTPcD
         C13XwLir+6ioYVzUpy7e+Os5b6Q/9BwF7f9Kz8uH1vtvwSfQS8rxLOocZvynNWBrQ0Ol
         tLQX0gsRo3rt4D1jh3e5UTN6tAtTBUWAuvu4uPB6WIw+PFYVAzH8r+Ibitq7telsHO+3
         Wi/1pcBE2l3AcgDFKLFJTTOt9pyPH5OBFuDU8bqq4huMZCkxs0azS3yqDp0I49fk6meX
         tn3A==
X-Forwarded-Encrypted: i=1; AJvYcCVzsJj9SGElrp18pbKSG66tD5gRVydnjCtlV0M1ibwU62XUoMjXioMHcI9g6jLuP4dTGtMCIsIqlQda07SbIrGP@lists.infradead.org
X-Gm-Message-State: AOJu0YyOldJYpLQTvaU02pMtplU2ZG4F7JiuorbyHd5T3rhyO75DYAUl
	4vhJ8ZVQeUr22NnZc6jab2Ok+I06jZOa26p5QFei7O03mbxDYBANhZ+YBX/ZczXHAIiMJ4ssA5a
	4fx4hcg==
X-Google-Smtp-Source: AGHT+IGQQ1/q92PLrkeNoYQwXKazYVHZno9fNiuzRJmcVNPJlU7fDI+A2fWwC+0aM4sd5YoKaOkjLYsx6S8=
X-Received: from pjk12.prod.google.com ([2002:a17:90b:558c:b0:31f:3227:1738])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1e0c:b0:311:abba:53d2
 with SMTP id 98e67ed59e1d1-31f5de42527mr1515007a91.17.1753829689699; Tue, 29
 Jul 2025 15:54:49 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:48 -0700
In-Reply-To: <1d9d6e35ebf4658bbe48e6273eefff3267759519.camel@intel.com>
Mime-Version: 1.0
References: <20250729193341.621487-1-seanjc@google.com> <20250729193341.621487-3-seanjc@google.com>
 <1d9d6e35ebf4658bbe48e6273eefff3267759519.camel@intel.com>
Message-ID: <aIlRONVnWJiVbcCv@google.com>
Subject: Re: [PATCH 2/5] KVM: TDX: Exit with MEMORY_FAULT on unexpected
 pending S-EPT Violation
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Vishal Annapurve <vannapurve@google.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155451_619117_C8D5707A 
X-CRM114-Status: GOOD (  16.41  )
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

On Tue, Jul 29, 2025, Rick P Edgecombe wrote:
> On Tue, 2025-07-29 at 12:33 -0700, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index 3e0d4edee849..c2ef03f39c32 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -1937,10 +1937,8 @@ static int tdx_handle_ept_violation(struct kvm_v=
cpu *vcpu)
> > =C2=A0
> > =C2=A0	if (vt_is_tdx_private_gpa(vcpu->kvm, gpa)) {
> > =C2=A0		if (tdx_is_sept_violation_unexpected_pending(vcpu)) {
> > -			pr_warn("Guest access before accepting 0x%llx on vCPU %d\n",
> > -				gpa, vcpu->vcpu_id);
> > -			kvm_vm_dead(vcpu->kvm);
> > -			return -EIO;
> > +			kvm_prepare_memory_fault_exit(vcpu, gpa, 0, true, false, true);
> > +			return -EFAULT;
> > =C2=A0		}
> > =C2=A0		/*
> > =C2=A0		 * Always treat SEPT violations as write faults.=C2=A0 Ignore t=
he
>=20
> The vm_dead was added because mirror EPT will KVM_BUG_ON() if there is an
> attempt to set the mirror EPT entry when it is already present. And the
> unaccepted memory access will trigger an EPT violation for a mirror PTE t=
hat is
> already set. I think this is a better solution irrespective of the vm_dea=
d
> changes.

In that case, this change will expose KVM to the KVM_BUG_ON(), because noth=
ing
prevents userspace from re-running the vCPU.  Which KVM_BUG_ON() exactly ge=
ts
hit?

