Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91890103E160
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUN6NuA9E0A6Euv+7NTzfaobQJSV6Fe3Lnfqqc9SXAY=; b=eRnwHSe468Q/gNYR5SAhV8sAFi
	o6zwcGNflRiaCFlx3XQJ2XHs8vkDZ3A2DDXmxyb438LJ4Sd7RVEMgisyfqa3gJK72WHYATPjLre6y
	dEcgCmlk59dYezOQAxybvKyYVb5Aaiur+RMeoHoKM7ZtOs87xKsXkGihicbMbiOqZvU6iYPUMbp6m
	E/hswOTMWLFTJmuctkK64IOrB5vnDcIwDZsW4VYN79UNp/wtkCchPWDe/J6BS/RxMe5FvxAhFMbX3
	jH2//I+YwFC587NXB8CFPCaLsZ4sboaLhPpkUF55tVAs4kIZqO75l1dzaKgP+O12lr6m1NYO1UYLj
	5F+Cpt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pP3-00000008LAc-1tM7;
	Wed, 18 Mar 2026 11:49:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pP1-00000008LA8-3FNw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:49:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9MvSP3358516
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUN6NuA9E0A6Euv+7NTzfaobQJSV6Fe3Lnfqqc9SXAY=; b=PvGlctYeeBT1dA7G
	RwPpFl5T2vcc8r021RTxtqtq8x4jLuHXSnWRaHaLjD5859+tMWClat341bT7mLXP
	OmjHRXJFqeFGlNuwBon+fUzODu0HXpMoLg+r96wcf+r4+yTBcNpQqhYwOuVTnk6o
	GBhYXoOnpaXUcMG1GBXzSJedo0Fix1cVN4uHfl0Z5zB4eQITkl5j3W2mrZclLoCg
	lrqZptJ98MQaWqY6M8tmLSuDqE/I+EFgk7N9xGGJiYz6E/fp2Sy7zSNPFISfmdfe
	kPUqZjqrxSoItgY6CZ/KfYgo5gB+S+uyz1UaOPXObjYhyv+7vLfyQsw17eQu6hy7
	XZ5Wqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb0gq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:49:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50943e69b08so45867361cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773834570; x=1774439370; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUN6NuA9E0A6Euv+7NTzfaobQJSV6Fe3Lnfqqc9SXAY=;
        b=hgBEor6CcF0u+20baYMPqOurEKG2V8HInA2BzI125bk6SjIVDPKPRZYA5O3eXmer0a
         jabIizuv8az6qm4Cb5NPRe/6zq9P9qw15NBtULR2xRkr/h2mczHyPdl0YjGsWkf6LKrt
         cJwUALe63NVGRJlNkoEuEFEKRnYrVjGTEZfL3e7sH31xRQV64KdBPybFKYI1u9aq7o1S
         NnUpv7j49ZPdqaXYlnKZ7EUK/lNggN2FfeX9uHohTgftxPzSBmzH81l9gg3tqWmd4pRz
         aFgypea8hfFLsQW5MvOYnMnZ4liyFqdD4TLBah9E4nnsZWRFNr+hn6+Blq55GT5w5qkG
         1t0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773834570; x=1774439370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUN6NuA9E0A6Euv+7NTzfaobQJSV6Fe3Lnfqqc9SXAY=;
        b=YtZElpc2Bd1+3gY1H6MGco8mOUL4X7WfznDg3Lr8he9oz6Nu+gk6lWTQ9GOO0l+TQ6
         DdUW4/6tr2UlC4YuuYa0i5rwZ1QCaq8I2lhzbAAxoz2KFeymQ8XEMcDtv88nBVAzz8Jh
         ITYpVueGM6ifHxkGWZySeeGUuijI+VFMZEzzC8bpHGwlpjMa+eBxGa40gHcOLeZk0fmM
         TQnkOLEpi9t3QO7sbpi6aofVWz4AS3/Zw7wFSkUwe4XO1uexnp6jOWthB0lslTkmCDZa
         5mB6HcoUtBazKKYEqm8NBd3jEk6WeTB99Yj1zV3AubbXvv/qUfLf1BrehTTQseRlF6/m
         IvLA==
X-Forwarded-Encrypted: i=1; AJvYcCVm2hQhy6pD6FF/UxF7qZR0keEIVV3MhUq3zUhO7JuNcfHNCoI9L+Ygc5lkfYMPy0XdtZyXpArKQwbXu5mAFKcj@lists.infradead.org
X-Gm-Message-State: AOJu0YxtBnMv2kIW7qUoODZtG00FDPLajbhNp0VNE/NkkuhnvC3tA2Lq
	l+yqIH0Hy/ItjQzBlVAGTlM7pap0MRs1bYMeCwKEqIBKYetHLbKjWe1FireXQgbotSYDGKM+AhP
	81UTOsOLxQjbSUHu/OXNXu7h4mbXp6DdsfTca3vTg6Sto6Zpr8YMumMvn3dcKcG23xVSzvFvTrO
	cCPg==
