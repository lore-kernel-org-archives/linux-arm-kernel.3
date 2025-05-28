Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEE8C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 21:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BT+c6zGpxWunPJzCyibqWW9XXWypfHDjrKmTt1TSPms=; b=ppWf8tY7VN1MnnjmSjIGxUGgq3
	C1vJ4nNyF+1CypBhtk0TaJbDLKTiTLSjZmkGLu7yVYXqtG14liNjjSZf3sR/u4l801hDHcUapQUCV
	rNLtVjmTEiLvKT2NLWGjn5f6qOw+PSsMNnGuQyjJx1DQ/XdKqxJTPPV0ofHrQTcghuQWAWxYd3Qh+
	bH98Vn8PqmVCmC9FJqbDxoTi3JXkm+GLcJhiGfZskwoteS4BpyLdkhvUtVS7C0Umd+XWv6vM7o+/7
	FjQKzmGKT5myOQsg9AP6ii6Erl+EVehRH//+RjUaljHvTrzniDY5HGJq12mioCXG5Om3Emjsp+/lA
	QEeX5NTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKOGT-0000000E8eX-0ZBu;
	Wed, 28 May 2025 21:24:45 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKOEK-0000000E8SZ-0nxL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 21:22:33 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-311fa374c2fso220856a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 14:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748467350; x=1749072150; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BT+c6zGpxWunPJzCyibqWW9XXWypfHDjrKmTt1TSPms=;
        b=1CXhGjR25S8ZpxmT/gbr2ahiAh2vOa6SCC5hury7j7BgadLl1Bk6Y48YcSUjdQdo/+
         FW8kep+DQ2KYX97llhZf5k4ttP/Ueq/AeNER8qoEiDBlt+BicYb/bG44f6oVELMZncoQ
         +dzd/Aum13aciUJkaQicVUoKY8zMqy0szrT/sohSZlMFSxoQLsw4LfmyqkRsuYW+9tiG
         Lx6lg3wmj5O3f8CTP57cuOweaWCR9CHnG8bgaE2knZOO/eIbGLqAyXRahtXOcC255k1I
         ShhSvsnjb4YJRe6MfGSlhCJNZmndcX/HSreethNolmDDf1HjXGE4Xv9tJlls7MW9uPXc
         eumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748467350; x=1749072150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BT+c6zGpxWunPJzCyibqWW9XXWypfHDjrKmTt1TSPms=;
        b=Pc5j5oCv/xg5v0fphdHabXLeqXQ4gfp+/qTOvQoNZ2nhUenfinFpPZFfWa2p8Ln+Kv
         ucgf6mM/mrvdE8kYklrvR0HbaI5I5z/GlgUbNt6PQ4rkp779IMEsm2o5XfPTpYnFDl5Q
         pZYN2XVoqw78z4tiuSt0A78vaaSJr5fjXgoX8RYFTmlWLbyG6R4gpziMe+IkgHUjcveK
         KnaJExKl5nL5kbeSbnhILPYFpJ9tvGJsyeqJmb1jCwY9TRUk4PX/N2hlcOJJFQYhSDFI
         7qc3V2FTv5KjCLOYB/EnNbcXFy4IiPyq1xzNiT9RTd89W21eUUFc8b/x0CGjGL/5hO+R
         2xSg==
X-Forwarded-Encrypted: i=1; AJvYcCVYVb0QOVQlCM/uixx5/GL9PQ/2gXyGuF9uJBSO50k3DY4N/h4X0thcHBylZxGAEbyKqYfS+jviwiRTON0JAAWC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/OM1sfo31Vh4Sv4C818ZfJDPoPKLeZuxTHCEvWFo0AcJFeeNx
	eHQezZPdYPTbEulggLbmVO6PVXNBHuChtOGDpit/nVC+Zp+LBgFWeeRkR8nLEeM38t/2CTwYnxb
	HB+RCNA==
X-Google-Smtp-Source: AGHT+IF+NBSwn27LCwHruaYCKMmwinUtCZExXbbsFzSAslFn8KGj0A9s44fdNVHSd+EufkBdd/ISjeqX35w=
X-Received: from pjbrr5.prod.google.com ([2002:a17:90b:2b45:b0:311:b3fb:9f74])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3510:b0:312:1ae9:152b
 with SMTP id 98e67ed59e1d1-3121ae9232dmr446908a91.23.1748467350549; Wed, 28
 May 2025 14:22:30 -0700 (PDT)
Date: Wed, 28 May 2025 14:22:29 -0700
In-Reply-To: <aDdwXrbAHmVqu0kA@linux.dev>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
 <20250109204929.1106563-6-jthoughton@google.com> <aBqj3s8THH9SFzLO@google.com>
 <aDdwXrbAHmVqu0kA@linux.dev>
Message-ID: <aDd-lbrJAX62UQLn@google.com>
Subject: Re: [PATCH v2 05/13] KVM: x86/mmu: Add support for KVM_MEM_USERFAULT
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_142232_234992_2DB23E6A 
X-CRM114-Status: GOOD (  23.22  )
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

On Wed, May 28, 2025, Oliver Upton wrote:
> On Tue, May 06, 2025 at 05:05:50PM -0700, Sean Christopherson wrote:
> > > +	if ((old_flags ^ new_flags) & KVM_MEM_USERFAULT &&
> > > +	    (change == KVM_MR_FLAGS_ONLY)) {
> > > +		if (old_flags & KVM_MEM_USERFAULT)
> > > +			kvm_mmu_recover_huge_pages(kvm, new);
> > > +		else
> > > +			kvm_arch_flush_shadow_memslot(kvm, old);
> > 
> > The call to kvm_arch_flush_shadow_memslot() should definitely go in common code.
> > The fancy recovery logic is arch specific, but blasting the memslot when userfault
> > is toggled on is not.
> 
> Not like anything in KVM is consistent but sprinkling translation
> changes / invalidations between arch and generic code feels
> error-prone.

Eh, leaving critical operations to arch code isn't exactly error free either :-)

> Especially if there isn't clear ownership of a particular flag, e.g. 0 -> 1
> transitions happen in generic code and 1 -> 0 happens in arch code.

The difference I see is that removing access to the memslot on 0=>1 is mandatory,
whereas any action on 1=>0 is not.  So IMO it's not arbitrary sprinkling of
invalidations, it's deliberately putting the common, mandatory logic in generic
code, while leaving optional performance tweaks to arch code.

> Even in the case of KVM_MEM_USERFAULT, an architecture could potentially
> preserve the stage-2 translations but reap access permissions without
> modifying page tables / TLBs.

Yes, but that wouldn't be strictly unique to KVM_MEM_USERFAULT.

E.g. for NUMA balancing faults (or rather, the PROT_NONE conversions), KVM could
handle the mmu_notifier invalidations by removing access while keeping the PTEs,
so that faulting the memory back would be a lighter weight operation.  Ditto for
reacting to other protection changes that come through mmu_notifiers.

If we want to go down that general path, my preference would be to put the control
logic in generic code, and then call dedicated arch APIs for removing protections.

> I'm happy with arch interfaces that clearly express intent (make this
> memslot inaccessible), then the architecture can make an informed
> decision about how to best achieve that. Otherwise we're always going to
> use the largest possible hammer potentially overinvalidate.

Yeah, definitely no argument there given x86's history in this area.  Though if
we want to tackle that problem straightaway, I think I'd vote to add the
aforementioned dedicated APIs for removing protections, with a generic default
implementation that simply invokes kvm_arch_flush_shadow_memslot().


