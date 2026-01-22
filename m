Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71DBD3EE67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehwO5LCRInJQM6vPkfsO0mRLXSEQICDcdEnsiHaqUHA=; b=Flv7W7rxvzKzR1K9osLMgohhtk
	C/PGE1AW4hZ8vcJS+YjgrDpBxAtmHHBCS5jF/PcDH1BevpNpZOczxf+UPJPXR0VItYeUL5ixNPX+/
	8WCboup2nlHlOKwY9PoCXIas53ko1ARA79r+A2X43o+OlMTl8fPF3rTQvKEEDYeufg4KdGwCTNHfs
	iuKmozoHrAFrghrZpd+6wa2bO+Dw5rZhVDz4z49mOK5CjQjWCI1LHXOh3FWYKOeDtCOTDwmNVCAEd
	JUjq/T2UW0FPqlAx4hAzSEp4lqFCe3z3s2ZpkVJwGHNj/H/uuXtoxPztVFKnC3/DCTIcGEKRvW5w8
	y8/DWQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuzf-00000007Aed-1X1l;
	Thu, 22 Jan 2026 13:45:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuzc-00000007Ade-2kco
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 13:45:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7VEjt816112
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 13:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ehwO5LCRInJQM6vPkfsO0mRLXSEQICDcdEnsiHaqUHA=; b=dw47YnyJtrDeJCM5
	wJYJ54TRymRwHwwKJneOJjUCyGQF9JLqOGdsQpImL93qHBZyvkqlUPDhPelYJ38s
	tbxGXr5uRXFVurgQRv2doRWiIMpZIqGI/xpILS9N7kBMyoFnHcANuS/ZuN/GMJBA
	1b1kyc/CycwTZ8q2rKyat7HXK2ebm7xYkIutV7/7UtTZs2OPGz61XZj48PbITt1W
	wEc2uFvBSVorZW9d/RROIUZ/3cVyB4VncWVCqsxm0MiqfThK4nVzdn3c8LDhmXez
	s7AXqXTcGET4VdKqSe9Z2l91enRGMQ7EDr3HpTzEponiD9dyNg7xfYx1NW7XDVWm
	V71cUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu65v2p2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 13:44:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2fdf3a190so16237385a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 05:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769089498; x=1769694298; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehwO5LCRInJQM6vPkfsO0mRLXSEQICDcdEnsiHaqUHA=;
        b=ZC04ItStGgHD1zyzDGg7dO9IRXMzvANlZk2IigKjXc1LlLvk6ERnSGOs8RRppoDGf7
         vnf4D2QJgqeFUGzPsQ7Go+yY783hIG7CwKAYxLN6rA3NsrQP+jVShwJS5dlrISmp/M1Z
         deMGczhSW2zZ2gXz5/ofNXlvKoiCp2BA36PjGeZ6Ff4j1QaSRrG7Kxdxi+7RbXOjvaVu
         BfdQGNGuvkKnY3bLbnSeOKJou4gPX/Y6rMDKb1Iho9n8+dIQX+vV65z0cOAPfao7x+oP
         xOJ8EikRqMLdv08pFz8m/VCXPSjVycQ53fWBQXHjPEoQ7LponVXMgjRj1wZlDm1gH2CU
         uLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769089498; x=1769694298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehwO5LCRInJQM6vPkfsO0mRLXSEQICDcdEnsiHaqUHA=;
        b=tAVHZ9StMS2a/638Y9LhM1E1Ur4U9xs/qEx9+cx69UATCljQT00cnFNkpGU6COVZYT
         3K/ts4WldK0AbmCM6oI2Y4qDcEogX2KZAJpnf0Lh//Zym7g5E1OwDGUo38l9bE4dlEtf
         SxPRF6mY9oQCH0H33s+C2aPvOqf30jG09LoVSmDD6sTyM6wovVHR1KflOyqsoW7RA9Yb
         mHEoSWlRj4G8z62JRWcGw0FBtQKZK5cUW1y/zfNAAaDcIUkuKJSwdtmQEM6cuHERM/xP
         XAcb5tBszbIjmfN3Hra55cVPGoV7TSsFj7Ps01LEM/Xd4fVlydb8NpyUc3UzjWUe+5Pn
         jIzg==
