Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B83DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 21:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0XNYuhFzewq5SpoNE6ECYDEqUR/PdEjHr7BqxomWbo=; b=rBSCyZjkhYy3JUkT0Fvo/h0JJz
	Bmh8gCF+oZeOWXPsKgUpAvR/OFbs7ctKgZO/1zBGkOUSH5iDBPaUqOranRNEU5xqMlnEX+vdbntaJ
	ctal7D5INN1f2f6T9g7qafqt23L8QPcUpIAOeZ9jD5gePPFKhKfice1xotIE7JyVVATithCFFhtsH
	9pVhLX+vb4bev74I5mfZCPMwGNJEfHPdSe/M8Cq4oyTZCLpuIbd1CgdL/0H/epUsnyS/ME3rGuayV
	sgCQwAjweC+JuMyE7JdSIkM055JKQNo1/oiUWSP5Rf/dNrTIfBBy1MPfOrzQd7jRNtCeOKRQt/Kzu
	Wx9ENm/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1Hf-0000000DC1i-3Ze4;
	Tue, 26 Aug 2025 21:32:51 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1Ew-0000000DBr2-3BH4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 21:30:03 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32515e8e4cbso9272104a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 14:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756243801; x=1756848601; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t0XNYuhFzewq5SpoNE6ECYDEqUR/PdEjHr7BqxomWbo=;
        b=rUNdgL6AFKXzEzq8x5mGhR05bHjYJnOux1CWnbeK3ROhOmlyJ5DERjgQO/rStbgjQ1
         Srva/Czm/khnf2Y8WCKAvPokBASndh/WFDAhKVLXef61pXRuxHXXYQd+euHvdhJAVimc
         KKvplPUeQGMeV1GTmSRpt9yZ481UeK9snIiXOqO7/rMvn0oN79JRU2IyDPnb6xjPbTMF
         Zjwb2mzzyiLr/VqscOEQKLX4uLIQYCjTEl52sQ044gTK77ec3Bo1RFDT7JUS+iMAVA6Q
         9XOyFS3cf4CL3CU826ua99CG/1V0lEGyU/GYpirjU1BcSOjV4YnrGIfFMtbxN5s8/7ud
         ycqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756243801; x=1756848601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t0XNYuhFzewq5SpoNE6ECYDEqUR/PdEjHr7BqxomWbo=;
        b=mwRNP5cofSXtxWrWeY0EoNGmhRHRakagZzPUbfr01NgFNCRQFnvcJCDKhbOUHnBgl/
         aNrCYoDpWeaAujji4UW7n/KjFqyFrEC9UHuGGSDGAyTgO2kNpDLKYtpiKfPz8ceZ5h7G
         t4fJakttjrGMgOL7ZGfrd8p9Z45h7bXW1oJ1+YZFMtIn+WUJuOV4U8hbb/LK9q0thhm3
         oH46QcW8kIqwd2IkFj897CU2oRRN87PggZH+ehHofB1Q1nIjpcvEyH2ISATEHGrnxqKe
         sD5z2d+jpiSPX4j8Q1zn1frFeGpEH/Jb4P6sPiCXLZ6V6OnAq5/uhPAG4gu85eO2Ri/K
         Jc5g==
X-Forwarded-Encrypted: i=1; AJvYcCWSl2JRsvTdkw0bvaNv0yy8UqxoJiZ7xOajfeI/Q/p7t7+gLa//s39fpmeJGxCCaLXIEjM4yRthIHX+xwy6J6YE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvs5QRBp5LGmYKEFZAXD6kq+bx8RsHjqCw73fACTOmKaJ8rLJ2
	oymiP7+xAYR+CldUhvJUN4pbJdQwLB5sPyLXGvxBc+xSMPdDtrHR9TsydpkwMrHlYnwlsk/PAl3
	2ypLNng==
X-Google-Smtp-Source: AGHT+IF7MPxNgNaQJ4UlRAoZAcA9biTVvRMSBkz6IDXnOSl5pa+enjNi1lYtcaOBiqr8KYqBgElOkDB/jcY=
X-Received: from pjqq8.prod.google.com ([2002:a17:90b:5848:b0:325:d07:8343])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51c6:b0:324:24d:3207
 with SMTP id 98e67ed59e1d1-32515eabb6dmr23253945a91.17.1756243801375; Tue, 26
 Aug 2025 14:30:01 -0700 (PDT)
