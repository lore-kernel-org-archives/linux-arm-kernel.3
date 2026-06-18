Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABDBCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 01:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baDTuvvK2rnBrTQYWqm7ATQZOTdxwB6p+v1mQB0ln0U=; b=EMkXJAu3s1uS6h2fenjFmDOur5
	dw9Kf3suvxoN21NR8G6rMfNk5tfdi2bjzGBc/KDdGQXxwuwZV4d7rFSCOTaq1t3hrt5ZSfr18skDU
	+RUuzqy5K0CevpebmkdLueUctizsuhrI2x4nZjrE1bCC7DpnIwsjd93pE1ktGhi7eUunLKjoxApEW
	SX8e7OlaOa2xlgCvEpBHUs+gIh5BQUfSRXjQEEFLJg/RtyC8j73tXtSgWQH3eb+tyKAiwtNm8yZHN
	Bu+hVen7KXSlfV8rkHTF6i/bY94A4vhPXyKTSkoz4O2gWVF4NKyKi7sEey/25Rxva6+G8TS4Fd3NI
	qi6fS0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1wn-00000000VD8-2R6i;
	Thu, 18 Jun 2026 01:53:37 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1wk-00000000V9v-1yPi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 01:53:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=baDTuvvK2rnBrTQYWqm7ATQZOTdxwB6p+v1mQB0ln0U=;
	b=ovFV3JzhO8N/0lbfun2Dcbo+s3uduzoqK6QFiVNFlaRGSRIEv7jpAN6XoJ/16TPzR05Bm0y3K
	q0Q304PdA32b4ir8vfHLLV/ktI355N4ho4ZwfONYG/0uu4IaRlj7h7Kg7ymGFOpS9QcGSyGrSLy
	tIfTWIw3ciHOxrbyGqYCBH8=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4ggk7d4TTKzRhRL;
	Thu, 18 Jun 2026 09:45:17 +0800 (CST)
Received: from kwepemo100012.china.huawei.com (unknown [7.202.195.139])
	by mail.maildlp.com (Postfix) with ESMTPS id 5E8B340538;
	Thu, 18 Jun 2026 09:53:16 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemo100012.china.huawei.com (7.202.195.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 18 Jun 2026 09:53:15 +0800
Message-ID: <6dca2d6e-54d0-42c4-95df-45a30a473e0b@huawei.com>
Date: Thu, 18 Jun 2026 09:53:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/20] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
To: Colton Lewis <coltonlewis@google.com>, <kvm@vger.kernel.org>
CC: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Russell King
	<linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
	<oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, Joey Gouly
	<joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
	<yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, Shuah Khan
	<shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	James Clark <james.clark@linaro.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-perf-users@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, wangyushan <wangyushan12@huawei.com>, Zhou
 Wang <wangzhou1@hisilicon.com>, <xuwei5@huawei.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>
References: <20260504211813.1804997-1-coltonlewis@google.com>
 <20260504211813.1804997-16-coltonlewis@google.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <20260504211813.1804997-16-coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemo100012.china.huawei.com (7.202.195.139)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_185334_970292_779B0A12 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
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

Hi Colton,

On 5/5/2026 5:18 AM, Colton Lewis wrote:
>   static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
>   {
> -	u64 pmovsr;
>   	struct perf_sample_data data;
>   	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
>   	struct pt_regs *regs;
> +	u64 host_set = kvm_pmu_host_counter_mask(cpu_pmu);
> +	u64 pmovsr;
kvm_pmu_host_counter_mask() is called from armv8pmu_handle_irq(). This
interrupt fires in both host and guest contexts.

However, kvm_pmu_host_counter_mask() dereferences
host_data_ptr(nr_event_counters). This indirection requires
kvm_arm_hyp_percpu_base[cpu] to be initialized, which only happens during
KVM hypervisor setup. When the interrupt fires in a guest kernel where 
KVM is
compiled but not active, the per-CPU base is NULL and the dereference 
faults.

Thanks,
Yifan


