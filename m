Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E6DCD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9j+7eXCckmlcKUILjcOcoFvG2Vudf6r9KN2UMOzISo=; b=pHf+NyPYzVPacmC93F+e0iD+1C
	E+ViyVV3wN6IXjzAszOduX0g6ZOgotEEEXkkYHpSerikbQ8VJZyp645S7zUYrl5Ifq1IS52awvMEi
	IsW48juu3IvpIMgOR+ZfHHPunHifjrVD1W9l5FJ4OMErsxCnQGSXyt0eaC6rNBxKVlbzzcWsy+s8F
	no8sysWYXoi4ZzzSs+3fKw8AR8oXWYODO+lOlR3nqzs7kqaM0buB2NwqcuQ3QYWGs1LOnDnOqQVkN
	yFdJTbZ+xTL2h3w77YrM23oCbB53jsKioE5N9WRjdM5LTelwJbfPRk1p3HeKTI/d88u9MUlPY4+6v
	3M4ofinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQkh-0000000B7I8-3FFW;
	Fri, 22 May 2026 14:21:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQkg-0000000B7Hc-0DSX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 14:21:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MC10Hl1298254
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9j+7eXCckmlcKUILjcOcoFvG2Vudf6r9KN2UMOzISo=; b=i53jBIPC/i0fJ+XE
	U31AvAFJK00Aw55SLFDhZpf9lvBlALSDqdHh83+TDNR4hZ9LMb4r6C5pvR3RF6sc
	tz+1NaA9oVMMfS2OE74RLPcfsTrOc+/HAHZfoEa9fToc+kkNpA+x94/S9Gn0hDCS
	GYa9PIdAmiM/jSqOm7/gjriNvVSLCf7fcILcUCrOgw0ks5dh7mQQBUpHLXTPAfzk
	0BygaLwdAcCIgymhEwPdYoli/ZQs7HGFxDmti17UqaVPnSOk6gh3deoEljrMKkim
	M+E9DVkYdXwhbXglNrn4dCnB0LTroG6qq5SSKRePg+jTBKw58ePQxP/rssPTbKkO
	8z4+MQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0bauy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:21:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3692f395339so7472493a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 07:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779459684; x=1780064484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9j+7eXCckmlcKUILjcOcoFvG2Vudf6r9KN2UMOzISo=;
        b=T9sEMiG48KIE90YmO7eboMj6Xz7xsqOnv5kOPciZRRYlQkxMj1j6KK7Hrjiy87BxxR
         pmG/HiXrF/sE2597mRu7eEY7tZnriIVeFNrG1r46RIqyHe6zlognFOGQVW5CIsHcYvtu
         GEnKXCcwyg/T/9mx0/hYo+jwUdJ94S6Dvee/efkB3jRBRfYhlAd5+JBelIIDUNt53OrP
         RIc0zaWZ9NyeXFEWBnZd4YNWYwJy+zZ/8Ywf2xcxEOfIXTnMIbXPxlRjeqUraG6l/RCc
         PlQgolL80pxqSfAjX7/nh34Cn8T5zxJnE9zXsLwm9CLt0IPm8HUeT7a1xI1/1e/KFCTg
         UeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779459684; x=1780064484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9j+7eXCckmlcKUILjcOcoFvG2Vudf6r9KN2UMOzISo=;
        b=fozUnHxzpcgL11AdecTBuhdvMW6ahVQ+CEVPUKOzC5HJ7UJuim0SyIiQKLaOfBJ4H4
         vYK85k+aFGTvRt4yZPsuTi2ALvK03xLAT95FY900uB4o9vK00fwDCCU7wDSaO02uh31l
         Jq8j3XTWAgjeILy9gsONF5B9899VcG7TW1D+SJkbNPJ8Nj9qNt18KGlPkrIDvRbHE4uC
         bI1M9zwYorUjIMfw6uMz33o79CA8eDrwcxy/rVdWvBCkH2o4msL8PlhlLMo3BvVgh4aR
         DA2qowNBoQz5xf7QUtZ4qvHH+dHQCL3QQ7oLEZ00h1V0Q77T382cPi2Fc9CAvweKz6/j
         ToZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/I/hat+S8zdCB9cW5/Vleo1gWegj8IfNZtGasX8Qgquw4MeKRJDf7jC9p5QFgbbGIABiLJjavq/sDGvjeoGgaG@lists.infradead.org
X-Gm-Message-State: AOJu0YzzEpa/JkCNQmyxfFpzgz7hZ9V6+i1LMHal9lOn3DXqTLE/Mjf5
	1sT5uozwF2ZcftoxzultIOKU1nSkzxOboeowwQ6j52URbuOeUQmEZvChq5yjcwOJB0C5pOMLc7b
	DRnO0abVjwWaC6rzbWws8eLrAIEEwkA0dsuNKoLuNSq99elXbRApqeAQ7UaRSvsLrWqrtm42El6
	pREg==
