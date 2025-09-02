Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F41FCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPQ5lbQT+ktG5exTeK6ZYWJdIi8XeD/6BpVRa1QfAiM=; b=z9TaUqLJoa0KYJuOjXrq8Y9a9j
	GIXm8z8Wr/8ugiFEHf6FtBlNQpm6zYda15zRiX8JC26uso+LKoqEGe1nWMjo8PCvPIXAVupSNyRX9
	UvgOkQlT3TOEoDPg1+ngmMDdTTk5gWK4d8Qe6in51aPngBDWoAI7/eQyKtQ8CeYT6RqZcMzKUpvgX
	r8KjmnzX9vZrqMq/mDo3ux9nUAPjaVTgRvRJ3DA8s9T0YX7P5ZnwEQ7GE2WGhUMyVZL4mjRGGaIcB
	boEQxr1kkqT4P0INhyX+Mngc8HZa8meIl8x3desITvPUMt+oLLO3oF7K6J2jDX3uq25Jm0XRitNqJ
	ZUV6DWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWQj-00000001dn5-0dFl;
	Tue, 02 Sep 2025 19:12:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSBq-00000000QEU-3Uwp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 14:40:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45b82a21e6bso26201875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 07:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756824053; x=1757428853; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPQ5lbQT+ktG5exTeK6ZYWJdIi8XeD/6BpVRa1QfAiM=;
        b=dLX4udHTjiCWPZdKGXslHBY7BX8n7H1HmD5MT9LO80VxnPBPbiMeF7UWjIOO64LlbA
         GZHSp1NaoXFefCLG2438mRWSLEwPpBy8feZ1XnvqnIveM4xercaFekb2SrlyJ8WRJDmT
         IYPmWettZ7jOCpTXlmKyYbbGWcQjpee2/R/9tFg82+qU2b4D4YENr/x6Ew8RtMBkIAXS
         nnmva3R8hTyl5+IPthprquEVyms0ilxACL9CczMP4Ml2MsBQMuKy2XFMjI5ATnrvLGxd
         b2NcxhlovyGmjBwin6BXgZyT9xuYoyVgpDrAnPjfDW/G1ih6yBnrlHvmI1DyTWdX4szu
         Q83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756824053; x=1757428853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPQ5lbQT+ktG5exTeK6ZYWJdIi8XeD/6BpVRa1QfAiM=;
        b=kYNtH0UMluKRgxZrX7Te2CRii3FC6GFqeXfxlnWN/F6aXO6CAiH0bOteMMIvrllJHh
         Jq2KxlOhLPHfvGSoKm1IuQDTPwbsbeglGSIpC96RCS2gOh5x6um9Yq+P+yVUYZPHkl7M
         sbPIHxQWn3YeVmYmwMpOsA8XwJOL7+arlctdUTk3jNF7YJU60PO7CLuTGZs1y2B0EHgV
         g4VxSYrdiJUeXLJ5hshU2TsvxNBqG3Sb9eUnwytRDkU+IKg3btxYNRIVbYznzkmXOym5
         X/RWp/TfglvOA7RSsJEhcoTZgL25W1d+zCWal2ULH8UeXxatOA+BK4SRYhFF3hSVtNQG
         EucQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/Uearom3gJH5cAe3FVq0C7/bSb5WtYqnAy7fafve0ogDBmefusCCrgVwawAX9OAlkSIxRzK7h2g/+T/Wdtm/O@lists.infradead.org
X-Gm-Message-State: AOJu0YzrzqZVVXSMxM8z9ODVkGYrJ+CLt8Y7+ZeG64tGyTX+I9Q/8SFF
	ljbcep2iRI3gOw8SxILgqUJIxVHSMjkgSDhOWCKCuz1+Syn5Od7/7/w6CocUjQCA3HSTC2Gt2Z7
	XaqTR/Ko=
X-Gm-Gg: ASbGncteGaLXZPUUdBmQggZZqmMG24ml+HpTfCAXNbaNbzhlhc3IgbyqKLR3ofGtdj+
	uttaN7sQUWf6gGd0Ca8MUkQ9AENaUpg4zLKYsuX3Cdtu8wtTlsPbiFiJg2D5YGhTXoBx0DxZH2E
	k+s64tz1+0DSHyK/g88Zsp2AbubAgu+IHIBnGNrlMR/lo3GIphFgEvve07Bl5HE46JmO4GiJsyU
	/ML+UW5fsl5cihf+KkwI44MtpGGkAkpFbJ3X3o17R/wRR67xi/QXP2Yd56RWCUBjqdIBH0Lsc/S
	Djonh/9gnRoDiNulSrX1lb66K4XDVXQ1LOiAsLJEfhdxKKuwr/hCbSekXNsV2QHwo5uiZ3R5G/H
	k9YTkoBUwLUwZI/zcepBtDj+09W8JgkoatHKA2y6Et5e9o8Sv1aHMwUxqiWniJ7ZUFJZ5EdN2TK
	Zfsak=
