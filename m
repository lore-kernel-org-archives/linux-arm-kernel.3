Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D60C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 22:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKgWS7/qdk7+Eg50DbHdDl8mGYC2JyCvr3ER8bCDhe0=; b=tEf3VXL9K4hVs2BEPyKVpGRgcg
	AW2H0m1BSVnSkbXblCNEGJfSTNGEB9NUfFgQRNximaePfEAzyqvDQUYc+Mih/HVkLpGXNYra9/4mJ
	ujaS3LJIZKmtVW4S7MMfl9WRR9r6lrzErBA5U+fovHoEr6Wy9fOR7KTDj96tCb3j7eV+a8NJ5Uui0
	DKdazxwDoqhuJhp3BrahTmiqi2jTit8lKjkPq7Dbm0oo6ZfhkLR8R/u6WARcWIaIlKa1DisWIMbMC
	mIol0uUPXSMQv6mmJn/4pPjoqHaIZOsYBHqwd/Hmqbl08yPmLMbpYppsokkMgNacGtbcIUFP3aIpS
	8D3HckKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5dn-00000009flx-1j7m;
	Wed, 02 Jul 2025 22:09:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5W9-00000009eWN-14Bp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 22:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=DKgWS7/qdk7+Eg50DbHdDl8mGYC2JyCvr3ER8bCDhe0=; b=pG9coNLhtYphP3bQiKG+S+xT8a
	R77CEMqr8mdyygKPfp4kOIGkf+/ix45DP2T7ZJF6jdhX9g8nxZSjRTGXj7NPeRGA9OLMTcxN7NxIC
	CwSv8VAneEZ/DLsXuNKqBoXSfUMKT9LLzGZN3YDCH108cGhCvkTfYsdMuzUscGKpBXpeJaIyTnWLm
	Wp9DqFzol4TE4HLswV4olTICDF+JBWbu0FNZwJ5g05w2oBTN8MD6k1TWSdYd+gMKT5WXSs1qXBlNB
	E7S6GmyfLtk8nQ4evnPPlhU1SReGpoRncHG1vNSL1PfA0/ooKEIvgMX11sOaUUDpNkMAqmMrajYTy
	I1kSBgzw==;
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5Vx-00000007ZXZ-1Njr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 22:01:22 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-40b32b6af9eso3513116b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 15:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751493669; x=1752098469; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DKgWS7/qdk7+Eg50DbHdDl8mGYC2JyCvr3ER8bCDhe0=;
        b=WooR+1HdRQWiduCdupF76Q0IXersiThNPnhc1Ta2dKGm4sonyTgJdanxa8ldVUI4sN
         bkeZvI5Nc0LY+elyrxrE3q/O2X47BZk4kVMA9+IZGRGl8WqGcjUjp7aVPmUZ2zftrMUg
         5wdcUKNRsOOuAtm5yRRb7BeqB8i8skzWxM5iSeDbbKnV1o/bmFHdiFVvs/4q+JsSuUPs
         D1uYeWAH1IHCyxHPwIbNA3ESONhbx7cNl93vGlfXgc+k+vtvxyhXAVu+LVrwGk7jyG02
         lWDYrmzgjMOgzytM+kMkEwhfndsLQ3dVr59b1U0x5GzM052OrOkXHe4Kyd7q1OYIMyZD
         /t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751493669; x=1752098469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKgWS7/qdk7+Eg50DbHdDl8mGYC2JyCvr3ER8bCDhe0=;
        b=MvtrfKjZTC58WnswUcOtKhBtUOPMhH+biB6roOrd8ayMiPFbRqoU5dmpYQgPBkjqCH
         ibpfCgsYhWXQk9/lE9Nrr/WRi29IA8onvIm2iiqd2korrYfWMQHJ/KzrNFRGnrPykQ7L
         7e85BP2cgHXZ31rdvMntKmRfR6FXsrmoEukhr7amMq0Vclr4dqI0p9+jloUYGnO4k77O
         ivOsuI66kI+1fOJ+y67c9RDgUWrC9Tn9rqZvGx4/NtFzEGDEeUfYJ77rQHRgCZDc7ne6
         6daCGqFeqMquCxyhKnNL5oFIWIVITVGRQbjSB5GJm9GTCKpuYjpQ2XSNguBHpkEiMsUv
         ElPw==
