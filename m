Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBDCCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8pQ7+KpbTQISYSQqbM73wZKxkqVf5wMyvX6KaoXFwg=; b=PHFLLickl45G5veJqDZPtgxLhE
	kLXz+h+7rzPJ4EOZu6q9OYgEtwE+ndJhHHzsqEpjMpKqcQB8cXDpCWBhmVrW86LLUaXtTZ21RZWvD
	p5sQQ92+eIkeyGkAHgPrc1HYFkgeIIhDJxIRQg7uAXIiZt2pXuWlB/W9P4QhksK6JKygw5y9Fq972
	xhiwn4UxIRDIVXTmx1MCxrOt7Hfxx8PD90YjpP9voeGK6rGId3cxMJCftQdE3zdA8dHLtbThsqUNz
	FmPMA3w516S3jGqAk21PXoMavGFoZXPnHdg4cOoSrA92kT0q871JZKubcZkcgfS/8toPZ9FJClylK
	SaA9EIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbyuY-0000000696N-47Xz;
	Tue, 23 Jun 2026 11:03:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbyuW-0000000695O-01Lt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:03:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsYwd3925841
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 11:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8pQ7+KpbTQISYSQqbM73wZKxkqVf5wMyvX6KaoXFwg=; b=RVdCAvqEWeUN4sA6
	aJ7cAuzKkdlxrFrS5DnO2V36dnxYfoJl/dCrO2ZBhDHzppUXsiW/EafB4FPhDLEU
	J23HzHeoWxl53kCfsQkJuGqtEJkQYQfFnTg4zopVtIeAiZMLpfPfsQ/AtTobEv/r
	7L/SyN/EeZst+NGmPFfCJQnBjRELF4F8eHU6ymokW7+gpc5J48T3pCqw8pBpTn0R
	IPipluNIN20IrrX5fSns78Msa9fw3XP8DtAM7n5JlN+aLf8muGNGg76UG3litXLW
	CqoGPbtW0MSzUREcqcocvNzswkTl9IfEg4daeEjlGCH7h7TihD7dfhjNc9kdr3oW
	wdbJmw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjhyv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 11:03:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfe512ea6bso70278137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212598; x=1782817398; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8pQ7+KpbTQISYSQqbM73wZKxkqVf5wMyvX6KaoXFwg=;
        b=QuFR9NtBOxxgbMdC/iOTO77CajxrAVCxSclWh7mecIYNEL8jNjPQSY6TIuWS0rZjZH
         FeRkBrk3EYb7K7OPImpEgMpcaRHo8yo/ACha8wQWeu6e+zC+da2f5qLvxXRCYtmgaI57
         qkd9Hvj0YpTt7T3NZ+qArw7Sp0Isligq92AA3KdI+6Nj3SO9GEMjibrh2Dz4+KQhBky7
         9Xcj4EtVugtvtTpCf85+x6rFCz47YUH219Bzykm/JdlvyOMol72qJuNvXnOpoqjcHG+K
         J+hNVjmrIHM6MF/fwRShDhY0LsEXCCFA4q9eW0UG533YJQSe6M1XUhKdrWw5l7s/KpDW
         F+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212598; x=1782817398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8pQ7+KpbTQISYSQqbM73wZKxkqVf5wMyvX6KaoXFwg=;
        b=dLmxvvG2/WJPIQQocRYc9uup4pSLSgG+TpNhxpYJfGY63mniVn7xUVM/s5wJlBqpgQ
         +pRGXK8y3zQa9vtbYoqinzA6ACoNSM6tCwuTULwd+w0xxGWil2l5l4O63zGMTdsKDpFy
         zpUG/lfbWT5Cy25HLZWjhnqOFWYqJRg7cX5zJJNMPqu3dtSW1SU2jiXQHGEjfWeCU3c1
         eA+ADwT/A1N8p6oUbWko9n0l1J5lYAvv+MOoMLJWVczFYXpDDoTwkU4p+KFv6CmsXiOt
         Gsy/vSeR4T9F+6f7v5kuoTnr0tVsRIibBbE7qwZ3/UnJFHRKuyxYTI4Tmfz1Qyn6VdFU
         mMeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dV5OPo/aS0OW83IE6qC/Ib8N0HNH9E7gDc4vA6WMFAGIuKD2Gw4Nsv510dlroECzdDe/o8r9YuQCieHkK4mVl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnt1lI3tSypMPxICE8m1nOqyYZ9xbxUyfGazG1auq1vS3e40Vm
	SynvPvWY/cmWTXeZIKAntYvnlRQ/pL2+cFk7FpFJQDzp6wSUp77pspunKRhZgMKmTkf8jEtTUh/
	28oshnw/67g9a9eisqpfA1vJwx41uEBVnn9tf4IyaqMG/FdORzQHriJGY4Afjge3F8NLcmS9Ik7
	fhaQ==
