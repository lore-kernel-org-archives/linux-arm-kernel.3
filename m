Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F900CF5366
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 12:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSrZoDHar+RR75Use/GTyw4Z+RteH8/soUihixxCcSU=; b=05NxYNwxgf6LK6s7oK9PjVP+1n
	CXE/OTX2NBE0vX1pZL3wYurr7Gg+qgz+t/U2GuZr1f4euXkKA7BQInahX/ZIPeb90TlCRJBELROWW
	2m9Kjt2gATxapU0pns909Mss5p3hqdViyJcfCLMa/cFdRfvVX/9pGXuMUmTJAd1WMtKNFtuSrkVds
	TkRjfPMt7QPqaPwCKHum8Ne0Nu0jGFVEKWjvzOoE9wckbl/wyHQUTfaty/C+91ClLxAFoAWYN0A+r
	55CdaDVIeCmjUl82MLtDvZR6G/gbI/68KvxXcWnNn7Fgnb2Gq4FLQZLyPR0ygP00bmz+3jNxRUJ0l
	rbVJUpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aLL-0000000EIK6-2tJW;
	Wed, 23 Oct 2024 12:20:03 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3a18-0000000EFAq-1sMA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:59:11 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so60949831fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729684748; x=1730289548; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FSrZoDHar+RR75Use/GTyw4Z+RteH8/soUihixxCcSU=;
        b=D0wSrN5tB4/8iJeiS0G0ZgI6eADnfVY6XvvDZF7xxOZ32DvVg8Jhkji1kS2qKgaPYn
         2e20yGp/7+OtbPyK8pyAR7Vd2wxlUmdRiGhuaPr2ykXBmY28vJMcr3EbZ8AdHlmobObm
         zwYOnJgNf6ZhEe9pqBQN2Cs3/ruFLJJiwYuSBfKbjvTGU4F01vYqQGFxa9mMoiZ11yVI
         ktUwNbA968QNQz87lseZ4MrphNQJZKg6TxNBU9tinhVCockgDxhJeSmbpwUG4LATHBo2
         Fk82U3p6QZ88/IVW1x71BLaUUl54eQWv7EyeZg67AzSaxbFBZpKRffcQu9QkE8Su3ov9
         nEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729684748; x=1730289548;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSrZoDHar+RR75Use/GTyw4Z+RteH8/soUihixxCcSU=;
        b=scB2iTkZQBYH7ERJn6C1/FBcUiAJKiQGAUWyPN1QXxGiMbiDky92X2P0k4V7FLHKk4
         GyuubLXCEJ837jWoHLc7OwUIJOyiQVvQbNqEzjOkDaTFFBJHsTvfBns+8XeTuoe2G4Ot
         PSDJE0a7iyphWnOXs47fmtSB9emO4GO7ylgKSa4o+F9asGUILWeZqbGi92ZR0fMiTaeu
         w0v+IpbSK5Ksaay9idQ+fCzNQ3Q3peJ7u3MtwwporBrbPr/SV80Jwn1WZXT1EYyq8uZg
         JtOkU9S3AHLIzF31qxdvzDYTSnwFEQ+nBJg9Meuff6NtCGptGC18l8C98lEJDpYzcG02
         poQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL7wsHYrZMG75jTBStfpcRVwTkKZubtZrEKuqUZ9eWe1h8LbS5nt7MLl8M3IvWhVkTUkVJ/JHsKkFaEim59Vi4@lists.infradead.org
X-Gm-Message-State: AOJu0YwK0URUnf7bTW15hXKGhpqUmytWNbods/07Uqe5lnrwwqd2ka31
	C4tPdDz8jg6YgydyjfwJK2q3rjRXvxOiIRezR8PfbJX5F2FQcqM1ifUGeQ==
X-Google-Smtp-Source: AGHT+IGrJ5IYAvwm3x9JP5LDD/HoD1kxDf6GW9zNzKdONXpDADYeHDr3cEtxhRUCR/qMuZDpi6oxaQ==
X-Received: by 2002:a2e:a991:0:b0:2fb:4ddd:a8f0 with SMTP id 38308e7fff4ca-2fc9d3467ccmr13445811fa.15.1729684747818;
        Wed, 23 Oct 2024 04:59:07 -0700 (PDT)
Received: from [172.20.10.3] ([176.222.0.31])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a445sm4360600a12.41.2024.10.23.04.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 04:59:07 -0700 (PDT)
Message-ID: <99ac4890-b6b2-4192-bdb8-62e70084ffbe@gmail.com>
Date: Wed, 23 Oct 2024 14:59:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1
 and spi_0/1
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
In-Reply-To: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_045910_523419_7880518A 
X-CRM114-Status: GOOD (  15.34  )
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


On 10/23/24 12:17, Ivaylo Ivanov wrote:
> Hey folks,
>
> This patchset adds device tree nodes for multiple clock management unit
> blocks, MCT, SPI and UART for Exynos8895.
>
> Exynos8895 uses USIv1 for most of its serial buses, except a few that
> have been implemented in this series. Support for USIv1 and HSI2C will
> be added in the future.
>
> This patchset is dependent on [1] and [2], which add driver support for
> CMU and UART.
>
> [1] https://lore.kernel.org/all/20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com/
> [2] https://lore.kernel.org/all/20241023090902.538040-1-ivo.ivanov.ivanov1@gmail.com/
>
> Changes in v2:
>  - Add r-b from Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>  - Change clock-names according to the v2 changes for clk bindings

Forgot to mention that I dropped the SPI patch due to it getting applied.

Best regards, Ivo.

>
> Ivaylo Ivanov (5):
>   dt-bindings: timer: exynos4210-mct: Add samsung,exynos8895-mct
>     compatible
>   arm64: dts: exynos8895: Add clock management unit nodes
>   arm64: dts: exynos8895: Add Multi Core Timer (MCT) node
>   arm64: dts: exynos8895: Add serial_0/1 nodes
>   arm64: dts: exynos8895: Add spi_0/1 nodes
>
>  .../timer/samsung,exynos4210-mct.yaml         |   2 +
>  arch/arm64/boot/dts/exynos/exynos8895.dtsi    | 161 ++++++++++++++++++
>  2 files changed, 163 insertions(+)
>

