Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDDAD59F50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 22:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Gf9nzt/AIijA0v6SQzCygaqS4FyyvskIif7ML2SRzkU=; b=JWpHPEwkQFkr6g
	VTKC9mRwA46AUWjnFiXQJUQQ1G3WkW97fmUwNtLgYkgvB9IU2Wo9SrsLsQzFZtz8UAslIIzjaowEI
	U/Qxz3fcaowdnct3d0FhTybCFNeKELJ0/Nu0VG5T+mbLSoZ219qyd3WuotqwtJa4NsryyEfICMV1E
	1fO7bGPDiSYPv2PpQM446nisPT2i78h4RnFPE/KEoE4CZFiewGmgIN3MO1UYJjRocguDV/Qom82OY
	LG3sx/kg7ygbOrC/8UIfvuBZAzPjkccl5QHX0AYcvLTSh/kE1RGaDki/g5Qy71s+AHLblos6PlwSi
	pm+Lwhlp8riewOAklPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUC2b-00000001BvH-0Cv2;
	Fri, 12 Dec 2025 22:55:13 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUC2Y-00000001Bup-0bXO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 22:55:11 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7c6ce3b9fa0so1871297a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 14:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765580107; x=1766184907; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gf9nzt/AIijA0v6SQzCygaqS4FyyvskIif7ML2SRzkU=;
        b=HwFlTN4FNrq30G0l2Cm2npOeFiizHtz71TuHfXiZqDmIY62jUR6Z7+kRaItHS9hPLC
         VP+R56FRdZ0LVkOUIn95Te5DS4vXxleuCyIwkUNQSewn5mKO+D9lD/6lNqoFcnmaRWQ0
         i4/gIANcwzLoRspcxY8aAifKAVqKIrX2BD6EzEikoTPinlqqQZoOoY/8osVl7NU1NZAO
         y9o2umQN8cy5S0V/Ofq+aPypzRrk2Ernexa/zbuqFf16qw+9OopZhgAUF/9UDCZWfvim
         f2DDIl2mH7V5w/yP4gIbI0Dl/WrwtWZ+nCtTdGwLAsOiE0SBUmU6bfkKaR84dSwSOsas
         HGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765580107; x=1766184907;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf9nzt/AIijA0v6SQzCygaqS4FyyvskIif7ML2SRzkU=;
        b=YWRR7BVKHjOS50xMigJaBr4EGJmOSTHcJXBYfnBiaCHQL4J6DczXLIzv6amt2uf87a
         UczQPYP730jwuy1+6Z6SwPpGYXQPo6vP2KiDftYiByEkm12NJ4Rgn6D8krNNz26PCDaC
         Xro6eV2YC+1K6xpd+A49Nju3h1T6L15EfVZZhMTT9wGxS3D9Mb3cbNJMJzpz50umJ/NX
         qoQoqkBBu7pNhf0qUxPKdp1TwSrJv0qPdfPCyKIz+odMjOoObQMU/rjy0SaLLtQ7tbAk
         QVOvxI1RhwJSzkS6o4LniqROp7KNyqgR1OURCQhVpLYrVN33qPl7dXlbyOd3nMLRdT4S
         ozXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+qZNJJC/qgP8jP3+uxy1PUpDJIoY+w/8gIomtvHxUHKycdMjqiIBiDaSQxpNkLleOwiDm7fLwQRU7Co4GxQEJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp7co/AzkZhfHiYJ2NApgZIbAbzkhum1ZhFQm6tNZdgoxi74EP
	SQyLSXYAoIf/Rrq8wAOL1r1a+h2o158qWOGpCeukRguSb9IRZzzUInTN/vY7iH7toho4VTQFFmr
	6yOTl8HdTaVI4D0C2JXEVA7Hdbw==
X-Google-Smtp-Source: AGHT+IGW0I1EN/TmF7XRt1Ne1xEDcpx6Or2Kw9UCPmMzkWNCsmyBQjelpeiy18twJajc3tFWP5QaNlfD3CTKO6VqfQ==
X-Received: from ilbbd1.prod.google.com ([2002:a05:6e02:3001:b0:438:1345:e9c3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:162a:b0:65b:25e8:13f1 with SMTP id 006d021491bc7-65b4529af0dmr1939098eaf.73.1765580107018;
 Fri, 12 Dec 2025 14:55:07 -0800 (PST)
Date: Fri, 12 Dec 2025 22:55:06 +0000
In-Reply-To: <aTioEWHu0ZbFCjR6@kernel.org> (message from Oliver Upton on Tue,
 9 Dec 2025 14:52:01 -0800)
Mime-Version: 1.0
Message-ID: <gsnt8qf72tv9.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 21/24] KVM: arm64: Inject recorded guest interrupts
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_145510_187106_48C5184C 
X-CRM114-Status: GOOD (  14.87  )
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

Oliver Upton <oupton@kernel.org> writes:

> In no situation should KVM be injecting a "recorded" IRQ. The overflow
> condition of the PMU is well defined in the architecture and we should
> implement *exactly* that.

When I say "record" I just meant "updating the virtual overflow register
to reflect an overflow".

Do you think I'm not implementing the condition correctly in
kvm_pmu_part_overflow_status()?

> On Tue, Dec 09, 2025 at 08:51:18PM +0000, Colton Lewis wrote:
>> +/**
>> + * kvm_pmu_part_overflow_status() - Determine if any guest counters  
>> have overflowed
>> + * @vcpu: Ponter to struct kvm_vcpu
>> + *
>> + * Determine if any guest counters have overflowed and therefore an
>> + * IRQ needs to be injected into the guest.
>> + *
>> + * Return: True if there was an overflow, false otherwise
>> + */
>> +bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu)
>> +{
>> +	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
>> +	u64 mask = kvm_pmu_guest_counter_mask(pmu);
>> +	u64 pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
>> +	u64 pmint = read_pmintenset();
>> +	u64 pmcr = read_pmcr();

> How do we know that the vPMU has been loaded on the CPU at this point?

Because this is only called by kvm_pmu_update_state which is only called
by kvm_pmu_update_state <- kvm_pmu_{flush,sync}_hwstate <-
kvm_arch_vcpu_ioctl_run after a vcpu_load.

>> +
>> +	return (pmcr & ARMV8_PMU_PMCR_E) && (mask & pmovs & pmint);
>> +}

> I'd rather reuse kvm_pmu_overflow_status(), relying on the accessors to
> abstract away the implementation / location of the guest PMU context.

Agreed on making some generic accessors.

> Thanks,
> Oliver

