Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4114C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 19:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgCpQGFdNKfFxGlOj3n44UsvhM4SmScTq7fqsGjnsnI=; b=S0cJ5Ult7J3lLqs7mluEZKTUZi
	Yu2FHigHXr0TbWa84CIyKVoGiN4d2rraM7Z6IZiFz/c8jsL5yuDWt8ykDeaFPlnKzU16jsBrGD2rX
	jmk3uUJGFB2dmjHdoDwRjXfM/SaNogouI6FkkY+/Rt7ZsSXvq+LP7ymkwWI6NRpH87WDbLCylxNuV
	yXgIpSYOpG6WKwGNMKU+b5CBuBedMJkKD6azlKdWgNYXwaLC9dhzhZvITGBXR42pGuKHZjKrpSHB0
	6vIlI7IZkKZcgYoLWlG2NX2aODiNwcCiZlAxKlVe2r+iy2l1O7sImiSLSOV4Ggi4dpmf4nzKx4Xjt
	kDHlfQAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZmD-0000000Ff6k-0C9s;
	Sun, 20 Jul 2025 19:32:49 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZjm-0000000Feyx-3bc4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 19:30:21 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-73e88bc3728so344650a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 12:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753039817; x=1753644617; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgCpQGFdNKfFxGlOj3n44UsvhM4SmScTq7fqsGjnsnI=;
        b=lDYuCseu73XsazMbnDszupGQ+DKHXTzF6hfLIN7/pPMRvfWdiRg6hwE5JFeuizrJWA
         etjfYKsAQtBkrE12qLKuq3YoztfzvgkOyatlVVQDh6z+flC1qz1IXdHglY1EVHlq31iQ
         Qr2NIWU5KVD0ENHakQBDB4Sbi6iZc94JHTf/cGRauBpU6e0iMHThSTrp4CTP5gqExuXe
         B30WzU3EsOnFlCHtkh8OtuTDA5Duu0Zg5CMWzf5jVaIfrH0kd1f4jZEOzOaG1sTcEdst
         vZuLINk11/P78suxyEByxWduXLEOwOLdf1VLvxeGwsODwocIcKmvfH4DmnRwEPOOB6sO
         rFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753039817; x=1753644617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgCpQGFdNKfFxGlOj3n44UsvhM4SmScTq7fqsGjnsnI=;
        b=AiaBHG2L1RPcxV01yOcIqo4rxKDisD0G0qIBhQlYe+huLCfSg22eI8Ziv2gagJEjVk
         tD/zJmLZx/qUo+Vl7SOkFo0aUqZgT9+vBQAvDogCK9qdqCVLPsqqLCD0PxCeytuV6Btq
         yh2OyGmag50TNo0DS2yFVc+V64kyRWsJBbk7uCxFrqHRC18oWUS0649NVtr99VBr2ptV
         ZJvL6Qx8VAZkrawLwzwsRCktV4bz5y9IM/A21HzNGrnoRW9Dll0KMipfi8q+DI1erfxA
         LqrcLzzsdSMvQnSFwlTGZ09JBCeYb8FCeC09O9awF8zyTaA0aOG2Ask7yUyTPJj4btrb
         l5JA==
X-Forwarded-Encrypted: i=1; AJvYcCWjmPRO6vFxpd433QLLt47b+/EvQUn7piclbgghj72lWelz0xB/bvpRxc6YkDEQ/bD1/lFUrk1ISVNFJsdOSvPm@lists.infradead.org
X-Gm-Message-State: AOJu0YyiI7Byjj60Lu8Z5kMjUqB41wXFuPRqLL5GacjYnU2Xd0wC+9VQ
	xBLoHfWNp9LLPeUNbR7R/NV9a8geo5r+V3AUBcETwgMBICwyyWyoToOVtcgK2hJLhNQ=
