Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88998C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FtgIGNczssYUGYgBiPeFqClBJjbBAECDcaII7sn4pOg=; b=cWJAFjS9Drxh8u10X1lBHdnyYF
	RPVxrCWjES5JevqEZ1PRX7E8//loq2Mld/h1xiqEyl6c+Tdm43rC2VgljWKURaiWJbmT6XI+kRgEB
	h/00SKQjcX/NDtbszWU0NCdCJUZYFEEmGheBjQ5gmb6DIfMEhvUeRoFBz27MxUBljzD11Igsq+d5J
	/hcgP5ofd1T+fF+29Sr8z9+/qbnUfzh9uKXDEjU/EkqM0OUuwz2zSjMshY59caesnO+pkTCBAidOQ
	3cdMFlclLlFtAw72LO898M7X3ZpTrmXOOY1nDHcPmmfYWqkKGbgOXSZDGpCEZM1bbdU2cIQPPAb0s
	r5S9aoYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyGB-00000004u7j-3sCs;
	Tue, 24 Jun 2025 07:40:03 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTy2O-00000004rT7-2Mc9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:25:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a575a988f9so62690f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750749947; x=1751354747; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtgIGNczssYUGYgBiPeFqClBJjbBAECDcaII7sn4pOg=;
        b=VTw366XO5VJIVJwlk5pDuB2EUuVHzNcTBylrSQagEtCu2l3Wrz711U1Nvwrm4DaBus
         K8Q8hhb2I+ofuIPa4gMJv6i9wiWJDHmGQpNjn3Yt8SQnXM034GB64nP4BsySHVdE+gIZ
         LxbTIwFuNM4AznlL6YuOU+qLbuBq6tQmjS1Ibzt0a6ovTeyotXi9CU2z0NQtUSWNfoEM
         1cp3bxClx4KfVIoKXVgoMPGmyhieefKY9W1J5GvhbQi1Ww/8TZk4e1mCkJm8l6lxpqgn
         voIAPwMHdzhivFIdfxVrHWpLZooN+qacnkSrb7wfYgbow/sDVmWO7d+XNrrcL6jjo9k1
         uWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749947; x=1751354747;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FtgIGNczssYUGYgBiPeFqClBJjbBAECDcaII7sn4pOg=;
        b=jAbXsNBY5l8ALLSLS3JJiFEGeryMcLVcDVtfqTknQa0GsvQ1vscxI833mojWIM1CQi
         YaVNCwIj47QIP7yESpX9+XZAItEXHHJGB1CTiJ5jJcrqsWRoVEZECuKDqppKg7ntdP1C
         CwcDPMZVnsp4J2Cy7nBTY1o37le4fjt6giR2hvzX7x+KJh0Vt7NJZ5R3geNDm/N7800H
         l/FQpxUk1l/7lemMtkgAXldn6EVwQ3h8cJ4ooLU1fj/u7zZviuVLYzUYapo1IzD5QmXo
         4xktmTFnu4M0ENyo15l33khUyMw+3vwqXUnxLXbY4qjWsoO3x8eHh90NAp5RLtpBeGdg
         gLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7XmLjzTTW3HyMekN+2QukSCRXNsVbw+kLVUyLWKkdFaas+UfWMW3RBhA2WWTZuHfxcS1hKLj2TThFDTIFmgSl@lists.infradead.org
X-Gm-Message-State: AOJu0YysGJkvh3q5KzKkEML6azsK7Mg9NhlDA46uEOyBj6gqIvbihGpe
	DRGan0gPXA8UNd9ItRGMVqx7oLZLXz63IiDzxOWv+N/AA3wFyCuv9QcaGSDYnASs1eg=
