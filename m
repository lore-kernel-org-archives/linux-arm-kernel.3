Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2D6D29DE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gev8tBZXzrScGOKML2HBhgZmz0MNPdrJkzrKL0fVg8s=; b=eNnoaaQuEnaFUIvVFRH+cMEcIw
	zJVOtYrzC7w9PA519CiaGXOXN18803023Dg8nSnKUk2XctSADZas9aWGZqT2VRx2aK0sOUvrjHpaf
	KtPYYnURpOff4hRabmSe2ilyZiC3qhR8/URiC1eedCUmNUTexnTDGsO4Cj8qMq/h7LUJHkwXxbfUN
	lZwCqsb7f96dewy/LtSrWDqsTZI6d3tvqnsHtB9DOgsJGM/9N5rbZ7TwuS9/Zh3hwxbTr0ot9+ndD
	Y+9fgmnlBeMD7Lwo2wMghSRakzkMIEjTyhYCcVBUW+TXetianzXKF8UsZP3H4cNHQHHHIRpuOMZMm
	w0f1AWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZW8-00000006iF0-0iu2;
	Tue, 13 Jan 2026 08:12:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZW4-00000006iD1-3Gh5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 08:12:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso56797425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 00:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768291959; x=1768896759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gev8tBZXzrScGOKML2HBhgZmz0MNPdrJkzrKL0fVg8s=;
        b=IIlhc2x5sb+VY+zGFqZYl/o2St+leIzxY02ec8rqtqlWSEkfSS5bh4R9cHl6IkVx1k
         fD5e3bdSszcUuAUYPVxSKiPgd5WQdT/fbnWfTl6IVvuvvJXXZ0pG09Lr/BDjQHaYUCAq
         w97HAyxZV5cDUn6GUYX1DcfJ40ctmrKCDIgZ+UvkX2NRm626LiLlTi4Ip59gWVWRu3Ci
         2cPrC4S+ZpzWpk9ouZeqSGcnSTpEVeCbbzpmacfQ6kqepA9ctz9uH/J4BynqlqOmxyhg
         hmH3d1IiLnk+K0Y2Wez1DtCYVqltay+W8Lch6NfvrMxaIxv7QTCCSiKwiv2qPT+ut9lO
         JCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291959; x=1768896759;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gev8tBZXzrScGOKML2HBhgZmz0MNPdrJkzrKL0fVg8s=;
        b=Tf/OwIX/5tEaV4/WIdMLh3elqKceX407b5gcuRjOcmXOR2ty8floiVR0dat8qgqjFS
         nQdf8FvYLulblwuZuP9pAo/MfCvIs+HwubtDr/egpj9lzK6ThkfVs9UdHP48qAAJudOC
         Gm/viYnh2SyPHFd7ZIkmirBVzGvV/njg3i2caryTfUPjUIUGi3+tLxpyBHHZ5c6idCdG
         9LNwwOFzwilUonoo6RCeco7bxmXrD8hVAPLte9B1RbWOsggzwePKTFgWa/exoNuZUmXQ
         8BGUFizLhZi9qMDDtD+jLbqxBzCKzldmWhVyeWs/piq/zjnCp9KuIuFGlofYagoAf590
         3lYw==
X-Forwarded-Encrypted: i=1; AJvYcCV6TAuDBSLd3w3X1imHxW66c3ZAu7t5kNv+fDKfy1usd1yDJDSwidmwKrmPKoTHg++lAD/7R2paJdNto2AJMIvl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx50DnBaC1Hq1rKhl/4Nf7PoZVAb/zyrgZyn95btS4T7I710++V
	0vD0CtQpTQGdo8RmeJtAdEh10mHvuR29IufjaxAAYBQCwtqJH4wCiyDouZRTM6+Fu7g=
