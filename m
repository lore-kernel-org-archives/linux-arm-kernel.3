Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66737D1D48A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Are9ibJ1bKI6VUEY6W6lemS2RR1hyk8HctqapqrBM6Y=; b=U1iFqJZHV7ai2wYhSpR6mC6h5E
	7ihsXTHtO1V/yniWeiO7zLKiMIqHRQQN2j+yt9o9aLvL8RknY4915ifvZqsixnT2EvE8D1nG7Jrvq
	Zkk4WPEQHxpHWKvv1Xa83aGzdhi4owul3r523erNg3jX490rcXV9bhuwhFvOrZRF5wxp6Jebs9mAB
	vMpxpFzHY95a/eD7H3nNbispRcciMxI/AvC9IAw+GEceBskvG1hpt5dp0MeLZindR54/07V/oarum
	8W0+Ukc2hNf4GGxUvLiZ1Fmx3AI7EKagazNHbMnKHatcXTOZj26rCI8t/8+RXEER1V5dCFB+0U4/M
	qk6m2qLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxYb-00000000uaQ-33UN;
	Thu, 08 Jan 2026 21:28:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxYZ-00000000uZy-1VQj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D23742E58;
	Thu,  8 Jan 2026 21:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A44C116C6;
	Thu,  8 Jan 2026 21:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767907714;
	bh=867MVYqB2USbUxXWc7YOR69zdzsNdxKNzvzgaETZw/w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SBX+Q4vpB64LFyZQjZGly1tVIEl03H0JgAaNlYBQaa0c9BdbyQ/CyixCVBdwCz8f1
	 KvDstoz4Jktk1JC+O/y6FNcawe6dhtMc10QmQ74oyDFWlU72V+4YiR0io7xlB8DkCk
	 82XA1nOe20ZyQy33ENE8D+o5Gir8YHC2CtmV0W5cezQRBNTpXXpkygykA8UPLJq+5Q
	 j6pJItlh9JXcxMsckAyecdB/Rjvf3w0JsEz1IJxe78+HOaI5zks1BtsGsRy8favUJ2
	 4DscJy2HxDmgWI5xYN2ExenjDL0aEQhItiX0aZmqnwqfJko5QhY5JRRjCnuM/jo4zE
	 HSpJ68xUaDprw==
From: Thomas Gleixner <tglx@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Ankit Soni <Ankit.Soni@amd.com>,
 Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu
 <baolu.lu@linux.intel.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Sairaj Kodilkar <sarunkod@amd.com>, Vasant
 Hegde <vasant.hegde@amd.com>, Maxim Levitsky <mlevitsk@redhat.com>, Joao
 Martins <joao.m.martins@oracle.com>, Francesco Lavra
 <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>, Naveen
 Rao <Naveen.Rao@amd.com>, Crystal Wood <crwood@redhat.com>
Subject: Re: possible deadlock due to irq_set_thread_affinity() calling into
 the scheduler (was Re: [PATCH v3 38/62] KVM: SVM: Take and hold
 ir_list_lock across IRTE updates in IOMMU)
In-Reply-To: <42513cb3-3c2e-4aa8-b748-23b6656a5096@redhat.com>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-40-seanjc@google.com>
 <njhjud3e6wbdftzr3ziyuh5bhyvc5ndt5qvmg7rlvh5isoop2l@f2uxctws2c7d>
 <42513cb3-3c2e-4aa8-b748-23b6656a5096@redhat.com>
Date: Thu, 08 Jan 2026 22:28:29 +0100
Message-ID: <874iovu742.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_132835_459676_C790731F 
X-CRM114-Status: GOOD (  18.40  )
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

On Mon, Dec 22 2025 at 15:09, Paolo Bonzini wrote:
> On 12/22/25 10:16, Ankit Soni wrote:
>>    ======================================================
>>    WARNING: possible circular locking dependency detected
>>    6.19.0-rc2 #20 Tainted: G            E
>>    ------------------------------------------------------
>>    CPU 58/KVM/28597 is trying to acquire lock:
>>      ff12c47d4b1f34c0 (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x58/0xa0
>> 
>>      but task is already holding lock:
>>      ff12c49b28552110 (&svm->ir_list_lock){....}-{2:2}, at: avic_pi_update_irte+0x147/0x270 [kvm_amd]
>> 
>>      which lock already depends on the new lock.
>> 
>>    Chain exists of:
>>      &irq_desc_lock_class --> &rq->__lock --> &svm->ir_list_lock
>> 
>>    Possible unsafe locking scenario:
>> 
>>          CPU0                            CPU1
>>          ----                            ----
>>     lock(&svm->ir_list_lock);
>>                                        lock(&rq->__lock);
>>                                        lock(&svm->ir_list_lock);
>>     lock(&irq_desc_lock_class);
>> 
>>          *** DEADLOCK ***
>> 
>> So lockdep sees:
>> 
>>    &irq_desc_lock_class -> &rq->__lock -> &svm->ir_list_lock
>> 
>> while avic_pi_update_irte() currently holds svm->ir_list_lock and then
>> takes irq_desc_lock via irq_set_vcpu_affinity(), which creates the
>> potential inversion.
>> 
>>    - Is this lockdep warning expected/benign in this code path, or does it
>>      indicate a real potential deadlock between svm->ir_list_lock and
>>      irq_desc_lock with AVIC + irq_bypass + VFIO?
>
> I'd treat it as a potential (if unlikely) deadlock:
>
> (a) irq_set_thread_affinity triggers the scheduler via wake_up_process,
> while irq_desc->lock is taken
>
> (b) the scheduler calls into KVM with rq_lock taken, and KVM uses
> ir_list_lock within __avic_vcpu_load/__avic_vcpu_put
>
> (c) KVM wants to block scheduling for a while and uses ir_list_lock for
> that purpose, but then takes irq_set_vcpu_affinity takes irq_desc->lock.
>
> I don't think there's an alternative choice of lock for (c); and there's
> no easy way to pull the irq_desc->lock out of the IRQ subsystem--in fact

Don't even think about that.

> the stickiness of the situation comes from rq->rq_lock and
> irq_desc->lock being both internal and not leaf.
>
> Of the three, the most sketchy is (a); notably, __setup_irq() calls
> wake_up_process outside desc->lock.  Therefore I'd like so much to treat
> it as a kernel/irq/ bug; and the simplest (perhaps too simple...) fix is

It's not more sketchy than VIRT assuming that it can do what it wants
under rq->lock. :)

> to drop the wake_up_process().  The only cost is extra latency on the
> next interrupt after an affinity change.

The real problematic cost is that in an isolation scenario the wakeup
happens at the next interrupt which might be far into the isolated
phase. That's why the wakeup is there. See:

  c99303a2d2a2 ("genirq: Wake interrupt threads immediately when changing affinity")

Obviously you did not even bother to look that up otherwise you would
have CC'ed Crystal and asked her to take a look...

Thanks,

        tglx






