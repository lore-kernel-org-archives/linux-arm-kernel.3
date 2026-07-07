Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56500C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCHfMn1isXXOGBYF1cLNW7WhWweWyXtBiUjIq8H8qFU=; b=cfYn3r/NLdULLQDxEsYCibctQi
	BuySxS6d6YufVoMwM43nNQ/vKJzVgbyhv9kDej5Di3pgqBK/VsJ/Ah84qWiGs2m1mIyuAT4PcyaFp
	g1zlw62Y6fTRqv5GQE3G/l8mBYmQEqrmsSbsouJtcQSPaT4iQ7WuqwVAHkJjiPWTevgdsDFHW5wzf
	5/1my+JIuNVmHqptxrAvYn+i1Nve7XGXpIXymmerjK0TTDLZbntbecKUe5Phwf6N6U75j8PJyT7n6
	wy9TOmKfOC8GC4A2c7ujzZ8zRZY1Q+3ysV2gTq4j+kX1MQR0a3vYmtSIXL4ghx/S/M7MY819V2Joe
	nXqBdnBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4GV-0000000Esrl-0Jnb;
	Tue, 07 Jul 2026 11:47:03 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4GS-0000000EsrD-2neQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:47:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493c556ada3so34805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 04:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783424819; x=1784029619; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCHfMn1isXXOGBYF1cLNW7WhWweWyXtBiUjIq8H8qFU=;
        b=B7YLlEx6LhTnjqtXlpe5vTnuF3MVeOJNctVVg5qDGMrcNftGwEm+1c05NwZm17oaba
         GNAHzgxGF3EeGm+LmGPgqTv8aEPx/ZZxHf5CGQByytMWQ54u67eLXE6PAoRSqiYJue3r
         FiMo2ndgSmxgdGVTvu0/2D2R1HlmIEDo1Cw/mc00qDpaGGnCMt2rSWqnLVX75+MIOzNO
         al/VNGbdRkYq5R+OS1QeLf5w7uYDM0x/91sfdihY3zZGhMJEaWzVMj01SUEIR6o5lF0P
         JKnCgRMLI0Iqnq26zUmWNl0DjPXtnuycnQOE4zW37UvIFOkw89M+0ZP19QEdZUyjo3bY
         NQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783424819; x=1784029619;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCHfMn1isXXOGBYF1cLNW7WhWweWyXtBiUjIq8H8qFU=;
        b=TcKQva9HkwwkYa61BOXr4lfEjTqYCkOeJhyGHi/L9f9FCZWHRUDu36AJ3yNCegzmsA
         PGKqteFumaLRJE4uhkqF3QfMPCwdywyIQ7in4hoUOusdE1AfgEKqKQMAu7S2plnSQCMj
         HtT/a/2ujdumnRDUuT014RBLPdi9FKkWRuxN1iBjPgEF/BcXSv9bfB7Y4Qztxs+LapVA
         sD6dZnRCwFfCOZBHj83aygy0Y/oXRMmrDQB/FQCPs16cQy7xfOPYzlFpFLolNxODlMLm
         8cy7daUZXA1Yc3giD8fTfzHgk+54OOF0ppaTBFSXhbHGA/GJ3Wo6P9DrEZRjnwpZBcZN
         6Iag==
X-Forwarded-Encrypted: i=1; AHgh+RpsSrXL7aF+obk7j1Q8eLtc8+GJwlemSSmQlmd3UrFnv2zd//0mlf77+Io5IrsSv8XnW6R5DGx1LfE5n+n4ghZV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3TmAguHHEsyoxUERiwrdYpe3bU/v5vtNAjfejqn90wa+7SPLl
	gy8tVw263EvM/0CKSUqd1B/wjuz5kkgtKzi0oEB71SkXlXt7hUkDZI1QMcEek2UhNw==
