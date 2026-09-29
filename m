Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AD2CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOVcZ69+xtkrDIPrtf3CZkbJWjQMBa+65dy007KOEh8=; b=BVxZBxF7CrCi6IpicXc6soGvPb
	SR6tVNOCjR7COw04Z20Ike2cHIzVwp2U3GWO5go81nO9gIYBPKeO/a2M7okMmyAr7M2YB1odS4ope
	btsvty1TCfrUTuUFm2jI/Ygn5z+D8CTwKZ2Zdixih6+bAwkFHf5mzuekIcjN1xhgKsTfIhm/jZ85S
	Dj1bfFApFkuZTJwtH4lnb7Iba/sckEcL3j6D7JfTgRQaHkOU9RIeCiLf+Lt8OkvvNLSHjIkiV5y57
	kimOikdfb2u1g9/CVwK768+VdqZglKHpAoVMgmnjO9nwKKgeL31pvC/Xz68b55aGL97np2gsYLzJ7
	hIr9CAXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWkd-00000003V9V-3vvg;
	Tue, 29 Sep 2026 12:16:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWkZ-00000003V8a-2tvS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:16:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FC492F;
	Tue, 29 Sep 2026 05:15:54 -0700 (PDT)
Received: from [10.57.12.116] (unknown [10.57.12.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35FE13F86F;
	Tue, 29 Sep 2026 05:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790684157; bh=SzxPLnpzbm4Ir0vMlYp80TqFCuEZ1W6xvmkpxL/9kpQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NIiT3/7hjkCIhjmRdAjzF7PuTM9EdvbtwDwovpFg065izKOxLv6GMvuTbWH359u2U
	 c6uMoLkpmL6XMfvuraVDMyhsADR+UooRXj4TBe3ppiwcUz1SLMUOxGdRM7YXgVBAab
	 LSV632zZUYtpgtMg67N5qXviT7Qlo2eNYW8rqyGw=
Message-ID: <3610ef9d-6e0c-4e20-a6b9-1f11bf6031e6@arm.com>
Date: Tue, 29 Sep 2026 13:15:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-7-suzuki.poulose@arm.com> <aruaeLI76_kcvIhp@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aruaeLI76_kcvIhp@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_051559_832293_BA9388B0 
X-CRM114-Status: GOOD (  18.81  )
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

On 29/09/2026 12:01, Catalin Marinas wrote:
> On Thu, Sep 24, 2026 at 02:52:00PM +0100, Suzuki K Poulose wrote:
>> +/*
>> + * Make sure the area is tracked by RMM at FINE granularity.
>> + * We do not support changing the tracking yet.
>> + */
>> +static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
>> +{
>> +	while (start < end) {
>> +		unsigned long ret, category, state, next;
>> +
>> +		ret = rmi_granule_tracking_get(start, end, &category, &state, &next);
>> +		if (ret != RMI_SUCCESS)
>> +			return -ENOMEM;
>> +
>> +		if (WARN_ON(next <= start))
>> +			return -ENXIO;
>> +
>> +		if (state != RMI_TRACKING_FINE ||
>> +		    category != RMI_MEM_CATEGORY_CONVENTIONAL) {
>> +			/* TODO: Set granule tracking in this case */
>> +			pr_err("Granule tracking for region isn't fine/conventional: %llx-%lx\n",
>> +			       start, next);
>> +			return -ENODEV;
>> +		}
>> +		start = next;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * rmi_gpt_info - Query the GPT info for the given PAR.
>> + * @start: Base of the physical address region
>> + * @end: Top of the physical address region
>> + * @out_top: Top of the physical address region for which
>> + *		the GPT @out_gpt_par_state is valid
>> + * @out_gpt_par_state: State of the GPT covered by [start, out_top)
>> + */
>> +static long rmi_gpt_info(unsigned long start, unsigned long end,
>> +			 unsigned long *out_top,
>> +			 unsigned long *out_gpt_par_state)
>> +{
>> +	struct arm_smccc_1_2_regs regs = {
>> +		SMC_RMI_GPT_INFO, start, end,
>> +	};
>> +
>> +	rmi_smccc_invoke(&regs);
>> +	if (regs.a0 != RMI_SUCCESS)
>> +		return regs.a0;
>> +
>> +	if (out_top)
>> +		*out_top = regs.a1;
>> +	if (out_gpt_par_state)
>> +		*out_gpt_par_state = regs.a2;
>> +
>> +	return RMI_SUCCESS;
>> +}
>> +
>> +/*
>> + * We do not support creating L1 GPTs yet. So, make sure that
>> + * all the regions are managed by the firmware.
>> + */
>> +static int rmi_verify_gpt_firmware_managed(phys_addr_t start, phys_addr_t end)
>> +{
>> +	unsigned long l0gpt_sz;
>> +	unsigned long next, par_state;
>> +
>> +	l0gpt_sz = 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
>> +					  rmi_feat_reg(1)));
>> +	start = ALIGN_DOWN(start, l0gpt_sz);
>> +	end = ALIGN(end, l0gpt_sz);
>> +
>> +	while (start < end) {
>> +		long ret = rmi_gpt_info(start, end, &next, &par_state);
>> +
>> +		if (ret != RMI_SUCCESS)
>> +			return -ENOMEM;
> 
> Nit: what does -ENOMEM actually mean here? Was there any allocation?
> Maybe -ENXIO is better suited, as the one below. Also, is it useful to
> print something like we do further down?
> 
> Same comment for rmi_verify_memory_tracking().
> 
>> +		if (WARN_ON(next <= start))
>> +			return -ENXIO;
>> +
>> +		if (par_state != RMI_GPT_PAR_PLAT) {
>> +			pr_err("GPT for the region is not managed by firmware %llx-%lx\n",
>> +				start, next);
>> +			return -ENOMEM;
> 
> Nit: in v18, Gavin suggested returning -ENODEV here (the hunk he
> proposed). I think it makes more sense and it matches the -ENODEV in
> rmi_verify_memory_tracking().

Ack, I have incorporated both suggestions.

Suzuki

> 


