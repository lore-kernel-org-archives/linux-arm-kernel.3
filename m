Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD9BD2AB3F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpfQ5BGYU1X62k/2bnTZCsHMk1XVCBrexKTCHDEJCSM=; b=dgqAyeApJSKe1LsVHEHXWmcgRF
	ITUh/ZJMsR+aiy53Mlukv5ERLooDU7UWmpJ1xLcYkEoOpV3Lq9jjkS8J3L+lv8aOkWQQJeJ9/GIrg
	My3Jfc/pKHOHEf7uY0FVeMdquWm27tHfDN8Dp7BPpcgIT17lwnvXQq26dqiY9s8WYiL+ALJKjtgLf
	7/MkYkij+FlEoa7xZmOgT/ZUCcjblOsQtspUHJtULfP1KZlImFcyW5I7/ExqVQoRaws6ptpRc3tKC
	JILPckmQfgmTnLM7SDQEI3RH1vyswLmc1Bx+WSMdidIHNApxhMbI5RsqkwD3yhieLRKKw/vguV31h
	oUxCtWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mkz-0000000Ees9-3yLz;
	Tue, 29 Oct 2024 13:59:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mOh-0000000EanL-1FnN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 13:36:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1C24113E;
	Tue, 29 Oct 2024 06:37:03 -0700 (PDT)
Received: from [10.57.89.81] (unknown [10.57.89.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEFE43F528;
	Tue, 29 Oct 2024 06:36:31 -0700 (PDT)
Message-ID: <7f172651-7bc0-4c3b-8d33-1c796e016c84@arm.com>
Date: Tue, 29 Oct 2024 13:36:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 5/5] iommu/arm-smmu: add ACTLR data and support for
 qcom_smmu_500
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robdclark@gmail.com,
 will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com,
 robh@kernel.org, krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-6-quic_bibekkum@quicinc.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241008125410.3422512-6-quic_bibekkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_063635_423728_84587646 
X-CRM114-Status: GOOD (  17.31  )
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

On 2024-10-08 1:54 pm, Bibek Kumar Patro wrote:
> Add ACTLR data table for qcom_smmu_500 including
> corresponding data entry and set prefetch value by
> way of a list of compatible strings.

Hmm, I'd still be inclined to combine this into the existing 
qcom_smmu_client_of_match table by generalising the match data (i.e. 
make an explicit "wants an identity domain" flag as well), but that 
could always be tried later. This is pleasantly inoffensive enough as it 
is, compared to the previous idea :)

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 2d2c1e75632c..dd4fb883ebcd 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -25,8 +25,31 @@
> 
>   #define CPRE			(1 << 1)
>   #define CMTLB			(1 << 0)
> +#define PREFETCH_SHIFT		8
> +#define PREFETCH_DEFAULT	0
> +#define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
> +#define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
> +#define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
>   #define GFX_ACTLR_PRR		(1 << 5)
> 
> +static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
> +	{ .compatible = "qcom,adreno",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,adreno-gmu",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,adreno-smmu",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,fastrpc",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc7280-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc7280-venus",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8550-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ }
> +};
> +
>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>   {
>   	return container_of(smmu, struct qcom_smmu, smmu);
> @@ -640,6 +663,7 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
>   	.impl = &qcom_smmu_500_impl,
>   	.adreno_impl = &qcom_adreno_smmu_500_impl,
>   	.cfg = &qcom_smmu_impl0_cfg,
> +	.client_match = qcom_smmu_actlr_client_of_match,
>   };
> 
>   /*
> --
> 2.34.1
> 


