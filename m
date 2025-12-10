Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0184CD3B9BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 01:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=astG5rLVVcsxhNqM58jSlwGQioV5hSGsmvVbRD1A9T8=; b=XxqmzpF4H+fXJabd6yQmDRC86O
	QnDMK0cQqaW64z3CEusiWLnP8/I9xjdlBDzyRvmf6mcpto6/bCgYYuePL38VvOO5N0y+tUtxBfcnm
	21vSAECTpRKv0B+ZideNtYrC30fiSXww6R5kzCvLzYsZfrp6zd0wrfHGuAfuM20iwpRGQkH/rCTU3
	gUROgaCDM6IdhutwEIk/HI/Zy3d+/A9Ou+c3BeWPeEKGyhp4DU7L79WiWQC81XKDkVEAL4sLOdL0J
	iianHcEYooKN+EpOFckDXmdxjWRef8KGIV6QKJQ/7mUe/P49xsjsUJwMUaeeatJLMLBj0ScweOONF
	a0e39JcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT9PB-0000000Ez1b-0jXj;
	Wed, 10 Dec 2025 01:54:13 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT9P7-0000000Ez0n-0dRb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 01:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765331641; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=astG5rLVVcsxhNqM58jSlwGQioV5hSGsmvVbRD1A9T8=;
	b=PyEDOkdukYRRBxZ4u0hZx6w20yyZuoEM82s2MC6mS/W1fE67MWxYp61YflzC1A1AzFpVpQ0pTAU9taPSpN6QK+tuK7fbzf3FY/63N6J5s5PcM4fP3f4K8zOP3bRrl49Tw93E0VGElP8d574GM2mV6txQbmE9153HWcGU9jEPewU=
Received: from 30.246.178.18(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WuUXXfG_1765331637 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Dec 2025 09:53:58 +0800
Message-ID: <04fc0c2e-9649-4cde-9415-e7e0e7145776@linux.alibaba.com>
Date: Wed, 10 Dec 2025 09:53:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rc v2 4/4] iommu/arm-smmu-v3-test: Add nested
 s1bypass/s1dssbypass coverage
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, skolothumtho@nvidia.com, praan@google.com
References: <cover.1765140287.git.nicolinc@nvidia.com>
 <b6d87901f89c05dd9e1d0c1e819040d205f569a7.1765140287.git.nicolinc@nvidia.com>
 <f52c705d-6032-4d85-b902-dd6d0a40b9ec@linux.alibaba.com>
 <aTiO69YZ9WA8dFe0@nvidia.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aTiO69YZ9WA8dFe0@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_175409_889168_FB467AA6 
X-CRM114-Status: GOOD (  15.59  )
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



