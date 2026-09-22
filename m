Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB38C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMBUcj03qoQAyG1GKCyEGFSnmBsF37yewOw9nu3IXkc=; b=24LwpBR+arZuDay+DrmJakI6dx
	LsUmS/XS1o4+gcIT02hjHVC07cID6bd6jev8XTIhufhsBPYzVuXnLj41ObSfW+b4HAlYZn9QPFQ5k
	sO+x+wYDSrKJmGw+2aIvdY9+zhXE1aCZvgck5aOTJ2iS3aO4wgO0m7g8vwTy30xlp1pInFsCfirpp
	sIJIEVbgFyf04saVJhl2NbYGQNkB8JqPvy+VLn5eLcde0CoLZixixJQlJr4+yR1n1McIoNet++mdw
	ziFYpKSPF6HW8jrq35KFN158E0gzYifA7mczDV8BTKmUNbugE+qJlqKf8Pc6y2zc57t0oa0c8oJag
	ECXPWOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94QI-00000006E1N-2q6c;
	Tue, 22 Sep 2026 17:36:54 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94QG-00000006E0r-15Pv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:36:53 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2dd753a52bbso1372855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790098611; x=1790703411; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMBUcj03qoQAyG1GKCyEGFSnmBsF37yewOw9nu3IXkc=;
        b=KNqME09fmC31kYrmfmb+KpqMYNDOdiQANxsZdOiwAasKrmnUEbBbV70fYXgxj25QkJ
         FJR4qGXpETpA0P6nhY0K0nx1f4hpd5MdQ2bgRBqPyEbWrJ5Q29DtzLqtDFxrCQ4pOWkP
         8m3E0DHr5SHz3hmuJycZ1+hAff3mTf2rJ+idNJts4SI4D3noQhCp6VED9fNisb3ykstG
         RYcydPRA3Sf34B4QtIMIel9iO/ulUeTeLMeObeQdDWCFPYu4kbWKpR/F7AlGIotgaCsN
         lLG5LsTD4DZ2zfh6wdZKe6omf/64YNRsAdvxVn3jbPbk/kkfECZbS9j2+cHt7GbgwwR+
         ERTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098611; x=1790703411;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMBUcj03qoQAyG1GKCyEGFSnmBsF37yewOw9nu3IXkc=;
        b=s5siMBA9YpqBeHSmQRqpsSST/9xlV3x0VomWqFLS74MqnyhNIFdU1VQ+AQqNR94jDt
         YKmS2M72yAMZHG/kW6jkg14Pxrcg0RMPZZM8qJWDnkKiXWpPf/I8/7rqBae/rUAClb5L
         WdPtGdIFZF/9Jyi7ljMT4bXx9brmInog5VDzQJ8RmNH1Fe5qVrSQcAGqLAEVTE1D1SAf
         f6rJX01Qq4+37f8LlgMsdTWbXKnyeYaNPVDqHC/XgIw7be1QLyRn8Ds0YMP7L2VY4348
         6yi1AwbX5laB2TJQdAoP2voIiCS4n3V4jiHd+ip9MII8k7G32NHZ2NgjTPYSSLj720nk
         fydg==
X-Forwarded-Encrypted: i=1; AKwUvBzsldjDmN/IlKEdv0bNaRZ8RvlAwt3luV5tHV/7CWW1Hx1+6XROJ1C2JT1gZ45V2cRO/GNdgTZ4TR1D30BOP4it@lists.infradead.org
X-Gm-Message-State: AFuF++ktDFuQxnT45raKnoU+sNiMtGu1HPHnh7OZoBigDGgJ2CRfXWuV
	dVKAofyZDkmQOejqqngmpqVg5bMSVzKC4wRm+M2fT5b6CG6lsCxmPV6jrHyOCryOitrEbYtD2Ov
	fI7fjYQ==
X-Received: from plhz10.prod.google.com ([2002:a17:902:d9ca:b0:2df:4a0d:5ac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b27:b0:2dd:c100:a5d9
 with SMTP id d9443c01a7336-2df69df7453mr924125ad.45.1790098610429; Tue, 22
 Sep 2026 10:36:50 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:36:49 -0700
In-Reply-To: <arK5ynpRi7VbY7Ek@gremlin>
Mime-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org> <arKxjsxuO1F5ExrY@kernel.org>
 <arK5n9HrbZMCOHOt@google.com> <arK5ynpRi7VbY7Ek@gremlin>
Message-ID: <arK8seJVT9wYgVCP@google.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
From: Sean Christopherson <seanjc@google.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_103652_298518_03AC3ECB 
X-CRM114-Status: GOOD (  25.65  )
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

On Tue, Sep 22, 2026, Lorenzo Stoakes (ARM) wrote:
> On Tue, Sep 22, 2026 at 10:23:43AM -0700, Sean Christopherson wrote:
> > Rather than have kvm_arch_vcpu_allow_pre_fault_memory(), what if we add a more
> > generic kvm_is_vcpu_loadable()?  That way we don't need to worry as much about
> > the return value, the connection to vcpu_load() is obvious, and we don't need to
> > add another pre-check if future (or cleaned-up existing?) ioctls want to do
> > vcpu_load() in common code.
> 
> ...this is exactly what I started out with.
> 
> But then you are in a pickle, because _really_ you need to do that check in
> vcpu_load(). Which is a void function. Which is called by every single
> architecture all over the place.
> 
> So you'd have actually no way of signalling the error back.
> 
> Of course those places are arch code and you could say 'arches should know
> better and if they call it it's fine not to call the arch 'can you load'
> function.

Yes, that's my vote.  It'd be easy enough to clarify that "rule" with a comment
in linux/kvm_host.h.

> But you're still stuck with the problem of where exactly you put this check.
> 
> So then do you put that check in a wrapper around it?
> 
> Instead you can make the predicate 'don't prefault on a not-yet-initialised
> vCPU' which is pretty sensible I think, have a specific place to put it and
> all's well with the world.

But look at it from an x86 perspective.  Pretty much everyone will look at this
and expect:

  bool kvm_arch_vcpu_allow_pre_fault_memory(struct kvm_vcpu *vcpu)
  {
	return vcpu->kvm->arch.pre_fault_allowed;
  }

> > I'd also be tempted to say it can be a macro, not a __weak function.  E.g.
> 
> Yeah it can be many things but why would you want a macro if you could possibly
> avoid it? :)

Because it allows arch code to dererefence "struct kvm_vcpu" in kvm_host.h,
i.e. allows "inlining" the check.

