Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E879C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUaVf9VHjTFcpUGhpbhMQ3Ge/NGsAqULXFPt+N3iG1g=; b=Y0/r/Uu+thg28uFfoxPtioilj4
	mPeFCqflHTR3n7aPoOIFd+tQtrt/AZMz5lDpBEpuAzx6wZpVd67GuLwiQtf9is5NWDKTXzrgoqgRX
	I/InfyubFLTPZNSYSHzo1Yuxftx1tIm5ZLqcSJYoyQCPsLli850BoaS3Q2GHAzQESnXklckVPmqau
	rBMjNT56b0c2ha1vM2A+Ux01kZsECBZD0kLPpNo7ZvFdqvJ39CXVAoR5D5dc1bZzrHc9y475yEWoI
	Ka6mc7pPFl9PLn/ZEhxWaZ/gxVwi7gm7V4Z9504HiIhTrpNkLtynXPSP+ooCTeVujIxd+Z6ujwjW4
	Bnkxy2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2Ni-0000000C4x2-0Emn;
	Wed, 30 Apr 2025 08:01:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA25h-0000000C1em-2WUJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:42:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLaY6C020989
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 07:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUaVf9VHjTFcpUGhpbhMQ3Ge/NGsAqULXFPt+N3iG1g=; b=KwhuTM0g5TRdRuxp
	p1yF6augN97oLuwZxtZH2sKDfY7ZtdFM693woo4X7Yv4loY3aePEnAlr33y58sUK
	Vo9SxrAATy7sSqqKWHu4n+2qNIi8wfa27i911CZJf51wYs+QRdhjkipbiXSHUPU1
	yhZTLXodLC/XzKZPQIVETYljejBUArTrAlEaXOP0bsq9Q743PohUecKop0d3Bkyy
	J4cfDTNRsSh5Kq0kWhveAIGuBYyVAnEcMD+XRb+i2kiqgDNyh6VGwgO5vN6d1np7
	JFjwCIj7trqGR/baTEZlk44GH9CZzvqnInmtCUrpH3BKCXhHaj7aFLYUg9PrODnD
	i2hfzA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u1s8e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 07:42:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47b1b282797so12864641cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998967; x=1746603767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUaVf9VHjTFcpUGhpbhMQ3Ge/NGsAqULXFPt+N3iG1g=;
        b=d0ANiGHoPCDJLam76ugmUPFp4o4+IJnFv8YXgwg6xRI9tW0hgWT0QIBkgA/vYD0Mgc
         Q6WhbhqvUoYJGC3vYiMs28ycEDVnFsA6KGwSF0o5ioB5P+Zshp3J+Z3iHDsvAOXJ/X9+
         HRLstzfq5wWnsuDwbbUjMbyoFrM7/eNNTgKuKZxaZ9ooeqRc3ibdTTsrLB2jxVtbwpwH
         Asci4rkF+QVZq5jm0wbILDyZTXKXHZXaWqP/v+cEK/k7jqTenJD3+UA+NkjgCI0fJeKr
         +CjQhvI+SVMTaUY3Gv2juspL4gZHeWv+EaEj5pqG+1/wFU6S8UTi9G9cQovz6KaqseVX
         adtA==
X-Forwarded-Encrypted: i=1; AJvYcCU2jvZJsaG0hjWJkWTGRdrrE7OhZYgU3UdIgZhCUN1CFgXXz2djIEmCu0xmKJsLY9Wiy/11t3VCgKtdjwfwU9ew@lists.infradead.org
X-Gm-Message-State: AOJu0YwfEz3llnMIG/V/d99rk+qiEnxE9VW4CndYwSzfDBF1OsgpmrRk
	PtE+TOE+jJMeaNIM5/yB6GLF4GV7HP/hS82c8K2s18i9PoliTMqUgFX6IhBguZ1Lfb03aqAtN+N
	yFQmLckwrfG+5k8AclsmwIpTb4M/GBFm5KrXZtixxlVCTea1q5ssmztExpS2VUO8AgR6/vgKsaQ
	==
X-Gm-Gg: ASbGncsHskyMkiOjmNzABa19dxnGP/oaB2JBZDySKIWoXxUOV3TrXuSwGUId6DT1WOu
	TiyPh+k4yA/e0JHSp+IJoJ4ix/hJZNusTMs5AqLaljjUHc7urrXRQ7+JzapoSvYVLxjuuzEIw4i
	DIWKeg4yMZ5APQDa/LbPT4mBgQJCyOhDh4s98rFzBsCcio2W9+H9boPCSCFFk+WAdOehVukC+SN
	Mk7dpy9coiL2Jm2D0LWeXMCYOQXr6LP75K8682BAwCuwAIwhv9UM1SUzxTzfJ5tlDKIhKHhhpFm
	ch1arbsoBNAif2vXcwh3AMJdl0DZA+ljmFElb3ve3v0dTK3NwDp+pPgkDdvDPON8ElA=
X-Received: by 2002:a05:620a:198f:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cac857731emr77706485a.3.1745998967100;
        Wed, 30 Apr 2025 00:42:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJFIi0dncAmVoeKyLj4QkQJlHUjRZmoK4qLIjwW+UX7y0o88dA8BCn6koU1U4nahlVTE6QMg==
