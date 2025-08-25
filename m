Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05A6CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgyYW+EFxanlM3ZuOCikuS7pxBlxHl7zqHrCzYeY36I=; b=izk4MeeyIqSBx/V26JHynJepKb
	AhsMDct4oMHTyqRIjIrq1n552ORREMbo6+AQ+O7YYDwG2LnxWCns0SMqTWBvIXedCl8xSdyVoQD2R
	WcV9PLPyklM/2EDtOqUXANBiUIy5kP540npwuaJmaq6+zrYAGJVS0RiMjbyZ6gQQPoa9urx+/i6x/
	8slPCy19mIRlBUpqh2650mqZILKJ0hiv3hC3q/NmYuHRBh6pXlcQYdjevI/yGIbk0vqH1CUpPWpAx
	SN9dhmdKyzgcj4l7uX+mkgPuF/SSdxETL7pWn++bVkS0ZqiIbEDJ1xrO5WxDaDp3Z0xdMQQntzaiW
	UBndAxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYes-00000008L5r-46IH;
	Mon, 25 Aug 2025 14:58:54 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWOH-00000007vhc-3HPR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:33:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45b614ccbe4so5497145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 05:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756125216; x=1756730016; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TgyYW+EFxanlM3ZuOCikuS7pxBlxHl7zqHrCzYeY36I=;
        b=GEU6loIZLUCHMNIdN/v1u8HAVdF7EW+0+pwAcuPOvigILuWIljBtnuERr4ewQqXwYG
         y2xSPZAj6XAyfhP2tTUT3RZmPJPSK8dl/Q2KmOT+E/fd/dYb0NXSD0ivcL1VFfCwNarh
         aWhY+I5Ylkc7q2077oEhXYSTSu2oeBz0FTrVBpUcfahHZ3Cso85jErmvR0B/2Wdc2zaV
         ax4Le2nW6NSVKhn5GU4DyUFTyFDaUcQgwXdc3LAhATO9v286W0HoLP6B+nIvYs96STWT
         dQ2FayJLOAKHIOeRFMELBMGZXJeWhqSUIBuJaGw0dDOtmONFvUjCxIkROxkbDD4qBMex
         W8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756125216; x=1756730016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgyYW+EFxanlM3ZuOCikuS7pxBlxHl7zqHrCzYeY36I=;
        b=mUnivEusiJwQ8Dz2+MjbbN25Hp8sbO7XpplDINAoSw5hEipORPnyjaN8LZeqdF4Kua
         qiFGgm+SdAeyP0Fl0Kr3P5ai7qagUvb1aNgkT3w+VZZR68VQsaliopOEm8FPxWmxul4N
         mBCBLPJLKGwMSm4nDQyemYUIynsVw+Z5VYHaBTH7v5DGURm7L300sRJVX3WIRPjxVO5N
         fICRkheZqyTngrdekdyh1mY+0pJdBF31Hw51q9V/lLrHJiyFliDH/DzNeCWSSv+Pyjcp
         Dq4tMzPkw4W74ljmVR15Ey4RSDMonBYddtwFdhY9pJL9THTHOoIwvkENq52d6XL2MbPx
         wgFw==
X-Forwarded-Encrypted: i=1; AJvYcCUA618qzq9MgoGuAOATsY7jXKAYWWhOYMevXuWMfZcKGOcEhsRAqS4yDs008/n7ksd3Eg54aRtOv/j9QcvIScZ1@lists.infradead.org
X-Gm-Message-State: AOJu0YwyYu914rxCfSOMou1NuVgGU1qjEPlOzgu1WGqZ/J+tn8n+LpnO
	Mvdh8bsifS64rk1pwckblG9GUOIgSO3AYI+0/pHGnTS1r07TM1dpgOucAsVc9kXyjwA=
