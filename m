Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46D9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 09:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oXcMOvfrC7iN4ecLv5oPIeFCArh+m8oouCA5LcTcBU=; b=sa4fRXYPph+mmqxbmzdohePEQH
	W5anNGs22xnP2jJAhu3RMBS/9IKH2CEZ5B7gNaoA4HeBx2P/Mg7KlkkoH/SZ/gsjxeA2rZfbjZvvx
	0Htcc88ec5C9YYUZODv9zEscvAuNyDL6FyJVmmm3Rpg2O3V+ySXFE5ROAUqxxCdm6ega71++Eb4wE
	Er1OJEpNhcygiA9rOj1retGgdVST6Ibu1VKYDUdMGIVTSFJU7EoxN5+Op+BN9yPpUmAEoI+bWWirI
	Bq+ohKu+SrzSW71b2vu2sPqeMb5Q6keUW+8AuvTrLaIOqKbRxv9PDKlNO10WwmeXgS9nNqZd6PPw9
	5ZCBHYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHlo-0000000A51M-2ogG;
	Thu, 02 Jan 2025 09:45:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHhZ-0000000A4Jh-0HGK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 09:41:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43626213fffso71106875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 01:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735810871; x=1736415671; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/oXcMOvfrC7iN4ecLv5oPIeFCArh+m8oouCA5LcTcBU=;
        b=Df/DeCFRxsWPw52pUmF/YVHxM4PeB/IUxHh3/XWoAzPd1eQ2BzMB9sqE/txUF2vn0D
         rW8kR4he8Z0a+L+HUE6qvYHF3kGcr6q8ijenwrRZGo4UP+4/xlXFw3i5fX9npV/e6TWo
         dqKwwPysR8jm0XfY5rM2TZ0xR8KZy0ui91+P6LiId1083UeapUQK2pxu6TV2EaMoD6OZ
         l0lSU0iV1k+mbH1FVytezoK83nwtcbt0QcSLChaPWZekl84ZuCKCd78tpQhaYdIG0b+C
         GRzPZrD6rp68YK65vK0nh+sIBlzYg6nFSYURGj0FWH67oNSy0+QMoHzUfuCXRp9VD7tn
         Jdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810871; x=1736415671;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/oXcMOvfrC7iN4ecLv5oPIeFCArh+m8oouCA5LcTcBU=;
        b=AmdwFz4B4okb2zjuWJyAiMyHYjBSUYo4NUrzFa9xau3tlOqthrA1/utt96H0dhi5oJ
         YNJzOWp8ttOu2AElrxWT7x5K31L7HrWncFls0tCH0UnS2pwxJm5wV5Rh7oPFAznLqKNN
         tqX0tbsuuSuo4PQHhebXeuQAppfBv/bhXOkurqogwteUCA2po2/5UVHuOC2MbLn3OZOf
         WGbl4xvddXl74xsKf+F/YfLeoMA1F1sbiXmGNOii7tl3/zLQPfVVuj8VlMtrQpkMmcQT
         1pDTqcHEFpY5N7Tu+SvROlw3HWMQHAm4ckcdqRoMcUwWeouYSJNDMWm9ui0YOjn8bcnY
         MP0g==
X-Gm-Message-State: AOJu0Ywb1N5B7oAHrVDXQz4fbxan+QEkp6N6JWl+WBkjEKWBSeAq+O/8
	8GqbSnN7Vd4nvJlzOJ2GN5+I2wbDS05QqBlJqs13LvkTjAeSCZ1vExz/oyDjRzU=
X-Gm-Gg: ASbGnctP/5aiJFh2bbpTMr+bBSNXV0j0Zw1v/9rpzIyfKkkImP/FP5Pf1rBXF6zAhtC
	GVr38z56+SzHrleLNYcQ5kQN/JFtJaAv2m8PWj+B3IWlY8J4CQga6TKLITidUN+duPhiOGleH26
	GnGqoEQP/UCdku0ei2Ls3Dw2NatcI8wmxc5JgZcR02oIbaKBiwMRq6yLXmc7k/RMKZWIt+LfGVi
	DLwahl1qQUGj2WQcFVgTAZephMZxSvGaxwvLD3eQ6JXtn3prXMDaQpuSeIndPpHj9AQviDxbi8c
	HqBfzfQIM7UQaxU3hR4YPYM+UkuEiCBkew==
