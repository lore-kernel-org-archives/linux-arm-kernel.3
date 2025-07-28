Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFE1C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 01:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+yvE7Zc9m9grQX8Who+7K4FyDxflGcLsbflzzwtT3k=; b=anLnA/+Pjw6bmYnP/oEMAwSlLO
	N9+5hwDUOjEt2YXSbU/xk8IM1LPm2BEpD4sAR3LuuEQ+AJznstQS4cAkdz+WVFyVYjV9ZY3QIGybD
	PfNWDh0E5GQaNlXHa25GSyaH3ID6NQyjh3nqMA2mr0UtjanWZ5yPdyvxLG4MYOnd6A396pH6TkeR4
	RWqPU1bOqmGdGJWbGDTT/rI4S0fnNP0LU0hCmk7tmd4Pdju8CHM6cMj1Cl07ADJBaZJi6EXtkWc1X
	T7M5JL0iSaaIotkl52Dgp5SVj8DsrBSt2vtHxlcyaOyP6OOrKfHn9e78xOz/3nhvFvpt7XvP/qe0e
	bjkqvmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugCP1-0000000DPY0-3QtA;
	Mon, 28 Jul 2025 01:11:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugCMV-0000000DPSE-0okR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 01:09:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S0fbsr020228
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 01:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+yvE7Zc9m9grQX8Who+7K4FyDxflGcLsbflzzwtT3k=; b=Kyth0jA/gnFttWj9
	JIXmsod7UCWDn1iTISYqHJTV123OhHBQ+Vs1kzCnSm5R3AU4dlFAes+bGSq61T1d
	GczUKUXSnqEEiKdvA4VDWiaMX9VD6uNBs6n2ikORaimTexAlbPAfBozQ90zcIAJ/
	tTOvyRLzZG9/SYJ8kpUWRNQAOW8uo07OzOPQs86nbjte1tWcknKnn4NcGDDdGo2G
	zZ4Dd5UftMtomtRz7uxcGBPXAqv6C1flc0LVZ3CTBNFnyhCpzWf6RahaF3buThXg
	CC0Ewav4diYz76BmTwr6ALD7b1Qifs7CwgpfuYT/ytFMQx2GRCS2JSbfMr+fWubC
	WIKtSA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2au3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 01:09:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so6421728a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 18:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753664943; x=1754269743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+yvE7Zc9m9grQX8Who+7K4FyDxflGcLsbflzzwtT3k=;
        b=kqNp5HtI8V98d0cvhpsPjtmj9UUUTa4LcF2Tosa/VTbgfzIir5yyxOWv+gQ2MTAqcJ
         CwrbNFZi4+xWdLW2/VBfs828D9fIgfivx8WzD/NDVZwaSYBT6n54Z7igiEHIoNbXm8Em
         Q0osudpudpRAomS17kP0mfREBm/dSl0gXNmiZncimykxzP37AF3I1buulMqK0wUtYImO
         Wh8KWPZHVDYqdZkc7xip2LJZJDEBT1eng/ryvhUJq0xFL6Z42kDotNnYTPJmcsNeAFYC
         r/LXoziEz3/Br/MJkyoMh0/ireLfpHpRNuuZy0Z8IOceI/juKD+My6XHMrqsEzRP5oJ3
         JZVg==
X-Forwarded-Encrypted: i=1; AJvYcCULLAfv94XNhGpGIv0oJSJwH6ZtsAbmWX+MLjBwVv7iIWRg7ExD2y4aJco9Rx8LntXZjiaNATo5RUFPp98aESH1@lists.infradead.org
X-Gm-Message-State: AOJu0Ywogh0pj0VxhKNOrN0QU2PFpPORAXX91KKQyMprV/vbrinSvnwE
	E6jI+5gRLY+bb71mlWd6BXsOmOi3pBzxGwCgUNdVFQilmAMLBynLiPo3yX3iOLlU0UA2l4v0jgU
	nGPNwldFymGVw06G6MG+bjqz6b9ewSUptd426fOBzjXaGe787sKT0h7FGb/NQvdLqr8upr1hXj/
	VTpA==
