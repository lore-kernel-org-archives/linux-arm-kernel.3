Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCEBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 14:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1//V6hw7ZeJCpBe534PNy3XxpjNRBUsFUM+ImnjOdk=; b=5AludN9zKohNC/F0f0ZMnhyM0b
	eL1qCGmhvAxX02xrzLMaHoPnb0YQCpozq2tFsgIjCOoM1DwiN8ZAap9IO3Cum9BTU1oFtmI42HKqL
	uqAee1TLXtsOOOSG3s50srMsUjgScv+2eLp63YhJNf+HG3ggq7W9oHl6RtroTyqkLIu8tnuGzGpcu
	/kQn6iFfmkksVmntn3Hu1KqiLyg8Qwsc6YNr4jyWdpZcYeejoojI3ijVbVGm7afTaHnJ2X2mdYw9F
	raFoLpbYnwolfiPFED2xPnDRlr4rCNmJOAi0ewMxSWfBJ/TQtyJOGoYoegePCvX2oRQhouRDaakXi
	yfju7cUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqv1L-0000000Gilm-0lka;
	Sat, 08 Mar 2025 14:19:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tquzi-0000000Gies-1spg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 14:17:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528ChlMG032029
	for <linux-arm-kernel@lists.infradead.org>; Sat, 8 Mar 2025 14:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1//V6hw7ZeJCpBe534PNy3XxpjNRBUsFUM+ImnjOdk=; b=IoxtfEpzYKF+eVbu
	g/Up9NSNM3H0qu2+btdGjoL3d3q6dfAswAlRe64+JUfRwPPKCF15lAjCS7H3eCp0
	VRT87TWNlZzejd3XV0gGfUxLVVW2X9D1PwWmCphVTFwWKLAXID3DAzYgyEbXvoZd
	1UL6Lhm+DTq9Co8FYVe0Gf1bH2YESK+lS9O0Aq7dDPm+/9WxS4okIWkMekqpbr0A
	Smmz1kKpPOrO5NKkTaoPt0fPm7OCTSP9KTQQdEY+luYYKu94ABSZdmVADwRiMHzD
	gz4iir8+Jjl+B3FE7AkMfuHvtUg4sI8qRrnKnsLHWKPRfl1Q2RM2NbTukxFIHOzN
	Ytgknw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex6rp28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 14:17:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fec7ab4dso5606026d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 06:17:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741443450; x=1742048250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1//V6hw7ZeJCpBe534PNy3XxpjNRBUsFUM+ImnjOdk=;
        b=mCZqlEgYpYgT4RqeWxt4rplKeJPJssRfHse7oMygH01hi9fSQY7eAdtgEZouA9xKbN
         I0HnaAJezRwf1w4s3waWlkN/G5zFJsL3IGu61s/UzcBaqPawGw7ct1BBP2WFT5Tcw+j8
         +kS74R6GcrmVp3lXj6meZp+LDpMlxD5GiUJn3m4eo7nZvlLYZsVtU/dFwjejkt7ivRYQ
         1p5NTvthwKrVTZ2atvLtY7dtPjzqbtID9xv+ytuLRAWylMHvmDA+Jd4T0zjFs39hmhUm
         APphif1zdkYB9eDoMs/aGUtNqagwhBAtSQsjOJ294RLb23xKPnmGNjKn8sFCZQwetPxl
         k9uA==
X-Forwarded-Encrypted: i=1; AJvYcCXUB9OhUs8KLkeFgUEuhXuw8+JWOHcj7xrtwL/K8DnTnLHsM2csP+gxDHWxxVb+3NT6L5eWgh3Jmhk0zOLNrw8L@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/IBLAKv2OmCZQkgczeJWwwSekHJsWeLddDy34QIknoGnIKUuz
	IulOFqGR26JUhtNap6pzvrn0CF61uhnN4ruQyx58BAKb+gvLEk+wAxmWyowb/4ZWPoy7sIUGoyJ
	s8CBVrBnQk6ECH7F2n5qQGPsrF0TCFju+gcab/5xMvYqpzVZuBfZDDpAPQICvJKI48Expz0IcNQ
	==
