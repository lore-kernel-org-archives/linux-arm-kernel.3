Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E00DC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpwOv/cepXT3RefFuBTSySygmeLv9K9KMJCvS02cJlo=; b=FwyX9teeTBk1NCwald4bvgkEnY
	5kFm1P/Ubpyz70tRTInHO3AaYixy5EtgaELvFcrP+Mc6FF8L3FPK63cSNra4Fw4hQQhBjhYjvdPYJ
	iEUkgHWBxFHGW/9NEQUuIiZivrpsD4X9Sw6Qnv5+8jkfK11hHboJ0MbNVkQs6yVF9aIsrWwGG0cpO
	jvw/muPAHdyLSbVfcAkKf754tkozyZ4xJg77BHgaqJGRTKarVlA+qEcKiwCvWuUmUrgpRDD5Frvqj
	QCD7Yd1Zg+tiCw8D2Tnql/d0I0pVgQDqBan1Cr/+GIMdsqIu+QGCwnXsJNPairzQjsPShQWwk4Cij
	j/yu+/jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI3m-00000007iGZ-0JlH;
	Fri, 07 Aug 2026 10:44:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI3j-00000007iFc-1cGe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:44:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C855B1516;
	Fri,  7 Aug 2026 03:44:08 -0700 (PDT)
Received: from [10.163.136.85] (unknown [10.163.136.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 127223F9A2;
	Fri,  7 Aug 2026 03:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786099452; bh=H6QklSp20s1FluH6ItvMPvplOqv4OzntIAnvR7AekVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kFegugyW/+3TwpOSan2jwjrL6LgXDEDGRFeECumYEpuzVVyQhLJOkFiCxMiXom+Y4
	 cxEbO4A25HWzJPTO34KgxL9MjdViIobcoS48A2aA7fft4XfJsaI2AqzFzPDBOiwcxD
	 XooV5+b6NgXHkqOt45CVsBII0APd+Rh8RfJZuTDk=
Message-ID: <a985a304-b399-4e84-99e3-0c6200ae518a@arm.com>
Date: Fri, 7 Aug 2026 16:14:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm_pmuv3: Zero initialize hw_id branch stack field
To: James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, "Rob Herring (Arm)" <robh@kernel.org>,
 Leo Yan <leo.yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260807-james-brbe-init-hw-idx-v1-1-009d1843960a@linaro.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260807-james-brbe-init-hw-idx-v1-1-009d1843960a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_034415_473338_5702A2FD 
X-CRM114-Status: GOOD (  23.01  )
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

On 07/08/26 2:44 PM, James Clark wrote:
> PERF_SAMPLE_BRANCH_HW_INDEX is supported by BRBE so hw_id is passed to
> userspace, but it's never set by the BRBE driver. Zero initialize it as
> it should be according to the docs:
> 
>    * For the architectures whose raw branch records are
>    * already stored in age order, the hw_idx should be 0.

The in code documentation while defining perf_branch_stack.
Probably a good idea to specify the same above.

 * For the architectures whose raw branch records are
 * already stored in age order, the hw_idx should be 0.
 */
struct perf_branch_stack {
	u64				nr;
	u64				hw_idx;
	struct perf_branch_entry	entries[];
};

> 
> It's probably too risky to remove PERF_SAMPLE_BRANCH_HW_INDEX from BRBE
> now in case anyone is setting it and reading the value, but zero
> initializing the whole struct also protects against the same issue with
> new fields that are added in the future.

Agreed. Because PERF_SAMPLE_BRANCH_HW_INDEX is supported in BRBE,
hw_idx pushed to the userspace should be zero if HW never updates.
This is definitely better than dropping PERF_SAMPLE_BRANCH_HW_INDEX
flag all together to avoid breaking current users (if any).
> 
> Fixes: 58074a0fce66 ("perf: arm_pmuv3: Add support for the Branch Record Buffer Extension (BRBE)")
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
> Very small fix spotted by Sashiko. It was probably always zero during
> testing or never looked at.
> ---
>  drivers/perf/arm_pmuv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 8014ff766cff..b9a8592bf112 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -1361,7 +1361,7 @@ static int branch_records_alloc(struct arm_pmu *armpmu)
>  		struct pmu_hw_events *events_cpu;
>  
>  		events_cpu = per_cpu_ptr(armpmu->hw_events, cpu);
> -		events_cpu->branch_stack = kmalloc(size, GFP_KERNEL);
> +		events_cpu->branch_stack = kzalloc(size, GFP_KERNEL);
>  		if (!events_cpu->branch_stack)
>  			return -ENOMEM;
>  	}
> 
> ---
> base-commit: f9a2394a23482bfd330911e9c8295b71724feacd
> change-id: 20260807-james-brbe-init-hw-idx-53dec54fe266
> 
> Best regards,
> --  
> James Clark <james.clark@linaro.org>
> 