X-Gm-Gg: Acq92OGJ5MJtcyS6wP22Y6POc5l8kPwaBXa8AnXQzb1NTVrhQPF0QwkPBFoW77RrFw/
	movvcN2wkU1ITwnrwgv+bGKqhdNDCqQri8qg84mtZC/Yg6j48sadO13Y0jNS/i1QCUyuvABoEUu
	R6nfJqBm5MCkYdhVtYVXvhuBV8iUKNXbHhfK1/+rw+eG+RtNSALBVJCM0XbWa3jCBUmjqRIRp7A
	1TNPsGsK7g0CWe8ao3mNrkKKQbdkLJkjzJ/ESSGVHZbchc5eQmkx4QCL4AXY57ORhRvCKbhuR0+
	ZF7O77xNdB423RpXHiRVXv6HpAh++oKFKmkYJATpfKjQ5v8ysyQq4rYjJvu3+TJg4qOVkUiUVEY
	2uPesKBqwtR8KXuTrYWovttY6JQtskkfZnJLzH3xzQaDaxO7AvgYq
X-Received: by 2002:a17:90b:5343:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-36a671e98dcmr3494387a91.0.1779459684548;
        Fri, 22 May 2026 07:21:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-36a671e98dcmr3494333a91.0.1779459683996;
        Fri, 22 May 2026 07:21:23 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6f0baca7sm1350671a91.2.2026.05.22.07.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:21:23 -0700 (PDT)
Message-ID: <8da827fa-bc60-4086-a424-5ec376f15e27@oss.qualcomm.com>
Date: Fri, 22 May 2026 19:51:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
 <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
 <e6572f5b-3686-46ca-956d-c06a7363cef2@oss.qualcomm.com>
 <vjdz65uy4pxlbt2e4wlwvdu5llwazyopeqb3caswvejenm5iv7@3s3p7iz4otef>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <vjdz65uy4pxlbt2e4wlwvdu5llwazyopeqb3caswvejenm5iv7@3s3p7iz4otef>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0MyBTYWx0ZWRfX96dKz/ShLL/O
 oPx8kzLBoE6Nrvun5ReN05eMtij4JrrGuKeqFikt7eZ3CywSAPedANPr+j+WIS7cnJXHqVzCI80
 qPKR6yL1t8vwB6eMfLu1pXgLZV85iqbsH4t6nvtJ/iNIjEcVzAFYyHMabt9QCVm9wXxLq8dkpjv
 ylHZOSmVgRQiP+WP+hWjBTLnf2OTjLXorYh8DNNW0gYQdT8sRYELuTXTI12sPAkSb/RgWiuSAfZ
 lNscwQXVyT1iy9CjaZrRdf7QS4aWoaRahLstJo9gkJvuTP6HeknQHY5XWdpN1DShkdDYXT686oX
 /aIvBYCto9WfGX2jDdNrCUPPhjWmh78o7L/AXePdzKUIhfJAJprhOFa1XHRbpCzH9WHz6Xne74v
 pDhcbUlr1T+GRAM8NQALLeNZFaaO03KIHYlekvEQwLhkToZ9+EdiBptTI4jnnhatbC5txinFloJ
 bMGqS0wo3NvbgMXjVJA==
X-Proofpoint-GUID: el4Ng8Zg6-2tq0XFk3jOQjC-yMWTUsZc
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a106665 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rjDOXfNolGiz0B_7zKQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: el4Ng8Zg6-2tq0XFk3jOQjC-yMWTUsZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_072126_100029_56EAD6AE 
X-CRM114-Status: GOOD (  15.64  )
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



On 5/17/2026 11:56 PM, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 12:17:54PM +0530, Gaurav Kohli wrote:
>>
>>
>> On 5/13/2026 11:23 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 12, 2026 at 03:53:20AM +0530, Akhil P Oommen wrote:
>>>> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>>
>>>> Unlike the CPU, the GPU does not throttle its speed automatically when it
>>>> reaches high temperatures.
>>>>
>>>> Set up GPU cooling by throttling the GPU speed
>>>> when reaching 105°C.
>>>>
>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
>>>>    1 file changed, 135 insertions(+), 30 deletions(-)
>>>>
>>>> +
>>>>    			thermal-sensors = <&tsens5 0>;
>>>>    			trips {
>>>> -				gpuss-0-hot {
>>>> -					temperature = <120000>;
>>>> +				gpuss_0_alert0: gpuss-0-alert0 {
>>>> +					temperature = <105000>;
>>>>    					hysteresis = <5000>;
>>>> -					type = "hot";
>>>> +					type = "passive";
>>>>    				};
>>>
>>> Why don't we keep both passive and hot trip points?
>>>
>>
>> Need guidance here, we are keeping passive at low temp so still hot trip is
>> needed for such cases.
> 
> I think we are saying the same. Keep both passive and hot trip points.
> 

Sure, will send updated one.

>>
>>>>    				gpuss-0-critical {
>>>>
>>>
>>
> 


