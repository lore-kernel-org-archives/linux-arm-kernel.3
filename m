Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF18CC98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/8lUKp9mIX5d6BKwHywb1J2XqYuMwPVrIBYkOuLxkI=; b=cxPWXAjjBQRCA12Z80IZwg2ThM
	pSOGVZGRvUMth2WsQ0TikebrXUKu5IIM1GSs3LqHZFrT84JdNoB6nZNr3yNK+NepClhDLFnS1y79w
	pcEd++MY0rJl/NTfhxQegrzSmyvmbZVFpWKnjsjiaiIZtErD6EevDpnEHU6el8PZ5gHa3KpXbpaXf
	aapEUKAi+lka8mBxhs34ettUT9ity0ryQXrUAR42fNybZtefUg2Qd91OPZcw70zHh+bU203ITQ9IY
	W9KZzhtGfziZAKVOty389OnZ5YWmfbm+9FoJxjlVRRrMhKFe8+3woE3Sq6tdRfiEWaet9sQIhrNPJ
	A5BqyysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ejN-0000000APz9-25sL;
	Thu, 24 Sep 2026 08:23:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ejM-0000000APyp-2Aeo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:23:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E55944375D;
	Thu, 24 Sep 2026 08:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CC31F000FF;
	Thu, 24 Sep 2026 08:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238179;
	bh=S/8lUKp9mIX5d6BKwHywb1J2XqYuMwPVrIBYkOuLxkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LKRk7Yef7xIRXywmYt9T9p8ZQrbVXd7n+swMMEKmBp2zOWJ7YgL2ycv5JC3WOiQE8
	 r75OCp43XzZPdNxIfpBLHg8Hyxi3VbuxfkXtmHo/dsPoPHl8sDvZWu5skYpaz/3h6B
	 I8leYeJmIZKqLPggRWdGz6bna2VuECRUlAG++6RMWW3kP9Ou/obf8jtu4nbr1c6rOu
	 p3GbpdB08d3+J+pskLku3PjKjTCWIia2EGwx7LWnwDYmTt+kSnV9PQR3jRSJV1zKOd
	 xCU7kf9CeR9HBun9nMQR9UiRg5w6NUmieCFF/EbxzD2C2y9Km6mTqbnlX54j3TFiCv
	 KozGf/TKQzglA==
Date: Thu, 24 Sep 2026 09:22:47 +0100
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
Message-ID: <arTdxHgk_3gGySOO@gremlin>
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

Ack can fix up I need to respin!

>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Thanks! :)

>
> Cheers,
> /fuad

--
Cheers, Lorenzo

