Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1946CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 10:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHyWKQPrCZkV3pxp2agLQ13h/5umGl/rr3IKwuLgBgY=; b=rIT1UNsDBLUz3xQzCUvBnFYOBf
	xeWvmPC+D19D3btCo/FyF7Ri/Ygsv9tUzrLCjRatWqqeYDzKaW7y5ygQNeHPJQyty8TTCo5Bh/cO7
	p7LmdcmbOgkv6gAzk5qwrBs4S9O45VmSoIHZMEkBnAzvazd6e0g/i4WuDqqKHkTCDO49DrLqHtcHU
	7fUAiZ0EkvfXHIEj2q2u/uyq9QQFClf+WzQ416Pohm3FaEtu+unwmLgDFy378OEXgJUt0tiW75Fdr
	THCSyNW/3QxFBdaSZopK0m2CcxugN2YquTuq7u2VOqXLFO+ARCuqp7hrEFNpdx1j07RorWBvfiVQ7
	x1d0p3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCENM-00000008YhI-1glv;
	Thu, 01 Oct 2026 10:50:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCENH-00000008YgK-3XBA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 10:50:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED7D6497;
	Thu,  1 Oct 2026 03:50:46 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05D7B3F85F;
	Thu,  1 Oct 2026 03:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790851850; bh=JVrOeTdxXGig0DbeyzW4m4jIDq1ilZ1bvTg/w5OMrsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/qAfLAZHct4UPoOg6LrBocfrvBKURODMiArS+zGamTfcjlMA/mpEnGC6brYdwr6V
	 mIrkEpqMXt3kcjIlQrYiQ2m1VUgKTws4JlauIHOfbWmzjCyKm8w/rL1MJ4nve/RR/f
	 Q2U+pjuMYwFnVqZyx5V87W2K4gSUFNKRc6Y5JRJA=
Date: Thu, 1 Oct 2026 11:50:44 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v21 2/9] firmware: arm_rmm: Check for RMI support at init
Message-ID: <ar47BLk-l4-4VyVl@arm.com>
References: <20261001084555.1456543-1-suzuki.poulose@arm.com>
 <20261001084555.1456543-3-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001084555.1456543-3-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_035051_991753_1A567BD4 
X-CRM114-Status: GOOD (  15.93  )
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

On Thu, Oct 01, 2026 at 09:45:48AM +0100, Suzuki K Poulose wrote:
> +#define RMM_BLOCKED_RETRY_COUNT		2
> +/*
> + * rmi_smccc_invoke: Invoke the RMI call and return the results, retrying the
> + * command when status is RMI_BUSY. If we encounter RMI_BLOCKED, we retry
> + * it one more time before we give up. The caller is supposed to handle the
> + * result and reissue if required.
> + *
> + * We don't expect to see RMI_BLOCKED on a practical system, except when
> + * there are parallel requests that results in long standing operation,
> + * with one blocking the other.
> + *
> + * @regs: Input parameters filled in. Updated with the ouptput results
> + * after the call.
> + */
> +static inline void rmi_smccc_invoke(struct arm_smccc_1_2_regs *regs)
> +{
> +	struct arm_smccc_1_2_regs args = *regs;
> +	long status;
> +	int i = 0;
> +
> +	while (i < RMM_BLOCKED_RETRY_COUNT) {
> +		arm_smccc_1_2_invoke(&args, regs);
> +
> +		status = RMI_RESULT_STATUS(regs->a0);
> +		if (status != RMI_BUSY && status != RMI_BLOCKED)
> +			break;
> +		if (status == RMI_BLOCKED)
> +			i++;
> +		cpu_relax();
> +	}
> +}

With changes around RMI_BUSY to return early in patch 8, I think this is
fine for a brief lock-style retry.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