X-Forwarded-Encrypted: i=1; AJvYcCXI6BuQBXxeJrj7rKdVaWJPi+L3xuahAqjmneldKj/xKmpgVw4xNNWC/I6+kJnVhAcVSwbpZsAO/m+KJm6WtqbZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzc/iDGBSYy7jysJz6b1a8o/Oqjxy8lbQFzhOI5Y9PSTPzLz8Q
	0XTvxefXCVMuI5yHRnqRJEZd+LGOgUVZu81YUBzF+C5/mKr9aggG25EkOvZq/jX9dFc=
X-Gm-Gg: ASbGnct68eZu5yHOjKlg70rvsuqWN3fxcVv1tTZgOiCA8xyiBuV70UPC9MqqUnTcjMy
	qjUJ+zrgHCxsIZD0U3MOe2W6WY+ZWLov6EtUhFOFH8481fJ00QyTq8ddvKHWVc2DtYM/331G61+
	ZuZj+tW+Qba5W79aYinISQGtQUckDHq3GOKAG2uE6iIVsjRP+MTeyCCjT27SkRkm7IKZY6qPyZ1
	XG8Dl0NAfxcxdplS0KCZBAoVP0CcwPi343WJlrdlSxG0wBPkCkd2bOeiSToEgA3X9Lttd8CHJ3S
	iyor+4xZJxBest/5fJXDc2DvDbXEnCOgR5c3CDs9gd/GOCQwnWATBTLzunYQH4GhgTDpByfpJYN
	9vde0Ce+Bw9gVDr37SZ0/AYWLcp3IHtvrEh74rx4=
X-Google-Smtp-Source: AGHT+IHKZNhePlF0+T6dWuoOeOIoDbpvywH95ABuicUB05Dmc1aVoalsdNueqPirXs97Btv0KkGWcg==
X-Received: by 2002:a05:6808:e8a:b0:403:3673:65f0 with SMTP id 5614622812f47-40b88b25dc6mr3169424b6e.31.1751493668851;
        Wed, 02 Jul 2025 15:01:08 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5c00:24f0:997b:5458? ([2600:8803:e7e4:1d00:5c00:24f0:997b:5458])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32420c83sm2747613b6e.36.2025.07.02.15.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 15:01:08 -0700 (PDT)
Message-ID: <a30cbe3a-7d1b-4072-880e-99688657a093@baylibre.com>
Date: Wed, 2 Jul 2025 17:01:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add support for MT7981
To: Aleksander Jan Bajkowski <olek2@wp.pl>, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, zhiyong.tao@mediatek.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250702214830.255898-1-olek2@wp.pl>
 <20250702214830.255898-2-olek2@wp.pl>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250702214830.255898-2-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_230118_865114_758B2FA2 
X-CRM114-Status: GOOD (  17.97  )
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

On 7/2/25 4:48 PM, Aleksander Jan Bajkowski wrote:
> The temperature sensor in the MT7981 is same as in the MT7986.
> Add compatible string for mt7981.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> index b489c984c1bb..ceb914dde15b 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt2712-auxadc
>            - mediatek,mt6765-auxadc
>            - mediatek,mt7622-auxadc
> +          - mediatek,mt7981-auxadc
>            - mediatek,mt7986-auxadc
>            - mediatek,mt8173-auxadc
>        - items:

The new compatible with fallback should look like this:

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
index b489c984c1bb..14363389f30a 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
@@ -32,6 +32,10 @@ properties:
           - enum:
               - mediatek,mt7623-auxadc
           - const: mediatek,mt2701-auxadc
+      - items:
+          - enum:
+              - mediatek,mt7981-auxadc
+          - const: mediatek,mt7986-auxadc
       - items:
           - enum:
               - mediatek,mt6893-auxadc
---

Then you can validate that the next patch matches the bindings with
`make CHECK_DTBS=1`. I would expect it to fail currently since the
binding is specifying a compatible without a fallback but the .dts
uses a fallback.

