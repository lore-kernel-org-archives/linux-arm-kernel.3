Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB27AC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoJfn+WfhcCob3lYkX4rLFC4vL/JU+QDHeEHm6Z8Pus=; b=TsnfM7HtYe+z2e1W0l/xHJRI31
	Ysnmk4dxJseIbyEWhDjsHuxZBingijMYQPqcSNIq2YgPLv1v4FlVwuU7e9wJYv0C0H46Y4h72V4HF
	n38v50PN2CCaK85lGtf4WMRpvBkGhnHWIPAXEHgBN3kDLhzoGilVvSb5UI2sgUrH2/0X3nhvqeXUH
	AVz5qgxaat/m6/co9qomhabRA5tv1lPSWGOVEdNGH5SHMawpNSsKBL1J/yIuJv3tie4rV7Mn4HZcD
	j/L5ECRUWKJ3tJ5dDlM9vJ/j17upE0GVHeA34Ou23xN+SuEeMklCUSzml5UkFlUi4U7CdxaVpufD3
	U+JNsfWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HEg-00000001aFF-2FAV;
	Mon, 14 Apr 2025 10:40:18 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Gwa-00000001UkW-1I5X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 10:21:37 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso2489190f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 03:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744626094; x=1745230894; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoJfn+WfhcCob3lYkX4rLFC4vL/JU+QDHeEHm6Z8Pus=;
        b=aUmIo3lZm+uaBmqTWxSBK/hgqJJnfvUZpFB1/kTkM/Ru7ak52rRK1cPKECkXESJ7x1
         4+6SuFdtSqjfwmLhSVQE9T8CThQcSe8lM17elOABJLen64MrK6lTL3/0Bie4bH7hsHXy
         By++2WaUczbMul7Wn+qQG4q5t9edy3ZBCLnymq4yJYEDuXid/eHrakF5alWVNdq+7ZoH
         iq21wyciiW4ueCP3bnfUgBfcCA7GniMNbFRdp4vJkpC2D0Ta4ZZ/gGL8cPYQjEThalPd
         /4N0fYqxqH7LHhcVuf+bkqvMig938BqR/0PwfZ9ptpj25umBOgoxNHf2Uodm14Fc7F3k
         5ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744626094; x=1745230894;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yoJfn+WfhcCob3lYkX4rLFC4vL/JU+QDHeEHm6Z8Pus=;
        b=JZP5Dv7RF79KINC/2euD7zfv8BJn1/mfH9HrSTpIBA+DDQPEK3q2xNqyeajC2Pliae
         3i0P583coIvAI4h/kBTVN2jT/x6CD0i6Nn5HalvAioR/ZiMG0gdN14Ln5Ups43E3IHzV
         bpBlH34fV84v1r6lCMG4rVYmtEIFaS0RH1QHOSrX6VnJYk/1NvUsIp4I/O3uF8Ag94Fb
         lR9Ak2ioD9lnAZJhAcPmIzIQr3mANiKs7GLS3e1XN/0eMAIZlvA6x8OQlYoc1b+pBlfU
         y9eLfu/TNSUjAamXwB9wYWzFCkGm/U9yoB8F0KE/ffPo0CwwxDsqPAVxJ9DhOsZdKG2F
         lUHA==
X-Gm-Message-State: AOJu0Yzhm51Sq/uq22HW2PTvizdMBRE7hBEM8tEM1xPalQjZYTFKYUzW
	w9xdYKOZbMf3Rd2hnZnrtkj7SwKY/00ZUzUcs/gpy7TbZYd3Udnj73kjaoB6lIQ=
X-Gm-Gg: ASbGncsIU3dROPw5VnSEwVMPcPcLKP9OmYjBmg/AqMMIp1darox5ZFk0APAPwJsJNpq
	rYLHb5TUTaiBkPdLNa18IZmsC30g9fdl6RFt8CKtINkGKpoT92F1DeV26RuUvaMv8gOjQajbbpB
	Z92Cv4sMow6nfB5P3kUE7abvC4PuFDmczPXaJ7ia2RznWEcxuC/EwDOdi9kn4KSILYpmEVddOjo
	2zvu7MmWJTb/pfvTl8lnfbV/JPlvr2WxFr127hN0YfGTD5RljRe/ZnURV3VAcbjuc+LruaJH8dt
	CA1MxThANh3NDtW2ALWfGHj6NDbhgsL06qOP+1KFvyqfaYgf0KQBtzXB+ZumD9QYkNlnQVypD84
	Pl+VafkadaT074URBhgBFJrFUWNH8
