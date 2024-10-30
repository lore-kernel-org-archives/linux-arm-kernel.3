Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143F9D74953
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 01:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzjco5Yp88oO9yhhTyX9hZkpJ8eqlDl8kNCtlxrNZFY=; b=d/zrXKJUYjQ8OiuXNOguW3uDwM
	M7kVZ8Q/JGPmxCrArj35AuEJeQ/gffluVWuDya3yXoRGV8E1QKEJOSQzbYtQtmm6Uxy8ABm8Cr78Y
	qQiWFAJfZPjgbE+KUNiYRQo6Trol+Pdl8y6yFItoyRGkrGp8d0Cp+zSHIQ8ugKhT+jV3QEN75T0pg
	zIACWz+UzR8irVxsd30e/ZZInRFJcbzfUyd3UONNzCusb/IcjwVy4EVO7NLIBB2UhMCO2L+fq+qyb
	cxhbPV6YGZiB0Sx4ZlByuKInysonMoFKL9fcgSS1k4xOE3Qg+sTXlQRVemrdWuBgjzeYTg2Xruda+
	2DdyyPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5xXl-0000000GQ87-2khW;
	Wed, 30 Oct 2024 01:30:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5wV4-0000000GKBa-11Cn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 00:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730247827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rzjco5Yp88oO9yhhTyX9hZkpJ8eqlDl8kNCtlxrNZFY=;
	b=EcZKjt+pAObwuKfMMhrYPnHYHGxC6t7JaTASSSJwXVTmgxNqRYqP7Xp9bk6A96djuwiUvu
	0aukQJrtoEYf9IFuyn7URq2pO0S0X1LvSzSDzOczCgchXt/1r2vdIjfR/mmvOJhBex/2kP
	yeSnwH/AXtUQ7H8AyIZwzI1PWnDXL9Y=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-hE6Fg-LdMPadaJG-D_z1Lg-1; Tue, 29 Oct 2024 20:23:46 -0400
X-MC-Unique: hE6Fg-LdMPadaJG-D_z1Lg-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-71e5a7bd897so6984578b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 17:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730247825; x=1730852625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzjco5Yp88oO9yhhTyX9hZkpJ8eqlDl8kNCtlxrNZFY=;
        b=ucUfEPuUwhsYG0Y8sysQJY9+YIOgRgw7tHS4gQNm0GNCqe9gF5QqdkQ7Fvczc7QMl8
         /LbAKumobSe5eJVMk8jq9I4t7gdg8mWOlUhAz84WN/yzEdTL6Udi1QyVqrP0zqZP/R7I
         SmMOPdqKrGrY05jhKc1WA3/pouHLP1f0tkYhGXuKIcNN2DyKaH1KRsrNvp9m8GtdQHpQ
         q0qsLGGcqjrC7DUXq1w1FLJypRLe9nTLpdTUGYTP2ESwkwCqxla45tvLJHpv0+SX3tEB
         Uar5ZBxdKtF04kio9aeR7wQrHu5MkmJ3JvyNhTOz6ArJ9gX8N9Z/SdPsrK7lYZNDV6hu
         o73w==
X-Forwarded-Encrypted: i=1; AJvYcCVkKCi6l0c22I6KSbhEIcvndXFlSS9cw9MLV1eiQgUOifxirfNMWlBiJwiLCtnoOMBnAycoaPrYAwl4CSbWRnTh@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk6esQa8UnD916gJzdaHR3NtfuLV12SIelVvjCpdERB+FWIDNg
	i/8+LLkUoGeH/nFX1zlzEihavxSUa5HSIZv7ZFiV34BhULQPuIidUpnjeBmgdurA+OF+ENqBX68
	MHXvZBpHLQpeD0rluGoIP3lCevtPYMIQxLMNXuli7FvQ4Usf2ejBV74EKwbvhP+K2RGC4DJ76
X-Received: by 2002:a05:6a00:2315:b0:71e:5f2c:c019 with SMTP id d2e1a72fcca58-72062fb2169mr19297956b3a.9.1730247825096;
        Tue, 29 Oct 2024 17:23:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDVeC+K/m1JudRIxQdtRApAx35LcqTPMPDCcyu4TrmSrIJs0qyIuUY63xL0+Wlk1AbrDcLww==
X-Received: by 2002:a05:6a00:2315:b0:71e:5f2c:c019 with SMTP id d2e1a72fcca58-72062fb2169mr19297927b3a.9.1730247824651;
        Tue, 29 Oct 2024 17:23:44 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a3bd53sm8173830b3a.185.2024.10.29.17.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 17:23:44 -0700 (PDT)
