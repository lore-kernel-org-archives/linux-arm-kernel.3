Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DDAC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYNHFwLBPMiuE6a0KUHaSz0Gjwcyu1dBkTLSZJgvMTY=; b=meIMYN5I1zXjpgHwUhImJwUnJu
	4KSB+2UhimEjWfoSEXq3HSFJvZw7FL4Vb46RqTVXRQsEZMA75GZMBDmpgoA5Z1sSKjyMBh4F3vs2A
	Qu0m0+SMB2KjShJRk87VoO9o5kVuVgcEpWi8vv+soCGUIOVCDFo6oiolPPd8XCLrGD2BIABxcV6B5
	r1TohfvUV0uiEOPn1G3tXwO7kZdfWxwRn4HlFgKn5aLV1kXpOEhhc7uuQ/WerY5EkF0hwXiKO9xwZ
	Fi1/YSEHgzCdIlzGXDt8mSk3G5lMel8IEsa4cNz+sNmPMehSScMjlUEAUPfhFCgkxeilL6/TqMqfF
	nbx0FxKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6IQ-00000000ygJ-0jqS;
	Thu, 20 Feb 2025 13:08:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6Cx-00000000waY-3Ya8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 13:03:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-438a39e659cso5761775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 05:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740056593; x=1740661393; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYNHFwLBPMiuE6a0KUHaSz0Gjwcyu1dBkTLSZJgvMTY=;
        b=XD1LGpZfqwM373aK+30D2S63zqh8gF+Q//JB1MFAoPIb5wDxbmMmvRquVtTwd3mAEJ
         gG8nDjcgXRq4pRMcd3+7LAqHdB1E3muwXnmFbMQKBJ6LssLTDBDgiRjDbVhrkwCKDhie
         jEex5tFc24McBeK2k/EewMw7jDJExGG6dPHOPbc54jVGnxZpKrXk836I9noewjAsGDO9
         P6LXKclCBqCn7Sh7ZlFbMZvDApeReIAcjMM0NP+E5Fwg3z84ocDU/nVDZJerHzEd/gpC
         2x6QRwFf9l0MRbk6UpTHjRasl/pk4OzjLlepLqFi+UxLvVTVf84UE4CFtzkzKtLxFH9E
         mHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056593; x=1740661393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYNHFwLBPMiuE6a0KUHaSz0Gjwcyu1dBkTLSZJgvMTY=;
        b=tvIZ0/8xqMcB4EuOteSJ8SsZ/WDYUtzrOVR4+0AX6NUyFYFuFHwrXZvICGxDYtC/bX
         hx/iLWFtqrH5vql9QIdGUAoRP5KWvU/BCbZh0wV5yBihRFT1fX+Yht88L8Am2vnUYQ0T
         Ya+DrXslCk3QujzayE01HJsOE1zMavcTRFK9ONzQxAxYY7dlDXoEaTDQMUW7wkXslmEA
         4l39cOwGFHWULpVB6q9KmqA0w89+17LHLc7j8BE4xmjdPF0IGyrknefmmimO1mmEpQwV
         SoMuYDGyG23Xgstn69W9S3gG+uGLCtrgOzx7lYklmByucH1Asq4j9UvZEYbqYDgwbvMc
         GfKA==
X-Forwarded-Encrypted: i=1; AJvYcCVi0SqxKXQYzLHlhPpHRu6cREjPDxabnS8hudD25DxBkn0vZ8Zs1JSLKIsG28OQ1jSjtkosRej7Y0m+WntEcOpz@lists.infradead.org
X-Gm-Message-State: AOJu0YwIBUQ+AWAoZGrgLMXDnjqFhLnLAvVEb5PrgM/qraPcqcDBeBRp
	K4kCdtls4WU5qO7VuD1Cc2kWnrmf1aCCnqjnmH6jnGrxASE3nEcjh5FYeOQiorroXhZMgtOxHW0
	X
