Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBE2C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKxy5ppVh+ZVi5LdabeSqcQhssdmIldVntZe+JHVqHo=; b=NYR6owyV9I+h8KlDQJqIJA3Unl
	eV0cCVRVwDbycl6N71bX3wxrwu7Btx4mJNn7rzf30yQbbekI110MIDDjzQl4t0JQUK+av3X34iJ94
	cKl9ceMa0wvz7uctBrFoJEEv2/TTHuDcB7m3kPhnKqnTNAs/JzdVN1re9xbKNyx+ptI4QLs4S7enm
	zEHXwos88GSsqxfkAaQVwUG3A2CwVeLfNqs4SKqxoKLzKwt8o1lznFcWfOZT3CllUBADuKToPaE28
	zhTLVFzAUjQrv26xY8aeEOjNOsvkpEF15wm3VnhMUOlOKf6KxGU/NLo3u9NwbYDCCP5r6CVu8r7+S
	glx33f6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N25-00000008OO6-49Fz;
	Wed, 23 Sep 2026 13:29:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N24-00000008ONm-3dWj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:29:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 65A89414C0;
	Wed, 23 Sep 2026 13:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2832A1F000FF;
	Wed, 23 Sep 2026 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790170148;
	bh=HKxy5ppVh+ZVi5LdabeSqcQhssdmIldVntZe+JHVqHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eEYHECZLL4YnROp24IFvxK5oqs4Thdn064/2WlM7Tose8DQWMJ0ePy8zG/6y6ezX+
	 2Vy00VkkmXSyzsZFfBMRHcSypqZQlPuF1HiP1tQcYdePlFyW2d49Ngvevx2WK+vnFy
	 ogzbX9WKDjakM3jBbTgJYL7l0g6ZO6ITb6ojwnlErR5mCQY6Lt5psTNkrUw+LzxxJl
	 Kv0IadWBvXRpCef9XC0XEbAWuS5jzmfHRjEhTJKc6FDmbH7GXi/LjHEuXQLOXKE6Yq
	 fNYOniMZgeEdw8I3tMDVXQyV0tT6iVDwZVjzNisq9/FeOu+P2svrYqIlHx77LHK+Qs
	 jciqEW9G7sHew==
Date: Wed, 23 Sep 2026 14:28:59 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 10/14] KVM: arm64: Implement KVM_PRE_FAULT_MEMORY
Message-ID: <arPTt4WuVxcdvThs@gremlin>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-10-787bd3bc7e3f@kernel.org>
 <CA+EHjTyCc=T+HkvWv1g2Fg3OxGaa1i8Hdv296ivPc94jQqZq9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyCc=T+HkvWv1g2Fg3OxGaa1i8Hdv296ivPc94jQqZq9g@mail.gmail.com>
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

On Wed, Sep 23, 2026 at 12:18:10PM +0100, Fuad Tabba wrote:
> Hi Lorenzo,
>
> On Tue, 22 Sep 2026 15:18:04 +0100, "Lorenzo Stoakes (ARM)"
> <ljs@kernel.org> wrote:
> [...]
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> [...]
> > +static long __pre_fault_s2(struct kvm_s2_mmu *mmu, struct kvm_vcpu *vcpu,
> > +                           gpa_t gpa, struct kvm_memory_slot *memslot, s8 level)
> [...]
> > +        if (is_gmem)
> > +                ret = gmem_abort(&s2fd, &result);
> > +        else
> > +                ret = user_mem_abort(&s2fd, &result);
>
> When kvm_gmem_get_pfn() fails, gmem_abort() calls
> kvm_prepare_memory_fault_exit() before returning, which on this path
> writes vcpu->run's exit_reason and memory_fault fields outside
> KVM_RUN. If that happens on a vCPU between its KVM_EXIT_MMIO and its
> next KVM_RUN, kvm_arch_vcpu_ioctl_run() reads KVM_EXIT_MEMORY_FAULT
> instead, skips kvm_handle_mmio_return(), and the guest repeats the
> access. Could gmem_abort() skip that exit when result is set?
> user_mem_abort() never writes kvm_run.

Ack yeah we shouldn't be updating vcpu->run like that in that case, will
update to avoid doing that in v4.

>
> Cheers,
> /fuad

--
Cheers, Lorenzo

