Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C366FE51F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cXOyeqVZTuYmkbP/VNEswETXiZyV/j1DeIymNd6Gck=; b=yIrFIbYhPtkj2IdAEi3+t7z7mL
	9+mEm6CswzFa06L9EFxv4evG3/qqUbDL0ZImMM6FEtwNX4aono2rSVrVgc0eYyXfiZ4fBQrRjpDJU
	qLUg9ypmLXrD3LI4uMJwNElqMmAJLbhDMMiwoq6xMS328RhirZpxvRJ06geAbbrwNCUD6S7cNDO5E
	+V+cUrJAq0u2Gsua3lLFhh5CmennRye3JwxzIehsbZ9VTV4DM+lxv1pW4cFxMlVly5EDtZOAQjU8/
	kiTUWFLeslo/6FlzC3mIpjRHE21rb0eceJMzOFr+cNi3jC59K/0VflajsutHCDoz5bciBXu+DuBPa
	4G/66RAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGD8I-0000000CxFl-0IrM;
	Fri, 24 Apr 2026 09:47:34 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGD8F-0000000CxF2-14M5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 09:47:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43cfce3a195so4425384f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024049; x=1777628849; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cXOyeqVZTuYmkbP/VNEswETXiZyV/j1DeIymNd6Gck=;
        b=JSSQfFL8DrvmdY09FBLydBTN6+VZ+kvvaamqwiIEv6X/o5BpPh5ZMpOIBLG1z5OBgB
         MlO97bLV4jp6XI0m/8bXqOgP1nnYy0YNYGgBBP7bQ6baZhVmAxqnHonBfB6IJfKd8CUJ
         NdnMv2cv4U8gppc9JT1OvqNrcemoWj3A84P5HvZ9vBuG8z6Wfnafho+2N9U6qz/z3nuj
         yoW2A4cXTTclVJkUNei7X5jImj44igaHbCQVZIAVOGzp2z3D+Cxy8gUwtnoeH/QuiGxB
         DnQ7+OsNHm5JmCbtyNu8M7LxqQkfRLPctzZbbfXxVrQCXIqlwP0wM8qeuiu0C4KPyw3C
         0j3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024049; x=1777628849;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cXOyeqVZTuYmkbP/VNEswETXiZyV/j1DeIymNd6Gck=;
        b=pEqQhWzQY6rSnu7NW38tI2YEudMC9keuMUcPuC+BoYXYq6VNkaeqWlP8bKUxJvUScU
         C+NXFeYHGeA+3Srx3RE66AhZdExeHEkVvq0sFL2dA1rabspoVn1rAXtQKQqogzHp3tbu
         29B8+8JiCRJLZ6d9ByFH1f65NyyZsMejjLf3mYeo2OrTeeIuh81CQGIwBV3W9SkHaXIJ
         4cck8+gBH8fJwEVBF5nsReQMwTBbJhMdUj1rwcmFHsVbftwJ03ZXK9E7kQTg1UR4nks9
         830wGGRmi2nXIAVGCo0emt8CtkKxKpyRkdFlyrlc1ILjrmTwpNZH3xJzt6siz9kb0Uq9
         082Q==
X-Forwarded-Encrypted: i=1; AFNElJ8w765L1s9x2N2fY9f7oL/SOp9Li9E0QUVjVyyXcBwAIwiKWIllCOQERILEfCQZhb9XfBJnWnkeBVBQum+98HeC@lists.infradead.org
X-Gm-Message-State: AOJu0YwPo/m5Y5vQW2tzHZy8zSuGIdSxfA6ZpscCSIR+nsQhD8bpW4hJ
	zXSMzoC5csaLU2HuFoYczkcBWdUYqdrFszOIXIO75MEd0RUlMpC983oVE4qr4rhfrzg=
X-Gm-Gg: AeBDievsuq2ei3VQzO1UWCw/EzaIdm/GFy9RpZ/9JtZ3wGjPiU1wlYmvDlgptmicVdX
	Sx0pUUAjpdbKBQU4MhSMb92muA8/xMqtulgXhyGClA2+rwnIa3PoCNyVYGdt815XhUH1h9L9ya8
	uVOQOme4aM2tUjJhk2DQPk/Nmsheg8bD78S/EpAS2yVMWKqVJ1JaMf+/gLUjbPvo6c+k8hOw5/n
	tQqk9twijAaPYyTVkkme/vPtLgQtCcw6YLN9RE/DEI6K5nEcIytRIWW849roRdlpWfUTtj8dQSK
	DB3iWE++O1uPHbkpWtUN7GKi6yJZdqRAJ0WMKsqpguHPoL/upud5P4tNQSqqkVYrY6i70Ci19U1
	x12It+N85sBXHq9ZblzYjOTtwDnv9SIcs/wVPpx2kd9ug0keKZee8rcEoo+GobE+2pOzpenyLCA
	bvLZ1uB7czlgEb6MP5HfUKhBwLjy23vc5DocJ3SztBSY1RoL/pniXK+RzpN8MUPE5G3jlA2Xu7c
	rTmD1BnHDrS6EP8c2fgf9UL5La4
X-Received: by 2002:a05:6000:288c:b0:43e:a69b:d804 with SMTP id ffacd0b85a97d-43fe3df26b1mr48732901f8f.29.1777024048585;
        Fri, 24 Apr 2026 02:47:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1176sm60412901f8f.3.2026.04.24.02.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:47:28 -0700 (PDT)
Message-ID: <86adec56-2234-44c0-b165-71fa91b17e96@linaro.org>
Date: Fri, 24 Apr 2026 11:47:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/8] firmware: meson: sm: Thermal calibration read via
 secure monitor
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
 <20260423-add-thermal-t7-vim4-v4-2-d4c1528d5044@aliel.fr>
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
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-2-d4c1528d5044@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_024731_339848_6186DB02 
X-CRM114-Status: GOOD (  12.92  )
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

On 4/23/26 18:07, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add SM_THERMAL_CALIB_READ to the secure monitor command enum and
> introduce meson_sm_get_thermal_calib() to allow drivers to retrieve
> thermal sensor calibration data through the firmware interface.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   include/linux/firmware/meson/meson_sm.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
> index 8eaf8922ab020..3ebc2bd9a9760 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -12,6 +12,7 @@ enum {
>   	SM_EFUSE_WRITE,
>   	SM_EFUSE_USER_MAX,
>   	SM_GET_CHIP_ID,
> +	SM_THERMAL_CALIB_READ,
>   	SM_A1_PWRC_SET,
>   	SM_A1_PWRC_GET,
>   };
> @@ -27,5 +28,7 @@ int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
>   		       unsigned int bsize, unsigned int cmd_index, u32 arg0,
>   		       u32 arg1, u32 arg2, u32 arg3, u32 arg4);
>   struct meson_sm_firmware *meson_sm_get(struct device_node *firmware_node);
> +int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32 *trim_info,
> +			       u32 tsensor_id);
>   
>   #endif /* _MESON_SM_FW_H_ */
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