X-Gm-Gg: ASbGncuJ5ibGqcchIzzZ9pTEurDqK+c9rKBDk4/+YCu/1qRD44a9SuDGy4oKwLOVnTW
	i8YFz2lxkQ1aPcxNaxUgRC1HsnnywDB4Ui3QTq1caD+lJTkUiR4btOMK7rV2gfJBgBA/WOFv522
	dd2fbKefJhSKfQLcnNhhWBJUrNdkzIsEQ1WZZ8GjVDZParA85Iu67OzwfoOzdxVHYLMYfMHQTd2
	ZGnrfzg+Vmz9U5HW7xpdnWH2ijzubAHdtZlk/Y4wZ+YrhpfGotSPweTHKI8MKklAT/F3I4aM3D9
	UsvSplPVqgTYaAIKOJ+Q+NRYnwqhm9u5+17ceRrC4lNwNItD3qN6QUTZDZlI5ls=
X-Google-Smtp-Source: AGHT+IE+oBz+Bsv3JgfnD0JtZwzb1aLQt0+zm+GoaoUPVnk9517cD6yzlHLB/acLlXqZ8+4BcP2iaw==
X-Received: by 2002:a05:6000:1f87:b0:38f:3073:708 with SMTP id ffacd0b85a97d-38f33f11888mr20574908f8f.3.1740056592485;
        Thu, 20 Feb 2025 05:03:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e50:3860:b630:86ab:c45b:5c2f? ([2a01:e0a:e50:3860:b630:86ab:c45b:5c2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f561bee3esm5976564f8f.21.2025.02.20.05.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 05:03:11 -0800 (PST)
Message-ID: <c77e60ea-0a5d-4e27-bdca-e5b4f5904781@baylibre.com>
Date: Thu, 20 Feb 2025 14:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: config: ti-sci: Default set to ARCH_K3 for the
 ti sci driver
To: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250218-ti-firmware-v1-1-7a23aacfb9d3@baylibre.com>
 <20250218140537.wfagt3spwkcmc3uv@cushy>
Content-Language: en-US
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <20250218140537.wfagt3spwkcmc3uv@cushy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_050316_074257_34E33CDC 
X-CRM114-Status: GOOD (  15.15  )
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

Le 18/02/2025 à 15:05, Nishanth Menon a écrit :
> On 13:57-20250218, Guillaume La Roque wrote:
>> Defaulting the build to ARCH_K3 for the TI SCI driver.
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>> Link to comment done on last serie [1] we come back on first version of
>> series[2] to not use imply but set deps on ARCH_K3 in driver directly.
>> An other patch will be sent to update Kconfig.platform when this patch
>> is merged.
> It would be good to expand the commit message providing the rationale
> for this.


i will do , thanks for review


Guillaume

>
>> [1] https://lore.kernel.org/all/20250123-timodulemailboxsci-v4-1-b1a31b56f162@baylibre.com/
>> [2] https://lore.kernel.org/all/20221122202245.449198-4-nfrayer@baylibre.com/
>> ---
>>   drivers/firmware/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
>> index 9f35f69e0f9e..109abe063093 100644
>> --- a/drivers/firmware/Kconfig
>> +++ b/drivers/firmware/Kconfig
>> @@ -215,6 +215,7 @@ config SYSFB_SIMPLEFB
>>   config TI_SCI_PROTOCOL
>>   	tristate "TI System Control Interface (TISCI) Message Protocol"
>>   	depends on TI_MESSAGE_MANAGER
>> +	default ARCH_K3
>>   	help
>>   	  TI System Control Interface (TISCI) Message Protocol is used to manage
>>   	  compute systems such as ARM, DSP etc with the system controller in
>>
>> ---
>> base-commit: 2408a807bfc3f738850ef5ad5e3fd59d66168996
>> change-id: 20250218-ti-firmware-1b7c7f485e5a
>>
>> Best regards,
>> -- 
>> Guillaume La Roque <glaroque@baylibre.com>
>>


