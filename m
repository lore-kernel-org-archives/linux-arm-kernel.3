Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B79C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6FqCG7b8R+qhzgHna3f9JAx3Wwa0Pc3B238JWiWJdY=; b=0oJTDuR4G6kz0Kb9YVS/fBM/Ti
	vbD7kh9tHoolq5WHfJ9lm7XFh4oJU22Sxw+0A6g9jyyU0xwTavD33bcQ0FUIJWecUWGesoe70FZlq
	zDZT0CTSvQ6iMyqpAtAE8a4Bc1+iirb0PmEh9H54ruM4G5h6+VuSSsOxzumQqzHcNLk5gJfzqMehW
	EMCoLARU9aSXKSexoQAjGkSqRN9lG0aSPp46uwKCTaheuqzSmu1l4wwqxJz5ndoPgCGCwR40onItl
	kmFWJsoNYBSM1wfMn38qptcZqD5x8C9/BKL/f99IRTZAOWddLOE/esUGmAjI7Vu+rTUERpfJrv/OR
	LJrUUEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUwL-00000009cND-04Wc;
	Wed, 25 Jun 2025 18:33:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUObH-00000008XEU-2SE0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:47:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P9b7hA032301
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 11:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R6FqCG7b8R+qhzgHna3f9JAx
	3Wwa0Pc3B238JWiWJdY=; b=dKhbwi0lp4Iz7gAelPuOZdLiUUGKwi17dtuEDlSK
	lnEuhOx+kPGKhZidKhkI4h27FRDAU8eAs7iMTStfhog3aJWxhWviWTwWYlZmbE7T
	2BtMH5t8Z3kfdSroA23iY8VHQ65aNaU+A9gCEzafXX6Q+mgfCan0+V2PKvxLeWCa
	tRNyH9RTNE7T/wHkjlmu86G8GZp4qqzvN+Oa1jC/ISkdyEcA8zmyhBHSY4448IGz
	TPgjwI7xWoNy6hfaRP5vC0oI3Aw13spL9TmM49O/QV8WdPhrJepRywYApSpN53ls
	TiWvGWCllnRxEJ6POH39r+yAHBZMseF0FTSvdoUbF4fduA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1xa3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 11:47:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so1320142885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 04:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852052; x=1751456852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6FqCG7b8R+qhzgHna3f9JAx3Wwa0Pc3B238JWiWJdY=;
        b=n54ZEo2IjKxebSH0hRemUuybZ9Ze4eVL86Tnh5NFptFvUcf4rD+tAyhTBJgg85iJ8m
         JMYRzA2oRxk8bjYG3gsv/Kw3Bq1VecEB7ED54OJ36SzsRN2j0zAiL3FxEIQ3Pt7UUc0o
         Cd34QUMFXzbDQFFXJhjUYB5GutkubooogcHvuPaXlR4EdOzuT4cTsj728AeoxKj0uWP8
         K1ScT6I+mDBBFbN5tU77rkx4u4dEhigKJubBimKaYPicoexNjTkoUGfOXo6qrUJ2J9E/
         MVZ9iC6d7RIa7MrgfVbaUN/VDkCOy6mzSgoFcsrg+FXTopVUfd+cLVZbe6UsSRNW2cVW
         J1+g==
X-Forwarded-Encrypted: i=1; AJvYcCXwQHT/MGb54f7o6N3HBraJeNN6jUrydmEvqqje2pCuPCGNvQ02rrCISbJN9Tt4r5j9hdzDhI5/xninpNjywG9z@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf3vZOml56Ne6LECWOQlrluVPHbbnbXODdtx2quWEmFvSmhUU6
	MH6Jp8TT4swQoVGcNTYz7HcBgaQ2SMmLE+bhu+nXNExUbkS/g39uAu4JM62AeI/7pYXuujitxm4
	FGGFq/XbQqaPWIxprD4IhEV7xrXfoztttGGDOIsYEM4+BjQaQBnywg5oVmjj0khVqfuhsB1//Xd
	B4/w==
X-Gm-Gg: ASbGncs8eX5rehBpT8rmc2mJDrZphiGD1KaDVoesQ2FVThQPnogRhvOcZNse7BxOSN/
	himuXo/iGQMeYwDbJQviy2lnwo/HobgaCZbK5M1YY46j+pK3ylciLCQdv3rH7seW/uZU9Q/H/gL
	PgFoiVENLPeVrPkxI2ZiEAT/qLaQBHDLzSllcwAx4qP+0fJ4Uk1xX9Kn6jAFYr7z5/JwKrLRihE
	IPNC6CE4ypjRWpEm56evkpw3C5r6CEj3PenJw6GcBv51/hmZOMHxMbDWxLYey7MC5enfSR8sEu9
	LEGEzDyoqoIX8AYTCeYgfO4zLAi2EW7dMLGH8rVycujku7zQjkflov2Xy0oJapvyyLzEYlXROsc
	gwmB7lNYg+imdpCY49pUu0rVewvO+dUir+e4=
