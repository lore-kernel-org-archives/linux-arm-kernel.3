Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8F0CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qQSURO19kIhXzArX2xPf4oTamNn87j/Xtfb5YjYQeg=; b=nkrNyOz1BHafSw2rO4LToe0nee
	0MO6W2pdhaUosxx8Cf/JZlveo1B5MpuUyiGAZHSVVPEnarN3qphiusZJg9cKerDGzmUhYr/kcvI3H
	6RzGGlyZf7M6VLT1JBghOUKP6S5GZq6nfwSLXb6XUIIS1kc19Vh1udkHP+r4pn4fcNzQccF69hj6y
	3PMv1xq7Akfh+JiKM7seb//N+vBbNMdCe+Q31LxZUWZtpKIwBigmXVPzkpX64QO9+AbI/7y8XL+IY
	iCnaLUszdKVH+WHsDMx1U9XUALIN21EzLgR5/rRoeSlyZD4JTNzn3tlCETYXUSA3UVarCFpOoNs05
	RXgklhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzL7-0000000FdvG-2IKj;
	Wed, 14 Oct 2026 13:48:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzL5-0000000Fdv3-2rNb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:48:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6FC86057A;
	Wed, 14 Oct 2026 13:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025671F00A2F;
	Wed, 14 Oct 2026 13:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791985694;
	bh=1qQSURO19kIhXzArX2xPf4oTamNn87j/Xtfb5YjYQeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V+Wp8E3KHj5HfarmjhHe8oPbVzrZV+mSoVlO20FAUrZAtZZUSAvDZDvEdIUnMOfWs
	 PdNFGYrmWub+NN20ADFsWODAqJ3aIsrh+e0rqf6NEtKzTnDVGbFIftvtvYw9KUmM8v
	 iGP4otTdzMyc8eRi+SNMBLMAdH4SVyy9ZPMTN8W3SsuNA2PnirUtJbaab3cG+2c8ym
	 dWi6Wa9WJU73sMqDniudv0FvXOFPy9nXKJHHb2eTUks3yFfMZcFaeA1bARgEjo5TrC
	 r+DoskInDcsRaq/0vcO9ButTC3Nw8nmVHd613gX+AutImHQNrGT4cq/NfYOUWyHI/m
	 oXmBkDNyfnpXg==
Date: Wed, 14 Oct 2026 14:48:02 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	David Hildenbrand <david@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 01/14] KVM: Allow architectures to disallow pre-fault
Message-ID: <as-H1zaslO-Bwf5q@gremlin>
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
 <20260923-kvm-arm-prefault-v4-1-d4b0b4dfa8c3@kernel.org>
 <CA+EHjTzDYSuBVEc+SMdDa41sq-ET=m_oWW0gL9dYf+AumPYPUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzDYSuBVEc+SMdDa41sq-ET=m_oWW0gL9dYf+AumPYPUg@mail.gmail.com>
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

On Wed, Sep 23, 2026 at 07:52:27PM +0100, Fuad Tabba wrote:
> Hi Lorenzo,
>
> On Wed, 23 Sep 2026 16:15:44 +0100, "Lorenzo Stoakes (ARM)"
> <ljs@kernel.org> wrote:
> [...]
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> [...]
> > +int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
> > +{
> > +        if (!vcpu->kvm->arch.pre_fault_allowed)
> > +                return -EOPNOTSUPP;
> > +
> > +        return 0;
> > +}
>
> nit: the comment above the smp_rmb() in tdx_sept_map_leaf_spte() still
> says pre_fault_allowed is read by kvm_arch_vcpu_pre_fault_memory(),
> but after this patch it's read here.

Ack, will chase that up!

>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Thanks!

>
> Cheers,
> /fuad
>

--
Cheers, Lorenzo

