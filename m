Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4181CCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+7a7BdSUX1H4XYC5sftPvUND0oWh/62HBMHDzpCxI4=; b=lRH5rHDzXi5n9JtpTV1IOg5sRj
	hJvpxY1fXSMb8YhyHFS8ukaByoOm3eUMFOPF/nKOPiyUAlYVzPyBjZhkGGtN3khlBc0Vny/plpGnI
	4Gr1Uehbwl4YV6FyBPhBdUAFIKfi/8t41HlA4uIsM++H+hlWVreHBvJ046lc9UfUIJ7PJO7YJ3BC6
	KG2Aq4EvosrTLeuzFyHYDUIsHM5cX35b8vk0bO1tuUV6roAXvuNNI7ANPzlP/G5wDgxHM4PpVuHet
	pSQN39qn+wFHa0fGQhj9eHE9uwBsO/Urgv8qZ37+lWQeSDbPuHYpitjpppngGg9ZOOrUdAbOCo4CE
	Dq9FiV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBps-0000000CwFX-0SD6;
	Mon, 27 Oct 2025 01:15:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBpq-0000000CwF8-0IXU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:15:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R00FKf1135341
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 01:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q+7a7BdSUX1H4XYC5sftPvUND0oWh/62HBMHDzpCxI4=; b=iGo1ncHIQF3TKNPv
	+ru2TcdU/qQ8oHm/ajlDPxfKBc8QB9mWMKotQ1skrldzEVH+G6Mykk+HqSC6cQtp
	Kv4Mko9pN3cZduZ/jEWAQ18vkpWA2lVizoz9Hjs5fApu/DRRY5Lnsn1Xs7TFk/Uo
	DT89urDTRXH6CmBuvsLPgtPjRsrMoqi33/49LbWLhpy9EY6Xsy/cwSqYeYeH9P/H
	eu+KoYXltw0bLi9GrY9Z7+gfAYC44DgoHfsX74i5ZFBoQruwp9ErukByfsWRAKMe
	IHLws87FHva2+sTfSKgP1wto2sSZqOqwiyicsv4HzfqaTQBaxcUMg3NLrxYyd0X/
	7XMNIA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4g2tkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 01:15:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6cf50cbd2cso2857752a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 18:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761527744; x=1762132544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+7a7BdSUX1H4XYC5sftPvUND0oWh/62HBMHDzpCxI4=;
        b=OKkYhaOOzs0NoF6d72cE2DIPHa6c9y+pED54xuPWHlLx/T8NRYGUhWL7x8bPzuTRSg
         SN9kQqn5cwn5qBIJ5G0AmXSWBu1pc/J0Ko2Qxrhq1tFSSW8e5eXTLXRT1jEt/NZmib7o
         kDxWicwt4OSnJDQKEKve3N/1OdADr5zcLCwehb5mG5djMAw3t3QlMAqjG9VcYeaC4k6A
         4I7UHBgifT7MRGUMcYelecTBw4yVEoCASACxshx0yBk5aMt8VBgfT6aOy5fBIJZKOSec
         279KuCmi5iOUIYEp2fX+bEiYFecuURnuId+rI596/JafP4qByGbYGVLtw64wFaOlNrAd
         8UhA==
X-Forwarded-Encrypted: i=1; AJvYcCUiLrSiFO3cFOR15wYhC7MqxSyLMtL45eZVd3TZQZlPH4LJ2qfQKba8nT2jU/mEATJO/Ae06s1yK5EfThF1xYLE@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl4Be0l6zw+NAvuUVWqNYpxE4jjCWPPTUa8L5d1YyB+GxJF0lZ
	bzYZIqCQ48GJ+xTMqA1PjGtHZHNLZOoe8nRqcjIEZYijqQqtzhJFMVBHoh2YUusTUvaCY3KnwEP
	S2Dw15u51mfWjOo8FIJH0Hh/kRRnVFymOkWwCpMuTToM7+9BVpPGNt7zitESYs53XBsfxYWmmVz
	Z+Sg==
