Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097FCC44506
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 18:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ynpg/cJ+vd3nqyV8BLe/SIqtaIrKy7cylnYrcUttxQg=; b=Z4Kb4Ectj9XgvpEse9MjIyTH53
	8FLnHQ8wAkp7ikEyHFhpAz1VypJ1zdfBexbs2z3HfBBMam0b+4+NzBTZKOjasA981gZxrVBw+7kFR
	t+tdBhI+Fqu6n29YoF02KZHsTfOJ3AcyQ99MClpPPfH5JaMC5D83ZntLYGxAw2rBao6iaTG2HmCmz
	H7nNuaihl1p5jV+54SQbLgGmScD22eC4Q3vwUyGte2m/h0knnZN3MXU7XlPxcujd7hI4+L7Z1g3+v
	yybisVOHaprq7E4ABRU4/0lAiUeSqXU4hAxv9kLV2aYd83cGkCcd2rSkv0xq7oiaaVMGrtw9C4+Sw
	CAFBqrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viciO-00000005uT5-1cVB;
	Wed, 21 Jan 2026 18:14:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viciL-00000005uSh-2ZJM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 18:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769019236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ynpg/cJ+vd3nqyV8BLe/SIqtaIrKy7cylnYrcUttxQg=;
	b=AB1YxHnihS+6P3zQQaO2zOtQY+jgEbeFhGjegrf6fvMtcEzfinB8fgXPzoTw+zAOWqIHtS
	K9cFs7Xrr1SWAUKMNK0xWQx1LVRUG/KCdd+QU7Gvtq8edYaRojrVjr428QyIwyPp0jIlw5
	BnmLfh64LsK9NAcFQaSf95/EBTl3rX0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-n0ZJbGzGNlufjgljWqAxOg-1; Wed, 21 Jan 2026 13:13:52 -0500
X-MC-Unique: n0ZJbGzGNlufjgljWqAxOg-1
X-Mimecast-MFC-AGG-ID: n0ZJbGzGNlufjgljWqAxOg_1769019231
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4358fe2e7e1so77908f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 10:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769019231; x=1769624031;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ynpg/cJ+vd3nqyV8BLe/SIqtaIrKy7cylnYrcUttxQg=;
        b=fc01HeelUPZ4SHoiM4NVvQlUnN9dGHKwjJimoY23kbgikWy0bbRsv4p52pMMMc2fgk
         udVOQuZOSmA2KUyoRR+bBSokytgPPOXHHU8gKQ+KNTzHLHRtkbc6j43B7JjgdWRgbRJE
         TG8Gdge19OFlKHIms7B8BzLmKo9YuFT/qX5MNpxOWyRbNPch/QPFamgxkGTFKt9ZWRPM
         05V5xedImIcvwHN7krzeeHwYOQQWeK/DJTpjb98SqbcW/bHIMsRgWX2DVVwrRd8kRcFM
         SWcSPQJCmNiuoPcJbc6dD9Rtx2rJzsabARHSxhSlUVa3rat+NbDEY+dSrSkJtlbwV9jH
         3Bfg==
X-Forwarded-Encrypted: i=1; AJvYcCXU3LBkySRhAI8uznKrQvYHtRa3v8t2npOohv8vNgO3thV/3mq8ep6XhWllEPBTlIikCavst9XACvlYH1Iy2CoO@lists.infradead.org
X-Gm-Message-State: AOJu0YxeZ/3/DYVxIQfg8sp+lVoCtEcB238jE3dtIIXrPhO/FR9Fe5Oh
	nu543WFkHtku3SoSE/HxK4X+k4AzyiZ78612KO9bJuZCy0UL7b2h696b0IVNUdAzo5+ofVHDOKG
	OvQmf5GM+66Z3T2oTPB6OdZ0nQ25trPlEhAPPNUGEm4tzvjFAKWmgL3trzz4yLOuXd+A/yexKmn
	bJ
X-Gm-Gg: AZuq6aIkUGGmCq+A63ylsla1FUOV9frSsrQDd2/KOs9tQVsJuYHMNovHxIUrtRKumMq
	sI13/fge4+gETUSlJcpTwLtjfzwgO4RYfuRA/XfVDY7cHTE6GdD6MSnOlB5+Bhf1+105jt3Ynke
	Cw5Tc0fEKDC1URiqvcne3eizG1HO1F6a+cp/bxiK3rpFiiDwK+fh5y5LpNxJPFTESuTIE4neci0
	LBOySEHRjO6UQDb0IT4jOYJDPGAm6TVTOs94TvILkprSwSkjx/uSdx9hlRxaVcAbNdKR3KN/ya7
	6vcUols2oXmlL7GL0B//jqW6F2YTCXpk4hCd59drsMDDHt5RslOqBRIqhmgiIu7UmtcvDMH3pDW
	F9ufWinrik5TAZu4ZyvqHsDUPPpYRaRKna8RDoFZQIprvUnNDltB89U4d1sU07vcC8oPuInAr/P
	c6yF1puDDe8xFX6A==
