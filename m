Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E039CD59D93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDslh+ljpVvNODtMmRwl8AAxwmvJGoBek7yI5XWC5Bw=; b=dx9hC0YRzFwgxI1Gsji/9Ydat2
	JuCzXd7adNFBxTLavix8tfAxZmHUzjbcuUTRxFNz/hzUAZ8rNRivloDkuVsBlCHXk7ACnexDUN+AH
	P8boXCR6pGGd1ECiAlpGJwoTHji7B/Ff4hTqoH4Ec2oj9kMV+Ch9gONqYOCfPRcRXalcXxN+2tTUa
	5Nqd/QiuCccsEqI2HsaTsh7tBB1VN6rPKtIdoh6B7ducxOkFl/VRxrHH/WhTpzjHnb1Nu5KsZfwHC
	iHWaIyS8BD2SJmm44E3Iz7dT1lZnj22b7so/P6LyhHCnGKuoccGeIWPQHxM2eKb/r5CeNbmY5RVJT
	baFzH8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsq2-0000000AJTO-30eB;
	Tue, 26 Nov 2024 10:30:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsp1-0000000AJM6-2pOI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 10:29:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-434a1639637so13680125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 02:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732616970; x=1733221770; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VDslh+ljpVvNODtMmRwl8AAxwmvJGoBek7yI5XWC5Bw=;
        b=pIgrDN/g288GJhPEKHZ0PqmoOKk/6Zomctz/AWcvp02+AhRac9rCbiS5xvQ0/A3lab
         +Ihgd9B/vP9wngZYG6eNZijuaG/5B650lRIrtm9CrUS/qvsnYSu8mFZ3HRdyjgvZ8tmD
         y5E936VgKxoX6Wvq6P1anntV8dnXoNN5/q2199Rv7sDeww/Js2iloOF/2jsuFRQVyxBH
         zYjVA8AUv50YTfgu/NudnMx/gb0f0sYli7C2PnfjRGH4+mI7qS7M3K2fftdU5CRB9kR2
         460IobDwnnnBiRQvpDNwM8FRlD8t7kQGzdX8MLQAECpBdN/iBp2ewLZjRn54P62oS4cg
         kKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732616970; x=1733221770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDslh+ljpVvNODtMmRwl8AAxwmvJGoBek7yI5XWC5Bw=;
        b=lcLBKJTQqw8r3JWfm7m+2eMpOawoXmf9WXwLy9jcXkem5NusCdKRiwGwRPPq6/82hW
         48IKns6g8m5Q/WZWcPR284+VpY1Ai9dwhynVSsttrBB0YZv4qTrZaQ8Fm3XITi6FDijz
         jd/XcTA7p94A2tDujZhotyg3QvzUjEuaPKXXa6rL1TPJtvIYFgBKEkBc7fgGvDOl/IUO
         jM8RZz4+YSie2Xpm34QVLhD48/GVpcWYu3hhFJyPy3/x3Qb/uofQhIO7cQGI9DMHJnw/
         bZGXpkV3z67fUhgVbuaVZrxv0PBfK5Lkuq/+cWJkwykv0qEfFkd52q+pJmDPxV88Eda8
         4BGA==
X-Forwarded-Encrypted: i=1; AJvYcCUrfDArW0XGMGgwb4GKk/8OD21XtgUwx9iwQ4WCGLoMcvteFYkj1thWrWCr0I6/k2DBMYh9yHGipgnEqGfXNjov@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/f5gtdxvZ9knvHhw2NnkwQXBQy0DhWDf9mFg981nIAe8nbAUB
	2/8zMAuM8HKVGr2H6/hJi0UDNwSf2hXPwSwI/KozzGOkGHrW0o/52HyItDJ3T6BCij9X6vhyiHF
	CpQE=
X-Gm-Gg: ASbGncsvp1kB0300LDG3ZgYak5znGUTuAfVS21jO492+7LrsVjLHlgiubYg3OS+vU/i
	QldbzlqAxPuUl4lGa2Mj+T7tZC62aJs1vEZNt3P+3+XCfjNNpKMdxYtyjPtMfbvi7HqGJ7B9gam
	0y4yYGdex0TvyJI+uXz8HMakI+IQJOZxiiMDTbYbI1aNh6V0wrOC8AjO2eR9cnN6g/0RSD0MRRF
	vtGS2skzTVZmjjJFO4VDqdCIc98lMYaiJ5eizHum/3db+x8qQGwLn1YTB9iuKt2h1aEKeEp8p3T
	ESd/h1s8DFvKbw==
X-Google-Smtp-Source: AGHT+IFgeqqkJ6wjR9SgxT1xrYJ0KahQXa7sIHvXaict/TpEQq8UBgqk2qQhjj3zdFl3pgNOycsAVA==
X-Received: by 2002:a05:6000:1866:b0:382:4a3b:5139 with SMTP id ffacd0b85a97d-38260bed0dcmr13711723f8f.59.1732616970162;
        Tue, 26 Nov 2024 02:29:30 -0800 (PST)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde8c804sm159339195e9.30.2024.11.26.02.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 02:29:29 -0800 (PST)
Message-ID: <ed50c130-076c-4697-9f11-fe602c7ca03d@baylibre.com>
Date: Tue, 26 Nov 2024 11:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
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
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <Z0RkaqfID9v0age_@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_022931_980342_B332C028 
X-CRM114-Status: GOOD (  15.74  )
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

Hi Andy

On 25/11/2024 12:50, Andy Shevchenko wrote:
> On Mon, Nov 25, 2024 at 12:32:13PM +0100, Alexandre Mergnat wrote:
>> Hello Andy.
>>
>> Actually, after test it, "linux/of_gpio.h" isn't needed at all anymore.
>>
>> That mean all added include in this patch aren't required.
> Do you mean the driver doesn't not use types from types.h or dev_*() macros
> from dev_printk.h? I don't believe this, sorry.

> 
> Basically what you are trying to say is "let's move of_gpio.h implicit
> includes to become something else's problem". It's not what this patch
> intended to do.

I'm just saying that I've test a build/boot with "linux/of_gpio.h" removed and without all
include added in you patch. My understand is "linux/of_gpio.h" act as proxy
for the includes added in your patch, my first idea was "if I remove it, build should fail cause
of lack of other includes". I can understand these missing includes are mandatory, that
probably means there is another proxy header ?
Maybe my test isn't consistent because it isn't possible to clear all proxy ?

If that's the case, consider my review-by.
I've validated some include manually. Are you using a script to parse the file and raise all 
necessary "linux/*" include ?

-- 
Regards,
Alexandre

