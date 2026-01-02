Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8C2FA3728
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 18:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6VmRE84hy1tV7GxjuvF11hL7eqNjgvI2Nm6sb2SoCM=; b=McGaKRhAJkjrQ02ZlIX+1oves3
	b1TIJBZa4I+pHdKqzmYPJL8gYIJ4XAp++JmF7Ybi90grr6HW91Nm4BJhGt2zOOep6FqwGME+fLtoj
	3gXvD1s1xkP17dRyAHqFPNstfI/utTcyAYC3yfwNGTDXo2ILhaIy+Ka6FfcWxfnD09lJtF/xE88X8
	xKRjT2Cg4rddm8LY0PDPWfhgG/Q/mMxuZBP0mvwH76hm+yhVQlZlBZkVLHE0bTDkGKkvzQLFq071p
	VDE37Hkg5nQY6F9XLjQFgqRCKpuVpFy90k5PN0zGkIs0O6/AzrqMQyQzqFS5I+4MzY3zasu7hH29o
	GMGRO/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjrN-00000008cun-0zPQ;
	Fri, 02 Jan 2026 18:26:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjrK-00000008cuD-30sZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 18:26:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47a95a96d42so1945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 10:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767378405; x=1767983205; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C6VmRE84hy1tV7GxjuvF11hL7eqNjgvI2Nm6sb2SoCM=;
        b=R6erduFoNOYvWCLQGOG/xmz3paUt87BwzwQve9drrcABTUeTGRpBBEqbBkq6WIz32o
         NQMHTVRUzHokmNO90wjah0COUFNcWnwPlwL+vRhhyFoEcKz0zJZenQyilGY/LHjOfYzI
         B794Aks5Piw/b1iczpP6x6KRxHYnz83Fy4uF//uMmNPzQmrszapXiAWfDzt0Qp2xLUHe
         Z3hsj634vuYfPfbW02gpvECVqPIFvPoQ6ZKixFoXAlgALsafl1uam51YlI5OvK33XWmG
         +smAvCT6Y6rolUol8jks09Zkn0056YbegIYsJT8AUmdq/sQsqbsdlvxVh/NP5LpdJBQR
         sdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767378405; x=1767983205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6VmRE84hy1tV7GxjuvF11hL7eqNjgvI2Nm6sb2SoCM=;
        b=gW4DDyoWWl13PGfWNnk/TNQE1e390cDDAyXs9GQGl4CSNEQ+r6AeNP780YHdUtPC8z
         +SBuuO9S0tfNNuzsWpDwlOX9QhRO+QPrU5OO7FpVjlV5C0HuDEVboypRNI95ddAdPVOE
         KW5ZCVCyldfDd7Dy1WfibcNP0oVWGCjc9KvGPadj00jF0qTQ7P1xBitWEReMHR+CEzoA
         kqlmqrGNEKmx4Z6MTNmMdl6j2Nntx0ziseT/F8m8+KAxNwOzMSdYOh9gVzfaHvNb8RYi
         I5mNUMueBpmKfjOdSIkNGy0yhq4v4TdBlaU0Q9QO5m79JqJqW0qVEn47pRLlDTMfPeKx
         PsjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgC0jCPLyV1YSyVPcv95jsK56TO1505ri1m9SEKmiUIznCqJpKHNPjOZnIFNyY81f82Mc1OEI/DZnfduOP35Mn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7WZz4F69FJ+wD9UvbD7376ALHYXTaLCPoCp2igZkTwdWmvygw
	rCgv+Kkg5gzip1YQRlG0/pn8JNmMEsXo8tzw3Tevw2DrACVML/KYY0xPI/05zuse7g==
X-Gm-Gg: AY/fxX7AAp/RchqKBR5fFTmBaG5yYy2jZEDbqkltPNozmVYWB6ZzAOMHzJx3RHHgPpM
	pAIogrWILxibsUAQJnQhHwK1hBUigH4Kv777VFarRlhWxbMAs/n9i6oT4AZw4ZUYTgghovnAjPu
	d/eHollaECilIrZWqfTyNg/K4YB4EAG8vS+n3YYlZq8onD1VOw14juwnQ/q4/FKz3iBt5cmqZCX
	j9uwIe2+pDNhuFws5rXe3z1zBjRs9vbgTxflDHtqlziCN9TFLMvHNeSWqcmPruMsB2iNl6/260+
	18+awVT0qZ+zIhTTzrpFA4FvA32iaB7xqdZcXKQl6/3vfaK2KQ66e75AfvtZXium+Dr6dm9rldi
	Zy2WvMrCypGkNblPAwGGmFY8GjmQDeGxn5V5KuUn7+BP4JpytVnChiys1OHdsaOyowIYsl5UMb0
	bElIzkq2QDMZhLGHneq+eHcPjmJE7KOxHdvP2dk43Up8K9Ygb3UBVum14KfWocTqM=