X-Received: by 2002:a05:620a:198f:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cac857731emr77704285a.3.1745998966696;
        Wed, 30 Apr 2025 00:42:46 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec28db2fcsm278111366b.17.2025.04.30.00.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 00:42:46 -0700 (PDT)
Message-ID: <8d18adf7-c1a6-410e-b3a5-496288825afd@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 09:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
To: Qiang Yu <quic_qianyu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan@kernel.org>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
 <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
 <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
 <aAt54vikoREWZyGY@hovoldconsulting.com>
 <17a1a4d9-fdc5-477a-bf4e-91cae5a62479@oss.qualcomm.com>
 <c4115bbc-e120-4a20-b6ad-a0d5266319d3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c4115bbc-e120-4a20-b6ad-a0d5266319d3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=6811d477 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=U8xqaHzKl31ljCD5roAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA1MyBTYWx0ZWRfXz3eyB62gEbDW aB2w0j4vdHbTNuc9zQuLNtwQuP6sMt+eCbUtO/blj/CSQ/Qm20106Zc7CyrVThLJEOlZ3WhSaUv WHRiJffLPM/KHMO0yi4Y3YGMwn849E++UES3ULsQsoLjIrcoV7duqbo3h9nawGrNBaoqQA+yJGM
 d15j9C/edKaBDghxSJ/2ffhaZr43IkXG03rTuooOQk1JpOztgpG0JuMOJmwpPdlWWcttBBcV+SB SqWOMdIA+S/4nKZ+bIFVpmIAx6xniUw04WkDou7w3yecpcy5c4wK6fg2XpVg46Ry84QYHl7MXuk x0KUaH1Hax4/sGvhRPSSQ9ITAO1N2gw070fMGfFYti6xU5GgvpxlLRbJwtnaXvD+MtsXATZ3JKo
 Xx9Pegkp9BkcMqmkf/wQlmucLrDCT4n4Y0QJfxGNkMk5AXUg1FrqcEsc0La2yLMULGAQUhAB
X-Proofpoint-GUID: g3-79uo7RtXjvt4FFkMqf2Pjx8dPCsCa
X-Proofpoint-ORIG-GUID: g3-79uo7RtXjvt4FFkMqf2Pjx8dPCsCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_004249_805923_DFE48FA4 
X-CRM114-Status: GOOD (  20.82  )
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

On 4/30/25 6:15 AM, Qiang Yu wrote:
> 
> On 4/26/2025 6:48 PM, Konrad Dybcio wrote:
>> On 4/25/25 2:02 PM, Johan Hovold wrote:
>>> On Fri, Apr 25, 2025 at 12:03:06PM +0200, Konrad Dybcio wrote:
>>>> On 4/25/25 11:51 AM, Johan Hovold wrote:
>>>>> On Fri, Apr 25, 2025 at 05:29:55PM +0800, Wenbin Yao wrote:
>>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>
>>>>>> All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
>>>>>> missing in the current PHY device tree node. The PCIe port can still
>>>>>> function because the regulator L3J, which vdda-qref consumes, is voted by
>>>>>> other components.
>>>>>>
>>>>>> Since the device tree should accurately describe the hardware, add the
>>>>>> vdda-qref power supply explicitly in all PCIe PHY device nodes.
>>>>> AFAIU the PHYs do not use this qref supply directly so it does not
>>>>> belong in the PHY node (but possibly in the tcsr node that provides the
>>>>> refclk).
>>>>>
>>>>> Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
>>>>> qref supplies") it also won't have any effect for pcie4 and pcie6.
>>>> QREF is a separate hw block distributing the reference clocks across
>>>> certain on-SoC peripherals
>>>>
>>>> If its power goes out, I don't think much of the platform would be
>>>> functional anyway, so it's redundant here..
>>>>
>>>> It doesn't have its own single register region and it's frankly
>>>> one-shot-configured way before Linux starts up, so there should be
>>>> no need of describing it at all.
>>> Then it sounds like the qref supplies should be marked as always-on. Can
>>> they be disabled at all?
>> The best answer I can say is "maybe". I would (without knowing any better)
>> assume RPMh wouldn't let you turn them off. QREF predictably takes VDD_CX/MX
>> and some additional lines
>>
>> Konrad
> The vdda-qref power supply feeds the QREF clocks, which are consumed by PCIe, UFS, USB and display on X1e80100.
> For PCIe, QREF clks are provided by the TCSR device with the following bindings on X1E80100:
> #define TCSR_PCIE_2L_4_CLKREF_EN
> #define TCSR_PCIE_2L_5_CLKREF_EN
> #define TCSR_PCIE_8L_CLKREF_EN
> #define TCSR_PCIE_4L_CLKREF_EN
> 
> These QREF clocks are not enabled all the time and are disabled during PHY deinit. Hence, vdda-qref should not be an always-on power supply. It should be turned off when the QREF clocks are disabled.
> 
> Describing vdda-qref in the PHY device tree node is reasonable, as it allows the vdda-qref power supply to be enabled or disabled along with the QREF clocks during PHY init/deinit.

We were advised to repeat this for all QREF consumers as what I said
before may not hold true for all platforms and nobody's gonna play
whack-a-mole with this

Konrad

