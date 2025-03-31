Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B219C36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 06:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSZWvc98awNxNS7sUp2CK9I3oZgb0IYq+6Zaom/DnwM=; b=kzGOzZkzXUjkbQJfBfCrhXNnA7
	g4sM0ZwnSJ3aBEnYBz87dWfCL1WrjSPsGXk18UHJZqySP+Gh9hhh05/a0BVpkCl//HWqZrwIUQ3/K
	Qe1NCW1MHEb275s98kG83Ih++5qpABcGfTkiSI4YOvf2I2aMSbZdYv02Brqh3vP705piYFDyt/m7A
	Ct6HDTKLNuHalX1w5f5pLAUixHXdhAMGSPVGDj8xfjVUx5TqY1NUUi42TwMYq5Klo9pazKh6ofovn
	uP6QGt3FW4vB/qZL6Vysl+0D2tMcE657QQ/WxPqKW9ldqO3ARiH9cb+kofOVSOuNWqOuaGMyV4A4D
	84YRWYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz8sr-0000000H7rx-3itv;
	Mon, 31 Mar 2025 06:44:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz8qV-0000000H7WD-13bn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 06:42:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3912c09be7dso2666936f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Mar 2025 23:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743403325; x=1744008125; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSZWvc98awNxNS7sUp2CK9I3oZgb0IYq+6Zaom/DnwM=;
        b=CsuatGshyUHFg6CPczwYepKIatcSJgd5PBKzWoH4N+ZGyZ9b4bicjlhXIe+D5jF4S/
         AnRM4KbNTQxFNIfel2eCfL4kX5itxZSSBkg/ZTmHgAMdtW84FSKvd1jkeW78Kz6KOPSm
         H8oQWhLADeuinUiFqqnNaEztU5OKjugH58AiHcDtLiPGYyGzOWzHPYLNxzT9X+SS9fIW
         Q2NtcPjLmMvknUv5BiNEe8b+7RaoOgBZVP9ruCwsGV5pa8IhkAOTPmEvfMqJNrnESiLY
         5KPK0FOUHenbH2g/SIZcNS6zwJ/frhk6X+MufmM7HqR9ES4id/ZPDtgPgZg/M2EkkpwL
         PdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403325; x=1744008125;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pSZWvc98awNxNS7sUp2CK9I3oZgb0IYq+6Zaom/DnwM=;
        b=bgH344RpioiCjKTyJxQETWFR7beRcFoLpZ3JcHPstdMRPJSPlfJdcX4/IHdRBKhu1k
         SfMKFcIUOpQ5Ddcneeh6pI5AlR8IKCG6pDwPe+TjaPFGUF4y2N5B/QO2igVPQh326NAE
         VETJ8IMJurRppVwDqHKzvQ4dmNb07Ev1kruX8Xn7l8j1mMy02Nlmha2yuoMcvNPocCqB
         pka6tiXvEFHwz6hirwTro9B/AknPclC2zY7BWmTjBu+bacaQhLJR2i9keUAEUOiviUMf
         f5ZBj7EHciHfxZFMY2DiIrsDpH365XSaFh23vmKJmFc8lCWTsdCdftfLDm+Lk1Mq2dD0
         HaaQ==
X-Gm-Message-State: AOJu0YyWlW562VLW+ixRVaE3zk+9B1OUNLigx6YPvmrMKQRRPIV6eP6C
	Q613aWHYvbwXxPwcL3wztsI6Tw8Rc9KfbGPBlBK3ScXto1O9MdwX2MigzcsWjsE=
X-Gm-Gg: ASbGncu+9IDcba2F9of7SaJs1HiV3aFvXmKMW20kGiZSdd1WKHvgu2is4RXQUvbvQwR
	uEG94oRcA//H+SGAxQkcrTYlPEUxUqsxZ3yo2IHP3whqAtgygKOwWavIcoCJoKbbV8iu/XrXlBp
	au2ruCxFwweHkn5Er8f/AduG33RK8j7KvVeSGb2xz9y8Q5xkCcxdeeEdhUmgPwM+uwAt00GJfes
	8BjvnVUXgw6p1vn38YLrV6cKqIhA8N8+g8hyShJF4LlkoNSHN7PK4T07LBG5/BmRgVdnu9QoXKN
	TM8m9GBaYubuAhk+APlvYfWFzv2AmwnXTvhe657oIGCzUSmXR4K0iI2ujoCpCSTRhf+0Kg5xMt7
	bgUrLb1lLbbFSLYztxv2IX8sHCes=
X-Google-Smtp-Source: AGHT+IFaaiFJvSkuFgpzRjmFl4ky713HsFznh//e5XklchpgjCOz6VUhATdj7MkI4kwAKPb/DPGB1g==
X-Received: by 2002:a05:6000:178c:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-39c1211c8f4mr5516473f8f.49.1743403325590;
        Sun, 30 Mar 2025 23:42:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:143:2e3d:45f1:fd2? ([2a01:e0a:3d9:2080:143:2e3d:45f1:fd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccf0a9sm111590335e9.17.2025.03.30.23.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 23:42:05 -0700 (PDT)
Message-ID: <04c47466-b1a3-4eb2-8f28-95faa29ff45f@linaro.org>
Date: Mon, 31 Mar 2025 08:42:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/7] dts: amlogic: enable UART RX and TX pull up by
 default
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, jbrunet@baylibre.com, khilman@baylibre.com,
 christianshewitt@gmail.com
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_234207_306460_D8008A7B 
X-CRM114-Status: GOOD (  19.35  )
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

On 29/03/2025 19:58, Martin Blumenstingl wrote:
> On the LibreELEC forum there have been reports that Odroid-C2 does not
> boot when UART is left disconnected [0]. It turns out that this can be
> solved by enabling the SoCs pull-up resistor on the UART RX and TX
> pads [1].
> It's not clear whether that specific Odroid-C2 board has a broken
> resistor, the resistor is not populated (either by accident or on
> purpose) or if there's another reason.
> 
> Testing on an SM1 X96-Air shows that pull-ups being enabled on UART
> RX and TX is actually the default (either set in vendor u-boot or an
> actual hardware default).
> 
> This series enables the UART RX and TX pull up resistors in the
> default pin configuration on all supported SoCs.
> 
> Testing has been done on:
> - GXBB Odroid-C1 on u-boot by a user in the LibreELEC forums [2]
> - Meson8b Odroid-C1 on Linux (with vendor u-boot)
> - SM1 X96-Air on Linux (with vendor u-boot)
> 
> Please include this early so the various CI systems can test these
> patches.
> 
> 
> [0] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195481#post195481
> [1] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195667#post195667
> [2] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195674#post195674
> 
> 
> Martin Blumenstingl (7):
>    ARM: dts: amlogic: meson8: enable UART RX and TX pull up by default
>    ARM: dts: amlogic: meson8b: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: gxbb: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: gxl: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: g12: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: axg: enable UART RX and TX pull up by default
>    arm64: dts: amlogic: a1: enable UART RX and TX pull up by default
> 
>   arch/arm/boot/dts/amlogic/meson8.dtsi             |  4 ++--
>   arch/arm/boot/dts/amlogic/meson8b.dtsi            |  4 ++--
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi         |  1 +
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 12 ++++++------
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 10 +++++-----
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 10 +++++-----
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 12 ++++++------
>   7 files changed, 27 insertions(+), 26 deletions(-)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I'll apply them now so they can be tested on -next for this whole cycle.

Thanks,
Neil

