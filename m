Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0DDD7497D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 08:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H93KKVpJbQ9UgwbZgl1kdPifbCt7HKUU//i7YU4EaJY=; b=PZ2M8eNswGuhrgOYDAMX7rywF+
	EqEChjxOiuzEYXuV4h7m1wvqLUUQJLxrToMDVa+fO+ehSySJs0V6E45kqjdc6Y61TjukoA4DFbuaF
	bY6M+Jbekj835139irGHuzKa0eHyRRdAR86Q+ltwok3ahHglZICH4gm1x6tqowZcMq2hIpO/yh3JC
	GoLyptuiH7rmlrAYpKAtE70CX/7Q6SdR8wv63HKHmfiK6Y+DLYiTMIqdHj8WTzM/FmT3pQyz5JskV
	Lh52vwujwAzkKUjKgnlvKbfBaw3acQsIC52KZHlbGFyyIr2QGi4kvB/R7j9LYE1ez7jqIL6HKvKyd
	3QxKkmQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t63iU-0000000HEmf-2ZZg;
	Wed, 30 Oct 2024 08:06:10 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t63gp-0000000HEYR-4B1q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 08:04:29 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539983beb19so7477315e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 01:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730275465; x=1730880265; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H93KKVpJbQ9UgwbZgl1kdPifbCt7HKUU//i7YU4EaJY=;
        b=kHZ88AuyAw9GjxhOo0BrD8BN8R00rMmoJNbOHBqp4Pb3wwra+gpItd9ZVv4e7gkzf1
         3dyds+BQtWGz3jiMtjF2ALMQwm8iZKiDkRidHF9TcDqMaQzTvPNeeOB+hyXVLTWxQ6cL
         /EufFj7y06bP+fJgc2zsjtXCRmefvAKkwvzl7snyrgjYAw9V2jHns9bF+BByTAP500ga
         j1ZYOo4qoDIKdGxEhjfUgD/9eimAa/OD3OYwCCHSIRPp8bqFRylQ+pcrcqoaJm1My0aV
         BRsXyBDUII/JekP77Sj0fYar+AgkrlGt5A6133pavvaa1qG1E8GHbgAauUO0HgRSptJz
         ZB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730275465; x=1730880265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H93KKVpJbQ9UgwbZgl1kdPifbCt7HKUU//i7YU4EaJY=;
        b=IUruhG4tMZyn7KrRLRFmGwmkUFGtSfCMS3wzwc/HylxzZe/RoW/ugftmYPGT6sPHaf
         0xaoVY0wOFJhpC2BZGKOvjyGLDW9ONXiUN7iDn1GB2zbeGo6QvESdKIJLd9D66l6/FWV
         5qVQeXfWeWviObw/R8hUcnNEawCGs/QjOWRzkkXvxJ9545EuPTFi7RmP9vvQN+fKIAq2
         r/n1zU5LLVuwzjHn2+LL8gUnzZ2rWPa+L6MLGJzPzw4aXBzxjCcXqMo8tEBoks0P1pCv
         CIh8IpNA7Bxhy/y0GC4qXQ1mDnglFdyJDEO1rLm0yqN0FQ0xW5WlmrM1Beef6sDcE5Wu
         XNuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHmSk0+oaLMx+iRW473BRrgT2cElTIF/K/qkNXGtBJdwVEsAtcG0xcRvKUYWAMzSdsqHy52DHXY4IBSnpN549p@lists.infradead.org
X-Gm-Message-State: AOJu0YxkGT/PCsG7T6yVBKc896yH+MoRSaIrw8L5wybtE5CLZmJm7MBw
	hALzl1xcnQKe++ABE5G7W3JBOv0D8b8km+8shHYrz+NAFwXNV6UPDdpF7cd+yNIehJ6AwqCOfwT
	5
X-Google-Smtp-Source: AGHT+IEZj9cR0ATu/JOPSB5irJVr/RnXyRQtlMK8w5XGhoTtI+E9S/Awq23Np24Aq1OO/+nXkl58yg==
X-Received: by 2002:ac2:4c41:0:b0:539:f65b:3f9 with SMTP id 2adb3069b0e04-53b347c0b08mr8580322e87.10.1730275464885;
        Wed, 30 Oct 2024 01:04:24 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm14792889f8f.42.2024.10.30.01.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 01:04:24 -0700 (PDT)
Message-ID: <74458ba4-af0f-4c41-92f5-c6c0cb79e930@linaro.org>
Date: Wed, 30 Oct 2024 08:04:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] scsi: ufs: exynos: Allow UFS Gear 4
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-2-peter.griffin@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025131442.112862-2-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_010428_085846_3359DD6B 
X-CRM114-Status: GOOD (  20.89  )
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



On 10/25/24 2:14 PM, Peter Griffin wrote:
> UFS Gear 4 offers faster speeds, and better power usage so lets
> enable it.
> 
> Currently ufshcd_init_host_params() sets UFS_HS_G3 as a default,
> so even if the device supports G4 we end up negotiating down to
> G3.
> 
> For SoCs like gs101 which have a UFS major controller version
> of 3 or above advertise Gear 4. This then allows a Gear 4 link
> on Pixel 6.
> 
> For earlier controller versions keep the current default behaviour
> of reporting G3.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

some nits/personal preferences below, no need to address them

> ---
>  drivers/ufs/host/ufs-exynos.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index 9ec318ef52bf..e25de4b86ac0 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -771,6 +771,21 @@ static void exynos_ufs_config_sync_pattern_mask(struct exynos_ufs *ufs,
>  	exynos_ufs_disable_ov_tm(hba);
>  }
>  
> +#define UFS_HW_VER_MAJOR_MASK   GENMASK(15, 8)
> +
> +static u32 exynos_ufs_get_hs_gear(struct ufs_hba *hba)
> +{
> +	u8 major;
> +
> +	major = FIELD_GET(UFS_HW_VER_MAJOR_MASK, hba->ufs_version);
> +
> +	if (major >= 3)
> +		return UFS_HS_G4;
> +
> +	/* Default is HS-G3 */
> +	return UFS_HS_G3;
> +}
> +
>  static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
>  				struct ufs_pa_layer_attr *dev_max_params,
>  				struct ufs_pa_layer_attr *dev_req_params)
> @@ -787,6 +802,8 @@ static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
>  	}
>  
>  	ufshcd_init_host_params(&host_params);

blank line

> +	/* This driver only support symmetric gear setting e.g. hs_tx_gear == hs_rx_gear */
> +	host_params.hs_tx_gear = host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);

I find it easier to read if you split inits on their own line:
	host_params.hs_tx_gear = exynos_ufs_get_hs_gear(hba);
	host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);

>  
>  	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
>  	if (ret) {