X-Google-Smtp-Source: AGHT+IGwg8Fa4ecp7Nausir70D/wkitZs+xtIWbvFB+O66NW8MoGvR5fFj6DnKi9U+mtSuI4iqzZiw==
X-Received: by 2002:a05:600c:207:b0:47a:80ec:b2f7 with SMTP id 5b1f17b1804b1-47d6c367ecemr12085e9.14.1767378404531;
        Fri, 02 Jan 2026 10:26:44 -0800 (PST)
Received: from google.com (171.85.155.104.bc.googleusercontent.com. [104.155.85.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193621c8sm751447155e9.7.2026.01.02.10.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 10:26:43 -0800 (PST)
Date: Fri, 2 Jan 2026 18:26:40 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com
Subject: Re: [PATCH rc v5 1/4] iommu/arm-smmu-v3: Add update_safe bits to fix
 STE update sequence
Message-ID: <aVgN4KrTEw4qGz5L@google.com>
References: <cover.1766093909.git.nicolinc@nvidia.com>
 <58f5af553fa7c3b5fd16f1eb13a81ae428f85678.1766093909.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58f5af553fa7c3b5fd16f1eb13a81ae428f85678.1766093909.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_102646_812127_76C4FC5E 
X-CRM114-Status: GOOD (  38.37  )
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

On Thu, Dec 18, 2025 at 01:41:56PM -0800, Nicolin Chen wrote:
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
> Add an arm_smmu_get_ste_update_safe() to allow STE update algorithm to
> relax those fields, avoiding the STE update breakages.
> 
> After this change, entry_set has no caller checking its return value, so
> change it to void.
> 
> Note that this change is required by both MEV and EATS fields, which were
> introduced in different kernel versions. So add get_update_safe() first.
> MEV and EATS will be added to arm_smmu_get_ste_update_safe() separately.
> 
> Fixes: 1e8be08d1c91 ("iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>
Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  2 ++
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 18 ++++++++++---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 27 ++++++++++++++-----
>  3 files changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index ae23aacc3840..a6c976fa9df2 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -900,6 +900,7 @@ struct arm_smmu_entry_writer {
>  
>  struct arm_smmu_entry_writer_ops {
>  	void (*get_used)(const __le64 *entry, __le64 *used);
> +	void (*get_update_safe)(__le64 *safe_bits);
>  	void (*sync)(struct arm_smmu_entry_writer *writer);
>  };
>  
> @@ -911,6 +912,7 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
>  
>  #if IS_ENABLED(CONFIG_KUNIT)
>  void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits);
> +void arm_smmu_get_ste_update_safe(__le64 *safe_bits);
>  void arm_smmu_write_entry(struct arm_smmu_entry_writer *writer, __le64 *cur,
>  			  const __le64 *target);
>  void arm_smmu_get_cd_used(const __le64 *ent, __le64 *used_bits);
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> index d2671bfd3798..5db14718fdd6 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> @@ -38,13 +38,16 @@ enum arm_smmu_test_master_feat {
>  static bool arm_smmu_entry_differs_in_used_bits(const __le64 *entry,
>  						const __le64 *used_bits,
>  						const __le64 *target,
> +						const __le64 *safe,
>  						unsigned int length)
>  {
>  	bool differs = false;
>  	unsigned int i;
>  
>  	for (i = 0; i < length; i++) {
> -		if ((entry[i] & used_bits[i]) != target[i])
> +		__le64 used = used_bits[i] & ~safe[i];
> +
> +		if ((entry[i] & used) != (target[i] & used))
>  			differs = true;
>  	}
>  	return differs;
> @@ -56,12 +59,17 @@ arm_smmu_test_writer_record_syncs(struct arm_smmu_entry_writer *writer)
>  	struct arm_smmu_test_writer *test_writer =
>  		container_of(writer, struct arm_smmu_test_writer, writer);
>  	__le64 *entry_used_bits;
> +	__le64 *safe;
>  
>  	entry_used_bits = kunit_kzalloc(
>  		test_writer->test, sizeof(*entry_used_bits) * NUM_ENTRY_QWORDS,
>  		GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_NULL(test_writer->test, entry_used_bits);
>  
> +	safe = kunit_kzalloc(test_writer->test,
> +			     sizeof(*safe) * NUM_ENTRY_QWORDS, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test_writer->test, safe);
> +
>  	pr_debug("STE value is now set to: ");
>  	print_hex_dump_debug("    ", DUMP_PREFIX_NONE, 16, 8,
>  			     test_writer->entry,
> @@ -79,14 +87,17 @@ arm_smmu_test_writer_record_syncs(struct arm_smmu_entry_writer *writer)
>  		 * configuration.
>  		 */
>  		writer->ops->get_used(test_writer->entry, entry_used_bits);
> +		if (writer->ops->get_update_safe)
> +			writer->ops->get_update_safe(safe);
>  		KUNIT_EXPECT_FALSE(
>  			test_writer->test,
>  			arm_smmu_entry_differs_in_used_bits(
>  				test_writer->entry, entry_used_bits,
> -				test_writer->init_entry, NUM_ENTRY_QWORDS) &&
> +				test_writer->init_entry, safe,
> +				NUM_ENTRY_QWORDS) &&
>  				arm_smmu_entry_differs_in_used_bits(
>  					test_writer->entry, entry_used_bits,
> -					test_writer->target_entry,
> +					test_writer->target_entry, safe,
>  					NUM_ENTRY_QWORDS));
>  	}
>  }
> @@ -106,6 +117,7 @@ arm_smmu_v3_test_debug_print_used_bits(struct arm_smmu_entry_writer *writer,
>  static const struct arm_smmu_entry_writer_ops test_ste_ops = {
>  	.sync = arm_smmu_test_writer_record_syncs,
>  	.get_used = arm_smmu_get_ste_used,
> +	.get_update_safe = arm_smmu_get_ste_update_safe,
>  };
>  
>  static const struct arm_smmu_entry_writer_ops test_cd_ops = {
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d16d35c78c06..8dbf4ad5b51e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1082,6 +1082,12 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_used);
>  
> +VISIBLE_IF_KUNIT
> +void arm_smmu_get_ste_update_safe(__le64 *safe_bits)
> +{
> +}
> +EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_update_safe);
> +
>  /*
>   * Figure out if we can do a hitless update of entry to become target. Returns a
>   * bit mask where 1 indicates that qword needs to be set disruptively.
> @@ -1094,13 +1100,22 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
>  {
>  	__le64 target_used[NUM_ENTRY_QWORDS] = {};
>  	__le64 cur_used[NUM_ENTRY_QWORDS] = {};
> +	__le64 safe[NUM_ENTRY_QWORDS] = {};
>  	u8 used_qword_diff = 0;
>  	unsigned int i;
>  
>  	writer->ops->get_used(entry, cur_used);
>  	writer->ops->get_used(target, target_used);
> +	if (writer->ops->get_update_safe)
> +		writer->ops->get_update_safe(safe);
>  
>  	for (i = 0; i != NUM_ENTRY_QWORDS; i++) {
> +		/*
> +		 * Safe is only used for bits that are used by both entries,
> +		 * otherwise it is sequenced according to the unused entry.
> +		 */
> +		safe[i] &= target_used[i] & cur_used[i];
> +
>  		/*
>  		 * Check that masks are up to date, the make functions are not
>  		 * allowed to set a bit to 1 if the used function doesn't say it
> @@ -1109,6 +1124,7 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
>  		WARN_ON_ONCE(target[i] & ~target_used[i]);
>  
>  		/* Bits can change because they are not currently being used */
> +		cur_used[i] &= ~safe[i];
>  		unused_update[i] = (entry[i] & cur_used[i]) |
>  				   (target[i] & ~cur_used[i]);
>  		/*
> @@ -1121,7 +1137,7 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
>  	return used_qword_diff;
>  }
>  
> -static bool entry_set(struct arm_smmu_entry_writer *writer, __le64 *entry,
> +static void entry_set(struct arm_smmu_entry_writer *writer, __le64 *entry,
>  		      const __le64 *target, unsigned int start,
>  		      unsigned int len)
>  {
> @@ -1137,7 +1153,6 @@ static bool entry_set(struct arm_smmu_entry_writer *writer, __le64 *entry,
>  
>  	if (changed)
>  		writer->ops->sync(writer);
> -	return changed;
>  }
>  
>  /*
> @@ -1207,12 +1222,9 @@ void arm_smmu_write_entry(struct arm_smmu_entry_writer *writer, __le64 *entry,
>  		entry_set(writer, entry, target, 0, 1);
>  	} else {
>  		/*
> -		 * No inuse bit changed. Sanity check that all unused bits are 0
> -		 * in the entry. The target was already sanity checked by
> -		 * compute_qword_diff().
> +		 * No inuse bit changed, though safe bits may have changed.
>  		 */
> -		WARN_ON_ONCE(
> -			entry_set(writer, entry, target, 0, NUM_ENTRY_QWORDS));
> +		entry_set(writer, entry, target, 0, NUM_ENTRY_QWORDS);
>  	}
>  }
>  EXPORT_SYMBOL_IF_KUNIT(arm_smmu_write_entry);
> @@ -1543,6 +1555,7 @@ static void arm_smmu_ste_writer_sync_entry(struct arm_smmu_entry_writer *writer)
>  static const struct arm_smmu_entry_writer_ops arm_smmu_ste_writer_ops = {
>  	.sync = arm_smmu_ste_writer_sync_entry,
>  	.get_used = arm_smmu_get_ste_used,
> +	.get_update_safe = arm_smmu_get_ste_update_safe,
>  };
>  
>  static void arm_smmu_write_ste(struct arm_smmu_master *master, u32 sid,
> -- 
> 2.43.0
> 

