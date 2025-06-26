Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40730C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMJbxK+Vs0vHD/rLpXgatG28H8njeuPukA8Oh9Ztkak=; b=jnJ7Fs1ye3qPkDgf66Iin4qxQt
	dmTlxTJYDZb0XC8s8U4B6d4Vh5a6jH/6cR5iSDkPr9RCXIeJo79FuCH5KtOgbXdEMLz5EKDmu9Gf2
	YNAmdnfXWy9Zrqa5EBUZ1Z5sGCRmieY/TkcGfBQ4GnrMgGl3DRHrF4hahdoOn0kUXbo8UhpYgY5RU
	Gu8jQ1aTLEIvDeWcaihGnWIBywODnQAqM4XKtYPkBlja3caMgY8ClDUEywPvc9NaG2AVcutiSRRtO
	oW8i+wv3gFWh2I9a0i0+MOD/zmw5KU4Gu23rrbzPysn/dQK7RPdnDXYaCSipnllUS7L0S7G2pBavW
	VZmVkNig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUncp-0000000Bvdd-43jE;
	Thu, 26 Jun 2025 14:30:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnMM-0000000BsbX-1bmo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 14:13:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so7741195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 07:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750947229; x=1751552029; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMJbxK+Vs0vHD/rLpXgatG28H8njeuPukA8Oh9Ztkak=;
        b=R4JqiO+bHXYQaOoWtrRLzi7sT0sau/zdSK98IxaDjV8Nb5uymJU/LgzZVgjtULdBou
         IKMw5gGO0nVA89W3RnYdCHBz7CZP99zSx3x5MGDu3DiTlUrtlGWwJJC3103kPtZAyeDW
         FVA9D6PX9kAiuUheLdwTGNiK4GEkfJ/GHHbpR4oan+xV+ySlpKS9MgUUVvuhDYHGa+rl
         KPtcQUxmR3eEf96+URNv8/HblUsHpkrCor2K3ibvOsbG5n8Ow/rQjEwwW4ID1tHODTzo
         +bsIxLP4JPd96VAZG9jMbYkuVwGZbx2v8rM0qgIpw5M6idRmQa7YSLLhp/S4WGEhA7KY
         2MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947229; x=1751552029;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NMJbxK+Vs0vHD/rLpXgatG28H8njeuPukA8Oh9Ztkak=;
        b=Lp1VmTdIJ5rn8oyXCTZEAK4h0s2ux1Whwrfzq3FyiJjsRNRfR1ublOCEDefsYzy8T8
         pcJJ0zODi272+VQgMgMc0Mh1iPrWMGKRgWB7/SliYgxHKTdBpTMTO/kQyvdd06oe/Mty
         k7SR0vmltpvFdIGz28ub/Sih5VwhZk23Rglpdp8JSEplMrPsPs+3SO1CukrJL2teWaIz
         Mwdy4sK35w1cJCpJMUGVeiYLIwORAaJoXEAPfuXIK/cZz9maoIPDMvmqnca9gNq1yM+7
         F2HUrarM2mNvIDO6hGvFI+RGGSRsPaL+sHSsu0QiXHokHAaJhCkzgAzc9TzeD+7243T0
         4isQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX83gBLx3POGxKi4UkS07AXLkcwVvyphMMy2MjNBI9YaGxbQpHYoalhoVe3yZAiPnUUU9Ku6Ih13U3BFzoGxb3@lists.infradead.org
X-Gm-Message-State: AOJu0YzwTIJV1ZP6xVNZYmtqoKz465dHd71eIyDdsMDCPM2SKVPSFeqD
	2vtBpBB/90MYNRJHhExTGf8jQUz3JxAZbPuFUp4jUqfZIQbBbAA1HrDkDj4y/rXQZyYhZ+BUQQR
	XhZUqx8Q=
X-Gm-Gg: ASbGncsgutrBVwMwRuZ7GRtlzazkbaTx+xUlEHAAiJgR50ICB8afQXdZtMuG8ZVvbi3
	eOtM/n2WsbkjhOcEpHnWhRQLS47rplze1y66D1oyV1ToFB7LeDMk0EzXTUCPmqLb51kziRet7Ez
	2qOPZvQqUwIGuecI9uirS3RVUu/zZHfB68iwGGkQcoIMzgGyn5+m4n22/F82x4XrfVvd3XnlzRV
	S5KBbBHECkT5OCosuxXpzuH0POd1gbCSXhMx4x0oqH3eASnVl4do5w2vmw2RrtQ0lmRGkfH0EcB
	Zw1NOB8M+7ffbXWAo98+RWsiijFUmS5sGS2xc5RuRu0x45A/EXPh97XOOfTSJElxJ+T3k/zmxGw
	cUsIlEmRYt18n0EtgIxTkQkQRWpqIA+PpTPK3EiQ=