X-Gm-Gg: AY/fxX4oSnmPsYWIfk6gs8e74MYcS6Pk5WWYkQXyWP2ZNQ6SjCoAneUFP1CjlLBztm2
	eBcoAd5qSyIsYp6ujycx6QwYQ3OdXxRWkqcZqz9HsD6zOyDK/l1GazNS5BkzRP8OqeASYtVgboL
	Yr+eixZ/dj5RyrjZ4Ta1R6c3nZWOJOJjkmBd07Z5JvFgaxm2buhRKTrezJcSUxTHqeAU/7OpdfT
	3nTsDrY9oEBnPY20XjilAgE9mGVQg9TFdkEPWSNUMqfhUQNEwuZdygDDUEPzdA2x418692ZENvo
	D8/Y9UnhgblO6uE2ce3nwVCiS+Ga9kOCGxAt+te5Hwy0njGPk//SlkXCNZX0SmFsUhqstd1M0JX
	iVR4CekZEC5oStnwLZVLpNZtF4KBfay3pVmkT8ITvNMnIX8Y/d4i1UVuMPvHuf4WpuJMRy62Rg1
	0rOo5PwnCvMf9lEveKpdsxdj+MqMvcMHV4a5CQnxI=
X-Google-Smtp-Source: AGHT+IEUvQPIsbGq5LkW9n7Jk5Wyh3BEzNuRx6xCdwOIEmf7rMSQ55YXE+iq1Ow72pvMBxBUtlYtTg==
X-Received: by 2002:a05:600c:3556:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-47d84b3b52dmr246601805e9.32.1768291958788;
        Tue, 13 Jan 2026 00:12:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768? ([2a01:e0a:3d9:2080::fa42:7768])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ed98abad1sm24088115e9.10.2026.01.13.00.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:12:38 -0800 (PST)
Message-ID: <134b8df9-24a5-4f92-9505-1e7c31fdff1e@linaro.org>
Date: Tue, 13 Jan 2026 09:12:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 04/11] phy: rockchip: samsung-hdptx: Consistently use
 [rk_]hdptx_[tmds_] prefixes
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260113-phy-hdptx-frl-v6-0-8d5f97419c0b@collabora.com>
 <20260113-phy-hdptx-frl-v6-4-8d5f97419c0b@collabora.com>
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
In-Reply-To: <20260113-phy-hdptx-frl-v6-4-8d5f97419c0b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_001240_871167_23B28E5B 
X-CRM114-Status: GOOD (  22.03  )
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

