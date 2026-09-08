Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5288C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ol8taRaXNtmTj+LU+cXQwn5fB81XYMucQnFv/vJC8fU=; b=mihK9BMlAK389/PLlngKANLGdR
	I4jNlpxQl7s2vqZhOyIAfSmcbnOqJKdUx8jF7+G19sm8jfeO63oFyNCgA9ZuEhC4yV5vsF7azX7no
	/gIbTedJNUH5jMfPcV0KU2EQwUXaR6KwvLavTWRYsZPbVQc6/rnY/3ad8bwiqD7wIyz7hzftKIfTE
	5ZZLlMg1Cq6PiejuAfGg15x871Ddh/zsD5a2G0sgJgpKGTgJIYdk9JJOVIe13AhSSWjBiXp8Lr+ML
	eCjawUcBgI8+sqxAvCcXku2fhw7WlXNApyh8DBYLhm3d1JoG8LaiaEAsXLpzze/cvXaiSyOy/VH3k
	viaqqhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3puA-00000008EHr-1wTN;
	Tue, 08 Sep 2026 07:06:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pu7-00000008EHS-2Pl9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788851161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ol8taRaXNtmTj+LU+cXQwn5fB81XYMucQnFv/vJC8fU=;
	b=iPHU3W9gUHp3R+BsJuwUxMG0bb8EMiFWCmuMliqiy7E1GUfAl9q4Y+j49YhAmTBsxV8o1+
	fUQH5zuOS6jXnAWe/YwU5iIOHAM57Qu88xDsj5Cw7UkhK5R042qQ5ZrarZeXKD+Eq6K6gZ
	SpWfur1Q9jQTD/fs6YzBIvjkdqHL9cE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-VfV6zUdWOLC04lGU0OnnPA-1; Tue, 08 Sep 2026 03:04:23 -0400
X-MC-Unique: VfV6zUdWOLC04lGU0OnnPA-1
X-Mimecast-MFC-AGG-ID: VfV6zUdWOLC04lGU0OnnPA_1788851062
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so9307474a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 00:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851062; x=1789455862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ol8taRaXNtmTj+LU+cXQwn5fB81XYMucQnFv/vJC8fU=;
        b=Es2sdl0DukkB1Y+y6bvSpBKjiZo+jPWDsuOvfKzIb0Ev6wr5LrZHPoTW63mcoO1csc
         f0KvabqQjg4uFBiEW4ibekxaFj5AwM9BP0a3HtwyKB2/6fK/ECoF6jSIg62EoMTNwYIK
         WMXdAiEZEI6cxLeBvCeqoQZcBTTEusqa9zwyBWdg9V+dBnG8seKof9MVVoM98POwAdy8
         s1FpsGfNU5NjqjMxHx3zd4SH8eydKB3yJDqI4L+5qyZ+yX7GIC5a29QxkXKtulxxB57r
         MxecgSpXcVwurq8+pjBN1nDh6w4LMzIW0qgXbidzh4MLZ+AD0V108B3TvPzCLwo9hvoA
         9dgg==
X-Forwarded-Encrypted: i=1; AKwUvByuS0LoC/Z2lcYYDSTuimE+Fn7XKNJhra6oYr0JPAymx4R7qBphQzKrkq1m1f9HK7bm0GpxwgJLrtKmmoDI/2aJ@lists.infradead.org
X-Gm-Message-State: AFuF++nSTL4HAWgrrkIZhaaHse3yOXZDKnUJsbYTczBT1+JKcqa2Icvr
	CVL9INkpkgv0oRziM1eRV0ubVvc+y5d8XMbAnPfGiOI3k+MjE96OOlbOF3BKzJGhuCEz++yqbdm
	Lj/tWVMhjI6XV/4GJjo3Kdl6c8ErspEUw6vL+se3GGQcYEzk9EkqwN37kID9Zu5agVG/g0pjHQ1
	dW
X-Gm-Gg: AYBFou1Hff2oYcP0j4wStXtJcRvCj3b0bJMHSwVtwFKNI6gt4CaKNXQlSKf7TVe2Q6f
	IAxFSf3wU7FCOIai3iQ2FFwwJ5Ph/v3mDmPsVQoOY8G2vgxaVAT7dP4ZGdAkOeNX5q4NiC8wT1A
	kaFH/lZl0VLG6h92l4rF7Il+nIDSFQ1bfoB2ueGsLFunwtv5QPkF1maLxCwAaos/9LCkCrPGKQq
	hjLfQ9Er++w4mJcsxhxDUwfQ794N0XY67UqsaEhN5bSdbo5W3OaQvdNYgg7rEzAibBIW0MJ9Jki
	xa0PiMGWsGxldwWZmRjS9RhbsIbyJJfqj9kYd4ZpUKhBC9zGJE7l97S8FEyN7qRDFX+2JysKK+H
	S/19MoEQWRNQij61faDiua59LTz/+HBx0c73da1SVZQ==
