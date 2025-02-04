Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19151C02196
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1DYlp7BOgCsO/bvivOkdwsvShb36ZFFcwsQF/5DCtw=; b=G4tma4gGQ66xgAkdViPf2aRwGU
	Z8wW50sMTkEsifgV4BmU6qtqZbFnFtJDecVjBf7bUcV2dN0D9Qdh0K1JYtpB6M/X0u5T8nqEinZIA
	Qx9mqD3okQ6Sjxc/EloOdjOfIkEI4gy9ldIm2pLPAyUwtXzslIdPX0jcdQHfx9wbkSSxONQMezvms
	O8DbQi72PN4CYYl7o01wFBw9I9Nz6GiW2gKoIejX2KjS0pHQH6ptx3DoXtvE0rVnHu/v54IvT9hfQ
	6nJi2X9gDDS1+O36o6PbvdrTcSYPL1v1bUBh2T/ImQe6AaoFaVLKRsxN475AxKcU1dArFThauImig
	fY0Z0rAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKQw-00000000kUq-0FNN;
	Tue, 04 Feb 2025 15:01:50 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKOg-00000000jov-2Ifp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 14:59:32 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53f757134cdso5914177e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 06:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738681168; x=1739285968; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t1DYlp7BOgCsO/bvivOkdwsvShb36ZFFcwsQF/5DCtw=;
        b=jxsxdCD+kCV2XqbeJ5SvLK4aZlegdKMKM6OKQvjGf4UPIGzxg0XEa41EcD7JLszUTU
         l1qQij+6sMHNd9xTdEcfBp92JByzEMyaQZ7iYdFieb1Ud+rMyTXyh07Pd31tpETHZNFC
         SBQ2XgcHmvCN24Cj35wGkRTigJ4iDhjiWA8j2Zkk8Hslhly37g+tqOv/YY4Ioq60ODfd
         WSNCyZzukgM/gDF+J52zhVf3mK5uFAvBQ1WLSZIkBT75zJu4x5tZLaDp5FTZg6No06iy
         nn/kng410qdVaTzmOG4PAG9NX+qFvxKkCSs1KXbixD9iH+tZjLc4KxXFraFLD8hC8ylw
         YawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681168; x=1739285968;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t1DYlp7BOgCsO/bvivOkdwsvShb36ZFFcwsQF/5DCtw=;
        b=XI+7VraZoLkWLslRtE4dvJYC8mBV9bYCnz5GVmrfs4WXn09Ddo/4roSa6rki73jBUw
         TBpQpBHxURh+tPQaRBOu3SlbyqLXlR0fNy51FLHorMR1huWyEHcGNtApWbS5HsD/L5gz
         x1x+qr34aB7WuVE76yQ087ZMu1nKeWv5l84+rggP+fJ2AwSRBV2ViIA33WNp4NmjRSun
         okufxaEiGsDT0rssKcSq/Vg/+5VrPW/IDrA8Pd1ifH2TViLKYL8BvMOu7nSw/fCg9Bpy
         JG55/1abMSiVRyzPVdabeCDlNPnYdhwvbmT+rqEVGDaE6NrnddCEoPSRvXjSgx+BLl8o
         w3Zw==
X-Forwarded-Encrypted: i=1; AJvYcCU0qy1Df9f0RoiHNNeNokPHcP7YnyDPNbYY72giEwrGM4Tt4tEbFug67UMtFp1b3UcgBJR6JYpkXHEQHNwPw38p@lists.infradead.org
X-Gm-Message-State: AOJu0YyPzLvnMYSq1BVT91Yv3KksqlI4ad5kvIKlG7+Q5Fu3EAopzQot
	BcqN6DUuBtYDiu6aTTN4LvLTgTvD8g9soSMqg8QdcGtOB/hcSTxyZNyIFaKxHPM=
X-Gm-Gg: ASbGnct4/MporberetCKvfAa0AWM7lhuheylyG7DuMaV9j2L7WrwCG3ENKOMAOx7RFB
	n+ss8ZUOElPuJ0l3OxxuXvaf5fKQZMCf6Od8mv1VXGRuw6Yp9/j8A2V4J7Lvh6dqwTtXDvDcGiq
	DOwAlgn5Dt3pyv92LepriAvB2Y6MTwRQkLD360OakYSdXde6fipwLSnxMxWesBVCFmt6+iN2TvV
	BMh1HEo1yyeNegtic5HKFqgUHK1CBJUgpLPWXzUeIIM2FuiQaUer5baCdS9Gzinb3tn4YBd4Hp7
	IOl9SS7quyGCkZjmeWmdINz6lEExEkffc5ceqnT5af+gej+eq18AOdwi4vGuEri1HsOaWL0=
