Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3886C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJcS26LBUOhpjAbenzEObokE4HdnvqfrqILTFguP4A8=; b=SOnnpIbfnMqGwWEvJDc1+xz0pD
	2lwR/W1pKWuurcaaJao6zbwVEPjJx5x/Qv0cpcxSwR0X4hK7JqUEqrylKCeqnwaTwH1kUmmUiwimt
	8Iljym9LyxwHvG7Jh4lPyLtzz488qr/VoIASBM9aIM1rjb9UPKlOnLNDrpIVzL5dplTrSdOzACeMe
	wqDg1HiN0h+2ZKGsDkqwYquwtW+GglToz1rE+4/5FpwqeV7yp3uJNhl5v2Hph+bIJpCBlY9ai8nue
	LKSqicx1hEcjcjs9bKt7K2Ivjblrlxm5QOwTOxPfu8pgPaPo7Nl5kjljCsyN0Z2L2VzldjH502Sll
	v7joq21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTvE-000000093HJ-16Rh;
	Wed, 26 Mar 2025 16:48:08 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTsG-000000092v9-16zV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 16:45:05 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so3358566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 09:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743007503; x=1743612303; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJcS26LBUOhpjAbenzEObokE4HdnvqfrqILTFguP4A8=;
        b=BW7HInq6iYxumQ+p8VvscG73Qdrk9AnqTTdq680bhHlGSlcCfvfV8ZFkhArSTTg/pI
         PsyuoVqgUdy9u3JLOLnHgE/ataWRstY9zX8wRFX859iwJqpWnfQWQO3etDqLf+FAwRAs
         Y+ef1wqSxF8xa9YEQoz8hEcDgMiP/G+1pYOdb0/q3PkmmIzYIFTIORAbl+MBNXNh4ymO
         KXTjU3cRfS9gEXUD+ec0cr2i2pXyHb1RZgok32KALt/kcb5F5HA9E9x7Hnp3lZb8J6IP
         YmlkR2qGqpK9S6H/AV7ez3i3WEwP6VURjybr5O1sAX5+CLDGy9XRHz+6hmHHTswukyRY
         YGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743007503; x=1743612303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJcS26LBUOhpjAbenzEObokE4HdnvqfrqILTFguP4A8=;
        b=Mg2v5bTBKRc82ZvnQ5p2H/SWAxaSxel7otnJ9rOpxAO3eYOrnrhsV8Ydglk0mLerbh
         6HBfAeydhdIMFc/IvQy6fCIlGzkf6JxCYP53x7LCUOf5GTgIzPbmtJyyXp0aa7+cNqeT
         hvnnyryNIn8Of1IRRlNpf96ZCGRHpJNzgUPB79WeW6KViyjbQOiDo3V52kXKxs9Yi3aY
         iV14BFgx7u7Nfk0mdPGS53i/XzezIvqefQ3RR7S+EmLXETyqv1iEucuhGMbyCHggSg8b
         o1uIPYe0P/y+nBKISNCJf8ZJ9oKX3zAAuLanANBEjaiyNrFJqHTkKKpR4Ur4CjzoUn9X
         mD0A==
X-Forwarded-Encrypted: i=1; AJvYcCVnoZ9hWM+04wuxQxOhpNwZkmpaq62M2Nvg/HB1LWmK2AFNikurAYLEjLc71F1Od7dNBl2yfvGT1MF2KignBe79@lists.infradead.org
X-Gm-Message-State: AOJu0YxREwhjx9I00giBskF2EHi9tz+CzFHslkqHzvWQLWPIIXeWeC2z
	oTZolZlmpFsmbTZDmEwyw27EnRNFwidbiwR0deEU76CXEt+sIt3nIAAuqJEyUg==
X-Gm-Gg: ASbGncv3PqIEMvrmiJ5g02gHEhN8nFaqKLGFQxObEqvOjdq4yUc87eR9Y/Tm9mrMAGT
	E1E2X1Mvx/uPLRxsNTGeeyT6edmxeNIoljrjNftMQ5mquwouKLQj1kHtarWC8eAUnGRitF30dFg
	cC9EF4L+iIpQXJTaGr5iGAk5m7NOmdViHzpwa0qBBWTRurQZkVCyS9LgHpPu6ENpbYqgH03Fc7B
	Tef2JoT6UVye4Sk7Appm3Dr3mYpQd0Qt+lgS6LNrbo8UikCZt6InM1NSkGdltGkK+HasK8mRzfH
	Pq/BwCY9Oq7jo8NbElNsDGVmVp1lorFlGSjJovGxMA0KS5WxGt0YH9LKP7bqgva4DIBPFfkkTQs
	b+KI=
X-Google-Smtp-Source: AGHT+IGOVJHC73PxBi8VOaVjs2DbOvsUBkfBcTBTYm45C4g3UAljCGATrWdzKXaReM4hH2C/WCgTfg==
X-Received: by 2002:a17:907:1b10:b0:ac4:3d0:8bc8 with SMTP id a640c23a62f3a-ac6fb0fcd76mr8333166b.35.1743007502398;
        Wed, 26 Mar 2025 09:45:02 -0700 (PDT)