X-Received: by 2002:a17:90b:43:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-39b26141c79mr43891698a91.11.1788851061754;
        Tue, 08 Sep 2026 00:04:21 -0700 (PDT)
X-Received: by 2002:a17:90b:43:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-39b26141c79mr43891602a91.11.1788851061212;
        Tue, 08 Sep 2026 00:04:21 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc081sm30955490a91.6.2026.09.08.00.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:04:19 -0700 (PDT)
Message-ID: <10893135-4757-44de-91b5-180a9774d868@redhat.com>
Date: Tue, 8 Sep 2026 17:04:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-4-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260907095942.1140734-4-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jbqj6ILtk9auzmcbGRjtXYdBCrUAtQpxu3yLCPYQuA0_1788851062
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_000603_705184_C3F5E2E6 
X-CRM114-Status: GOOD (  28.44  )
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

Hi Suzuki,

On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> RMM v2.0 brings the ability to set the RMM's granule size. Check the
> feature registers and configure the RMM so that it matches the host's
> page size. This means that operations can be done with a granularity
> equal to PAGE_SIZE.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Changes since v15:
>    * Actually check the feature register for the host's page-size support.
>   Changes since v14:
>    * Move the implementation into drivers/firmware/arm_rmm.
>   Changes since v13:
>    * Moved out of KVM.
> ---
>   drivers/firmware/arm_rmm/rmi.c | 58 ++++++++++++++++++++++++++++++++++
>   include/linux/arm-rmi-cmds.h   | 17 ++++++++++
>   2 files changed, 75 insertions(+)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index 008a783407b4e..76f91c145e1fd 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c
> @@ -77,6 +77,60 @@ static int rmi_read_features(void)
>   	return 0;
>   }
>   
> +static int rmi_configure(void)
> +{
> +	unsigned long granule_feature;
> +	unsigned long granule_size;
> +	int ret = 0;
> +	struct rmm_config *config;
> +
> +	switch (PAGE_SIZE) {
> +	case SZ_4K:
> +		granule_size = RMI_GRANULE_SIZE_4KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
> +		break;
> +	case SZ_16K:
> +		granule_size = RMI_GRANULE_SIZE_16KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
> +		break;
> +	case SZ_64K:
> +		granule_size = RMI_GRANULE_SIZE_64KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
> +		break;
> +	default:
> +		BUILD_BUG();
> +	}
> +
> +	if (!(rmi_feat_reg(1) & granule_feature)) {
> +		pr_err("RMM does not support %luKB granules\n",
> +		       PAGE_SIZE >> 10);
> +		return -ENXIO;
> +	}
> +
> +	config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
> +	if (!config)
> +		return -ENOMEM;

An error message is needed here.

	if (!config) {
		pr_err("Unable to alloc RMM config memory\n");
		return -ENOMEM;
	}

> +
> +	config->rmi_granule_size = granule_size;
> +
> +	/*
> +	 * For now we set the tracking_region_size to 0 which is the only option
> +	 * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 16KB/64KB).
> +	 * TODO: Support other tracking sizes via Kconfig option for other
> +	 * PAGE_SIZES
> +	 */
> +	config->tracking_region_size = 0;
> +
> +	ret = rmi_rmm_config_set(virt_to_phys(config));
> +	if (ret) {
> +		pr_err("RMM config set failed\n");
> +		ret = -EINVAL;
> +	}

The error code from rmi_rmm_config_set() is indicative sometimes. Also, -ENXIO
would be more appropriate than -EINVAL?

	if (ret) {
		pr_err("RMM config set failed (%d)\n", ret);
		ret = -ENXIO;
	}

> +
> +	free_page((unsigned long)config);
> +	return ret;
> +}
> +
>   static int __init arm64_init_rmi(void)
>   {
>   	int ret;
> @@ -90,6 +144,10 @@ static int __init arm64_init_rmi(void)
>   	if (ret)
>   		return ret;
>   
> +	ret = rmi_configure();
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   
> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> index 2fb1f7f86d71e..9aa27697e2377 100644
> --- a/include/linux/arm-rmi-cmds.h
> +++ b/include/linux/arm-rmi-cmds.h
> @@ -12,6 +12,23 @@
>   
>   unsigned long rmi_feat_reg(unsigned long id);
>   
> +/**
> + * rmi_rmm_config_set() - Configure the RMM
> + * @cfg_ptr: PA of a struct rmm_config
> + *
> + * Sets configuration options on the RMM.
> + *
> + * Return: RMI return code
> + */
> +static inline int rmi_rmm_config_set(unsigned long cfg_ptr)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_invoke(SMC_RMI_RMM_CONFIG_SET, cfg_ptr, &res);
> +
> +	return res.a0;
> +}
> +

rmi_rmm_config_set() is used for once by rmi.c::rmi_configure(), I would not expose
rmi_rmm_config_set() by combining the logic to rmi.c::rmi_configure().

>   /**
>    * rmi_features() - Read feature register
>    * @index: Feature register index

Thanks,
Gavin


