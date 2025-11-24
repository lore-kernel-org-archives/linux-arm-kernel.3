Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25846CFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 10:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HAIKS+tQIq5G6QZu607XSH9VxwKXNkvRuOzR0ldY0uA=; b=KrSfhRUY/BQIWK
	6x/xNeh9fmAmXiOGsp2ewVdOcgOBOu8M/qVqVRZFkThimWnH0qvPliRgqS1CD5mwehGg+OjyGEwr7
	o7YS0MKuXKDSFsyfZoC93F+hgp9jbFnOQK1uvrmkBCJ/uTFwW1Tj6oic5wKresNKQhpM8igFt3OxX
	aDI/qIJvUDH2kBlECfzqZU1v+J4QMT1pyVvXA11E3P01sUpX5ImPdDfqoHGon02oYwuXo88lsQq2Y
	HYuS/n8z9q/0LpCbML/5tN9oBsOE8PrV9b3UsXc+HIIZVeieGbbiSuR0Y9Q8l0S3tq1AFfLlpf5E2
	Ld616lsO33LHVPh/QRUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTv8-0000000BQxW-1vXB;
	Mon, 24 Nov 2025 10:35:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTv6-0000000BQwY-0Aah
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 10:35:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477770019e4so36276825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 02:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763980542; x=1764585342; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAIKS+tQIq5G6QZu607XSH9VxwKXNkvRuOzR0ldY0uA=;
        b=aCefX6nblJIiiXGNepHVRsNtEmeSm33vHJkTU1qAsJvS1xj3c4iBaB3SYVI4yI6ZvS
         1aoLivyLpAVq2k72s9E1U3iXxNW2Q12ae7OHHZ2xGiiv3EvNWu5j5dGo9cz5VvxwCBFP
         Lkrd+oslmcKCb5OEf4sbrAtzxN0nCZK20F5XZiZgxnFWTypN19ukt/6N7grUMMy3v+Wq
         BujoEZbTt5k8KhOU8cz7neQD2t3spXJjw1M3Wk8V2EugwrtkmYdho4APG3SXXgfCoCAd
         wUfEqHBgOz/0GGvMzAk8BV7YaxlLDYBp3qSORXXxBTu4yo7UYJvRcDnMnC1v+yeSkqHd
         ukFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980542; x=1764585342;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAIKS+tQIq5G6QZu607XSH9VxwKXNkvRuOzR0ldY0uA=;
        b=BcO+icUsCkeEuJe1qDQchoC/8mWzxb50X2GLCSYomoEDyj6/cvuRVTWZaa6cThh/E4
         p22VujtRDGx2KovunppgDyL/Vn9EadbA1ikRMIo40zUxFZuww8ySbhny/vTJs9yk0FPa
         3LA0ofHwqqnywLOO5XiRbrHk5E34aTRpjie3VTXw1Fjl+AwROew5oeWMGLz8XhTFF+kQ
         iURsHh5+t8FrCxagIRG/y7x8c//QTpvlo5+7vmOOF8stO80KmubNoF0I0ePQ3BRyJSHd
         EGoYsacGl74ow+srysrF+ovQFVs8NlsxMVGbXffZONsyumzGknRpjaDyXEtFodFtVgQ2
         xF4g==
X-Forwarded-Encrypted: i=1; AJvYcCUvTKc0s/7G72hUIMov/PuqPxG2hSFnXyQ9zU6LH9h7SPMW1xkbe5P7m/JnxLOn4ssLv2zkpohEp47HTuKe+p3Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Cf2L0xFWbYXh5Ya9BiOtMIhJibcfAAvQ5yuSrHWCkrKeOnsZ
	cyQokcjxh2N5JRbSBNabZ8IecaCT+oQbl+0d8RxH42Jz9k4DJXUQHsgCRibiNou67VI=
X-Gm-Gg: ASbGncuTke1y/M9EC55MC78SXS5Rv0ThM36EkfUAlSot4VMTEyWjrk1+EK9VPX1D4fX
	OMgupkPGoW+FInN6D0k1fsSKeIBdaIfjHgfec2Pc/UpyACQD6moYV6cgidu7Z260ExwKD6OFlfO
	3qV7snfN893lvW+HaWmBXNNWkWat52OYOwXTNa7j74KdaVl0MUUVQkG1xNPwlN2gpW3HqZqaafS
	Dom0rCQ9426xVSsitIRwRhxtA6gqAbps+wglnB3UDXxfBFRNI+e7Dx9LgXAyJhvErBmY+VQci5V
	Oq6327SeaMF8FEQE2xWAflvJ5FHA5QUPC8m0dY8j3kk63HLONNiiBH47IzHL2/fc/M7jkKgArKJ
	me+8Sg98+4j/G5GSUgh1vWxyhOXM8SVfv7JSGNvx5toFEJ2VRzfKTg9Wk6ien4XzC9Em4v96CGL
	hdYjzgWN08MahrgIT41S7QPiuzuW+W/XsDTlwEqNUbi7IKRERkSMdmaA5S+V25TLDYanNpiVW5F
	w==
X-Google-Smtp-Source: AGHT+IHGv4bbS+3bVyw0pYcsA3BeS6dNhxGlltqoLwAE51qnNbKpUpuxJhUkaEhMz5T/wEJo8trcPQ==
X-Received: by 2002:a05:600c:a01:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-477c01f5980mr97488605e9.33.1763980542060;
        Mon, 24 Nov 2025 02:35:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:ab13:96f5:1459:8396? ([2a01:e0a:3d9:2080:ab13:96f5:1459:8396])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dbec2bsm150012445e9.5.2025.11.24.02.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 02:35:41 -0800 (PST)
Message-ID: <1d0ccc76-bc19-4446-926f-a12a16a3f88e@linaro.org>
Date: Mon, 24 Nov 2025 11:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] phy: fsl-imx8mq-usb: fix typec orientation switch when
 built as module
To: Franz Schnyder <fra.schnyder@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
 linux-phy@lists.infradead.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>, stable@vger.kernel.org
References: <20251124095006.588735-1-fra.schnyder@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20251124095006.588735-1-fra.schnyder@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_023544_107311_4A703CE7 
X-CRM114-Status: GOOD (  17.49  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11/24/25 10:50, Franz Schnyder wrote:
> From: Franz Schnyder <franz.schnyder@toradex.com>
> 
> Currently, the PHY only registers the typec orientation switch when it
> is built in. If the typec driver is built as a module, the switch
> registration is skipped due to the preprocessor condition, causing
> orientation detection to fail.
> 
> This patch replaces the preprocessor condition so that the orientation
> switch is correctly registered for both built-in and module builds.
> 
> Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
> Cc: stable@vger.kernel.org
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> ---
>   drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index b94f242420fc..d498a6b7234b 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -124,7 +124,7 @@ struct imx8mq_usb_phy {
>   static void tca_blk_orientation_set(struct tca_blk *tca,
>   				enum typec_orientation orientation);
>   
> -#ifdef CONFIG_TYPEC
> +#if IS_ENABLED(CONFIG_TYPEC)
>   
>   static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
>   				enum typec_orientation orientation)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

