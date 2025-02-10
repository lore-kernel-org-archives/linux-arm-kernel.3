Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAC1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgguTSFnjwWEUxBDa2C5Pf4WCfOFI/5UFo5VErVUJi0=; b=k1noRXgG7hvtIJkzzQv+yyJHle
	9rlMoPneOYudez7ldjEbK1XMuEcoOo93K1bmNSttJ3tYbbrj89kqUhvtu8/cKQR5nbzmhGvqPzYDC
	JbJMo50k0qsgDdwnxjySB4l1X7VUzO3EyHqTbOHIDcWO5JEXhHJhu0NmSqEgpa2Z44MSCk0p363r2
	gaylkb7IYTq7rEj88lilCisyr18u1K7qWGylsuxalZFT4QBkLV+N0SOfIuNuh9J4M9YGzarWvrIWD
	47CHKxtDS4CSYIjbMW810nXJislKHt1z8Zt9b9YOhD1ZN5AQhKeRA69nh8XRuQuYx6VxVnqsDLYII
	B5Mr9eig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thPpB-0000000GmJC-1kO3;
	Mon, 10 Feb 2025 09:11:29 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thPdE-0000000GkCK-3GLz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 08:59:10 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38dd006a4e1so1829546f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 00:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739177947; x=1739782747; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgguTSFnjwWEUxBDa2C5Pf4WCfOFI/5UFo5VErVUJi0=;
        b=DpVmZeaYnF2UXs3ZRTSdvg7g17UryHlgFNTgyORcFkQ9rXwePckg5VM4j46FegKNHz
         NxdzFIbc4Q8Ka+Ymv15fTOGoRTI9T5MAS6kqxI+nUPQTBCFfUVvq1lKQI/izwCGxoYbA
         GmKshnJ1K9qFtCwPeQd6rmCKnKbQIEA65rOFQslQwlUNuQvgYvVeBKZUpWvJJmEM+6n+
         PYPASAP9vqQ/2oCLr8WaLzyy6YsBzEaBvYXualMyQxuAnGE7XbseBmM965u/oudGm8/x
         PUvh+hFVEBpcrZ7fy0qoy3n/Av1eNFsaBh+KWZaEw3z/SuvEsxO3ZIMnx3Sy6mFSThAY
         chFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177947; x=1739782747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgguTSFnjwWEUxBDa2C5Pf4WCfOFI/5UFo5VErVUJi0=;
        b=QnPCtXvFfymSz1rlkxGEXXSY08+s5IROiAbzb2D8J7cxBoUzYkoY51puqKEj/uoPoX
         epfFV0sIh8awNe/M7v0pLFEFVVnTi2Zz9hQTl8c8MeWkW02H4b4fCCYU00N97wCpNQld
         zFtqMKX2ZyH5/X53GFuCxPAAxKHfUHjDnxaYYjUndkPogsvzZuUOtRYwvqRQgIPRh30u
         eXBGaE8weAvSZrxRnjb4gCn7JAMnGojsY1R+3ek9KJTAyhkU+/3zlYCmS+1ZYVE9klod
         j5Y5UjK9GcLiuAIygq9IU6JdxinuHJcxWl0GM3R0moAnwPnTp5sgiIVbJA29VoFRXXVO
         9J8A==
X-Forwarded-Encrypted: i=1; AJvYcCUE2s0IF+rcKjK+Cb+GgAswtWGTar3G20pBWSM16AFHroP7+u+N428fwuk7ME3ZxPsen2fxHfBq4LmTGV/DJlIG@lists.infradead.org
X-Gm-Message-State: AOJu0YyzNGt6kgA49XDthstuUNcsuGMaL5wgMtO3dxQZg/VhEw2xLn+r
	6JpvRKu2VhnAdx8UPTSpmZq9Ba/Zr2VktiM7oo1Hk32gErw/R9Z2HXTOIissiNk=
X-Gm-Gg: ASbGncsaRiVoCmpATPfrm9uJ2ZF68nSGIZL/d+4FfoRfEaklLa7dyQEWZPswx7Ov2r3
	IraENu62llNKVGEVq2l5DPfMWBhrNqGKHy7RguAas015uO3B82Km/uoHHywULML/mYxsSgQ9Tmv
	b5GNvt1/O3XLxG4M1wtsQaNcAfua38tCEYeQHZZxFPhKwaUev+6ov1HJMdKDSjGDLcjRyeRf81o
	IVlnRHH5M8enpGxcRSrQ6HVigOg8SSoAU1efjFi1as0C8LKMPWh3D2mpCZhW7ltPgg6sgCs0P3l
	yh+Of3kolklzsbbMkG15rT45
X-Google-Smtp-Source: AGHT+IHW35O2w+OVAfjf6xNzfb+RSzDit7DIG4eCcKdu75kyP3tGrbONMFt1iHptvel8q6LbiT3P3Q==
X-Received: by 2002:a5d:6d8d:0:b0:38d:dac3:482f with SMTP id ffacd0b85a97d-38ddac34a13mr3776794f8f.20.1739177946954;
        Mon, 10 Feb 2025 00:59:06 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4d826c6sm6159674f8f.69.2025.02.10.00.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:59:06 -0800 (PST)
Message-ID: <503b7ec9-e0b1-4351-aa34-3089b2055eb9@linaro.org>
Date: Mon, 10 Feb 2025 08:59:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] firmware: add Exynos ACPM protocol driver
To: Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Will McVicker <willmcvicker@google.com>
References: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
 <e1fffd3b-d3dd-4f46-b7b6-1f03f934dd30@web.de>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e1fffd3b-d3dd-4f46-b7b6-1f03f934dd30@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_005908_825220_604E2C8F 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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



On 2/8/25 3:31 PM, Markus Elfring wrote:
> …
>> +++ b/drivers/firmware/samsung/exynos-acpm.c
>> @@ -0,0 +1,771 @@
> …
>> +static int acpm_dequeue_by_polling(struct acpm_chan *achan,
>> +				   const struct acpm_xfer *xfer)
>> +{
> …
>> +	do {
>> +		mutex_lock(&achan->rx_lock);
>> +		ret = acpm_get_rx(achan, xfer);
>> +		mutex_unlock(&achan->rx_lock);
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&achan->rx_lock);”?
> https://elixir.bootlin.com/linux/v6.13.1/source/include/linux/mutex.h#L201

I'll replace the open-coded mutex handling with cleanup.h guard(mutex)
and scoped_guard(mutex, ...), thanks.

Cheers,
ta

