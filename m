Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D976CE6B25B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 22:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9715HtTznOFduyWRjJ/RpqR7EdieRfbBPMra7nL6iYs=; b=OcvqZtxsZaEkwyUHv4ojb3fjUL
	J0h89ZTyk2mK6T4iMGAUqRgv0+G6o922R/RFJ6eOIviuT7BTNxE1ZCXN0QTLu0QgMR+H95rDY25cF
	IVABm1WWn8lVQeL9Lv7vgIlYSUKSZQY8IfIRUnZWezk3ocU2XITGPhj8DXByPwDJdO0Bc4A/rAapj
	B9HyBT5At+XR/y9QpMOmHdX1vQoaGnPWdn21FxfnzMFZyjxEOiTHbWrdlqypP2nsKIp+ORVTWlxF7
	dk5mFjsW80tZJPDFtivhz0mtI3YbkxuI0fnziQRRRjvuMrTG31O/dGvJ25XrU7+C4chpp/DiPJTji
	VJvL2vFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXo71-0000000EDTE-1Yn3;
	Mon, 22 Dec 2025 22:10:43 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXo6y-0000000EDSn-4Aaa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 22:10:42 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso85191675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 14:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766441439; x=1767046239; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9715HtTznOFduyWRjJ/RpqR7EdieRfbBPMra7nL6iYs=;
        b=cdK6CuNBZGSfLXnFI06S5YhM5fQd2eUHswS4fa3hUhK5bRkh1kmcIJkUfR4FfuvhGz
         1xrbHCXnC8gMvmAyq2c81EHGxBSH6eUG1zt+XmWCHpy4Ny6HpXcvoR2q7WfCm/EboEvv
         Haxy8p/wIt17rBQeIj8a2wkSritRJ0Wov3u/DBlkDpzC8OY5HDtqBzg6h1U4UAqDikKc
         7wGlWP9SuFKcepWW/KGzby6PBCRPLuHbMJ+fuULClnkcu7EwRxoj+MG+D1HPYD0H9qKA
         Yq6luedlzR4iHD1jzkAROOq10wvQyHAVw1rkdq5oJWQ0MRAtK+W75gWxkNjwka2t04Os
         pg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766441439; x=1767046239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9715HtTznOFduyWRjJ/RpqR7EdieRfbBPMra7nL6iYs=;
        b=eZUR4RpoOIS0+hCVIzidDqQ8iKgK94DMqW/7R1BmA0ZKixilBPQTWBN1iklWQISMJA
         ylP/DEH9ADHjyN5Sa+wx/tE68vmxUAYMKuE5elhcJqkbbx4huscrFVy3KndF4VmadkFR
         X+RrR2PPyEQnsIwUBA0cI+3N49hH8iq1VvuJV7timSTx/1NrGwvlentznaR+s2RH5zs1
         WfMTCrZwu761uNqMql3kKth+k1OsVXZw+f1ALqlRjnZtm1mwcuTdvGYtDjug7O2t8kd2
         b5KgtNe8eMXaTNwV0khzZyrO1lL36SnIqybO5BPj9itfzViP2YKS7Ff1fy5jR2d409Pb
         28Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVpItVDXP90st2p0hG4IwQMNFP7MFW+2nufwC7+ah51MGiqIbTsrfxQWSloXCNOXHrzdd8soRGxC0Y6hsztQbFo@lists.infradead.org
X-Gm-Message-State: AOJu0YyFZzlNLu2mnfex16CIX69DrvE/AJMuqhFL9WON17r7fZry06Z+
	2kbliDPxcZr75pS17fN0jUp3iKpCdOQPCu4Ip2O8sUwdrYNGI8OIz91D54UKOs7gLFQovvGcK6N
	FvrpwHg==
X-Google-Smtp-Source: AGHT+IElsJc59hwdn+BH0pp7IxsX2bM6BeSQ8eCoKXCAmrz5eNfcwC6En114KJ5EJbbxgh/j09hzULxKtUg=
X-Received: from plry8.prod.google.com ([2002:a17:902:b488:b0:269:8ca7:6998])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d50a:b0:295:290d:4afa
 with SMTP id d9443c01a7336-2a2f242aaa6mr132352445ad.23.1766441439191; Mon, 22
 Dec 2025 14:10:39 -0800 (PST)