X-Gm-Gg: ASbGncu+pMRYlF42IEnCX8LVCr+VKL9yJ4j2c6mq7oi96zVy1TN+VPaABfKoyPjxZF+
	2RwwWKXbbyyeO8bDzsXfWzlzr2zc7HSOtLZK2gweV7JC8bZ7GfLmC1805j6Bk1gc+juL54dF6K6
	+U10CrbDk+j2mTuB7zBS7LJHr1nYqXX6CJbzJnSkwhGG5sD3HCbJoxB+o2Nv+Mtwu2F9PPDvtea
	egPiTA1d71IYgC//2QQBpWjRkScI0v0hQMqYb4rAxf7SY8g4KVsG9LLNJYAFu6MmaATYz5pT60h
	pHgIXX/jaq9TznUQbYV5QlM8Zgqh1BzcOLOpYbow5zhkoHRMlW6IHxu5RpGpIMgR/1DCsGGe4C5
	RvIrTqRRiHWKB1vT+qtzHfBo=
X-Received: by 2002:a17:902:e541:b0:23f:8bcc:e4f3 with SMTP id d9443c01a7336-23fb30ab8bbmr165783225ad.32.1753664942910;
        Sun, 27 Jul 2025 18:09:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYCOfj1YqosY7nSWEJrErxiJ8bZl5MREmTEz579acUrZUOuf481S+vvg1qLmm7Mee+b84wXg==
X-Received: by 2002:a17:902:e541:b0:23f:8bcc:e4f3 with SMTP id d9443c01a7336-23fb30ab8bbmr165782755ad.32.1753664942447;
        Sun, 27 Jul 2025 18:09:02 -0700 (PDT)
Received: from [10.133.33.67] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2401e95208bsm12447405ad.112.2025.07.27.18.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jul 2025 18:09:01 -0700 (PDT)
Message-ID: <c6f74d55-6ea8-498f-a05a-000599f93ac6@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 09:08:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
 <c7cca483-f1d3-45b4-abef-ec5019ad57dd@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <c7cca483-f1d3-45b4-abef-ec5019ad57dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ikBcPOD-lForH1tot7IErXdKSnylLwhU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDAwNCBTYWx0ZWRfX0fqM5bBYfS0l
 THG8bjGJr6py8+JV7qZOQiqv+hxD/AtqwgDlDOmuKWGHzW7zKGpm5Swt7nHcig6DHNnvOXdNIWP
 TylMB2/hdXhhQlxangr2KJiEBAe7PyNnoRwX8SVDDDVppdhkxSzHLGvPC6K8B46aTWEEdRDJigz
 421CGgkF1ABKcueR4fEyDd6GfDmeKYcxEOEaFHk7sVMNslu5cCdNvtvT2ZgjhDwpAWe5uQmDG8b
 43Pfvs571H5SGPPQ6iPNNC2JhDIn3rifLgSUPJGOYF0T+J6rq9vHY15bP+tG85f2IoNZqfhcBU2
 hytIOxycceGgARptLYQS+HrmAykkcv2iGzDcOiceysVr7LgvdD7AqoetihEY3qfKPRbNZrbITlL
 OwDfL/qr65WKJwmnGRjKbNWs3LExdS2mGS/+QstPbvH/Jotba3pQDrlz2zfmA704NSx2qV1L
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=6886cdb0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gW6MYXlkPblPBwbZtHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ikBcPOD-lForH1tot7IErXdKSnylLwhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_180907_355608_A0843E4E 
X-CRM114-Status: GOOD (  16.89  )
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



On 7/15/2025 8:41 AM, Jie Gan wrote:
> 
> 
> On 6/24/2025 5:59 PM, Jie Gan wrote:
>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in 
>> binding to utilize
>> the compitable of the SA8775p platform becuase the CTCU for QCS8300 
>> shares same
>> configurations as SA8775p platform.
> 
> Gentle ping.

Gentle ping.

Thanks,
Jie

> 
> Hi Suzuki, Mike, James, Rob
> 
> Can you plz help to review the patch from Coresight view?
> 
> Thanks,
> Jie
> 
>>
>> Changes in V2:
>> 1. Add Krzysztof's R-B tag for dt-binding patch.
>> 2. Add Konrad's Acked-by tag for dt patch.
>> 3. Rebased on tag next-20250623.
>> 4. Missed email addresses for coresight's maintainers in V1, loop them.
>> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1- 
>> jie.gan@oss.qualcomm.com/
>>
>> Jie Gan (2):
>>    dt-bindings: arm: add CTCU device for QCS8300
>>    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>>   2 files changed, 160 insertions(+), 2 deletions(-)
>>
> 
> 


