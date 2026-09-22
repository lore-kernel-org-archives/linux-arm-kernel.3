Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73508C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 18:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXpVSnMgs3Z7izHUy03zYCf6znjQJnlKV3nqic4hNd8=; b=FQBpZY1pWsNU50qNfzqAaO+Rp/
	yCj/ljQyQbu+ghLq3clwx4J0T/qD6H653iWesoo29dZzPCGgLDpkKhLKy6B/dRxEmou92zP/czaOV
	jQ6R6M+W4nGrKuhL8ScbVm2NdeX+rlWO7Os3vk+/wPziNd2yakDVZIVvIqSx9ktfBVPO0t3Bzg/+i
	9D0vuu17nrulv24c7vhlAU3KEWwzuqVe8gKVkg51PtHW+lucPFzOUYQImDGbURgintVGQzCM1V/PT
	g347a2MU9le0xKJfc1edsz5+0iC9+qKePAP3qNKAVdeEede/nPRjxNqzFKRrvhn05jKyUGkV48m30
	PI3IiqQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95bm-00000006Ljl-2YGz;
	Tue, 22 Sep 2026 18:52:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95bk-00000006Lja-3uIz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 18:52:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CC2660142;
	Tue, 22 Sep 2026 18:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B081F000FF;
	Tue, 22 Sep 2026 18:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790103168;
	bh=MXpVSnMgs3Z7izHUy03zYCf6znjQJnlKV3nqic4hNd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hMiZHKSa7U2bacA1JtdlXZZKizxqaV55VvMSi9xha2q/7AZ+JiVih9cjUTQUctOl7
	 QAlEn6eljWYbWC+Fz4EXb9rmE5ojWeeBrSGbHLk4fDkR9lbzMqbH23B6hBcShNnyYz
	 /8clYd3RYb46IaI1HeC0/uWpcX3FhktX1Q9z22DTqUH9UV8WpXXcYdYiCrCNdx/BXh
	 xr1U9hzn+VpFq508+U8fd8gbqrNJdSOefDdl4iRccuM7WLEMiYhu5gnzPvZ2NzB31/
	 MiK9ENsSDmNW3uPiDtkVtsuHJpVogFYliYjrZk9qmhMIvjeFpebZmmpVkUYrfOEQ8l
	 lwtZHgf2NRE8A==
Date: Tue, 22 Sep 2026 19:52:39 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
Message-ID: <arLNQJ2ZbcZ6xivb@gremlin>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org>
 <arKxjsxuO1F5ExrY@kernel.org>
 <arK5n9HrbZMCOHOt@google.com>
 <arK5ynpRi7VbY7Ek@gremlin>
 <arK8seJVT9wYgVCP@google.com>
 <arK8-Hec3-5o4jYs@gremlin>
 <arLLnYvkXSFr6f6u@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arLLnYvkXSFr6f6u@google.com>
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

On Tue, Sep 22, 2026 at 11:40:29AM -0700, Sean Christopherson wrote:
> > > But look at it from an x86 perspective.  Pretty much everyone will look at this
> > > and expect:
> > >
> > >   bool kvm_arch_vcpu_allow_pre_fault_memory(struct kvm_vcpu *vcpu)
> > >   {
> > > 	return vcpu->kvm->arch.pre_fault_allowed;
> > >   }
> >
> > I'm not sure I really get your point here at all? :)
> >
> > Why would it matter what people who are too lazy to go check the implementation
> > assume about an arch hook?
>
> Because I don't hate the people that contribute to KVM, and want to make it as
> easy as possible for them to not make mistakes?

Haha well I think I misunderstood you here, I see the point that you might
assume some state like this rather than an explicit conditional, and the inline
comment suggested by Oliver makes things a bit clearer.

--
Cheers, Lorenzo