Date: Tue, 26 Aug 2025 14:29:59 -0700
In-Reply-To: <aK4LIj-OZsP_35wc@linux.dev>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com> <20250821210042.3451147-6-seanjc@google.com>
 <aKeeRynpwFTSONfm@linux.dev> <aK4DwtuQtzYvRei-@google.com> <aK4LIj-OZsP_35wc@linux.dev>
Message-ID: <aK4nVyoEd3hgmxaD@google.com>
Subject: Re: [RFC PATCH 05/16] KVM: arm64: Introduce "struct kvm_page_fault"
 for tracking abort state
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_143002_820910_716C93A7 
X-CRM114-Status: GOOD (  26.38  )
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

On Tue, Aug 26, 2025, Oliver Upton wrote:
> On Tue, Aug 26, 2025 at 11:58:10AM -0700, Sean Christopherson wrote:
> > On Thu, Aug 21, 2025, Oliver Upton wrote:
> > > > +struct kvm_page_fault {
> > > > +	const u64 esr;
> > > > +	const bool exec;
> > > > +	const bool write;
> > > > +	const bool is_perm;
> > > 
> > > Hmm... these might be better represented as predicates that take a
> > > pointer to this struct and we just compute it based on ESR. That'd have
> > > the benefit in the arch-neutral code where 'struct kvm_page_fault' is an
> > > opaque type and we don't need to align field names/types.
> > 
> > We'd need to align function names/types though, so to some extent it's six of one,
> > half dozen of the other.  My slight preference would be to require kvm_page_fault
> > to have certain fields, but I'm ok with making kvm_page_fault opaque to generic
> > code and instead adding arch APIs.  Having a handful of wrappers in x86 isn't the
> > end of the world, and it would be more familiar for pretty much everyone.
> 
> To clarify my earlier point, my actual interest is in using ESR as the
> source of truth from the arch POV, interface to the arch-neutral code
> isn't that big of a deal either way.

Ya, but that would mean having something like

  static bool kvm_is_exec_fault(struct kvm_page_fault *fault)
  {
	return esr_trap_is_iabt(fault->esr) && !esr_abt_iss1tw(fault->esr);
  }

and

  if (kvm_is_exec_fault(fault))

in arm64 code and then

  if (fault->exec)

in arch-neutral code, which, eww.

I like the idea of having a single source of truth, but that's going to be a
massive amount of work to do it "right", e.g. O(weeks) if not O(months).  E.g. to
replace fault->exec with kvm_is_exec_fault(), AFAICT it would require duplicating
all of kvm_is_write_fault().  Rinse and repeat for 20+ APIs in kvm_emulate.h that
take a vCPU and pull ESR from vcpu->arch.fault.esr_el2.

As an intermediate state, having that many duplicate APIs is tolerable, but I
wouldn't want to leave that as the "end" state for any kernel release, and ideally
not for any given series.  That means adding a pile of esr-based APIs, converting
_all_ users, then dropping the vcpu-based APIs.  That's a lot of code and patches.

E.g. even if we convert all of kvm_handle_guest_abort(), which itself is a big task,
there will still be usage of many of the APIs in at least kvm_translate_vncr(),
io_mem_abort(), and kvm_handle_mmio_return().  Converting all of those is totally
doable, e.g. through a combination of using kvm_page_fault and local snapshots of
esr, but it will be a lot of work and churn.

The work+churn itself doesn't bother me, but I would prefer not to block arch-neutral
usage of kvm_page_fault for months on end, nor do I want to leave KVM arm64 in
a half-baked state, i.e. I wouldn't feel comfortable converting just
__kvm_handle_guest_abort() and walking away.

What if we keep the exec, write, and is_perm fields for now, but add proper APIs
to access kvm_page_fault from common code?  The APIs would be largely duplicate
code between x86 and arm64 (though I think kvm_get_fault_gpa() would be different,
so yay), but that's not a big deal.  That way common KVM can start building out
functionality based on kvm_page_fault, and arm64 can independently convert to
making fault->esr the single source of truth, without having to worry about
perturbing common code.