X-Gm-Gg: ASbGncsI7JYr8xkWlK+bvqKqmuLcd/S4AG2GIL80hm1iFCwqb2D4GiLIR/F3Usf+cuO
	78wxQLZTHwml6p7gEzr8HoetSJrnpheTsnKGmjKtGGFl7OkkidGxurU4Jfl4KvCt0RtqyFun+CE
	Pxg/ugXB9lVjeavHLOHuTikJIFX0TGBvymbDDc+E1yvTgvlDaLCqj8bWPWu4a5p9dbCv9q7TRpn
	CRE9bXosqRkU5uPa58e3Qnv3bZG/H+LE8KAOxoOk8gbIE4vsmK+Chkuo2FVey2bjMHlBhZhLMJp
	POkrzkPi9TR+7XupOCqyQnJKloXe4x29nf1UDp5jafOw0Uy6myg4+KcumcEwQWq0LmqPrmZz/9W
	PoY1HMoxM0FemXy5825kJQghoKgqd5520Rm2ys9LPRA==
X-Google-Smtp-Source: AGHT+IG8r5+sVjMa01w8IZgVwuhCEDiGDvftj5dR2IQIaEIX1i8970n/oog07azqK0eoXxNWJVJyPQ==
X-Received: by 2002:a05:600c:1c97:b0:45b:629b:dc1e with SMTP id 5b1f17b1804b1-45b639a0d26mr10121405e9.1.1756125215756;
        Mon, 25 Aug 2025 05:33:35 -0700 (PDT)
Received: from [192.168.0.251] ([82.76.204.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5753adf7sm107972935e9.7.2025.08.25.05.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:33:35 -0700 (PDT)
Message-ID: <b84dbc22-62d6-4a63-9b53-80e939c36e38@linaro.org>
Date: Mon, 25 Aug 2025 13:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: exynos-acpm: fix PMIC returned errno
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com,
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org
References: <20250821-acpm-pmix-fix-errno-v1-1-771a5969324c@linaro.org>
 <c744f5da-ed3a-4559-80b1-9cef5254224b@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <c744f5da-ed3a-4559-80b1-9cef5254224b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_053337_835525_7BB8F994 
X-CRM114-Status: GOOD (  16.66  )
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



On 8/24/25 5:50 PM, Krzysztof Kozlowski wrote:
> On 21/08/2025 15:28, Tudor Ambarus wrote:
>> ACPM PMIC command handlers returned a u8 value when they should
>> have returned either zero or negative error codes.
>> Translate the APM PMIC errno to linux errno.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/linux-input/aElHlTApXj-W_o1r@stanley.mountain/
>> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/firmware/samsung/exynos-acpm-pmic.c | 36 +++++++++++++++++++++++++----
>>  1 file changed, 31 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
>> index 39b33a356ebd240506b6390163229a70a2d1fe68..a355ee194027c09431f275f0fd296f45652af536 100644
>> --- a/drivers/firmware/samsung/exynos-acpm-pmic.c
>> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
>> @@ -5,6 +5,7 @@
>>   * Copyright 2024 Linaro Ltd.
>>   */
>>  #include <linux/bitfield.h>
>> +#include <linux/errno.h>
>>  #include <linux/firmware/samsung/exynos-acpm-protocol.h>
>>  #include <linux/ktime.h>
>>  #include <linux/types.h>
>> @@ -33,6 +34,26 @@ enum exynos_acpm_pmic_func {
>>  	ACPM_PMIC_BULK_WRITE,
>>  };
>>  
>> +enum acpm_pmic_error_codes {
> 
> This enum is not used. Size is not needed and you can just use
> designated initializers in the array.
> 
>> +	ACPM_PMIC_SUCCESS = 0,
>> +	ACPM_PMIC_ERR_READ = 1,
>> +	ACPM_PMIC_ERR_WRITE = 2,
>> +	ACPM_PMIC_ERR_MAX
>> +};
>> +
>> +static int acpm_pmic_linux_errmap[ACPM_PMIC_ERR_MAX] = {
> 
> const
> 
>> +	0, /* ACPM_PMIC_SUCCESS */
>> +	-EACCES, /* Read register can't be accessed or issues to access it. */
>> +	-EACCES, /* Write register can't be accessed or issues to access it. */
>> +};
>> +
>> +static inline int acpm_pmic_to_linux_errno(int errno)
> 
> Drop inline
> 
> s/int errno/int err/
> (or code?)
> 
> errno is just too similar to Linux errno.
> 

I agree with all the comments, will address them. Thanks for the review!
ta