X-Google-Smtp-Source: AGHT+IHAaJHtYzCJoYKM9gdvCp6tWkdRHXxVPebdwEL9y2imblqKnZ4SnYi7AI2VF2X9Y7HivIxDYA==
X-Received: by 2002:a05:600c:a01:b0:451:df07:d8e0 with SMTP id 5b1f17b1804b1-453889d0d93mr40114195e9.11.1750947228759;
        Thu, 26 Jun 2025 07:13:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fa6f:b132:4858:18cc? ([2a01:e0a:3d9:2080:fa6f:b132:4858:18cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm21614295e9.30.2025.06.26.07.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:13:48 -0700 (PDT)
Message-ID: <4da70304-96c6-4b2a-bd8c-0b53811089de@linaro.org>
Date: Thu, 26 Jun 2025 16:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/5] mfd: khadas-mcu: add Khadas Edge 2 registers
To: muhammed.efecetin.67@gmail.com, linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, lee@kernel.org,
 rafael@kernel.org, efectn@protonmail.com, daniel.lezcano@linaro.org
References: <cover.1746518265.git.efectn@protonmail.com>
 <16807e13e034f85adc91d131f6c5046ce7d98d9c.1746518265.git.efectn@protonmail.com>
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
In-Reply-To: <16807e13e034f85adc91d131f6c5046ce7d98d9c.1746518265.git.efectn@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_071350_434378_C1E3E14C 
X-CRM114-Status: GOOD (  16.57  )
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

On 26/06/2025 16:04, muhammed.efecetin.67@gmail.com wrote:
> From: Muhammed Efe Cetin <efectn@protonmail.com>
> 
> Add Khadas Edge 2 MCU registers to khadas-mcu.h and adjust some properties.
> Also, i've added some registers with V2 suffix,
> as same addresses were already exist for previous boards.
> 
> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
> ---
>   drivers/mfd/khadas-mcu.c       |  8 ++++++--
>   include/linux/mfd/khadas-mcu.h | 25 +++++++++++++++++++++++++
>   2 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> index ca4bd6cf5..199ed4925 100644
> --- a/drivers/mfd/khadas-mcu.c
> +++ b/drivers/mfd/khadas-mcu.c
> @@ -26,6 +26,10 @@ static bool khadas_mcu_reg_volatile(struct device *dev, unsigned int reg)
>   	case KHADAS_MCU_CHECK_USER_PASSWD_REG:
>   	case KHADAS_MCU_WOL_INIT_START_REG:
>   	case KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG:
> +	case KHADAS_MCU_LED_ON_RAM_REG:
> +	case KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2:
> +	case KHADAS_MCU_WDT_EN_REG:
> +	case KHADAS_MCU_SYS_RST_REG:
>   		return true;
>   	default:
>   		return false;
> @@ -69,14 +73,14 @@ static const struct regmap_config khadas_mcu_regmap_config = {
>   	.reg_bits	= 8,
>   	.reg_stride	= 1,
>   	.val_bits	= 8,
> -	.max_register	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
> +	.max_register	= KHADAS_MCU_SYS_RST_REG,
>   	.volatile_reg	= khadas_mcu_reg_volatile,
>   	.writeable_reg	= khadas_mcu_reg_writeable,
>   	.cache_type	= REGCACHE_MAPLE,
>   };
>   
>   static struct mfd_cell khadas_mcu_fan_cells[] = {
> -	/* VIM1/2 Rev13+ and VIM3 only */
> +	/* VIM1/2 Rev13+, VIM3 and Edge2 only */
>   	{ .name = "khadas-mcu-fan-ctrl", },
>   };
>   
> diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
> index a99ba2ed0..de570e159 100644
> --- a/include/linux/mfd/khadas-mcu.h
> +++ b/include/linux/mfd/khadas-mcu.h
> @@ -35,26 +35,45 @@
>   #define KHADAS_MCU_FACTORY_TEST_REG		0x16 /* R */
>   #define KHADAS_MCU_BOOT_MODE_REG		0x20 /* RW */
>   #define KHADAS_MCU_BOOT_EN_WOL_REG		0x21 /* RW */
> +#define KHADAS_MCU_BOOT_EN_DCIN_REG_V2		0x21 /* RW */
>   #define KHADAS_MCU_BOOT_EN_RTC_REG		0x22 /* RW */
>   #define KHADAS_MCU_BOOT_EN_EXP_REG		0x23 /* RW */
> +#define KHADAS_MCU_LED_MODE_ON_REG_V2		0x23 /* RW */
> +#define KHADAS_MCU_LED_MODE_OFF_REG_V2		0x24 /* RW */
>   #define KHADAS_MCU_BOOT_EN_IR_REG		0x24 /* RW */
>   #define KHADAS_MCU_BOOT_EN_DCIN_REG		0x25 /* RW */
> +#define KHADAS_MCU_RGB_ON_R_REG			0x25 /* RW */
> +#define KHADAS_MCU_RGB_ON_G_REG			0x26 /* RW */
>   #define KHADAS_MCU_BOOT_EN_KEY_REG		0x26 /* RW */
> +#define KHADAS_MCU_RGB_ON_B_REG			0x27 /* RW */
>   #define KHADAS_MCU_KEY_MODE_REG			0x27 /* RW */
> +#define KHADAS_MCU_RGB_OFF_R_REG		0x28 /* RW */
>   #define KHADAS_MCU_LED_MODE_ON_REG		0x28 /* RW */
> +#define KHADAS_MCU_RGB_OFF_G_REG		0x29 /* RW */
>   #define KHADAS_MCU_LED_MODE_OFF_REG		0x29 /* RW */
> +#define KHADAS_MCU_RGB_OFF_B_REG		0x2a /* RW */
> +#define KHADAS_MCU_REST_CONF_REG		0x2c /* WO */
>   #define KHADAS_MCU_SHUTDOWN_NORMAL_REG		0x2c /* RW */
>   #define KHADAS_MCU_MAC_SWITCH_REG		0x2d /* RW */
>   #define KHADAS_MCU_MCU_SLEEP_MODE_REG		0x2e /* RW */
> +#define KHADAS_MCU_BOOT_EN_IR_REG_V2		0x2f /* RW */
>   #define KHADAS_MCU_IR_CODE1_0_REG		0x2f /* RW */
>   #define KHADAS_MCU_IR_CODE1_1_REG		0x30 /* RW */
> +#define KHADAS_MCU_IR1_CUST1_REG		0x30 /* RW */
>   #define KHADAS_MCU_IR_CODE1_2_REG		0x31 /* RW */
> +#define KHADAS_MCU_IR1_CUST2_REG		0x31 /* RW */
>   #define KHADAS_MCU_IR_CODE1_3_REG		0x32 /* RW */
> +#define KHADAS_MCU_IR1_ORDER1_REG		0x32 /* RW */
>   #define KHADAS_MCU_USB_PCIE_SWITCH_REG		0x33 /* RW */
> +#define KHADAS_MCU_IR1_ORDER2_REG		0x33 /* RW */
> +#define KHADAS_MCU_IR2_CUST1_REG		0x34 /* RW */
>   #define KHADAS_MCU_IR_CODE2_0_REG		0x34 /* RW */
>   #define KHADAS_MCU_IR_CODE2_1_REG		0x35 /* RW */
> +#define KHADAS_MCU_IR2_CUST2_REG		0x35 /* RW */
>   #define KHADAS_MCU_IR_CODE2_2_REG		0x36 /* RW */
> +#define KHADAS_MCU_IR2_ORDER1_REG		0x36 /* RW */
>   #define KHADAS_MCU_IR_CODE2_3_REG		0x37 /* RW */
> +#define KHADAS_MCU_IR2_ORDER2_REG		0x36 /* RW */
>   #define KHADAS_MCU_PASSWD_USER_0_REG		0x40 /* RW */
>   #define KHADAS_MCU_PASSWD_USER_1_REG		0x41 /* RW */
>   #define KHADAS_MCU_PASSWD_USER_2_REG		0x42 /* RW */
> @@ -69,6 +88,11 @@
>   #define KHADAS_MCU_SHUTDOWN_NORMAL_STATUS_REG	0x86 /* RO */
>   #define KHADAS_MCU_WOL_INIT_START_REG		0x87 /* WO */
>   #define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG	0x88 /* WO */
> +#define KHADAS_MCU_LED_ON_RAM_REG		0x89 /* WO */
> +#define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2	0x8A /* WO */
> +#define KHADAS_MCU_WDT_EN_REG			0x8B /* WO */
> +#define KHADAS_MCU_SYS_RST_REG			0x91 /* WO */
> +
>   
>   enum {
>   	KHADAS_BOARD_VIM1 = 0x1,
> @@ -76,6 +100,7 @@ enum {
>   	KHADAS_BOARD_VIM3,
>   	KHADAS_BOARD_EDGE = 0x11,
>   	KHADAS_BOARD_EDGE_V,
> +	KHADAS_BOARD_EDGE2,
>   };
>   
>   /**

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

