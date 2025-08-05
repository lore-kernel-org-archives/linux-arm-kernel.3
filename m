Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7DAC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 04:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kHQ2TM2MYW/R6mLsfnEzPj6Fkc3FKZAGp4pSK5pRZY=; b=Jzx1AqkhVaq5p5SiKSmMclTt/q
	pHNLAyIV7Wf2bxVBORe0vksFZUT1RIFRrAeGAX/JRLjmTCAAmp154NJO4gak4SX2m9V6yNsGrg+iu
	m1De+No/jnRI0sAaWATrqtWCenFiGKt/NEuf7oVHLCP3y3xE44yQCCQs3oTlEe3cIPvuYhAsPAeBP
	Lsxl3yxa1RocFVh2GaCmT2WT+6J6hbv3Ej5rArODInA4bO2FxrVNXVYi9i4jmCO6HwkC3QG1o003M
	ND1GeQNYZSUqLA7w2qaV5qq7ZczQ9Hpmeo0lf4zz4aLV5M3pwLE7S3qmPy3hgxIed9nYX/ygARRCj
	ftGbLSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj93m-0000000BjZA-2ECW;
	Tue, 05 Aug 2025 04:13:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj91E-0000000BjQt-0BZg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 04:11:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574K3MWa003583
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 Aug 2025 04:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4kHQ2TM2MYW/R6mLsfnEzPj6Fkc3FKZAGp4pSK5pRZY=; b=eayeg82Aq37cLLGQ
	BLdT1z6L+tJ7UuCQtn9YY4wLXwDJQ32uofVOhjslGd0/H7robygmo8SzBeO3IEif
	t4wdgipGUV1OoHNeV+OIcohrvOxUF8Q4ODbKwYS66ri62WqbpL9ITB8J5mwgLC/R
	vRiZv3UREZ3Jj4vh1rK2KsF6qQXJ1MsL30nNIHyfxoyxIYIbvLsO5C0VgZNix7p8
	K+7+5/TDv+KgRZMUYBIHaEJ8LYK3RJUHhry8vwjT4SKkhQGHI6F4059vevvOCwFi
	aIoCCansChltb5OzRo2Vv2f24eSMqsz0cyGR0/Q27nUMjps0CAec1ZwNUB6r8jiK
	+jMI1Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b3j3rygs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 04:11:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76bf30ca667so4292190b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 21:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754367077; x=1754971877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4kHQ2TM2MYW/R6mLsfnEzPj6Fkc3FKZAGp4pSK5pRZY=;
        b=AAdUWKGXR4T55w0T+o9E+V//vI7T8PMH+8rTgg7RT7TYbtxrtlxJkznanL4jUhTZfn
         fRtCW8xUf2T6mUgh9njYF3ENt7ewDQhMDhm4KbgLCQ2N9++keG2TkaGMm1EHvAk+ahXz
         n/JErdKzkslptB+AkiNTC1dmq82o8w777RbaRDhKDrtPxYonHHzZyAZK62vZvUdS03ue
         Zww92cEj8OJUcPKzb1vNfGFoIL2XMCRbSoQ2d6uSH+lcqZNd0v/Trkc36NPSVEX5qClS
         41JAG1cnhOcnnNahIcYTAnqof7omH/V+xR3+Vg7Gr9/jSImK3MX3+CDSV/f8i616t56A
         4BPw==
X-Forwarded-Encrypted: i=1; AJvYcCVpzTKpHsJrmDfz+r1lIyVLm+Z75tJEPTAWKKB1qF0rebHKKodtTMVjQH7WSHoExiyEJhRdpVDy+LIWreN3BD30@lists.infradead.org
X-Gm-Message-State: AOJu0YzIz9t5I9nUfUs7oAX5k4VbrB+8HpyZT6kNgZthR19OPOQ8vFqQ
	u+O1/5Vh19y7MuYOCjQrLO1qMaDBfh6vDHu2AtjreYsF0PUeXkc0x7qBuQg6UtKSvis4NPTM944
	gWtg5AjkAje5dksOqnSy/O8nlVxzvkJB2R0J+aHP+KBaemSzOquqGhURak+vKw+nwx+jUq9hrjn
	j9/w==
