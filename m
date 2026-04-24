Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23F6FE51FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+of0FE0tSbmaf7cezfG/Dp70p8BpOoi594bsa5N30Y=; b=0toF41NAKFb1mGmxn54dr8KP0Z
	5oEiVZw57F0BHb4+X/IeM8XO9K3NokKubW0JeqLTYgNLDlQg+XTKqm1bIPXdlyB7zlmSq/sWtb3vE
	GU7C3LqlvOwRNtHiGyjfbkQ2SpZSnQimLwJtDNfXY2Lsc1QwfwI/3VQu/ZSY1nva0Gn1XNtWIytui
	icwAsJtfAcHS1UTfFN1ZscuecohI+tOWXG+WsRNz10wGqHjQ5/qPi/MhIazZGRgzVMcJLw7IoOt7n
	D+Ofgj4iTac/XqrBIGU4w86yJ+Q/+QCTu/SjJof7jSXyfgUzwgjai6GHod6MVIZeVGGfj12jpairf
	aigIBLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDFo-0000000CyMA-1XmM;
	Fri, 24 Apr 2026 09:55:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDFl-0000000CyLV-3NBx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 09:55:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso57724065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 02:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024516; x=1777629316; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+of0FE0tSbmaf7cezfG/Dp70p8BpOoi594bsa5N30Y=;
        b=f0Qz9nkDBfH/EjzvTw1hOBYVRPgrE1tl8jAuhTA/z4a4Wb31fpPqyz98qnWzhQTTRJ
         Q2rdZ43UC9iopxUiI4Y1vFMu5ljo4YhDH3RUvaFArrLVSDAPS7qrTmyshKR6w2nCVFBE
         k1X/LcNNAFZRKJDLQ2oLr9QLGon4JWXRE+Iub/QoGO10Muzym2/pclJhtEbHfWTnPwuc
         Jdti/bYDNPD7zfK+MEOjeKrxuMvVlG/FavZD+CNBgefK59nbmakFW47zQe5SFwW3KU1z
         aGmC88l+3jywS6CAFSNi4CxbXekwlMY1R3ECCL606oCtNcsIP5mDaUjA4FxMk3bEIgLv
         DhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024516; x=1777629316;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+of0FE0tSbmaf7cezfG/Dp70p8BpOoi594bsa5N30Y=;
        b=Va/eSCxstxZT2C1l8I0SxdDJEAlp0pLBz+E8bb+A5ZgDAg/+BsUe45PSkdZiTvCxHO
         2B/Wym+TClZLKwOlVosOjtPvK3zyCN3ozG3LHIWwBg505ZJNH8zmPG33JoXAqsHQa0eV
         DhyK7hoxCOIuhWe+K3JpkDCJhQDe1jl+bpwMu5P1wYujxNYdeUHi9Ibev3X7kvVciSIr
         nSguYWH60a0a4nTNFKye45FTcR9ekmutkujaDd8VtorTZ6vzglVP2qcx9OkymtaF956i
         pgrK1eQ0waek9QCTkI15R9m8GtSCmIbKOnjD2pa5Lrhkrns0w/FvJwii/DGY1FqG26D9
         bMkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8w2cyQlGXyThNFi+u4Zi0Uhm+wk/mVlbKoDRp69Axo6vr8xl3McOzsa3k83+phjUWKY1UiEEyKPscIStVe04tX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx58tGxT0O0zDzP8SaqtpIrzAOZfstIRlh1dV3JoANH3In5UmC2
	nQyPw/ChZBHguJctugDKYjwWzIz5AM8/23JoLFNpGMRplLf5jUCkK6O8Y6OgLo2nzRk=
X-Gm-Gg: AeBDieuo+5TzSd1fQrWB4Eo1iFbE0IhzufokHd+F/Y+2RTcRxODeoIx3izDD2JbZSj3
	jh2v//Byj7wWIw3fH9p6kyzAJMpHzZyqgOEBvatfhABwFMM2DuuSr31BprE69tlQKl98W5IFQV/
	VZmxLR1sOsAHpAhJ941/ALU7NiMuwn4KYHSMI2lDN+6Y3I4VMBR5bEfgyAFg1u/O0qI6YKNsRyA
	ny+TNG1kN+tppzTVYcZ7t2fwS3QiYrmHtcR+DwJEIoyMmiu7+lNYJt1TO2kPePd1dsDSuKt/SI/
	g3gdwm8+hwq2d0q2T9gjDbSbZSaEOtkNRQf/M1uoeW0KBG1XEO+931Dms2Sfr3SaTA4a3z/pjxl
	3Do0iDKvr8Wan+VTVB+cP+u00+/bWF7ibdC9xPBZKgMRth2LZBI99u1LR/lg0FM8lxln2yM+qnF
	K6CiIgUHNqbSpl/PgSqIupTaimrip7RIq3cj11OtHm5Rkb6gK/2EUErXVQO0UDVOyrgUVldcRck
	m24CeoWGJ4N0awJtA==
