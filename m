Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8DACEBF93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 07:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbhzIE6mT3+z2/Fp9/EGeV+eaFRKjkaE4801Pc2ClA4=; b=YxiwmTADzuUcVNrsDhsJbF9pNg
	lndBkMNtPtT04+/83GAAuHtqbVl4R38yXw5KwEjUsN4C0J33gprOTz8vQbxpfgT6MqmRytl2yr6n0
	nj3uJt4Q4H34tXJxiI2HY20A/JuiTgrfLJ6JpqJgnHh9gzWU9GpWBCrCn/xLcV7PW+a8zUqqFxqnb
	eAuqkrd1RKNYmktFU+0dstV38hlR3Jd93fmew8C3Ti5dpcPRjm8ptShx4jpE8ACVbIP8La7l8/uDJ
	guR+TsM3zvJT6v9ikwA3woPhxPUG0cFowRYHSsnvKdYlZaTOgOVkNniIHpBFsbO/4OufqmwOUT3nn
	vOP+kZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGbi-000000000fF-1yuN;
	Tue, 18 Nov 2025 07:58:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGbf-000000000eP-1MYy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 07:58:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so29887145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 23:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763452709; x=1764057509; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbhzIE6mT3+z2/Fp9/EGeV+eaFRKjkaE4801Pc2ClA4=;
        b=X1P8TIvgMLyX/Kzw4r5RJ1zcNwECaze/SrkBKfpGx/q0XTMnZxxuPjE7NrDf+wNY8C
         9b9g2R9xlnZlI00RJc6NO+BY0P6lbIDA5+sJAzoMeKcWW7Wxmn7Qf75a1L+Qm/dbTenc
         40dhdVjO4la0KsNa3NwPBupC9MP5w0hHS9yE+41mXSGy921bHAnrWs12GiT3o6BgdNLb
         +Lwg9uyqY0wLHeH+pRUDXm2IYrTdtS+bSTO6XPH0a3VWjdPj661DLWW4b2hi25tAQg9U
         BDTY7PIUodmbFHNpajisCg9cFBf2NTnMQlOPrmTKWhzoHkuseRHi+bVAl4sDSeqrQZS/
         Ogjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763452709; x=1764057509;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbhzIE6mT3+z2/Fp9/EGeV+eaFRKjkaE4801Pc2ClA4=;
        b=ALAHlA8vh6llvYbpa2HNRZ/JzyMxUckF4Z3tE1+QDzpeGAWRKk1K/HDD9F+ML2o7tR
         k8fxAPhKH4fhNuXUvbQBjX9TJLqyL2avfQN4WXKdY4tZ4Z1wIuB63vXYcYUOCs2VRgZA
         JiwYRyTePTf0HScMCxidWCxZVpqwXSMdL1p8+pqNTDDDQGud19hnP2T3DnsTQ6+80CfJ
         nb8OrRLrl6VrRpyqCfe4QBi7h8l518yZd/tbuydybp69LG3HECedF7/kX4WRvaXlCSHq
         RddPMQwXFUKJKof398ze1r4XWAHe8MOr/UNfHXEW36ae+ptikmTTNCtlF4OrIjkaNCqn
         DraQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIPC2ZkKZIIcppOJsHoBH2uw5CVYnIlGlUEaKt69UW3AngiKc+aAZ2JrywtDHMF1Hjvs4ZQ9uUs6Q3ndH13LtG@lists.infradead.org
X-Gm-Message-State: AOJu0YyPN/0v+h101UdTuTMuGlVyUak5YH5Fh8ocr139TJffFfBQHqlf
	GClmWpRqpxCjJg9JzIx7SxlY0ysjEMbeUl7wMYx+uaX2lMOERBJmfmlcLqRJNeFsC7o=
X-Gm-Gg: ASbGnctX9Yg4x6DPi/BAnGOTcoToE8fvVKelVao5bnqkPKVGZHevCTF3Cpb8Dj8qZX1
	+tDnuVs/LN+0ewwj+/Vk4sVmsSiGlY/Ea9zpQ4h/35ObTCZYLQZ742ZxJppqCCIzCeJ947dtrn9
	vlQPfJaDYftQbjcDg7X15xg06azmrtJtsuZVjproo/e0dCJ6SzQjMSfGe3uvAk6ZxOjeWsfyNyA
	BCiPRSiBq94pgBKo/IFq3s6mYdCGvdypdyQYR7WUBSQliT9Ofj+CCSIVWHsS61RBufUHkLVr35y
	kFfehArfrsPSXvHmd/vFNQhNdFmZMKpnDC0oOUk8Eyy/tk2P9B0MbWtgghoTuMlewMIO70H2g7M
	KE99sl14GxYye22FcRdnh6ynLDvl90KZ+wAZ0qplwanyhup2+PaPyOCNRL5H3PrSayCY4uXQYha
	fVTSK9Zv4HTAYv8Pgw8jbFrwrXc1vO+9KSuHvvxmHlcO3UTCpw9lpyPnjGpXs2JXc=
X-Google-Smtp-Source: AGHT+IF8yNm6Tl8TKmDRXIx00wKQcMShzXyDr9a1aecp0kHrvYtVJapIlNTmZaqc/TLKXMOeh6x51w==
X-Received: by 2002:a05:600c:8b4b:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-4778fe504abmr149301945e9.17.1763452709245;
        Mon, 17 Nov 2025 23:58:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a96a58c5sm12524925e9.0.2025.11.17.23.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 23:58:28 -0800 (PST)
Message-ID: <91b11869-d8d8-4640-99e9-fb18d82960b3@linaro.org>
Date: Tue, 18 Nov 2025 08:58:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/5] soc: amlogic: meson-gx-socinfo: add new SoCs id
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
 <20251118-soc-info-s6-s7-s7d-v2-2-38e2b31a88d1@amlogic.com>
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
In-Reply-To: <20251118-soc-info-s6-s7-s7d-v2-2-38e2b31a88d1@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_235831_391090_545DAFE7 
X-CRM114-Status: GOOD (  13.12  )
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

On 11/18/25 06:59, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add new definition for Amlogi SoCs, include S6, S7, S7D.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/soc/amlogic/meson-gx-socinfo.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
> index 7549f1644e5e..2a54ca43cd13 100644
> --- a/drivers/soc/amlogic/meson-gx-socinfo.c
> +++ b/drivers/soc/amlogic/meson-gx-socinfo.c
> @@ -46,6 +46,9 @@ static const struct meson_gx_soc_id {
>   	{ "A5", 0x3c },
>   	{ "C3", 0x3d },
>   	{ "A4", 0x40 },
> +	{ "S7", 0x46 },
> +	{ "S7D", 0x47 },
> +	{ "S6", 0x48 },
>   };
>   
>   static const struct meson_gx_package_id {
> @@ -86,6 +89,9 @@ static const struct meson_gx_package_id {
>   	{ "A311D2", 0x36, 0x1, 0xf },
>   	{ "A113X2", 0x3c, 0x1, 0xf },
>   	{ "A113L2", 0x40, 0x1, 0xf },
> +	{ "S805X3", 0x46, 0x3, 0xf },
> +	{ "S905X5M", 0x47, 0x1, 0xf },
> +	{ "S905X5", 0x48, 0x1, 0xf },
>   };
>   
>   static inline unsigned int socinfo_to_major(u32 socinfo)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