在 2025/12/10 05:04, Nicolin Chen 写道:
> On Mon, Dec 08, 2025 at 11:43:41AM +0800, Shuai Xue wrote:
>> Hi, Nicolin,
>>
>> Nit. Instead of duplicating this code, we can leverage the existing
>> arm_smmu_test_make_cdtable_ste() helper here.
> 
> Thanks for the review. I squashed the following changes:
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> index 1672e75ebffc2..197b8b55fe7a2 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> @@ -33,8 +33,12 @@ static struct mm_struct sva_mm = {
>   enum arm_smmu_test_master_feat {
>   	ARM_SMMU_MASTER_TEST_ATS = BIT(0),
>   	ARM_SMMU_MASTER_TEST_STALL = BIT(1),
> +	ARM_SMMU_MASTER_TEST_NESTED = BIT(2),
>   };
>   
> +static void arm_smmu_test_make_s2_ste(struct arm_smmu_ste *ste,
> +				      enum arm_smmu_test_master_feat feat);
> +
>   static bool arm_smmu_entry_differs_in_used_bits(const __le64 *entry,
>   						const __le64 *used_bits,
>   						const __le64 *target,
> @@ -198,6 +202,17 @@ static void arm_smmu_test_make_cdtable_ste(struct arm_smmu_ste *ste,
>   	};
>   
>   	arm_smmu_make_cdtable_ste(ste, &master, ats_enabled, s1dss);
> +	if (feat & ARM_SMMU_MASTER_TEST_NESTED) {
> +		struct arm_smmu_ste s2ste;
> +		int i;
> +
> +		arm_smmu_test_make_s2_ste(&s2ste, ARM_SMMU_MASTER_TEST_ATS);
> +		ste->data[0] |= cpu_to_le64(
> +			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_NESTED));
> +		ste->data[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
> +		for (i = 2; i < NUM_ENTRY_QWORDS; i++)
> +			ste->data[i] = s2ste.data[i];
> +	}
>   }
>   
>   static void arm_smmu_v3_write_ste_test_bypass_to_abort(struct kunit *test)
> @@ -555,46 +570,17 @@ static void arm_smmu_v3_write_ste_test_s2_to_s1_stall(struct kunit *test)
>   						       NUM_EXPECTED_SYNCS(3));
>   }
>   
> -static void arm_smmu_test_make_nested_cdtable_ste(
> -	struct arm_smmu_ste *ste, unsigned int s1dss, const dma_addr_t dma_addr,
> -	enum arm_smmu_test_master_feat feat)
> -{
> -	bool stall_enabled = feat & ARM_SMMU_MASTER_TEST_STALL;
> -	bool ats_enabled = feat & ARM_SMMU_MASTER_TEST_ATS;
> -	struct arm_smmu_ste s1ste;
> -
> -	struct arm_smmu_master master = {
> -		.ats_enabled = ats_enabled,
> -		.cd_table.cdtab_dma = dma_addr,
> -		.cd_table.s1cdmax = 0xFF,
> -		.cd_table.s1fmt = STRTAB_STE_0_S1FMT_64K_L2,
> -		.smmu = &smmu,
> -		.stall_enabled = stall_enabled,
> -	};
> -
> -	arm_smmu_test_make_s2_ste(ste, ARM_SMMU_MASTER_TEST_ATS);
> -	arm_smmu_make_cdtable_ste(&s1ste, &master, ats_enabled, s1dss);
> -
> -	ste->data[0] = cpu_to_le64(
> -		STRTAB_STE_0_V |
> -		FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_NESTED));
> -	ste->data[0] |= s1ste.data[0] & ~cpu_to_le64(STRTAB_STE_0_CFG);
> -	ste->data[1] |= s1ste.data[1];
> -	/* Merge events for DoS mitigations on eventq */
> -	ste->data[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
> -}
> -
>   static void
>   arm_smmu_v3_write_ste_test_nested_s1dssbypass_to_s1bypass(struct kunit *test)
>   {
>   	struct arm_smmu_ste s1_ste;
>   	struct arm_smmu_ste s2_ste;
>   
> -	arm_smmu_test_make_nested_cdtable_ste(&s1_ste,
> -					      STRTAB_STE_1_S1DSS_BYPASS,
> -					      fake_cdtab_dma_addr,
> -					      ARM_SMMU_MASTER_TEST_ATS);
> +	arm_smmu_test_make_cdtable_ste(
> +		&s1_ste, STRTAB_STE_1_S1DSS_BYPASS, fake_cdtab_dma_addr,
> +		ARM_SMMU_MASTER_TEST_ATS | ARM_SMMU_MASTER_TEST_NESTED);
>   	arm_smmu_test_make_s2_ste(&s2_ste, 0);
> +	/* Expect an additional sync to unset ignored bits: EATS and MEV */
>   	arm_smmu_v3_test_ste_expect_hitless_transition(test, &s1_ste, &s2_ste,
>   						       NUM_EXPECTED_SYNCS(3));
>   }
> @@ -605,10 +591,9 @@ arm_smmu_v3_write_ste_test_nested_s1bypass_to_s1dssbypass(struct kunit *test)
>   	struct arm_smmu_ste s1_ste;
>   	struct arm_smmu_ste s2_ste;
>   
> -	arm_smmu_test_make_nested_cdtable_ste(&s1_ste,
> -					      STRTAB_STE_1_S1DSS_BYPASS,
> -					      fake_cdtab_dma_addr,
> -					      ARM_SMMU_MASTER_TEST_ATS);
> +	arm_smmu_test_make_cdtable_ste(
> +		&s1_ste, STRTAB_STE_1_S1DSS_BYPASS, fake_cdtab_dma_addr,
> +		ARM_SMMU_MASTER_TEST_ATS | ARM_SMMU_MASTER_TEST_NESTED);
>   	arm_smmu_test_make_s2_ste(&s2_ste, 0);
>   	arm_smmu_v3_test_ste_expect_hitless_transition(test, &s2_ste, &s1_ste,
>   						       NUM_EXPECTED_SYNCS(2));


Nice work. LGTM.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai


