Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D50C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1SvbCR97Zwgn4Jhcjeyc5rNgHzndad6U6YnbYiEVE4=; b=2e6C6HsRrvIA2N7uL3SV3Q8x5F
	aMojwxe9/loxUifzNEARoNQie/Luvmvsv7qYlHMmn0C9tGOjaY0+pWQQMiCWalhpFlQKW0PwEW9ge
	yy47i69Bc0+UPvwSulb3i3RdlTqZf8dD9tvUZi2hBK74y41xYfXlAiLlwKMixXl6GdJkbZBkBrbQu
	cHk/fCq8+FsCU1dW/EpPT9hBrKE36tSulG8v1C2lEV6LZhm3v0OfYHWOZm13cZOLK4QFh6/bStoJv
	Id5kRteSd6rKGaIVFEJ+CvfzRW8mNEEJLfzToUzhU2OHOXHV1HJlyyrOtt13P8iFoPN9RnmH+OaG2
	4YB9373A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDfB-00000005Er8-0zve;
	Fri, 10 Jul 2026 16:01:17 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDf8-00000005Eqe-3U5q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 16:01:15 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so1736346a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783699273; x=1784304073; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C1SvbCR97Zwgn4Jhcjeyc5rNgHzndad6U6YnbYiEVE4=;
        b=JFK0kqZ3wZpCQOhcpLpw/YW+I6e9rDVV6djWgtjMNKBJmWjt25NZZgbk+rAkwxkx8G
         MvkPv0GBXcwjFmDpqF+OFhG8prhnCWwStytTETV26YMcUqqjos8TbNMvLN62zqLEVUo7
         ct0P6XfxKVC6So4JosVgY7ODPnEzVswfd6ZvQQB0wjLgyMyjqEzQxmDonJhZmnz54Yld
         4bxv4DxqxN8ltLV7osqfYX+8iLgCcZQfEhkehnu0xT/eid9TX5iL9oWfXLktRujfkqhf
         Gu1e0H2BbinoFbHs1OpSxwU4xzsiXQNVIJY5i19Ie/tgupywu5U2GUeXit6AVjSHyQZS
         gSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699273; x=1784304073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1SvbCR97Zwgn4Jhcjeyc5rNgHzndad6U6YnbYiEVE4=;
        b=eMyQDr7LNcdolN/Lz0nQ68xUZYeqIbz0VuqK1BI8DR65TUbMtmUSvAs6wXEWuE+vYV
         YpCnurjupYecZmtgeiE2jpz01EcqYGvaXc0c+0VRSsneb2uc8iUJHhgA6Zu45NB+aVFz
         sMxcpzabmX3bPGZSjSk5Ey9nFHobmk5Y52cbQAjF0OxuBaWY3E8SvXMX4q29GI0IXwLY
         6WNiUimLi0a/rAOn45yPl/bLZ2CUo9TShAZPPJrvb+X/ZoFaBzwEzFLO9ROwDga4inuC
         apJecBPKCLpblgmRR+bRHICG0iR7QdpRC+BIH0dBKFlpYZWile4vdAK3mPE8OFk/EqeN
         HFPw==
X-Gm-Message-State: AOJu0YynGe7yoQH9o0THS3Wb5Xo1FolIO40kjKCWVeQ+mfCf6B/bZmMM
	xhnRDXF84DiVZlCWDi8mQCJOuOalWxwziP3NdMU7Um2ZgrdHirGcxKQ1IFuxFqnn7A==
X-Gm-Gg: AfdE7cloYVQWcVaXBEfM9rP5qHDbHvXJd/l7DluBf2Q/nnjBoGOyXjUED7NrA4ORYKS
	GqoB7FZtgLX9H2Z10vgi4xRYMzlqyhss4bu79oq0bh40uroxCFQ4MeAo6hb0vDUDDcwwJzWlTIW
	Np8BQAksz9910mkM10T++2sX334D0wK+5pmHNvOKDAmFdasYVmuf08hx9dxa/F2hgeBwSb18fou
	Qak4RCUNDT0tEXS3Ls5Unnxhbf2OqOR9TQPSHpl2gcMSGdenaHlC5U3XoSTxTzdAXiNe34HQ9j+
	kQsJQ9ChY5MDtYwnCXaznXvqG5uugM4si6Fi1C6n6SWq6ww9Aey5b56LJg7mP97D4WSXUtEaqR2
	Qj+Csr72D/65rrAktFArzVsHi6KxA3RXnLUPhfQbWzU3ownw17sOH8kN7pM0xZ7n+PR24IudYmL
	2edb5JqHc7FA9YsBN2cPLzmGW2Q46ESu4Hl8EgqW1wHnHuX4OPY1E=
X-Received: by 2002:a05:6402:4288:b0:698:9be1:4a48 with SMTP id 4fb4d7f45d1cf-69ab44aafe2mr5035845a12.33.1783699272374;
        Fri, 10 Jul 2026 09:01:12 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd87d6sm11239809a12.6.2026.07.10.09.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:01:11 -0700 (PDT)
Date: Fri, 10 Jul 2026 17:01:07 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 16/25] iommu/arm-smmu-v3-kvm: Add CMDQ functions
Message-ID: <alEXQ2X_0XQylvw-@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-17-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501111928.259252-17-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_090114_886707_3F6DF889 
X-CRM114-Status: GOOD (  26.28  )
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

On Fri, May 01, 2026 at 11:19:18AM +0000, Mostafa Saleh wrote:
> Add functions to access the command queue, there are 2 main usage:
> - Hypervisor's own commands, as TLB invalidation, would use functions
>   as smmu_send_cmd(), which creates and sends a command.
> - Add host commands to the shadow command queue, after being filtered,
>   these will be added with smmu_add_cmd_raw.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  14 ++-
>  .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 107 ++++++++++++++++++
>  2 files changed, 115 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index f904f4d19609..3fc499608d76 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -1156,19 +1156,21 @@ u32 smmu_idr5_to_oas(u32 reg);
>  unsigned long smmu_idr5_to_pgsize(u32 reg);
>  
>  /* Queue functions shared between kernel and hyp. */
> -static inline bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
> +static inline u32 queue_space(struct arm_smmu_ll_queue *q)
>  {
> -	u32 space, prod, cons;
> +	u32 prod, cons;
>  
>  	prod = Q_IDX(q, q->prod);
>  	cons = Q_IDX(q, q->cons);
>  
>  	if (Q_WRP(q, q->prod) == Q_WRP(q, q->cons))
> -		space = (1 << q->max_n_shift) - (prod - cons);
> -	else
> -		space = cons - prod;
> +		return (1 << q->max_n_shift) - (prod - cons);
> +	return cons - prod;
> +}
>  
> -	return space >= n;
> +static inline bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
> +{
> +	return queue_space(q) >= n;
>  }
>  
>  static inline bool queue_full(struct arm_smmu_ll_queue *q)
> diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> index 3b77796dafc7..aac455599728 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> @@ -6,6 +6,7 @@
>   */
>  #include <asm/kvm_hyp.h>
>  
> +#include <nvhe/clock.h>
>  #include <nvhe/iommu.h>
>  #include <nvhe/mem_protect.h>
>  #include <nvhe/trap_handler.h>
> @@ -22,6 +23,31 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
>  
>  #define cmdq_size(cmdq)	((1 << ((cmdq)->llq.max_n_shift)) * CMDQ_ENT_DWORDS * 8)

I only looked at that smmu_wait() as this is the hyp_clock_ns() caller.

>  
> +/*
> + * Wait until @cond is true.
> + * Return 0 on success, or -ETIMEDOUT

nit: Would be nice to explain use_wfe. 

> + */
> +#define smmu_wait(use_wfe, _cond)					\

nit:, (__use_wfe, __cond), or (use_fw, cond)

> +({									\
> +	int __ret = 0;							\
> +	u64 delay = hyp_clock_ns() + ARM_SMMU_POLL_TIMEOUT_US * 1000;	\

Does it help to lower the risk for the 128-bits fallback if we keep the
resolution to _us?

Also, ARM_SMMU_POLL_TIMEOUT_US seems to be 1s. Blocking that long at EL2 is
really terrible. Any chance to lower that? 

> +									\
> +	while (!(_cond)) {						\
> +		if (use_wfe) {						\
> +			wfe();						\
> +			if ((_cond))					\

nit: I believe there's no need for the double () here is there?

> +				break;					\
> +		} else {						\
> +			cpu_relax();					\
> +		}							\
> +		if (hyp_clock_ns() >= delay) {				\
> +			__ret = -ETIMEDOUT;				\
> +			break;						\
> +		}							\
> +	}								\
> +	__ret;								\
> +})
> +

[...]

