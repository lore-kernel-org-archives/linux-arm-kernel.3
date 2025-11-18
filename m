Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0387CED63B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sS1O37YoQ8ML4Scdituu7Y1fxQ5FsFsQTc7CjlszrQ0=; b=V5IjYsv6prLxpLo8W5rDR3eXm8
	kRrrLNpcdqW14hhsGdS7wL/PdZgrpMndZCMDuX1NDnJb56jzFQbJmQzsBm5wVbQursPUmXJokK99z
	ruSCZ1oyBVzVIXnUrdbbnqdSgj/e7vaaIJEf2wLDLqOa66G/eiNQw/kG/h3m75upppQoDuXdPZvLf
	WhDUhYufZ61TKgdCvZk7B95SdyV8adkKiq8x610+CJz4ZgO1m39rjALWbDQHio0EftYG/VjFThsKW
	BX0OJlE3x12Yz/11KWRsi/qhYItvvwHZxkDHCqJF0JSwTONXS/ZSMC60GGeZu4ft9nZeMY2GTEant
	fSYPg4jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLM67-00000000UH5-3yOE;
	Tue, 18 Nov 2025 13:50:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLM64-00000000UFf-2xvF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:50:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so25786955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763473815; x=1764078615; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sS1O37YoQ8ML4Scdituu7Y1fxQ5FsFsQTc7CjlszrQ0=;
        b=Y28/D593REX+qmMNu329g7Ey0Hh7hhzfvmxHVDhB3KtieX7vkPP34zg7OcJxjFrCSD
         GhTZMLGCXSC8ZABNPlxhwjZZIIZ4EZEpNPCx+KamtBEBS/iIq3gs5V6y7BnjIM02CvdR
         BIapOOt9xvjJkqQaAm99V6gzdjDbrmrsDTC36XtakcjVIO/XlCvN0mDTATxlXUBSeDGA
         +FcP9FDoOCNBx+i8Mtgv8JGoMUzpXMEDXGEUt3MDAVOijReBJWDz9rgfEHIlUJ0X92uF
         QtObxI2XmlrwZbZTKlZEekJwNCZDLciaQOUSgOxrGoP7z1yoQyP9/PUHX9G99F22HG2T
         CkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763473815; x=1764078615;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sS1O37YoQ8ML4Scdituu7Y1fxQ5FsFsQTc7CjlszrQ0=;
        b=oFlefl2FRiIwjdnZBfWQdRcAmTOykRLG0/ndxz0TQ6NFGT1gJrp5Bl3TfFGiPIJsX9
         Xp4joPivs+jK25RN2BVC+Ji5mdgqSXo6qsusqYuBOf+/H61blY7HRQFQgnK0ss4f6z9b
         HLsf76mkzIUzTPxGnh/gkqyPBp9jPECqYK4YI+sIUrsnanJDYJME+bRSOjtexZ6eDWTb
         RPhTSMtDWNdKMCtcxl4GB2/V6mtLsgOO/HNXT8Vtxj7baGmZcaS29Akr/hOQxf2+PGzm
         kbNV1GqXf8bHz7TogtWM5GrG5tvn13gLzmVyZTu1pSpjfTVDEehhyQlR5NsbfYwQjhN/
         HkBw==
X-Forwarded-Encrypted: i=1; AJvYcCUnAqYe5nOQQerrwhB7gWX4XTFVxWoaJupdLjfjx6q9sZZjA+L24SAHdiA7lhkyX/8eojn+OB8ICnGKgJZ0X7Br@lists.infradead.org
X-Gm-Message-State: AOJu0YzYTMrVaS2sqsE3cRfwuZofO9hUgYE+rYz3zERnCkp2pRNhxBgM
	0jK7v056VoRW5O0KteOV0JodY+D09Qg5GJHG7ibNfxqofX55cOH13UxUbj0ZpBeeggM=
