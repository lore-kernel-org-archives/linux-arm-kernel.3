Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A81E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7P0lT5CU0pXRpSIELwaVuf56/lpIFAAE4uyri3Arzm0=; b=0hjhDpcG5poCKnRcOCYhGZ6oMg
	an39dmgNp/VErQCnr6jHTzVgA+ILjnLeH6qkgLXTjNZBBbVDsnet74dKLqjZ0aoIlipFz5uxAlLIR
	ozHHdGLWsKFvryJwo2ijYvCqpaFHXoMffndRGGUFORvQp7HTMcEhhHKvfJJ8Yi+iIF8eS2nhyEk6/
	BKPNnKx1l70m8jfOco3TA1D2Y6Fsm+23ni9x4s61LzxGA+j0xbf6Wq4EUFgLV0QUUvK/Fka4f/yWa
	DY74OYW/0CuVZq78MtKdnmPBikiT/foydCxDbt9gGvRa4BHUFAR3++icGuAAxdvaKAUb7qr3s+lRi
	cEPxNqbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLop7-00000001dIU-1Di6;
	Thu, 12 Dec 2024 19:26:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo00-00000001RDR-0p0v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:33:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGowsT015012
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 18:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7P0lT5CU0pXRpSIELwaVuf56/lpIFAAE4uyri3Arzm0=; b=L+aVZGCh2stHV2W5
	kCKcATDhp6Ty1c0xLKj1DE0gq/wHEIxuFLwc1RShbIkg2Ht4GhxQ9oJaU9cUAejY
	d3d7iwj7HP6rF/k/dw3lM9V8l2zjB9YtTWvtcmhH3/cciOvnqu1f1jciuPD5o5/+
	H2RSroSdJfH2KSGr8l2ZQnWkf8eHGCRKRfXyfkfrDYv0NsRh8vjUMIbkmHskpB0Y
	692uc1sqjjSAypk48xkBviIPJCEcy50zjH0qKzpN8m8cMUgQ3Kmy611093taRyuh
	LSzauJ32RR5WQJ2EI0/cnXAjDVvnrO1Y/NeWyNQKy+dTUmNhoDITrBuGaq4RFfnz
	xhx6xw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f7dpn692-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 18:33:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d904ac0ea2so1547696d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028398; x=1734633198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7P0lT5CU0pXRpSIELwaVuf56/lpIFAAE4uyri3Arzm0=;
        b=qlmpnp5y/qaTAIGkUHzlxie5DsXLSeKEls8k0CF/M+lORwHLF1TSPIisqQK/OQouBq
         F6ewYfFf+G7/LIZFA/FrUWCKQNOGk5GdnjAMkrq+zR2BU1yxg582CCJHOVph5WesU9Jx
         isU9NvXcbtKmhW+3YU4eSMu5AW32XPF4DHpPlvw1pldjwhx1ZL+H5Ui2MS4b9zk4NxaT
         8nbqpxoce5+6a2Ag3GnMSCU6eV/HkjvJwL9UsHPsARBaAt8OnneBXuNELZGJvRnv3jha
         AYUTTqth3p4k6CXrv8y9fsU/7EU90wIg6gBjXt93w3QHPHxnD6yjM7xBMiK0oX9AlTI8
         wryA==
X-Forwarded-Encrypted: i=1; AJvYcCVIkFxgJxnEtI9+If8Ae3w9ethTi48xw6+ASzxKGVqr0TBzvC3dqJrajm9A4pYhUCOPyfWrVnVf+ujgwiMvG5jQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyzLsasjLrFlE9rnlpioPVFJnxByeHjnTaREQeu4hUjC8QTOWDV
	2XaIthTSBjH2pHfVelNQMnjdZme46HUz13MirH6aP8UrT/aaTo8X/ojfZmqC87Zzu4ofhzMSVFZ
	kbRdaIadiMXWIIjl+hWrUsWIVMYAeZbFUnucdLkX49wyRLBpsiTUn9PtPZ8cy8QFkVzbCsT5lQw
	==
X-Gm-Gg: ASbGncsSVrXAKOBDaHSDjpXcesxZJCFzAYmJ/U/OZ1eU9UV+GiKorBkjAAlvHvN9yUP
	B2Bcqukw85iUI6nbkneN2NzhiqVBsLakXoLmijjn4owN5buOnsvAzyCfR6m/ZTnJ87OMU1o03aK
	5yEUv90iVFCEptlwbkbmXnk+oQQFrpnUcKEjoFvIDgg+PtVLp4MNVaP3/qMt3ku4d5EfLV/cklF
	ePFJLsR+oIVLa4ENbqhvWm/oKblKZxJiggNiEztREc8guOANHNEJ6xCgZEJmJBnJdtCl/yThhLs
	pJDs+57rCnZM52m/u5JlZ9BNc6yylVgOhJh7pw==
X-Received: by 2002:a05:622a:c9:b0:467:5fd2:9963 with SMTP id d75a77b69052e-467a157c299mr7693041cf.6.1734028398523;
        Thu, 12 Dec 2024 10:33:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+5d8r2euOhZpYPGkl75/hl53j9+GKYqvLkelPut+0NmoKj8nha2RmqO1ELxeypwqRDcftCA==
X-Received: by 2002:a05:622a:c9:b0:467:5fd2:9963 with SMTP id d75a77b69052e-467a157c299mr7692831cf.6.1734028398169;
        Thu, 12 Dec 2024 10:33:18 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa671f1482asm744364966b.107.2024.12.12.10.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:33:17 -0800 (PST)
Message-ID: <0776a26e-56cd-4838-9b52-210ae9a1f281@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: Update IPQ9574 xo_board_clk to
 use fixed factor clock
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-5-a5cfe09de485@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241107-qcom_ipq_cmnpll-v6-5-a5cfe09de485@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lxn7KJh5iRx3E9xn9YFTGkREpcz-XYVG
X-Proofpoint-ORIG-GUID: lxn7KJh5iRx3E9xn9YFTGkREpcz-XYVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_103320_355783_C48DFFA7 
X-CRM114-Status: GOOD (  18.86  )
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

On 7.11.2024 10:50 AM, Luo Jie wrote:
> xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output clock
> 48 MHZ (also being the reference clock of CMN PLL) divided 2 by analog
> block routing channel.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 7 ++++++-
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 3 ++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> index 78f6a2e053d5..9a8692377176 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> @@ -174,8 +174,13 @@ &ref_48mhz_clk {
>  	clock-mult = <1>;
>  };
>  
> +/*
> + * The frequency of xo_board_clk is fixed to 24 MHZ, which is routed
> + * from WiFi output clock 48 MHZ divided by 2.
> + */
>  &xo_board_clk {
> -	clock-frequency = <24000000>;
> +	clock-div = <2>;
> +	clock-mult = <1>;
>  };
>  
>  &xo_clk {
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 8246a00a3e3e..25aed33e9358 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -32,7 +32,8 @@ sleep_clk: sleep-clk {
>  		};
>  
>  		xo_board_clk: xo-board-clk {
> -			compatible = "fixed-clock";
> +			compatible = "fixed-factor-clock";
> +			clocks = <&ref_48mhz_clk>;

This must be squashed with the previous patch, you can't introduce
code and replace it immediately afterwards.

Konrad