Date: Mon, 22 Dec 2025 14:10:37 -0800
In-Reply-To: <9218dafc-c6ad-4ef3-b869-2d6d4a308181@redhat.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-40-seanjc@google.com>
 <njhjud3e6wbdftzr3ziyuh5bhyvc5ndt5qvmg7rlvh5isoop2l@f2uxctws2c7d>
 <42513cb3-3c2e-4aa8-b748-23b6656a5096@redhat.com> <aUmdSb3d7Z5REMLk@google.com>
 <9218dafc-c6ad-4ef3-b869-2d6d4a308181@redhat.com>
Message-ID: <aUnB3WNLYape2Nap@google.com>
Subject: Re: possible deadlock due to irq_set_thread_affinity() calling into
 the scheduler (was Re: [PATCH v3 38/62] KVM: SVM: Take and hold ir_list_lock
 across IRTE updates in IOMMU)
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ankit Soni <Ankit.Soni@amd.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>, 
	Naveen Rao <Naveen.Rao@amd.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_141041_042430_9B010A60 
X-CRM114-Status: GOOD (  21.26  )
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

On Mon, Dec 22, 2025, Paolo Bonzini wrote:
> On 12/22/25 20:34, Sean Christopherson wrote:
> > On Mon, Dec 22, 2025, Paolo Bonzini wrote:
> > > notably, __setup_irq() calls wake_up_process outside desc->lock.  Therefore
> > > I'd like so much to treat it as a kernel/irq/ bug; and the simplest (perhaps
> > > too simple...) fix is to drop the wake_up_process().  The only cost is extra
> > > latency on the next interrupt after an affinity change.
> > 
> > Alternatively, what if we rework the KVM<=>IOMMU exchange to decouple updating
> > the IRTE from binding the metadata to the vCPU?  KVM already has the necessary
> > exports to do "out-of-band" updates due to the AVIC architecture requiring IRTE
> > updates on scheduling changes.
> 
> In fact this was actually my first idea, exactly because it makes
> svm->ir_list_lock a leaf lock!
> 
> I threw it away because it makes amd_ir_set_vcpu_affinity() weird, passing
> back the ir_data but not really doing anything else.  Basically its role
> becomes little more than violate abstractions, which seemed wrong.  On the
> other hand, drivers/iommu is already very much tied to the KVM vendor
> modules (in particular avic.c already calls
> amd_iommu_{,de}activate_guest_mode), so who am I to judge what the IOMMU
> driver does.

Yeah, I 100% agree the whole thing is a bit gross, but practically speaking it's
just not feasible to properly abstract the interaction, because in reality the
IOMMU implementation is tightly coupled to the CPU implementation.  E.g. passing
in the address of a PID isn't going to work well with an AMD IOMMU, and passing
in the address of a vCPI isn't going to work well with an Intel IOMMU.

And FWIW, the lack of true abstraction isn't limited to x86.  ARM's GIGv4 passes
around "struct its_cmd_info" and PPC uses "struct kvmppc_xive_irq_state".

I mean, we could do what GICv4 does and use irq_set_vcpu_affinity() to pass
different commands to the IOMMU, e.g. by formalizing "enum avic_vcpu_action"
between KVM and IOMMU so that avic_update_iommu_vcpu_affinity() wouldn't need to
_directly_ call AMD IOMMU code.  But IMO that would be a net negative because in
practice all it would do is make it harder to understand what's going on.  And
it would more directly create this potential deadlock.

Huh.  Which begs the question of whether or not ARM is also affected by this
deadlock, without the extra hop through svm->ir_list_lock:

  (a) irq_set_thread_affinity() triggers the scheduler via wake_up_process(),
      while irq_desc->lock is taken

  (b) the scheduler calls into KVM with rq_lock taken, and KVM uses
      irq_set_vcpu_affinity() via vgic_v4_{load,put}()

If ARM is affected, then maybe fixing this in irq_set_thread_affinity() is indeed
better than fudging around the deadlock in avic.c.

