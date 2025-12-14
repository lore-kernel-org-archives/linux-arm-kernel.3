Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76554D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 22:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcFIYG8pThrquY7+bXzMj2jE6v828zltZDO7Yqjwkw8=; b=2fDS3EmuJTltG3hPT+Gn7+XSBo
	k4Hho65QS8xjMfay6po9DovSLyOhl7BGWZwggfIR44rfLPAiqhO71qRrRn3GD+0qZyPFtGV3JJmhQ
	rK/YD+rYmOGk7NyW65YJZKKKu9UrUc3elzEqOzMxNOFW1q15e65/aftn5x2SDUwdTlRo4kGx5bIX7
	LjLn1bqyXYOzjHxgNYh7SY0zm134G5xmW6iFuvuMscSb4cHgzNBMUCZFvefc6s2x3TjVKeVZvEDnr
	cecgaS7OtKBtdsBFYz3ITCe5gi6XMNlW63XoapPKi0ldYCVlfHYhKtogWnfpmHTIMhpYACa0uybjS
	nMPnvEEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUudx-00000002nNx-1QkC;
	Sun, 14 Dec 2025 22:32:45 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUudu-00000002nNP-2FnL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 22:32:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47a95a96d42so40575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 14:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765751560; x=1766356360; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KcFIYG8pThrquY7+bXzMj2jE6v828zltZDO7Yqjwkw8=;
        b=KY6MX5uK20UxZkmTAO2Q6V+jR+VCqwgK5sfhJ/T2pglDP+8u+BxBzFk0k9OM6cpTpx
         j3H02Hp90hk4Yj6lgmk2+EyrNjr5+GLMfIL3EPUxBPTidsUfsLeMHHju0CydWLUx7bdR
         JX+grsuYuOmckMHkfiON0BfKtP3vMSu9WdYsEpwrSFOST9bGOsxX2xAjLmz14iItcMPl
         eTLk9D1s/yBH0PhhDaukSyTz53eTf7OQPeuhZU5py/C6tal4RrAa1po5nYh8XpeyE+B3
         7Xo/D+hpFXy9iVLjx0ts7+ZYXc6UfKjCseg+DMCUKIO1KYJLXRpMPZnmOV9V10Zu6VWk
         50lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765751560; x=1766356360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KcFIYG8pThrquY7+bXzMj2jE6v828zltZDO7Yqjwkw8=;
        b=s8ESPEFr8XTI1/FGisr0MVzWyFUgH5pTCU90e96dtz7Ptj9mLHVjCCh33xo0LRIcjw
         nijwP/MYChJWqtWt6QEy+11C45oYIM1c2ZrdgvPHZEnsFwLBT63vg5kixZXyLiGAVDpE
         C5IaFMoC6tVMEwfCnFFISBvZkaq3DH19FymkUeMhYoZ5VfScMXfh07CBmW9f5aU46t8Z
         evsnmy489pn3MdpeiAvORB3uW9wW6I16yr8iEBi4s01OWiDYD1AQi959BJeJTE4KCUHt
         7MEtehKIHkdKimjKuRnseGetzSTHHReAvTGP6BzvQ0QnAREvMuhhjX8sciCofcRSWwO4
         njAw==
X-Forwarded-Encrypted: i=1; AJvYcCUrY3rjadXekycLilDdNAgZyse07pBfmJDOcw7pcQYkvJ41x1dbcxxdVQWRJuIIdLSJ2GLXNpuH8OHpvuCkBn9I@lists.infradead.org
X-Gm-Message-State: AOJu0YyBmPtiQnpbXIKrEOEHIr4k/sBR5RkHqIqVK5DDMiJsDARNGkW+
	LaMx6MEmDouQzsrM8L1vW4KD+exzOosRmrHvNA6fiHczGj1Qu0kktpsCQ68RAA7mrw==
X-Gm-Gg: AY/fxX6OrCd4SGiqOqKssitqh3W4n805ZTMKDtMTYG22DHJDkTxRvDGIxnnDh0BgO+f
	PFLI6q2rmpEglt7u56dk567HjLGvFT5hG0V1sOd+AgSZBPbCccRAXNbzhYucN6dZ5ZZ5iaZmhxq
	TxHwX9GKxpz1OogOEVuvIH12mDTrgowETmeyT3wfEg3lr/Q7A8wBjCBflbsrt10awwTlZ7Ukwhx
	ZQu8U8hl2g4vcnQYgAeToKTP6zeXReKweFpOLmRO16/pzwkFWOicxe+g0252kU56lTETvHZZuu/
	p1C0qUO006Rxi4vSstOs73gf2L5u56tqzuLXTYrnNHRmKhp+b7scgyC3i9xs6tY+z6hgA8/8GLr
	FbzcBGbmZd7CbypuX8dCG9z5bnMBuDb2s6LC3tHCWcPw2n6Yfq8vluiEqa2F+ITaJZI3VVSz+GM
	Ghl2GjauO0VCwDrOmC+R9PRpAIGP0zLDv16q10ezCPOabbKWG5sw==