X-Forwarded-Encrypted: i=1; AJvYcCW+YZqHumORX3sdNZTeqZ5aaRW82LKBgVT6Ef+Rxur7xItj9BjfF28vfYg0i+NDJqBCh7VVWDuII/3/iETYTGkI@lists.infradead.org
X-Gm-Message-State: AOJu0YxP5zDx0SALcv3qmw5lj++Gkx0kY7yzdS1B7JP/eKnyf1HWVidm
	PRqYWGajoCzEPPGKmHOVwLVMz1vIs9AFj0WEOyY123FJetRgB0JtjHfY1CRUov6U7J1XoB6gEq/
	EJiRqtas1hcwrtAdKoojjixKLl0HBHwjtrejLcY2BnaPcpOx25s0q3COdRYZ8JqUx0t4v2/xykw
	B8pA==
X-Gm-Gg: AZuq6aKXOsbj+d9t3UQaFJwkxftjQOUEXyukM7phEpeUsJ4vzEBs82tqZ71bc86iUDT
	eYbFqwyrf9HhYpWoDej86q5A4lr+4lQvzwK8rmeNN6oghVk+Xy+ZEq8ej8h+VE4DksTDDA2htoZ
	W126vxJNk/tnDHK/qsa43lvTt6LCRlvCnrQWA6C9/1G2rKQTO2g2P2FSaJORhxrVOyTKRMVwYdU
	TJq8rMbCKRI3Mws+IXz9xGH35Uusmq2ThjcsAnvf5v9An+BeFiaPnBNb6h0ILz7KbM4v/vbR38g
	JNJ7WKPuXS0NBZEkoTJTU/Xd8YyiAGI/PHAGsRMr1vqSzzSz62shJVhf1T55WwIIuy7sjg99H91
	Pak+b7mVlvu3pEiUK2Y7mEpcGHNuWY6T0L/u3E04y6DEDbyeihDpl1SRdL7/UMXQJy1Q=
X-Received: by 2002:a05:620a:4710:b0:8b9:fa81:527b with SMTP id af79cd13be357-8c6a672694bmr2200107785a.5.1769089497716;
        Thu, 22 Jan 2026 05:44:57 -0800 (PST)
X-Received: by 2002:a05:620a:4710:b0:8b9:fa81:527b with SMTP id af79cd13be357-8c6a672694bmr2200106085a.5.1769089497144;
        Thu, 22 Jan 2026 05:44:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65831de21e0sm1129568a12.28.2026.01.22.05.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 05:44:56 -0800 (PST)
Message-ID: <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 14:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JZE1yBSHwnPglsKL4MY_WTgTHra0ZbpA
X-Proofpoint-ORIG-GUID: JZE1yBSHwnPglsKL4MY_WTgTHra0ZbpA
X-Authority-Analysis: v=2.4 cv=J8qnLQnS c=1 sm=1 tr=0 ts=697229da cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=fwfv46HyQb7ozjPenEcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEwMyBTYWx0ZWRfXxVdnNQ9jzj1C
 pl6P6XbSX9SbC05ewIn0moPTAAcskEo0Q/pyPES3KjCMddvtOteF42s3Zc/RI58FcjgimE8JXZ/
 tdXzbD4Z3eDVWqrVMSi9P/bNIM6OD2vG1uWHn5p44k4tDxQF08vMEZ22Py6VAxODpw2o2FU9W1P
 Y31M1LXEezgDtZS+tvQCgJY4EbWSrd9/DDAkdKRKMoXQzxm1wLL6yCPRMDz+Ou7yymadHDi6IFw
 V6FZi8WFMHal9OU/GSH1FM3z/Rzuvcv3NqVT8JISJ4bnItdlMxtbOj/t6FMGc+RNU73cmRdnVN5
 PslFxcPpbvPgTVFk+Opd2cW5w60YWW/66XqEZ265g5I2zEHpGNXkq1Lr8Rca9mFcT/fQhOHRgbp
 GzDLVaVgTLboQNjKjjayCpbDuY9pAEaPRaw69cgOq0ulUwvKldQdjEDx9RzHbYeF7qkGspwWvYF
 HF0lp+iHq85+lqUeP4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_054500_790896_CD319D94 
X-CRM114-Status: GOOD (  11.79  )
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

On 1/22/26 11:48 AM, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

[...]

> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;

Let's define the pin settings for the reset pin too, otherwise lgtm

Konrad

> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_s4a>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> 

