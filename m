Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB637C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGcH0UeKddFKvZzS6VK/UwJ2UKFscoxXJBXhLgGEGFA=; b=OmMcXY8oOqTC28Y5DIB4jvhlq8
	FYrlJ43ihj84X6WPpXScZ0K7kUTvXXPVYynB2d3cFgViXRD5MC8l+tDuTDV8hwBGTRmNDWmzXtxNU
	4poQGB5MMNTzbv0HiqUAXfiRhKzXm8TU07jRSjEsBIY54kzZ+PpOYNbLlF+ORTAdxEspNNMLg89M+
	sJczorrdj6KsHC9pcbt+odsdGtIDvnksLkYA3i6fXcnMX9Cg2S9s8/EJIpDx2DBcbTOXT750X5o4A
	FC+dDdcrg8wojho505WFvdk+uOSxOxtJmwj8H6YA13tjcso+J7hi/maazOaVk1yQv/OTkA+nW4AFd
	jkthhSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JFP-00000005JJ7-0W38;
	Mon, 28 Apr 2025 07:49:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IyJ-00000005Fwj-1DbF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:32:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso51691715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 00:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745825529; x=1746430329; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGcH0UeKddFKvZzS6VK/UwJ2UKFscoxXJBXhLgGEGFA=;
        b=uwN+O49PFhCNigqKXGdskQVYWVp2sKtcshF5pBxHnrr6VP89q5T0hPKNdu77s6fGvG
         Z4us2FBPogFhj6EzBic7L1T1hSCsXS7pvPIFWNuoUhQnwg0piGl00rS5R89oTd/HoANO
         Ga6lSPDFuAPNBs/t2zWc504MFo7/X4PWGV7VTyWYSVZAPfKHT1eqoitb48A4x4h/UTfx
         hIqqS1rkt3Csj9/muZFclL7veUPUXky1OQyC+4NWpS+rJs+vnQhtMJ1GXUw9huV9LGGs
         BbFC3iPULuDtxuYPO7TpHy4pPYqdNAB9mznvGOeMI//BcgHVdWqXPlkRoadfgmWBZcZx
         iiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745825529; x=1746430329;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gGcH0UeKddFKvZzS6VK/UwJ2UKFscoxXJBXhLgGEGFA=;
        b=BcztgF+hf4G5hoOB9MpVQGo00/U82a4pBRiRnWZpYn5aamlioJjkOcEktMRJ7NwNtm
         mJOYqqk2SH0ZZSGtn5LCWoS89rRP07fjcKXA703xfv2LPB1dt4gW/9vPkZemM+iA6baX
         D3C5TpMRimB6plf00egChSwpRiurQRy1kQksDtGlwrLwxcnx1yw7F+Eg+8oNMmYlAo+y
         vhq2tM2hbUuJ5ZL0+HmGdZWf67BYhIwh87rSVYYNdnqt0RIeytQ8zLaMrjOoc0UTE1eH
         vVYWI5O+bQ2WJZljPNYaTVcU6QOjCUBp3amXGR3hSN870d360c+LnAV1osTzlhQvJtUY
         mYDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH98+W7Xo19u4oBKtXjXkUw4viZrGuwksVBFOTvBOfgrH490xQx1iAJqLOFeQpQ6bJ6T/oyMONvX97+hVDCe7y@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6nyf/2rXf72dKfQ9IXVlq5XH6aEeb88I0K7SYThuXbcxmzD/A
	xrU5b5K2ohSRzSzMg6ls/UHPzR4upodYSRZdbGGwiYEf2xNeD0bPx/ofCV2V6CFS5PYkbq9WkXr
	F
X-Gm-Gg: ASbGncuwUaxSitL4i/nbD+ROcP1JtzTxci4g+jqU+GNqlckB0aXbZ2e7q6BnoRlMPCl
	EIyv1JCM7bnfILbFpqIKqzJlfOjzjbAMsn+ZQcw2YKzVz1agCc0fImQzoGxRdv2xmTKiCH1BRwZ
	t+bOZBD9zliJOkjFEBrbpp3ITpEGaLWgLANpNLsodf0xEBR4P8M+OjR2v/8CK9UQaZCS1YV3P/y
	m0lCXTFKrJmXsKL1Q5D4MVv1jzCTsu++zfajqyhNRnCekrLm7T46aDdj5ZTWxZzTz7lPUbnQqjC
	PqhfSmO3r2xDvvhRA3qIPjQDDMJwHLTyzyG90AS5W5MydfDNbVaAFLDs2oUWrd89APVrdorNBYN
	g7QOOOVAkob+G7LgmyQ==
X-Google-Smtp-Source: AGHT+IE9IxrEQndV7PtNABLrBikOF06TG2rz/qdA9+WaR/LH3kMB0rSX+0YP2PDCf8juRT8QFLptjQ==
X-Received: by 2002:a05:600c:46c8:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-440a65d8c6emr88097415e9.9.1745825529140;
        Mon, 28 Apr 2025 00:32:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:e2bb:d0cc:c4c9:4442? ([2a01:e0a:3d9:2080:e2bb:d0cc:c4c9:4442])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2e00e3sm149222995e9.34.2025.04.28.00.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:32:08 -0700 (PDT)
Message-ID: <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
Date: Mon, 28 Apr 2025 09:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250425203118.1444481-1-da@libre.computer>
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
In-Reply-To: <20250425203118.1444481-1-da@libre.computer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_003211_343481_40BBDFC7 
X-CRM114-Status: GOOD (  17.15  )
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

On 25/04/2025 22:31, Da Xue wrote:
> GXL I2C pins need internal pull-up enabled to operate if there
> is no external resistor. The pull-up is 60kohms per the datasheet.
> 
> We should set the bias when i2c pinmux is enabled.

So, yes in some cases when the on-board pull-up is missing, the on-pad
pull-up is required, but the whole idea was to only add the pull-up property
when needed.

So I know the real motivation is again about the 40pin headers, where
some applications don't add a pull-up and still want to have i2c working.

So my question is: why can't the pull-up property be added in overlays ?

Neil

> 
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> index 2dc2fdaecf9f..aed8dbfbb64d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -214,7 +214,7 @@ mux {
>   				groups = "i2c_sck_ao",
>   				       "i2c_sda_ao";
>   				function = "i2c_ao";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   
> @@ -576,7 +576,7 @@ mux {
>   				groups = "i2c_sck_a",
>   				     "i2c_sda_a";
>   				function = "i2c_a";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   
> @@ -585,7 +585,7 @@ mux {
>   				groups = "i2c_sck_b",
>   				      "i2c_sda_b";
>   				function = "i2c_b";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   
> @@ -594,7 +594,7 @@ mux {
>   				groups = "i2c_sck_c",
>   				      "i2c_sda_c";
>   				function = "i2c_c";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   
> @@ -603,7 +603,7 @@ mux {
>   				groups = "i2c_sck_c_dv19",
>   				      "i2c_sda_c_dv18";
>   				function = "i2c_c";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   


