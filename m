Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DFBC3ABB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 12:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0GjryULo4v09EAImrhm7s0nrCH1vBTnHzkq05ckM1c=; b=oH8EGs3NQMAJCNEnWErwFqf55i
	nqcLmKj59CcOOQ4Z++rNFnjc+0RqKEj4JrbZQ3NW822GATXiyjFQy3BwFsprGyGi98n9gPBGYsyXT
	nVUpfrE5nEx+whpQx1yWPz3nWKKq+4WLehheOgh2lbg9zVD5RXxTv6kn8gDW52IviR5oZFF6f1JoW
	awI0kkge6T2WeZ7yX09QH9i0I/8BGsqS4zKeW0rawzA9GWaFDaErlol0PY0i4MaXwKNAkQt+8I5Qh
	iPwRgl7LeaD2yfRarsequ3GJo7gK+dGc4Oo1R/+/InUYWy1lcbrkvSJs9phMDsyvN0CYh2MUeq2Eh
	W9yK1PZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv56-00000007LOk-3rYl;
	Mon, 05 May 2025 12:38:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuxS-00000007Jww-0E8P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:30:07 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso28038225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 05:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448204; x=1747053004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0GjryULo4v09EAImrhm7s0nrCH1vBTnHzkq05ckM1c=;
        b=ro+IRsSU1ccJ/a/3lpl/pJLq226PL4efYVuHf36k24iCMM4Oi8i/RQOzQBHLV16d0t
         zPpdHnD8FvBqt3WxUykWhkxnV5bK+0eI0avlzQkqCkbhTJDqj/g0DKuTzm7L1kRDR5fn
         SD+JBX8LYggi9Daht2rmEhNDgRTxY3T3+Bp7Za1vAw4vk013C0Ab00YE/GlO/Ucf8t9q
         tME8UbyhAoxAuJlEM03R8WxsJrbnETZJ9JHZ3pY1UWqwVDnQ+MGQkwUhjVOsR1+MuCDJ
         JtU0jYYe9gPi7N5eiwqCge0ucNC7OhBwdLoBpLFn3wUqSkANQUYU6VjADTN76+MzijWY
         CsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448204; x=1747053004;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t0GjryULo4v09EAImrhm7s0nrCH1vBTnHzkq05ckM1c=;
        b=tTT/oMvXOcUvgIGQ6c9wZdgTIvLSgzCvmxSMcdvs3jmk5JjW+v7230PvES6NrVXndF
         tyYsJvgToZVOJJAmTGuTmT6jw8EtbIX/oajQ8gKZDkHO1pmRLcMsSZkMatqPO4+7jJL4
         9P7CBYJyTWFMBYgmEgFolxGRwxAOqFhVjlJixD8Fe+L2bEubMOEv4c6POsAKCM4eMBvR
         HdP1ZtjKRtwhH1GEcC5I+RywuVT/n0wMWJyLY7cx5+ClJ7qXJCrAOVODJldwcfBtttJ5
         3s6ryiTT59fAXY9FmmUx0WLGlv0jNYJvzi9JyAe+Oo7nGkUxtPi2TbEtT+svWodFAw+m
         rLVA==
X-Forwarded-Encrypted: i=1; AJvYcCV39AhcMepJ4eG9EQEvX27uOksG7Bwa/kbOA9tq9qDmCRMFcLaap66iQreUyVGNcUuRkPIGAWm7mNMgYSHDEkTs@lists.infradead.org
X-Gm-Message-State: AOJu0YyOTTVG0/yFPwEnQkwZdo63nRKn0vLFbvTWwdadhxcjW3qOUZtp
	jDSolgyWIaA7tiGYxFVbHDbKLjczqWmJ5Nea6jy0B/qNrIEArZiMoFwo84yok64=
X-Gm-Gg: ASbGncugVDYXsHbvovVpcRrNMzS7vHEt1TsM5XTSPOHs7MuJSk1cNrJhTclKMDVeXxY
	lcLKmq2FBtKlb3t0vYsB3/aK1aTAqeN11ltkL6cpehCp0enfRsxL+Zd5FYrtbgcUHh1KUK9XcZp
	hVHmIRNXKgUbkTBsKJ9qwocBbUlCsueQykC0+AO+RK9Wt8AMI0VnIvyv1HPGZtFUj05KOrWy2x1
	WPvc8oERj5MnVrkTn5XHOqxbho2C2AWyNaUkw8PS3puR+sNFgUcqNBv4Gmbg8puuKBNbDegMaZc
	TpKmPVLTrBbcPdLOpwQlz5UPxdDwYzHMKGpG4HLrFPA4D78pCDfnde0Ho+LV/Ib4FyohbSI/7MV
	LWNRD2+z8rCdCPP7ijw==
X-Google-Smtp-Source: AGHT+IEXaFpXxqRcmFqcdi7rW9veV7mUOW9LMRdHD1faNwTOAtntg/32GzuRuVivniydhFYII1GnXQ==
X-Received: by 2002:a05:600c:19c6:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-441bbec2a80mr104674185e9.13.1746448204392;
        Mon, 05 May 2025 05:30:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3? ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm108852165e9.26.2025.05.05.05.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 05:30:03 -0700 (PDT)
Message-ID: <5bb02494-e974-4d2f-a00f-417312b73bc1@linaro.org>
Date: Mon, 5 May 2025 14:30:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: reset: Add compatible for Amlogic
 A4/A5 Reset Controller
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh@kernel.org>, kelvin.zhang@amlogic.com
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
 <20250411-a4-a5-reset-v6-1-89963278c686@amlogic.com>
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
In-Reply-To: <20250411-a4-a5-reset-v6-1-89963278c686@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_053006_121588_BB9DF925 
X-CRM114-Status: GOOD (  15.39  )
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

Hi Philipp,

On 11/04/2025 13:38, Kelvin Zhang via B4 Relay wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add compatibles for Amlogic A4 and A5 reset controllers,
> which fall back to 'amlogic,meson-s4-reset'.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Link: https://lore.kernel.org/r/20240918074211.8067-2-zelong.dong@amlogic.com
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   .../bindings/reset/amlogic,meson-reset.yaml        | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> index 695ef38a7bb346c92b4cf428e7615d45682c940a..150e95c0d9bed74c7045942610a311114a257889 100644
> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> @@ -12,14 +12,20 @@ maintainers:
>   
>   properties:
>     compatible:
> -    enum:
> -      - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
> -      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
> -      - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
> -      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
> -      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
> -      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
> -      - amlogic,t7-reset
> +    oneOf:
> +      - enum:
> +          - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
> +          - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
> +          - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
> +          - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
> +          - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
> +          - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
> +          - amlogic,t7-reset
> +      - items:
> +          - enum:
> +              - amlogic,a4-reset
> +              - amlogic,a5-reset
> +          - const: amlogic,meson-s4-reset
>   
>     reg:
>       maxItems: 1
> 

Do you plan to take this change ?

It has been laying around on the list for a while now, I plan
to apply it in my amlogic/drivers tree at the end of the week.

Thanks,
Neil



