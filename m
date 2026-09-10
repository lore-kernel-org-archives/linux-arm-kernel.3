Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC8FC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 07:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udAblsmxBxBfrNPUP96gC45YbWeS/a2NvUFAIRjIBU8=; b=d/0AMD9A4d5VHc2fzu2qmzdoWV
	9aE3hPVMlCa0XPO8k3WJZpB8LNGDTJQ44W+6qcA6rVItTTcSqKxm6kN3GHapmypa8Mvj2Ne/T7BTB
	jPfw81hUTq0FSI9IBUbJTgcbVVrCLE1Ijx0KD77Ja/4VcuT03TvR8rjzounutsIL0PXTOzXalTcMD
	uu8T4BgCifz4cO2mqn84Gyfd8vYl/pc9tTcPfolnnqawDrGoPKdUaEhj28CdkM4nlYkPKknz0hf3j
	CLgEtQlark9u3OeQ1FVxnwIorSmLD44EeNOmTRwe3LWuXYEL9qzni9xk3NVSVM3nmafFPfa72xU8f
	A8ZkmXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YyD-0000000Db42-1riX;
	Thu, 10 Sep 2026 07:13:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YyA-0000000Db2p-3kZW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 07:13:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so46902825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 00:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789024392; x=1789629192; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=udAblsmxBxBfrNPUP96gC45YbWeS/a2NvUFAIRjIBU8=;
        b=fmxbNp9CgyJUG+GCqhqcb33YsthWrf6kntqLsPEus5dmdBvHmwsjKLRWqneVVIl+SK
         VNokUKJ6f82jKC7D4ByY4JlQZEGslDdd64XrHp9WwGo9oalmItFXT3VBYJtFZ7FoH6BF
         31MBEye+Fa0+oqVJdsULDEdn+4jtiQ4W2yzv16bQWwCGEXpWWpSX5FfMOqp152X+9uC9
         Fk1u2HV4xpEoZa45pZVZjZ2qQMzMJxEE9Q1MCKNQzZV3+MooY3oqzd+Zwgp3AyFwhsxL
         +6jQgqxwWK9xjl6lzbnvjsLtSIFgr2g+4ekGZRu2tMt2BAr0V05JNZADOX17fRfKuKbt
         A2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024392; x=1789629192;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=udAblsmxBxBfrNPUP96gC45YbWeS/a2NvUFAIRjIBU8=;
        b=bLWapPAHkjPvK1F9o7S3FLIMGdOmVA6RAAenUrtbEeTmdn9KQ8SfaQ7io1vMV9+2Ek
         OoPGDgBcC3t/FyIAsgu0aexWtQ2S1XG0Ur5xGKAO6Cmlyx2lr6q9nIsTfOhX3Bzjf2OK
         dYxaDmNAUmIYAgjsGUagXZor1/XlGrrXWhgAB5yOKUIYFGH25kOf7vASZau33Q2rmCxO
         g0oblNsskr0jz11jVOVlfKO1Kqflg4CXzzergfIBVkt5bsuZiB9rzR5xdF2l/3g1tMEV
         UicqxFrfHjvRBVAKd/+kzozBVDW9J/pXRZ6h5k0HJwlM5kXn+BTBAlkyn0lOTlEjVtya
         OGzA==
X-Forwarded-Encrypted: i=1; AKwUvBw0DUqOrjRUAwIlxLvmMmztFGInT45qd8V1Y8vKYxekg2Jhhhlw8SIzzewwIiBcYMmj8f2b5xEtoKLJIDkNNA0Z@lists.infradead.org
X-Gm-Message-State: AFuF++nJ4rsRFMijAgOx6f+cDLvggnYwYD5Zq5p2jsnKyGRGtHNqJalD
	G2WgcdcPkqb1nhY5EL4w9xOX1QgCkARVkxvvVuW+KMppg15pmxdOtchKwQmoJueu4Sw=
X-Gm-Gg: AYBFou2AHJd8/5XGiiZeeRWsj19lPyhAVBksMwsssb7fY1MP1pz6OlbQjzR1baUjqmZ
	nfEvS9uqf9pVH8Td2MSTnKOqm5pAdu55BA4q7sOrUr1f8su2fgR/aOo8P8XCeQpPvak2wYibXyv
	e5/HURfTe5+M0YgZ28tArCsFK3u86Zg3ClMfrultY+2FWscCJlKFhQR9uD3/imFfZlHlBU5BHPE
	xPKgoy65N80TLCmZytnGayl5j8hRE393tPCuiCUGvImW/SORjw9CsQr1JapuNN/ymrK0nQOEZOF
	jAyBhJa5ZAW81Kx5YPaEPr8+PgS96x7nDPiBvffmh3vfekLLzBeMqtEjA8YE4Mxbhf6pH1Q0EhU
	7uQQjrs+D/hD8WuMWDuLNHpQuCdxCrWAI+VCbdD4y08hl9GqgM9wRGNWcODhzrhy5Yf/hjmAzyx
	OFO/Z3kuj2ly74Q2sV6P5ZkFIOynQ6Jmw53BFYwofHJ+bApc3xCb2rcJqAryAzdx/h0DqiMoWwp
	zY+HxrW1wrIKZs8BX0H18jdDzXTOl8Ty+ZZETEjR7qdGpKJ7RSMjg==
