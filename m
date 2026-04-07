Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE0DEDB7EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zj0IO9lWzmhdRtyXS4a4wWkRws93YqSUsMLLkuCBpk8=; b=qY8c+iK3fsyizWEsZBFWuDVh64
	rHqx3QlrPuklVkGqSMZESomVdkbIt6NQYm0Ga8FCUm/pxYrUt6gox3swPQFQdJTDtXz0CC4Gna2KE
	M1pAuGaiRsKxcjfDa2LN1okl37jMXdlUsGzN1f3YxwyjpMSDzC5hRBfBaIREHWZwvvzY+Z3CR02FN
	10Sq2i9njjf/eUTS9A98Sq/PG8g1zKj5KtTdnqj4FAbprXtjiXrrni6MRoZDgoJLRIx4FBdxiXFrp
	9tZL39nTvKw5gwEKR6xgof0ATTWsfG6wcXCILoaH4Uz8c+Mlm4GR6vA/YV2FEtaWFrD8wm48hyje0
	SVNi+9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3f0-00000006HZV-36il;
	Tue, 07 Apr 2026 10:27:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3ex-00000006HYs-49HB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:27:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376RCmU2328024
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 10:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zj0IO9lWzmhdRtyXS4a4wWkRws93YqSUsMLLkuCBpk8=; b=BI/sB+recpRIGuvU
	z4cMdzyams4wWOkId1FO7POs3U9mGnNpC/r3N1sz1+3LYX0LwEWX/N1eWu+fQEY4
	RGSfXspzScpGdljG7IinuXEQpGJFI75EpKu+031EzmVHubspP0LCd1lIWQp0XkQU
	fqw1OiyXLcr6V9pSei9kAOkpgcVn581iNbn3Yc3wd+oV9+zxecIJFJh7vVANoB+z
	El12ovq/tTV4oto16mnT0pVh5MVAk1IyDbAiz0nS8GRgwJYVX5NMLyy1oS1ZaeQ2
	xA10lO3tef/iDPNRWtgzeQo0OGYamer+4rI7fuJkAv1Qj+A9ZkSe6v/8qs3tUV8C
	2ky0rw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4t96r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 10:27:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-895375da74bso19006756d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 03:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557670; x=1776162470; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zj0IO9lWzmhdRtyXS4a4wWkRws93YqSUsMLLkuCBpk8=;
        b=VKpI9iapUQdTbRV9k8GFBk9q29HxVJ1QWMr3zl0fHGL4xFG9hEpuMXduE8VO69c7Zj
         F0g3n7XX5jCu19ZKgUn4xekh8wG2B65dTNsTX08tE9l0O9LSWJSlTRs013bZCfiJo49Z
         SSk99ipLZJatvl1MCBUTRdKBOIXrQaSIuNFgaw64OZTuy4DDWb1v99qIX7FaVwwONSWI
         bDBW3jbT368dWao9bdhq8sWp77KtqGBdVsuFxpYlWKqLdj8B81i56mAtdKi+XsEr2Mrc
         1x9fhzNtSJPb2eT5brtEXaWB1ZbGxE15nR/hyioDKR1UITXLEA48DizPTPoRjL9pAxkf
         xMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557670; x=1776162470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zj0IO9lWzmhdRtyXS4a4wWkRws93YqSUsMLLkuCBpk8=;
        b=YshiGa9hCMAQUbnOomL/FTN9K6+Sok3Foxdxn+rJaCO7DOV469C9TqOJ8nQpechTSP
         a3yG70KEuF4GyEI2KPHQ7pG46kkE6q1CqNd+fqDrja5clp0NkB53NiDqc457wCLp50CP
         FyulA6wh7Lagi/BBM4l4xnclqc8AumpT1nQGceR5Z7x47NsetcQ0PvkCRYphYPDB45uJ
         YR6Yu3+Okjcj+apURV8agPOTdltWAD1PAPgKLPR96FKFyIub2FDa6e+Dtb07z2GDZdpV
         iZf77vch17ciouOud3jh4Cr5NGTGqbbHSxEUnz3zMMcwholLBLSwIA8YjNZc+SEGSEnT
         peRg==