Received: from google.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb52279sm1052173966b.116.2025.03.26.09.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 09:45:01 -0700 (PDT)
Date: Wed, 26 Mar 2025 16:44:58 +0000
From: Quentin Perret <qperret@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	will@kernel.org, yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v4 2/3] firmware: arm_ffa: Move the ffa_to_linux
 definition to the ffa header
Message-ID: <Z-QvCvGBCtkxNG-e@google.com>
References: <20250326113901.3308804-1-sebastianene@google.com>
 <20250326113901.3308804-3-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326113901.3308804-3-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_094504_308565_98DD4009 
X-CRM114-Status: GOOD (  24.66  )
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

On Wednesday 26 Mar 2025 at 11:39:00 (+0000), Sebastian Ene wrote:
> Keep the ffa_to_linux error map in the header and move it away
> from the arm ffa driver to make it accessible for other components.
> 
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

Reviewed-by: Quentin Perret <qperret@google.com>

> ---
>  drivers/firmware/arm_ffa/driver.c | 26 --------------------------
>  include/linux/arm_ffa.h           | 27 +++++++++++++++++++++++++++
>  2 files changed, 27 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index 2c2ec3c35f15..3f88509a15b7 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -61,30 +61,6 @@
>  
>  static ffa_fn *invoke_ffa_fn;
>  
> -static const int ffa_linux_errmap[] = {
> -	/* better than switch case as long as return value is continuous */
> -	0,		/* FFA_RET_SUCCESS */
> -	-EOPNOTSUPP,	/* FFA_RET_NOT_SUPPORTED */
> -	-EINVAL,	/* FFA_RET_INVALID_PARAMETERS */
> -	-ENOMEM,	/* FFA_RET_NO_MEMORY */
> -	-EBUSY,		/* FFA_RET_BUSY */
> -	-EINTR,		/* FFA_RET_INTERRUPTED */
> -	-EACCES,	/* FFA_RET_DENIED */
> -	-EAGAIN,	/* FFA_RET_RETRY */
> -	-ECANCELED,	/* FFA_RET_ABORTED */
> -	-ENODATA,	/* FFA_RET_NO_DATA */
> -	-EAGAIN,	/* FFA_RET_NOT_READY */
> -};
> -
> -static inline int ffa_to_linux_errno(int errno)
> -{
> -	int err_idx = -errno;
> -
> -	if (err_idx >= 0 && err_idx < ARRAY_SIZE(ffa_linux_errmap))
> -		return ffa_linux_errmap[err_idx];
> -	return -EINVAL;
> -}
> -
>  struct ffa_pcpu_irq {
>  	struct ffa_drv_info *info;
>  };
> @@ -238,8 +214,6 @@ static int ffa_features(u32 func_feat_id, u32 input_props,
>  	return 0;
>  }
>  
> -#define PARTITION_INFO_GET_RETURN_COUNT_ONLY	BIT(0)
> -
>  /* buffer must be sizeof(struct ffa_partition_info) * num_partitions */
>  static int
>  __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index 74169dd0f659..cdaa162060f4 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -223,6 +223,9 @@ extern const struct bus_type ffa_bus_type;
>  /* The FF-A 1.0 partition structure lacks the uuid[4] */
>  #define FFA_1_0_PARTITON_INFO_SZ	(8)
>  
> +/* Return the count of partitions deployed in the system */
> +#define PARTITION_INFO_GET_RETURN_COUNT_ONLY	BIT(0)
> +
>  /* FFA transport related */
>  struct ffa_partition_info {
>  	u16 id;
> @@ -475,4 +478,28 @@ struct ffa_ops {
>  	const struct ffa_notifier_ops *notifier_ops;
>  };
>  
> +static const int ffa_linux_errmap[] = {
> +	/* better than switch case as long as return value is continuous */
> +	0,		/* FFA_RET_SUCCESS */
> +	-EOPNOTSUPP,	/* FFA_RET_NOT_SUPPORTED */
> +	-EINVAL,	/* FFA_RET_INVALID_PARAMETERS */
> +	-ENOMEM,	/* FFA_RET_NO_MEMORY */
> +	-EBUSY,		/* FFA_RET_BUSY */
> +	-EINTR,		/* FFA_RET_INTERRUPTED */
> +	-EACCES,	/* FFA_RET_DENIED */
> +	-EAGAIN,	/* FFA_RET_RETRY */
> +	-ECANCELED,	/* FFA_RET_ABORTED */
> +	-ENODATA,	/* FFA_RET_NO_DATA */
> +	-EAGAIN,	/* FFA_RET_NOT_READY */
> +};
> +
> +static inline int ffa_to_linux_errno(int errno)
> +{
> +	int err_idx = -errno;
> +
> +	if (err_idx >= 0 && err_idx < ARRAY_SIZE(ffa_linux_errmap))
> +		return ffa_linux_errmap[err_idx];
> +	return -EINVAL;
> +}
> +
>  #endif /* _LINUX_ARM_FFA_H */
> -- 
> 2.49.0.395.g12beb8f557-goog
> 

