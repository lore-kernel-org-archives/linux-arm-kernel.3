Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FB2CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WA4cfENfPEbrDvuT53Cr6d7+lPDcZpBsXedFYV5NI20=; b=ue+fP67BApq5YwDdnMk7WRK3ni
	RX53NfVM7sP15BPtqRDoMGX5x/sPMFem9ZvJzPvdaUIjSNDxgJn8RDFP/MZ8Pk8pGf1nh0GbL1Sy/
	Ajngzuz71J1laqMhFSlbBl83hMKnVrOgQWoDMhIQBCFO0wBnX2EHP5VhSw+bKyaW53xbSJjNpAFpd
	qgTNOuBOTvXzC7ZA2ZPC6FjeD8qN9EvT8Be+dyVPKki0oNYcbBEr0O8x/2aDMYvhmA3XQTweeol/m
	38wm8PWJeyoHV011lV2ieeBLZYyry9S4I/WuZwYeBJOqiWZMfqR08zHh3Mtb9kWdfsYdYWC6KmFd6
	i4qxLXrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDO8c-0000000Ez87-0kKT;
	Sun, 04 Oct 2026 15:28:30 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDO8Y-0000000Ez70-4B77
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 15:28:28 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so15287855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791127704; x=1791732504; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WA4cfENfPEbrDvuT53Cr6d7+lPDcZpBsXedFYV5NI20=;
        b=b03t48xMgTeFbzNfi1xgiA/kNQTzLvylNdfZKbYkia1+/HWc+BmstOuEm8x/NkSs9Z
         B53m6bJqIumi6aBtUcfGAeXf1iiHyPp0D4F3NPqUCGT/9OtCmvIFxVLB0+eJv0dEOh2H
         frIeYBNMrxE9vlz0kfdkqktNU2jsCXwcBLCQwKHEQHsiR6IVp4TuK7Bi6bhsmYqOb1Fi
         jC0lxebVXd3ieMY0Qp5rnCre/ht5hirUGcIYyQSWmLIBX3sb2HMJbCdpKyHKGnVb+/8L
         sV3d7il8nBJQp0zoqPVB6gTWpEUQA8yOspaWhsJ/FGtVnqIyUPrZTxh/Gf1kKRJlCblq
         E7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127704; x=1791732504;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WA4cfENfPEbrDvuT53Cr6d7+lPDcZpBsXedFYV5NI20=;
        b=Un6YHkrUSMkHTpjR4VORN/Fu3c8GCOhMJ09Sdl9I3DX5dQQqHM2dRE/hi13qSKEqbM
         8ctYfn53k5MsFFqKyjG82fWBbcdMvD2FyHiMxKJ4wpizFsPSlZ5dZMf4XuNsSl0w/Lwb
         957UYm+OXiBBO0x3+5woiAf9W/638pu5n7WqhQNCLO2Fh4NFzcX9fl61xk94pRviio/9
         +DFG7ZCZDG+kXdlx+GjEjg8l0IIMt24FqCUAXPHfQeX6MOoO4JyurM4k4f3gE40hHPrQ
         94CjXExCp/GnSam06jboDWnEs/YQaEv5t9NY9fqH9tVfAplI8LMabODBcsShqX4JulA5
         xM0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzM7KbJQi6fd1CqRT4Qk9SIdHnhuNgi58HyPCg2QmlA69Akkc8Tj9CenBQvbQA+ynJtfX/YRjWOnFP+QuCSPMYh@lists.infradead.org
X-Gm-Message-State: AFuF++nLeZn/v2IJzX0RBUk8oFq6+jlKEHoV+6bNa6lIFfP3YY5eYtgf
	UM7HfiwjpD1ajwpLVXUlcFq/Wwre+9YqiIgTNt7n8teaqn9h2Alt5twtdhGdTtrdlm4=
