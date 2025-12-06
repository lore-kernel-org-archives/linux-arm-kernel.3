Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2D8D3B7D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwXqL1oumPVi+Tsn8Xo+t9u6rxrBu5+Kx6A8R9PaH+8=; b=OX6IDK6ZKnBUn/RTUul/izf0UL
	0hAPP+oueFcsX+oBG8Q7nXhdHHpwXJqZ6XUHdwjolArQz1VjRNEeq7SsuqlTTUaeXr82P0EPQpniO
	9zhuINTWXjf7ior/nqQifQrE1nTjPIJFvItlYCINNjOz7pd9hVTtMCh7g7qWJr0T1GisUeVnbVXck
	uSTzrwlWjp1RYn0UEkQ6ZnALgYluxW5uiUhK8S6dLYq3FgSUXxPDH0Pq90jb7wFBvv+lJ8xdT9kPI
	Z2bhM+GOxjguFnzlPt+AkBBVHoYARCu7bYegRj2X6OCOmRvquU0sD+sZk1DyuNK4zn0/L09kOsRae
	puXXwRiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRt86-0000000Ayft-0wdO;
	Sat, 06 Dec 2025 14:19:22 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRt82-0000000AyfM-0c0h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 14:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765030753; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=LwXqL1oumPVi+Tsn8Xo+t9u6rxrBu5+Kx6A8R9PaH+8=;
	b=WjlWuvoN3614fMQI2dlTGRvYKZyB1AFV3UuPWle5iHJMjdZsa1gQpRn3Rpx5mDIGVGLGdFs4oC9q4zDMt9WhNoRXRd7q7mOUUkiwLWor6M55VUH8UaIy8KTub+TPWgX5rT9lF1gSXPlRsTDWy+W6Y1DPFnWXPGaWP6mhz82zGz4=
Received: from 30.246.178.18(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WuBEwyB_1765030749 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 06 Dec 2025 22:19:10 +0800
Message-ID: <1af0f768-4b3d-47a3-b59b-c56f034b1d1b@linux.alibaba.com>
Date: Sat, 6 Dec 2025 22:19:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rc v1 1/4] iommu/arm-smmu-v3: Add ignored bits to fix STE
 update sequence
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, will@kernel.org,
 robin.murphy@arm.com
Cc: joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 skolothumtho@nvidia.com, praan@google.com
References: <cover.1764982046.git.nicolinc@nvidia.com>
 <6ec73bb7cd03d90a0764f12c4b14071158163818.1764982046.git.nicolinc@nvidia.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <6ec73bb7cd03d90a0764f12c4b14071158163818.1764982046.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_061919_656452_17468E86 
X-CRM114-Status: GOOD (  30.66  )
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