X-Gm-Gg: ASbGnctoMuJ1EPD28Rq26UxE1IA5p6sC/O1lRiQA2jpA2p4OKzcnlndSzF7QTDfN+9x
	IsIUM/t73qv7xBepQ8ymfWmB4codDXxdcnJpgnOJvf59tSw5YrtV5n1O4NvNcjVIq76jaakj5uU
	oGFxPtOIhaaP6bLDXmR5xl//F1oSC9HfUmTA9RM8d+M3UYoP8yEf8i9ii1Q5wEYOysmYyErng71
	WR9eEfVQ94YBVsNjBVelmVHiNGij5EPcnFnbuzZ/ACeKcRuJ66a+Q8j6zPrXTfvuDiavMRpG0ad
	/rOvzYWgJNjFQTqMGSovjCyf4Lu+hz9N5zCG8il6EI6znpQZKig61nix1/g/vETM9dbn1hEoBfk
	VQzEFF0Tq+j+4zJpPZlBeEsBOkDLuebPwNmli48WuLkLZXhIzhn8Ztp4wQ6IHzmuw
X-Received: by 2002:a05:6a20:918c:b0:334:9bbd:39c7 with SMTP id adf61e73a8af0-33deb36ec75mr12023883637.51.1761527743990;
        Sun, 26 Oct 2025 18:15:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvB8qqyzh0X9NyroUn58B+zjJ+gl/No1zjTrW0lEw1jH8sE1qhiGkm3tGhFUWui+5c86exCw==
X-Received: by 2002:a05:6a20:918c:b0:334:9bbd:39c7 with SMTP id adf61e73a8af0-33deb36ec75mr12023852637.51.1761527743538;
        Sun, 26 Oct 2025 18:15:43 -0700 (PDT)
Received: from [10.133.33.212] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm6220585b3a.1.2025.10.26.18.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 18:15:43 -0700 (PDT)
Message-ID: <bcaffc33-851c-4b73-add3-affe864414ed@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:15:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Enable CTCU device for QCS8300
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qqXyVjPV0nKUY4cjRv-uOEt_ssRm8eI5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDAwOSBTYWx0ZWRfX2I4ZLiQm6JS6
 l/JvcOeucEj8zywMiPKLeW8npharxz8oER7aqcsipilDYbVbFQXFQK7ud24zr1P9W5LPr3Eb2G0
 Y9uBx0lLppTdRq3s9DCUITG+MSin9pD/BC6nEI6cTjBlvAbft4ZG5eXjA8RGuwRCVV58tuDU9cK
 h2e4rzvGopQeKb9IudJWYkfWj8KjiECChjU+Zu6NT8pEnghhV5K5943VVDpPAb7MLuC5QQXNWut
 m6Zv2PA2hMJ8D3WVVvw/0MVYKCMNdrcd7R9lRM3jIItU/p/HPjBcx6V/GTMcyM6HdagPgFOBYeH
 UjhlNNgg28MNDsSJgUbbw4j5dPiaY/QIhn5KTom9reG0dIW2d0JZgT4KN5SIxHK6/l6s83sXjgP
 0LU1Yu5W9sAnDZPowP+vTpOeu93OHA==
X-Authority-Analysis: v=2.4 cv=L9YQguT8 c=1 sm=1 tr=0 ts=68fec7c0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fSwdLtKwHKkDrnzOdDIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: qqXyVjPV0nKUY4cjRv-uOEt_ssRm8eI5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_181546_236402_21708F05 
X-CRM114-Status: GOOD (  17.89  )
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



On 10/13/2025 4:34 PM, Jie Gan wrote:
> Hi Suzuki, Mike, James, Rob
> 
> Can you please help to review the dt patches? The dt maintainer needs
> your comment before apply this patch series.
> 
> Thanks a lot
> 

Gentle reminder.

Thanks
Jie

> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
> the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
> configurations as SA8775p platform.
> 
> Changes in V3:
> 1. rebased on tag next-20251010
> Link to V2 - https://lore.kernel.org/all/20250624095905.7609-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Add Krzysztof's R-B tag for dt-binding patch.
> 2. Add Konrad's Acked-by tag for dt patch.
> 3. Rebased on tag next-20250623.
> 4. Missed email addresses for coresight's maintainers in V1, loop them.
> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-jie.gan@oss.qualcomm.com/
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Jie Gan (2):
>        dt-bindings: arm: add CTCU device for QCS8300
>        arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   9 +-
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 153 +++++++++++++++++++++
>   2 files changed, 160 insertions(+), 2 deletions(-)
> ---
> base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
> change-id: 20251013-enable-ctcu-for-qcs8300-ec83661e5acd
> 
> Best regards,


