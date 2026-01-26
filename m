Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E40ECF65D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnGQa+VppXSpGH8Db51uvFUmO5TW2cub0y3XamdlXbo=; b=AppooyoeGW0J1C0DNBnC/PAxB/
	YDav2kdVPmNMr8rSnh91JLw/l9y+K3G0891r9c4JGRMreLgOs9Yaa5WeuDYMh9E/e/xHEPMFHhEei
	TLblFFl9bIe8mKRsdhQTYB4PnGO1j4RVvbn6p/xfVE2GBFmNK+l2QlMmleKxRzzcg6DiFlhrPS/bu
	pJZObaW8T/2mdIyivHFu5dKY0Abd2XJznHaIa90f3YF7vDgQ8n3GYs+gPTYdcTN1KuQwTQU3tFS2D
	J4IYPeu1GwQVIp1RNHKjnVQsZxt7yiV+nXElc0nKjDnlEjBh87IkonxiLJOBcCo8huoQPTu1uUKAZ
	mMShg6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJtv-0000000CIPT-0TuC;
	Mon, 26 Jan 2026 10:32:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJts-0000000CIP8-3fr4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:32:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q5UFYa1018997
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 10:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JnGQa+VppXSpGH8Db51uvFUmO5TW2cub0y3XamdlXbo=; b=ULxdXg8GOuwlgBJL
	TgivDwLrLmZGDQj6b7363AGK+1t5pNEoyeTBAP87E7bO8F2CRgksn+JM4V6iF9cB
	TedXI5UGCAgtChJkpTvInxkibW3S4B9oS0ie3qbqr/9ZPIBNoFfHFVPBH0gEVNJv
	psl+3qIqHyDB1Cq2MC2Jml1UuRptrNf+O8xs0i8PvvpOaIG8OMNVZRvzoLG+7WNE
	by8je9iU5ZEYXN7AOcZwUAzF5w0ZE5onMXRLIA3zWu1cENk2NCxJqQKBeunQF5eH
	WWqv+SowYjxeCAV/9/TqfcRCP/sVgmS7djm+h6GeMps28Y84192T5UWZr4/Hw4Z5
	oeFgOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2680qcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 10:32:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c523d611ffso78182285a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769423571; x=1770028371; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnGQa+VppXSpGH8Db51uvFUmO5TW2cub0y3XamdlXbo=;
        b=HE3n92Rb7dVpMnUzXR2uFpRfnrezDUV5HwdywoOFSVVoSSd5ufw6AAGDyvA1bW9miA
         ReREHUlD8H0Lf5xEXGEZwWEVKIQ8Lpi1Pn0hUfN7oES7uxiKxKohO0bjaVScZzcFYNwH
         h/tJ7Zi+V+wEhkELtKpE+VtqvDzualmIXBpbjuVXtpO3ko8cgB0ZIdej4K19lcx/E8L4
         LHWQqgRYXsAnolnX/134mkgpf8whZDunR9UQPmCgfRtiUPwXw0+M0aML2IgRVodJewEO
         pLqqKddrnxD1bo9Ekzb2yjhCTYQOm4zLBpz9dRH9McaVpkJQQwHV3QFKXahOWY4kjVJu
         rb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423571; x=1770028371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnGQa+VppXSpGH8Db51uvFUmO5TW2cub0y3XamdlXbo=;
        b=b0MysUvheRmkgREcP7qefpjepkD5SWByBddkq0/mylNrjJoGh6JUjATJKxBp3u4GBM
         lMtok4DK3aj/SqYkUOOMi51PZBRzAuGm9oThPZcBnIDavMOxdfMR3KoeMukAcCihRlvT
         ILoIOyWKvYY5xPl+7jCZtESYxcVsd8MRYrRtyqoBLQ0NFA4qoxB4CBbnSETQq4TAxT1L
         7uOCASK4Sw9dGmJ7dwDwmuaeB3MG9vLHjOavF2K1VJT0SsbDb8N5BOxtu/HLZede4H+r
         iFqb5KwVdb+Sa2jCPAWSg0GGRSrKl2mwMLgq/TTYK/YO+/L9YR87y/UcCa17ZtVWE1lN
         /sGg==
X-Forwarded-Encrypted: i=1; AJvYcCUPbbKsZeLLIwf3Wos0U4WoEP3rZf8Jo3+eWIWLV3Ma78ZkIQRIi1p2qLAIs4ghmrIvfdFugLyUSatRGLIrSmNB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Z6omiH3KygD+0zm75T4Zw8Ake6ifUyxeN6M69WKA0YAtCCaZ
	7csb6GBMHHhzI2886Oa6TjDoeCqQ766tuO6K2xgTovgH+a09KVfYSs1ZEvUXAz26w6n0Yf7aIYf
	aJNKgzyCXKKfveC1XexSuTtOerKFwoRucSvpM4yFxxUQ+ajQ8F7uaI4PBEdEnDUyhN1EEBZfEgH
	Y9PA==
