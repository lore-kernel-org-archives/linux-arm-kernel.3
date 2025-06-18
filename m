Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC72C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 21:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDeX7q/l2+xg1imuGAxKGeggwWOnK+wgg5Zm+bSeJk0=; b=DYUs+DSGqLe2enObV/Dt0UvgHx
	JIlclTjqeuue6iXsWbLHmF8+xW7YH7220/6ADhLgBPGFJJ+C6Xwp7Hs9/wtrhPm+ydyIBeg/fkyZV
	v42hjh0TIVK8cuy5LYG1hNNenIMg9A+GDDMVws0llFFzvkR6b0BJVa/urRBQSTqZTez4GI4TB4ZLg
	HmZWU4OSvepdba6DqQUp4bHd4jQ61takkYN7uYO8oetEoW0ZuwyQAT6/WzYsp0pAWphKQVHYlSYj/
	bVbbKchxLd9ttF4cNjb2CVHOEl9lOJcGaVNmL9zYApdQ18apodXmVAtvaHBqjkL0fbf/84GDgCre9
	tMtjg7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0NB-0000000BRsd-1tdh;
	Wed, 18 Jun 2025 21:31:09 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0AE-0000000BQ8H-0gcM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 21:17:47 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-74890390d17so56071b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 14:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750281465; x=1750886265; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SDeX7q/l2+xg1imuGAxKGeggwWOnK+wgg5Zm+bSeJk0=;
        b=t/Tyd90FzmklWTUzgQ896kkpiVSZnBbKljY/1Oq9jnTeVOlKyIWnPKxAafkTel+o6I
         Jd+X+CaDPwqK6UQ06HmZ9TtOBCbuO6CfYxpRGZCSLV96It22Cm6TqSC0w86yC4zwjbQY
         /8sKz/C5Bo/nz2T6r4GCoYfRx+bJUNr/rwpnZGGI6+GnFI4217P0ZrNLIG++lrZ4NIE/
         lPJOrV0W5O2+c04pXszyXt79KAf3Pd8+BsmbISF7a2G4mfjSmqmuXSMz+PlgZDP+5Lws
         SVy+XMlV03f1ppHbN/ZWi7Ztki3Fcz3qGvcyw/bBgzDg4jHGpIISnnvkl4y52kvWR6Ox
         NfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281465; x=1750886265;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDeX7q/l2+xg1imuGAxKGeggwWOnK+wgg5Zm+bSeJk0=;
        b=inkf4i4CdP/ZLLSexHSght4bbSVQp/l6/pwVzmJzXvKVTq2uVd/fmkaMxDA+mGAXdS
         3DdF89cPs3IIXOiOIhJAq5OzVAPSm9gz5QR4qpFZAp/nua82x3rdKAQF8cpXPs0jqSBJ
         ePoNbVJLZR3Hr6zVmVecgm76yhGzlMk7SNYjYYM2jm8AxLJyUWL6zKkgwO0b8nc/9UDr
         cgHhktSkvZCMoI8mmjaVJxPa35TLGl6VGFrXMJiYF9v0/gUxd9DJ9yk6hzVkmzmnWIUE
         SgUHr5bDck6S6yLS+k8UeMmFkei896hKCTs7brVM5F4Q2V+FKHcni/TIVgQJVGTOIveV
         RPaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYL1HWGYwCy27hwPNlde5R7I2ZC09JDMNN8kLv4P5x3EAhkYjHvqP38IEoOPhs68yaCQgYXTSsAGUH71z5XcwW@lists.infradead.org
X-Gm-Message-State: AOJu0YzD7+iEVwM1R4xj0/nKo2tR4kq9tjGPfFwSxZVFZwtJfQ+U1+DI
	pRWSBTs1DpOv63NEiUd9oOA75S2hpQvwb9m4CkJp6gS41AdBf6HHfFZispo6CchAK+QTqhHzDl9
	2qsoVmQ==
X-Google-Smtp-Source: AGHT+IFrMBaSJPDppRsJZ5jvlklOZU4VQzs3tJ3F6qMENhjmoLLRaWLyHwVi7GAyrqStyqYxXS8ZDE6slDQ=
X-Received: from pfbef26.prod.google.com ([2002:a05:6a00:2c9a:b0:747:aac7:7c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3399:b0:21a:e091:ac25
 with SMTP id adf61e73a8af0-21fbd505f24mr32186546637.6.1750281465010; Wed, 18
 Jun 2025 14:17:45 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:17:43 -0700
In-Reply-To: <aFMS4O2TkWN8nexY@linux.dev>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-3-jthoughton@google.com> <aFMS4O2TkWN8nexY@linux.dev>
Message-ID: <aFMs9_GBVsiRmgz7@google.com>
Subject: Re: [PATCH v3 02/15] KVM: arm64: Add "struct kvm_page_fault" to
 gather common fault variables
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
X-CRM114-CacheID: sfid-20250618_141746_204201_2210A035 
X-CRM114-Status: GOOD (  24.05  )
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

On Wed, Jun 18, 2025, Oliver Upton wrote:
> On Wed, Jun 18, 2025 at 04:24:11AM +0000, James Houghton wrote:
> > From: Sean Christopherson <seanjc@google.com>
> > 
> > Introduce "struct kvm_page_fault" and use it in user_mem_abort() in lieu
> > of a collection of local variables.  Providing "struct kvm_page_fault"
> > will allow common KVM to provide APIs to take in said structure, e.g. when
> > preparing memory fault exits.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h |  9 +++++++++
> >  arch/arm64/kvm/mmu.c              | 32 +++++++++++++++++--------------
> >  2 files changed, 27 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 6ce2c51734820..ae83d95d11b74 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -413,6 +413,15 @@ struct kvm_vcpu_fault_info {
> >  	u64 disr_el1;		/* Deferred [SError] Status Register */
> >  };
> >  
> > +struct kvm_page_fault {
> > +	const bool exec;
> > +	const bool write;
> > +	const bool is_private;
> > +
> > +	gfn_t gfn;
> > +	struct kvm_memory_slot *slot;
> > +};
> > +
> 
> So this seems to cherry-pick "interesting" values into the structure but

s/interesting/necessary.  I literally grabbed only the fields that were needed
to handle the userfault :-)

> leaves the rest of the abort context scattered about in locals. If we're
> going to do something like this I'd rather have a wholesale refactoring
> than just the bits to intersect with x86 (more on that later...)

Definitely no objection from me.  How about I send a standalone patch so that we
can iterate on just that without James having to respin the entire series (for
changes that have no meaningful impact)?  I'm anticipating we'll need a few rounds
to strike the right balance between what was done here and "throw everything into
kvm_page_fault".  E.g. we probably don't want "vma" in kvm_page_fault.

Hmm, yeah, and I suspect/hope that moving more things into kvm_page_fault will
allow for encapsulating the mmap_read_lock() section in a helper without having
a bajillion boolean flags being passed around.  That would obviate the need to
nullify vma, because it would simply go out of scope.