X-Received: by 2002:a05:620a:4444:b0:7d3:ed55:c92b with SMTP id af79cd13be357-7d42974b899mr326667485a.38.1750852052294;
        Wed, 25 Jun 2025 04:47:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwN9V0DIMaqLW3c8P1cQrAhb/E9grjRFPmdzpe/w+9SMMXrfRLILkEXZLWzYsCSaZ100tLfQ==
X-Received: by 2002:a05:620a:4444:b0:7d3:ed55:c92b with SMTP id af79cd13be357-7d42974b899mr326662985a.38.1750852051789;
        Wed, 25 Jun 2025 04:47:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc0easm2167738e87.208.2025.06.25.04.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:47:30 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:47:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
Message-ID: <trwdfk2oz2udtbiqxh3ybuqbvasfqywmqxgi4xyvsknz6svs2r@icpp7snpq6c5>
References: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
 <20250625-qcs615-mm-v10-clock-controllers-v10-1-ec48255f90d8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-qcs615-mm-v10-clock-controllers-v10-1-ec48255f90d8@quicinc.com>
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685be1d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=2-BSLW4CMbL1kKF9A54A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: igGB1Tl4qDcNdIzHUADxGZKkgNefr2V5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4NyBTYWx0ZWRfX2IT3XM/lqehr
 R95W+4n0aTSkTzwC1TrdjGXQ0kIpl4Byj9RBnEZzLcEDRDiVxY8wgqYIJhnwfFrt8JpDCv9zJi1
 jWEd9tgYr4yyg/5ojDCPkBRD7AY9y01eaU4HWqbrl/WU7BTsH62jV24FjIHCEEVMnJQAzZ4YxBf
 GEz/w22EVjMU00bsWdE2pBsSXAE8HnA9mDS1uUhcwPGi5yXK/kBndgTszuPBNXYjyQSBgvYPuYw
 vxy44k4BiEakP8tHJEtu1CDTwBl2xuSSmHPelEWMNrVUplJ3MHA2svE15cH987Y2nNBK090QtFl
 7wiBtizpfXoT2JXcopZI6QCwlFNojwhVQHEi44vtZLNuMloLQ2f0cGJQADqhG3xO/8KXyozWwy1
 xQbVIk1lOvp+eBPC7TJg2u2VXYLpzLtqm3uSj2k+loMfsMFobTpr8eRZxun/IBJRJR0mvQ5V
X-Proofpoint-ORIG-GUID: igGB1Tl4qDcNdIzHUADxGZKkgNefr2V5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_044735_741878_E585803A 
X-CRM114-Status: GOOD (  33.54  )
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

On Wed, Jun 25, 2025 at 04:13:26PM +0530, Taniya Das wrote:
> The alpha PLLs which slew to a new frequency at runtime would require
> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
> which can support the slewing of the PLL to a new frequency.
> 
> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 169 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |   1 +
>  2 files changed, 170 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index d8e1cd1263317814da2d0414600988de4b87c56f..354ebf48435f1ef7f76ead05e9ca882085dcc46d 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -3017,3 +3017,172 @@ void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
>  	}
>  }
>  EXPORT_SYMBOL_GPL(qcom_clk_alpha_pll_configure);
> +
> +static int clk_alpha_pll_slew_update(struct clk_alpha_pll *pll)
> +{
> +	u32 val;
> +	int ret;
> +
> +	regmap_set_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE);
> +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> +
> +	ret = wait_for_pll_update(pll);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * Hardware programming mandates a wait of at least 570ns before polling the LOCK
> +	 * detect bit. Have a delay of 1us just to be safe.
> +	 */
> +	udelay(1);
> +
> +	return wait_for_pll_enable_lock(pll);
> +}
> +
> +static int clk_alpha_pll_slew_set_rate(struct clk_hw *hw, unsigned long rate,
> +					unsigned long parent_rate)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	const struct pll_vco *curr_vco, *vco;
> +	unsigned long freq_hz;
> +	u64 a;
> +	u32 l;
> +
> +	freq_hz = alpha_pll_round_rate(rate, parent_rate, &l, &a, ALPHA_REG_BITWIDTH);
> +	if (freq_hz != rate) {
> +		pr_err("alpha_pll: Call clk_set_rate with rounded rates!\n");
> +		return -EINVAL;
> +	}
> +
> +	curr_vco = alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
> +	if (!curr_vco) {
> +		pr_err("alpha pll: not in a valid vco range\n");
> +		return -EINVAL;
> +	}
> +
> +	vco = alpha_pll_find_vco(pll, freq_hz);
> +	if (!vco) {
> +		pr_err("alpha pll: not in a valid vco range\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Dynamic pll update will not support switching frequencies across
> +	 * vco ranges. In those cases fall back to normal alpha set rate.
> +	 */
> +	if (curr_vco->val != vco->val)
> +		return clk_alpha_pll_set_rate(hw, rate, parent_rate);
> +
> +	a <<= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
> +
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));

