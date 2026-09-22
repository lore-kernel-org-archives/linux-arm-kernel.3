Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6080C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 18:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22qb4IkKc4A4y/WM6dRh1XUq626SL2Lh5OkUO2ttVr4=; b=dqdMQcQiMjqX9mwoMyz3caA7Bw
	vpKWN99ldXflW5jeEk+5mpTw2TniYD4IW2DbQXF5ZQq2MZDywubcqOSpW1a7WPOtuVmBoEo2rdBfZ
	oBVbeSMbzqqpK8p4EAP6bUXTXXwyS0KX1Fci+ZWdcLDFpuQmEto+6X69PSUx8cT0pJn0XSHIT9PhS
	VVZzB+lXZZf+5vC3FcL6wUmYwjMRqAPTolVPWIAD2/xoLT09jtkurHyIkirEJf/2RTNiFDVOn4AZK
	/LOrttHB0XjTDf/5AiePgij3PmW40kjtuOaDdeO4YgKxf2Wbi8Pr0fXGgJKHt+bu6sW23clWME34f
	P40BjXMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95Pv-00000006KMl-3WZs;
	Tue, 22 Sep 2026 18:40:35 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95Pt-00000006KLh-1kR3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 18:40:34 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-8710450f731so159868b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 11:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790102431; x=1790707231; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22qb4IkKc4A4y/WM6dRh1XUq626SL2Lh5OkUO2ttVr4=;
        b=KAPn6RgG8wADf3uC+Etfo0irmvgkwH2Nb+jS7rrksSU6Yp5LJXhplaizGzokTt8Vaq
         XmWzmsG8fZjRGqUwCa77zS7OPehDm7bJiKFLfAQfaiJUuT7q5v0a5Z1GkuCsFehaNJcZ
         a1L5eXLVSTYypPey/4Zxu7MxpLbP3DwJprtjdTEtBo00vdadwpyZrAn4LPAC8eooMXza
         +OZ1BBKN4bHHPSR6sjVIdtfGoxM3IsELr6g+XCi+doe062ib0Z9mOcYSGsz14rH/CnDE
         j4bCgT3hRVywAjxjAYAukkkLpsEHiFvJsm2V0aQCsI6OUzrpWAN5i+o/d+uVsPmtq9uJ
         OenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102431; x=1790707231;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=22qb4IkKc4A4y/WM6dRh1XUq626SL2Lh5OkUO2ttVr4=;
        b=fdoJUNKJwH2O3QIVKGDGxuFvrlApNXFBXHp47lPHjf9utx6lSajLk8MlmMxEnBskxq
         4chDMci1AjUjoZLPFwUmt6eu2F1W6KvRB1B+zD671ElSkoaomveHJWhCPjmI7f0UOWop
         I5IkUguSKhkT/5fiLFd7C0VcgxLWNeWpsUTsNn+zYInoh7Rtan31VJaY1CZXS0NZzrYh
         5uP5EAIIaNw/Aniz4UarplMcYV8sa78LxOazyE16HnnVDW3QutCIdmIAGTTSfGV6D2E5
         0HesDgtuxhGbt2/O9s5QBzUkdC/jZTBaLwtpDeqJ7uk74/CQ0WibOp36RvrrtbqXDwmA
         QHTg==
X-Forwarded-Encrypted: i=1; AKwUvBwLWXZaCN+yRrrCR3k1GKTQM0/8C3VxmgP+UbhEYQ6XNqfI8WGbZlNs//YxWKa3EK4F/xmTxn5MXg7GoZyyHahZ@lists.infradead.org
X-Gm-Message-State: AFuF++liSqxdJ9wtE0jdczGSJxbCxVR4hyF7e4+OiM3rvCK7olXQqp9c
	lmsXIVtOcMrQimpUnYyrjaJAGOuxJ1O0wjxsbwnyKUzGxMJSyiD7gaEupIAGvgUw7RAMuEWG9PH
	hQeUCwg==
X-Received: from pfbgd10.prod.google.com ([2002:a05:6a00:830a:b0:863:cabd:d30d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4396:b0:878:3507:8d5e
 with SMTP id d2e1a72fcca58-87d1bfae6abmr510835b3a.37.1790102430559; Tue, 22
 Sep 2026 11:40:30 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:40:29 -0700
In-Reply-To: <arK8-Hec3-5o4jYs@gremlin>
Mime-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org> <arKxjsxuO1F5ExrY@kernel.org>
 <arK5n9HrbZMCOHOt@google.com> <arK5ynpRi7VbY7Ek@gremlin> <arK8seJVT9wYgVCP@google.com>
 <arK8-Hec3-5o4jYs@gremlin>
Message-ID: <arLLnYvkXSFr6f6u@google.com>
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
X-CRM114-CacheID: sfid-20260922_114033_496955_D40C7648 
X-CRM114-Status: GOOD (  31.64  )
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
> On Tue, Sep 22, 2026 at 10:36:49AM -0700, Sean Christopherson wrote:
> > On Tue, Sep 22, 2026, Lorenzo Stoakes (ARM) wrote:
> > > On Tue, Sep 22, 2026 at 10:23:43AM -0700, Sean Christopherson wrote:
> > > > Rather than have kvm_arch_vcpu_allow_pre_fault_memory(), what if we add a more
> > > > generic kvm_is_vcpu_loadable()?  That way we don't need to worry as much about
> > > > the return value, the connection to vcpu_load() is obvious, and we don't need to
> > > > add another pre-check if future (or cleaned-up existing?) ioctls want to do
> > > > vcpu_load() in common code.
> > >
> > > ...this is exactly what I started out with.
> > >
> > > But then you are in a pickle, because _really_ you need to do that check in
> > > vcpu_load(). Which is a void function. Which is called by every single
> > > architecture all over the place.
> > >
> > > So you'd have actually no way of signalling the error back.
> > >
> > > Of course those places are arch code and you could say 'arches should know
> > > better and if they call it it's fine not to call the arch 'can you load'
> > > function.
> >
> > Yes, that's my vote.  It'd be easy enough to clarify that "rule" with a comment
> > in linux/kvm_host.h.
> 
> I note you dodge the actually difficult question of what this wrapper function
> would look like ;)

Oh, I was thinking we wouldn't bother with a wrapper.  Because I agree that
providing a complement to vcpu_load() would get all kinds of messy.  Though we
could harden vcpu_load() with a WARN_ON_ONCE(), which in practice would prevent
the vast majority of violations from making it to a final kernel release. 

> > > Instead you can make the predicate 'don't prefault on a not-yet-initialised
> > > vCPU' which is pretty sensible I think, have a specific place to put it and
> > > all's well with the world.
> >
> > But look at it from an x86 perspective.  Pretty much everyone will look at this
> > and expect:
> >
> >   bool kvm_arch_vcpu_allow_pre_fault_memory(struct kvm_vcpu *vcpu)
> >   {
> > 	return vcpu->kvm->arch.pre_fault_allowed;
> >   }
> 
> I'm not sure I really get your point here at all? :)
> 
> Why would it matter what people who are too lazy to go check the implementation
> assume about an arch hook?

Because I don't hate the people that contribute to KVM, and want to make it as
easy as possible for them to not make mistakes?

