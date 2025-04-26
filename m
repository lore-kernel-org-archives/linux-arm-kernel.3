Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE3EC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 10:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cti0cls6RpmnwuEVrPBosDHrl0E/TWcIksexIlUz1V4=; b=vOy8G6OnWXF37pAXEO11o0xfzl
	2lJrs+nRB/LgQyD5iLsIGWksk1HFhOEa2M9W0RZ75iOt/g2OMatA+5JWUpgNq20yRdAl07hBsxlpv
	MinG4+moiSJrOeVLFtD2Xq2c6Xlu4Pengib/A5BsxSnNYg5jGDgTj3QKm7zfhTV01oi2J8Ju+EKmi
	6R5LyjNpjHR8cQzkY+cRtXesVvj/bdFX4Ak62KpMgbB/j4u5yzALdqed0djFPV9EilZgaLnbsDsNX
	VQ20fg5tHHGNZFelxRxKKZel9nT3gkZNA2sEbFcThrBPx2EdpG7V82bO0Pc5Vxogu6Xlb2ogOP1Nn
	tcS13TDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8d3k-00000001saj-2iBy;
	Sat, 26 Apr 2025 10:47:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8d1s-00000001sRq-1ZYW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 10:45:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q3Z2U5002989
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 10:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cti0cls6RpmnwuEVrPBosDHrl0E/TWcIksexIlUz1V4=; b=Ak7Bg+weLiLtmPbP
	mt+dNjk8S9Gx2LEOfa1s2nCl+j+2sfhFaLdLzBEEGQngO1cZADpIMgoOTlSRH/fw
	E6BzuUhRBfS5PHLSSl+egKF+GoZlBKBmcXLZYsdMbpc2fLcutXolg+H+5ZEJZBaH
	R8U7jG0OQFIBayCER7RTOoXTDCP1vfn8Jek/obaDj8o3VUoW1MMI1wmvNzwHEAZH
	i5P1Qniv9PrcxRchbcKKCHXijPr7M7BcUNcb6YCxeE2z12Rrn0z+rfA3bYPPMIPg
	Xtob+VoaLSi/30Tu2ydzjb0ZZe/eWu6qdZQRDV6okn704V/E65/ftmrb7LiTLMLu
	EBa89g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq58w3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 10:45:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766654b0c3so6808351cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 03:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745664302; x=1746269102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cti0cls6RpmnwuEVrPBosDHrl0E/TWcIksexIlUz1V4=;
        b=GbkaIPgudZX25UQqsG7YNAhFTbmwm4VvLfSNcfE7JupPlGlkhFxcCHv3BqUWsAa7RG
         ow//y8OicAfiBgL3R0cL2QTZsa5Cf0I3HamyiahE1BSfcnj017dUlAzIlUeNGgOSAYN5
         VldXO49xEyQnos7fKcDYxURqGnLvmX9lRoyLMklrQD6ODg47zfiRsUmaYX06n1cZEbYs
         +MoJ+NBg9c7dXyDUfrMfwLACGcDH9HdfCcFT75NS8H2aJqfnE+y+m0kTGf5Y2WYmiprW
         GPFPQC/VQ4WzcUqeUCotAAcStbmPwgjsgqX2qTM8CXeclrnjPBb3xYJNE1tFUVDJx5E4
         1UyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW445wP0lY7JGAc1PU0GvMfgI+k25KSNRaN27fPVEcNgbHg1T2KPxa3bMWo0a2thqxW2qb4ES8b8u5cOYYwY6tI@lists.infradead.org
X-Gm-Message-State: AOJu0YxJMRZpit8fhvLnmvtPNsyeokh7inXZUwv6NOtbHZUOuYZI/wsG
	rTibmXeua+AG5c2z2sURz0rNNdnoWv4mf5JrsaJG9EVV/t96xWSLU8ueHtWxru4MJnNfrp3hhX7
	SJA4zi1+HcrkMbz+hywAug9bjwDEO2inU3VdG8O6/ogx7kP5s/l0Oc1RmUEjRZI6o9elDaBJdwQ
	==
