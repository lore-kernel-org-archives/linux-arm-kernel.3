Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C54EA4E07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjo/kdQSRpPefoMLwX6+iCPNspce4EmQ1eua8UqXSEA=; b=xF9aZv6DXLV6bHzzcj1ADSOQud
	EjWcSgTsKAVh1OI/itfprY2h39Wqyw6oEuK8ogKNjUNhX2eMcWk/CDWOK6cWNtIXsn4hvpKLgFmXA
	tSAfTsV1pCIP8qgsBPTIsL+hYe7o6f6ta0w3T4DXjIaqHeHX19lemAR/6SQWcohC0z27LwZuPu9as
	hdl4tMf6fe1yBFddhRE7lETm7QOCmJ9bxrYIGjq2iNhckqPvwjP6vFD1NQ4iyi6GAu7M8iDN6rra5
	AHJbewSPfMw2gX1hu0NcEl8NsMnpz1efigUoZ0Bo6uM7XGP/kJruEBn/tSa14XxP6AB/luVxlydJ7
	HTIzSRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx47W-0000000DDUS-262e;
	Mon, 02 Mar 2026 14:19:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx47T-0000000DDTN-2XvL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:19:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622B3egL3862850
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 14:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjo/kdQSRpPefoMLwX6+iCPNspce4EmQ1eua8UqXSEA=; b=RGeUqWTVOt4Re0fA
	Rw6mJufAeAi28bVyMVkohFE5iZY6p6n0as0LiN73UTDEsoZKYEp5ZCqFWswmT106
	Td5LGDPwwjcuZG8GJQEI6i/P0ijVSG+Fu8iy4sFUPBrsSeMU4ZwZ8xLBGtmeq1BM
	dzgZ9FVkL2ahEuOrhHaM1PuNEkNXdcQ85GJpXQDyxHLUtQi95wK/XblaRoTugFgD
	v6AgbcIR0MEuVA3mtTJwybgNBA9BcRHOKpqWs23pS3GBRFDKWtPd92C6wHav9wqQ
	sYhfFK8xTHknlr9iWUSjsA1fEohCcZ11Pstvv1O+3VGjlCUpJq69xhSPyleZH3vi
	LUvOcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bjgj9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 14:19:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb39de5c54so420757585a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 06:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772461173; x=1773065973; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjo/kdQSRpPefoMLwX6+iCPNspce4EmQ1eua8UqXSEA=;
        b=Yxwr2CH0hE06MFOd+QvXHCZounbqOboaGY2fh7aZVcOnd9yw7FMlxuYhQKC3GgCwhL
         WGJfyZ2DIAkqaXDm23q+ILuxuuet/zJcpHpJF5/howp+eosTw71KxLbaf0rHPhJHvEYI
         f9LmJH+QKanUGmysPCC5fv5Bn2UBYjrG/vJjwAtir2bhpQCa0LdCnjmPUX53yTSNtNH+
         v1gTexnJadZObUzKQkFibUDPYwntH75b9UeJDXBfnAxu6V7dVcDAfhm4ZS6f2uYnPRcm
         YaEhwqyemdWu5N65U60dGkl6wyDiAUeyKJ+AaG5GuGNwk6lQH8FAC3ka6+ZlNw1k943v
         SXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772461173; x=1773065973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjo/kdQSRpPefoMLwX6+iCPNspce4EmQ1eua8UqXSEA=;
        b=jsUm69liIzdUWiiBUBH0lXRlA+ngAn2kARFx0b2zDELCMdF6dbX5/FmhFyoMjBwu/7
         stXs0lspTwNMbHX6kCZVqI6pthm8oe6BTwEJ68CJIQ+Zj4sRKF3MW5c6gdV0gofuJ8mq
         S4r3G7xk019RUg4N7lFM1j+hn0DG//PL++YT/bk5aZ6iT8LREOlTwKxafjtY40SPbBKT
         I3Y9oVhULW8Kp1+++6L8EwT6cfilHVEIvGASBKlJntgRDDoTY0mAJp4cRZey7FnDbb5S
         k/++QdDKAn1oLh0oU9YkK78xOrmUaZmo+Np8WNnKHk3YZNqMG9Ujf0C8c3gQEwFPn0yo
         0zDw==
