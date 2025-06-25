Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09359C7EE3A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyp603+DXROKlY8+1tRFEeF1aiIPfGdpzbAJfdYnfMY=; b=VgdbzOqqFI+dvEcjMCQ0MxpKF/
	O8SXnUHmhdIBp799nax65FxboANboXOAmivrI1+lH6rVj3YNzjA73MMfaro4eGttqiXoVxJPR+3dW
	dXAAucmUbp42XBaasL75ffrC4XFLk/qSR5tXBgL0Lunc/ojLMmQmeArbHnSwZphdXYRG/d1dlxZFs
	7mCZtPoQJg/bJMqkvgH1vSMl1u/6A+TJ49T8+XWn0bZ4U/tTBnTShk/sRh2F39LOGUoIkdfSRHMeC
	8yKnsxL9uXHmCBc2g1g/JyFYTGiPjFoWu8crPl8stD5Ulmv7ZalRLFV5Ex9WiPYBncpN7oX4LoerQ
	KRN8MgOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUrw-00000009ZaX-2bCJ;
	Wed, 25 Jun 2025 18:29:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURGy-00000008zaZ-2GNx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:38:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCUNAK017715
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 14:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vyp603+DXROKlY8+1tRFEeF1aiIPfGdpzbAJfdYnfMY=; b=ky4Ffp+Y8DWJ5sga
	ATB71pj5U7o5cN3QB6T16JQmjj9MVT+way4qI2/Jnj/Bq/MVAyK1OeaP0n9T1lsG
	nYFZroUkLr3jSm4w2xC4/5tpDKeth0qamfd4HVCm671aUtqZ9txeItoWat8IPjuZ
	2zXLys17vwfBwPHHcAxyy+fdYMxni94WDpwmBRkWcFyZY/4sNf4iug5HnkGDE9io
	G/WnjXSB8FAkJYqH7drWISk5RktaYC0S4QOykHl/T0tPfdjGsqLoKtjtAGZpCasv
	HrhG2PqWoVhlMDa1QH2fv2l1Hn8eYWKj3OveQhgK2IDivLOiIsbTg9NNaMwKxGqJ
	WuP4LA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5savv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 14:38:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fabbaa1937so11906d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 07:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862326; x=1751467126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vyp603+DXROKlY8+1tRFEeF1aiIPfGdpzbAJfdYnfMY=;
        b=cso7CAvhL/opJxRc5YradtH4t6A7PIgvmjwlaIWf/YRnlQgf03xpvRvBpzk3VXeJAh
         rg/N+PM0DPv/xIOQSGoBQU/fvb3REmsy0StEaKe3vFeDgu3W2M0Li5aK/j07y6bKQ/Ts
         ny1ltEoViKj5AABx54fnoJ0qSBalyi+hsyBoFbLkBJaPZ9Wi5I+GHQYAvsdAH3nMyDX5
         xAN/mF//gACVUgJOpellc+FfzYM6kI4tbX74J0LwjFueOPuLMbQB0iJJAVhiSjTDbYsr
         yzkyNnXO6IXQYJ/ewm2ULWlYBR0Sh1llKO4jPjy8245NE/T1ZZJ7fAiqmDZZS+ubkA9I
         6S9A==
X-Forwarded-Encrypted: i=1; AJvYcCXMdzHQ6ASXbub5sxNd7MobSLWwKVLzm2StABcEyaxTnd7gsjUMdiQXWSBW265t5LsEzrepXobZIdrMU0V4H0OM@lists.infradead.org
X-Gm-Message-State: AOJu0YxIYtosNn8k9N/TeGQ9tMGXjKJSEGLI3Trv/ipVibkxCldUtz0m
	PcAXC6s7lktM+9ih2UezTArFnn/c1mJFytbsG1D+yVBi5Fag2FmeMZc8XCsQoZFu6yCqia23EAE
	c9S4Yah0KIeTmeSyZD9fRHG9f9Gu4peTT1Mkq08kF2om+qimnd0REdvnh5EZmi6r2JD92WJIoc4
	EihQ==
X-Gm-Gg: ASbGncuDKJP0nI4wy451lWDA3O1C5rsgCIe9TQokZAg/ufzl0+cr8UOuQqJpMY9glG2
	e37RSmQZWFkgrlASd2XRNllZlIkbPDW3eCVk3cwPbAA/Ws7tUmbp74t+R6HAsqM42807wO8dqDx
	1mLXBt9Cw75U2cvk08dYGNbkXvwLBUxxCe2/xU0uL3j1HnrgH/5VxMvsFm+jxijkKeOf1PoPIvB
	HjiVL3bc5bI3R2O7XFJXnVDCejpK9zDP/yOeuU/kBxmhYiX9iY0QVWPvp2UvtMUnfa2cbLEp+o9
	DYcFNfWkgafb29Y2g50nb2E9N0M+8h1VXTky1lKHFHaZSic3llr6ELtBOEwev5TlZpYuVB5tF/L
	MdwE=
