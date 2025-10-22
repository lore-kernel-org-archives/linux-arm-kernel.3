Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EC8CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 19:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wREzy7rE27X1qKmfXOWprRl7YFBX8aFkFx3LWlFCsNc=; b=CTQzXrojkiSB8DAwhOfEtA6CCF
	kTz5WyBFRKOZjyFw34olQNNtRqSJXWUiQeLMNE09RAGv8xT40inJ6quLSYgQuEh6x48YXa0A6JIkC
	+Zm7IuEOhZS/8sehGW+tife9MmdwbgwtiMNhAXO2XQzVBG8zwg3P8LAW+85DNqFEcQo9EeO6xAx6D
	n1kp7aR1gyUiKsXZIQCGcR6uudcKZhfGYMSvlArS1nf5UfAKSZ0cqHSl7rOKwoAXhi5/Vft1xKalV
	h0NPr7KlZ1be5vdTVbXG3GnTqhgE4oHlpRmpRatspcNRQfUaQCcvyu2U2eRHQUR/EiBcRwbJelrk7
	jFPM2ODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBeCX-000000045iI-3ZX9;
	Wed, 22 Oct 2025 19:08:49 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBeCW-000000045h9-1N85
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 19:08:49 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6cf3112d08so217106a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761160127; x=1761764927; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wREzy7rE27X1qKmfXOWprRl7YFBX8aFkFx3LWlFCsNc=;
        b=HXoKXPd4l5qSR0ItKfvY5LIc5Rr021zoJKEixb1FpwfIKGmxPZRR5bipukq24bvTMQ
         azVx1VQWSa/QNvm66Yggs9/1OR5kvGwG6sn79tQsiIBdJqPdA8uHax8wqEaEj97IdCQO
         JBeWcJRG7vZFuoBc7sa+5bI2we0raBOWLYQHIzfDgTMJMF4FaJucizE1nOIcwZLxlzer
         8ImACy9Au89ghqGOWwVRP/ORLNr1QKh8YJv1aMbvsGEduXbENu/ZWhq0VJVYCfv4/vST
         edaH83yTdU2Qf8tC4CDfjhPX1xCaPZizsIDJBqKUEoTtKRb33lsOtHpsZNEhVMLUV5x/
         BoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761160127; x=1761764927;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wREzy7rE27X1qKmfXOWprRl7YFBX8aFkFx3LWlFCsNc=;
        b=Ht38BR2+OhuTnzf9t4PtPFlauILsYCQbv8HBKjNuY5jjmW2X/xDyZCG5VZ4A4CTD7k
         ORQFXIfFtusyEwr+e2os6GppNW/CY4lLwfoP+LrHgkpXw4d5R+X0UigU9XHR4kf9hXrh
         HMhNoSoMcnsgRunZxW4CwO5BlGQ2A7a6o9ExJgoWtLLlTG26WpDaOlbWSJCXMJ/JPV21
         Q9utqJZB/lQO32Q7QYjj93grKYnopQ14g823fe5WWnpU+IxDun5tCT5iipkSTqQKPP/U
         ZUFOT6UKiB4R91yP+AawwgntlYvy4n9nA8j+I+4MPZHzRaoJTlqggYuhwOeCMZcFNMVc
         NnZA==
X-Forwarded-Encrypted: i=1; AJvYcCWvPnAQg/xKkkt04ztV4Z3rDq1rZP+1JN7tE55WJJwU+gikbRJhp6kOcVTVB0fsBumEq5gdPhtJbzwgjGZKItoC@lists.infradead.org
X-Gm-Message-State: AOJu0YyurJ/O6G+XNtzervribnw/eneMzepVHNOSuzXelUMKfOVOKUdK
	5++SHah/BFSvG5hzVIehZ8Ri3FyNICKG/4RBPcqeDU5TBGaEG0fJ7JPNKeux+EkFRlZhG0jr1aD
	ZWYzA0Q==
X-Google-Smtp-Source: AGHT+IG7bMbvOV7PjecaO9CgeAeXZcwC+wb3hcO8vOg4iH6Jor9tS/5vQmEcVRzTkSnVuCY2g2HzBv4NWV8=
X-Received: from pjbpc16.prod.google.com ([2002:a17:90b:3b90:b0:330:9870:9f18])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:218a:b0:2e5:c9ee:96fa
 with SMTP id adf61e73a8af0-334a861743bmr28027967637.34.1761160127099; Wed, 22
 Oct 2025 12:08:47 -0700 (PDT)
Date: Wed, 22 Oct 2025 12:08:45 -0700
In-Reply-To: <aPiZ2DEQ6qW5r5rY@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-11-seanjc@google.com>
 <aPiZ2DEQ6qW5r5rY@yzhao56-desk.sh.intel.com>
Message-ID: <aPkrvWcm3JF9WlVd@google.com>
Subject: Re: [PATCH v3 10/25] KVM: x86/mmu: Drop the return code from kvm_x86_ops.remove_external_spte()
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
X-CRM114-CacheID: sfid-20251022_120848_365137_643B08EB 
X-CRM114-Status: GOOD (  17.40  )
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

On Wed, Oct 22, 2025, Yan Zhao wrote:
> On Thu, Oct 16, 2025 at 05:32:28PM -0700, Sean Christopherson wrote:
> > Opportunistically pass the spte instead of the pfn, as the API is clearly
> > about removing an spte.
> >From my perspective, "remove_external_spte" means removing an external SPTE (not
> a mirror SPTE). So passing in pfn_for_gfn seems reasonable as well.
> 
> Additionally, passing in the pfn eliminates potential concerns about incorrect
> spte content.

No, it just makes bugs harder to debug.  E.g. it doesn't magically guarantee the
@pfn matches the pfn that was mapped into the S-EPT.

> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index 48598d017d6f..7e92aebd07e8 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -1855,8 +1855,8 @@ struct kvm_x86_ops {
> >  				 void *external_spt);
> >  
> >  	/* Update external page table from spte getting removed, and flush TLB. */
> > -	int (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> > -				    kvm_pfn_t pfn_for_gfn);
> > +	void (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> > +				     u64 spte);

Thinking more about what "spte" actually tracks, I think I'll rename it to
"mirror_spte".

> Also update set_external_spte?

Ooh, yeah, good call.  And we can use the mirror_spte information to assert that
KVM expects full RWX permissions, e.g. that we aren't creation a security hole by
letting the guest write memory that KVM thinks is read-only (extreme paranoia,
more for documentation purposes).