X-Google-Smtp-Source: AGHT+IGi7pe4joqsduvh0sVavfTwIAZtPwHu9vH2XybtTdHDqiTbqFeoh96FoPqaD/ghle7zKPCzbg==
X-Received: by 2002:a05:6000:1ace:b0:391:1218:d5f4 with SMTP id ffacd0b85a97d-39e7658b3aemr9537331f8f.23.1744626094457;
        Mon, 14 Apr 2025 03:21:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743? ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964048sm10618166f8f.2.2025.04.14.03.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:21:34 -0700 (PDT)
Message-ID: <608488e4-a744-4aef-af17-2bf19ea5b788@linaro.org>
Date: Mon, 14 Apr 2025 12:21:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/7] soc: amlogic: clk-measure: Define MSR_CLK's
 register offset separately
To: chuan.liu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
 <20250414-clk-measure-v2-1-65077690053a@amlogic.com>
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
In-Reply-To: <20250414-clk-measure-v2-1-65077690053a@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_032136_355577_D1D20055 
X-CRM114-Status: GOOD (  23.28  )
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

On 14/04/2025 12:12, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Since the MSR_CLK register offset differs between chip variants, we
> replace the macro-based definition with chip-specific assignments.
> 
> Change the max_register in regmap_config to be retrieved from DTS.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 54 ++++++++++++++++++++++++---------
>   1 file changed, 39 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 39638d6a593c..82c008ade894 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -14,11 +14,6 @@
>   
>   static DEFINE_MUTEX(measure_lock);
>   
> -#define MSR_CLK_DUTY		0x0
> -#define MSR_CLK_REG0		0x4
> -#define MSR_CLK_REG1		0x8
> -#define MSR_CLK_REG2		0xc
> -
>   #define MSR_DURATION		GENMASK(15, 0)
>   #define MSR_ENABLE		BIT(16)
>   #define MSR_CONT		BIT(17) /* continuous measurement */
> @@ -39,9 +34,17 @@ struct meson_msr_id {
>   	const char *name;
>   };
>   
> +struct msr_reg_offset {
> +	unsigned int duty_val;
> +	unsigned int freq_ctrl;
> +	unsigned int duty_ctrl;
> +	unsigned int freq_val;
> +};
> +
>   struct meson_msr_data {
>   	struct meson_msr_id *msr_table;
>   	unsigned int msr_count;
> +	struct msr_reg_offset *reg;

const truct msr_reg_offset *reg;

>   };
>   
>   struct meson_msr {
> @@ -495,6 +498,7 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   			    unsigned int duration)
>   {
>   	struct meson_msr *priv = clk_msr_id->priv;
> +	struct msr_reg_offset *reg = priv->data.reg;
>   	unsigned int val;
>   	int ret;
>   
> @@ -502,22 +506,22 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   	if (ret)
>   		return ret;
>   
> -	regmap_write(priv->regmap, MSR_CLK_REG0, 0);
> +	regmap_write(priv->regmap, reg->freq_ctrl, 0);
>   
>   	/* Set measurement duration */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_DURATION,
> +	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_DURATION,
>   			   FIELD_PREP(MSR_DURATION, duration - 1));
>   
>   	/* Set ID */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_CLK_SRC,
> +	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_CLK_SRC,
>   			   FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id));
>   
>   	/* Enable & Start */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0,
> +	regmap_update_bits(priv->regmap, reg->freq_ctrl,
>   			   MSR_RUN | MSR_ENABLE,
>   			   MSR_RUN | MSR_ENABLE);
>   
> -	ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
> +	ret = regmap_read_poll_timeout(priv->regmap, reg->freq_ctrl,
>   				       val, !(val & MSR_BUSY), 10, 10000);
>   	if (ret) {
>   		mutex_unlock(&measure_lock);
> @@ -525,10 +529,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   	}
>   
>   	/* Disable */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
> +	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_ENABLE, 0);
>   
>   	/* Get the value in multiple of gate time counts */
> -	regmap_read(priv->regmap, MSR_CLK_REG2, &val);
> +	regmap_read(priv->regmap, reg->freq_val, &val);
>   
>   	mutex_unlock(&measure_lock);
>   
> @@ -599,11 +603,10 @@ static int clk_msr_summary_show(struct seq_file *s, void *data)
>   }
>   DEFINE_SHOW_ATTRIBUTE(clk_msr_summary);
>   
> -static const struct regmap_config meson_clk_msr_regmap_config = {
> +static struct regmap_config meson_clk_msr_regmap_config = {
>   	.reg_bits = 32,
>   	.val_bits = 32,
>   	.reg_stride = 4,
> -	.max_register = MSR_CLK_REG2,
>   };
>   
>   static int meson_msr_probe(struct platform_device *pdev)
> @@ -611,6 +614,7 @@ static int meson_msr_probe(struct platform_device *pdev)
>   	const struct meson_msr_data *match_data;
>   	struct meson_msr *priv;
>   	struct dentry *root, *clks;
> +	struct resource *res;
>   	void __iomem *base;
>   	int i;
>   
> @@ -636,15 +640,23 @@ static int meson_msr_probe(struct platform_device *pdev)
>   	       match_data->msr_count * sizeof(struct meson_msr_id));
>   	priv->data.msr_count = match_data->msr_count;
>   
> -	base = devm_platform_ioremap_resource(pdev, 0);
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   
> +	meson_clk_msr_regmap_config.max_register = resource_size(res) - 4;
>   	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
>   					     &meson_clk_msr_regmap_config);
>   	if (IS_ERR(priv->regmap))
>   		return PTR_ERR(priv->regmap);
>   
> +	priv->data.reg = devm_kzalloc(&pdev->dev, sizeof(struct msr_reg_offset),
> +				      GFP_KERNEL);
> +	if (!priv->data.reg)
> +		return -ENOMEM;
> +
> +	memcpy(priv->data.reg, match_data->reg, sizeof(struct msr_reg_offset));
> +
>   	root = debugfs_create_dir("meson-clk-msr", NULL);
>   	clks = debugfs_create_dir("clks", root);
>   
> @@ -664,29 +676,41 @@ static int meson_msr_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +struct msr_reg_offset msr_reg_offset = {
> +	.duty_val = 0x0,
> +	.freq_ctrl = 0x4,
> +	.duty_ctrl = 0x8,
> +	.freq_val = 0xc,
> +};

