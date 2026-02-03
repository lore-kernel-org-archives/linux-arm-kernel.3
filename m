Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA31E8306E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEwRyRc+5T8fGGzh4rUpKLJe0ns6o5092hg1qa+GDBw=; b=TqhESBMAadFEGmxBycGbhEWhQM
	g7TwS2+NlCyyOHSxN6irqxMUN+Bm5KcYJbFkX7/oLoKraCk2scCwuBOUeDTodNIvY75AufmCSZN4P
	nXfapOQi0W98t3s89BF46zWm+Gc2OmBxWBgHuuM9d+Misr6Ot8zSx9k4pLAVRSWpJ2lKZGWSmLHgv
	MGyV6YbzaW9ZO7tIbr362OhSPRGV4qeWIoWqwkxvnWx7Wzn5a9k3mXNlPH171lJqylIpFGdYLNXwA
	lFOfmxuzsCuafG0OOk+yAhmhtijXMmd/n3eS2lDMTE7FUSy11v5mi80E3I9q08t4RbIh2tVoy18CL
	9QGBRJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCq1-00000006OEk-3DGx;
	Tue, 03 Feb 2026 09:36:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCpz-00000006OEP-0aAA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:36:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136uOGb255929
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 09:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FEwRyRc+5T8fGGzh4rUpKLJe0ns6o5092hg1qa+GDBw=; b=meyQE0oaIWG/+sYD
	G/z8VqvDxxIGCb5echv2KYcaQIe0Ml3dygx1aYGm5yX2KVBsIRfpxH4NyLyqEgo4
	f4kVOs8hBy9mcB0Dxly4ETejWq7rL8m6ukNBhppImrnR8hvlqNspCBu2aLxqQCI4
	za90q0uZverfpQmidrU4E/Aa7YBZPwDXuk1ElFOs9WnPfcDbdn4AjYEm05YOlAjH
	GKLKfsPVcQwlNv6L//y3ZlH9RHV+vEsinMumZoGTfT+1In0LF+Sw4vrepTgmBv9J
	gUHlt/DZyZAor5b15Ri77QhgwUt/hnvNQoNUpJMEw4cgN9/g76P9OEjxhRVw4K40
	t/3bfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0kkhw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 09:36:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c536c9d2f7so156644485a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111405; x=1770716205; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FEwRyRc+5T8fGGzh4rUpKLJe0ns6o5092hg1qa+GDBw=;
        b=Zgdg/yFi7HX/IQZwBSTHTUzahlzU6NHZ2Ga/CqxXopQXx6XCDzjxg+ZaXthQEQHS4Q
         USIfV3ypCHL7q7pfURD527ApvFQKv0zsj/yuC1D///izM9BQexH2LfUe19Z1gse/R4bR
         vX52qRE5UmuW/NgoSIuxdvRpBqibsxAntI2t7hH7RUeT1CmmQQmhX/nPtvFwdKyzh0P2
         zFYZfI8Qbpn00jr+uOs8X7Kp5/LrDw9Nt5XpDgCk6e8plOKCdJLkMSziAzJjb7d0hOcv
         uQ8zO2srj8soejfSxDw8EOa5Vdl45cuiN/m48VtJ/9p1J+2nBYYfnqOC+3M8FpnF6suB
         HoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111405; x=1770716205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEwRyRc+5T8fGGzh4rUpKLJe0ns6o5092hg1qa+GDBw=;
        b=Q2OnkDYj9YZ5acYcmrfNF0YUNQZHG6IodS53CjFHEr3hiCXnC/GgcrSr4USjlA6bwn
         UAMQtfzNOnzUdddbT/nC7lg4sqzZiO9YB9EPzus+C34LaQITaogoq0U1Yr/BnJ694iCO
         S/D2JdrIPwpVxQj0I7xZlc0GC8frSZqz99b+TmeAWNYEpALn2U/t5SRDaXh4OwvisOKF
         UOTDlAVvKlBcGqJKQ2WXnqFQWKq40qo2CvGfudSVoevJ2m2vZioDuozRfHT5X6/t3pDf
         INtNJ4c+XQpMnEPPS6LmGzOe+4EebWFKdnRUHOOkKdwOEHNFllwrLzrsZ7huMFbObf30
         Eeiw==
X-Forwarded-Encrypted: i=1; AJvYcCWhGOgeEekwxvweIxJjhMAdNspDlF5z5P3NQy9v6cmieSNj1nVLd0GdYU4wBzVCpXfv229Y/T0NPhMrTnIk/O/I@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw3iyTRU4S3IJdzoy0gBRA4BllVgdadHm0U7ySzBPZUrUfkjgT
	gBTAbLC8+skiTUQ4U/4qHgz2MytUPEALAcI40yosC2P+wTLKFYPAGAy0rG0L9NeJSfhhfDGluso
	Wm5q7c1wRqOczOLhYzeTKISiIwdluQaJCcTsrc3MYX+o1xC+VFwX9ZC17hc2ikRs0dNlm7JhC/q
	pg2Q==
