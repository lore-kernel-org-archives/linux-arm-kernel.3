Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9742DCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 17:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzuC6MTUMNVSoGicxK1S0ctH7XsxNeVhYy22mcOe1G8=; b=aWZyfZ1C9bWs7flWhiiOxNs417
	VJHVmC8DZHAPrA3ko0HxX0UZIbDnLCF1OuDeKm992Ee505h+UI05TcCJVcwqX5dQemaz5KJSv2Gwc
	VRLkVsusRGbvu7uB3oQ+QA68Nyo0M57VckZrjImNM1ye/16Pn/oNEMsWgxrqpsM2Yk1nxQU0qCcmK
	qkWGleHHwZ0b0mzHlak8XCzPq5oNxYVci6zRcDsx00g38Rgr5lbeqETdCv+vsYE1SC46897PnpeFc
	VJu4BV5vhv7Po3EMzC+d/xEYpLbo1yHoNWvQoINHLBpWSj3QRGNs++peMjyyvXgWYjl9CL6nwaurs
	5CKY5Rxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1KL-0000000GMTZ-1idj;
	Mon, 18 May 2026 17:00:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1KH-0000000GMSz-46h2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 17:00:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CDDF1C01;
	Mon, 18 May 2026 10:00:13 -0700 (PDT)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA0B63F7B4;
	Mon, 18 May 2026 10:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779123618; bh=zugYL5vZCUyEQykpVMWy7k6xRPMdLB3vw6jYEjwAALM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WqqK7h5FWp2KhMpVKzpxLfTmT18whExXGBcJr4XbD0XRL2A5fZ8iHZUXsWqOGiCMK
	 1NfKj9ZYcNJd+BiY/CBkKrcfbb5YQ1LPbM3WF6t+T1q5W3LbAobk1+GCOqaAsL31cC
	 fp4SKF/1zjRptiTTL0NL+yg10qJ95nkU4vCt5ayQ=
Message-ID: <83e27ae0-870e-4bfe-806d-2c2f21a719df@arm.com>
Date: Mon, 18 May 2026 18:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: pass smmu->dev to report_iommu_fault
To: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 robin.clark@oss.qualcomm.com, will@kernel.org, joro@8bytes.org,
 stable@vger.kernel.org
References: <20260517005052.3783378-1-shyamsaini@linux.microsoft.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260517005052.3783378-1-shyamsaini@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_100022_415717_49A7E50C 
X-CRM114-Status: GOOD (  20.84  )
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

On 17/05/2026 1:50 am, Shyam Saini wrote:
> report_iommu_fault() passes the dev argument to trace_io_page_fault(),
> which dereferences it via dev_name() and dev_driver_string(). Passing
> NULL causes a kernel crash when the io_page_fault tracepoint is
> enabled.
> 
> In arm-smmu.c, 'commit f8f934c180f6 ("iommu/arm-smmu: Add support for driver IOMMU fault handlers")'
> replaced a dev_err_ratelimited() call that correctly used smmu->dev with

I'm not sure it was really correct - it's pretty clear that "dev" is 
intended to be the client device that _caused_ the fault, since why 
would it make any sense to pass the IOMMU device to some other 
driver/subsystem's fault handler? (Yes, other IOMMU drivers already do 
that; I would consider them just as wrong too).

IMO it would seem more robust to just fix the tracepoint to handle a 
NULL "dev" in the case that one can't (easily) be identified.

Thanks,
Robin.

> report_iommu_fault() but passed NULL instead.
> In arm-smmu-qcom-debug.c, 'commit d374555ef993 ("iommu/arm-smmu-qcom: Use a custom context fault handler for sdm845")'
> introduced two report_iommu_fault() calls also with NULL.
> 
> Pass smmu->dev to all three call sites.
> 
> Fixes: f8f934c180f629bb ("iommu/arm-smmu: Add support for driver IOMMU fault handlers")
> Fixes: d374555ef993433f ("iommu/arm-smmu-qcom: Use a custom context fault handler for sdm845")
> Cc: stable@vger.kernel.org
> Assisted-by: GitHub_Copilot:claude-opus-4.6
> Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c | 4 ++--
>   drivers/iommu/arm/arm-smmu/arm-smmu.c            | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 65e0ef6539fe7..8eb9f7831de07 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -399,7 +399,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
>   		return IRQ_NONE;
>   
>   	if (list_empty(&tbu_list)) {
> -		ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> +		ret = report_iommu_fault(&smmu_domain->domain, smmu->dev, cfi.iova,
>   					 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>   
>   		if (ret == -ENOSYS)
> @@ -417,7 +417,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
>   
>   	phys_soft = ops->iova_to_phys(ops, cfi.iova);
>   
> -	tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> +	tmp = report_iommu_fault(&smmu_domain->domain, smmu->dev, cfi.iova,
>   				 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>   	if (!tmp || tmp == -EBUSY) {
>   		ret = IRQ_HANDLED;
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 0bd21d206eb3e..92d8fa2100adb 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -467,7 +467,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>   	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
>   		return IRQ_NONE;
>   
> -	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> +	ret = report_iommu_fault(&smmu_domain->domain, smmu->dev, cfi.iova,
>   		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>   
>   	if (ret == -ENOSYS && __ratelimit(&rs))


