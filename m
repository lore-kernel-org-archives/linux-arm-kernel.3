Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D41CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQzA72vB5rb+Qyx2YAgEg4fc6nWWy+sWKxhpGJjN6j0=; b=l11ayCb4f6Fa9iMcQQ0HDQ2XT7
	5NgV+O+tk3c81qTSSWzuVQcBwQYsaKTqmlt2GTe25AdO7ZhSLshFayDn1OHzOZaMeRYQmlA2Mr5ZO
	I5WvXeJJo04NOEqXBgH1cMZXw4tk79+yUtkBbAQeFaQEYPl2tz3x898pxPBd3E4XQB4sAF0KBFtQB
	KVYE+ZFgOg/CDHJvQIKeNV4Mv8TIG0cOdVTFFASDuS/A37rS5mbPUyNaH09g/U6hu+P8lXxHcjdhH
	yXLWU4+ALsNfAmBzAmTANfDyKpmOV+Reku2TzpZEaWfWKLmgjI4UV9VSgz5YftN6P/VWdL9UQPpX+
	mS+jqn7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yN-00000008rdt-3iyq;
	Tue, 09 Sep 2025 17:17:39 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxm3-00000007B8c-0wLY;
	Tue, 09 Sep 2025 12:48:40 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3e7428c4cbdso1655816f8f.0;
        Tue, 09 Sep 2025 05:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757422117; x=1758026917; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SQzA72vB5rb+Qyx2YAgEg4fc6nWWy+sWKxhpGJjN6j0=;
        b=ZQMELkQZXnC4P8ebIvK1QFAutZfRTea1uXcYdONBwA82roAFWaNGwG5kJ0YSseX7Gm
         VCMRNLSehME8YWy4XqtfTrkME5vlQJR2cZCJqkLbcH1/isJv2LmRCC8+P/DnYQqce19x
         5xy/rvC8q/nt1vBvIhQ4NVInqEygp+LXj/ql97OyppS53FW3+FnndA6E23s0h7h3iVpU
         wl0J9daouc3NRdG0Ngvuw+EhNnRjIxA+cYFAYBhfgHypFuYlpHOIiNV1wwUzASAqeYSH
         unavT4vDSsx0Wu/42o/HnOPm2Y/uZMzerM7+6DzysYcI594se9Ogck5o+9HvKWakPsGV
         P4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757422117; x=1758026917;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQzA72vB5rb+Qyx2YAgEg4fc6nWWy+sWKxhpGJjN6j0=;
        b=gagmmHVr8mEQCRyVkbAn8l+fvWMkDa8R+2fi4Ny/M7GQNOf/qiqVHBg8nLvG5aEqky
         29bta2xuii+p7ZlpwPlFPEVlqmY/O/Gv0ttFqK6jTHYgx/ZPKoiL84EBvgleqHskHud5
         T0qjeF7MsaMbZBQ/rKvbOW/zJHDcUjFwPJ84fN2RMv552PSX/PsZs9GqvbJYwXe+btM2
         LhMoh4ZY13PNGxhWeUFQztzDSD/yBie+Zl1AiWT+j2qfu0tjr1rq/qOn41iTohJgs73c
         +HdE8e7qn/qMcguUVEfrU7jYRc7KqNOB/XD4xWRa+yff9aTUcnvUnK9pZzF4JcXmm+X4
         K5tQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4LIyv82ovUV7sieWPK3qohvqqoKjMy7xryL3TbFUXz7h3HIltrNglfLntk0ZRHnj+pmpIi13Jpm/pfHdLOEZj@lists.infradead.org, AJvYcCVxNOCFinokK1L1KHQPELLxqwjCvwpaEkQX+FVa0VtKMVLYpfqtRrQy6VWG9W4oS5GmRdBKbZlEmv71RQqhjvQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOELFQ0N8z2ZJ+rEF1b01izCmWiAIJ+adDQR6ZeH5wq2hMXnqa
	tNkWL3r+aDQiUtXQCSLnzf2S+NIzLOxpRM4g9kDuQOiTeqEBUl7UO7wuPKTaqA==