X-Gm-Gg: ASbGncsnL9jWpMfEONYh+GDJo6A9hL7KYQPNfYC1HO3lOMvWF4gOrs3i5cOSjjJ7HIx
	b3Mf61JurYCZlskfTLIyllhMoJazElEZ7SIEmn82zSuwsE9MGa9zUZPDBiye/qOSkbiSKO+anKD
	vQWMq+cdheRNyFENKXaR7g11FZ/Jaamn8HTSkQICXup3xQSXuqxhoHRzLwIdIoRjpEw+EFzzhJG
	msldoQuQTHV77jZPQyR2EBYsJ1c7dIrdLs8nRVPJdMvdVIpDIoBymSGTxDH5aAskmPL9dwRAlGj
	cnYvK2hQEZ0h3huTeB9wyuJnWKnw+JVCljv24XptX1L68gwUZ2MbWfc/wYuEhsEIZ3XvKKh/W9H
	iXa38sLy8qg4IRtKs6yw9Fpx6/fX68yj2ts5K1oAyqAGjSV1DwsAquECs6sIBagl+4rqY4M+h1y
	yYY87Oa0/iqSvgsRhgibt0SfjZyFT2rmF6qTjmRSOYrrn5yeRFcisk8KUQh4Bkrs6L/GF1wNqb5
	w==
X-Google-Smtp-Source: AGHT+IHqgJck/ttH3h1ZU/eKtDbxFFeFyaQE38hcB39zt7XFGfX1Rdi2YxyWRaxn0VdeitvcYaudzg==
X-Received: by 2002:a05:600c:3105:b0:477:569c:34e9 with SMTP id 5b1f17b1804b1-4778fe95ff8mr157594985e9.23.1763473814678;
        Tue, 18 Nov 2025 05:50:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e36ca3sm393596255e9.5.2025.11.18.05.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:50:14 -0800 (PST)
Message-ID: <96596cf7-4b19-4873-ba16-936e398e876f@linaro.org>
Date: Tue, 18 Nov 2025 14:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 6/9] phy: rockchip: inno-dsidphy: Add support for rk3506
To: Chaoyi Chen <kernel@airkyi.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Hongming Zou <hongming.zou@rock-chips.com>
References: <20251106020632.92-1-kernel@airkyi.com>
 <20251106020632.92-7-kernel@airkyi.com>
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
In-Reply-To: <20251106020632.92-7-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_055016_788442_2939E5F1 
X-CRM114-Status: GOOD (  22.97  )
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

