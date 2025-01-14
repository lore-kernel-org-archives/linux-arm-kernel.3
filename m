Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7D5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oI6vi2GoQLTi0BDTazm+sSUfItEUA/br8Yh1LQsmUM=; b=K2EEdTthkgxeQL4IWLUCOFUMq2
	wy861zv55WYQWhEOU6Ynph4wMF8/3cPfm4+k2rHJoRoIBbxs9elSJdAoRHc+QVR96yxhMyeksjoJR
	7z71h9efIghab/zb4GdBaJXrToyPTBVpcjGVoArT/wNXjslBYDKBRTb08PAqLpxfz9Oneny1a2nmJ
	9S+O+LoGmTYatjo6inPX1PEatXEDHIN/8YUBwDu1g6+7fkD0ERtsudZ8MPvLqjUKKxawRLx6LPW1+
	gbqS3uyGWbWaWwvXHErk47KEmB6qFrKLHuH7crBUhcdG2FOUPZooCvEqNQFF6XVdFmV2YOqIU/e4a
	nYonnsNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXe6q-000000085MM-0pOp;
	Tue, 14 Jan 2025 10:25:20 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXe5b-000000085CG-0tDf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 10:24:04 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5401c52000dso5390798e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 02:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736850241; x=1737455041; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3oI6vi2GoQLTi0BDTazm+sSUfItEUA/br8Yh1LQsmUM=;
        b=tKsmxjOJ0izEd6Hbn7/C+yhNNGt/cFwI9/fZfzGvKuhRE1In2V7XGjoSWUePGCMRrS
         5RGewYNkn4q2cNxabtEL2xxbLWOkK5dJ9yM4iyNB0wtIcJ9JPWSQlxWu0k38VvvEJf70
         ArBlZOae8t7nAr+lgfe+t/3wgCD5gGjZ2yM0kWu2Ib3RzyZpYfUAI9gZ5KEfKGILIdg5
         0Px0BOLr4l1WQKXv/27AIRcIEkxh/cNacCES13MYiChwcq5bETOkA9UWkv05iyg9gFFv
         9pLtLOxXIrbW61g+h+uVveZZb+MZRUkP5yEqjp/QaFJBKS1ChvvX8w0EyZHgNvlo0N5x
         VL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736850241; x=1737455041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oI6vi2GoQLTi0BDTazm+sSUfItEUA/br8Yh1LQsmUM=;
        b=Wn115aPuvwPpNJblpmXqfSKOZtNayZL4S1z0TiPJ5n1rXu8WBd/rHSbCU8sh/u5Lzh
         397LRO7LvY1FyR1wPGcjjQOtS+2p3j5ZVlQy9ePSiKrN4ZhQd1Dls2I//qUBofGT8Gke
         KP+aXN+rf4K6FUYMkJl5BzskalE2xiVpqWm4kBVvAzLt+8/zbInz6/WqtzxQFlwvUazQ
         JcuqV4actObGF/FAoZ71Lzp0YaNWubeQ/hrJQHFOHMA6W0IJV9iTYz8/yhR71b6cu3GH
         5SJCBKLDDeMclztPEpfZusyn9EHeoQZO3HsiZGHOG8LtDWwGMFMNrjeoEvgjZzdAqFNC
         oTAg==
X-Forwarded-Encrypted: i=1; AJvYcCVsoe9UWuSb0HHT/Ni8tdSSnf2TzBtMwKH77SnEWBCuthUPEAWPCTTF3aBzlo5e0VPYQy/2yPuRPeIbVvC1Fqfm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa41zkRVNQHPEG5A6s9+8TgJmWfBDApthtu4+CBPyurCHXt0RK
	E+6u3TwO8QBpMYvtbva1Wy6OLa7qR/vsn3ILZpqM0UKWmhqctbLaFYS3SlYoUpI=
X-Gm-Gg: ASbGncuG37jouJFL26yOmlcGQOisMN80fY8KalbqWPsCOXfKabrCwcfMeanecDVjMJ8
	VF/Fce0pIJpOdJj2GmOanJQC4O1F6E7hNwOW7DlQIP3UE4EBHZ1o2vTVdnzb07f4rQnilcw+mur
	iujbk+59plvR9KkZGZ061Pl6zRqSjJ11iARoya0qIQz5L8Zr0uSOaloiX7LrZe4rQudHjejjEq8
	31uOFfW50hzvb9gN1vGUzaeQEf+OhKKHz65VRnmlz6gxdYoKHvcblT57ueYd0M4jwaB43jzi22f
	HsdTLJNrd8f2YI47MGbaXwHVv/pEzPNF0tc1
X-Google-Smtp-Source: AGHT+IEKsRHi3ewHQ3flyKmAEggsmIc5cWlq0d+tu6iEmD2+GVjY0LyFN7q1yTTso4t8mLEgCs7lPQ==
X-Received: by 2002:a05:6512:33ca:b0:542:1b63:2e52 with SMTP id 2adb3069b0e04-542845a7137mr6460348e87.6.1736850241188;
        Tue, 14 Jan 2025 02:24:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea8504sm1620977e87.138.2025.01.14.02.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:23:59 -0800 (PST)
Date: Tue, 14 Jan 2025 12:23:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/7] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <tcm2hn7rpzaazntp5r7ag466ynacexnke43e6ypm4q5mrrlkdb@nem3gzib2l2v>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-4-09afe1dc2524@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-4-09afe1dc2524@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_022403_299058_2A89807A 
X-CRM114-Status: GOOD (  18.40  )
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

On Mon, Jan 13, 2025 at 01:52:10PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also updates the PHY sequence that is
> recommended after running hardware characterization.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 198 ++++++++++++++++++++++++++++++
>  1 file changed, 198 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index b09fa00e9fe7db8d97b7179ee15d3f07fe578b0c..823a60029ea6acbd1f0f8c7d27aaa58de39ed758 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -1471,6 +1471,139 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_EQ_CONFIG5, 0x10),
>  };
>  
> +static const struct qmp_phy_init_tbl sm8750_usb3_serdes_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0xc0),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x41),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x41),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE1, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0x55),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0x75),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0x25),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0x5c),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x5c),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0xc0),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x1a),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0x55),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x75),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x25),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE0, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_BUF_ENABLE, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x1a),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0x20),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_1, 0xb6),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_2, 0x4a),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_3, 0x36),

The only difference from sm8550_usb3_serdes_tbl, it has 0x37 here.

> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC, 0x0c),
> +};
> +

[...]

> @@ -1781,6 +1914,22 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
>  	.dp_dp_phy	= 0x2200,
>  };
>  
> +static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {

Why is it v8? Is the actual PHY also v8 rather than v6?

> +	.com		= 0x0000,
> +	.txa		= 0x1400,
> +	.rxa		= 0x1600,
> +	.txb		= 0x1800,
> +	.rxb		= 0x1a00,
> +	.usb3_serdes	= 0x1000,
> +	.usb3_pcs_misc	= 0x1c00,
> +	.usb3_pcs	= 0x1e00,
> +	.usb3_pcs_usb	= 0x2100,
> +	.dp_serdes	= 0x3000,
> +	.dp_txa		= 0x3400,
> +	.dp_txb		= 0x3800,
> +	.dp_dp_phy	= 0x3c00,
> +};
> +
>  static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
>  	.offsets		= &qmp_combo_offsets_v3,
>  

-- 
With best wishes
Dmitry