X-Gm-Gg: ASbGncsesCwhg8PfcvYfwi4uskg1EnjPpiG5862+NbdIy95S8XWH/gXwRRKlkDUbLzN
	ZUeBnhrXXMCF1pkOrSm1deEyb6vhQs1HhqqWelK/sdHP9lesyQ6iraauNt6GOswWCZ4n/vu2ZlF
	wiqLxLCd3x555zYkOki7gR3VcW8BsTzAfWkiTHIHDwKefRtsYQd4kaxHjXb9UQ45Ht24NaK85or
	dd11jiaIn1+Nr0raluv/zhikH2321BisXQ606/eQoihKPl6ddCVllIiEPcGt6xV//Tm5X9SGDbS
	ZxVvk/RzYylVTj9gMmtXmSw81cdo91u9F8W21qpCdeNJn50CaVYhGVX3mMmTlzP+W8buPKjoMqA
	VwBWZo5VrWoXFUM7pBARkPpVUWyym/YVKJ6n6x+mWhQ==
X-Google-Smtp-Source: AGHT+IFnpIPMqhgwAmc24Yjj3C6LPW1OFkzAg5gcGHa9lijQlbcwkpw/dFtSXTnJD8l3anSqWnsPkQ==
X-Received: by 2002:a05:6000:2f81:b0:3de:78c8:1218 with SMTP id ffacd0b85a97d-3e6356751ecmr10315792f8f.30.1757422117298;
        Tue, 09 Sep 2025 05:48:37 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521be57esm2557253f8f.2.2025.09.09.05.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 05:48:36 -0700 (PDT)
Message-ID: <1f4cdb18-39bc-4c30-bf6c-29b4f70641ec@gmail.com>
Date: Tue, 9 Sep 2025 14:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] arm64: dts: mediatek: add thermal sensor support
 on mt7981
To: Aleksander Jan Bajkowski <olek2@wp.pl>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250907111742.23195-1-olek2@wp.pl>
 <20250907111742.23195-2-olek2@wp.pl>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250907111742.23195-2-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_054839_268102_DDAF5CB3 
X-CRM114-Status: GOOD (  14.94  )
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



On 07/09/2025 13:15, Aleksander Jan Bajkowski wrote:
> The temperature sensor in the MT7981 is same as in the MT7986.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

Queued, thanks.
Matthias

> ---
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 31 ++++++++++++++++++++++-
>   1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> index 5cbea9cd411f..277c11247c13 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> @@ -76,7 +76,7 @@ watchdog: watchdog@1001c000 {
>   			#reset-cells = <1>;
>   		};
>   
> -		clock-controller@1001e000 {
> +		apmixedsys: clock-controller@1001e000 {
>   			compatible = "mediatek,mt7981-apmixedsys";
>   			reg = <0 0x1001e000 0 0x1000>;
>   			#clock-cells = <1>;
> @@ -184,6 +184,31 @@ spi@1100b000 {
>   			status = "disabled";
>   		};
>   
> +		thermal@1100c800 {
> +			compatible = "mediatek,mt7981-thermal",
> +				     "mediatek,mt7986-thermal";
> +			reg = <0 0x1100c800 0 0x800>;
> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&infracfg CLK_INFRA_THERM_CK>,
> +				 <&infracfg CLK_INFRA_ADC_26M_CK>;
> +			clock-names = "therm", "auxadc";
> +			nvmem-cells = <&thermal_calibration>;
> +			nvmem-cell-names = "calibration-data";
> +			#thermal-sensor-cells = <1>;
> +			mediatek,auxadc = <&auxadc>;
> +			mediatek,apmixedsys = <&apmixedsys>;
> +		};
> +
> +		auxadc: adc@1100d000 {
> +			compatible = "mediatek,mt7981-auxadc",
> +				     "mediatek,mt7986-auxadc";
> +			reg = <0 0x1100d000 0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_ADC_26M_CK>;
> +			clock-names = "main";
> +			#io-channel-cells = <1>;
> +			status = "disabled";
> +		};
> +
>   		pio: pinctrl@11d00000 {
>   			compatible = "mediatek,mt7981-pinctrl";
>   			reg = <0 0x11d00000 0 0x1000>,
> @@ -211,6 +236,10 @@ efuse@11f20000 {
>   			reg = <0 0x11f20000 0 0x1000>;
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> +
> +			thermal_calibration: thermal-calib@274 {
> +				reg = <0x274 0xc>;
> +			};
>   		};
>   
>   		clock-controller@15000000 {