X-Gm-Gg: ASbGnctcip5l7Yg3VNRfKO9mimRcT/gDuIkV16guLHcY62IQ+Ts9sy6w2rwvEnaFsEh
	9qYf7tLvn6Gec1xn6TugTKgnIknogaKpWLCBgqBh9+tGaKSHLq75v6p4Gl4jPlb8OiZUM8qDLRx
	Y9r60ajNuCr0kwOHaDqNVMf1eZxcSEI5fZSKtM5OZ1lbRBlVxsbdvvoph+XJCLGg93634PC4EEH
	f2AJZOvA+XR7eBGxplmlVlkHbwz92v8WJtW/pegZ5QAaZLVuK1vh20bbl8cRciMLMqx9k6NnURs
	ACOWoKoNl6Cm4YeIH0NM+pJdTasSQHv0QRajaLNSDXwS4WMQWoOZaGPvoLpKb08GFjC7VN/6qf9
	eZGYy4zWZvLeEJpd0xo0GL+O0/ARLxA==
X-Received: by 2002:a05:6a20:3d81:b0:238:351a:6437 with SMTP id adf61e73a8af0-23df9189244mr18263446637.43.1754367076696;
        Mon, 04 Aug 2025 21:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbtTAk56CVTseMtlmWU2iTkuQTCHIahoYybtZSWtXQGXXH3Mha4XmAcqOGGI95Im8nvqjAow==
X-Received: by 2002:a05:6a20:3d81:b0:238:351a:6437 with SMTP id adf61e73a8af0-23df9189244mr18263419637.43.1754367076319;
        Mon, 04 Aug 2025 21:11:16 -0700 (PDT)
Received: from [10.133.33.164] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bf067e310sm6747918b3a.25.2025.08.04.21.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 21:11:15 -0700 (PDT)
Message-ID: <b5f8fce0-afe8-409b-b43d-fa9f413cd442@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 12:11:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
 <c6f74d55-6ea8-498f-a05a-000599f93ac6@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <c6f74d55-6ea8-498f-a05a-000599f93ac6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7MW_bX4TagAXa0goZtowDlqcbeHYYEue
X-Authority-Analysis: v=2.4 cv=TZ+WtQQh c=1 sm=1 tr=0 ts=68918465 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DOWyofZu-bKnVY_GfnMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAyNyBTYWx0ZWRfX1FXqJCaVnBRf
 u6BzkSViPalEk09qdLswN2Ou4HP7wT2oUnWXLaB8ZmPlyOC6QvdCnTrBtip2ZY5i+chbekAte/2
 aqLZ1wmvG6n41digL4s3QZe4OLAl5NQDTGBPG/WWaa/H3jeR2p+h+Qfa6cdUzjiEZ4eOXZ+VWxM
 Xdsik+SlFGR8sGlMtZA/L6FFhYVyHa4WurnNXMDeFS3tga1Rozc5avJ5Jy+JMJq/yunhJLojddp
 94DqryGNLxlwWvUz+nH/u1hJb1CEgNxFjeYVo37czDH9rPyrDJngNIOlbOaVj9pCPWWH20FVvOk
 gnxuOaGpX57p/7HOf0QxU3bWpaKP4n8DL7Ko5o3065rmomgNXbB8RikEv152qrBFuwplayDj53J
 BsE7VDHUIX9pIPdan+KrUhNmjiiuGKiSMSP6vuL16mqt7kA/80WOWU5UTlHgWga29DCxBits
X-Proofpoint-ORIG-GUID: 7MW_bX4TagAXa0goZtowDlqcbeHYYEue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_10,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_211120_096865_CBF536E2 
X-CRM114-Status: GOOD (  16.44  )
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



On 7/28/2025 9:08 AM, Jie Gan wrote:
> 
> 
> On 7/15/2025 8:41 AM, Jie Gan wrote:
>>
>>
>> On 6/24/2025 5:59 PM, Jie Gan wrote:
>>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in 
>>> binding to utilize
>>> the compitable of the SA8775p platform becuase the CTCU for QCS8300 
>>> shares same
>>> configurations as SA8775p platform.
>>
>> Gentle ping.
> 
> Gentle ping.

Gentle ping.
Hi Coresight maintainers,

Can you please help to review the patch?

Thanks,
Jie

> 
> Thanks,
> Jie
> 
>>
>> Hi Suzuki, Mike, James, Rob
>>
>> Can you plz help to review the patch from Coresight view?
>>
>> Thanks,
>> Jie
>>
>>>
>>> Changes in V2:
>>> 1. Add Krzysztof's R-B tag for dt-binding patch.
>>> 2. Add Konrad's Acked-by tag for dt patch.
>>> 3. Rebased on tag next-20250623.
>>> 4. Missed email addresses for coresight's maintainers in V1, loop them.
>>> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1- 
>>> jie.gan@oss.qualcomm.com/
>>>
>>> Jie Gan (2):
>>>    dt-bindings: arm: add CTCU device for QCS8300
>>>    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
>>>
>>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>>>   2 files changed, 160 insertions(+), 2 deletions(-)
>>>
>>
>>
> 


