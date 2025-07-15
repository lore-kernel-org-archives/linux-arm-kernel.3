Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C601DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 00:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wODJleHZ+bVcBgLQTtzGXHzrVqiJgA68FlyszfYFYek=; b=k9qXNJZzARy+nIfJzDhAWwxI01
	BfPKXuXNK2wGpL3ijdGo3nrrsusuN00DnHDmZL7daPGwyaTcst2cbH+lzaVB/uC6p3evQqG8C2zG+
	jB3NYlNEHtGFg29Ddj+SJiY92O8FtjQhexTkKQbbY9IF8xJUoydubRFGA9gkG2/EYRtDqbQxQTThm
	LsnF/dEgf8a+0wsBLjjNl779mEJikpSCYvIvOCZBytuYGcWPu8TzF2dZlOtEqP8kZZh+vRCAYnFrG
	kJlbi49EmeQZq5ARWIhp7FlagkTCL0Kyx/Po6HBGGR+KsLLg7x5WgbBxFUGnxCYt8eEjhR4zJZKLf
	oGObJM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTm6-00000003fcg-1PUa;
	Tue, 15 Jul 2025 00:44:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTjK-00000003fOk-1aI7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 00:41:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EH0Y2O028873
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 00:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wODJleHZ+bVcBgLQTtzGXHzrVqiJgA68FlyszfYFYek=; b=FKWnFbnWGotIx8hu
	v6oXPGBfNGvBWCFQ0pFVoR8JL3g2qXR8CaoqHR8FF/guH4VNKz9xeLtxnmCjtn94
	eBG5GCYHF6lCt2IWX1rZZH7XiHBsym1PO+TLGOQEZqmXqcGNUNiBnjo4hJKVBNo8
	MQJANvaMixLhfBCf/+XEttcHmpb+dKvHUFloIi9aAAKRlDqrCGwsm5iOzaONXBWe
	+V3NWd/o4UNMuFzRh1E+R/nCI8FyRamHq2rqgEjavuAq0X3HuIPKXuvHSIqe/q9k
	TF2gyBByfsJsE+gBE/7Y7IUP3D8rAd4RkqIl4viv+7PwrH/4y/jiarkMwKkIAbk+
	m6pkEQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmxme3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 00:41:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f77f86f6so46381225ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 17:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752540069; x=1753144869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wODJleHZ+bVcBgLQTtzGXHzrVqiJgA68FlyszfYFYek=;
        b=RrvBkIL1E2Rd/zjmRyYTwMoIVtqGWKVO+xOC8Dn5G3Hd7UIZIo6BR/63FU990dQf37
         ckSDJ+Mpe/tX8RZ2ZbhpeeRu3vzDU30XNGSruuzBidaK3EhrL4MP60z+2On2pLx0t5SK
         1vLnP/SiazVyrRT4/5h4MbShADREwZxITQJ4sC9+DbIPCqdjw0UCoDJSKk0yTWB/40JV
         8fnTlWXdVChOq7+rEwiu7Jbh6/IrIgSpyLnqJ1KMQl1twyH3V0IvztQ7E8ezuCO4d78i
         Ddb+fNMz8ogACaXetKiOEAC1kbZEw98eSjIv94kJzuzOmNtwzMv2ytP0mkiy0Tm+BFVf
         egHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx0Gx5g7vwWS98c7oEUY8uGzC9BXrjnBOstOq1g3mu1jybThl8lzGu0htLV5b+qjos6+zHMZLlvUWktbkQn0rR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/EQDGO0NCHcrC4ozLAbBuKI1OND8P1SHuJdU9qfINPVzXRbSt
	sm9R4tryJxYYjNtbHsBiWoA0ZISuu/dQ0ShgH4REJQ6REvq7NDAAFjHdUUdlPs9JebijHt1QDO0
	4RqJw2bR9vHiPPS+XeoM9BgxrYG6pKvrFM4GyfU8O3DXv2LC9Gxkprk7aiAf727ZB778asVT7j1
	Et3Q==
