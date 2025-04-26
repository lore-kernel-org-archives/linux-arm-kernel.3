Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9019C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 10:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJpZvWXgtHuZU26lIpKxv2J9vl2iSDRp1jpslHEmWKI=; b=gvJjAt1X9Y+k7NmigaEK3xqY6E
	7MzByma5+LPIKadbC7u6qNpk3OGkOLbbpZOqI5kJp9YgST8z6QH5ad1GPGyNwqBYTrOrSZBZU04HJ
	ngGrFrYv45F4cBg5PoKZoihCGTl6ANCbe+INr9jU3ezxEsu+yWeuxEchzt02b05shktDVUjeP+lBH
	x9ALs+IY9J3do/2+ycWNwEWJxyXIKdWMRpMyZlo5Sh9uLSGkgcgRN/JowqFyPUjpc27JZR9SB0dkw
	fuNnCkBQle2jcM4R4xGKPNFPLgtMXGjYvVP/Ej7a4RKA+du+ELf5QVITaxs5Y61j632uCQjaXn1Ix
	OJhN2IRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8d7H-00000001suW-1sij;
	Sat, 26 Apr 2025 10:50:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8d5O-00000001smI-2akd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 10:48:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q1vMGq023714
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 10:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DJpZvWXgtHuZU26lIpKxv2J9vl2iSDRp1jpslHEmWKI=; b=G1XVeFCqeV64K18k
	D+nNmwVTTSzGjSYxggyku5VPu1UdxPOxm85OuA7HWLzt4AUAXEatMgGS767fDH4R
	W/6oyMft4wNca25RNUIm1/xD0s00h7OmjiUbruR6cbA3qcbtx/l9I8qIvLGAXoEw
	1V8rYvjFA6Or3PbhOucfyRqD38miP7BFEhBS/0ZySZ7SM8u4PHdGmFJKUf+wOvtr
	gOUEWy/QDhqDT+kdzOuspZwDMVNcQj8CKt5Ajsa3oq1Glogk6Onzz3KBZu5D/uEI
	+HJkRuDIh6izodPEcC2iDS+EvKVUhXcttEr+2FgbDyPUexOBwgzcCw9JN893uPs1
	KJtvmg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6j958m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 10:48:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ece59c3108so7660296d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 03:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745664521; x=1746269321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DJpZvWXgtHuZU26lIpKxv2J9vl2iSDRp1jpslHEmWKI=;
        b=p1/oEf1oNvLfjNjuJvCWRTssdGAGuBkWS8svgL1smaaaPBMv+QevCZr2ktWMq0Bmsq
         DiJjFNZOAQvUmhVXjhhqi2G2d2Bu2e/gKPEIG+HAGnuhkzBwypXZyP9v6xiGugO0Zp4u
         7C88+FtGYWSCqOwEpdJ4dNdFsHUrx/+puDMSEazqZQ+EhH0jWCkd/qTBOc11ttY0zb56
         ilb2QbrTdCltyO3a44wI9mdv0hm+LfR8WR+IpeKM/obIsQkNk0tt2Oc9Q3XmZuan7aTY
         WwJ7caxYK73i2ThQcZ/4LOEEI1B6PlDii/aXt06U5aaV5iqV3fTlJx9ZURyVgmBHXY0Z
         +38w==
X-Forwarded-Encrypted: i=1; AJvYcCUGb/x477INXQMBWVdpMt7tjUyNs37vLKZHHklLwNdX3I1fTNdE02sV6/Ah0sFdoQz/CVHa0uaBk5qmJg0tUow4@lists.infradead.org
X-Gm-Message-State: AOJu0YyBLnF3ZFuSP/uSr8T1UBecPSXEwu8V3L9Oy6IKtMBOaSBZJPr9
	ffcgWcIl8sgOrZotkAwza7KOuH7BBe/WynSaaGMoJD0okkKzGsPh+oitxgv1g6NYEHSpoO9a4E0
	CQYVugu7ReqGUvzOYXTVzf+ZwjyrWt4h87ae/t7Wfqdcsjd9Ov22QrXJMAnnwGIOt3VrdQ+YhkQ
	==
