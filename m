Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457C5C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 14:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFmetQ0fd8tg9OjN42SYuqaihg5CWxCtulYfskMf/mA=; b=Wdz0Re1yX2UYfmcZPTgdDsXHIz
	vJKYyWmCARbyq1j0+1+bjBWcm+VSVEFlfEyobHZIq3ofkmGtwn/uy4bEjXlb0quKxqS0KQeCIV1fU
	ePakBjLLNxkcSDo65LBDsGiFo55eznmSUXQllqR6ph5OTAPqBMyRaPBlExG8Uw0CYlXWoITFTgnhu
	jLfWombI6SiYh4+peC9fMYizcchI/SPJTMUMlag6xFMJcs5e0e8rKxbmP2Wdb03mC/plOu4a/UJ0/
	n2GIedLip/CBZXTg70lNu/ZZNjk5uFroukZ/a+0om1c9FapQlTdZS5AEm+MrJQL1U8jqzElFyOvwd
	QGqCSZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sn9-0000000ApUE-3sPc;
	Thu, 10 Apr 2025 14:22:07 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2slB-0000000Ap8x-2HJn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 14:20:07 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2d071fcd89bso201020fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744294804; x=1744899604; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFmetQ0fd8tg9OjN42SYuqaihg5CWxCtulYfskMf/mA=;
        b=ziMYK/K8SE5gEXuq8oI+Q2s3sm+QEOlsUPQR7nuHpTZx4+epO47DeY5WXPwhu9Yqjm
         BBLmKLVVprTNl594lWybbUR1kicJPolUTsyMKDw+aDARTH1IKEwUOskFCayII6Q0Ffjk
         6NBzralMKFZiXnY9wy78tQvEEF2sjGPSEkaRNml85syyW847Kw2WNtSa+7RKfE5oHeIC
         fNK5s7SVN3/3sy1xKEPGoDiz8E021Td/zmrDzpuwR8qZGkZlsRWM6SjRED8XVBoEVcnj
         TNWWZsL5YbekcQ12VZxEI8xJ9AjVTneMCrEB0u1l8vDKL9wjBa1W6j0YKuNmNb6tr29T
         c4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294804; x=1744899604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFmetQ0fd8tg9OjN42SYuqaihg5CWxCtulYfskMf/mA=;
        b=D37ty/1oeE6oU9QjYZmvaaWUFqa9SHWPWWd/RB2543AVV4aa38TXVVaNwOf+R3wH15
         4F6gE64KIez28yxsy1c0wFeHXNIZeMzN0VPa5/eCYgpc8JkVG7Cs+ZU8BNk/OZ0KiMlj
         cubH3wwbTEaLZ6MWXHZJnuCmDq4e+JM99JrlEroNnXyw5ngFZ8kBKSy07m33N0/eqBDg
         1vZvRZ6N8W3jB7DYfhvoYldlq043tzcP+6QN72poxFQJ9XCY+vNvE4Hts9HWaauwzD02
         9j8G0KKMv/8qGhBFxMj02NYBNe879tVcVprdSL1G2ZTwIauLurD4eysD0BzgHz32Xsex
         j/AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFZQZsQAYe6N7x25hDCKT8oqaUV7KQqckPCY6pEt5fgRKgtmbvJSPiO+Qd2GoYkbMfTIzPmscxrGhT2jk+UCjn@lists.infradead.org
X-Gm-Message-State: AOJu0YycUOUm8XMccDPNkvZnr2XWyiD+ksa0GznmNdRtOOkxA3SsloPX
	OOuRnLVvMA6JgZb4Rh9eb3WXF1uDgmfLzCUUzghCELdzFVbcy91+fiHdh49sZVQ=
X-Gm-Gg: ASbGnctsQFU6E8/wkstNvrSs8OEAwlX9B8KAzR/RuYYAR8nGPEanQ3VK+/qb2LDK3Lm
	rPIoUv2Q1GGfiqT+3JObkdLBd0WhuCAjm/ZIb3Z8OzK/FQDbTvnldcL4PnfdvuJmBaEMfmErSNC
	KEwfEavHnPLEKuWE+fHczT9KzOoUdMf23JOKulp+SO+8C6tUd9HU+AfxdGtwIBqlO+5pN3n0B6c
	zr4JhIHkPx5c3Y8ZOLWCdG0f4Ty2N0aqvVRshxplCXh8+608grU5Ig3m0smyBGonqqyJF0IOEUp
	Y6gmX8j57TRCCYMxG/+qL9WPYnCJCaEeqsxtXtFsU7BfhmuQCdHs2wLqFsl9JhKliHJyiKWTT9I
	Srg==
X-Google-Smtp-Source: AGHT+IHmprFnmE2L9dl6TZiZJCp0rXROk32fEiGq63fS0aW94IToqZ2dIpCTynqnYIATWgqEA0PScQ==
X-Received: by 2002:a05:6870:158d:b0:2c2:56f3:1c84 with SMTP id 586e51a60fabf-2d0b3820255mr1492765fac.25.1744294804016;
        Thu, 10 Apr 2025 07:20:04 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73e4db34sm578067a34.49.2025.04.10.07.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 07:20:03 -0700 (PDT)
Message-ID: <22384798-eddc-460b-87d8-8c13beeefbd7@baylibre.com>
Date: Thu, 10 Apr 2025 09:20:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] iio: adc: stm32: add oversampling support
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250410135836.2091238-1-olivier.moysan@foss.st.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250410135836.2091238-1-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_072005_593787_205C7173 
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

On 4/10/25 8:58 AM, Olivier Moysan wrote:
> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
> 
> The current support of the oversampling feature aims at increasing
> the data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution,
> a right shift is applied to keep initial resolution.
> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2exp(n) ratio <=> n right shift)
> 
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
> 
> Oversampling can be configured using IIO ABI:
> - oversampling_ratio_available
> - oversampling_ratio
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> 
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