X-Google-Smtp-Source: AGHT+IH2Mv5uQN7VnPzUaQDX5RIFOYe4WHF2+BXPsAV64FeA80rClpdW3DKWh12Szu1NO8Zkqlabxg==
X-Received: by 2002:a05:600c:548a:b0:434:e69c:d338 with SMTP id 5b1f17b1804b1-436697f8bf8mr352226985e9.5.1735810871401;
        Thu, 02 Jan 2025 01:41:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1cfa:329a:aa2e:f0be? ([2a01:e0a:982:cbb0:1cfa:329a:aa2e:f0be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea42esm453596695e9.9.2025.01.02.01.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 01:41:10 -0800 (PST)
Message-ID: <bcb95701-d230-4ce1-9813-cbb75cdafa8b@linaro.org>
Date: Thu, 2 Jan 2025 10:41:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] phy: amlogic: meson8b-usb2: Use the
 regmap_{clear,set}_bits helpers
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, kishon@kernel.org
References: <20241231191718.2764065-1-martin.blumenstingl@googlemail.com>
 <20241231191718.2764065-3-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20241231191718.2764065-3-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_014113_117953_0BDDFF99 
X-CRM114-Status: GOOD (  15.69  )
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

On 31/12/2024 20:17, Martin Blumenstingl wrote:
> These require less code, reduce the chance of typos and overall make the
> intent clearer. No functional changes.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/phy/amlogic/phy-meson8b-usb2.c | 28 ++++++++++----------------
>   1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
> index d9c761b7c15c..a553231a9f7c 100644
> --- a/drivers/phy/amlogic/phy-meson8b-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
> @@ -165,8 +165,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
>   		return ret;
>   	}
>   
> -	regmap_update_bits(priv->regmap, REG_CONFIG, REG_CONFIG_CLK_32k_ALTSEL,
> -			   REG_CONFIG_CLK_32k_ALTSEL);
> +	regmap_set_bits(priv->regmap, REG_CONFIG, REG_CONFIG_CLK_32k_ALTSEL);
>   
>   	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_REF_CLK_SEL_MASK,
>   			   FIELD_PREP(REG_CTRL_REF_CLK_SEL_MASK, 0x2));
> @@ -175,23 +174,20 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
>   			   FIELD_PREP(REG_CTRL_FSEL_MASK, 0x5));
>   
>   	/* reset the PHY */
> -	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
> -			   REG_CTRL_POWER_ON_RESET);
> +	regmap_set_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET);
>   	udelay(RESET_COMPLETE_TIME);
> -	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET, 0);
> +	regmap_clear_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET);
>   	udelay(RESET_COMPLETE_TIME);
>   
> -	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_SOF_TOGGLE_OUT,
> -			   REG_CTRL_SOF_TOGGLE_OUT);
> +	regmap_set_bits(priv->regmap, REG_CTRL, REG_CTRL_SOF_TOGGLE_OUT);
>   
>   	if (priv->dr_mode == USB_DR_MODE_HOST) {
> -		regmap_update_bits(priv->regmap, REG_DBG_UART,
> -				   REG_DBG_UART_SET_IDDQ, 0);
> +		regmap_clear_bits(priv->regmap, REG_DBG_UART,
> +				  REG_DBG_UART_SET_IDDQ);
>   
>   		if (priv->match->host_enable_aca) {
> -			regmap_update_bits(priv->regmap, REG_ADP_BC,
> -					   REG_ADP_BC_ACA_ENABLE,
> -					   REG_ADP_BC_ACA_ENABLE);
> +			regmap_set_bits(priv->regmap, REG_ADP_BC,
> +					REG_ADP_BC_ACA_ENABLE);
>   
>   			udelay(ACA_ENABLE_COMPLETE_TIME);
>   
> @@ -214,17 +210,15 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
>   	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
>   
>   	if (priv->dr_mode == USB_DR_MODE_HOST)
> -		regmap_update_bits(priv->regmap, REG_DBG_UART,
> -				   REG_DBG_UART_SET_IDDQ,
> -				   REG_DBG_UART_SET_IDDQ);
> +		regmap_set_bits(priv->regmap, REG_DBG_UART,
> +				REG_DBG_UART_SET_IDDQ);
>   
>   	clk_disable_unprepare(priv->clk_usb);
>   	clk_disable_unprepare(priv->clk_usb_general);
>   	reset_control_rearm(priv->reset);
>   
>   	/* power off the PHY by putting it into reset mode */
> -	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
> -			   REG_CTRL_POWER_ON_RESET);
> +	regmap_set_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET);
>   
>   	return 0;
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