X-Received: by 2002:a05:620a:4713:b0:7d3:cec3:3ff with SMTP id af79cd13be357-7d4295fddb1mr179162385a.0.1750862326384;
        Wed, 25 Jun 2025 07:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHsbOpyUO4OQKuHvZNG56/kH2wg/UDN88jgkkkppU/y2V4JJtDrErgvtJkUii1DRKOsax2AQ==
X-Received: by 2002:a05:620a:4713:b0:7d3:cec3:3ff with SMTP id af79cd13be357-7d4295fddb1mr179159185a.0.1750862325910;
        Wed, 25 Jun 2025 07:38:45 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4cdcsm1076068666b.56.2025.06.25.07.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:38:44 -0700 (PDT)
Message-ID: <4200b3b8-5669-4d5a-a509-d23f921b0449@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:38:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm64: dts: qcom: Add The Fairphone (Gen. 6)
To: Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
 <20250625-sm7635-fp6-initial-v1-14-d9cd322eac1b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-14-d9cd322eac1b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XAFRxeO27QQ-qe0Nx-XBz7-7Suc42j4P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNiBTYWx0ZWRfX35Z/3kiX/ggX
 p6aBRhnnZFAqJ2tYYa8iWHQaXyVi1AwohgCLFLPqMuIXupMXAevnmzBXAi4WO9BnLP2eeaCV35q
 I9Pof3xWGtLhGjOhu2cQNSAEO/+2ufV+yBvY2wk/zCdoTewo6bhNyZA7kZ5Qy3BXp14QTfm7BlJ
 jweo+Zl5GYY8FLZfwMoWEg5ayn6qvHyDktwGTaONg1yS5iXCN84Fl19T1bZM3Reh/q7IINvjc+W
 +uKDK3f6EUIcxdbLwiA0kxGZQPmWP++QCGibpT2c6ZnRYb8vCG0u//fs7565of0enI//Q8Iz1OS
 BGqx14ObHl20cgpQZ4zinAGygNccX8D5Qm9GlDx0TW1R7uowt00lxDzvuPxUVGlpWhraeGgM2dl
 XCdOpNX2GAIVK2mB6Ze3ca+8uGgc5St+kdbb1ktB9QRDalwM5dE2fzJHLKGCRy1E3R9+R+3F
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685c09f7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=gOtRruwUTqeMBgDD9hEA:9
 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: XAFRxeO27QQ-qe0Nx-XBz7-7Suc42j4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_073848_591662_CC414728 
X-CRM114-Status: GOOD (  19.43  )
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

On 6/25/25 11:23 AM, Luca Weiss wrote:
> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
> on the SM7635 SoC.

[...]

> +	/* Dummy panel for simple-framebuffer dimension info */
> +	panel: panel {
> +		compatible = "boe,bj631jhm-t71-d900";
> +		width-mm = <65>;
> +		height-mm = <146>;
> +	};

I haven't ran through all the prerequisite-xx-id, but have
you submitted a binding for this?

[...]

> +	reserved-memory {
> +		/*
> +		 * ABL is powering down display and controller if this node is
> +		 * not named exactly "splash_region".
> +		 */
> +		splash_region@e3940000 {
> +			reg = <0x0 0xe3940000 0x0 0x2b00000>;
> +			no-map;
> +		};
> +	};

:/ maybe we can convince ABL not to do it..

[...]

> +		vreg_l12b: ldo12 {
> +			regulator-name = "vreg_l12b";
> +			/*
> +			 * Skip voltage voting for UFS VCC.
> +			 */

Why so?

[...]

> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};

These can be enabled in SoC DTSI.. it's possible that the secure 
configuration forbids access to one, but these are generally made
per-platform

[...]

> +&pm8550vs_d {
> +	status = "disabled";
> +};
> +
> +&pm8550vs_e {
> +	status = "disabled";
> +};
> +
> +&pm8550vs_g {
> +	status = "disabled";
> +};

Hm... perhaps we should disable these by deafult

[...]

> +&pmr735b_gpios {
> +	pm8008_reset_n_default: pm8008-reset-n-default-state {
> +		pins = "gpio3";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		bias-pull-down;
> +	};
> +
> +	s1j_enable_default: s1j-enable-default-state {
> +		pins = "gpio1";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		power-source = <0>;
> +		bias-disable;
> +		output-low;
> +	};

ordering by pin ID makes more sense, here and in tlmm

(and is actually written down)
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

[...]

> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";

\n before status consistently, please

[...]

> +&tlmm {
> +	/*
> +	 * 8-11: Fingerprint SPI
> +	 * 13: NC
> +	 * 63-64: WLAN UART
> +	 */
> +	gpio-reserved-ranges = <8 4>, <13 1>, <63 2>;

Please match the style in x1-crd.dtsi

[...]

> +&usb_1 {
> +	dr_mode = "otg";
> +
> +	/* USB 2.0 only */

Because there's no usb3phy description yet, or due to hw design?

Konrad


