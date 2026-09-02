Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B6CC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IX433ODiY8dSA9XxoxcXQeFJJMbnLapZEhkDMkPXAJc=; b=Mz2fiz3Ts+U+xXPQy9GvcXLi8P
	kUnRPpL3CDGggQytfc7BA6Rl+t9uddENCVa9m9+2+Hz50VpsQXA11T68EinYQLOTVXXcMIU2P74pX
	zWS875FijAY9iZzgJ1Z/W2Z9LMxNx/8VrDi0Pjnp0IY+e9UO9SDutbe02yGS6wsmQKBROQywh/nb1
	worddDVeGwG4USeY4rEU1XouonyE4nVx6sO91wugssy8STUYA7GE0bE3xBrPM0O6CzGubrtfYl4IL
	rmOauYD615e1GVc32rUlskTGzHSfGTD7iun3Xsh17aKLNwJlgzbKKYoL6Rr1gCoalIFcok5bYmiXF
	dpLVK+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ibe-0000000EQDP-3Gcq;
	Wed, 02 Sep 2026 10:54:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ibb-0000000EQCR-2val
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:54:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBDA0165C;
	Wed,  2 Sep 2026 03:54:06 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8553D3F8C6;
	Wed,  2 Sep 2026 03:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788346450; bh=VJhrLZI3tnfJzyrU+XBx+aRk7G0SRkdsT882fdzqnGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tJZtD3zgqQnEuGfs/67Yd+ZWlPXHjKoMT0U3ZR57dmGKpRUmMuHF1P6DufUHsQDhc
	 dE9KFKVVLrberz98boWoi5FfokmKbRPvi0j9drfEMvYknfwXCrjP9H//8pt77gtBVH
	 G65T8aXCLl88anRM8TxQgiUP5PGq5sbzBdls3yFI=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/5] KVM: arm64: Add KVM_REQ_RELOAD_STAGE2
Date: Wed,  2 Sep 2026 11:53:55 +0100
Message-ID: <apgAQ8p3hkGItkYK@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c8a6b6ac-aa4a-4cbc-b4f0-8dd6f4f02341@huawei.com>
References: <20260901171558.2674031-1-leo.bras@arm.com> <20260901171558.2674031-5-leo.bras@arm.com> <c8a6b6ac-aa4a-4cbc-b4f0-8dd6f4f02341@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_035411_993703_6206E211 
X-CRM114-Status: GOOD (  33.98  )
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

On Wed, Sep 02, 2026 at 11:41:39AM +0800, Tian Zheng wrote:
> 
> 
> On 9/2/2026 1:15 AM, Leonardo Bras wrote:
> > Add a vcpu request to exit guest, reload Stage2, and then come back to
> > guest.
> > 
> > This will be used on future patches that enable S2 HAFDBS and HDBSS, as
> > they may need to change VTCR bits for enabling/disabling the feature when
> > the vcpus are still running.
> > 
> > Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> > ---
> >   arch/arm64/include/asm/kvm_host.h | 2 ++
> >   arch/arm64/kvm/arm.c              | 8 ++++++++
> >   2 files changed, 10 insertions(+)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 27fe0cd5b2d7..00fe169f239f 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -48,20 +48,22 @@
> >   #define KVM_REQ_VCPU_RESET		KVM_ARCH_REQ(2)
> >   #define KVM_REQ_RECORD_STEAL		KVM_ARCH_REQ(3)
> >   #define KVM_REQ_RELOAD_GICv4		KVM_ARCH_REQ(4)
> >   #define KVM_REQ_RELOAD_PMU		KVM_ARCH_REQ(5)
> >   #define KVM_REQ_SUSPEND			KVM_ARCH_REQ(6)
> >   #define KVM_REQ_RESYNC_PMU_EL0		KVM_ARCH_REQ(7)
> >   #define KVM_REQ_NESTED_S2_UNMAP		KVM_ARCH_REQ(8)
> >   #define KVM_REQ_GUEST_HYP_IRQ_PENDING	KVM_ARCH_REQ(9)
> >   #define KVM_REQ_MAP_L1_VNCR_EL2		KVM_ARCH_REQ(10)
> >   #define KVM_REQ_VGIC_PROCESS_UPDATE	KVM_ARCH_REQ(11)
> > +#define KVM_REQ_RELOAD_STAGE2 \
> > +	KVM_ARCH_REQ_FLAGS(12, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
> >   #define KVM_DIRTY_LOG_MANUAL_CAPS   (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | \
> >   				     KVM_DIRTY_LOG_INITIALLY_SET)
> >   #define KVM_HAVE_MMU_RWLOCK
> >   /*
> >    * Mode of operation configurable with kvm-arm.mode early param.
> >    * See Documentation/admin-guide/kernel-parameters.txt for more information.
> >    */
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 8b080804bc90..1e528d53d093 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -1164,20 +1164,28 @@ static int check_vcpu_requests(struct kvm_vcpu *vcpu)
> >   		if (kvm_check_request(KVM_REQ_RESYNC_PMU_EL0, vcpu))
> >   			kvm_vcpu_pmu_restore_guest(vcpu);
> >   		if (kvm_check_request(KVM_REQ_SUSPEND, vcpu))
> >   			return kvm_vcpu_suspend(vcpu);
> >   		if (kvm_dirty_ring_check_request(vcpu))
> >   			return 0;
> > +		if (kvm_check_request(KVM_REQ_RELOAD_STAGE2, vcpu)) {
> > +			unsigned long flags;
> > +
> > +			local_irq_save(flags);
> > +			__load_stage2(vcpu->arch.hw_mmu);
> > +			local_irq_restore(flags);
> > +		}
> > +
> >   		check_nested_vcpu_requests(vcpu);
> >   	}
> >   	return 1;
> >   }
> >   static bool vcpu_mode_is_bad_32bit(struct kvm_vcpu *vcpu)
> >   {
> >   	if (likely(!vcpu_mode_is_32bit(vcpu)))
> >   		return false;
> Hi Leo,
> 
> Thanks for sending this out. I actually implemented a similar request in
> my v5 HDBSS series to reload VTCR on enable/disable, but I named it
> KVM_REQ_HDBSS_RELOAD_VTCR.
> 
> Without such a request, the new VTCR value only takes effect on the next
> vcpu_load, which means enable/disable could be delayed indefinitely if
> the vCPU never goes through a load/put cycle. So I think this request is
> necessary for HDBSS as well.
> 
> Since your KVM_REQ_RELOAD_STAGE2 is more generic, I'd like to rebase on
> top of your patch and reuse it in v5. Would that work for you? Or do you
> prefer to keep them separate for now?
> 

Hi Tian, 
Thanks for reviewing!

The main reason for this patch series (at least up to patch #3) was to give 
you a base for HDBSS, so please rebase as much as you want on top of it.

Thanks!
Leo

