Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC75CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgoL/vrS/xBAIKFF8vFxhe4JgJTENxBcmxfV/usIkY8=; b=oHN7PmBWNSbN272QXYAWe+cL3W
	TmJnqQXvV7uv6zCNcpNYLvhcvJrdRE0Yko6oCNDo5OlQI4WHp5IV6fd0X+R65aJoWmXKg+xtl76TW
	501hoOLsTGihXQjVC3DvK4h7J2tjHwf6ZyKsEpPiog40ac0D0t3EBVC8zy9vBFDmb05uw9XCm09A6
	SjOZ98AxiW5uafLnVl8euz2mB0R5VD7T/WwuRIzpRgwQ4pcf11Jjqri+A3OO7Hc56QTd9NTzvyF4m
	spLJFsHrS0pmKrOdlce2MNIceIdGfUY1dQoawHVxrF5kTMJHLyNW7jmK66z5erkpC4xaTpr24U0bI
	eh7DyUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENxm-000000023oL-3MwJ;
	Wed, 07 Oct 2026 09:29:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENxj-000000023mV-1svO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 09:29:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jbbR2481467
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Oct 2026 09:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AgoL/vrS/xBAIKFF8vFxhe4JgJTENxBcmxfV/usIkY8=; b=Ksb2JztIlZuGLagv
	nrNPDbkhal5x3PNf3UkjP/eCfnE4a3XDW1IbngTCcrzPlGmTZeSMWfr8UBJPQsSD
	HIzQ7rnhgnrpuuZzcYaSMYvy0aF2NRm/wwM7qVIm+Wgww18OTLmpK4HwTa1t4SJz
	Rpm+nYsyvHix4zXuhY+oPMHsiGVg7HRT723ZNrCN7U4YLbX/azWZWKONl3k7WtEX
	/jCA1/sygGBJh3rN7RjKWlspfFBspUfAH1MbAhHCD2jhWrQ/GQb2eRE3n8Rqs7CA
	GhrZ6iZMejmoIJwtnoK4q3Lb1AxiAF8YPwLtUdJIVh4ATR/T8byhpKOOuRm10dXv
	g0UHUw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u1fmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 09:29:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso2764069a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 02:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791365361; x=1791970161; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AgoL/vrS/xBAIKFF8vFxhe4JgJTENxBcmxfV/usIkY8=;
        b=hCJ130euMkp6NIVkUhtL0edWCDqYjkXvu8/PQcqUKd1ZhZy/HGpc5JUv/McvicKf3Z
         w8lpA8PjN0c6BYkzhdUGYsAYOXuXjFzKHjzt05zTTU6YfGgbQPLeL1maeGXSWE4rpATS
         8CsFJEKRWJ0TvEn2XeG+C0V66rWDLXwJcrf3W4IC5lSH2ooCKp3gRWOOXQmrivrvsqmz
         lc49B2VnwSEOMu9xOAO26sdWiyi3vDr4o+lsCkft6Cecka0bZ+O4ckGxrJ9FVZZqVCyb
         U4ETbX/iXQxpml7M9I0raf+90gg9q9jn6AqLGGs1B7gXgvO3jMNUjhSqLBLvYd4DCciT
         DsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365361; x=1791970161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgoL/vrS/xBAIKFF8vFxhe4JgJTENxBcmxfV/usIkY8=;
        b=tgawkbVdgnBHMD5c5I7QfTPksHLNOu/FirGPut2clDzdhYp2U+93uXSAhaDyjOqTQd
         7FtluGD4KO1PB786GhQpJV8p+hRCacoeHt3KN/zCa3Fa8SKKrGI0F0cFYncV/o9CCxJ/
         UQD0jfiGZFg74TreP9XRJ8NzRWsagSmjMTAT5jqOz359FZ5Sg0bRle8daA6lKJIzmqxP
         XBEj8mPkfFWdqKdAcdMHoulX6sXcmAqF9Ewc2bVyFAZZskfNp4LPSkVNvUQ/WhD4WvAX
         hMqWpCbCBYYMwH6MaAryEcGbMhC9T5qKIrs1UaW72wB9bPF/2Lw1k6lBIjBZnAr6ffHS
         bWIg==