X-Gm-Gg: ASbGncvCeRpLeVZpzkKO3h6YNfVK7yHRQqDea4+c9qi2LMwCmVdaKuSEXLsEuitz5Rf
	pf+CWM5RElMjR6MlRBGRoYaq1YPxZj9Bu7CyEqRUUcIlyBfqiA2iW1LD/Vb4SbWkRE+l2ESa/na
	2WWKKSp6UhEK8Owck1A2pwJS9g8D6erCdkUmpOU425TnVLaVn2HkI/1zClNcXqdfj5OuxpSw3JU
	AnGziFrPkTloYcUm21Y/nRMNrP9av7fqEWfIhLWn1WQLmUGjqPUkIYhO3foASm+yHnlU7u0d4TI
	/1eBmX/HsW4W+J2lLFZq0re6PYQtVE02XGeMa5IaitA49ugUQkul5hmoMG5pi/VrT/MMc/xLYFU
	vx8tmeOK88goro/NhwmCxomri
X-Received: by 2002:a17:902:ef48:b0:23d:dd04:28d4 with SMTP id d9443c01a7336-23dee2a0946mr248519875ad.43.1752540068869;
        Mon, 14 Jul 2025 17:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdmamRBVee1XJcy8VnXWvKBcAqzZnAQTh81D4R2wPJZjMPo/wxYIsxmLIYNDX5XWYHIlCWPw==
X-Received: by 2002:a17:902:ef48:b0:23d:dd04:28d4 with SMTP id d9443c01a7336-23dee2a0946mr248519485ad.43.1752540068456;
        Mon, 14 Jul 2025 17:41:08 -0700 (PDT)
Received: from [10.133.33.236] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4343e48sm98825605ad.190.2025.07.14.17.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 17:41:07 -0700 (PDT)
Message-ID: <c7cca483-f1d3-45b4-abef-ec5019ad57dd@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 08:41:04 +0800
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p1h5zJl9ytWbFSawUlzYRhtihWtT_t6o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAwNCBTYWx0ZWRfX80D/XLQ+gqVi
 YrmlWypiN5yOfUT7A0DuUdnGnsub0+lLZedfiJLAU38BAu+nlVrX4Jhj4Y27HnC86OQxKIXckWM
 MDVb+hgV46osgQanbYQjI6P9pToz4kwG1+ZVTt+6bIwNw6VWpZPSTu9VifjOzb8x6X7EEC/ppDO
 9LuouXQjqkMCFRqMwJ9SVncggN0rpG9NW1TjQGNNeO/IeknxupZTAZciqbLElRUClDCjmOZyiBx
 PzSrcVe9/RJcJsU0HRfF/NZvx6Rc6NIwgoGTUyG9tvHfVurNQbcFWeOclZMLcMmALmm4IP77tFe
 N/TJ2dHzzMFmaz1bkliK/NT6jDpR4jmguPAdZNdSv9hdRsJJI8n+8VqYs0GrUAGlRfwKvV13jfJ
 dDlF6yWTuOheC0Hi2an5N2F6Ecs0LV8ACP0yn1hTbAfGIZlBnAcZHAsUW838fObS1pYA/Smd
X-Proofpoint-ORIG-GUID: p1h5zJl9ytWbFSawUlzYRhtihWtT_t6o
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=6875a3a5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fSwdLtKwHKkDrnzOdDIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=979 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_174110_429472_F6C974CC 
X-CRM114-Status: GOOD (  15.18  )
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



On 6/24/2025 5:59 PM, Jie Gan wrote:
> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
> the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
> configurations as SA8775p platform.

Gentle ping.

Hi Suzuki, Mike, James, Rob

Can you plz help to review the patch from Coresight view?

Thanks,
Jie

> 
> Changes in V2:
> 1. Add Krzysztof's R-B tag for dt-binding patch.
> 2. Add Konrad's Acked-by tag for dt patch.
> 3. Rebased on tag next-20250623.
> 4. Missed email addresses for coresight's maintainers in V1, loop them.
> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-jie.gan@oss.qualcomm.com/
> 
> Jie Gan (2):
>    dt-bindings: arm: add CTCU device for QCS8300
>    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>   2 files changed, 160 insertions(+), 2 deletions(-)
> 