X-Gm-Gg: AYBFou1bn2eJwbTZ8+1zqhYtOoZyQhT5mgoJr4kP7zFAhLabrOOZSGanvZMLxyGiiGQ
	q5R1KvLbdndZ8fxds00R2WvmR4XXQTUP04+d0rqpXPb9wHaxbAyIUujUgDKnljQLh6TWFQs2eCp
	9Qv+xGPwboIvrDUtB5utLU/0tMfxUkwLLCz9jdzKJtPOP2w9DM9YAQ4fVZFrmXc/KkzGxSsAnKC
	J+W+78gHJjGVgRZ/soGn4yM9Mnii1Plk6Q0DH/XstE7eds/LIRGqZkDnuNziOA0RRiJC+24rMtt
	sCC3uoW7/Lzcq1MavgBiJ7i9OZVeHI5qzN8HUxHH0WBpjjzSD3LR9SZ/U2Yx4EMeYRc5wG8I2yV
	Rli8oaOoM1SBPHRqWkUNxdrSGSzomStnYmX/daLtanRlvWmZg7lBWS4OOisReRfI+LsZBHIDRGL
	GHXkOR98ZCOrW7uTxcc7quVTI3h2o/Ch1cIGh6jBnEoPvIl5pWBueQK2pnq0rMj25I+gVvXOyib
	VkE0R3A
X-Received: by 2002:a05:600c:4e13:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a02757999cmr135331735e9.16.1791127704520;
        Sun, 04 Oct 2026 08:28:24 -0700 (PDT)
Received: from [172.20.10.3] ([37.169.53.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d1e38sm220380705e9.13.2026.10.04.08.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:28:23 -0700 (PDT)
Message-ID: <162c3908-cbf9-4bf2-8594-8592d5e4c3e5@linaro.org>
Date: Sun, 4 Oct 2026 17:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 3/6] net: stmmac: dwmac-meson8b: add support for the
 Amlogic T7
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261004144046.391444-1-tanure@linux.com>
 <20261004144046.391444-4-tanure@linux.com>
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
In-Reply-To: <20261004144046.391444-4-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_082827_089650_AFB12DE2 
X-CRM114-Status: GOOD (  23.34  )
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

On 10/4/26 16:40, Lucas Tanure wrote:
> The glue registers on the T7 are laid out exactly as the G12A ones, RX
> delay field included, so the T7 can reuse the G12A settings.
> 
> What the T7 does not share is how the controller reaches DRAM: the bus
> path goes through a pipeline stage with a gate of its own, and no device
> other than the controller has any use for that gate. Claim it and hold
> it enabled for as long as the controller is bound, otherwise it is
> switched off as unused and a transfer that has been started can never
> complete.
> 
> Give the T7 match data of its own so that only it looks the clock up,
> and require the clock instead of treating it as optional: the controller
> cannot do DMA without it, and failing the probe with a clear message
> beats booting and hitting an undiagnosable hang later.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> index e4d5c41294f4..450f7b4b29a6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> @@ -81,6 +81,7 @@ struct meson8b_dwmac;
>   struct meson8b_dwmac_data {
>   	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
>   	bool has_prg_eth1_rgmii_rx_delay;
> +	bool has_pipeline_clk;
>   };
>   
>   struct meson8b_dwmac {
> @@ -384,6 +385,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>   	struct plat_stmmacenet_data *plat_dat;
>   	struct stmmac_resources stmmac_res;
>   	struct meson8b_dwmac *dwmac;
> +	struct clk *pipeline_clk;
>   	int ret;
>   
>   	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> @@ -443,6 +445,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>   	if (IS_ERR(dwmac->timing_adj_clk))
>   		return PTR_ERR(dwmac->timing_adj_clk);
>   
> +	if (dwmac->data->has_pipeline_clk) {
> +		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
> +		if (IS_ERR(pipeline_clk))
> +			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
> +					     "missing pipeline clock\n");
> +	}
> +
>   	ret = meson8b_init_rgmii_delays(dwmac);
>   	if (ret)
>   		return ret;
> @@ -479,6 +488,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
>   	.has_prg_eth1_rgmii_rx_delay = true,
>   };
>   
> +static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
> +	.set_phy_mode = meson_axg_set_phy_mode,
> +	.has_prg_eth1_rgmii_rx_delay = true,
> +	.has_pipeline_clk = true,
> +};
> +
>   static const struct of_device_id meson8b_dwmac_match[] = {
>   	{
>   		.compatible = "amlogic,meson8b-dwmac",
> @@ -500,6 +515,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
>   		.compatible = "amlogic,meson-g12a-dwmac",
>   		.data = &meson_g12a_dwmac_data,
>   	},
> +	{
> +		.compatible = "amlogic,t7-dwmac",
> +		.data = &meson_t7_dwmac_data,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