X-Received: by 2002:a5d:4688:0:b0:435:95c9:6891 with SMTP id ffacd0b85a97d-43595c96bcamr7351158f8f.42.1769019231268;
        Wed, 21 Jan 2026 10:13:51 -0800 (PST)
X-Received: by 2002:a5d:4688:0:b0:435:95c9:6891 with SMTP id ffacd0b85a97d-43595c96bcamr7351114f8f.42.1769019230831;
        Wed, 21 Jan 2026 10:13:50 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43569921da2sm38550536f8f.1.2026.01.21.10.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 10:13:49 -0800 (PST)
Message-ID: <5bea843b-dec8-4f15-bb7c-1d0550542034@redhat.com>
Date: Wed, 21 Jan 2026 19:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: possible deadlock due to irq_set_thread_affinity() calling into
 the scheduler (was Re: [PATCH v3 38/62] KVM: SVM: Take and hold ir_list_lock
 across IRTE updates in IOMMU)
To: Thomas Gleixner <tglx@kernel.org>, Ankit Soni <Ankit.Soni@amd.com>,
 Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Francesco Lavra <francescolavra.fl@gmail.com>,
 David Matlack <dmatlack@google.com>, Naveen Rao <Naveen.Rao@amd.com>,
 Crystal Wood <crwood@redhat.com>
References: <20250611224604.313496-2-seanjc@google.com>
 <20250611224604.313496-40-seanjc@google.com>
 <njhjud3e6wbdftzr3ziyuh5bhyvc5ndt5qvmg7rlvh5isoop2l@f2uxctws2c7d>
 <42513cb3-3c2e-4aa8-b748-23b6656a5096@redhat.com> <874iovu742.ffs@tglx>
 <87pl7jsrdg.ffs@tglx>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87pl7jsrdg.ffs@tglx>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AWApxEUGRojrK3_rwmDkHtV9V_lTVqoQ29_Yq1JEjTs_1769019231
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_101357_724636_B815FE6B 
X-CRM114-Status: GOOD (  18.97  )
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

Sorry, not sure how the previous email ended up encrypted.

On 1/8/26 22:53, Thomas Gleixner wrote:
> On Thu, Jan 08 2026 at 22:28, Thomas Gleixner wrote:
>> On Mon, Dec 22 2025 at 15:09, Paolo Bonzini wrote:
>>> Of the three, the most sketchy is (a); notably, __setup_irq() calls
>>> wake_up_process outside desc->lock.  Therefore I'd like so much to treat
>>> it as a kernel/irq/ bug; and the simplest (perhaps too simple...) fix is
>>
>> It's not more sketchy than VIRT assuming that it can do what it wants
>> under rq->lock. 🙂
>
> And just for the record, that's not the only place in the irq core which
> has that lock chain.
>
> irq_set_affinity_locked()       // invoked with desc::lock held
>     if (desc->affinity_notify)
>        schedule_work()           // Ends up taking rq::lock
>
> and that's the case since cd7eab44e994 ("genirq: Add IRQ affinity
> notifiers"), which was added 15 years ago.
>
> Are you still claiming that this is a kernel/irq bug?

Not really, I did say I'd like to treat it as a kernel/irq bug...
but certainly didn't have hopes high enough to "claim" that.
I do think that it's ugly to have locks that are internal,
non-leaf and held around callbacks; but people smarter than
me have thought about it and you can't call it a bug anyway.

For x86/AMD we have a way to fix it, so that part is not a problem.

For the call(*) to irq_set_affinity() in arch/arm64/kvm/'s
vgic_v4_load() I think it can be solved as well.
kvm_make_request(KVM_REQ_RELOAD_GICv4) will delay vgic_v4_load()
to a safe spot, so just cache the previous smp_processor_id() and,
if it is different, do the kvm_make_request() and return instead
of calling irq_set_affinity().

vgic_v3_load() is the only place that calls it from the preempt
notifier, so this behavior can be tied to a "bool delay_set_affinity"
argument to vgic_v4_load() or placed in a different function.

Marc/Oliver, does that sound doable?

Paolo

(*) kvm_sched_in() preempt notifier -> kvm_arch_vcpu_load() ->
     kvm_vgic_load() -> vgic_v3_load() -> vgic_v4_load()


