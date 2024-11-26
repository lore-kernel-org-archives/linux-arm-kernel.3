Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984DDD59D90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 10:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DL8n6YXE9oeQeCSKnUhWjhtX76X8Z5GX8Xt7bIlqK5s=; b=aoWl5gfkX3b09Nx1s0P7w8yCrS
	jNONk8KTDnrcSaiw0CYBJ3NQwqms3NIGhkEgaWDuXWPPRmJHkk514gUYz6O+GhdXC9h0wONGAVNau
	iMLG+/mpDd7DdUPDBcRsBvb4aW78qQvMa/H6w1p9YuLGO8dEEBwkLiuCuCqpzQwXQDHTjSWZTL6W0
	tl2rMaGQZOO/G/WBe1yDDiLJzq+79dQbUrmYNcFr135VfjvIcQex1HqNsnOki3tMULFTkwtDnylBF
	fLTI4c4k/eSHzl41Z2Z8v3w6zi64dmw6YlVoJ3IFILMI8a7WZwlEYsv8W/2xC1pbDuU8rxZ3EQKNx
	FXQFf/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFt0d-0000000AKsJ-1g50;
	Tue, 26 Nov 2024 10:41:31 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsws-0000000AKD4-4AWE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 10:37:40 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53de5ec22adso2206315e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 02:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732617457; x=1733222257; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DL8n6YXE9oeQeCSKnUhWjhtX76X8Z5GX8Xt7bIlqK5s=;
        b=NKO9bQa8DqHZeFeRUsJx6g580sYtUD3YIYRwIj9RxaqdAy2fd6pxGhPwFWYc4uN25x
         /LZ0LY4skmODp0nkpk3IE9jG8jjAZy53r9eZ0/EUVPUAxn3iwPTh+/iDtGQ6g9zZlN7B
         hrbnoBFMUSiF5HTMRUh3InTDOe7GAUH6jdcjW96qEPpFLlQoDYnTOjtI72TUb/zNTZ9e
         dYK3NhZLh/WjKRvOyDmxSj7zn1TDMhdEVg5G1DDSPMx7GXqFFi6t2cRvLNOr0CvnLQ+r
         ht96JscujMVjg/+q0ixjf949t0JT0QUrseSNo2FBcDcM5naMBcYrNGfTFSiAxrkVjbNQ
         OvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732617457; x=1733222257;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DL8n6YXE9oeQeCSKnUhWjhtX76X8Z5GX8Xt7bIlqK5s=;
        b=h/ikti9dKxMEnrjjYpLMWzWZUPHEJUXQFYs/VHWcbh7Vz8GtJU7kyd7d2EoVtKxEif
         q5hxEx+T0B8zcxMfk8smQG8xpk85Vt5rTqJzdYmt8/xdCgwuc3HSrw7mIK4oeUp4SoMV
         Oe4SGlQG8LIzBb3l+Tm7Xtmeifn2YQFAHA66IZBlmGdbI8pV0oD847VVvh3ftfNstyp/
         LYZ3tRAWqNayktZN4Lg0k+xFl/0nx9IgPHEo/tYKXaSsgLLbGDO2E9aVx+MECu+QON+Q
         iz7fbuge4tB5rfHc2k7X0GKIZ3MTr94eHpVcChRSdtsmgh/R/E4/bC0Gghilm0ygySLw
         6r5w==
X-Forwarded-Encrypted: i=1; AJvYcCX5b55A2uI9cTUnDFiEJqjRaDZ34EjZ/rVxWgWmRHj3/8d6iAybY2J6aXL4TQOnnzvZOk4weU56Ql56ID0w63eT@lists.infradead.org
X-Gm-Message-State: AOJu0YxoVfzjCXhoVyccjdjkorSwgZEbfG3QegzuNtt89U8pSGwV92O7
	wAieyA4d1kfKeTO2hhs+tUOQH4Wn2UjWiUQUsh2pkwt0Q8x8V1p+LgQ0SjAjntc=
X-Gm-Gg: ASbGncvWn8XktSzh1fdewECzbqQHgGHOcZdOZQzxq3WdLi9sIPHiTqqc4DPvydBQHX6
	36/LXtSrA3tdk+wVfSMaKZ+WzTNALhexPPrPRB5DUsWuxzeZp7kXgTiBaZs6k/13bdmcKatSz7o
	hB95o3qTzeov9ocYPxfIQLcDDlMYym+j+mbQwzXN82yfVDmXq1BLm9dLNSrSeZNqYmFvdsjYQ3P
	ie0Ifv97D5AFSXH/abgOzZIF4qnjz3cjwo5g2l0RApRxUlRxZE5Unwglst6B0TGxBEIGjhaiGmn
	Xu/t27Ni5dMxDA==
X-Google-Smtp-Source: AGHT+IGm9T8BP8eFPLu32fca54MvgO0F+vLQWk0tpYQ0ycW//DTGAHcftsM6xJdvIIJ/40Jr4imMYA==
X-Received: by 2002:a05:6512:39cb:b0:53d:ec92:2968 with SMTP id 2adb3069b0e04-53dec922a7cmr947039e87.17.1732617457163;
        Tue, 26 Nov 2024 02:37:37 -0800 (PST)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad658esm13229915f8f.8.2024.11.26.02.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 02:37:36 -0800 (PST)
Message-ID: <49fa1677-db35-497b-afae-caa5dccf3747@baylibre.com>
Date: Tue, 26 Nov 2024 11:37:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, Nicolas Belin <nbelin@baylibre.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
 <ZykbMlshvlwCaeGJ@smile.fi.intel.com>
 <d7bf7863-fd24-4f8e-8cd0-d84867a997bb@sirena.org.uk>
 <dad2ecb7-e624-49c2-a7d5-0ff53b6a1686@baylibre.com>
 <Z0RkaqfID9v0age_@smile.fi.intel.com>
 <ed50c130-076c-4697-9f11-fe602c7ca03d@baylibre.com>
Content-Language: en-US
In-Reply-To: <ed50c130-076c-4697-9f11-fe602c7ca03d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_023739_039249_BCF84616 
X-CRM114-Status: GOOD (  16.73  )
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



On 26/11/2024 11:29, Alexandre Mergnat wrote:
> On 25/11/2024 12:50, Andy Shevchenko wrote:
>> On Mon, Nov 25, 2024 at 12:32:13PM +0100, Alexandre Mergnat wrote:
>>> Hello Andy.
>>>
>>> Actually, after test it, "linux/of_gpio.h" isn't needed at all anymore.
>>>
>>> That mean all added include in this patch aren't required.
>> Do you mean the driver doesn't not use types from types.h or dev_*() macros
>> from dev_printk.h? I don't believe this, sorry.
> 
>>
>> Basically what you are trying to say is "let's move of_gpio.h implicit
>> includes to become something else's problem". It's not what this patch
>> intended to do.
> 
> I'm just saying that I've test a build/boot with "linux/of_gpio.h" removed and without all
> include added in you patch. My understand is "linux/of_gpio.h" act as proxy
> for the includes added in your patch, my first idea was "if I remove it, build should fail cause
> of lack of other includes". I can understand these missing includes are mandatory, that
> probably means there is another proxy header ?
> Maybe my test isn't consistent because it isn't possible to clear all proxy ?
> 
> If that's the case, consider my review-by.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

> I've validated some include manually. Are you using a script to parse the file and raise all 
> necessary "linux/*" include ?

-- 
Regards,
Alexandre