On 11/6/25 03:06, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> For MIPI mode, the inno-dsidphy found on RK3506 supports up to 2 lanes
> and a maximum data rate of 1.5GHz.
> 
> Signed-off-by: Hongming Zou <hongming.zou@rock-chips.com>
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>   .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 91 ++++++++++++++++++-
>   1 file changed, 88 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> index d5b1a4e2f7d3..30d5e5ddff4a 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> @@ -99,10 +99,30 @@
>   #define VOD_MID_RANGE				0x3
>   #define VOD_BIG_RANGE				0x7
>   #define VOD_MAX_RANGE				0xf
> +/* Analog Register Part: reg18 */
> +#define LANE0_PRE_EMPHASIS_ENABLE_MASK		BIT(6)
> +#define LANE0_PRE_EMPHASIS_ENABLE		BIT(6)
> +#define LANE0_PRE_EMPHASIS_DISABLE		0
> +#define LANE1_PRE_EMPHASIS_ENABLE_MASK		BIT(5)
> +#define LANE1_PRE_EMPHASIS_ENABLE		BIT(5)
> +#define LANE1_PRE_EMPHASIS_DISABLE		0
> +/* Analog Register Part: reg19 */
> +#define PRE_EMPHASIS_RANGE_SET_MASK		GENMASK(7, 6)
> +#define PRE_EMPHASIS_RANGE_SET(x)		UPDATE(x, 7, 6)
>   /* Analog Register Part: reg1E */
>   #define PLL_MODE_SEL_MASK			GENMASK(6, 5)
>   #define PLL_MODE_SEL_LVDS_MODE			0
>   #define PLL_MODE_SEL_MIPI_MODE			BIT(5)
> +/* Analog Register Part: reg20 */
> +#define LANE0_PRE_EMPHASIS_RANGE_SET_MASK	GENMASK(7, 6)
> +#define LANE0_PRE_EMPHASIS_RANGE_SET(x)		UPDATE(x, 7, 6)
> +/* Analog Register Part: reg21 */
> +#define LANE1_PRE_EMPHASIS_RANGE_SET_MASK	GENMASK(7, 6)
> +#define LANE1_PRE_EMPHASIS_RANGE_SET(x)		UPDATE(x, 7, 6)
> +#define PRE_EMPHASIS_MIN_RANGE			0x0
> +#define PRE_EMPHASIS_MID_RANGE			0x1
> +#define PRE_EMPHASIS_MAX_RANGE			0x2
> +#define PRE_EMPHASIS_RESERVED_RANGE		0x3
>   /* Digital Register Part: reg00 */
>   #define REG_DIG_RSTN_MASK			BIT(0)
>   #define REG_DIG_RSTN_NORMAL			BIT(0)
> @@ -193,6 +213,7 @@
>   
>   enum phy_max_rate {
>   	MAX_1GHZ,
> +	MAX_1_5GHZ,
>   	MAX_2_5GHZ,
>   };
>   
> @@ -200,6 +221,7 @@ struct inno_video_phy_plat_data {
>   	const struct inno_mipi_dphy_timing *inno_mipi_dphy_timing_table;
>   	const unsigned int num_timings;
>   	enum phy_max_rate max_rate;
> +	unsigned int max_lanes;
>   };
>   
>   struct inno_dsidphy {
> @@ -258,6 +280,24 @@ struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1ghz[] = {
>   	{1000000000, 0x0, 0x09, 0x20, 0x09, 0x27},
>   };
>   
> +static const
> +struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1_5ghz[] = {
> +	{ 110, 0x02, 0x7f, 0x16, 0x02, 0x02},
> +	{ 150, 0x02, 0x7f, 0x16, 0x03, 0x02},
> +	{ 200, 0x02, 0x7f, 0x17, 0x04, 0x02},
> +	{ 250, 0x02, 0x7f, 0x17, 0x05, 0x04},
> +	{ 300, 0x02, 0x7f, 0x18, 0x06, 0x04},
> +	{ 400, 0x03, 0x7e, 0x19, 0x07, 0x04},
> +	{ 500, 0x03, 0x7c, 0x1b, 0x07, 0x08},
> +	{ 600, 0x03, 0x70, 0x1d, 0x08, 0x10},
> +	{ 700, 0x05, 0x40, 0x1e, 0x08, 0x30},
> +	{ 800, 0x05, 0x02, 0x1f, 0x09, 0x30},
> +	{1000, 0x05, 0x08, 0x20, 0x09, 0x30},
> +	{1200, 0x06, 0x03, 0x32, 0x14, 0x0f},
> +	{1400, 0x09, 0x03, 0x32, 0x14, 0x0f},
> +	{1500, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
> +};
> +
>   static const
>   struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_2_5ghz[] = {
>   	{ 110000000, 0x02, 0x7f, 0x16, 0x02, 0x02},
> @@ -372,6 +412,7 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
>   	u32 hs_exit, clk_post, clk_pre, wakeup, lpx, ta_go, ta_sure, ta_wait;
>   	u32 hs_prepare, hs_trail, hs_zero, clk_lane_hs_zero, data_lane_hs_zero;
>   	unsigned int i;
> +	u32 val;
>   
>   	timings = inno->pdata->inno_mipi_dphy_timing_table;
>   
> @@ -393,6 +434,23 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
>   		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x0b,
>   				CLOCK_LANE_VOD_RANGE_SET_MASK,
>   				CLOCK_LANE_VOD_RANGE_SET(VOD_MAX_RANGE));
> +	} else if (inno->pdata->max_rate == MAX_1_5GHZ) {
> +		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x18,
> +				LANE0_PRE_EMPHASIS_ENABLE_MASK, LANE0_PRE_EMPHASIS_ENABLE);
> +		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x18,
> +				LANE1_PRE_EMPHASIS_ENABLE_MASK, LANE1_PRE_EMPHASIS_ENABLE);
> +		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x19,
> +				PRE_EMPHASIS_RANGE_SET_MASK,
> +				PRE_EMPHASIS_RANGE_SET(PRE_EMPHASIS_MID_RANGE));
> +		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x1a,
> +				LANE0_PRE_EMPHASIS_RANGE_SET_MASK,
> +				LANE0_PRE_EMPHASIS_RANGE_SET(PRE_EMPHASIS_MID_RANGE));
> +		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x1b,
> +				LANE1_PRE_EMPHASIS_RANGE_SET_MASK,
> +				LANE1_PRE_EMPHASIS_RANGE_SET(PRE_EMPHASIS_MID_RANGE));
> +		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x0b,
> +				CLOCK_LANE_VOD_RANGE_SET_MASK,
> +				CLOCK_LANE_VOD_RANGE_SET(VOD_MAX_RANGE));
>   	}
>   	/* Enable PLL and LDO */
>   	phy_update_bits(inno, REGISTER_PART_ANALOG, 0x01,
> @@ -518,10 +576,25 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
>   				T_TA_WAIT_CNT(ta_wait));
>   	}
>   
> -	/* Enable all lanes on analog part */
> +	/* Enable lanes on analog part */
> +	switch (inno->pdata->max_lanes) {
> +	case 1:
> +		val =  LANE_EN_0;
> +		break;
> +	case 2:
> +		val =  LANE_EN_0 | LANE_EN_1;
> +		break;
> +	case 3:
> +		val = LANE_EN_0 | LANE_EN_1 | LANE_EN_2;
> +		break;
> +	case 4:
> +	default:
> +		val = LANE_EN_0 | LANE_EN_1 | LANE_EN_2 | LANE_EN_3;
> +		break;
> +	}
> +
>   	phy_update_bits(inno, REGISTER_PART_ANALOG, 0x00,
> -			LANE_EN_MASK, LANE_EN_CK | LANE_EN_3 | LANE_EN_2 |
> -			LANE_EN_1 | LANE_EN_0);
> +			LANE_EN_MASK, LANE_EN_CK | val);
>   }
>   
>   static void inno_dsidphy_lvds_mode_enable(struct inno_dsidphy *inno)
> @@ -680,12 +753,21 @@ static const struct inno_video_phy_plat_data max_1ghz_video_phy_plat_data = {
>   	.inno_mipi_dphy_timing_table = inno_mipi_dphy_timing_table_max_1ghz,
>   	.num_timings = ARRAY_SIZE(inno_mipi_dphy_timing_table_max_1ghz),
>   	.max_rate = MAX_1GHZ,
> +	.max_lanes = 4,
> +};
> +
> +static const struct inno_video_phy_plat_data max_1_5ghz_video_phy_plat_data = {
> +	.inno_mipi_dphy_timing_table = inno_mipi_dphy_timing_table_max_1_5ghz,
> +	.num_timings = ARRAY_SIZE(inno_mipi_dphy_timing_table_max_1_5ghz),
> +	.max_rate = MAX_1_5GHZ,
> +	.max_lanes = 2,
>   };
>   
>   static const struct inno_video_phy_plat_data max_2_5ghz_video_phy_plat_data = {
>   	.inno_mipi_dphy_timing_table = inno_mipi_dphy_timing_table_max_2_5ghz,
>   	.num_timings = ARRAY_SIZE(inno_mipi_dphy_timing_table_max_2_5ghz),
>   	.max_rate = MAX_2_5GHZ,
> +	.max_lanes = 4,
>   };
>   
>   static int inno_dsidphy_probe(struct platform_device *pdev)
> @@ -767,6 +849,9 @@ static const struct of_device_id inno_dsidphy_of_match[] = {
>   	}, {
>   		.compatible = "rockchip,rk3368-dsi-dphy",
>   		.data = &max_1ghz_video_phy_plat_data,
> +	}, {
> +		.compatible = "rockchip,rk3506-dsi-dphy",
> +		.data = &max_1_5ghz_video_phy_plat_data,
>   	}, {
>   		.compatible = "rockchip,rk3568-dsi-dphy",
>   		.data = &max_2_5ghz_video_phy_plat_data,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

