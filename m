Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAF2CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 10:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/lg14/r475DGELb27M6yUVRo8Ql/TshF6yOFwLnhUg=; b=aAOB3ZbQihXnDVGWRSb5PK0EgX
	dIVWeeJsnC+mzLVZkugeT+1LMp/jbyXgdsnZ1BZ7IDHBFs99iT1tlrPdx6dvtSG83pF8z0QBBwrke
	uEFNcOG0mJ+kcXVEEklk/ziorayxPhqqsp7j3ELZVk3knzvIKQn2dCrkVVaB57qT149HF3u9AhQbN
	BkK6G/VRZTUr7s8XXLkth1vq5sZNxr9AapSniNF6ElkqTKzLCBTe7lSz57UVfNkVsNs5vO/yQ7MkM
	bt/sFwnGgWhGW8lBDhO5jShKlqloLqIbLYaI2vitMYav6nh7vTrfyaNdkZ2AnAJBJ1Id9e/DYHGDb
	64i1jyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64Xv-00000001lNk-3bVr;
	Tue, 07 Oct 2025 10:03:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64Xt-00000001lMP-0kHk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 10:03:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59738kdG005144
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Oct 2025 10:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f/lg14/r475DGELb27M6yUVRo8Ql/TshF6yOFwLnhUg=; b=Q5NCVgywT30LklDy
	PsufD/x4ImyMgiRyRIF4Kje/tRkngmJcULOZWAUlRyqbVaB4EHwo7LuYha0cs6kb
	4WGJE2YBaIINdE9BC//R+CfAGNG0qPt9BQZPpriiYMKzpbWmIfGDroF5xXgo3q9F
	OQoVxmu9wT6N1f4PEodHIa/4ZL5rJykwzRHjIiZpG7QaCf+PKMX88UK8T/2sTj5u
	D2EIj21q9COYRf1sfT2ulpGin4SFh30KUJSWlzc+QtLouop3IggUNOJsqjiBPYcW
	JNfFU8bpPJrFTmQZh4T99TN02x39FvQx/k6SdgAoHioKEsKDp6dARtpai9j1WkH6
	hnSn8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn755b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 10:03:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dc37a99897so15411761cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 03:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831427; x=1760436227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/lg14/r475DGELb27M6yUVRo8Ql/TshF6yOFwLnhUg=;
        b=aQZBzionuEZ27BiyaADvn7OD3nfy9zVHUPm1TZSRZBZ1ry0p75E2KShNa8Gc5donMJ
         Asj5r3pRhSCfVgLxFhcEUtbsSB2nbhm9Bb5TA5zVVXXqc4wf/uuEOJQ5J0UHqRQ9L+1S
         OlBbtkekxvP4pohJJ3t0gE1ojp7AKHKmlmVI2ppyW/vJPrBoDJmQKVs/JM0HWkVM9aUS
         JpjHR8GmZ8nM6bzQGgkG2mejjzEVRQRIOG6hRKbvXz4iAvGn9bmmQpK0rlMjkURrS2W1
         2KW7uFtt7tjxiXeHln0cwSzJshhbfyWTPaYdX34Ibo0kl6qTiPoghScl0XoJ5460eris
         AstQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGjiRqnOWZA+Ngiw9GP/p6thtzdShfEm0wB3Wx+t0dzceHBRPbVg4YwFVCnYMBcOdZ5oSGqa+68Kc0vHkJ7KdV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4NWpN0s5VxUgUC5aXsUy6IycXlYd74PfB/hCwnuaLp1Swq6Em
	EPLdSidwv3a9w2HLn37FRVY4PmLQ2hFVrG6mR6PjbS+UaWJ7gut85KKp16tbDgJ2a8UYSUxzAfD
	y7PrwkBUPzaHUsKpjdvQ8qpggEUIsDk8C99htwc5qCeOI+HUD8PJ7siAAP9ILi7uA9kfqosU42K
	U2CQ==
X-Gm-Gg: ASbGncuQCICtgMu5wBezMWFbW79+PVBoyx69O2KuRFPbbeNpOV98OXA5H11gPNF9Ciu
	u6J+GtQKJnI5nO+LVjRnmkb7YHuEYb7MnshnqsON1UVpi7oF8LMusYsJb3cB0GDYW/XAkIzHDi7
	BsJeLlhlnKD+8BmegS5bVnx2XtdQGtHw5XbSWsuJ5eZ0UC0cj9mkG/ycgsavdjaWqAFWcrUpFAM
	Pwl5osxi1wCPF3iK4DgEMy2Bs2Xq2wcW7zJPz3zQfrsHK9aBk88H+nw79Q9WcCmAqxl4a++MH67
	ZAlqxzWtiNAEsAWRTIWUM6l/zNFXUMN0lAaCTrhucGMBpF8uQ2XJXoxeC67/CQ82MWQB5yx/iSP
	V0rAlpDkdG1DcejpmS6FCti015Nw=
X-Received: by 2002:ac8:5aca:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4e576a98c02mr133841741cf.7.1759831427345;
        Tue, 07 Oct 2025 03:03:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhzCL5QidiG6adlmbwtbxC1CmvVbnE5VzUbfzHUGrlHgHy+0vWMRsnW7JAlRR88W32mvagWA==
X-Received: by 2002:ac8:5aca:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4e576a98c02mr133841321cf.7.1759831426898;
        Tue, 07 Oct 2025 03:03:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4f314sm1340878266b.69.2025.10.07.03.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:03:46 -0700 (PDT)
Message-ID: <99bfa340-2164-4df8-9953-e65f9cee7709@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-2-53d7ab3594e7@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-m8-dts-additions-v1-2-53d7ab3594e7@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX1nUHT3vwXY+r
 BnFz0THUvTx+bgY0ftmv02rNtMbjEkBG1Yus/TTMKEontx5ksPx20xt56qTXzkeuMx1Fxax4yrS
 Qgb9FjnJED++tWN8QPW4yBHsavIrRfcxjCxZnqGnheuA3wiAmLC3droB8K29KnWYAMycz5SuvSn
 oV2u695EDNf6L+oSH0u9RGkcMog4EM6A/34cF7+HGFoNNw/IvaJr+sN6XM3GKQdjbbzg6C+waNg
 lmTcbTdAUVoDs52kZE41wYN7cJCAIoxk/RXMR6EX+OUkTF88JwvGoBsaJhLtqRDllr7+qYxHrJS
 +XkFlaoLM7YYWU+MDdkTMsRJ5SL0erT9TzmaOnTcZ/n7t9h1sMVv3XPt3+edQKaoTEYNuaqrxyD
 wfhHijHXUGilWmT7jZgWkkUqRSrrJA==
X-Proofpoint-GUID: GjBBeJI87Mfh6JjMnLQJXOBkAZYggLuq
X-Proofpoint-ORIG-GUID: GjBBeJI87Mfh6JjMnLQJXOBkAZYggLuq
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e4e584 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=8poMKPHdAAAA:8 a=2dNuJvzwNQBdB-WvFZIA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_030349_336638_CF8A9B95 
X-CRM114-Status: GOOD (  16.70  )
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

On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the NFC chip used in the HTC One M8 to its device tree.
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> index 9c3859069aba..4026d6fedfbe 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> @@ -65,6 +65,22 @@ vreg_vph_pwr: vreg-vph-pwr {
>  	};
>  };
>  
> +&blsp1_i2c3 {
> +	clock-frequency = <384000>;

This is not a valid I2C frequency

Konrad