X-Forwarded-Encrypted: i=1; AKwUvBwTDfqc/NKlLzzJBIBOvXAGiAcMUUa/Uh7Qp21QZOBSWxr1t/4Y7nqFvLunlL0Sqnskm7Edx/+u84yvw3P1PxRZ@lists.infradead.org
X-Gm-Message-State: AFq9FYKzLrVmjUqoZisiPC+nQz380ug05aJWZQTSjfAcHdGzxNqtnLH1
	qS6osMt5yjkuZUEw1ltekSRRtwLbaAMXGf6y+Wk3CoRV3wb2Nzyy1a1jsCRwGh6T+sBohBlHYEd
	vhR5HJwOY9J7oyLa1Tb0D/o+bYqxlKs4aYLFCpfjz60zBzcql8DuWngjpUfxdHidmV2todQQFUr
	iBJw==
X-Gm-Gg: AYBFou3chpCsuVmwh47lE2TNBd263U0BYI1ciZpgiswYYxKrjU/iSY+YX0DtIRFkFtU
	GlO69gQ5uW+XsG7sl28yaCrZeua7eaqc8bYBm/GuKkYbZ2BQhxo3aBK8WZu6gquoGftXcU6lwnr
	V+MwXXBpNoUli1AYwsvS6kCIC/Zwe+gvrU6ZrK3PgdScM0Xt/fZ99CMNdvFSWbeNCyqn7xYcgf8
	tEOO4EHOtdKjS4jBil8Q+oXQrhuAozm8ERY7oZSLEzte3rxD3dJnXSUtvd+Sf3BVFIQFb/d/kuz
	ENRiZ8Q9toDXaBfDD/wyzmnbD1QEaOSbWpBJyWcz1HrqiL/PA83ok+z6Y2HUe7VVIMfkxRnCZ1d
	9O86eXCAcrrE+qDrn1seOLiEzFMc=
X-Received: by 2002:a17:902:d54c:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2e60036c99cmr14983275ad.24.1791365361373;
        Wed, 07 Oct 2026 02:29:21 -0700 (PDT)
X-Received: by 2002:a17:902:d54c:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2e60036c99cmr14983115ad.24.1791365360897;
        Wed, 07 Oct 2026 02:29:20 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604720e81sm7335615ad.36.2026.10.07.02.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:29:20 -0700 (PDT)
Message-ID: <223555e8-f17c-4bd7-abe5-06d8f4406867@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 14:59:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: cdns: Add Cadence I2S-SC controller driver
To: joakim.zhang@cixtech.com, lgirdwood@gmail.com, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
 <20260928053613.2158446-3-joakim.zhang@cixtech.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260928053613.2158446-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfXzgxxLqOBtHXG
 YYkL0KRw01NZHAucvvz6C3P6SdWr9T1hMhGg/qdmEvXNibfL7EpfVxMPlcK34awez/gqRKmBoX8
 Dppv7yXZDZMGryg+yCXxaWh/c8lhj8o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfX2Uv+Xag6QMGt
 Wx84QoC229NV/p581jgW3RQtlrONYXY0eqo9LYVcXBAK0uUZzMHu9AXfFuH/K7UyscJZXjKcmrL
 /8NjmBS8EWM/Towk5gc3cET5BmbIZND9EeQiCHIMGpvmAmCFu4nuOPvoUIcxY5sLjM/BGeeTap2
 KgwFNMhddJCar6LzRNpAJNp+uFfEnfDRcvUM1G73KWhtaFWIiCUbdQ2E+zDcU6Bq5wZZF+FZnh0
 0mYQ/Y3nNCQMor70xfl5LaLv0CfScn9SATfW8VYG4STfGCqjr5QQ46pLT8xPZVa/0c0A8bQcnJD
 kpZFT87pV5MDNuC9QdI8nrThuRemLzZerH9X2GzEjlrI8Hs8yDsFKCOorbZ/h0rv0/pzSOxIaJo
 qPMvb3UaG+olEyWogiWgOAd+s4gBaBGM8LpIn072oSQc1BC88sNhT2TMQ1rCk18GxF+86pE/j9k
 QyK2bAEmkgfW1MZzUUA==
X-Proofpoint-ORIG-GUID: 8OcdKDe2n_3i1hkJ11DBuxUeHZGneOiA
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac610f2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=TAThrSAKAAAA:8 a=v9BIAvi8InMdnKEPHzMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-GUID: 8OcdKDe2n_3i1hkJ11DBuxUeHZGneOiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_022923_507373_7F7153A4 
X-CRM114-Status: GOOD (  23.73  )
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



