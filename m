Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4361E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 09:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwAnJkcxsn7EAvnKUqGy9C9BQqWODnfQQiu9/oYFC0k=; b=pp5yZMK6C6jWrqyqGSJvs9j+xd
	HJXq/UGPFN2ENunfd7lu/125fOLneJV2QOYoZ8l2NczLN4M7THd/3Pp6uLvhhQsZCI1AW1XCFWDbB
	KoZGl1IwzIDZLgaR6jJqLZ1pOOkvQhNUidVV2sKp/gcAaBwW5FQCBitLZvdZhBqYAEmehRaaN/8Dp
	AdF/k+2EKsnHqvKbLjQXYbqPBBhO72r7oxBO6KQqyrIqp9j6KKU58wvu6/EfQ3GyFEfBMdJ9sZtXZ
	oiqRIhUcu7Uz1n6hfl7TMqgLnehkLlCPmf5YeYtK5rSzs1CAHbeJiDpx0n4wUJqNhIG6lAQD7eXLK
	SYK3DMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCVx-00000004yo3-0cpP;
	Mon, 30 Dec 2024 09:56:45 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCUm-00000004yeT-20ro
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 09:55:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43618283dedso90334015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 01:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735552530; x=1736157330; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwAnJkcxsn7EAvnKUqGy9C9BQqWODnfQQiu9/oYFC0k=;
        b=H5tESCXmGLDdiDAF/dSavm6qEt9VfL5l042wbtAUyUiFTJ49v+jHPvYo3N0afy3717
         QXeDuwuf4X0SZ+oOGbf90k+4DEshavN14WffSkW7dXxe+NV9flH8sA9UPMpAXQJxD/Vo
         AwcTiyy2RHTA11Ino9EmAcPvRKnKsL8T+tbLbXAMtv7XT5hTKi0J7ZzU08+7fyDILyWn
         2S3FzIs65aAsz1631t5980yXENbDx1WEJrB0auutLkm7/lT5y9g9rn00Zcn6ya196sP2
         aQGXfZIPRa+X2wyHztreL/Q5uVVFXZywawbYq2zBcL/X2NIs2qH1kxt6rMK+fR77qerv
         i4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735552530; x=1736157330;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EwAnJkcxsn7EAvnKUqGy9C9BQqWODnfQQiu9/oYFC0k=;
        b=YfqkbBwTXj/g8KSxHCyBxzlMlc4GqHlGCcTM/sfQnezCPo+7O6oLAqtisV65vXWTq2
         VaY/8CtCphh/1OvPuT+hkQUHEzVWnnxzpFT0d/ER5uotxHIniw11KmKMtPnS/jxXW5GH
         XyUn3d9H/QhH1142WKXOaY89gA9bqmciAAJJ/3BIWXhlYSsLUMZN3VbWLuRXscYUOtPi
         EBOeLwGzthbxCrfbhU47ZgMEZhLLRBrzk3LKtV3GXEKvHP9rsPxtcLncL7VBvKsovgv/
         DlpFNm0bQ0FwnXppeN8fV9LJ4h5t4wYWoqbEQUHOl9zxPKTfTIonqeb2iM5mfNiqI2YH
         C5fA==
X-Gm-Message-State: AOJu0YySvWC8QB1vvD/MWBJktEWGgHHbjiG+2y8OhJmz1vhFbTI/TMW6
	sTedw8tmrY/gtrov6+/+hWIsvCZOqtDDbxekYBI2GmJhHJJY5OnTWc2IYWgSLHo=
X-Gm-Gg: ASbGncukDch3v4GM+qpCRX6kzXaDf1IvZ3YtKf2RfimhP2R6t36SLJCAZkjDR6nizgz
	W0x8sphn7E6Pd2HaYTV1M9tOCurUeeJHiGo/6CqygVlYZySYd5kQ6xc9uuATmeBwtjFGVD2Fx/R
	uU2WYifh8UA3CPRlb6CeDGn/QFo+NyVg7T1x+De29EwIWTasRzeWjYXdjqnTQ1pbtphshbOurQ6
	TyYx2g58hTzAbaIcy0u2pNs8H1Dm3o8ij2ohBVEoqnVnPef9Bv4TcLBGNYRU6QQvktX8KWc51SS
	78huJ4Pcc8yxcdvqzDPNEWAOG5VZo3eV6g==
X-Google-Smtp-Source: AGHT+IFdNbJoTRyUHSe3BWfH+hpDzCDJYSHHchJ9jf6Jrt8SN+H4dATnk9L+2XQ1MCTWkCD61qL+qQ==
X-Received: by 2002:a05:600c:4510:b0:434:feb1:adbb with SMTP id 5b1f17b1804b1-43668b76a08mr321281525e9.31.1735552530302;
        Mon, 30 Dec 2024 01:55:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:883b:3c16:2465:ad55? ([2a01:e0a:982:cbb0:883b:3c16:2465:ad55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8472casm30168549f8f.45.2024.12.30.01.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 01:55:29 -0800 (PST)
Message-ID: <e08e5be6-9d0e-4d32-9d67-eec57634f6db@linaro.org>
Date: Mon, 30 Dec 2024 10:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] ARM: dts: amlogic: meson: remove size and address cells
 from USB nodes
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241226220352.965505-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241226220352.965505-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_015532_590287_095D2882 
X-CRM114-Status: GOOD (  13.17  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 26/12/2024 23:03, Martin Blumenstingl wrote:
> The only board that actually requires these properties is
> meson8b-odroidc1.dts but that already sets it on it's own. Drop these
> properties from meson.dtsi because otherwise they can cause dtc
> warnings:
>    /soc/usb@c9040000: unnecessary #address-cells/#size-cells without
>    "ranges", "dma-ranges" or child "reg" property
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   arch/arm/boot/dts/amlogic/meson.dtsi | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/amlogic/meson.dtsi b/arch/arm/boot/dts/amlogic/meson.dtsi
> index 8cb0fc78b2af..28ec2c821cdc 100644
> --- a/arch/arm/boot/dts/amlogic/meson.dtsi
> +++ b/arch/arm/boot/dts/amlogic/meson.dtsi
> @@ -255,8 +255,6 @@ rtc: rtc@740 {
>   
>   		usb0: usb@c9040000 {
>   			compatible = "snps,dwc2";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>   			reg = <0xc9040000 0x40000>;
>   			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
>   			phys = <&usb0_phy>;
> @@ -270,8 +268,6 @@ usb0: usb@c9040000 {
>   
>   		usb1: usb@c90c0000 {
>   			compatible = "snps,dwc2";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>   			reg = <0xc90c0000 0x40000>;
>   			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
>   			phys = <&usb1_phy>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