X-Forwarded-Encrypted: i=1; AJvYcCXWi3m8V5nd3kE2PEm34QyxM7S0AxrCywvZJNsj3cMIOFYVR1LCa9n3YpCt82Accrf4ac1D9gm+npa+ChNzmrGf@lists.infradead.org
X-Gm-Message-State: AOJu0YwcBb7Y1kmtv3Evq+JRLHuW+1dsTqbMA7pUQGqKn4tfQm8ja7HP
	xpNK3lMDBFArAd6zaPzYstMOxBK+zRl3v60R7+whe0wdk7VJsgUOBGWrj4AUom7J6SOkkuTTUG7
	uaoM/QhYZGOwhGfKyRK6f2RjHVQhMI8x7cZHbgbiXn/RzZp5iOLPuhL0/53520tgw7Zjo1xm2xj
	KhZQ==
X-Gm-Gg: ATEYQzxm3qdFu2jK4BQBgS3RQqrht2RkEgBAHDwBYGgK+rc8Ievz9MI83loPGKqX18b
	jlXoRqAbC0DmLNlDiz8dIrHFXBfmPDdSSTQjK5+d8/t4sINPl24OfWQep+PWdp37iJ6V7AEyItG
	u3inwcypAlyHKOxEHx+wvfBX0z9oJi3VAksOEHPjkCyIzSOEO/A7CQvyWQHRG/D00YnPTUhUlrw
	03GHv7ylSqT9mgbt/aa9ft6KipncqvrhVET3067GaMZS/Q5Mvkii77+DLXoE2cd3Fq+VE74548m
	+vCUJJiNYbR3zg2JQy49V3JejmjPpuyYWlOSmlSJmQL728hKIVG4MWzgkzUazxXZew6bm9UECvo
	bF18VZouMmqxHk2ZyjOK2u1KAsqBH0BtHvHZczzCG3bwdfwq3PYtasEypeGndA/LCieKeqtEL85
	/bGJs=
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1228837585a.10.1772461173126;
        Mon, 02 Mar 2026 06:19:33 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1228833585a.10.1772461172660;
        Mon, 02 Mar 2026 06:19:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac07c09fsm3499457a12.32.2026.03.02.06.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 06:19:30 -0800 (PST)
Message-ID: <9cb20af1-c2f5-4511-a066-24bc689d2fa5@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:19:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
References: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
 <20260227-hamoa_evk-v1-1-36f895a24d8f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-hamoa_evk-v1-1-36f895a24d8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pe7yRyhd c=1 sm=1 tr=0 ts=69a59c75 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=__G2b6sp-w7MuTAc3JcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: L8A9n1L63KVLKnWhqD-Ljw6VUST8gWP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMCBTYWx0ZWRfX1RVI0vvcf+2m
 GSdyb39lDZAxNzew/oHVDaR8Um+LYqBzI7Rvin4WChGCR4NmqJcOP1OMyDKxSPoAYYPdwvPv+pW
 7wPZ5wKUsYafUz1I7a1UfBfbUxGpbGWAbkFqPcjll+90ItyDOdqqWStQ4NcOwey8jAbwS8p82md
 hLsokKycNVQC290N8CVwWCbJN2bI5culKmcdT0uDGr0fZVWQXuA3Sdw7txzjy33nOJlox34uKCv
 Xq2ktyyxR2vkQaKgC9QoE6ygurnAiHGA7CDnBIUQr73++TkTN8gPxw6S46gKpThs5OKHf0qrGnh
 tDRPOggVe4+wv7QfsorFxWqPi0CXmRdXrGWjfmkAI/jr9G/H3SF8D/zID5L5xhqJSxsDlty7oLr
 UqVQ1v55ot2m21wmFodESpsh0COOaufqTenyCYu87rwcbk+FtZt7BKgBaprcblwC4EN7spCaobS
 EK8gwN81Wkxp74n/ZCQ==
X-Proofpoint-GUID: L8A9n1L63KVLKnWhqD-Ljw6VUST8gWP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_061935_770340_A7049FB7 
X-CRM114-Status: GOOD (  17.62  )
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

On 2/27/26 6:29 AM, Wenmeng Liu wrote:
> From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> 
> Add pm8010 L4M regulator which is used by Camera I2C pull-up.

I think this mandates regulator-always-on, as we don't have a 
better solution for that now

Konrad

> 
> Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> index b8e3e04a6fbd489f66bb44a02aba7b9746f30fe2..5d9af325c931ebbc9f3f8261d427a31e6da090be 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> @@ -376,6 +376,21 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	/* PM8010_M */
> +	regulators-8 {
> +		compatible = "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id = "m";
> +
> +		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name = "vrer_l4m_1p8";

typo: 'vreg'

> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1808000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
>  };
>  
>  &iris {
> 