X-Received: by 2002:a05:600c:888b:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-488fb73d234mr372911565e9.2.1777024515945;
        Fri, 24 Apr 2026 02:55:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc18bccfsm526904435e9.8.2026.04.24.02.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:55:15 -0700 (PDT)
Message-ID: <afd6b8b9-06b5-41e1-9b3e-e4a896d77f8c@linaro.org>
Date: Fri, 24 Apr 2026 11:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/8] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
 <20260421-add-mcu-fan-khadas-vim4-v4-3-447114a28f2d@aliel.fr>
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
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-3-447114a28f2d@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_025517_897599_FB2A83B4 
X-CRM114-Status: GOOD (  18.43  )
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

On 4/21/26 13:49, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Introduce a per-variant configuration structure (khadas_mcu_data)
> holding the regmap config and MFD cells,
> selected at probe time via the of_device_id match data.
> This makes adding other variants straightforward.
> 
> Also introduce khadas_mcu_fan_pdata to pass fan register address and
> maximum level to the fan sub-driver, removing the hardcoded constants.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   include/linux/mfd/khadas-mcu.h | 39 +++++++++++++++++++++++++++++++++++++--
>   1 file changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
> index a99ba2ed0e4e0..75e275d3fa8d9 100644
> --- a/include/linux/mfd/khadas-mcu.h
> +++ b/include/linux/mfd/khadas-mcu.h
> @@ -70,6 +70,13 @@
>   #define KHADAS_MCU_WOL_INIT_START_REG		0x87 /* WO */
>   #define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG	0x88 /* WO */
>   
> +/* VIM4 specific registers */
> +#define KHADAS_MCU_VIM4_REST_CONF_REG		0x2c /* WO - reset EEPROM */
> +#define KHADAS_MCU_VIM4_LED_ON_RAM_REG		0x89 /* WO - LED volatile */
> +#define KHADAS_MCU_VIM4_FAN_CTRL_REG		0x8a /* WO */
> +#define KHADAS_MCU_VIM4_WDT_EN_REG		0x8b /* WO */
> +#define KHADAS_MCU_VIM4_SYS_RST_REG		0x91 /* WO */
> +
>   enum {
>   	KHADAS_BOARD_VIM1 = 0x1,
>   	KHADAS_BOARD_VIM2,
> @@ -82,10 +89,38 @@ enum {
>    * struct khadas_mcu - Khadas MCU structure
>    * @device:		device reference used for logs
>    * @regmap:		register map
> + * @data:		pointer to variant-specific config
>    */
>   struct khadas_mcu {
> -	struct device *dev;
> -	struct regmap *regmap;
> +	struct device			*dev;
> +	struct regmap			*regmap;
> +	const struct khadas_mcu_data	*data;
> +};
> +
> +/**
> + * struct khadas_mcu_data - per-variant configuration
> + * @regmap_config:	regmap configuration
> + * @cells:		MFD sub-devices
> + * @ncells:		number of sub-devices
> + * @fan_cells:		MFD fan sub-devices
> + * @nfan_cells:		number of fan sub-devices
> + */
> +struct khadas_mcu_data {
> +	const struct regmap_config	*regmap_config;
> +	const struct mfd_cell		*cells;
> +	int				ncells;
> +	const struct mfd_cell		*fan_cells;
> +	int				nfan_cells;
> +};
> +
> +/**
> + * struct khadas_mcu_fan_pdata - fan sub-driver configuration
> + * @fan_reg: register address to write the fan level
> + * @max_level: maximum fan level
> + */
> +struct khadas_mcu_fan_pdata {
> +	unsigned int fan_reg;
> +	unsigned int max_level;
>   };
>   
>   #endif /* MFD_KHADAS_MCU_H */
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