X-Google-Smtp-Source: AGHT+IHRl49o6/YtbNy7bdqpWcnR/xIvJV5u5yS14FAAALeyuwfZ5PjGe2f+Fvd/cTOOThpsm4Zpng==
X-Received: by 2002:a05:600c:1396:b0:45b:868e:7f7f with SMTP id 5b1f17b1804b1-45b9615d7fbmr32758825e9.17.1756824052669;
        Tue, 02 Sep 2025 07:40:52 -0700 (PDT)
Received: from [192.168.27.65] (82-65-114-165.subs.proxad.net. [82.65.114.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e380b77sm205384965e9.11.2025.09.02.07.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 07:40:52 -0700 (PDT)
Message-ID: <0bc124c7-55af-4a25-b02d-3bd9aabf0266@baylibre.com>
Date: Tue, 2 Sep 2025 16:40:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] soc: ti: ti_sci_inta_msi: Enable module
 compilation support
To: Nishanth Menon <nm@ti.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, vigneshr@ti.com,
 Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250812-timsi-v2-0-90c8500f3f18@baylibre.com>
 <20250812-timsi-v2-2-90c8500f3f18@baylibre.com>
 <20250813152610.akcdxrzhev6e2kfa@unturned>
Content-Language: fr
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <20250813152610.akcdxrzhev6e2kfa@unturned>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_074054_872376_4A7AB703 
X-CRM114-Status: GOOD (  18.66  )
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

Hi,

I will resend weries because something look not ok i don't find serie in 
lore or patchwork.

Guillaume

Le 13/08/2025 à 17:26, Nishanth Menon a écrit :
> On 22:36-20250812, Guillaume La Roque wrote:
>> Add module support to the TI SCI INTA MSI driver:
>> - Change Kconfig from bool to tristate to allow module compilation
>> - Add linux/module.h include for module functionality
>> - Add MODULE_LICENSE, MODULE_DESCRIPTION, and MODULE_AUTHOR macros
>>
>> This allows the driver to be compiled as a loadable kernel module
>> named ti_sci_inta_msi.
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>   drivers/soc/ti/Kconfig           | 5 ++++-
>>   drivers/soc/ti/ti_sci_inta_msi.c | 5 +++++
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
>> index 1a93001c9e36..0a9eb5ac264b 100644
>> --- a/drivers/soc/ti/Kconfig
>> +++ b/drivers/soc/ti/Kconfig
>> @@ -85,7 +85,10 @@ config TI_PRUSS
>>   endif # SOC_TI
>>   
>>   config TI_SCI_INTA_MSI_DOMAIN
>> -	bool
>> +	tristate "TI SCI INTA MSI Domain driver"
>>   	select GENERIC_MSI_IRQ
>>   	help
>>   	  Driver to enable Interrupt Aggregator specific MSI Domain.
>> +
>> +	  Say Y here to compile it into the kernel or M to compile it as a
>> +	  module. The module will be called ti_sci_inta_msi.
>> diff --git a/drivers/soc/ti/ti_sci_inta_msi.c b/drivers/soc/ti/ti_sci_inta_msi.c
>> index 193266f5e3f9..d92cab319d57 100644
>> --- a/drivers/soc/ti/ti_sci_inta_msi.c
>> +++ b/drivers/soc/ti/ti_sci_inta_msi.c
>> @@ -8,6 +8,7 @@
>>   
>>   #include <linux/irq.h>
>>   #include <linux/irqdomain.h>
>> +#include <linux/module.h>
>>   #include <linux/msi.h>
>>   #include <linux/of.h>
>>   #include <linux/of_address.h>
>> @@ -115,3 +116,7 @@ int ti_sci_inta_msi_domain_alloc_irqs(struct device *dev,
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(ti_sci_inta_msi_domain_alloc_irqs);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Texas Instruments K3 Interrupt Aggregator MSI bus");
>> +MODULE_AUTHOR("Lokesh Vutla <lokeshvutla@ti.com>");
>>
>> -- 
>> 2.34.1
>>
> If Thomas doesn't mind picking the full series,
>
> Acked-by: Nishanth Menon <nm@ti.com>
>
> This is probably one of the last hold outs for us to move SoC support
> into kernel modules.
>


