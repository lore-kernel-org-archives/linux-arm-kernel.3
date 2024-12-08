Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D364CE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 16:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWQla5gDVVjHcf6+8kHq7uu3GYxa3VODVaIW6aQ6YQs=; b=VS5oA8U1IshapM1BsN+tr3nUzH
	H6nSex9WdCrmncD03Ee+tiGVFTY3XZqEoHKhoxViTJh3MvTIgQFSZJTtpkrY47aMsx7vnsljldzLg
	FKG+v5DPAmYCdGVHCg5Nj2GxQYKAacs/wuitp6OvS7Nj/Jr4s0c0JL+yqe72VLH11L28RmOCZWlhc
	xwuRC4fU4kbQDagmVfc7a7x47/l7lyr0v+D8I2WWHFpDzvX6iATlv6rGdEqYT+R76Q69Xkpyz75AV
	NkxuJmXS9C5nxWvc98zMR5h3CN1RmdswxhX+GBdXbnVixPq+SaJZfSSLcDMumZZsi65upEJkTlsAy
	EWjsiZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKK4-00000005Zdr-2ebR;
	Sun, 08 Dec 2024 16:39:56 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKJ2-00000005ZXC-0JwA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 16:38:53 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53e3a5fa6aaso1332043e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 08:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733675929; x=1734280729; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tWQla5gDVVjHcf6+8kHq7uu3GYxa3VODVaIW6aQ6YQs=;
        b=DeQwfGobTJKd84vCGcLuPFt/N9wEaQGRrva/599gPVCfHQyKJWWPmws9JmRiF+hBcY
         iHLeQmRhWttFDkC67HQskOJNp2M7fAUFcLCkbhMb8nZ466tXRkC/GiAnj2+ixW/mMzgi
         JFeeLyPF7/2/48WeDrI1wHyrPgMZnICjLN4XSB84ZCNj8jmOKLTJ8RFF0xlgVwVrp3Zm
         aWqMzemlMexqZgr0iDfx+uW8C7GAAfy6BtPbt39g2XVfGwdKjpDR1wK4Fsl+6Ycs00eZ
         YAJOCyPNe0nzzJf+m0AYAPe2e3KeDDpubOZyK14v1YszS8aOlRAT9dSg4N6Zo0ZEaFLu
         Lnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675929; x=1734280729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tWQla5gDVVjHcf6+8kHq7uu3GYxa3VODVaIW6aQ6YQs=;
        b=oJNgkJtYCcvKPTxP4CbDFkPilW8eILLTD2keffaY3D6iH+/OKLdzwiUikmCBjRgFMB
         TRncKo7dbYdck2sAPtgp0pSu8nUKeVvYPMdTLekFZkcrUtwSJH8vyqJ/DyFiBGZ+Lapi
         zzyzEyvblTsTqrs2uxSZatC2sSIRtmiGO+5kRivTOYf0hs8s44wZtPtmiI0HND4QV7Di
         KIeQMC7ygJKtZEoPWnbb5/otBilBWjjbVkF+kuEYYDUf0998v4gHjZ+AwrlQ0d+IVofM
         5MnqIkJKxo6WE9/nfHApyDwa2Ljdo047dS88GpzJGsZfI4+ZK4m1iiFcWtgHAbtNPc77
         haaA==
X-Forwarded-Encrypted: i=1; AJvYcCVZlH7si1m+CWfG955n/3o9psB2kl/GryangCtse3W2cvVlunOmCxz5rKEoOMIUZ3EDNNaxgKIcKJnC4fZD3r19@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ2sccEE6dum9Up001Lg13h0GfcE4+6bw+rfoa4INxvdB6NoPn
	9G5oq3zSQa3oo+vhJnPnaxqpCpj1mTQ1n9FiXlS2KrJOCqTlYd4W
X-Gm-Gg: ASbGnctSOpiqme0aVR4ewKIUdA3pIwH6V6vwu5AHCNvdIyA5mURz57rq9xp+/f7jIEd
	V6cEDF1YHp3daYwvOabIYYTbb949DV4QQpBE1oNzwDUW9AlO9mqrfvTBpNk74jfQfUGmlRckCyj
	p52E23FMuA5vU7QbasumNYhu4rO99uvtiie328Rn61BkIFvi19aIoN/gPV819g1796LkURoFE61
	VatlOeU/wRV/GDeksYTEJQQcnjoa936X8K9cOra/IIgx8FGmZvN81+u9Fh06Q==
X-Google-Smtp-Source: AGHT+IEmssxRF3/VI/LS5anznY2lDPYeo55qvxp2918kMLu1tBVbr6MeSeOUzIRyxYJMjo7tk1GTHQ==
X-Received: by 2002:a05:6512:3055:b0:53e:39ba:fb3b with SMTP id 2adb3069b0e04-53e39bb00a2mr1907592e87.21.1733675929280;
        Sun, 08 Dec 2024 08:38:49 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53f2309a3ffsm456864e87.35.2024.12.08.08.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:38:49 -0800 (PST)
Message-ID: <0ba62a72-8247-447f-b710-234385a29d14@gmail.com>
Date: Sun, 8 Dec 2024 18:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, javierm@redhat.com, tzimmermann@suse.de,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org>
 <ce757b8e-4e6c-4ba9-9483-b57e6e230fdf@linaro.org>
 <vxqi23hxw7bmtfs5wk3u7szganpv5aa74b26xrvpmbehkltodw@dpum7zrxdz44>
 <2eedbbe1-6b4c-427b-a369-5b08dc27deaf@linaro.org>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <2eedbbe1-6b4c-427b-a369-5b08dc27deaf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_083852_114989_51C94547 
X-CRM114-Status: GOOD (  16.97  )
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


On 12/6/24 9:50 PM, Daniel Lezcano wrote:
> On 12/6/24 14:28, Krzysztof Kozlowski wrote:
>> On Fri, Dec 06, 2024 at 12:39:56AM +0100, Daniel Lezcano wrote:
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +config EXYNOS_ACPM_PROTOCOL
>>>> +    tristate "Exynos Alive Clock and Power Manager (ACPM) Message 
>>>> Protocol"
>>>
>>> Given the importance of this driver where a lot of PM services rely 
>>> on, does
>>> it really make sense to allow it as a module ?
>>>
>>> Some PM services may be needed very early in the boot process
>>>
>>
>> If it works as module e.g. on Android, it is beneficial. I think the
>> platform was booting fine without it, at least to some shell, so I can
>> imagine this can be loaded a bit later.
>
> Usually the firmware sets the frequency to the maximum in order to 
> boot the kernel as fast as possible. That may lead to thermal issues 
> at boot time where the thermal framework won't be able to kick in as 
> some components will depends on ACPM while the system stays at its 
> highest performance state.
Also, as far as I understand, ACPM is used here as an interface to the 
PMIC, so every driver which would need power management from the main 
SoC PMIC would get deferred until the ACPM module has been loaded. This 
would make it impossible to e.g. initialize the UFS or the MMC card 
before initramfs.
>
>
- Markuss


