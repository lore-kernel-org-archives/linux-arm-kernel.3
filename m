Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A0BCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 00:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7+8kbrxw3k6r1pEahfY8Z1QQWebSWYvywBVfeppeoA=; b=qFzLytwru8yrPUyGtb0kldbrb8
	67ZTA4vlhGgK65hRQjh5Cp8iCXud2bO0t+6W3NNttcpU9KDDVDLitVW8GfuBshtWsEfo9ZWl7N3/2
	NRb+VKrzJOgf+sXdWCR+OInUy/Zxne579b8cLs5qxGDkiHEXmYkjO4Kh0xJdIeZOApG8GpzXGg2ak
	ZyaRrpsp/6n+z1igwZ8m/SUpIXVi7PmigoWH/oZ5Smkprz8C9YaqPv/vBo+ELVR3SSR88c5Ez8mUf
	Snv7d0Qp6OD12oy+hP/JzRk2NxJTHksLyXvxl1bTRVKZiSLH6eORXtRVmaxwuCIYKmUd6sggdIXgx
	+92Yj6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPre5-00000006JRw-2DZh;
	Thu, 21 May 2026 00:52:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPre2-00000006JRH-1cic
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 00:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779324733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G7+8kbrxw3k6r1pEahfY8Z1QQWebSWYvywBVfeppeoA=;
	b=eE0qT8UsuutPyBxWOLHyycIukW5yEoCIFL/ApRhGx6vrjK90dszXNiJXlYxoDHkEaTB3gt
	Bt7EYSwgxB+QivjkFf99FJsaojv8myYXX5XLF/uGQ3mqvNmQThM2UNcaLv42CH+ps/G4yS
	Y+A20+r94rp+/roa4Y+69bWCrRLtN5Y=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-Ip97haglMzas59sMUmDpDA-1; Wed, 20 May 2026 20:52:11 -0400
X-MC-Unique: Ip97haglMzas59sMUmDpDA-1
X-Mimecast-MFC-AGG-ID: Ip97haglMzas59sMUmDpDA_1779324730
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2babc42244aso133853195ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 17:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779324730; x=1779929530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7+8kbrxw3k6r1pEahfY8Z1QQWebSWYvywBVfeppeoA=;
        b=exXH1xjXYUUu4snYzXOSmTTRwNbPquXVue4OiQY2xiecraOjjtQiGdbjCZzQGKsDRq
         g5Ir1fAURFP7Bdk23/ychrPShMJl5zp3yT5JnNX+dkLDMyNFk+PBj63Gxx1YDCYoztx7
         tYcXzHo5j6UW3eCwuCm8ZIUrchyg2YqdCY6Ecf2VFTlhLfLjLfhUeVhuKICHqY8Y0kdS
         Sn4SrMs1ah1exlACuQUGJzX0955J9FNfhvFYpYB4xLTcaqpavu5Z5BmA8clcWRBw/VG/
         x2DxOiLetIsHmYtgBpzYyZZQYd4LJ9WYR6HynujvwXU8sfI+RkSc2JmL+cNLRlIviSue
         yS/w==
X-Forwarded-Encrypted: i=1; AFNElJ8mSq24swnudvLmeb+blZp37WFUaFYWE+71wb+WYl5yKDQb+H9iZS/Ft4Mix+1e35lVvBF1/k3edjmzWv1OTs0A@lists.infradead.org
X-Gm-Message-State: AOJu0YwKTCr5xin7vWM/i5PaZX9WX3j2K4S2iOfKhV4SXFwsCf3PSf5B
	uW/8spjcRlwbNjeTCz2O1LVLpdczQ5yowiDU6WeU7SPptwSrnww+lBxndnVSxgPJ61OejgKJQV6
	SRXI0TGTxI5oxBf7KOn38rATwwQIoeYufbxyhOfaywGf/7G64rCqXf0auXidUTfJYzNPMw4VkX/
	+C
X-Gm-Gg: Acq92OFWiMFgzejO8/Bs+ekl2/Hu+YBfQ3+a5wmoZ55omwHhnJIMGGKSq0Pl62ShOiS
	j/7r5JJ0Cd8YOVQIwQuDkgOWDCM5M9LSeUj7jnkSxiNfcbaDUiJr8QNEPDx2y6FuwzumgedBete
	y1hvuqNsf4BaNTPrUGUMFBFBvHewAnJMoYN6M7OnB+uvOpCXpUYruHBT+6XKksOK0gq346hhvx0
	PW1lIRFcJVnh3guQRVdQt7FttsbZKFv9DevfSKUDSxr9jFxROz0N68BjbDvEst+b3Mapqo1hJIw
	0VrLdKNvGaf7QoZ9d24Uf+Qb7ADz5DXmFYpzsoNytMgQNZ+iGfkB+j+s072nTi/O1lUssDCgNgP
	R0eqg61RZFz3qoTTjaRPFtL3iR7FgyxyqBIwgL1Yrr8Qdz1QoK/m93Jq3asTXgz/A