X-Gm-Gg: ASbGncv1ZdbZ7SuB+c3j7Cfe1lzUREIjr6JaUto2WVDUHFvwEYq7FYVjPhb2/e1vrKt
	cfH9XDoOTxq0iic25HYI+V6kA92RVEHKKvaWTnsMm331oFqV20uijp/4qKiPCF7kTX1pzq8Wn0m
	3u8EBTBdr9YF36wRCkek6R6GwOCAwD89T0CRMy6d0QvZgCOLaAGi4CsYM5qTpKGJi+j3yyT0HEo
	Ldz9DxssAzvbo/AYcjFJAWJVPul9e9mjm6RFHIF+LwAtOWiu3xqZUTJBMc9VeXn/FirXhkP/xBp
	WdgSdaxnJd2nTbCeYoiNVhhIzPVnd9eJQdFBhl66He8evpafb0j4Q+aLXb2R63eS0eE=
X-Received: by 2002:ad4:5ca8:0:b0:6e8:fcd2:360e with SMTP id 6a1803df08f44-6f4cba61ff7mr32939246d6.8.1745664520782;
        Sat, 26 Apr 2025 03:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF66thbVT17q0t+hsUlfIDPNUs130uihaEVBIxsM6mBjrr8hzmW8LMlanJd82uYVVyB8uTOEg==
X-Received: by 2002:ad4:5ca8:0:b0:6e8:fcd2:360e with SMTP id 6a1803df08f44-6f4cba61ff7mr32939076d6.8.1745664520440;
        Sat, 26 Apr 2025 03:48:40 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7014006desm2478040a12.31.2025.04.26.03.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 03:48:39 -0700 (PDT)
Message-ID: <17a1a4d9-fdc5-477a-bf4e-91cae5a62479@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 12:48:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
To: Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
 <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
 <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
 <aAt54vikoREWZyGY@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aAt54vikoREWZyGY@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA3MiBTYWx0ZWRfX9CXEk97a3Ij7 dQg9sumBY5L0SO0tAuSZ2CJ45On22pjYmbYM60Vhdlxc+5OyrJs4PlKifA06YgU6I9HDyDJGSh3 +6lDASABi908aWrzjPsKGHVr46rCPgcYr/5qIWKadcacDs/n/DoDm9shoMh04rjfxwU3OtZFs2O
 IYOloW+wJOYVGNqA/T18N3UwoaA9uFi0XAQvL9CYBmwW0PeS2zHXQqYVohk84cV6Y8y3Dqzry6B 0AWkpMUgao+cODgDryf13799v3KrY/EmZOFgxDVp0dF0qXADMC1KSzYwe2qHetYE2VsyiKXFYR4 9H+HdlTtAmOQXeL7Jle7B9ujwISR+0YCbknLaLUhJEwB802/AlFTy6nGjj1O+bsQCnu5AJiC/t7
 C6QlDk9dWR4sF6A9GSod929VfJ0P2J62pF9rETbt8MqKMKqtoObsFqcuuTUrys8+uQ6bF0lj
X-Proofpoint-GUID: yjoTbpJH_ErVuVrjCOvo_8zPdPlKTU2-
X-Proofpoint-ORIG-GUID: yjoTbpJH_ErVuVrjCOvo_8zPdPlKTU2-
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680cba0a cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=8SvZGl_aAWB78hht054A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_034842_669982_56324AF3 
X-CRM114-Status: GOOD (  16.74  )
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

On 4/25/25 2:02 PM, Johan Hovold wrote:
> On Fri, Apr 25, 2025 at 12:03:06PM +0200, Konrad Dybcio wrote:
>> On 4/25/25 11:51 AM, Johan Hovold wrote:
>>> On Fri, Apr 25, 2025 at 05:29:55PM +0800, Wenbin Yao wrote:
>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>
>>>> All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
>>>> missing in the current PHY device tree node. The PCIe port can still
>>>> function because the regulator L3J, which vdda-qref consumes, is voted by
>>>> other components.
>>>>
>>>> Since the device tree should accurately describe the hardware, add the
>>>> vdda-qref power supply explicitly in all PCIe PHY device nodes.
>>>
>>> AFAIU the PHYs do not use this qref supply directly so it does not
>>> belong in the PHY node (but possibly in the tcsr node that provides the
>>> refclk).
>>>
>>> Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
>>> qref supplies") it also won't have any effect for pcie4 and pcie6.
>>
>> QREF is a separate hw block distributing the reference clocks across
>> certain on-SoC peripherals
>>
>> If its power goes out, I don't think much of the platform would be
>> functional anyway, so it's redundant here..
>>
>> It doesn't have its own single register region and it's frankly
>> one-shot-configured way before Linux starts up, so there should be
>> no need of describing it at all.
> 
> Then it sounds like the qref supplies should be marked as always-on. Can
> they be disabled at all?

The best answer I can say is "maybe". I would (without knowing any better)
assume RPMh wouldn't let you turn them off. QREF predictably takes VDD_CX/MX
and some additional lines

Konrad