We have code that does this in __clk_alpha_pll_set_rate() and now you
are adding two more copies. Please extract PLL_L_VAL, PLL_ALPHA_VAL and
PLL_USER_CTL / PLL_VCO_MASK into a helper function.

> +
> +	/* Ensure that the write above goes before slewing the PLL */
> +	mb();
> +
> +	if (clk_hw_is_enabled(hw))
> +		return clk_alpha_pll_slew_update(pll);
> +
> +	return 0;
> +}
> +
> +/*
> + * Slewing plls should be bought up at frequency which is in the middle of the
> + * desired VCO range. So after bringing up the pll at calibration freq, set it
> + * back to desired frequency(that was set by previous clk_set_rate).
> + */
> +static int clk_alpha_pll_calibrate(struct clk_hw *hw)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	struct clk_hw *parent;
> +	const struct pll_vco *vco;
> +	unsigned long calibration_freq, freq_hz;
> +	u64 a;
> +	u32 l;
> +	int rc;
> +
> +	parent = clk_hw_get_parent(hw);
> +	if (!parent) {
> +		pr_err("alpha pll: no valid parent found\n");
> +		return -EINVAL;
> +	}
> +
> +	vco = alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
> +	if (!vco) {
> +		pr_err("alpha pll: not in a valid vco range\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * As during slewing plls vco_sel won't be allowed to change, vco table
> +	 * should have only one entry table, i.e. index = 0, find the
> +	 * calibration frequency.
> +	 */
> +	calibration_freq = (pll->vco_table[0].min_freq + pll->vco_table[0].max_freq) / 2;
> +
> +	freq_hz = alpha_pll_round_rate(calibration_freq, clk_hw_get_rate(parent),
> +					&l, &a, ALPHA_REG_BITWIDTH);
> +	if (freq_hz != calibration_freq) {
> +		pr_err("alpha_pll: call clk_set_rate with rounded rates!\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Setup PLL for calibration frequency */
> +	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
> +
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
> +
> +	regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_VCO_MASK << PLL_VCO_SHIFT,
> +				vco->val << PLL_VCO_SHIFT);
> +
> +	/* Bringup the pll at calibration frequency */
> +	rc = clk_alpha_pll_enable(hw);
> +	if (rc) {
> +		pr_err("alpha pll calibration failed\n");
> +		return rc;
> +	}
> +
> +	/*
> +	 * PLL is already running at calibration frequency.
> +	 * So slew pll to the previously set frequency.
> +	 */
> +	freq_hz = alpha_pll_round_rate(clk_hw_get_rate(hw),
> +			clk_hw_get_rate(parent), &l, &a, ALPHA_REG_BITWIDTH);
> +
> +	pr_debug("pll %s: setting back to required rate %lu, freq_hz %ld\n",
> +		clk_hw_get_name(hw), clk_hw_get_rate(hw), freq_hz);
> +
> +	/* Setup the PLL for the new frequency */
> +	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
> +
> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
> +
> +	regmap_set_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_ALPHA_EN);
> +
> +	return clk_alpha_pll_slew_update(pll);
> +}
> +
> +static int clk_alpha_pll_slew_enable(struct clk_hw *hw)
> +{
> +	int rc;
> +
> +	rc = clk_alpha_pll_calibrate(hw);
> +	if (rc)
> +		return rc;
> +
> +	return clk_alpha_pll_enable(hw);
> +}
> +
> +const struct clk_ops clk_alpha_pll_slew_ops = {
> +	.enable = clk_alpha_pll_slew_enable,
> +	.disable = clk_alpha_pll_disable,
> +	.recalc_rate = clk_alpha_pll_recalc_rate,
> +	.round_rate = clk_alpha_pll_round_rate,
> +	.set_rate = clk_alpha_pll_slew_set_rate,
> +};
> +EXPORT_SYMBOL(clk_alpha_pll_slew_ops);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 7f35aaa7a35d88411beb11fd2be5d5dd5bfbe066..ff41aeab0ab9844cd4e43c9b8e1ba0b50205e48e 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -206,6 +206,7 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
>  #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
>  
>  extern const struct clk_ops clk_alpha_pll_regera_ops;
> +extern const struct clk_ops clk_alpha_pll_slew_ops;
>  
>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			     const struct alpha_pll_config *config);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

