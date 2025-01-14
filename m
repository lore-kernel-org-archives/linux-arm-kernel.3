Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EB6C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQu9l4If54VEx/qw1TONKfUdVJ9/1OBl33V3eKp1goI=; b=WNpl7yjr0EayAkRFyrD7jr+leQ
	yLCwRqKpiDQkOvWj8EsJUKTWn5Q/k9wrjgV5f39oCtFMomFTi7PJy6CQMdYGLLev3uznCcFRPzSjF
	UQX3zHHWPOeg1EnHbd4t/rGFKmHRdVJSivlZDT4rl2BFcvVrV8pPSRhHsaWMNLemcRpj27/3DcwS+
	R2QF7E7DLVDhvSk2Gpzat5Xm9Qkv6PBrKJMfT1nVWR18bw6A6pvrl8ERRKZlZIo7qYjni2QYjlZhF
	O6e4xIHiSqSu1rAG05lqqj2ue655LAuTA4ZOTRd3TOJKmwjR2LEo5WY42cT/n/p+RhG16IPqzdgKV
	0eCkL6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXow1-00000009rwh-06ne;
	Tue, 14 Jan 2025 21:58:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXoui-00000009rmQ-0bY1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 21:57:33 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d7e527becaso9997231a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 13:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736891850; x=1737496650; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQu9l4If54VEx/qw1TONKfUdVJ9/1OBl33V3eKp1goI=;
        b=ktDqyS07ZXEMNeCbIB5rV9KlsRiffPHS7xJLiMO9GRToMW21tL6iwvqvT2Meqm7Db2
         1++Wd1dWm3eg1pzqUf0NFgcO18YtvViFe/DcDVkIq7KO2uipiwUCc0v7DNEmrnbqeNc/
         bWgrX+6btsbht172+8P7NJfGX5Ods6eYxV/A2vdYDwIOqlpkTNwXVyZ0Obs7icw1tROa
         1tF8el1QiMOfzDpvRq5Ieq2L6zMhQ4EKAymLcAon86IocnoVJruH+R47Pfhyy7GlzmfX
         agaapnZQSaUdqzl+kjiDk0X9kORPF0GWqBlLgPU1YM4vLMM1pQpPW+GnL7rp1aT2tYgC
         7NLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891850; x=1737496650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQu9l4If54VEx/qw1TONKfUdVJ9/1OBl33V3eKp1goI=;
        b=IcWMZxB4YP91xdw9mHyBcRRfI1RfDDXL/o+IuqWpYdNGS3Kl8OeM7EJOHe/lyxbbsQ
         Nm8J2QODmLcDdDISoqZwlPpSJVifWzBNGLS0wWA/N1FreseaWXxpntjypXSCsmTWSWvV
         cTclmo/XYmghvocABns9a/+RJ/slZOn3In/SGwz6pOD0JStabgO9XlDh+j26SMXcJDKC
         5DxyaxBYnOgELb72umqXgyQP2HlLWHz2O2N8zVCeLnbbWDKZdpjObB0oE229mart5iYS
         ZyPan+e8D95vzw3Zy7XH14tzfKASLR/6uyTZ4eVQ60nQsry9KHnafUhNjwNbuZa9/RiQ
         CJig==
X-Forwarded-Encrypted: i=1; AJvYcCUD7kuntF1ubjNbAd41tx0TM6MVq/SU+IUP6WAoIBL/eSf3JACj4byH2ly8N5BxcS40/W4WbVVwwR7/xhKCpr5X@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdmy8u3khFLP+rAGhyFVHynCCVb2MQfPaImRON3Bt10ThFgdDQ
	he1vYYhCL7/iPJlL1oQBb3swujh2W24I2OAWy8s/5z2/ehuIUUCx
X-Gm-Gg: ASbGncvQFm1I0727KUU+OVzQ5vTvJ7ws7b93vBIplncYzwDuFh0zxTHdShvTb3melJJ
	6erJbN3SEjAEJ3+sjxyUPAaVy0Pum3RG2wdYVH6Bwgw6zm/Dg38iq0o+5MNL42DyzNiQiwvT499
	nesLQGYTgBH/5SIpRq/XCrRZzYRIRzZyawUjXNa3LORFEFp2gNPt2Q48xujPOss9NsZRIMhOmcg
	VxpACP+BdfOKMY0rB9IgDC6WJ8Tu4gECHhZPxa2qBDmTB6wHmwr9R1sQH+mV6QsXnS8ACists80
	fDziMra55TBOWu0iBJiYaDwKRQh+IECq49k=
X-Google-Smtp-Source: AGHT+IH2uBguYrAt8RmEQaVYzAmbMVFnqhUDBVbYGhqIhJtoDuRg3mXoojY+VnqzpULof5Ie/4Sl9Q==
X-Received: by 2002:a05:6402:26c5:b0:5d0:d491:2d5e with SMTP id 4fb4d7f45d1cf-5d972dfff56mr31360609a12.7.1736891849618;
        Tue, 14 Jan 2025 13:57:29 -0800 (PST)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c523sm6730831a12.8.2025.01.14.13.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 13:57:29 -0800 (PST)
Message-ID: <15e9931a-b817-4dd3-abb6-9718e002c6bd@gmail.com>
Date: Tue, 14 Jan 2025 23:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] soc: samsung: usi: add a routine for unconfiguring
 the ip
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
 <20250109090325.595475-3-ivo.ivanov.ivanov1@gmail.com>
 <81ff734b-7a5e-4c98-9df2-9b65996fff78@kernel.org>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <81ff734b-7a5e-4c98-9df2-9b65996fff78@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_135732_189676_AD776C10 
X-CRM114-Status: GOOD (  12.35  )
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

On 1/14/25 20:03, Krzysztof Kozlowski wrote:
> On 09/01/2025 10:03, Ivaylo Ivanov wrote:
>> +static void exynos_usi_unconfigure(void *data)
>> +{
>> +	struct exynos_usi *usi = data;
>> +	u32 val;
>> +
>> +	/* Make sure that we've stopped providing the clock to USI IP */
>> +	val = readl(usi->regs + USI_OPTION);
>> +	val &= ~USI_OPTION_CLKREQ_ON;
>> +	val |= ~USI_OPTION_CLKSTOP_ON;
>> +	writel(val, usi->regs + USI_OPTION);
>> +
>> +	/* Set USI block state to reset */
>> +	val = readl(usi->regs + USI_CON);
>> +	val |= USI_CON_RESET;
>> +	writel(val, usi->regs + USI_CON);
> Also shouldn't you enable clocks for accessing these? They are being
> disabled at the end of exynos_usi_enable().

Hm, perhaps. But I find that weird, since I haven't seen it in the downstream
driver implementation.

Best regards,
Ivaylo

>
> Best regards,
> Krzysztof


