Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C48CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+ZBZUukYW3UATRdgCDpkV2aWJmXCVShzbz3nEXQmKM=; b=veLkKODsO05mFZw/fHxf8L6aW2
	xfDOGygHxH/1isPQ85iZhXz90FctNCmHR6RacSYfD3eBBMGY+WBTukQpbbyrcL0Pir/IzV7xW8vK5
	2U9gzAlffF/t/EDZTBea+iBxv+C4xjva3NkcJJVC2Q02Ml3g1Re3lXQek9yM4WTi35FLWh2N7fbMn
	iteL4pK5pYd9pZ0GNowGQOgLOUd5gTRKnJm2B/0McbqJ/nsv5Erc849gCHzGljVJ6wXJyf1IauiuR
	dsCjFQlYh4se778Ik1hSW647ms2Xlw9Ni38LeeBvzErZH9BGkZV69duolSPWI4CDhq1f7+r71FIpk
	pIhPktTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabHE-00000002h2z-20at;
	Fri, 19 Jun 2026 15:37:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabHB-00000002h2c-2dUT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 15:37:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDC0cN556566
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 15:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+ZBZUukYW3UATRdgCDpkV2aWJmXCVShzbz3nEXQmKM=; b=NTEjpDPMMF3fClMq
	99XprWICtZJqKb5hCefZmSdGR+n4Vkjm9DPB8qEYu4aFFUqW2+3wERYRO6NZ0K8x
	/CEeFego/qLHer9/xB+4BypzIfgNNXuTCrTCaXilPy5mq136KVEOcvXNaRH5XvN6
	HldYzixLRRiHk0Y56tfhsC7n58hRLQxe00jmpLmO5nw0vUwIma1wZAclSEFMqHV2
	NSrx1uZVHLd8R7FJjvQY8RTQrPCIqx3hZCF4Z9dAHvAGx4KPp9LcAOBQ9z+FvQ5s
	TCw8URFrGr/P+AC6guothYIFhpWY/TVtHZ+gaFTl1W46sULmb7p5cgr2Hav5XWPi
	gLJLnw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyuuhxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 15:37:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ded0d4d805so1502756d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 08:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781883420; x=1782488220; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l+ZBZUukYW3UATRdgCDpkV2aWJmXCVShzbz3nEXQmKM=;
        b=ISA/RJu1kWo0uYzwVmbUX5MPzxKlNsl21Xx7uhAPnpVtRPmTCkCm+KlWIFHU23tDH8
         2k910ca61+yOuorchyAkGlTMwNvfvU7qC+ZTBOiRZZVIXWXmmcgyQg8rZMaPqTSBHnVK
         /j7CXB22x9CEwlmw5jXkj5mHiPAe6q4NZINs6JNhij5knVAUBDp44o0H6WIrUzTkvSJY
         wdxrjjyUxismDMhzoFBjW1Yc4DDQIHmgAZOTV8ViW4+vS5u1KaBb39C3hElOIyaU4AOk
         HYPzw2kZ3Lrz2l/gbv93kLl3VzF3xLNzQUq97PhOaE5Azgc7pFJWqsUJQbyBp3jqiqKd
         3oFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781883420; x=1782488220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+ZBZUukYW3UATRdgCDpkV2aWJmXCVShzbz3nEXQmKM=;
        b=sH0bf9VsANsWPqVD/eDgMEY81RO13qv2sd+h/OFmri6KiKZwQkU8Z7AzdeAHGd6vZU
         TeLERgthPh6I5Y2B8dQC45jOnNgYpzmMyW8cxjLqJ5/YIJvlr6pki0pPwsSvaYRDw6DF
         m6SgBDbHFhaqbs345z/6lbT1xG6GYD05ZW0v5H4ajTo2a+0n98j59sIdS0NC7fODKuwH
         bbJ37hpc7TAvbDCW/UicH6IAybcYd02SK/8Ur5iHNx275hBuiPUC2InlGTZkiy38Zjlb
         cqE/pFDRVs1y9KZEWPhAStzKI2dxRvQ6HH9EROistAAv392mox9NDktJEY5RnQY+CSjO
         JhxA==