X-Gm-Gg: ASbGncvaIiC7HdLo1uJKI4jP2uHUZWIUjVtL/E9vAf0KOrW2xO4DQXxKpSzUWVFpHzp
	PoPmaqeYpGVoukrBVNIh4ZZPHdtYGVM3lwBU0t2kQDzqvalPty7eDpsTFG6aGqvXetHGS0MEY1g
	x2aYo6y7tzAZlgZdPYd1pI5gjbMCQRPskG0veoBT4M2SnVhaNdUvCHArQ51jHCSEbEVV3wMp1VJ
	cHy8/32Xc/57rXZLpNXjMcoR2YeZMHh99qA523IJpMAhCyU5xlhaVPjlfjcIZtofoHEcZZUvsLM
	IwVBMzl5BGN/C7C/NSNmDBq1Ms3MKWHa2sp399K9JdJ61wTDbhgEt9QTOw2Qqt2tQZM=
X-Received: by 2002:ac8:7e8d:0:b0:47a:eb49:273c with SMTP id d75a77b69052e-4801cd5eb1cmr33064831cf.8.1745664301979;
        Sat, 26 Apr 2025 03:45:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5ahbGaThCrsLU5YdXHhOSo0roeSKraRYtG07uhVbFeJV6F+w1ZPA4VBcrJMdVncIiFqK5Uw==
X-Received: by 2002:ac8:7e8d:0:b0:47a:eb49:273c with SMTP id d75a77b69052e-4801cd5eb1cmr33064711cf.8.1745664301568;
        Sat, 26 Apr 2025 03:45:01 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41ad27sm268969666b.5.2025.04.26.03.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 03:45:01 -0700 (PDT)
Message-ID: <306ce1fa-be83-4f13-bedd-97a20448d162@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 12:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
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
 <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
 <4bb58766-a080-4351-87f5-79a98219171c@oss.qualcomm.com>
 <aAt4TBrekUqyTjfi@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aAt4TBrekUqyTjfi@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tJoaiGo89IuJuXQNAiBCmiLM2UkQvJEl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA3MiBTYWx0ZWRfX8iL8G7jmG40J IKkCY45mubC9XA7AuoCW0iJSMvFz0EeZKsnPJnvVHLlf8lXd4JXfM/mCcCn15oRb/w13YfKAkHI LcrT4vzaWUBPrwaoBdQVfl8x4S8dn2/yHUUHUTT+Ti/PJDaq/6EByMa0pLErUbyRKXgfj3qjdxg
 vI6UKd08v3n9eHDCzDnzeYEgS0uHVzCZQpMmyjOee7TA/b6Q/HXWoEBNDc2Ks2znHq8XprSX/me +M/G9u1o3LwM7gOlA+CpAz9t0oYvJM/TPELATZCGoIlXN8mrWYul63wy2mWKJeh9br39RR/a7V3 TxmQ10pMB46/k8V+4tL+7FG3NsXHifr0sKFo46/A1UiBEuwCgtnFLdefqn24tUtAi83MbpRnxZn
 VebL/zRnLWbjudIgJHlqk1bVh64bWFqjQ0D/IR/Akwo9s6CEXNeAgxC8pi2G3j8PrffMO0kU
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680cb92f cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=FwFjppTGKuqVC4zksNsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tJoaiGo89IuJuXQNAiBCmiLM2UkQvJEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_034504_441715_A3F250D8 
X-CRM114-Status: GOOD (  16.35  )
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

On 4/25/25 1:55 PM, Johan Hovold wrote:
> On Fri, Apr 25, 2025 at 12:22:56PM +0200, Konrad Dybcio wrote:
>> On 4/25/25 11:29 AM, Wenbin Yao wrote:
>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>
>>> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
>>> voltage rails can be described under this node in the board's dts.
>>>
>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>> index 46b79fce9..430f9d567 100644
>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>> @@ -3287,6 +3287,17 @@ opp-128000000 {
>>>  					opp-peak-kBps = <15753000 1>;
>>>  				};
>>>  			};
>>> +
>>> +			pcie3port: pcie@0 {
>>
>> @0,0 for PCIe adressing (bus,device)
> 
> No, the bus number is not included in the unit address, so just the
> device number (0) is correct here (when the function is 0) IIUC.

Some DTs definitely have that, but I couldn't find any documentation to
back the syntax up or explain it properly

e.g.

Apple T8103
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/apple/t8103.dtsi?h=next-20250424#n930

RK3399 GRU
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi?h=next-20250424#n486

Konrad