在 2025/12/6 08:52, Nicolin Chen 写道:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> C_BAD_STE was observed when updating nested STE from an S1-bypass mode to
> an S1DSS-bypass mode. As both modes enabled S2, the used bit is slightly
> different than the normal S1-bypass and S1DSS-bypass modes. As a result,
> fields like MEV and EATS in S2's used list marked the word1 as a critical
> word that requested a STE.V=0. This breaks a hitless update.
> 
> However, both MEV and EATS aren't critical in terms of STE update. One
> controls the merge of the events and the other controls the ATS that is
> managed by the driver at the same time via pci_enable_ats().
> 
> Add an arm_smmu_get_ste_ignored() to allow STE update algorithm to ignore
> those fields, avoiding the STE update breakages.
> 
> Note that this change is required by both MEV and EATS fields, which were
> introduced in different kernel versions. So add this get_ignored() first.
> The MEV and EATS will be added in arm_smmu_get_ste_ignored() separately.
> 
> Fixes: 1e8be08d1c91 ("iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  2 ++
>   .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 17 ++++++++++---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 24 ++++++++++++-------
>   3 files changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index ae23aacc3840..d5f0e5407b9f 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -900,6 +900,7 @@ struct arm_smmu_entry_writer {
>   
>   struct arm_smmu_entry_writer_ops {
>   	void (*get_used)(const __le64 *entry, __le64 *used);
> +	void (*get_ignored)(__le64 *ignored_bits);
>   	void (*sync)(struct arm_smmu_entry_writer *writer);
>   };
>   
> @@ -911,6 +912,7 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
>   
>   #if IS_ENABLED(CONFIG_KUNIT)
>   void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits);
> +void arm_smmu_get_ste_ignored(__le64 *ignored_bits);
>   void arm_smmu_write_entry(struct arm_smmu_entry_writer *writer, __le64 *cur,
>   			  const __le64 *target);
>   void arm_smmu_get_cd_used(const __le64 *ent, __le64 *used_bits);
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> index d2671bfd3798..9287904c93a2 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> @@ -37,6 +37,7 @@ enum arm_smmu_test_master_feat {
>   
>   static bool arm_smmu_entry_differs_in_used_bits(const __le64 *entry,
>   						const __le64 *used_bits,
> +						const __le64 *ignored,
>   						const __le64 *target,
>   						unsigned int length)
>   {
> @@ -44,7 +45,7 @@ static bool arm_smmu_entry_differs_in_used_bits(const __le64 *entry,
>   	unsigned int i;
>   
>   	for (i = 0; i < length; i++) {
> -		if ((entry[i] & used_bits[i]) != target[i])
> +		if ((entry[i] & used_bits[i]) != (target[i] & ~ignored[i]))
>   			differs = true;
>   	}
>   	return differs;
> @@ -56,12 +57,18 @@ arm_smmu_test_writer_record_syncs(struct arm_smmu_entry_writer *writer)
>   	struct arm_smmu_test_writer *test_writer =
>   		container_of(writer, struct arm_smmu_test_writer, writer);
>   	__le64 *entry_used_bits;
> +	__le64 *ignored_bits;
>   
>   	entry_used_bits = kunit_kzalloc(
>   		test_writer->test, sizeof(*entry_used_bits) * NUM_ENTRY_QWORDS,
>   		GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_NULL(test_writer->test, entry_used_bits);
>   
> +	ignored_bits = kunit_kzalloc(test_writer->test,
> +				     sizeof(*ignored_bits) * NUM_ENTRY_QWORDS,
> +				     GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test_writer->test, ignored_bits);
> +
>   	pr_debug("STE value is now set to: ");
>   	print_hex_dump_debug("    ", DUMP_PREFIX_NONE, 16, 8,
>   			     test_writer->entry,
> @@ -79,14 +86,17 @@ arm_smmu_test_writer_record_syncs(struct arm_smmu_entry_writer *writer)
>   		 * configuration.
>   		 */
>   		writer->ops->get_used(test_writer->entry, entry_used_bits);
> +		if (writer->ops->get_ignored)
> +			writer->ops->get_ignored(ignored_bits);
>   		KUNIT_EXPECT_FALSE(
>   			test_writer->test,
>   			arm_smmu_entry_differs_in_used_bits(
>   				test_writer->entry, entry_used_bits,
> -				test_writer->init_entry, NUM_ENTRY_QWORDS) &&
> +				ignored_bits, test_writer->init_entry,
> +				NUM_ENTRY_QWORDS) &&
>   				arm_smmu_entry_differs_in_used_bits(
>   					test_writer->entry, entry_used_bits,
> -					test_writer->target_entry,
> +					ignored_bits, test_writer->target_entry,
>   					NUM_ENTRY_QWORDS));
>   	}
>   }
> @@ -106,6 +116,7 @@ arm_smmu_v3_test_debug_print_used_bits(struct arm_smmu_entry_writer *writer,
>   static const struct arm_smmu_entry_writer_ops test_ste_ops = {
>   	.sync = arm_smmu_test_writer_record_syncs,
>   	.get_used = arm_smmu_get_ste_used,
> +	.get_ignored = arm_smmu_get_ste_ignored,
>   };
>   
>   static const struct arm_smmu_entry_writer_ops test_cd_ops = {
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d16d35c78c06..95a4cfc5882d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1082,6 +1082,12 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
>   }
>   EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_used);
>   
> +VISIBLE_IF_KUNIT
> +void arm_smmu_get_ste_ignored(__le64 *ignored_bits)
> +{
> +}
> +EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_ignored);
> +
>   /*
>    * Figure out if we can do a hitless update of entry to become target. Returns a
>    * bit mask where 1 indicates that qword needs to be set disruptively.
> @@ -1094,11 +1100,14 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
>   {
>   	__le64 target_used[NUM_ENTRY_QWORDS] = {};
>   	__le64 cur_used[NUM_ENTRY_QWORDS] = {};
> +	__le64 ignored[NUM_ENTRY_QWORDS] = {};
>   	u8 used_qword_diff = 0;
>   	unsigned int i;
>   
>   	writer->ops->get_used(entry, cur_used);
>   	writer->ops->get_used(target, target_used);
> +	if (writer->ops->get_ignored)
> +		writer->ops->get_ignored(ignored);
>   
>   	for (i = 0; i != NUM_ENTRY_QWORDS; i++) {
>   		/*
> @@ -1106,16 +1115,17 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
>   		 * allowed to set a bit to 1 if the used function doesn't say it
>   		 * is used.
>   		 */

Hi, Jason,

Instead of modifying the calculation logic, would it be cleaner to keep
the original arm_smmu_get_ste_used() semantics intact and simply exclude
ignored bits from cur_used after obtaining them?

For example, simply exclude the ignored bits from cur_used after
obtaining it:

         cur_used[i] &= ~ignored[i];

> -		WARN_ON_ONCE(target[i] & ~target_used[i]);
> +		WARN_ON_ONCE(target[i] & ~target_used[i] & ~ignored[i]);

Keep arm_smmu_get_ste_used() unchanged so target_used still accurately
reflects the bits actually used by hardware, then we do not need above
changes.


>   
>   		/* Bits can change because they are not currently being used */
> -		unused_update[i] = (entry[i] & cur_used[i]) |
> +		unused_update[i] = (entry[i] & (cur_used[i] | ignored[i])) |
>   				   (target[i] & ~cur_used[i]);
>   		/*
>   		 * Each bit indicates that a used bit in a qword needs to be
>   		 * changed after unused_update is applied.
>   		 */
> -		if ((unused_update[i] & target_used[i]) != target[i])
> +		if ((unused_update[i] & target_used[i]) !=
> +		    (target[i] & ~ignored[i]))
>   			used_qword_diff |= 1 << i;

And since `ignored` bits are cleared from cur_used, applying
unused_update to target will result in target itself. So we don't need
the above changes either.

The key insight is that we only need to exclude ignored bits from
cur_used (which determines what can be updated non-disruptively), while
keeping target_used intact for both the safety check and the final
comparison.

This way, we achieve the same goal with minimal changes to the existing
logic.

Thanks.
Shuai