X-Gm-Gg: ASbGncskytTq/SFb7BeWIc3cJDbNAJ4Wo+NXWWuI2m2VdFkOPfw/45aaDFfDzppxsbC
	HHmSKhXuEElW7uQywIbb0wVolAl6BStZXzf6afcztMjn5ynaq18q8z2a6DDjSNvPoy1hWeuvbFS
	i24IoGnv5CVNKJHy7ad33fYh9QqZwALRte9FnfsDOGuktdREBNMj93O5rOElJ+GPM+bmr2O4Cfy
	jQD8ibfEnmcHtFxHoKutt/aH9umwdt2+3dduuvs0u6IOyeo7TPVZ1GQ3RvJVMMd1IP88QMWfGPJ
	0T+ZSbn/SBK8OBm4PSg3EaKfkPGIETXH9iS2/Q7BeD1VRFnLBv31U+fdVUPL9XTxzKr2ntiEcxl
	DlrM89kvUtpASpQTAmu59hJ9erbdQwBpmlcY5yJ1XX4MvLMAHwivmKwBDGL66TH0aShgUb3afU7
	4=
X-Google-Smtp-Source: AGHT+IHYlwxJWcEbEzE218c+xTVkYKK8Z8wtqJxL+cWGCmY4FshNpm6DDdkY0i7NRft8/tk1CqodKQ==
X-Received: by 2002:a05:6830:2aac:b0:727:423c:95d5 with SMTP id 46e09a7af769-73e66114315mr14839191a34.3.1753039816972;
        Sun, 20 Jul 2025 12:30:16 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:6b9c:951d:3d17:9e9d? ([2600:8803:e7e4:1d00:6b9c:951d:3d17:9e9d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e83be07c4sm2291733a34.61.2025.07.20.12.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 12:30:16 -0700 (PDT)
Message-ID: <84ad0f66-311e-4560-870d-851852c6f902@baylibre.com>
Date: Sun, 20 Jul 2025 14:30:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: ">" <sanjaysuthar661996@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Cc: ribalda@kernel.org, jic23@kernel.org, nuno.sa@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
References: <CADU64hCr7mshqfBRE2Wp8zf4BHBdJoLLH=VJt2MrHeR+zHOV4w@mail.gmail.com>
 <20250720182627.39384-1-sanjaysuthar661996@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250720182627.39384-1-sanjaysuthar661996@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_123019_131052_2ACF7EC8 
X-CRM114-Status: GOOD (  20.50  )
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

On 7/20/25 1:26 PM, > wrote:
> Changes in v2:
> - Fixed commit message grammar
> - Fixed subject line style as per DT convention
> - Added missing reviewers/maintainers in CC
> 

By placing this before the headers, our email clients think this
message doesn't have a subject. It should go after the ---.

> From 5c00524cbb47e30ee04223fe9502af2eb003ddf1 Mon Sep 17 00:00:00 2001
> From: sanjay suthar <sanjaysuthar661996@gmail.com>
> Date: Sun, 20 Jul 2025 01:11:00 +0530
> Subject: [PATCH v2] dt-bindings: cleanup: fix duplicated 'is is' in YAML docs
> 
> Fix minor grammatical issues by removing duplicated "is" in two devicetree
> binding documents:
> 
> - net/amlogic,meson-dwmac.yaml
> - iio/dac/ti,dac7612.yaml
> 
> Signed-off-by: sanjay suthar <sanjaysuthar661996@gmail.com>
> ---

This is where the changelog belongs.

>  Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml      | 2 +-
>  Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
> index 20dd1370660d..624c640be4c8 100644
> --- a/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
> @@ -9,7 +9,7 @@ title: Texas Instruments DAC7612 family of DACs
>  description:
>    The DAC7612 is a dual, 12-bit digital-to-analog converter (DAC) with
>    guaranteed 12-bit monotonicity performance over the industrial temperature
> -  range. Is is programmable through an SPI interface.
> +  range. It is programmable through an SPI interface.
>  
>  maintainers:
>    - Ricardo Ribalda Delgado <ricardo@ribalda.com>
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index 0cd78d71768c..5c91716d1f21 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -149,7 +149,7 @@ properties:
>        - description:
>            The first register range should be the one of the DWMAC controller
>        - description:
> -          The second range is is for the Amlogic specific configuration
> +          The second range is for the Amlogic specific configuration
>            (for example the PRG_ETHERNET register range on Meson8b and newer)
>  
>    interrupts:

I would be tempted to split this into two patches. It's a bit odd to have
a single patch touching two unrelated bindings.

