Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12316C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 19:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEzQx5EKwKnXykiE3C9S4XHeCQPE3yQLJe/q7xEl0UI=; b=QcYxCzxAsNUWI6l8JkXjtzXRSz
	1QiT93GLjIZpU6bNwp2cb/QtaYQ48CHIN3azvmmuoW7gFErSrZVzTtY2L3r2hlWVqPdUGDCsAH1Ru
	eRxbUcWxFGPeBKp1NHVMD+FRl3DwfXe5JEawVEyJiJx1Zvv38ND2Cm10tYMYkG/YNkifLXgYsz4jI
	ahGCR+bkaXmKSBNR7Rdl/bFAvlsx/xnP54R8/WFQK8NCEvfqi6kZldUi62nSG+56blDqQ9+EBka7S
	7ZabdttiZYybtxIqA+qFFUFeEnXatZvTNy44lmZGWRMDRfAVXKSyoU44fkY7Vc+V47zNx05xxfcWZ
	qSOsloIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3Dx-0000000DAmn-0qQK;
	Thu, 23 Jan 2025 19:50:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3Bo-0000000DAOV-3vFa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 19:48:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-438a39e659cso8878745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 11:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737661711; x=1738266511; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UEzQx5EKwKnXykiE3C9S4XHeCQPE3yQLJe/q7xEl0UI=;
        b=HIRl8HoZgdSNJqgyTJ03QJFiQ0Fr+Varh027CPF4ejfouHNQLHBzmy20Vl3M6IhnmX
         I07EDtLlpzZ0Ii3DPDgNlQ/iVmSP7L7H9PQM+ZGRUc9Ut7pf2tE0+vF+bzWKjPlnuwr4
         0AgOsNeWQkDk2esv4ny5UuY+DdxGWCWs2HbnrTbpMR2V4q2WC87CBCoch+nexvUv/igJ
         5hcmXmV2+Tdxc1yk9fcWCx/msQnOwebQBnD+/f2LuQ8My1A6EGs4or/Z+fvgs+9PtEti
         XTNb3MDwnHF2XB6lNKpEfTasQda8esbLFk2MFZBpjbd1Y9JjmH3I3qNXH9XpmYkulfl8
         kPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737661711; x=1738266511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UEzQx5EKwKnXykiE3C9S4XHeCQPE3yQLJe/q7xEl0UI=;
        b=SM6TVe8ke+RoE9FXTDL2QH8CrqoDjJmV6ym1cvt0P/jPTfrTh89ZhjDCkHVdUU4KY6
         3WddcT3CDsO4ndsTBj33STeROI2TGQNIEs6+VpeED+AivIhQG7oeOpXL98yIhULxYljz
         WnUITY/754FGSB3ww8AWbF0vScDzH1xifO28v0OG9dB7KKfo9rPRlcZzRLBXLPkr8HZl
         7MNG6fSFK7fbraSjLC3O8vdPBf5+YalluIE3tlVe72stnJi45xHOC/llrxJOv/Bs8Hmj
         RBb9ZHcXpeEzirA7xpI3yuwCzI71y9MaN58ICw0aiuQbDMdZEQ86ilVSXywDE2xvQ7CH
         xU/w==
X-Gm-Message-State: AOJu0YwWrrQ18fuuJJBWeFKDHS5g25jjXf2tdRzEK2HYhOGsfEqgTXfI
	4hW+jkRAv69DSPZ5ajG9v+L47k6Gez47Bui5c2sejyaB/+GYlVguPS5KOIVv5UA=
X-Gm-Gg: ASbGncuJOjK1Of+rqM9v9RdjSbbvr8TH5WFAF6s3WHZ8lG9XjPkp8Y3YsU0kEdRsB7a
	adTn06GlVA4eWmbPEleW/Kl6tJhbH5qYBBsYYpOX/JXHP4DU2GzwYRg93tSNU7hV6hJO1g9WRVY
	/DITJaij/7IeXkphAaVikSqlqsDy+88rFjQrsd94ursYtrtlM884HwRjCnZhHlU8ZOvpvFQA020
	rJE2Nmxz0VfZSibqjCrhVE44n8FZnxJRX4htz/IbqjA/0B5KL7xkqThlqS0KG/EcmK+IGAxpxvZ
	/X27sVOhc10bgQsmKq28O6GqzncppGPWn2X5TgO9atYXmP85QArL