X-Gm-Gg: ASbGncvu7CBWBljvwWjDfYAfFHKnwafwJLUfezVCIPcmCGHhsCHClJZDDFjabV8Upwg
	VYK9uGe38kTBAsPJwf6ORZaKa5haNM2VoM9SiFRry2tPZdHmjkI83HHGZ8To0R7NQHCnAsJmGEg
	ocGanXPMSk984cNvaIAl17W4ztuJEW2KRRkKaG23xa44WKRXtGDNJKwF+QCS0sldcO9/nCLQVDh
	uS1z9fTtS3mSrMYHZWWeq7HzbADnVwl4NlKFBp4QfnACM37Asz5Af3nC90/Z4HJoXidV4lGN3zZ
	ClkZw8/dtfxReqmtTnD1JkLvWZhh+yjSm1xYadn9h3Bh8hXBH2NNMlY25SpmPkzTdSSDaw==
X-Received: by 2002:ad4:5d63:0:b0:6e8:9c91:227a with SMTP id 6a1803df08f44-6e908a8299emr17047756d6.0.1741443449943;
        Sat, 08 Mar 2025 06:17:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFn+apy78yObNDX132VCgoB+/Ws3nmpk1YJl8IUzHLq1owpnyugCLpRkOWW986ipasi3vQVoA==
X-Received: by 2002:ad4:5d63:0:b0:6e8:9c91:227a with SMTP id 6a1803df08f44-6e908a8299emr17047406d6.0.1741443449547;
        Sat, 08 Mar 2025 06:17:29 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23973810csm439279366b.118.2025.03.08.06.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 06:17:29 -0800 (PST)
Message-ID: <53c3d2c3-2bfb-43f9-ad25-0d1fdd96f19f@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 15:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] drm/msm/dsi/phy: add configuration for SAR2130P
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-7-1d4c30f43822@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250308-sar2130p-display-v1-7-1d4c30f43822@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8bmE8k5 c=1 sm=1 tr=0 ts=67cc517d cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=WWvJJprN3eueWNfT7O0A:9 a=QEXdDO2ut3YA:10
 a=jpH7HpYVSZo6v3SV3j0F:22 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RF7kvCOrdGtBXmcAjrl9z0UvadRaLdwy
X-Proofpoint-ORIG-GUID: RF7kvCOrdGtBXmcAjrl9z0UvadRaLdwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_061738_517027_91284D2A 
X-CRM114-Status: GOOD (  20.38  )
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

On 8.03.2025 2:42 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Qualcomm SAR2130P requires slightly different setup for the DSI PHY. It
> is a 5nm PHY (like SM8450), so supplies are the same, but the rest of
> the configuration is the same as SM8550 DSI PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index c0bcc68289633fd7506ce4f1f963655d862e8f08..a58bafe9fe8635730cb82e8c82ec1ded394988cd 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -581,6 +581,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  	  .data = &dsi_phy_7nm_cfgs },
>  	{ .compatible = "qcom,dsi-phy-7nm-8150",
>  	  .data = &dsi_phy_7nm_8150_cfgs },
> +	{ .compatible = "qcom,sar2130p-dsi-phy-5nm",
> +	  .data = &dsi_phy_5nm_sar2130p_cfgs },
>  	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
>  	  .data = &dsi_phy_7nm_7280_cfgs },
>  	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 1925418d9999a24263d6621299cae78f1fb9455c..1ed08b56e056094bc0096d07d4470b89d9824060 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -59,6 +59,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
>  
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index a92decbee5b5433853ed973747f7705d9079068d..cad55702746b8d35949d22090796cca60f03b9e1 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -1289,6 +1289,29 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
>  	.quirks = DSI_PHY_7NM_QUIRK_V4_3,
>  };
>  
> +const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_7nm_97800uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_97800uA_regulators),
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +	},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae95000, 0xae97000 },
> +	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
> +};

I'm squinting very very hard and can't tell how this is different from
dsi_phy_4nm_8550_cfgs

Konrad

