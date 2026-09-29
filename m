Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976FBCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 11:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hgb/CfvgYUFWj/prOWmmvMGS0cJ+0zZ6GorWHBYtHrA=; b=URPbSJYvnbsKCZldg7LJsMfiIH
	mJXL4sEsHD8DlKEZ3tJ7CyklZ3bZWOa8sAe9omsy2cPGBLFO26xf7TS/t9RQjmPDhLKqlswW2t0YU
	bawvowBVkD8gutCPN2iLbIMy/Cc/FTWYTh5GgILwZjvqVwPytImIpiSo1W6sTUa8H4DbqjMVmFqA8
	ELId4Luwe2ErvumBBIBci9NCufNScoRjkLv08gGZx2TxgqEtCcH0j/Ji8PLtKh+58G67wn9PxMh+I
	pwmVrhTTKRDsDGDAApmbfMVBAIcgPIC73/udGkL0mg0EbPT/52XeuLF4n6dwG3AAgzw5RT/7ueJus
	XnOWgwJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVah-00000003Lt4-2vtJ;
	Tue, 29 Sep 2026 11:01:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVag-00000003Lsj-1xfK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 11:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Hgb/CfvgYUFWj/prOWmmvMGS0cJ+0zZ6GorWHBYtHrA=; b=CE4MN5tXcLzS5Vh09ZqmepNvk1
	IclraSpM7AwP5AqDhpD8IIGE04OEFLkqXWCnXTT/WThrM+7+os1u4HYditECmFi+wknhBwjuFk6hC
	F+j6Ch4ZjR81acaz64D05LP5fiNnevTwpkpUHSum2isrU7JGwCT0zqPB8OE3jT+djQO++RLqBJdM0
	MZ7hJ32gOiK3hT33N6GkhrGL6L+Ak7qlKAiV7A241nWbxE3j7+UIw2hA49sNEfqiUSPOlO9dTzU8v
	iL1TsG4QRX0J5whc3iCyPWeUmZZPpq50vuEAr3iwcH6TXPX1ifuUOsCfsL3AV9lQmsuP8dRvhNAKO
	bhTT5ARA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBVab-00000002X7D-1ktJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 11:01:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC2AA1476;
	Tue, 29 Sep 2026 04:01:31 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99FBA3F86F;
	Tue, 29 Sep 2026 04:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790679695; bh=Rpzw0ZWBwUreMmYoy4UjzmcXitYDynavT/IpC3eZEb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BPltN72Vlfh8ep8ZYrPiJ25xeFhxXn1AjH+dSMLOj2OQWnFkXSQkcKPPsdCdatRu9
	 fvtPj88NOaLO3mxAkQBwC+LFg1+eZzWuHx4/KB8SNtSLgyjB8pniVvIKJaQeZiDZME
	 A62mmIRSEfeBwwvYrzqWTYIVPGYqnm40zrR8w1dE=
Date: Tue, 29 Sep 2026 12:01:29 +0100
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
Subject: Re: [PATCH v19 6/7] firmware: arm_rmm: Ensure the RMM has GPT
 entries for memory
Message-ID: <aruaeLI76_kcvIhp@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-7-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924135201.850038-7-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_120137_860989_1E27778D 
X-CRM114-Status: GOOD (  20.48  )
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

On Thu, Sep 24, 2026 at 02:52:00PM +0100, Suzuki K Poulose wrote:
> +/*
> + * Make sure the area is tracked by RMM at FINE granularity.
> + * We do not support changing the tracking yet.
> + */
> +static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
> +{
> +	while (start < end) {
> +		unsigned long ret, category, state, next;
> +
> +		ret = rmi_granule_tracking_get(start, end, &category, &state, &next);
> +		if (ret != RMI_SUCCESS)
> +			return -ENOMEM;
> +
> +		if (WARN_ON(next <= start))
> +			return -ENXIO;
> +
> +		if (state != RMI_TRACKING_FINE ||
> +		    category != RMI_MEM_CATEGORY_CONVENTIONAL) {
> +			/* TODO: Set granule tracking in this case */
> +			pr_err("Granule tracking for region isn't fine/conventional: %llx-%lx\n",
> +			       start, next);
> +			return -ENODEV;
> +		}
> +		start = next;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * rmi_gpt_info - Query the GPT info for the given PAR.
> + * @start: Base of the physical address region
> + * @end: Top of the physical address region
> + * @out_top: Top of the physical address region for which
> + *		the GPT @out_gpt_par_state is valid
> + * @out_gpt_par_state: State of the GPT covered by [start, out_top)
> + */
> +static long rmi_gpt_info(unsigned long start, unsigned long end,
> +			 unsigned long *out_top,
> +			 unsigned long *out_gpt_par_state)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_GPT_INFO, start, end,
> +	};
> +
> +	rmi_smccc_invoke(&regs);
> +	if (regs.a0 != RMI_SUCCESS)
> +		return regs.a0;
> +
> +	if (out_top)
> +		*out_top = regs.a1;
> +	if (out_gpt_par_state)
> +		*out_gpt_par_state = regs.a2;
> +
> +	return RMI_SUCCESS;
> +}
> +
> +/*
> + * We do not support creating L1 GPTs yet. So, make sure that
> + * all the regions are managed by the firmware.
> + */
> +static int rmi_verify_gpt_firmware_managed(phys_addr_t start, phys_addr_t end)
> +{
> +	unsigned long l0gpt_sz;
> +	unsigned long next, par_state;
> +
> +	l0gpt_sz = 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
> +					  rmi_feat_reg(1)));
> +	start = ALIGN_DOWN(start, l0gpt_sz);
> +	end = ALIGN(end, l0gpt_sz);
> +
> +	while (start < end) {
> +		long ret = rmi_gpt_info(start, end, &next, &par_state);
> +
> +		if (ret != RMI_SUCCESS)
> +			return -ENOMEM;

Nit: what does -ENOMEM actually mean here? Was there any allocation?
Maybe -ENXIO is better suited, as the one below. Also, is it useful to
print something like we do further down?

Same comment for rmi_verify_memory_tracking().

> +		if (WARN_ON(next <= start))
> +			return -ENXIO;
> +
> +		if (par_state != RMI_GPT_PAR_PLAT) {
> +			pr_err("GPT for the region is not managed by firmware %llx-%lx\n",
> +				start, next);
> +			return -ENOMEM;

Nit: in v18, Gavin suggested returning -ENODEV here (the hunk he
proposed). I think it makes more sense and it matches the -ENODEV in
rmi_verify_memory_tracking().

-- 
Catalin