X-Gm-Gg: ASbGnctqAaJnIxJw+xH47DryCgQbsFIM4yh0OETwa7ermDDyhwkHDRHyJOFT20f3x8F
	4hQ/I7LT7cAaKrY/+LtGcwcLLKUglJeGKQobcs3Ud1lKWveQyMotc6Mq2tOkpydv15XqYPCoqBB
	QMuyxjtx8ShIenaxtIuj0P5WbRG0K81q/IexqKXzVyXxVdruPl8LwDmnB7Z5ixS1zUjT77D4Lba
	yPefNWFejA8IXvC6uCQB4bl8CPBfkzFZRuoQ80F1jU1/4DOr6acqIVEbQ5XvTdqwi4MQkRjfYPJ
	ipTLX/SKJTSFiFJPkmVsiDKcRuY0el2fSzfa9zqYrvIoxH8S7+TOS6twuI7bRwNzBu1RlvWc+vr
	QF3VIpowtTOYyoiISta9za1mcgkYokbymwk5PxSs=
X-Google-Smtp-Source: AGHT+IFAh6IcPckJtUb2REr21+qkeIcOv+2E3MpGel+3N0TmxwGvyzKEomHombfie38TZXzxxU5RLQ==
X-Received: by 2002:a05:6000:2084:b0:3a5:3b15:ef52 with SMTP id ffacd0b85a97d-3a6d1192980mr9358226f8f.8.1750749947067;
        Tue, 24 Jun 2025 00:25:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:6fea:600c:ca20:f54a? ([2a01:e0a:3d9:2080:6fea:600c:ca20:f54a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80fed75sm1215020f8f.66.2025.06.24.00.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:25:46 -0700 (PDT)
Message-ID: <bfba6751-2fd4-4183-b6d4-b1440a4fc98f@linaro.org>
Date: Tue, 24 Jun 2025 09:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 1/2] phy: mediatek: tphy: Clarify and add kerneldoc to
 mtk_phy_pdata
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org, kishon@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
 <20250623120315.109881-2-angelogioacchino.delregno@collabora.com>
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
In-Reply-To: <20250623120315.109881-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_002548_623469_F7C0B826 
X-CRM114-Status: GOOD (  19.71  )
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

On 23/06/2025 14:03, AngeloGioacchino Del Regno wrote:
> As struct mtk_phy_pdata was almost fully documented, transfer
> the comments into kerneldoc on top.
> While at it, also rewrite the comments to both improve the writing
> writing and the actual information in the documentation, and add a
> description for the `version` member of the structure.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/phy/mediatek/phy-mtk-tphy.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
> index 644a34bd2b0b..858824b4476e 100644
> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> @@ -277,19 +277,19 @@ enum mtk_phy_version {
>   	MTK_PHY_V3,
>   };
>   
> +/**
> + * mtk_phy_pdata - SoC specific platform data
> + * @avoid_rx_sen_degradation: Avoid TX Sensitivity level degradation (MT6795/8173 only)
> + * @sw_pll_48m_to_26m:        Workaround for V3 IP (MT8195) - switch the 48MHz PLL from
> + *                            fractional mode to integer to output 26MHz for U2PHY
> + * @sw_efuse_supported:       Switches off eFuse auto-load from PHY and applies values
> + *                            read from different nvmem (usually different eFuse array)
> + *                            that is pointed at in the device tree node for this PHY
> + * @version:                  PHY IP Version
> + */
>   struct mtk_phy_pdata {
> -	/* avoid RX sensitivity level degradation only for mt8173 */
>   	bool avoid_rx_sen_degradation;
> -	/*
> -	 * workaround only for mt8195, HW fix it for others of V3,
> -	 * u2phy should use integer mode instead of fractional mode of
> -	 * 48M PLL, fix it by switching PLL to 26M from default 48M
> -	 */
>   	bool sw_pll_48m_to_26m;
> -	/*
> -	 * Some SoCs (e.g. mt8195) drop a bit when use auto load efuse,
> -	 * support sw way, also support it for v2/v3 optionally.
> -	 */
>   	bool sw_efuse_supported;
>   	enum mtk_phy_version version;
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