Message-ID: <32211eb5-eed5-4c71-b62a-362d32e1af47@redhat.com>
Date: Wed, 30 Oct 2024 10:23:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: rsi: Add automatic arm-cca-guest module loading
To: Jeremy Linton <jeremy.linton@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: steven.price@arm.com, suzuki.poulose@arm.com, catalin.marinas@arm.com,
 will@kernel.org, sami.mujawar@arm.com, linux-kernel@vger.kernel.org
References: <20241029141114.7207-1-jeremy.linton@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241029141114.7207-1-jeremy.linton@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_172350_397691_9B4389DA 
X-CRM114-Status: GOOD (  26.56  )
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

Hi Jeremy,

On 10/30/24 12:11 AM, Jeremy Linton wrote:
> The TSM module provides both guest identification as well as
> attestation when a guest is run in CCA mode. Lets assure by creating a
> dummy platform device that the module is automatically loaded during
> boot. Once it is in place it can be used earlier in the boot process
> to say decrypt a LUKS rootfs.
> 
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> ---
>   arch/arm64/include/asm/rsi.h                    |  2 ++
>   arch/arm64/kernel/rsi.c                         | 15 +++++++++++++++
>   drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |  7 +++++++
>   3 files changed, 24 insertions(+)
> 

I don't understand how the TSM module is automatically loaded and arm_cca_guest_init()
is triggered because of the newly introduced platform device. Could you please provide
more details? Apart from it, some nick-picks as below.

> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
> index 188cbb9b23f5..1b14a4c4257a 100644
> --- a/arch/arm64/include/asm/rsi.h
> +++ b/arch/arm64/include/asm/rsi.h
> @@ -10,6 +10,8 @@
>   #include <linux/jump_label.h>
>   #include <asm/rsi_cmds.h>
>   
> +#define ARMV9_RSI_PDEV_NAME "arm-cca-dev"
> +

Maybe 'ARMV9' can be avoided since RSI is the specific feature to ARMv9.
Besides, we already had @rsi_present there. So I would suggest to rename
it to RSI_PDEV_NAME

>   DECLARE_STATIC_KEY_FALSE(rsi_present);
>   
>   void __init arm64_rsi_init(void);
> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> index 3031f25c32ef..ad963eb12921 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/arch/arm64/kernel/rsi.c
> @@ -8,6 +8,7 @@
>   #include <linux/psci.h>
>   #include <linux/swiotlb.h>
>   #include <linux/cc_platform.h>
> +#include <linux/platform_device.h>
>   
>   #include <asm/io.h>
>   #include <asm/mem_encrypt.h>
> @@ -140,3 +141,17 @@ void __init arm64_rsi_init(void)
>   	static_branch_enable(&rsi_present);
>   }
>   
> +static struct platform_device rsi_dev = {
> +	.name = ARMV9_RSI_PDEV_NAME,
> +	.id = -1
> +};
> +

         .id = PLATFORM_DEVID_NONE,

> +static int __init rsi_init(void)
> +{
> +	if (is_realm_world())
> +		if (platform_device_register(&rsi_dev))
> +			pr_err("failed to register rsi platform device");
> +	return 0;
> +}
> +

Those two checks can be connected with '&&' and '\n' seems missed in the
error message.

         if (is_realm_world() && platform_device_register(&rsi_dev))
             pr_err("Failed to register RSI platform device\n");

> +arch_initcall(rsi_init)
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> index 488153879ec9..e7ef3b83d5d9 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> @@ -6,6 +6,7 @@
>   #include <linux/arm-smccc.h>
>   #include <linux/cc_platform.h>
>   #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/smp.h>
>   #include <linux/tsm.h>
> @@ -219,6 +220,12 @@ static void __exit arm_cca_guest_exit(void)
>   }
>   module_exit(arm_cca_guest_exit);
>   
> +static const struct platform_device_id arm_cca_match[] = {
> +	{ ARMV9_RSI_PDEV_NAME, 0},
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(platform, arm_cca_match);


/* Comments here to explain why @arm_cca_dev_ids[] is needed */
static const struct platform_device_id arm_cca_dev_ids[] = {
        ...
};

MODULE_DEVICE_TABLE(platform, arm_cca_dev_ids);

>   MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
>   MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
>   MODULE_LICENSE("GPL");

Thanks,
Gavin