X-Forwarded-Encrypted: i=1; AJvYcCXbRx1jloHE3/4u//Qpe3gwveKYm3gM6FqkwYTyUVuya4Hv9mLLo0lH1xoehowbNZ+FUtAC7gYYxvbyDq09e5l+@lists.infradead.org
X-Gm-Message-State: AOJu0YwX8XoUzVVQC0LwaqpptuO3jDyUpLTmtiQNbfkGCqiQXgCKd0nL
	bZR9jSdUmcz0vcz3OCMYIBB9/QyzUgH8PVBFASV1/CCGjwW59jHn2lw4C9aoCoNONXMUVQR6Wi+
	55Jc1/WVolZzLjIaWYzk9zLFflkKPzyfZ6tLr2cKcVVoD+IbaqDFNBMzVABF8uqzxCKmB1fEEcW
	qSmg==
X-Gm-Gg: AeBDievTL11wYnbKt1U/82mavuI/nmI0eN1/L9A4xy1Qz59NOb08b8YxdtwGQrUgyPS
	Cx2GNUO1dxGdbNWtdqA5IhWQKwKfQR34Bwd8/5ABJZszGUsTlgGF4rzhWM+3/T7l7lW4DRWbOof
	X29+dIXRiONp9XEjoiz4Dob2vqZrttVKQoAAEM9WosG9zCcfUMGcmoUgDCrlbLNOcBU383enpZO
	+P3goALcwn1TYf4/BcjB+/Xt/011sSGHnOhNJ4EpzWPjepC0TYWjqXBsT8sgRFWtHNAoHh8m3oQ
	ZC6GAqjnSGl3qA8mU4YGlDWQGMPzVzJSfw0RLEcRiNJ+zHouEWzq/g2OsMSvaSeh12Ku9BAFQAz
	ZY/421lNHxxChpi0i0F5nKS2DKFGix5HzMJkQ2Ywq2M37n487pYm/AgBF815p9d+Q6WhEz6uFCS
	AvKvg=
X-Received: by 2002:a05:6214:f06:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8a7048cce76mr188034506d6.5.1775557670610;
        Tue, 07 Apr 2026 03:27:50 -0700 (PDT)
X-Received: by 2002:a05:6214:f06:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8a7048cce76mr188034276d6.5.1775557670133;
        Tue, 07 Apr 2026 03:27:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c11sm554038066b.30.2026.04.07.03.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:27:49 -0700 (PDT)
Message-ID: <04f8e384-9e18-43ca-b277-d6dfc5513303@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
 <20260406-m8-dts-additions-v2-2-c4c4bd50af48@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-m8-dts-additions-v2-2-c4c4bd50af48@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfX/P+QHyEWycj5
 TGGNa8i8v5QR5axhRouHxXbhDBB1V9YQWU+VspDbjA5YvRPqN2Ieg/MeUu73a+vi6/na3aslVfT
 e33y2Oq6hWPND6/zEBct+1m3tX73EWLulm0DVymr5DAw15KDRuO4PCjP/qeqvzB+mJ9pqkqGyTL
 KeK6Wa0EJyzEJK7Eni7P5zKVuLhMLQydrIOeS/XuE4AbkaEVrCNg2xHFGwf8WiK8qIHvjVh2yr8
 RjcS6L4chH+quSwtoIG3sHw9hHuL+/4zkbU1CYJgAI0WgoNTM+8ThFEbeLgSn7wdfI4xg0qUaoJ
 Oqcd7nOWkqyeNjhuU2y5k/NxPTFQHLCfB9lVunHjogJU36pLEcxIr/p/AO6Y63hkk0Zfucw+IjO
 UUnPD/y/RWnw5b5uS7EoPD+KdC9iFpNw5BmTLd2Fo3pgmWqLO/rD/agAhDVmZ9SRmiqo6uwi0ns
 /46zJBW5TNRWTnACVGA==
X-Proofpoint-ORIG-GUID: cbAWDqErnP6ki3i9ziCFY1nGLyQGH9ww
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d4dc27 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=8poMKPHdAAAA:8 a=EUspDBNiAAAA:8 a=iV2YkS5aR9AJb_P5GS8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-GUID: cbAWDqErnP6ki3i9ziCFY1nGLyQGH9ww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_032752_039563_DD300C1A 
X-CRM114-Status: GOOD (  12.21  )
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

On 4/6/26 7:16 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the NFC chip used in the HTC One M8 to its device tree.
> 
> The downstream vendor kernel used an I2C frequency of 384 kHz
> for this bus. Use the same value as the vendor.
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