X-Gm-Gg: AfdE7cnb7g44rc2Gn4XqJ/Lpi5l7zNsm9wHlV7+tzxzPQ8aT0FjQakfXaYpKEzUJy2b
	Q8Ph+nX+SvXO8z71PMjrWKGpADiCV82bGvXXU7QLt7//OgaTh7hqyuB+CuHH84s+NK6bMzOfF9K
	8ysEznqaOZFzYUQQPmFhmqC4RIAJ8BGLS6l8dgeeqk2eaM/u3eskHqhjOz2MbQq8kQimNqEWTTG
	QpDTBTOiJkPN8hSQOqRgyxf6zoLvyqOh8HQWBZwJkYTLsrX4hLZBFd0H3aoMnj5vWRc16CCYtK9
	TSR1lc4oesf2zrDCoR95peD5wPYoZLh1D0AmrU2tYrI3DxbXJDWexcd9z+Zq4zEX5J00xDP6//c
	bB3KAa8N9+/YXRXKVANPIkRppzkgRqojmo/2dh+BhAbvpVqbwD9KPbqFkFEVNE1Oi8qF/3Tl7fa
	+d29aBF+sSF1aAg9f0k36e9RPb30k+n5oXucRIpkyLmHhbJm7L
X-Received: by 2002:a05:600c:604a:b0:45f:2940:d194 with SMTP id 5b1f17b1804b1-493e14ef934mr557925e9.2.1783424818179;
        Tue, 07 Jul 2026 04:46:58 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm32893908f8f.24.2026.07.07.04.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:46:57 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:46:51 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v2 4/8] iommu/arm-smmu-v3: Keep track in the
 arm_smmu_invs if RIL is used
Message-ID: <akznKwVE-Rc8ZjJN@google.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <4-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_044700_752108_3284AB79 
X-CRM114-Status: GOOD (  24.14  )
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