X-Gm-Gg: AZuq6aI9De+U80XYpIEdxZho1bEGpr7Iyr6ODYQkw8jKCOBmYCwXQnMBIBsrXIH4Klf
	hOCGf4vNbL87QU92FHKJul3QxtuK8xGkYKu3GU9hlQmjA1uALjGr16UyZDwMCiIEtt6dY+OIypa
	0FqioW9fCWO7tt1MnSdCz4eT3tQRE6LDm7SDLS5G6IbBmeCub/c8GuOJ+9O5by1S7Wj50VTvJav
	LPXJQQDfK/oyDarb5hzM9UosRe2y/q4jlV1vYBT9mZx5F2XXoABq3oYUdMaJJS3kGHYRdHtq0M6
	OrPXKF9PBTDYpU7aZvvYWIRgvnT4sSDB4J+s6I3wGWcuKwyy68OVF6e0f0c5qHU7RvZsp+3S0+J
	DoX3tWZ5O+tZiiv6YYc9Xo97yRCH8ncKdtYH+kUZjFXqnC5H9anWbdhKjekgCcaxEfEw=
X-Received: by 2002:a05:620a:29cc:b0:896:ead2:a657 with SMTP id af79cd13be357-8c9eb131963mr1402435985a.0.1770111405313;
        Tue, 03 Feb 2026 01:36:45 -0800 (PST)
X-Received: by 2002:a05:620a:29cc:b0:896:ead2:a657 with SMTP id af79cd13be357-8c9eb131963mr1402434085a.0.1770111404797;
        Tue, 03 Feb 2026 01:36:44 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ddcf8aa7csm881056566b.9.2026.02.03.01.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:36:44 -0800 (PST)
Message-ID: <a74b8e61-6e15-400a-a7aa-d589f3545421@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:36:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-binding: document QCOM platforms for CTCU device
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
 <6019b38d-3a15-41f5-989e-1f576c327446@oss.qualcomm.com>
 <6c823646-9085-409e-a692-ae3e77347742@oss.qualcomm.com>
 <5911fe77-fe2c-4321-96a9-a1b6b3b5d1e3@arm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5911fe77-fe2c-4321-96a9-a1b6b3b5d1e3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6981c1ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JA-vdinaGFA0ZwrEKSsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NiBTYWx0ZWRfX8l+y+qwXP2Bu
 5DjshESnW1MZuEJDMS6BJqVLaYu+6pzRa7RlYjAhnZSvMYXz986gOiHKk9fF6nnMA5EJbbnXnkm
 vsEsCrZqHDb/meqPgc90bKnZ3EUmVku3azOfB15AzlYTrkWXF8rUl2sDL88CVUnQ/P6L/hftz4o
 tB4ZqpKfmfrVg9w4RV46BJcIGldxsOD8aKPUYZYxr9DALVdUH+aPxJggwbiyygqaYsPidjL6rrz
 4fvZjg3EnEIy0PDL9JmMA7Pmbju/ktO91TgVyYAUFTgoLHEtHLEMthxIuirgyg+AFzi3QhRj6Ug
 9FVeTGrGHpC8VK+h7BCptrkEFbQRRkICLg8dcWTVCZQPK4VSSn0mXj94iRY5SdEmknyMxP9b2iB
 /jQrMc5yCX9kPh9dqU0C1duFdFnwINYeWK1y/Z5pAfsvnRjTtmDdmlXHrFBNnlYjpCwFNaz5zat
 cHJRlxpiIqjeM5+bqmg==
X-Proofpoint-GUID: ye9WwkgXLSfLO6RovhFDkLs4q0CrLWps
X-Proofpoint-ORIG-GUID: ye9WwkgXLSfLO6RovhFDkLs4q0CrLWps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_013647_182924_CF5E2AA2 
X-CRM114-Status: GOOD (  18.24  )
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

On 2/3/26 10:31 AM, Suzuki K Poulose wrote:
> On 03/02/2026 09:00, Jie Gan wrote:
>>
>>
>> On 2/3/2026 4:50 PM, Konrad Dybcio wrote:
>>> On 2/3/26 9:08 AM, Jie Gan wrote:
>>>> Document the platforms that fallback to using the qcom,sa8775p-ctcu
>>>> compatible for probing.
>>>>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- ctcu.yaml
>>>> index e002f87361ad..68853db52bef 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>> @@ -29,6 +29,10 @@ properties:
>>>>       oneOf:
>>>>         - items:
>>>>             - enum:
>>>> +              - qcom,glymur-ctcu
>>>> +              - qcom,hamoa-ctcu
>>>> +              - qcom,kaanapali-ctcu
>>>> +              - qcom,pakala-ctcu
>>>
>>> Platforms with existing numeric compatibles should continue to use them,
>>> so that the mess is somewhat containable
>>
>> Sure Konrad. So for Pakala, I will change it back to qcom,sm8750-ctcu
> 
> Why do we need different compatibles for the others ? Are they not all compliant to the CTCU programming model ? i.e., sa8775p-ctcu ? or even,
> a generic,
> 
> qcom,coresight-ctcu

It's a huge anti-pattern with the DT maintainers, since a compatible is
the only way to effectively differentiate different implementations (i.e.
instances on different SoCs) of an IP block

This is important for the case where a DTB is shipped as part of firmware
and can not be replaced - if some quirk needs to be applied retroactively,
we can look for "qcom,glymur-ctcu" without affecting all the 50 other'
users of the effectively-identical IP block

In this case, we're already reducing the impact on the driver, as that
only looks for the single fallback compatible (qcom,sa8775p-ctcu)

Konrad