This should be static const

> +
>   static const struct meson_msr_data clk_msr_gx_data = {
>   	.msr_table = (void *)clk_msr_gx,
>   	.msr_count = ARRAY_SIZE(clk_msr_gx),
> +	.reg = &msr_reg_offset,
>   };
>   
>   static const struct meson_msr_data clk_msr_m8_data = {
>   	.msr_table = (void *)clk_msr_m8,
>   	.msr_count = ARRAY_SIZE(clk_msr_m8),
> +	.reg = &msr_reg_offset,
>   };
>   
>   static const struct meson_msr_data clk_msr_axg_data = {
>   	.msr_table = (void *)clk_msr_axg,
>   	.msr_count = ARRAY_SIZE(clk_msr_axg),
> +	.reg = &msr_reg_offset,
>   };
>   
>   static const struct meson_msr_data clk_msr_g12a_data = {
>   	.msr_table = (void *)clk_msr_g12a,
>   	.msr_count = ARRAY_SIZE(clk_msr_g12a),
> +	.reg = &msr_reg_offset,
>   };
>   
>   static const struct meson_msr_data clk_msr_sm1_data = {
>   	.msr_table = (void *)clk_msr_sm1,
>   	.msr_count = ARRAY_SIZE(clk_msr_sm1),
> +	.reg = &msr_reg_offset,
>   };
>   
>   static const struct of_device_id meson_msr_match_table[] = {
> 

With this fixed:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

