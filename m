Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47453C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kzJR8k++x/AUghqCXqQ6tGrTm69KLHS6yLDY8MNUo4=; b=dyh1mcrTxsYmGDxrcKZ9PT9M6u
	IjQRAOAigCN/HXxNXu/f1bFjSfainpL893xWtiWwiXnj4GcKXc/Q6x9qv0ka1uS1tXDFL+E+iZXEp
	XZ3yvgiPm/lsbp5Hu8+Q/uHfPwptQ4PKKZWw1/XQD0ulWQkbjQkxjMHuDnqhnI2Z91kfokOnsYwwM
	6ZW/qTc3TUFmSJoKsGfaUC1YEkWFgtujXouk6WokZqBqov2mwTTI7dejtjz6+Q/9DsmFQ1OvS/Bp9
	QlrZwr0NoDlZahoW9lN2JqkQYUsUiUIKJ20Hng5n2ANQTxkAR57xXHbTBCdIGT6Z5O+/FqAwCRWBt
	EK8X/2OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9FU2-00000007AMz-0jJ9;
	Wed, 23 Sep 2026 05:25:30 +0000
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9FTz-00000007AMe-3lwb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 05:25:29 +0000
Received: by mail-dl2-x10.google.com with SMTP id a92af1059eb24-142dd025d07so415545c88.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141127; x=1790745927; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kzJR8k++x/AUghqCXqQ6tGrTm69KLHS6yLDY8MNUo4=;
        b=W/H0n9jEK0SpFr23Uyuo/8wSRLe2NG3tHOuu6OtDLrI5QRnfX+pAMN3oDmRpZjauvQ
         qUqO65Kw4L3gK4fopA86+154pKFpuD4jXisM5oDNf8Yc8YFaEhjG+GpsQoPCAZ/qa+qv
         d6M1fEwev5UePySVtagd0k6x04zbtF80LXO9e2kXNbF5WOGfC9knQP1tXuo3VdF8JigP
         WLFtzz67EaK4j7KOah8S3bEncPm2OaN1Vwpy+HwyYBBSeRNwnS9sKMS4NNaPbvnghj8C
         i1m+afU5ioSt+ucKt4q3GmS2d7TW2Uw5XCHiqRHNJ5yFldB9eY+vppd5neOleKaY5Awm
         wFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141127; x=1790745927;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kzJR8k++x/AUghqCXqQ6tGrTm69KLHS6yLDY8MNUo4=;
        b=nccayzAn9IWuN3RSlIBe6KSbDHxbyW38c8PiQTWJNdk3IQjF2WwlYueNT1tt8bRHet
         evl6qRfNsKVdXx8M47kvIqRIOBUGpTsS1hBgQR0gibkgV1iU+ZGtyd1+yndZRQ8VVuF8
         JBCh3oP9J+1BJJnFEDXSWV5NGcjywLd/AbW1u8CQwdkF+7gL6ZjVdoGEXIITD28FgFaa
         dMaucd8TS5L9aWHPf31ytlJvhNhZQmS0C7ja1JMjlfj3N3Hk1b0HDmi/dm/uV8zyimaV
         Bb/CLAfSWn2FdIjAacPXh2ixEw4aIo0z+PUxmfuBsevMWOUuprK33ovExr8pBhuIJbS/
         oJGw==
X-Forwarded-Encrypted: i=1; AKwUvBxUjlz3dPujatWgnlbVbaVBy1d9VmXchjjHp0RZTM9Z6kuwiM4Ujbu9hIvrOwhN5Znh/Nrqf120JTMfqa0SOjb3@lists.infradead.org
X-Gm-Message-State: AFuF++myU1lE/AjKhp8czovtG5AQlooCYqIOutkIrS4jKIt9y9tFBG3J
	dVIauEz5Cvd33gM+Ef45lrTBeo9BazWX2CCKVVk+T0iNc7Lm4mfgCG+z
X-Gm-Gg: AYBFou0qZGX6n7LDoaPMhr5f4/MBm7Cz2IhRuknskkll/A6uQjJVD0ynAyavUjDT1IW
	xSsFrL1nsT5ZkEizNTpfUCVi4U0C5+o9wHi1+1CJAHGztD4cY1ToqjHmv+o2PYi17y9VAvIrvT8
	Ya/jx3mEibbLL5TDPWs45sSZZNzbVEXS2ZnwCOx61fpJkjlU0dXbqt5ClGDk4I9HvsfzfcvfTWe
	gvR2D3UP0AUyYbHbnB+1WYEENI3D4FhFJthNTRc7AKHt8nKXz2U+wf9Uo2zuhpL/rLixZpu3pxE
	jnG4A28k4rGkwqLYDGOdFhvqBGThqs7UYj+oQU37CE7YYDQqGRuhI/Jbsf6W15NVWUvfDbmid4F
	lLqRtst/9yHyKkHXdzo8Gxf7YtpWKLgLW9c0rg7lETVaM15TXRp6RYY68jEEFoa9Y/9MJHpDMcA
	cFWXwb1Stj8PYLQdulXDGmoDuKF7ZmwRAtmR+RZWKelpTE4IIMxegWBizaODbT1Ek3w8p0cRJVA
	ECpLN17/xKfMowCc+E=
X-Received: by 2002:a05:7300:1c1e:b0:33b:c29a:7c3b with SMTP id 5a478bee46e88-33e8901a281mr1702352eec.0.1790141126681;
        Tue, 22 Sep 2026 22:25:26 -0700 (PDT)