X-Forwarded-Encrypted: i=1; AFNElJ8RjkolSvliv60uSQRGM2VwA/5LbXhFY0jiZWpaN1rSlkA5OEy5l1xCnhn73H851KwfpX0k22WKCC+p36dQB/Gl@lists.infradead.org
X-Gm-Message-State: AOJu0YyJO2C2xwMeg9FltT49ll1sD69IFq6SeVcCANHKcFmTGt2x/Ugf
	H9eK4fegrwRjIIIdNoSyOcPdbsRlJ2O+x3+bLra0NCMxauFh9wt5QnClLoFqkIIBufgD3N9qhX1
	V3n1BzK4a400tvrf1GigusfhtOLYjWtbCQI9EbEDrgZLxnCyuEx9MFNj7URTKK6LK+plJu7SU88
	Gl8g==
X-Gm-Gg: AfdE7cmamvt9Wv03RuGxaNxGhPt9G1sBiurRfXc1BihRglHj9+eGdm7EMTa6hAqhyYE
	vdG9WKtgimW0soHfR3kGWg0RWKaW2vFjhWrr1q0q/GSwNpcq5R5oDEmdwy7GY0GK9km+Ns5YdOY
	x4NntLtusYo295FUPZ+PCkjfr6qTy8tLd3K3Mykq62AU3UgqLyqqmgwYSDlNyZsJamb4axgGZWb
	1XqzRiQzhk+pEP1ZlPx8uuP+eIzmCsNzfHDydpnMOD7Y999G4ODEZeVrF63dBXfnVZOC9wVZ53N
	F9DlqS16WDXJa+bX27Umc2o8Wjicd9pEM+CsJqoKYrz6/VDno/w67r3EDeS4U1wR1BFl2WxSNM0
	FSYp341aJLQJ/D9PdV9okcgqggDy31luBMFY=
X-Received: by 2002:a05:622a:1393:b0:50e:487a:bfef with SMTP id d75a77b69052e-519e4a25406mr39022001cf.2.1781883419818;
        Fri, 19 Jun 2026 08:36:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1393:b0:50e:487a:bfef with SMTP id d75a77b69052e-519e4a25406mr39021521cf.2.1781883419316;
        Fri, 19 Jun 2026 08:36:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696edc76242sm1042750a12.4.2026.06.19.08.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:36:58 -0700 (PDT)
Message-ID: <6e760884-87b1-4ec8-9ae1-e53901451b65@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:36:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: shikra: Add pin configuration
 for mclks
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
 <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX9r1BOIy8QcL8
 zEn9n37Ubws0pK1cd7iJl+VVFXX4q5BRDhviyzEREqHEAJalI0G63bY0j4lZwcco2XXp9vHvvKn
 jMm3X+VYtE1xNsc3HHCZI48xhlKFanc=
X-Proofpoint-GUID: z-bnzQN8UK3ctiEhU6WKZz5T9_VW9xrC
X-Proofpoint-ORIG-GUID: z-bnzQN8UK3ctiEhU6WKZz5T9_VW9xrC
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a35621c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EY8lGxjS-5OGnG_HtjIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX4lLinGtc1Zf+
 ej8AJhzf8OG4cpJZaxFDhaLWJpCH2ukmnDuu79TW+CResRDpb4yS86gzET65RCXJNJTgVdVMeuD
 wmKFyI4BpER5QThdGS/DSb8fhPwk9kUIBW9Ge+kZU0mlPyl0TfDG1+QArrX3t5vh1HxWwbRQKAl
 tL6u9vCaSTspuNyhy/GpJBtpFJR4eA1Y5qZSeovWIIFHfPiKln0jNukhEi89uaMEVWJp/0cE8r5
 XacxVx/Hn+F5fvrtGJoNMT+nCZmtFnDUyFSIV5DQvW3J8kooFheavSPfvMK2IKOpziTMNPhXHPh
 qbHQyNopSoFOMIcxHMFiyKDXZNJBu21nCQl19Kqph5D4PX823RTt5esktjr6PSeeqPPyQAYJwWQ
 Yt1LZjhTWh7VwInA0ljoNeX5MCYMYvaLoA8Hdcx4r7CT1G9k5f2Udi7AI4dQI2xL31/bV/3rz3l
 ZaVQ7t/wkHgZlg8mfyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_083701_792520_56401084 
X-CRM114-Status: GOOD (  15.65  )
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

On 6/15/26 10:33 AM, Nihal Kumar Gupta wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 57732804a6c6a114a407a4a541a1cc7af7635ea2..16b547131e8b14541abc68ff7cda126ba777ad80 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
>  				bias-pull-down;
>  			};
>  
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio34";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio35";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio96";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk3_default: cam-mclk3-default-state {
> +				pins = "gpio98";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

Please try to keep the entries roughly sorted by the pin index

For the entries themselves:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