On Mon, Jul 06, 2026 at 01:26:41PM -0300, Jason Gunthorpe wrote:
> Summarize if any of the inv entries will use RIL. The next patch will use
> this to avoid RIL pre-calculations unless RIL is being used by the
> invalidation.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 30 +++++++++----------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 18 ++++++++---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  2 ++
>  3 files changed, 31 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> index add671363c828c..785dd21bd68b7a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> @@ -655,37 +655,37 @@ static void arm_smmu_v3_invs_test_verify(struct kunit *test,
>  
>  static struct arm_smmu_invs invs1 = {
>  	.num_invs = 3,
> -	.inv = { { .type = INV_TYPE_S2_VMID, .id = 1, },
> -		 { .type = INV_TYPE_S2_VMID_S1_CLEAR, .id = 1, },
> -		 { .type = INV_TYPE_ATS, .id = 3, }, },
> +	.inv = { { .smmu = &smmu, .type = INV_TYPE_S2_VMID, .id = 1, },
> +		 { .smmu = &smmu, .type = INV_TYPE_S2_VMID_S1_CLEAR, .id = 1, },
> +		 { .smmu = &smmu, .type = INV_TYPE_ATS, .id = 3, }, },
>  };
>  
>  static struct arm_smmu_invs invs2 = {
>  	.num_invs = 3,
> -	.inv = { { .type = INV_TYPE_S2_VMID, .id = 1, }, /* duplicated */
> -		 { .type = INV_TYPE_ATS, .id = 4, },
> -		 { .type = INV_TYPE_ATS, .id = 5, }, },
> +	.inv = { { .smmu = &smmu, .type = INV_TYPE_S2_VMID, .id = 1, }, /* duplicated */
> +		 { .smmu = &smmu, .type = INV_TYPE_ATS, .id = 4, },
> +		 { .smmu = &smmu, .type = INV_TYPE_ATS, .id = 5, }, },
>  };
>  
>  static struct arm_smmu_invs invs3 = {
>  	.num_invs = 3,
> -	.inv = { { .type = INV_TYPE_S2_VMID, .id = 1, }, /* duplicated */
> -		 { .type = INV_TYPE_ATS, .id = 5, }, /* recover a trash */
> -		 { .type = INV_TYPE_ATS, .id = 6, }, },
> +	.inv = { { .smmu = &smmu, .type = INV_TYPE_S2_VMID, .id = 1, }, /* duplicated */
> +		 { .smmu = &smmu, .type = INV_TYPE_ATS, .id = 5, }, /* recover a trash */
> +		 { .smmu = &smmu, .type = INV_TYPE_ATS, .id = 6, }, },
>  };
>  
>  static struct arm_smmu_invs invs4 = {
>  	.num_invs = 3,
> -	.inv = { { .type = INV_TYPE_ATS, .id = 10, .ssid = 1 },
> -		 { .type = INV_TYPE_ATS, .id = 10, .ssid = 3 },
> -		 { .type = INV_TYPE_ATS, .id = 12, .ssid = 1 }, },
> +	.inv = { { .smmu = &smmu, .type = INV_TYPE_ATS, .id = 10, .ssid = 1 },
> +		 { .smmu = &smmu, .type = INV_TYPE_ATS, .id = 10, .ssid = 3 },
> +		 { .smmu = &smmu, .type = INV_TYPE_ATS, .id = 12, .ssid = 1 }, },
>  };
>  
>  static struct arm_smmu_invs invs5 = {
>  	.num_invs = 3,
> -	.inv = { { .type = INV_TYPE_ATS, .id = 10, .ssid = 2 },
> -		 { .type = INV_TYPE_ATS, .id = 10, .ssid = 3 }, /* duplicate */
> -		 { .type = INV_TYPE_ATS, .id = 12, .ssid = 2 }, },
> +	.inv = { { .smmu = &smmu, .type = INV_TYPE_ATS, .id = 10, .ssid = 2 },
> +		 { .smmu = &smmu, .type = INV_TYPE_ATS, .id = 10, .ssid = 3 }, /* duplicate */
> +		 { .smmu = &smmu, .type = INV_TYPE_ATS, .id = 12, .ssid = 2 }, },
>  };
>  
>  static void arm_smmu_v3_invs_test(struct kunit *test)
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 1ad642e09eb92d..02323fd7709f07 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -988,6 +988,18 @@ static inline int arm_smmu_invs_iter_next_cmp(struct arm_smmu_invs *invs_l,
>  	return arm_smmu_inv_cmp(cur_l, &invs_r->inv[next_r]);
>  }
>  
> +static void arm_smmu_invs_update_caps(struct arm_smmu_invs *invs,
> +				      const struct arm_smmu_inv *inv)
> +{
> +	if (arm_smmu_inv_is_ats(inv))
> +		invs->has_ats = true;
> +
> +	if (!(inv->smmu->features & ARM_SMMU_FEAT_RANGE_INV))
> +		return;
> +
> +	invs->has_range_inv = true;
> +}
> +
>  /**
>   * arm_smmu_invs_for_each_cmp - Iterate over two sorted arrays computing for
>   *                              arm_smmu_invs_merge() or arm_smmu_invs_unref()
> @@ -1058,8 +1070,7 @@ struct arm_smmu_invs *arm_smmu_invs_merge(struct arm_smmu_invs *invs,
>  		 */
>  		if (new != new_invs->inv)
>  			WARN_ON_ONCE(arm_smmu_inv_cmp(new - 1, new) == 1);
> -		if (arm_smmu_inv_is_ats(new))
> -			new_invs->has_ats = true;
> +		arm_smmu_invs_update_caps(new_invs, new);
>  		new++;
>  	}
>  
> @@ -1169,8 +1180,7 @@ struct arm_smmu_invs *arm_smmu_invs_purge(struct arm_smmu_invs *invs)
>  
>  	arm_smmu_invs_for_each_entry(invs, i, inv) {
>  		new_invs->inv[num_invs] = *inv;
> -		if (arm_smmu_inv_is_ats(inv))
> -			new_invs->has_ats = true;
> +		arm_smmu_invs_update_caps(new_invs, inv);
>  		num_invs++;
>  	}
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 2fc695817671fe..3ef55f8af63d90 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -755,6 +755,7 @@ static inline bool arm_smmu_inv_is_ats(const struct arm_smmu_inv *inv)
>   *               Must not be greater than @num_invs
>   * @rwlock: optional rwlock to fence ATS operations
>   * @has_ats: flag if the array contains an INV_TYPE_ATS or INV_TYPE_ATS_FULL
> + * @has_range_inv: flag if any entry's SMMU supports range invalidation
>   * @rcu: rcu head for kfree_rcu()
>   * @inv: flexible invalidation array
>   *
> @@ -784,6 +785,7 @@ struct arm_smmu_invs {
>  	size_t num_trashes;
>  	rwlock_t rwlock;
>  	bool has_ats;
> +	bool has_range_inv;
>  	struct rcu_head rcu;
>  	struct arm_smmu_inv inv[] __counted_by(max_invs);
>  };
> -- 
> 2.43.0
> 