X-Google-Smtp-Source: AGHT+IE7b+udRsOmYgAUchqywxLPloRDcPecM5jIJa9qMOD6OPTAHNII/xMHMBXskhTGDDkZ3IE7zA==
X-Received: by 2002:ac2:48a1:0:b0:542:9883:26f with SMTP id 2adb3069b0e04-543e4c3a1demr7204191e87.50.1738681168494;
        Tue, 04 Feb 2025 06:59:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe0f8f5sm1636690e87.58.2025.02.04.06.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:59:27 -0800 (PST)
Date: Tue, 4 Feb 2025 16:59:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/7] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <ofaioilki5qxdq2x5fpbpuk6mid6i6slpyqzwol4e2s4cwdwsf@lgpqy2zil4j6>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-4-09afe1dc2524@quicinc.com>
 <tcm2hn7rpzaazntp5r7ag466ynacexnke43e6ypm4q5mrrlkdb@nem3gzib2l2v>
 <0ec95cca-45ed-4805-8ebd-03563d55627e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ec95cca-45ed-4805-8ebd-03563d55627e@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_065930_598657_C5E945B9 
X-CRM114-Status: GOOD (  25.64  )
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

On Mon, Feb 03, 2025 at 07:31:29PM -0800, Wesley Cheng wrote:
> 
> On 1/14/2025 2:23 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 01:52:10PM -0800, Melody Olvera wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> Add new register offsets and PHY values for SM8750. Some of the previous
> >> definitions can be leveraged from older PHY versions as offsets within
> >> registers have not changed. This also updates the PHY sequence that is
> >> recommended after running hardware characterization.
> >>
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 198 ++++++++++++++++++++++++++++++
> >>  1 file changed, 198 insertions(+)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> >> index b09fa00e9fe7db8d97b7179ee15d3f07fe578b0c..823a60029ea6acbd1f0f8c7d27aaa58de39ed758 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> >> @@ -1471,6 +1471,139 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_tbl[] = {
> >>  	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_EQ_CONFIG5, 0x10),
> >>  };
> >>  
> >> +static const struct qmp_phy_init_tbl sm8750_usb3_serdes_tbl[] = {
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0xc0),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x01),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x16),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x16),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x41),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x41),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE1, 0x00),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0x55),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0x75),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x01),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0x25),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x02),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0x5c),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x0f),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x5c),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0f),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0xc0),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x08),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x1a),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE0, 0x00),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0x55),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x75),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x01),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x25),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE0, 0x02),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0a),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_BUF_ENABLE, 0x0c),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x1a),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x14),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0x20),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_1, 0xb6),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_2, 0x4a),
> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_3, 0x36),
> > The only difference from sm8550_usb3_serdes_tbl, it has 0x37 here.
> Not sure what the suggestion is here.  I think in general I would want to have a separate table for each chipset, considering that settings may change/evolve.  Currently, if you're asking to re-use the sm8550 table to avoid re-defining this sequence, I think it'll be confusing to folks when they refer to this SOC's PHY settings.


No suggestion, merely a question if both tables are correct or not.

> >> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC, 0x0c),
> >> +};
> >> +
> > [...]
> >
> >> @@ -1781,6 +1914,22 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
> >>  	.dp_dp_phy	= 0x2200,
> >>  };
> >>  
> >> +static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
> > Why is it v8? Is the actual PHY also v8 rather than v6?
> Yes, actual QMP PHY major rev is v8.  If we want to, I can generate a separate v8 based header files if that is better.  However, most of the offsets for the registers we're taking advantage of in the actual driver has the same offsets as previous revisions.

If all registers of a particular set (QSERDE, TX/RX, PCS) are the same,
then it should be fine to reuse those (although it creates some
questions). If the majority is the same, but there are some differences,
please create new header file. It is definitely easier to verify that
the patch is correct if every piece has the same version.

-- 
With best wishes
Dmitry