Received: from [10.25.133.25] ([165.85.205.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3414262eec.26.2026.09.22.22.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:25:25 -0700 (PDT)
Message-ID: <6b1637d5-ce36-4702-a404-89ed6c65155f@gmail.com>
Date: Wed, 23 Sep 2026 13:25:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
To: joakim.zhang@cixtech.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-5-joakim.zhang@cixtech.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260922112134.4167305-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_222528_052945_3CF065A0 
X-CRM114-Status: GOOD (  21.24  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> +static int cdns_i2s_mc_clks_enable(struct cdns_i2s_mc_priv *i2s_mc_priv)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(i2s_mc_priv->clk_hst);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(i2s_mc_priv->clk_i2s);
> +	if (ret)
> +		clk_disable_unprepare(i2s_mc_priv->clk_hst);
> +
> +	return ret;
> +}
> +
> +static void cdns_i2s_mc_clks_disable(struct cdns_i2s_mc_priv *i2s_mc_priv)
> +{
> +	clk_disable_unprepare(i2s_mc_priv->clk_hst);
> +	clk_disable_unprepare(i2s_mc_priv->clk_i2s);
> +}
> +

It's better disable the clocks in reverse order of enablement。

> +static void cdns_i2s_mc_adjust_pin_config(u8 *pin_mask, u32 slots)
> +{
> +	u8 mask = 0, num = 0;
> +	int i;
> +
> +	/*
> +	 * Wired-out pins may sit at any index among the 8 data pins, so
> +	 * scan the whole mask and keep the lowest pins until enough slots
> +	 * are covered.
> +	 */
> +	for (i = 0; i < BITS_PER_BYTE; i++) {
> +		if (*pin_mask & (0x1 << i)) {
> +			mask |= (0x1 << i);
> +			if (++num == slots / 2) {
> +				*pin_mask = mask;
> +				break;
> +			}
> +		}
> +	}
> +}
> +
> +static void cdns_i2s_mc_tx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on)
> +{
> +	u32 irq_mask = 0, clk_mask = 0, i2s_mask = 0;
> +
> +	irq_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_MASK,
> +			       i2s_mc_priv->pin_tx_mask_adjust);
> +
> +	clk_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_STROBE,
> +			       i2s_mc_priv->pin_tx_mask_adjust) |
> +		    I2S_CID_CTRL_STROBE_TS;
> +
> +	i2s_mask |= FIELD_PREP(I2S_CTRL_I2S_EN, i2s_mc_priv->pin_tx_mask_adjust);
> +
> +	if (on) {
> +		/* Transmitter data underrun interrupt unmask */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, irq_mask);
> +
> +		/* Transmitter clock enable */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, 0);
> +
> +		/*
> +		 * Transmitter enable
> +		 * Transmitter synchronizing unit out of reset
> +		 */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   i2s_mask | I2S_CTRL_TSYNC_RST,
> +				   i2s_mask | I2S_CTRL_TSYNC_RST);
> +	} else {
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   i2s_mask | I2S_CTRL_TSYNC_RST, 0);
> +
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, clk_mask);
> +
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, 0);
> +	}
> +}
> +
> +static void cdns_i2s_mc_rx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on)
> +{
> +	u32 irq_mask = 0, clk_mask = 0, i2s_mask = 0;
> +
> +	irq_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_MASK,
> +			       i2s_mc_priv->pin_rx_mask_adjust);
> +
> +	clk_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_STROBE,
> +			       i2s_mc_priv->pin_rx_mask_adjust) |
> +		    I2S_CID_CTRL_STROBE_RS;
> +
> +	i2s_mask |= FIELD_PREP(I2S_CTRL_I2S_EN, i2s_mc_priv->pin_rx_mask_adjust);
> +
> +	if (on) {
> +		/* Receiver data overrun interrupt unmask */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, irq_mask);
> +
> +		/* Receiver clock enable */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, 0);
> +
> +		/*
> +		 * Receiver enable
> +		 * Receiver synchronizing unit out of reset
> +		 */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   i2s_mask | I2S_CTRL_RSYNC_RST,
> +				   i2s_mask | I2S_CTRL_RSYNC_RST);
> +	} else {
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   i2s_mask | I2S_CTRL_RSYNC_RST, 0);
> +
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, clk_mask);
> +
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, 0);
> +	}
> +}
> +

The TX and RX configuration look similar. Perhaps they be factored out
into a helper to reduce duplication?

> +static int cdns_i2s_mc_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *cpu_dai)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv = snd_soc_dai_get_drvdata(cpu_dai);
> +	struct device *dev = i2s_mc_priv->dev;
> +	u32 rate, sample_rate = 0;
> +	u32 slots, slot_width, resolution, ctrl;
> +	unsigned long i2s_clk_rate;
> +	u8 pin_tx_num, pin_rx_num;
> +	struct clk *clk_parent;
> +	bool is_master_mode;
> +	int ret;
> +
> +	rate = params_rate(params);
> +	slot_width = i2s_mc_priv->devtype_data->data_width;

Is the slot width fixed by the hardware? If it is configurable, it might
be better to obtain it through .set_tdm_slot().

> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		is_master_mode = ctrl & I2S_CTRL_T_MS;
> +	else
> +		is_master_mode = ctrl & I2S_CTRL_R_MS;
> +

The master mode is already known in .set_fmt(). It might be cleaner to
store the master state in the private data and use it here. This would
avoid an unnecessary register read.
> +static const struct snd_soc_dai_ops cdns_i2s_mc_dai_ops = {
> +	.probe = cdns_i2s_mc_dai_probe,
> +	.set_fmt = cdns_i2s_mc_set_fmt,
> +
> +	.hw_params = cdns_i2s_mc_hw_params,
Nit: Remove blank line here.

Regards,
Chancel Liu