X-Received: by 2002:a05:600c:4e4c:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49cf8206e4dmr412212555e9.3.1789024392371;
        Thu, 10 Sep 2026 00:13:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm49914055e9.6.2026.09.10.00.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:13:09 -0700 (PDT)
Message-ID: <cc06ba9b-c866-4c43-a7d4-e25188b84f22@linaro.org>
Date: Thu, 10 Sep 2026 09:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] mmc: meson-gx: enable the bus pipeline clock on T7
To: Lucas Tanure <tanure@linux.com>, Ulf Hansson <ulfh@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-3-tanure@linux.com>
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
In-Reply-To: <20260905153234.133217-3-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_001314_970617_EF9456A0 
X-CRM114-Status: GOOD (  23.40  )
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

On 9/5/26 17:32, Lucas Tanure wrote:
> On the T7 SoC, the bus path between the SD/eMMC controllers and the
> NIC_MATRIX fabric goes through a pipeline stage inserted by the hardware
> design to help timing closure. The stage has its own gate clock and,
> when that clock is disabled, a controller that starts a DMA transfer can
> never complete it, hanging the storage devices and, from there, the
> whole system.
> 
> Add a dedicated match data for the amlogic,t7-mmc compatible that makes
> the driver claim and enable the "pipeline" clock for as long as the
> device is bound.
> 
> The clock is deliberately not optional: the hardware cannot do DMA
> without it, and failing the probe with a clear error is preferable to
> booting and hitting an undiagnosable DMA hang later.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   drivers/mmc/host/meson-gx-mmc.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 694bb443d5f3..c0f1e929fc13 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -139,6 +139,7 @@ struct meson_mmc_data {
>   	unsigned int always_on;
>   	unsigned int adjust;
>   	unsigned int irq_sdio_sleep;
> +	bool has_pipeline_clk;
>   };
>   
>   struct sd_emmc_desc {
> @@ -1204,6 +1205,15 @@ static int meson_mmc_probe(struct platform_device *pdev)
>   	if (IS_ERR(core_clk))
>   		return PTR_ERR(core_clk);
>   
> +	if (host->data->has_pipeline_clk) {
> +		struct clk *pipe_clk;
> +
> +		pipe_clk = devm_clk_get_enabled(&pdev->dev, "pipeline");
> +		if (IS_ERR(pipe_clk))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(pipe_clk),
> +					     "missing pipeline clock\n");
> +	}
> +
>   	ret = meson_mmc_clk_init(host);
>   	if (ret)
>   		return ret;
> @@ -1322,12 +1332,22 @@ static const struct meson_mmc_data meson_axg_data = {
>   	.irq_sdio_sleep	= CLK_V3_IRQ_SDIO_SLEEP,
>   };
>   
> +static const struct meson_mmc_data meson_t7_data = {
> +	.tx_delay_mask	= CLK_V3_TX_DELAY_MASK,
> +	.rx_delay_mask	= CLK_V3_RX_DELAY_MASK,
> +	.always_on	= CLK_V3_ALWAYS_ON,
> +	.adjust		= SD_EMMC_V3_ADJUST,
> +	.irq_sdio_sleep	= CLK_V3_IRQ_SDIO_SLEEP,
> +	.has_pipeline_clk = true,
> +};
> +
>   static const struct of_device_id meson_mmc_of_match[] = {
>   	{ .compatible = "amlogic,meson-gx-mmc",		.data = &meson_gx_data },
>   	{ .compatible = "amlogic,meson-gxbb-mmc", 	.data = &meson_gx_data },
>   	{ .compatible = "amlogic,meson-gxl-mmc",	.data = &meson_gx_data },
>   	{ .compatible = "amlogic,meson-gxm-mmc",	.data = &meson_gx_data },
>   	{ .compatible = "amlogic,meson-axg-mmc",	.data = &meson_axg_data },
> +	{ .compatible = "amlogic,t7-mmc",		.data = &meson_t7_data },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, meson_mmc_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