X-Gm-Gg: AfdE7cnRWSABRDjQ/bExTWraFVY/ZeLONKvU8xZkBzbc0xn/tfxKmeXhTZP4liOv61U
	3SwT6lbcnYBRmKWL4Ml2VzG+4Enkj7bv3IcMS41rVBytxHu5YpHBELEQotke+OP3hGZbeFDADcg
	wHjKCpiuZmEG3DQcuHcTO7PtduDFz/kk33SY3kTFSVyG1QPUPunbQHCAMn4RsqeswdL0ga+U0ay
	9t6MseWnDBxt2ti5wsxxiQeFKl948Uok/p/Ynrjf+Ie6wDAiZOQt5ItiJ4EaQs/FH7fGb8rPwFQ
	cPOY3QjK+JmvwUfzdK3dZ6qjbnOsbBEbQp/AZjip7a1zn1HM/js0AVKBaNOR3e989XYmxoxWuYs
	GjdDbNqTuNiEOO/nA2umDwuCo2smZYP9/xT8=
X-Received: by 2002:a05:6102:e12:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-72b172a99fcmr2725501137.8.1782212598329;
        Tue, 23 Jun 2026 04:03:18 -0700 (PDT)
X-Received: by 2002:a05:6102:e12:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-72b172a99fcmr2725475137.8.1782212597845;
        Tue, 23 Jun 2026 04:03:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b86de31sm4303377a12.12.2026.06.23.04.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:03:16 -0700 (PDT)
Message-ID: <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX9Mqzjt3VBD3O
 xvwBLtNRpdIcmNOQnLnYD4m47ZCZncwmDhowAtktiigNJmHgpEgZDuxTrq2VXCiMmjvB4Y8JWuS
 F0SwW2CjWvDB00PsdtUy132iOuqljSuCWNde7a+Ma0jX8AK+wR3qULPG0ovqPjg/jfCuV0PkolA
 GXj9v8oxSUPGMBmLuZvuVXvASIocYEiqsCA1pKvATCqUL83PyJeEpcZu2sZJq16cU/tocZHIvmR
 YSZrS3L4pDRUQfLqNDkehoNwrhuNHBTUfNIt/duLd+Wjk7C6lK/ZsLnYeUgItJjqQXchdxr6WgU
 5mggOXdUs9UZ39mRwcTty2HoBwFCR4ynLaUHafuF2IUvQbBQs+RoPdW05BvfAbXf5FNWwJsEFzV
 tFpBl3u1vUY3HG3ANy+149zIfci5tpSw0ZThDONhsLRauHYncMPUqTlVX2LGjZeMEGz8ftwL65Y
 v5AT7ZOpwgWBUE0TAlg==
X-Proofpoint-GUID: LZdsEhJzxJc1rb5Yd_cTRMYvrAG-K62J
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a67f6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qh3hvowi6R8gCIqNXE0A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX09m8677qYBwM
 wtAGW4G2YZWSvarUz/7WXAM84Wos6dlLL1tYWLiG+9Bl6U9UBTRuAdc15gHTVtreqY2a6MbRjEy
 48GXHu/OhWhJGI0RDCP1wHI/S48lAuI=
X-Proofpoint-ORIG-GUID: LZdsEhJzxJc1rb5Yd_cTRMYvrAG-K62J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_040320_168924_6EEADF96 
X-CRM114-Status: GOOD (  18.91  )
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

On 6/23/26 1:02 PM, Konrad Dybcio wrote:
> On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
>> From: Esteban Urrutia <esteuwu@proton.me>
>>
>> These nodes are not present on downstream device trees and only take
>> memory away from the AP.
>> No crashes occur without these nodes, so remove them.
>>
>> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 ---------------
>>  1 file changed, 15 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index 56cb6e959e4e..e34e3c05bf74 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -752,11 +752,6 @@ oem_vm_mem: memory@bb000000 {
>>  			no-map;
>>  		};
>>  
>> -		mte_mem: memory@c0000000 {
>> -			reg = <0x0 0xc0000000 0x0 0x20000000>;
>> -			no-map;
>> -		};
> 
> This is mentioned in the memory map description, but is not part
> of it.
> 
> I booted up a 8450 HDK and it doesn't even have MTE, so it's
> probably valid

i.e. it doesn't report MTE to Linux. I don't know if it's Gunyah
trapping it.

Konrad

