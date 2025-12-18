Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF6AD6E2B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRFRUlPQs8MYfoHIvjqzyVwd6BTDQoSUt9sR2u7yUCw=; b=CbzRVUUGgp/HjEIxeVvNt7/u2x
	TSYyvemasgTFFydTVO3j9FTrv0NAVdSzCUs6xHN2R+q279/pQk/wcqdIucY9lGAARC3+yLEHxnuEf
	R7xwA8Erom9JCeYV5FlCldRd5ucC2Yxbk+A8d1Co0gsAKaJUXvDGmyjl75Df8ko6oL6IArfW2an01
	VT7lxH9uQI8fgzyEvR54zPx/5wFmn+WfaEK0vkhJG67kT/LJ8JRb1CPqy0AbiTVHnNcoyFelVZH9O
	cB73Cn2djyhAsRkef5Pj4k0JB5fq7vMHIh8+2qwxqvd2nHFndgfaKt0X9IowTf3recjQ7C5n6nVT0
	xfOey7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWH2x-00000008q78-1sjy;
	Thu, 18 Dec 2025 16:40:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWH2u-00000008q6k-36R8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:40:09 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4779a4fb9bfso65945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766076006; x=1766680806; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TRFRUlPQs8MYfoHIvjqzyVwd6BTDQoSUt9sR2u7yUCw=;
        b=nECg1OE6gLuR76mquc3A4/xnkeB4D47OnKxjMIRbvrV+nXnNe/7DdaU6ZpMtO4ZPA6
         KzuyrHlJPPylnZeboIREdzovYfaeYKyf0gMJqy10eHYYPpBo7BvENxSSJXcuHKzxRtT4
         fVT53N56IWje1nwsD5QhGgm58hF+lTt+JtpLO/TBR0Ri//8eS3V0GGE7bj0L31rKli6O
         06eb5sS8iuIn2aVLOIvbRSOR5paePSH93JuWvUmtDQqauZhtPKkWDZO2Yg3hcvmSJ9rG
         vrK1HsvkoOysO4WWyEBqSJ/fcRV7vnRh7rlUXHR3J9i4W6dp5kQYM+xK3Mi3Gg+70wHB
         agIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766076006; x=1766680806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRFRUlPQs8MYfoHIvjqzyVwd6BTDQoSUt9sR2u7yUCw=;
        b=fDrCeVCtLeIVd3jC5eH+2gK3XYenBEKkUmCGRYAU7+ZyzCFOAspW5CKn0vVriZEHgk
         FgevlNPfiyrUcWQ/os7tHIRW+p5gE1mhxOHIl4LK8K4eMBlZTnkt3jzE7F3wFH22RXPO
         jQQxejAsoERvkxs8ewaCY8BofVzT71ExwSi/dIJ5bZMX0qMvNIsUu8nTHk+Cy9l/HqOr
         xP4R9wpU7mIaZD+vXY3JmYS+NG7YXyYsZgvsgGBpFHZMscFqg3AEkCn05myQKrMzkpt0
         v1iVl9nzN88vMPTE7NVFuyzqInGS0Rgbl+PfLrNU98uNzohkS0SqaYxsrQvG/FASMm2g
         Z39Q==
X-Forwarded-Encrypted: i=1; AJvYcCWV//Tx0BTdZxTM5GjijaXG0cNhWVzJkVFHjyK8IZZzRb0bt/ZSfJ/47N/Epglc2e+joQlZwn7FVi3/ZfLJetF6@lists.infradead.org
X-Gm-Message-State: AOJu0YwJse6zi7LKIOyPO1KQVl2YWA5tx/Z/6oOzzSzksOGSRK+wI+Do
	gja9DDWSTDxTVHn1swEi5VKrIyFLPut44lXEl9fC+G9yIcbtOPMR825AX1GCoprJ1A==
X-Gm-Gg: AY/fxX5ZjrExpApUwu6SLqR3Cg2Cp+B7AaIBfhCVppMVhf9d9/ZChSh0LnNWzNPViCM
	fBeOGAn9s8lWElBXccTgjgx9D5ZNEGOj+n7qbyDs5WuoV8brYjwM3InFIx0BPNr89VbX2gyeKXZ
	LqZxC/D0cr6CBNy5370oQICgAUovUll61bGxcql4wNH/oJYF3l0FcPM8zGHk2kdUc9LkbOdc7n7
	4EemZrmvPw07H3bHdksOrJU78F0JnMA4AZiT6yQMrvZMAqPkpkhZAGpIG25AIAwWfmPtmuouFli
	NcKBKMWBRnXTZzqhBkXINRvr4QD4B3SRQMtJIc3HWCb7rKaTaB/rCsxvSE/JrD16VqM8MSlM1C7
	8+oRjBm/Lq5zpfSr528LJj3V1xeadorwu1uck2nZ4KPAo7ALrpE9OUBu0/Fu8VzqIqQU/26Yt42
	/ZWwRp3GiVqViMO3wv004M+h/NWNSdef0wHJF1TIio/jPBkBGNy70SQq3LQGSsIoI=
X-Google-Smtp-Source: AGHT+IEnzK0PXYLJ2CtrM/k+L6oaX+v8+Z0MPC6Rku7+YPKhOOkiOz08QlgBURzh2lCV3l64uptpTw==
X-Received: by 2002:a05:600c:c0dc:b0:477:95a8:2565 with SMTP id 5b1f17b1804b1-47be3cb2944mr935195e9.16.1766076005857;
        Thu, 18 Dec 2025 08:40:05 -0800 (PST)
Received: from google.com (171.85.155.104.bc.googleusercontent.com. [104.155.85.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43244998ca0sm5816810f8f.32.2025.12.18.08.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 08:40:05 -0800 (PST)
Date: Thu, 18 Dec 2025 16:40:01 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com
Subject: Re: [PATCH rc v4 1/4] iommu/arm-smmu-v3: Add update_safe bits to fix
 STE update sequence
Message-ID: <aUQuYdFKYlFeQGCg@google.com>
References: <cover.1765945258.git.nicolinc@nvidia.com>
 <58f5af553fa7c3b5fd16f1eb13a81ae428f85678.1765945258.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58f5af553fa7c3b5fd16f1eb13a81ae428f85678.1765945258.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_084008_850569_53E14D84 
X-CRM114-Status: GOOD (  40.23  )
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

On Tue, Dec 16, 2025 at 08:25:59PM -0800, Nicolin Chen wrote:
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

I have been looking at this, as before, target was not masked at all, so
I'd expect it would be only masked with (~safe[i]) and not used.

But I think that is OK, as we only care about the used bits in the cur
entry and how it's different from target, and target is either the
acutal target or the initial STE so it musn't have any unused bits set.
So that should be fine I believe,

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

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