X-Google-Smtp-Source: AGHT+IE3eRhVbzGegcHa1xcNo46EdXefsnSGCiZbU0jrtHUdR0mYYs0/N/wqhHRGzTlCZ8FRslGcTw==
X-Received: by 2002:a05:600c:c3c1:20b0:477:b358:d7aa with SMTP id 5b1f17b1804b1-47a94876b6cmr1087625e9.18.1765751559808;
        Sun, 14 Dec 2025 14:32:39 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fb38a977esm17818592f8f.12.2025.12.14.14.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 14:32:39 -0800 (PST)
Date: Sun, 14 Dec 2025 22:32:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com
Subject: Re: [PATCH rc v3 1/4] iommu/arm-smmu-v3: Add ignored bits to fix STE
 update sequence
Message-ID: <aT87A1ur4htPjM5T@google.com>
References: <cover.1765334526.git.nicolinc@nvidia.com>
 <cc0d4ab571e2e789ee1cddfa035379dc54f0601b.1765334526.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc0d4ab571e2e789ee1cddfa035379dc54f0601b.1765334526.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_143242_643774_432EF8BB 
X-CRM114-Status: GOOD (  41.02  )
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

Hi Nicolin,

On Tue, Dec 09, 2025 at 06:45:16PM -0800, Nicolin Chen wrote:
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
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  2 ++
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 19 ++++++++++++---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 24 +++++++++++++++----
>  3 files changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index ae23aacc3840..d5f0e5407b9f 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -900,6 +900,7 @@ struct arm_smmu_entry_writer {
>  
>  struct arm_smmu_entry_writer_ops {
>  	void (*get_used)(const __le64 *entry, __le64 *used);
> +	void (*get_ignored)(__le64 *ignored_bits);
>  	void (*sync)(struct arm_smmu_entry_writer *writer);
>  };
>  
> @@ -911,6 +912,7 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
>  
>  #if IS_ENABLED(CONFIG_KUNIT)
>  void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits);
> +void arm_smmu_get_ste_ignored(__le64 *ignored_bits);
>  void arm_smmu_write_entry(struct arm_smmu_entry_writer *writer, __le64 *cur,
>  			  const __le64 *target);
>  void arm_smmu_get_cd_used(const __le64 *ent, __le64 *used_bits);
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> index d2671bfd3798..3556e65cf9ac 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> @@ -38,13 +38,16 @@ enum arm_smmu_test_master_feat {
>  static bool arm_smmu_entry_differs_in_used_bits(const __le64 *entry,
>  						const __le64 *used_bits,
>  						const __le64 *target,
> +						const __le64 *ignored,
>  						unsigned int length)
>  {
>  	bool differs = false;
>  	unsigned int i;
>  
>  	for (i = 0; i < length; i++) {
> -		if ((entry[i] & used_bits[i]) != target[i])
> +		__le64 used = used_bits[i] & ~ignored[i];
> +
> +		if ((entry[i] & used) != (target[i] & used))
>  			differs = true;
>  	}
>  	return differs;
> @@ -56,12 +59,18 @@ arm_smmu_test_writer_record_syncs(struct arm_smmu_entry_writer *writer)
>  	struct arm_smmu_test_writer *test_writer =
>  		container_of(writer, struct arm_smmu_test_writer, writer);
>  	__le64 *entry_used_bits;
> +	__le64 *ignored;
>  
>  	entry_used_bits = kunit_kzalloc(
>  		test_writer->test, sizeof(*entry_used_bits) * NUM_ENTRY_QWORDS,
>  		GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_NULL(test_writer->test, entry_used_bits);
>  
> +	ignored = kunit_kzalloc(test_writer->test,
> +				sizeof(*ignored) * NUM_ENTRY_QWORDS,
> +				GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test_writer->test, ignored);
> +
>  	pr_debug("STE value is now set to: ");
>  	print_hex_dump_debug("    ", DUMP_PREFIX_NONE, 16, 8,
>  			     test_writer->entry,
> @@ -79,14 +88,17 @@ arm_smmu_test_writer_record_syncs(struct arm_smmu_entry_writer *writer)
>  		 * configuration.
>  		 */
>  		writer->ops->get_used(test_writer->entry, entry_used_bits);
> +		if (writer->ops->get_ignored)
> +			writer->ops->get_ignored(ignored);
>  		KUNIT_EXPECT_FALSE(
>  			test_writer->test,
>  			arm_smmu_entry_differs_in_used_bits(
>  				test_writer->entry, entry_used_bits,
> -				test_writer->init_entry, NUM_ENTRY_QWORDS) &&
> +				test_writer->init_entry, ignored,
> +				NUM_ENTRY_QWORDS) &&
>  				arm_smmu_entry_differs_in_used_bits(
>  					test_writer->entry, entry_used_bits,
> -					test_writer->target_entry,
> +					test_writer->target_entry, ignored,
>  					NUM_ENTRY_QWORDS));
>  	}
>  }
> @@ -106,6 +118,7 @@ arm_smmu_v3_test_debug_print_used_bits(struct arm_smmu_entry_writer *writer,
>  static const struct arm_smmu_entry_writer_ops test_ste_ops = {
>  	.sync = arm_smmu_test_writer_record_syncs,
>  	.get_used = arm_smmu_get_ste_used,
> +	.get_ignored = arm_smmu_get_ste_ignored,
>  };
>  
>  static const struct arm_smmu_entry_writer_ops test_cd_ops = {
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d16d35c78c06..e22c0890041b 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1082,6 +1082,12 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_used);
>  
> +VISIBLE_IF_KUNIT
> +void arm_smmu_get_ste_ignored(__le64 *ignored_bits)
> +{
> +}
> +EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_ignored);
> +
>  /*
>   * Figure out if we can do a hitless update of entry to become target. Returns a
>   * bit mask where 1 indicates that qword needs to be set disruptively.
> @@ -1094,13 +1100,22 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
>  {
>  	__le64 target_used[NUM_ENTRY_QWORDS] = {};
>  	__le64 cur_used[NUM_ENTRY_QWORDS] = {};
> +	__le64 ignored[NUM_ENTRY_QWORDS] = {};

I think we can avoid extra stack allocation for another STE, if we make
the function update cur_used directly, but no strong opinion.

>  	u8 used_qword_diff = 0;
>  	unsigned int i;
>  
>  	writer->ops->get_used(entry, cur_used);
>  	writer->ops->get_used(target, target_used);
> +	if (writer->ops->get_ignored)
> +		writer->ops->get_ignored(ignored);
>  
>  	for (i = 0; i != NUM_ENTRY_QWORDS; i++) {
> +		/*
> +		 * Ignored is only used for bits that are used by both entries,
> +		 * otherwise it is sequenced according to the unused entry.
> +		 */
> +		ignored[i] &= target_used[i] & cur_used[i];
> +
>  		/*
>  		 * Check that masks are up to date, the make functions are not
>  		 * allowed to set a bit to 1 if the used function doesn't say it
> @@ -1109,6 +1124,7 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
>  		WARN_ON_ONCE(target[i] & ~target_used[i]);
>  
>  		/* Bits can change because they are not currently being used */
> +		cur_used[i] &= ~ignored[i];
>  		unused_update[i] = (entry[i] & cur_used[i]) |
>  				   (target[i] & ~cur_used[i]);
>  		/*
> @@ -1207,12 +1223,9 @@ void arm_smmu_write_entry(struct arm_smmu_entry_writer *writer, __le64 *entry,
>  		entry_set(writer, entry, target, 0, 1);
>  	} else {
>  		/*
> -		 * No inuse bit changed. Sanity check that all unused bits are 0
> -		 * in the entry. The target was already sanity checked by
> -		 * compute_qword_diff().
> +		 * No inuse bit changed, though ignored bits may have changed.
>  		 */
> -		WARN_ON_ONCE(
> -			entry_set(writer, entry, target, 0, NUM_ENTRY_QWORDS));
> +		entry_set(writer, entry, target, 0, NUM_ENTRY_QWORDS);

After this change, no other caller uses the entry_set() return value, so it
can be changed to return void.

>  	}
>  }
>  EXPORT_SYMBOL_IF_KUNIT(arm_smmu_write_entry);
> @@ -1543,6 +1556,7 @@ static void arm_smmu_ste_writer_sync_entry(struct arm_smmu_entry_writer *writer)
>  static const struct arm_smmu_entry_writer_ops arm_smmu_ste_writer_ops = {
>  	.sync = arm_smmu_ste_writer_sync_entry,
>  	.get_used = arm_smmu_get_ste_used,
> +	.get_ignored = arm_smmu_get_ste_ignored,
>  };
>  

I have some mixed feelings about this, having get_used(), then get_ignored()
with the same bits set seems confusing to me, specially the get_ignored()
loops back to update cur_used, which is set from get_used()

My initial though was just to remove this bit from get_used() + some changes
to checks setting bits that are not used would be enough, and the semantics
of get_used() can be something as:
“Return bits used by the updated translation regime that MUST be observed
atomically” and in that case we can ignore things as MEV as it doesn’t
impact the translation.

However, this approach makes it a bit explicit which bits are ignored, if we
keep this logic, I think changing the name of get_ignored() might help, to
something as "get_allowed_break()" or "get_update_safe()"?

Thanks,
Mostafa

>  static void arm_smmu_write_ste(struct arm_smmu_master *master, u32 sid,
> -- 
> 2.43.0
> 