X-Gm-Gg: AZuq6aIgGbMJ0ezLT/y6/xeCWp15HfAud3GXvBBow1Tcm7UfFlFLcv8zQsRUlLWrRwP
	fCZ62mkAWBonC7Pl5kRCek59WM/dZghMBlRCSRp/53/jLbssK7egN1CaOCvqiWSS4abH6wK/XUV
	3uVVeml1lprywd6mWvBBC33aRk8YLxNhmErM4E4NWS5ClvY4E+6VXcDbNZUTB0PA5MsYScxeTvj
	G1Ut1+mB6VA3XtIGJHl+Zt6deDFDbpsWQGBtekXoLXg1KkORcyGwF+UpaYqDHRx/tHn0TgXzxRK
	Ol/36dUkmbXavC5/cLhzkpEgY7swzBd1sff3zGkR+efDis3PQlugV2Lp7XrBXPEFu2KFq5TXsJX
	xX36u9bzhNQIEN5MSqLKoptCj0zTo1KCbQdc4+vxRM+VTJ+cNqhx3S8z4qefs5CQn+NI=
X-Received: by 2002:a05:620a:2588:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c6f95790c0mr358639185a.1.1769423571041;
        Mon, 26 Jan 2026 02:32:51 -0800 (PST)
X-Received: by 2002:a05:620a:2588:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c6f95790c0mr358637685a.1.1769423570661;
        Mon, 26 Jan 2026 02:32:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b7d7d89sm606513966b.68.2026.01.26.02.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:32:49 -0800 (PST)
Message-ID: <291206cc-85e7-4251-9507-5848f721a708@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:32:46 +0100
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
 <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
 <e0e6f248-3d82-4b0c-9ee2-4a655b7bbbfd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e0e6f248-3d82-4b0c-9ee2-4a655b7bbbfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=697742d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qa14B8Bdw_gfn3ERDOEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4OSBTYWx0ZWRfX743KaHA9IkaY
 KUmQeeSLQpyCCJCRc7WRHzARbJReEH/2KwgjPnHiylqimazwXUyiYP1F4vQKry8IvCNs15EDNwn
 viuQef8mdBupFRS3KsbN95g9u4ZTIQqhA+5ddUFPFGwks+dp0Yt98qhJ7yYb50C+bbuA1x1mUvp
 /jJgBidSyA1lB2a7hOSMTUNx1GP4rDeQHE1B+psJu98mIV6vVizUndBnxgg6T7q+xT3C2YSbcj/
 vD0fvCR6Ogk0MzPlNHBB73SAWyqrAFeRhz0L7PBxoZHLgukekEsR7ZsV631zN07ExVoEC5Jt1yu
 9D7+VLcbGo+ry1gTxaI1pNtFX+IQZg3egBpXff7SS8+KeD4JSNj5ARIcmNM6uXwRQaZysTAyBa/
 4v4lu2BSooaoennRePWBVeg1J1HSSUDQHv7w5YF/4zv7PGH3MKZUI+GT4NY0omAdkOXWrgBW4p7
 RhmG+WaNq7wKgks4f6g==
X-Proofpoint-ORIG-GUID: RQ2YP0GpuRwKyirb9jI8FAJ7g9oHWsnI
X-Proofpoint-GUID: RQ2YP0GpuRwKyirb9jI8FAJ7g9oHWsnI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_023252_945546_0F3DAA42 
X-CRM114-Status: GOOD (  15.02  )
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

On 1/23/26 3:30 AM, Wenmeng Liu wrote:
> Hi Konrad,
> 
> On 1/22/2026 9:44 PM, Konrad Dybcio wrote:
>> On 1/22/26 11:48 AM, Wenmeng Liu wrote:
>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>
>>> The Talos EVK board does not include a camera sensor
>>> by default, this DTSO has enabled the Arducam 12.3MP
>>> IMX577 Mini Camera Module on the CSI-1 interface.
>>>
>>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +&cci_i2c1 {
>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>> +
>>> +    camera@1a {
>>> +        compatible = "sony,imx577";
>>> +        reg = <0x1a>;
>>> +
>>> +        reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
>>
>> Let's define the pin settings for the reset pin too, otherwise lgtm
> 
> The reset pin on the Talos EVK board is different from the default. Do you recommend that I define the reset pin's pinctrl in the Talos EVK board's DTS?

Certianly not in the SoC DTSI

The other question is whether to put it in the board or mezz DTS(O)

I think the latter makes more sense, as presumably a different mezz
could use it for different purposes

Konrad

