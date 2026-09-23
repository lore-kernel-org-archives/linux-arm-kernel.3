Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F76C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdvfcIHzuDUv22cT6IMsimyb9EhpnmvYvHKeIurV9RM=; b=w6yKm14kV76pMzqUY8kng2fkeL
	7YDJuNEVvJN/9Eu1ENlk/XA7Z4aS+k6TaGS4OL2OadiDb80fYLmkWQSu6sCLKcjndffo13z55dWHo
	L36L/kSYWkx3AlORCmHplYkRtbSV8YD19O6zIjESjjqdZ+UMSvTD9WyHyABdHk6hEAdaOxwi0rtFr
	w6tSirt1/Rykmy4Q7ElNzJfsIa93nsmwlIEanSvZbacJVBRuBE8mFDTP/5g9Yb0xjwGYj3FjHtDXS
	Im03jnqzxn033Ck6eHfkBWYLU3N0hZ9jA5fTa6Io+3bjVtXYt2uB5tefqEbPy5Fkd1w35Z4yfjZrE
	9bQB6CTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N5a-00000008PDw-1N7q;
	Wed, 23 Sep 2026 13:32:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N5Y-00000008PDb-2o9C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:32:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27AEA42A46;
	Wed, 23 Sep 2026 13:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DAF1F000FF;
	Wed, 23 Sep 2026 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790170363;
	bh=NdvfcIHzuDUv22cT6IMsimyb9EhpnmvYvHKeIurV9RM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LDWCxWxG6X3KqX3olCxZLvcMShWHXNh0Ds4io8xzigKHebnQIK2A3qf1Lqbn8c6zk
	 T7t3MC00oUALrAiTwhKyBxc8B6FazZjNZ0mhuim0LeGrrxg220oXkshspOHYIrA0x1
	 ZByJT3nbdHSIqp6sPLJ2dfRawd/kuBZGW0icvQlxx0+Ih7+bjU/PJp3fwpMGxsDONw
	 c0eZlRA/kPq0MRqs8kUL1evkBsLUahmLYYRB0i+OGH6qQQ9LUjNhUmaWFEuQIyqFjr
	 Hu2XlKwowF85CdcJaJxVVb/oeuVQMygFXFg7uVNlTrJpbtU1TWQjKz2MfJ9Mjswx9U
	 1L3qaz6usABEg==
Date: Wed, 23 Sep 2026 14:32:33 +0100
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
Message-ID: <arPU4O4_oDUzPcod@gremlin>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-10-787bd3bc7e3f@kernel.org>
 <CA+EHjTyCc=T+HkvWv1g2Fg3OxGaa1i8Hdv296ivPc94jQqZq9g@mail.gmail.com>
 <arPTt4WuVxcdvThs@gremlin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arPTt4WuVxcdvThs@gremlin>
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

On Wed, Sep 23, 2026 at 02:28:59PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Wed, Sep 23, 2026 at 12:18:10PM +0100, Fuad Tabba wrote:
> > Hi Lorenzo,
> >
> > On Tue, 22 Sep 2026 15:18:04 +0100, "Lorenzo Stoakes (ARM)"
> > <ljs@kernel.org> wrote:
> > [...]
> > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > [...]
> > > +static long __pre_fault_s2(struct kvm_s2_mmu *mmu, struct kvm_vcpu *vcpu,
> > > +                           gpa_t gpa, struct kvm_memory_slot *memslot, s8 level)
> > [...]
> > > +        if (is_gmem)
> > > +                ret = gmem_abort(&s2fd, &result);
> > > +        else
> > > +                ret = user_mem_abort(&s2fd, &result);
> >
> > When kvm_gmem_get_pfn() fails, gmem_abort() calls
> > kvm_prepare_memory_fault_exit() before returning, which on this path
> > writes vcpu->run's exit_reason and memory_fault fields outside
> > KVM_RUN. If that happens on a vCPU between its KVM_EXIT_MMIO and its
> > next KVM_RUN, kvm_arch_vcpu_ioctl_run() reads KVM_EXIT_MEMORY_FAULT
> > instead, skips kvm_handle_mmio_return(), and the guest repeats the
> > access. Could gmem_abort() skip that exit when result is set?
> > user_mem_abort() never writes kvm_run.
>
> Ack yeah we shouldn't be updating vcpu->run like that in that case, will
> update to avoid doing that in v4.

(Folded into 5/14)

--
Cheers, Lorenzo