X-Google-Smtp-Source: AGHT+IFCmuRcO2q+WkCuoyE4umxs3Q8grgYjAGWaKRdiWeb/qlKv81TNKgwodg4lbmq0iUf3Z/pwAw==
X-Received: by 2002:a05:6000:156c:b0:386:1cd3:8a05 with SMTP id ffacd0b85a97d-38bf57ce963mr27366273f8f.54.1737661710999;
        Thu, 23 Jan 2025 11:48:30 -0800 (PST)
Received: from ?IPV6:2001:861:d40:ed60:308f:ce31:765f:bf21? ([2001:861:d40:ed60:308f:ce31:765f:bf21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c3f5dsm556090f8f.92.2025.01.23.11.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 11:48:30 -0800 (PST)
Message-ID: <971868a3-2dc4-4623-b979-4e722658f6a1@baylibre.com>
Date: Thu, 23 Jan 2025 20:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: arch_k3: Replace select with imply for TI
 mailbox and TI SCI
To: Andrew Davis <afd@ti.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, nm@ti.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, khilman@baylibre.com,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, vishalm@ti.com,
 Nicolas Frayer <nfrayer@baylibre.com>
References: <20250123-timodulemailboxsci-v4-1-b1a31b56f162@baylibre.com>
 <f1e6f49c-71e2-4c6f-b78f-7608739530c9@ti.com>
Content-Language: en-US
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <f1e6f49c-71e2-4c6f-b78f-7608739530c9@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_114833_257464_822D6856 
X-CRM114-Status: GOOD (  17.26  )
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

Hi Andrew,

thanks for review.

Le 23/01/2025 à 16:29, Andrew Davis a écrit :
> On 1/23/25 6:12 AM, Guillaume La Roque wrote:
>> In order to build TI mailbox and TI SCI as modules, replace
>> select with imply.
>>
>> Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>> Changes in v4:
>> - rebase on master branch
>> - Link to v3: 
>> https://lore.kernel.org/r/20241016-timodulemailboxsci-v3-1-0e7f7a6de97d@baylibre.com
>>
>> Changes in v3:
>> - rebase with master
>>
>> Changes in v2:
>> - Use imply instead of removing select altogether and dropped
>> patches 2/3 and 3/3 from previous series as using imply makes
>> them redundant
>> ---
>>   arch/arm64/Kconfig.platforms | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 02007256709e..a6e4bfffc09d 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -133,8 +133,8 @@ config ARCH_K3
>>       select PM_GENERIC_DOMAINS if PM
>>       select MAILBOX
>>       select SOC_TI
>> -    select TI_MESSAGE_MANAGER
>> -    select TI_SCI_PROTOCOL
>> +    imply TI_MESSAGE_MANAGER
>> +    imply TI_SCI_PROTOCOL
>
> I really don't like "imply" in general, and this will be the only
> instance of it now in the whole file..
>
> Your v1 of this series was the right way to do this IMHO. The only
> issue was patches 2/3 and 3/3 should have been first in the series to
> prevent bisect issues. And they had to go to two different maintainers
> so it shouldn't have been a single series in the first place.
ok for me ,i will reuse v1 , split and resend.

Thanks
Guillaume
>
> Andrew
>
>>       select TI_K3_SOCINFO
>>       help
>>         This enables support for Texas Instruments' K3 multicore SoC
>>
>> ---
>> base-commit: 21266b8df5224c4f677acf9f353eecc9094731f0
>> change-id: 20241016-timodulemailboxsci-412e2a6458fc
>>
>> Best regards,