X-Gm-Gg: ATEYQzxjFMQLRJUI7BdeqgLH8QtGJApwB2R38I0hIepg5+Dk/tZc8GeUqxuqANORxRn
	1qrF+Co7MH5e/Z1ihNctl7fqx3vSGwUTjznxu9amXqW9Rvhk+WEe9oeVmBAesen9AhdETZEcyI/
	m6NmLMJ8n5um0Zqmug97A4bhWtEcMQBSBRWgSomQ0FJY534Q4ZHrOx2obfIrTtx7CPLvDGxSQX1
	NIpM3Mury8QpwWzFtvdsTL4iVCDrNOLfmwdfISSiWph/b09oA8D40RAmktKxmjUN7xce+rV+Tzq
	fvk1R/uilq1NO0IY3fZj0Clxdw/OINSt0HAIC337s1SCJnsJtezxZ3ovFGXUr04mbjTa5q+Bpt7
	k72x/1bGmWXzRxu4J3ziKTfTCuFO99iFyoyc0FhPQasV8fiJfk3u++ODmGzPS+5NCJKGSb4s9wX
	e1EZU=
X-Received: by 2002:a05:622a:10b:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b14752dcemr27744441cf.1.1773834570102;
        Wed, 18 Mar 2026 04:49:30 -0700 (PDT)
X-Received: by 2002:a05:622a:10b:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b14752dcemr27744241cf.1.1773834569701;
        Wed, 18 Mar 2026 04:49:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667ac611b88sm1815696a12.0.2026.03.18.04.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:49:28 -0700 (PDT)
Message-ID: <9148cecd-6632-46f2-88f3-152c6d6df10c@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:49:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
 <20260315-stmfts5-v2-11-70bc83ee9591@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260315-stmfts5-v2-11-70bc83ee9591@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6KWxjMcoOOd-umWleaXeRVxBiKyzWNM-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OSBTYWx0ZWRfXwmVtaSjdBKLE
 BgsGU0XfOKFPiuzbsj2dOYYbvdA36V7YKuW/v62mMpSju8HkHbwt3lVf7q1UKg/DakvCl41GmoI
 L0Jih/h08CA4gxRhLOx5kbfiEBxvOanMBAKr8yGBwZlZ7cd9ODBxuQZoBPLAGoZJGAA99Sju0ac
 Bc7r3Wh3Cs4V3koYX1vFX65u6yC96tBNAi4uNhaVlVLvbV/Epl9aG007HOneppXMP/yGt+HOeor
 3iIZCpI9WbcfVVT6stpUNI9XwEj4P7FTBWqtIGLL0W0aW4wlHnJNS8we1UqLyQ0UA4vk0VE8RoL
 vvRoVZGh3qECi93PHF/bwptXBW3f2LB8V3BX1EcsGm6XeTZZNru813vHnugLh1ZNiWpMdI1/Zc0
 G04J0xp3rdXfmZMtVNSLjV7vcoBKuCDhvS3s1e+bqlfKYHNny/r8wmjGfoFQO0h7b8AQtuAUEla
 wH0/LEEwiHBr6JlXuWw==
X-Proofpoint-GUID: 6KWxjMcoOOd-umWleaXeRVxBiKyzWNM-
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69ba914a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=sfOm8-O8AAAA:8 a=8wVjoaYgGRnUAGDsoUAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_044931_936071_497E1A1B 
X-CRM114-Status: GOOD (  17.25  )
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

On 3/15/26 7:52 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> index fa89be500fb85..48d7e7f83c285 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -26,7 +26,25 @@ &i2c2 {
>  
>  	status = "okay";
>  
> -	/* ST,FTS @ 49 */
> +	touchscreen@49 {
> +		compatible = "st,stmfts5";
> +		reg = <0x49>;
> +
> +		pinctrl-0 = <&touchscreen_pins &touchscreen_reset>;

s/touchscreen_pins/touchscreen_irq_n?

also: <&foo>, <&bar> (this produces the exact same compilation output
but making them separate makes more ""semantic"" sense)

> +		pinctrl-names = "default";
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <125 IRQ_TYPE_LEVEL_LOW>;

interrupts-extended = <&tlmm 125 IRQ...>

Konrad