X-Received: by 2002:a17:903:240c:b0:2bd:907:2cf0 with SMTP id d9443c01a7336-2bea33a548dmr3621045ad.32.1779324729811;
        Wed, 20 May 2026 17:52:09 -0700 (PDT)
X-Received: by 2002:a17:903:240c:b0:2bd:907:2cf0 with SMTP id d9443c01a7336-2bea33a548dmr3620505ad.32.1779324729097;
        Wed, 20 May 2026 17:52:09 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5ef1bsm293727375ad.4.2026.05.20.17.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 17:52:08 -0700 (PDT)
Message-ID: <45a953a8-6edc-45c3-b5bd-17f14397ab89@redhat.com>
Date: Thu, 21 May 2026 10:51:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 07/44] arm64: RMI: Configure the RMM with the host's
 page size
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-8-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-8-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1dsmz8IkzMv9oOAB6My66yy3p3tj4z8_S_qEzlL2ouo_1779324730
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_175214_506797_DB44629A 
X-CRM114-Status: GOOD (  22.87  )
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

Hi Steven,

On 5/13/26 11:17 PM, Steven Price wrote:
> RMM v2.0 brings the ability to set the RMM's granule size. Check the
> feature registers and configure the RMM so that it matches the host's
> page size. This means that operations can be done with a granulatity
> equal to PAGE_SIZE.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v13:
>   * Moved out of KVM.
> ---
>   arch/arm64/kernel/rmi.c | 42 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
> index 99c1ccc35c11..a14ead5dedda 100644
> --- a/arch/arm64/kernel/rmi.c
> +++ b/arch/arm64/kernel/rmi.c
> @@ -49,6 +49,45 @@ static int rmi_check_version(void)
>   	return 0;
>   }
>   
> +static int rmi_configure(void)
> +{
> +	struct rmm_config *config __free(free_page) = NULL;
> +	unsigned long ret;
> +
> +	config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
> +	if (!config)
> +		return -ENOMEM;
> +
> +	switch (PAGE_SIZE) {
> +	case SZ_4K:
> +		config->rmi_granule_size = RMI_GRANULE_SIZE_4KB;
> +		break;
> +	case SZ_16K:
> +		config->rmi_granule_size = RMI_GRANULE_SIZE_16KB;
> +		break;
> +	case SZ_64K:
> +		config->rmi_granule_size = RMI_GRANULE_SIZE_64KB;
> +		break;
> +	default:
> +		pr_err("Unsupported PAGE_SIZE for RMM\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = rmi_rmm_config_set(virt_to_phys(config));
> +	if (ret) {
> +		pr_err("RMM config set failed\n");
> +		return -EINVAL;
> +	}
> +

Looking at branch 'topics/rmm-v2.0-poc_2' of RMM implementation, the granule size
is fixed to be 4KB at present. I'm not sure if I have looked into correct RMM
implementation, but 'topics/rmm-v2.0-poc_2' is recommended one in the cover
letter.

Besides, there has checks in the handler of the RMI command to make sure that
struct rmm_config::tracking_region_size to be 1GB, indicated by zero. It maybe
worthy to set it before call to rmi_rmm_config_set().

	config.tracking_region_size = 0; /* 1GB */
	ret = rmi_rmm_config_set(virt_to_phys(config));


> +	ret = rmi_rmm_activate();
> +	if (ret) {
> +		pr_err("RMM activate failed\n");
> +		return -ENXIO;
> +	}
> +
> +	return 0;
> +}
> +
>   static int __init arm64_init_rmi(void)
>   {
>   	/* Continue without realm support if we can't agree on a version */
> @@ -60,6 +99,9 @@ static int __init arm64_init_rmi(void)
>   	if (WARN_ON(rmi_features(1, &rmm_feat_reg1)))
>   		return 0;
>   
> +	if (rmi_configure())
> +		return 0;
> +
>   	return 0;
>   }
>   subsys_initcall(arm64_init_rmi);

Thanks,
Gavin


