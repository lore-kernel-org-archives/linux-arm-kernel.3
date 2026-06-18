Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7495CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 23:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cwWYCnxdR0CMlBSotsz1RrmN4O2SDrdrRioZC+xeVso=; b=qdoB0YO3Eq4zuJ
	KG4h4ejh73EvkjZQMob2GfLDMRY//ARCDGS+eArj6tyQvJKHKQfCqr3Gs7oly2kdQfhklUtxRqSLS
	/YBU0K1UDUn3xPM8Fw2+aXT1hDjyI2BIxitpDsC4CWRNsw+rUCFbTTSS1rl9L/7v2SS2OtNO3KCLG
	a8m/KSCVhI6QCuv3ceHdVh+O/Sa5wrN0SDLD7mPuGWDVyH/2PlVtTpvOrzamrd1QZCApwP0ajJHeS
	WfPp+wYlM5JnYQXK2kBJ7Zyhlghw8RGbSeLElnlMFyYHlNs89dyA4AIqgboGzAqVTQD19VgW8Kwpy
	pFb3SR/AHcinqU9FbMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waMDs-00000001rmH-0GhN;
	Thu, 18 Jun 2026 23:32:36 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waMDp-00000001rlu-2DZZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 23:32:34 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-486e64c8edeso2083956b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 16:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781825552; x=1782430352; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cwWYCnxdR0CMlBSotsz1RrmN4O2SDrdrRioZC+xeVso=;
        b=sDTP56DWgQpt8eKBDPYPy8G7saIuYYdfwfw8H4+DZKeDZm08sGBzU/C0keP/LuzFvn
         TciR8cwtl6gIF7D5feoXW2vrw+hCdOfBQxV4HRx1i3fYmb7Wwp78qAmYWyJ77l3fH2Ch
         XjmJtyzHWkQ8mJLvE0H1ZgsorXDnTH+WzjetPdHP+pnDGq2QKJpcU+hEXz+alQSAgZ3T
         pj/KDgobbb1JuYpqiKEO6tBJfAvoL2XK2PBHsvPk0hogmVkI9OL1oxqCojcL6OXz1wy5
         JOoSYoLDOQm0eOUEUpo3YRNAyWUcfTUuJo7Yj1bo7ZNkAlMZKRKGoLOYikqkopYg39Br
         87/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781825552; x=1782430352;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwWYCnxdR0CMlBSotsz1RrmN4O2SDrdrRioZC+xeVso=;
        b=sngT6iLJZOcDcW15zPXPLtSgoqYb75gRCqhhsy37EyCm/R+LRztTX5gNEkQ5KN5//U
         UbIKwAttra9WzNz/o1kxKnkn24a33N3kpXLGWp5WYVX7c7So5blzw6fTh6owQIppFUBT
         ia9DOOCmXGWCe15zcY8XTXxA7ivuBB3qH1JuyeHbZUduw7J4h+eN55TB/xgLwYSo20Pv
         CfnNobMdAXsi/IxDshLZycUYfPqZiEAsDMrH865tqV17BzfaA6Ug8uC0fkQ7jeEADXR1
         BfGKNi5nSJj8WSYad/oJW/6eGOh1z2U12mrtAGNt/zUXg/3iama/7k79c1oK5vrhZPGg
         GIug==
X-Forwarded-Encrypted: i=1; AFNElJ/CL0NEh7S0ZHeM5OYYUoQuJQXPiv39uTQC9UwobFhVZzcaQHb/YYOS6Cf4l/E2Eu0miutiCFVMepxmwil8Dfbg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0gHoxu/kLuX3YhHWLsMd5kzcRQbW5a70IzQytcTw8vN1cYrox
	qGWb2W0x68g1hafvb6bXQaHtrum8cJ28Y3Pn2utjbq7w5qMxsEoVyeZUP27YZvsnyWerjx5sR4a
	b6tU2teyZ5g17c3AOcVHgVub47g==
X-Received: from ilbdv1-n1.prod.google.com ([2002:a05:6e02:4001:10b0:502:e73:d02b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1808:b0:46c:e542:cc25 with SMTP id 5614622812f47-489aeaa5634mr180520b6e.9.1781825551504;
 Thu, 18 Jun 2026 16:32:31 -0700 (PDT)
Date: Thu, 18 Jun 2026 23:32:30 +0000
In-Reply-To: <6dca2d6e-54d0-42c4-95df-45a30a473e0b@huawei.com> (message from
 wuyifan on Thu, 18 Jun 2026 09:53:15 +0800)
Mime-Version: 1.0
Message-ID: <gsntse6jctm9.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 15/20] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
From: Colton Lewis <coltonlewis@google.com>
To: wuyifan <wuyifan50@huawei.com>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	james.clark@linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, wangyushan12@huawei.com, 
	wangzhou1@hisilicon.com, xuwei5@huawei.com, prime.zeng@hisilicon.com, 
	fanghao11@huawei.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_163233_592256_D50F5540 
X-CRM114-Status: GOOD (  11.00  )
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

wuyifan <wuyifan50@huawei.com> writes:

> Hi Colton,

> On 5/5/2026 5:18 AM, Colton Lewis wrote:
>>    static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
>>    {
>> -	u64 pmovsr;
>>    	struct perf_sample_data data;
>>    	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
>>    	struct pt_regs *regs;
>> +	u64 host_set = kvm_pmu_host_counter_mask(cpu_pmu);
>> +	u64 pmovsr;
> kvm_pmu_host_counter_mask() is called from armv8pmu_handle_irq(). This
> interrupt fires in both host and guest contexts.

> However, kvm_pmu_host_counter_mask() dereferences
> host_data_ptr(nr_event_counters). This indirection requires
> kvm_arm_hyp_percpu_base[cpu] to be initialized, which only happens during
> KVM hypervisor setup. When the interrupt fires in a guest kernel where
> KVM is
> compiled but not active, the per-CPU base is NULL and the dereference
> faults.

I will fix that.


> Thanks,
> Yifan

