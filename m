Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5905C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+wXhdSDx+zuoZH6nHSo9n5TKzFsocoVJt1FeJpCcH4=; b=f7tVmyOgHd53Ya7cEJ9GxI+5c9
	WRPNdzU3x9aqcmnjlT6NaE1BxAIOxvzYnmeeubsYOc8k1FFHoSy/R/4mBA9uCrgWgYau2BpoSK416
	4nF3ksjHeCqo7ZnIu06Jg3ni1/vUv7MsF7lu/mkRawixl3uuKTpSw0dRGJUu1bUYukZU9m06LhSNa
	r8ZmhyzOxFGHi/K0hZzUkkhhd58+qybpEjcU1/EsMtGHwdNcLJ0M+Ft3ezFOtXUCeE30JrA9GxiH4
	ZoQe0U6hTts0l1pvnDjMAZejXjAgFwmmbLcjRjflK4CvAY5Y6FNls/N+AOwXOLMyoDXsmHTMx+EPY
	BIIcqDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvkr-00000007SDk-04Wr;
	Mon, 05 May 2025 13:21:09 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvfI-00000007RUJ-44Tm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 13:15:27 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7399838db7fso4443305b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746450923; x=1747055723; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+wXhdSDx+zuoZH6nHSo9n5TKzFsocoVJt1FeJpCcH4=;
        b=YRn9YNgVQYnTIunZobDytzLMCAloBeJ7qL9V3lY68Z8pUSMQci4ivXMfSWEZe/YN2j
         85r3oQXvJujGTnvo76iHcR177h8GvYmZKddxWwCoNJe2IqWlKqnmGTVcYoG5+DxIlrRp
         NBwPG3334jPq2SAuU1gbAkhGEriqY6VM1MzYT9HwWZF/z+S3eAq/JXeEKLvUgRFsgVDb
         qfE4bEhErBt4HwaK4Y9pEnm2ucpXlIsAYof1R4elw6snKgmOQvXD4CynCMXTgkD6Czui
         K7nW6KkuHyt5taLvwxXzMbnNAWCkhX/OHFOngQVDX/pwKK8VlTBsNsRXYt2zmV6Tng0v
         dxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450923; x=1747055723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+wXhdSDx+zuoZH6nHSo9n5TKzFsocoVJt1FeJpCcH4=;
        b=aa/vJHObdH3KeCdYQUe0c6eSk6a3Ug+MmhfDX0gH1tCMUfZIYpawQR9xmM/x7ENByT
         SCZfsuTtI0QTfK+h91z7KyP5QkCZyC6pSE0bBW9Px64ou8nB3Ad/TQCeq6YcplAl+EUe
         FXxOxQu1yz/QyFiX9O7xQiwXuUIzF1g8CLaS6l8Kn78JjK04OnBneAk4DBtnQr8DdXn5
         loAQ6hNsINSgAhl4BByulE6THitwGkcMgiS3/j1pKhH+h1eGo/meqSzh9BJAsWgj+x6F
         eagl9rwxAW81IgJcnhQT0PXUqrwU/Vsd3D6QLzqdaRWX0VZ22PS14pFehr846uEKzqLv
         R56A==
X-Forwarded-Encrypted: i=1; AJvYcCX42CocUW/y0ejnMsHqKFoihB9pNpAN/JxdQYZqrg7Q3RUkRPBxf7lNmPk5NojbxATzcZmZUaSyoqezpZqeW5Pd@lists.infradead.org
X-Gm-Message-State: AOJu0YyQx/YZ8h6Ezzgjkw7VSSAikzrjsLPfgpyiInE0kJSaSNMGJs6E
	jN4D1UHySzQcSs9I29XYRma6wHTU7M0Lln9wVwkpRn0iMhTdxr57cwhztmF1NV8=
X-Gm-Gg: ASbGncsfpn9EJJJICMeZb5Sw5vtZm3c+aDZz8fiZVMG+G/TINMae/G2xWqh0D5lQ0f6
	lAa1j+QV+lUaTBw+otxWNZDfWsU8CkJ3fk08dy4iqOG4ypPO/JYveVjGvwGm0HAZHLssp1hu9gU
	NzxrZYkNqXLm5MXTak1dFZVdk6ahezB+kqTnetw0VOxLwojAuYS7qHTwmi0UNHZ82GaBDCI9Yw0
	/NNrbDzoVuDjuesuc3YTsVgfkTbRlPxhjSgRGMUpxlbZ3iOKFp2pqV0Lwv3AErsSGnI6CL4EYIo
	h4QImjjpdJ427ECx9Lkijpsr92z+8iGYFeqbaIWq1me4ZwexrfaEGnDo66ut1DlCKlNS9vg5BsT
	slXEt1NkBgYpY
X-Google-Smtp-Source: AGHT+IGWr7oErzhQXzi3/npvL3HPlXx3q5Y4G/drXHId6r0SRlbJxSxCSrWFC6Hy+SgESOr57oqMaw==
X-Received: by 2002:a05:6a00:3774:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-74049265f69mr23753393b3a.12.1746450923390;
        Mon, 05 May 2025 06:15:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e50:3860:cc35:2777:db60:cc54? ([2a01:e0a:e50:3860:cc35:2777:db60:cc54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbbaa2sm6906018b3a.57.2025.05.05.06.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:15:22 -0700 (PDT)
Message-ID: <fa33b7d6-8e28-40bc-9219-41dab643e88f@baylibre.com>
Date: Mon, 5 May 2025 15:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
To: Nishanth Menon <nm@ti.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com>
 <20250505123615.yqzdv7dlel7kyojf@degrease>
Content-Language: en-US, fr
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <20250505123615.yqzdv7dlel7kyojf@degrease>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_061525_153291_F0554C06 
X-CRM114-Status: GOOD (  12.09  )
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

Le 05/05/2025 à 14:36, Nishanth Menon a écrit :
> On 13:24-20250504, Guillaume La Roque wrote:
>> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
>> select on ARCH_K3 are not needed anymore.
>>
>> Remove it and give possibility to enable this driver in modules.
>>
>> [1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
>> [2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>   arch/arm64/Kconfig.platforms | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 8b76821f190f..5b63a42c4dff 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -138,8 +138,6 @@ config ARCH_K3
>>   	select PM_GENERIC_DOMAINS if PM
>>   	select MAILBOX
>>   	select SOC_TI
>> -	select TI_MESSAGE_MANAGER
>> -	select TI_SCI_PROTOCOL
>>   	select TI_K3_SOCINFO
>>   	help
>>   	  This enables support for Texas Instruments' K3 multicore SoC
>>
> While at this, is it possible to remove MAILBOX and PM_GENERIC_DOMAINS
> from select and make them as modules?
>
good point i will confirm  and come back to you.

