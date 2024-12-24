Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD3DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 04:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j85+evyvQS7SlTLMk12mpMS49xrhooguofPw8Ck5dIU=; b=GJwWbbz0hXAs6+Sq7EgQqI0djO
	aSuHD0c0OTCnSFfInduXjmgIkmFcDD5mvqAYxEIqnbMhMizNKPrk8VQJ4Zy7TA8YLlHRr6rowXqBv
	oGtBwTTad9lMfI7B5tXMK5iHFjdc/aAkoYqFzWZbjxuplPeahoqdCqHAlHK8PBBrdH0hbFSGsgRms
	z34yntE7Wsa3NMilJggHmm6qryF/7SqokZ2Rf42C6jABY+R5rQ7h6Wo4p5xT1Fgh2Ga1XQK1aa3RR
	/x2kl1FqPHLaoDzGveraiGGMrzLO86ry8a/6ruBY54mx1ojvGY0SfQjTZMvrMPnzhXdW+H8hlQnUs
	SmIW9IGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPwPI-0000000BEiy-1Ll1;
	Tue, 24 Dec 2024 04:20:32 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPwNs-0000000BERs-0cYh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 04:19:05 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so55709791fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 20:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735013942; x=1735618742; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j85+evyvQS7SlTLMk12mpMS49xrhooguofPw8Ck5dIU=;
        b=m4Z6uXKu6+FP+pNA1wfxbONe4KUNSgQFyqxTYi0AA4+48e2VzHGHd9kOqvKz7hACd1
         TNsiHSeqFiTPga02wb8M9Jywx0FahVvMLGZ1YL4sSbnpb+tvV20fWi/uI7VzRZSX+Kx5
         YykoG/6tn7Vpvs6dAhkRZleOI9EdAzqA5Pl20SwFqFTI0eqVg+7vmx11FfTNEkWjD6DG
         cUVoDuywsl4L+ZScUvdPAmUh28RjY79jHTFRVk0kwRsASdPzITkSJ+xYDn7YKJzhrQ0D
         I6qDpNHjh1eOVMxWOgIZ72i55NG4iG0fQrti+n0NHCptbwnSCIr2NMF2mKU7wAuRX6/d
         kWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735013942; x=1735618742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j85+evyvQS7SlTLMk12mpMS49xrhooguofPw8Ck5dIU=;
        b=Ju4Q1EpYD7pvEqgxryOzZa94RcWMCe2We80vsjXWASpyHtRmH/SxkeX1aEVP5ayAhr
         rBDsz4baeLmKcJQ9BsE5kWBbpbmJM/IsRFbrq52pJRWP4w3RNt4iF8phMouxyMOVevcX
         ZFSoUGZqqMuwkfnsSb3pNK3lCvEd51rbgK5M2cvT8FfAOdY4xOidtgfef6vD3IkdMHYG
         dt1fa/51d0E0XHkAis2CvExLdhL4kCLzk5cjqVEpSwdTMScPSaJUI8VFulUBk/sxg2sU
         q2pMdD9shjv/B5sw4v7cc+gmfsh1wfF4fEJp+qYtBMtv4T6dzzJJ1At/Dfj8e1mz/R/7
         y7wQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7m1cZlGKyK/cQefvsQWw9foQ6NClDii3pLNJpjrxfhSQLgiIs4mQZaRaSmKjoaaxj56RRLRuH0i3VAYTH6sL6@lists.infradead.org
X-Gm-Message-State: AOJu0YzWWDQFH0jJ8gMedLhpFPnMhdW+++mdUyWk3E3/e56oCN/+hjEZ
	BKG11rFOj5kRah5Xq3lpJRrw6JWEqhC4wOjvFCm8WZHWmUolPlDoYBrQef9Zp7o=
X-Gm-Gg: ASbGnctkdzoWKLrmA5b/K/Zgnd9z8BHXzoc9xySxcveLkIYPe10SkAErXnChB/fyO4Y
	94luHE/VSLtfCfWJ5vzouA1iHfC3n5hPQ9KimZn8276H08kZNWnBi2bQir4CXDy35ORmhY5lF4a
	6UcCYYJNN/5R+mqTyOnGqBZba0ITYiRv2ZvmG9PLlGM8M60VczVhoHWkLdUfBFoctkIaqz2/WpD
	EogVgjZQp7qT1W0oXlUCBmszau0RcTz4v3VeVEhiwM90Mzn1DeOSG3DzJqfI4G+HCTKfBZf71fI
	ioOXjx0Iigz/xw8ps0nUBbbE3Nn9SCkt3+p2
X-Google-Smtp-Source: AGHT+IENMWxXPIOYhp6GLi6KEvU2mAH3sEt8lO8Lah7Hkc79/YZpEbN2wsmvfsGNSMcgutuOQc9tKg==
X-Received: by 2002:a05:6512:1041:b0:540:1dac:c03d with SMTP id 2adb3069b0e04-54229586ef3mr4768804e87.57.1735013942241;
        Mon, 23 Dec 2024 20:19:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f5fa8sm1496276e87.46.2024.12.23.20.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 20:19:00 -0800 (PST)
Date: Tue, 24 Dec 2024 06:18:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-qcom-ethqos: add support for
 EMAC on qcs615 platforms
Message-ID: <62wm4samob5bzsk2br75fmllkrgptxxj2pgo7hztnhkhvwt54v@zz7edyq6ys77>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-3-000ea9044c49@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224-schema-v2-3-000ea9044c49@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_201904_194123_C13CA419 
X-CRM114-Status: GOOD (  19.88  )
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

On Tue, Dec 24, 2024 at 11:07:03AM +0800, Yijie Yang wrote:
> qcs615 uses EMAC version 2.3.1, add the relevant defines and add the new
> compatible.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 901a3c1959fa57efb078da795ad4f92a8b6f71e1..8c76beaee48821eb2853f4e3f8bfd37db8cadf78 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -249,6 +249,22 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
>  	.has_emac_ge_3 = false,
>  };
>  
> +static const struct ethqos_emac_por emac_v2_3_1_por[] = {
> +	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
> +	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },

lowercase the hex, please.

> +	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x00000000 },
> +	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
> +	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
> +	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
> +};
> +
> +static const struct ethqos_emac_driver_data emac_v2_3_1_data = {
> +	.por = emac_v2_3_1_por,
> +	.num_por = ARRAY_SIZE(emac_v2_3_1_por),
> +	.rgmii_config_loopback_en = true,
> +	.has_emac_ge_3 = false,
> +};

Modulo emac_v2_3_1_por vs emac_v2_3_0_por, this is the same as
emac_v2_3_0_data. Which means that bindings for qcs615-ethqos should be
corrected to use qcom,qcs404-ethqos as as fallback entry, making this
patch unused. Please correct the bindings instead.

> +
>  static const struct ethqos_emac_por emac_v3_0_0_por[] = {
>  	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
>  	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
> @@ -898,6 +914,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id qcom_ethqos_match[] = {
>  	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
> +	{ .compatible = "qcom,qcs615-ethqos", .data = &emac_v2_3_1_data},
>  	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
>  	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
>  	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

