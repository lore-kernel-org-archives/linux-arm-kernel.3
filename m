Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243FBE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 07:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7jyHK1qzo2RBuW8p7OwjlLlsp6SzR2X66LUKW3zBn4=; b=IwJ5DDftpfOnmCDXG3SZHSvYLp
	OqudH2Fj6jE6LYOGZRRx/2nRb1w8hCAEpAQTKKY7FJQS9m1pgJygakwb6M+ZaJ7QxI2yGw/9g95tM
	kk4bKAH8On+Hd+WGr0UFUz9bEVrV/vyxgQZRbGeJF3xTT6wjnUXM+6tMfMP2XWqDUtYnLuB9EBg5D
	Tj2hduunqHjPRpre9i+aZHimVKXZpIYzjGx/9qyVLBf2oXij025iDne9KXILEqXYgGGsShWzAFkgW
	t4hxeeYLhkNsPDek/cOAS8nixysc8p7i3oE91Z2g6outp8q23vXJGRaWCpAsg9H5scohR/nkhVPjh
	7jNOT9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhku-00000000QeD-0gDb;
	Mon, 06 Jan 2025 07:42:32 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhji-00000000QY4-22kB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 07:41:19 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so20968824a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 23:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736149277; x=1736754077; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7jyHK1qzo2RBuW8p7OwjlLlsp6SzR2X66LUKW3zBn4=;
        b=AyiXWykFBJn+J4GZbj41hWsuTiOXGP/++1ojQomaciGTwBWXLnm8vFAG00lh/mBL6r
         3qQKziVcyR22euVHMgKfqM2Xu5dUSWhf9eI/+Or2f3la8/LT12NGXEuoYe+nW85m1kVU
         65pP5EvIW1r1HW7XtbeBA6+JY3YHzSBAQNzuU+8iodTUqR7LGEH1DJaNLR2fHUBJSlmr
         1hh5zFudLezzeY7J3znmApfB52KMaxbPBOMFWbC4sq6y8oD7ftFvpmtooKtRqQ1D7B1L
         prRQb+k7HsHjuQm78H20+KWfPF50rgP2B0XGXpcoEaitu5sTdz5lfiOHiKnyPZua6UN3
         OsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736149277; x=1736754077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7jyHK1qzo2RBuW8p7OwjlLlsp6SzR2X66LUKW3zBn4=;
        b=g5PSjfYSoEwjXJG7JT1+W/td5Ma1jT5muvYUegSUhzuNIZejd7GyFs8ACVNWms7wYL
         btzInwXfiOJr69ZqdX8tFWSPjIqRj/4hEVDkFDAVPl/v/ruO6Fbiiak9+ZtuESqtT1dM
         9Uke5yQ0vDk81nPZ8uVZt7xqNiBsPqf7ZvlrYu0bkAmQffk87Iy91rsE0spmQA8gLG1l
         7JX4Q1k9Foqa+RWgAern4/VbeCVYRqIvAwFVXFG3f6/frXsNBV5kcCN5fQZOIUgt7HBr
         QumiYpnP3f8Ki6UQ/lWBlHfI2pPTiYyUycaQvsLnSkwhxr4g4nGhpA2DCBWryVhHtoiv
         o6GA==
X-Forwarded-Encrypted: i=1; AJvYcCVElRVtWK9bmjus2GX97HII9AkU8uFqPZX8XBwH2TjeNsXH4fnXhnb544fRphmg3XNSbEAnPF+Emt/MfcoE1n5z@lists.infradead.org
X-Gm-Message-State: AOJu0YzRDDcrWlGwEUBqLmaVDizZi5Eh2PjkpJ6rtF3cVWDJVAcOZ6GM
	dde0+yshJTf7/PjssS8kmDTL9GwvJ4muIjSLWNBBFQozY+TATkGl
X-Gm-Gg: ASbGncsxB/2I1fTxLACh8iBNuD6Kt5Oxkwcw/n8sufBZm5zgWnKkIuRSSqULXUfCwqz
	Cu+bCJYRzTa+gCqZIYupzLTj94iRHcbv4z48NwY9qCuP3vjSVeFreVSSXlniQITH9nbcwBgD62l
	ShZApK00mHAsoSZ+E7fBZ1FCzXwjJCyea3QjM0x/hg0CUTkF00QZJkC31F4j78BmlMzr44Smx8B
	zNMb4Q0wF6ptZgwPvseBfWnSB7P+b84rSONBVXEHWG4yaiiUvanMYkGD/FmTbDkhMcyvEs=
X-Google-Smtp-Source: AGHT+IGUK/KAzsavO8RxgoMoX/fDzaMo3/KjbM9ldtNHhtumpl9cdoVvZA3QKNbl7UwUnBmIsW12Fw==
X-Received: by 2002:a05:6402:1588:b0:5d3:ba42:e9e3 with SMTP id 4fb4d7f45d1cf-5d81dd9ce81mr141034940a12.13.1736149276384;
        Sun, 05 Jan 2025 23:41:16 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8954bfsm2246158566b.60.2025.01.05.23.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 23:41:16 -0800 (PST)
Message-ID: <a7686593-ab07-4e18-912d-745576c6a450@gmail.com>
Date: Mon, 6 Jan 2025 09:41:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: samsung: usi: replace USI_V2 in
 constants with USI_MODE
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
 <f0702bdb-846e-4817-a76c-5ce17dea38c8@linaro.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <f0702bdb-846e-4817-a76c-5ce17dea38c8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_234118_534674_DDB1CE1D 
X-CRM114-Status: UNSURE (   9.71  )
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

On 1/6/25 09:36, Tudor Ambarus wrote:
> Hiya,
>
> On 1/5/25 4:03 PM, Ivaylo Ivanov wrote:
>> +#define USI_MODE_NONE		0
>> +#define USI_MODE_UART		1
>> +#define USI_MODE_SPI		2
>> +#define USI_MODE_I2C		3
> USI_CONFIG register refers to the protocol selection with USI_I2C,
> USI_SPI, USI_UART. How about getting rid of the MODE from the name?

I thought about that too but I believe that mentioning that these constants
are for mode selection in their name is generally a good practice. Let me know
if dropping _MODE is really needed.

Best regards,
Ivaylo

>
> Cheers,
> ta