On 9/28/2026 11:06 AM, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add support for the Cadence I2S-SC controller found in the CIX SKY1
> audio subsystem.
> 
> The controller provides full-duplex stereo playback and capture in
> standard I2S, left/right-justified and DSP modes, with mono operation
> mapped onto the left audio channel. It also supports TDM operation
> with up to 16 slots per frame, where the PCM channels map onto the
> active slots of the stream direction while the bit clock covers the
> whole frame.
> 
> The transmitter and receiver share the transceiver enable sequence,
> so the start/stop state machine is serialized with a spinlock against
> independently triggered playback and capture PCMs. The driver
> registers the dmaengine PCM helper, selects the audio reference clock
> parent for the 8 kHz or 11.025 kHz sample rate family and keeps the
> minimum functional-clock to bit-clock ratio required for safe clock
> domain crossing. Runtime and system suspend/resume restore the
> registers through the regcache.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---

> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <sound/dmaengine_pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +

> +static int cdns_i2s_sc_clks_enable(struct cdns_i2s_sc_priv *i2s_sc_priv)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(i2s_sc_priv->clk_hst);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(i2s_sc_priv->clk_i2s);
> +	if (ret)
> +		clk_disable_unprepare(i2s_sc_priv->clk_hst);
> +
> +	return ret;
> +}
> +
> +static void cdns_i2s_sc_clks_disable(struct cdns_i2s_sc_priv *i2s_sc_priv)
> +{
> +	clk_disable_unprepare(i2s_sc_priv->clk_i2s);
> +	clk_disable_unprepare(i2s_sc_priv->clk_hst);
> +}
> +
> +static void cdns_i2s_sc_rxtx_common_config(struct cdns_i2s_sc_priv *i2s_sc_priv, bool on)
> +{
> +	if (on) {
> +		/* Full-duplex mode enable */
> +		regmap_update_bits(i2s_sc_priv->regmap, I2S_CTRL_FDX,
> +				   I2S_CTRL_FDX_FULL_DUPLEX, I2S_CTRL_FDX_FULL_DUPLEX);
> +
> +		if (i2s_sc_priv->is_tdm_mode) {
> +			/* TDM mode enable */
> +			regmap_update_bits(i2s_sc_priv->regmap, I2S_TDM_CTRL,
> +					   I2S_TDM_CTRL_TDM_EN, I2S_TDM_CTRL_TDM_EN);
> +
> +			/* Number of supported audio channels in TDM mode */
> +			regmap_update_bits(i2s_sc_priv->regmap, I2S_TDM_CTRL,
> +					   I2S_TDM_CTRL_CHN_NO,
> +					   FIELD_PREP(I2S_TDM_CTRL_CHN_NO,
> +						      i2s_sc_priv->tdm_config.slots - 1));

This driver uses FIELD_PREP() in several register programming paths, but 
it does not include <linux/bitfield.h>. A local targeted build with

  M=sound/soc/cdns W=1 fails with:

  error: implicit declaration of function 'FIELD_PREP'

Please add the explicit bitfield.h include. After adding that include 
locally, cdns-i2s-sc.c gets past this compile error.

> +
> +			/* TDM mode channels enable */
> +			regmap_update_bits(i2s_sc_priv->regmap, I2S_TDM_CTRL, I2S_TDM_CTRL_CHN_EN,
> +					   FIELD_PREP(I2S_TDM_CTRL_CHN_EN,
> +						      i2s_sc_priv->tdm_config.rx_mask |
> +						      i2s_sc_priv->tdm_config.tx_mask));
> +		}

> +	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to register dmaengine component\n");
> +
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable runtime PM\n");
> +
> +	ret = cdns_i2s_sc_clks_enable(i2s_sc_priv);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
> +

After cdns_i2s_sc_clks_enable() succeeds, the platform_get_irq() failure 
path returns directly without disabling the clocks or dropping the 
runtime PM usage count. The devm_request_irq() failure path has a 
similar issue: it calls pm_runtime_put_noidle(), but that will not run 
the runtime suspend callback, so the clocks enabled manually above 
remain prepared/enabled.

Thanks
Ajay Kumar Nandam

> +	cdns_i2s_sc_rst(i2s_sc_priv);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +	i2s_sc_priv->irq = irq;
> +
> +	ret = devm_request_irq(&pdev->dev, irq, cdns_i2s_sc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_sc_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}

