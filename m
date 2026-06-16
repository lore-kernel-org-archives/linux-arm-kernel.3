Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829B1CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 09:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sU3QkWiFrN4SZorLI8GgUb3+KhkdTqA+waJhyvDUrRY=; b=JwsILJe0T3IfDJsCaLw4/be7HQ
	6KmkoRGbhfJFez3rB/stx+hezWujY+L5v0fYUYsGfqSmfExSpbO7I/o9J6lGDPdIAunJaS8IXadZs
	EgJe6CYL7QRZMUF6+OQm5h7RxseY/Tr9OHPEfVlmd0IvB7l+2qfUyp2mgeCv9Q0FsGLB5k5jIZEPi
	u5tN5BLbqKbuVe3oJKktLc82sSAZewomcDX6sVj5GNVyaQO5L0gHwG7GsfCbzgGRocgzqIhIIDGM0
	EkgZQwfaY8T0A4xdVwLnUpyi2Pt3Kvjyu6mXxYDhAInE0G6awgi914qV2vjxHRWAsp31MgrS1diDY
	LthNt7Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZPmC-0000000FV9i-0KR6;
	Tue, 16 Jun 2026 09:08:08 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZPm9-0000000FV8q-05Qj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 09:08:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sU3QkWiFrN4SZorLI8GgUb3+KhkdTqA+waJhyvDUrRY=;
	b=ptQ3lVuPq4HoFoxQoiDf81+5iqfP5Xi9RbH0Mjcou6X98sDc9Nc6dVXQKiJQlcbUwpkUzFi8+
	vowuf4jlqCC/8z8m/3YdsDMiWEFdTSsI9S5uau1II6Obp9meNJfyS9gpltVfJ2rPdgG9HOzvZIq
	VXJXF4bKX8ns5TqH2ovoIjY=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gfgt10GB9z1K9D8;
	Tue, 16 Jun 2026 16:59:53 +0800 (CST)
Received: from kwepemo100012.china.huawei.com (unknown [7.202.195.139])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B03A405D2;
	Tue, 16 Jun 2026 17:07:49 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemo100012.china.huawei.com (7.202.195.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 16 Jun 2026 17:07:48 +0800
Message-ID: <df30b9e0-6938-47f5-bb5d-5b1e67c8879c@huawei.com>
Date: Tue, 16 Jun 2026 17:07:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/20] KVM: arm64: Enforce PMU event filter at
 vcpu_load()
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
	<linux-kselftest@vger.kernel.org>, wangyushan <wangyushan12@huawei.com>,
	<fanghao11@huawei.com>, Zhou Wang <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>
References: <20260504211813.1804997-1-coltonlewis@google.com>
 <20260504211813.1804997-12-coltonlewis@google.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <20260504211813.1804997-12-coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemo100012.china.huawei.com (7.202.195.139)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_020805_546474_27FCC3A4 
X-CRM114-Status: UNSURE (   8.53  )
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
> +	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
> +		if (i == ARMV8_PMU_CYCLE_IDX) {
> +			val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
> +			evsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
> +		} else {
> +			val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
> +			evsel = val & kvm_pmu_event_mask(vcpu->kvm);
> +		}
> +
> +		guest_include_el2 = (val & ARMV8_PMU_INCLUDE_EL2);
> +		val &= ~evtyper_clr;
> +
> +		if (unlikely(is_hyp_ctxt(vcpu)) && guest_include_el2)
> +			val &= ~ARMV8_PMU_EXCLUDE_EL1;
> +
> +		if (vcpu->kvm->arch.pmu_filter &&
> +		    !test_bit(evsel, vcpu->kvm->arch.pmu_filter))
> +			val |= evtyper_set;
> +
> +		if (i == ARMV8_PMU_CYCLE_IDX) {
> +			write_sysreg(val, pmccntr_el0);
This should be pmccfiltr_el0.
Writing the filter bits to pmccntr_el0 would corrupt the cycle count value.
> +		} else {
> +			write_sysreg(i, pmselr_el0);
> +			write_sysreg(val, pmxevtyper_el0);
> +		}
> +	}
> +}
Thanks,
Yifan