On 1/13/26 00:20, Cristian Ciocaltea wrote:
> Fix the naming inconsistencies for some of the functions and global
> variables:
> 
> * Add the missing 'rk_hdptx_' prefix to ropll_tmds_cfg variable
> * Replace '_ropll_tmds_' with '_tmds_ropll_' globally
> * Replace 'hdtpx' with 'hdptx' globally
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 62 +++++++++++------------
>   1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 3f8a7f4f5cd8..3c6eb6dbadd0 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -32,17 +32,17 @@
>   #define HDPTX_O_PHY_RDY			BIT(1)
>   #define HDPTX_O_SB_RDY			BIT(0)
>   
> -#define HDTPX_REG(_n, _min, _max)				\
> +#define HDPTX_REG(_n, _min, _max)				\
>   	(							\
>   		BUILD_BUG_ON_ZERO((0x##_n) < (0x##_min)) +	\
>   		BUILD_BUG_ON_ZERO((0x##_n) > (0x##_max)) +	\
>   		((0x##_n) * 4)					\
>   	)
>   
> -#define CMN_REG(n)			HDTPX_REG(n, 0000, 00a7)
> -#define SB_REG(n)			HDTPX_REG(n, 0100, 0129)
> -#define LNTOP_REG(n)			HDTPX_REG(n, 0200, 0229)
> -#define LANE_REG(n)			HDTPX_REG(n, 0300, 062d)
> +#define CMN_REG(n)			HDPTX_REG(n, 0000, 00a7)
> +#define SB_REG(n)			HDPTX_REG(n, 0100, 0129)
> +#define LNTOP_REG(n)			HDPTX_REG(n, 0200, 0229)
> +#define LANE_REG(n)			HDPTX_REG(n, 0300, 062d)
>   
>   /* CMN_REG(0008) */
>   #define OVRD_LCPLL_EN_MASK		BIT(7)
> @@ -397,7 +397,7 @@ struct rk_hdptx_phy {
>   	unsigned int lanes;
>   };
>   
> -static const struct ropll_config ropll_tmds_cfg[] = {
> +static const struct ropll_config rk_hdptx_tmds_ropll_cfg[] = {
>   	/*             |              pms             |        sdm         |     sdc     | */
>   	/*        rate, mdiv, mdafc, pdiv, rdiv, sdiv, en, deno, nsig, num,  n, num, deno, */
>   	{ 594000000ULL,  124,   124,    1,    1,    0,  1,   62,    1,  16,  5,   0,    1, },
> @@ -424,7 +424,7 @@ static const struct ropll_config ropll_tmds_cfg[] = {
>   	{  25175000ULL,   84,    84,    1,    1,   15,  1,  168,    1,  16,  4,   1,    1, },
>   };
>   
> -static const struct reg_sequence rk_hdtpx_common_cmn_init_seq[] = {
> +static const struct reg_sequence rk_hdptx_common_cmn_init_seq[] = {
>   	REG_SEQ0(CMN_REG(0009), 0x0c),
>   	REG_SEQ0(CMN_REG(000a), 0x83),
>   	REG_SEQ0(CMN_REG(000b), 0x06),
> @@ -514,7 +514,7 @@ static const struct reg_sequence rk_hdtpx_common_cmn_init_seq[] = {
>   	REG_SEQ0(CMN_REG(009b), 0x10),
>   };
>   
> -static const struct reg_sequence rk_hdtpx_tmds_cmn_init_seq[] = {
> +static const struct reg_sequence rk_hdptx_tmds_cmn_init_seq[] = {
>   	REG_SEQ0(CMN_REG(0008), 0x00),
>   	REG_SEQ0(CMN_REG(0011), 0x01),
>   	REG_SEQ0(CMN_REG(0017), 0x20),
> @@ -556,14 +556,14 @@ static const struct reg_sequence rk_hdtpx_tmds_cmn_init_seq[] = {
>   	REG_SEQ0(CMN_REG(009b), 0x00),
>   };
>   
> -static const struct reg_sequence rk_hdtpx_common_sb_init_seq[] = {
> +static const struct reg_sequence rk_hdptx_common_sb_init_seq[] = {
>   	REG_SEQ0(SB_REG(0114), 0x00),
>   	REG_SEQ0(SB_REG(0115), 0x00),
>   	REG_SEQ0(SB_REG(0116), 0x00),
>   	REG_SEQ0(SB_REG(0117), 0x00),
>   };
>   
> -static const struct reg_sequence rk_hdtpx_tmds_lntop_highbr_seq[] = {
> +static const struct reg_sequence rk_hdptx_tmds_lntop_highbr_seq[] = {
>   	REG_SEQ0(LNTOP_REG(0201), 0x00),
>   	REG_SEQ0(LNTOP_REG(0202), 0x00),
>   	REG_SEQ0(LNTOP_REG(0203), 0x0f),
> @@ -571,7 +571,7 @@ static const struct reg_sequence rk_hdtpx_tmds_lntop_highbr_seq[] = {
>   	REG_SEQ0(LNTOP_REG(0205), 0xff),
>   };
>   
> -static const struct reg_sequence rk_hdtpx_tmds_lntop_lowbr_seq[] = {
> +static const struct reg_sequence rk_hdptx_tmds_lntop_lowbr_seq[] = {
>   	REG_SEQ0(LNTOP_REG(0201), 0x07),
>   	REG_SEQ0(LNTOP_REG(0202), 0xc1),
>   	REG_SEQ0(LNTOP_REG(0203), 0xf0),
> @@ -579,7 +579,7 @@ static const struct reg_sequence rk_hdtpx_tmds_lntop_lowbr_seq[] = {
>   	REG_SEQ0(LNTOP_REG(0205), 0x1f),
>   };
>   
> -static const struct reg_sequence rk_hdtpx_common_lane_init_seq[] = {
> +static const struct reg_sequence rk_hdptx_common_lane_init_seq[] = {
>   	REG_SEQ0(LANE_REG(0303), 0x0c),
>   	REG_SEQ0(LANE_REG(0307), 0x20),
>   	REG_SEQ0(LANE_REG(030a), 0x17),
> @@ -634,7 +634,7 @@ static const struct reg_sequence rk_hdtpx_common_lane_init_seq[] = {
>   	REG_SEQ0(LANE_REG(0620), 0xa0),
>   };
>   
> -static const struct reg_sequence rk_hdtpx_tmds_lane_init_seq[] = {
> +static const struct reg_sequence rk_hdptx_tmds_lane_init_seq[] = {
>   	REG_SEQ0(LANE_REG(0312), 0x00),
>   	REG_SEQ0(LANE_REG(0412), 0x00),
>   	REG_SEQ0(LANE_REG(0512), 0x00),
> @@ -938,7 +938,7 @@ static bool rk_hdptx_phy_clk_pll_calc(unsigned long long rate,
>   	return true;
>   }
>   
> -static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
> +static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
>   {
>   	const struct ropll_config *cfg = NULL;
>   	struct ropll_config rc = {0};
> @@ -947,9 +947,9 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
>   	if (!hdptx->hdmi_cfg.tmds_char_rate)
>   		return 0;
>   
> -	for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
> -		if (hdptx->hdmi_cfg.tmds_char_rate == ropll_tmds_cfg[i].rate) {
> -			cfg = &ropll_tmds_cfg[i];
> +	for (i = 0; i < ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg); i++)
> +		if (hdptx->hdmi_cfg.tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate) {
> +			cfg = &rk_hdptx_tmds_ropll_cfg[i];
>   			break;
>   		}
>   
> @@ -969,8 +969,8 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
>   
>   	rk_hdptx_pre_power_up(hdptx);
>   
> -	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_common_cmn_init_seq);
> -	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_cmn_init_seq);
> +	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_cmn_init_seq);
> +	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_cmn_init_seq);
>   
>   	regmap_write(hdptx->regmap, CMN_REG(0051), cfg->pms_mdiv);
>   	regmap_write(hdptx->regmap, CMN_REG(0055), cfg->pms_mdiv_afc);
> @@ -1012,25 +1012,25 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
>   	return ret;
>   }
>   
> -static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx)
> +static int rk_hdptx_tmds_ropll_mode_config(struct rk_hdptx_phy *hdptx)
>   {
> -	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_common_sb_init_seq);
> +	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_sb_init_seq);
>   
>   	regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
>   
>   	if (hdptx->hdmi_cfg.tmds_char_rate > HDMI14_MAX_RATE) {
>   		/* For 1/40 bitrate clk */
> -		rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lntop_highbr_seq);
> +		rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_lntop_highbr_seq);
>   	} else {
>   		/* For 1/10 bitrate clk */
> -		rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lntop_lowbr_seq);
> +		rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_lntop_lowbr_seq);
>   	}
>   
>   	regmap_write(hdptx->regmap, LNTOP_REG(0206), 0x07);
>   	regmap_write(hdptx->regmap, LNTOP_REG(0207), 0x0f);
>   
> -	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_common_lane_init_seq);
> -	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lane_init_seq);
> +	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_lane_init_seq);
> +	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_lane_init_seq);
>   
>   	return rk_hdptx_post_enable_lane(hdptx);
>   }
> @@ -1089,7 +1089,7 @@ static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx)
>   	if (mode == PHY_MODE_DP) {
>   		rk_hdptx_dp_reset(hdptx);
>   	} else {
> -		ret = rk_hdptx_ropll_tmds_cmn_config(hdptx);
> +		ret = rk_hdptx_tmds_ropll_cmn_config(hdptx);
>   		if (ret)
>   			goto dec_usage;
>   	}
> @@ -1436,7 +1436,7 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>   		regmap_write(hdptx->grf, GRF_HDPTX_CON0,
>   			     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
>   
> -		ret = rk_hdptx_ropll_tmds_mode_config(hdptx);
> +		ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
>   		if (ret)
>   			rk_hdptx_phy_consumer_put(hdptx, true);
>   	}
> @@ -1459,11 +1459,11 @@ static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
>   	if (!hdmi->tmds_char_rate || hdmi->tmds_char_rate > HDMI20_MAX_RATE)
>   		return -EINVAL;
>   
> -	for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
> -		if (hdmi->tmds_char_rate == ropll_tmds_cfg[i].rate)
> +	for (i = 0; i < ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg); i++)
> +		if (hdmi->tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate)
>   			break;
>   
> -	if (i == ARRAY_SIZE(ropll_tmds_cfg) &&
> +	if (i == ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg) &&
>   	    !rk_hdptx_phy_clk_pll_calc(hdmi->tmds_char_rate, NULL))
>   		return -EINVAL;
>   
> @@ -1891,7 +1891,7 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>   	 * while the latter being executed only once, i.e. when clock remains
>   	 * in the prepared state during rate changes.
>   	 */
> -	return rk_hdptx_ropll_tmds_cmn_config(hdptx);
> +	return rk_hdptx_tmds_ropll_cmn_config(hdptx);
>   }
>   
>   static const struct clk_ops hdptx_phy_clk_ops = {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

