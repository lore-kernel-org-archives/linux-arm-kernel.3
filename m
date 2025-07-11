Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59940C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bizVoZMRBk4iRzzp5t9dmlYcMmYl8Jc6R1Yyti/9Fs=; b=u5z01eS7PVMlRv0n6UvBX6n1mo
	uJR/38QNKcW61E+WYZVMMN2Fmp0If36E7woCzyt4YQJ2UU+ZXzr38p+SwqsdJbl8sBxZL0PX+fRCt
	6PL81igU11DjCUjW/Eu+v0hJuqsJqWPdwGdC3ar19VhyE9Os0mLlD1jibVZffbaeFhz9tIg67YgTH
	fw/1YDFmCpbNTnwGUvNj3JNYwt4m/3YUthkZ/SFwYdWsErDBDVMTIiyyEYz6O5iapBU9O8qUfnzy+
	TIxtn+wvlNg6gEI5ZRm8VR3H0aLTl62zEXmjeWVwNeSsCTshcW8QpKXEYwPtMFcjUCWjqdufByzBn
	crAkdo9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBnD-0000000EaT7-3ckI;
	Fri, 11 Jul 2025 11:19:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAis-0000000ESDL-1ms1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 10:11:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X7eO003810
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 10:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1bizVoZMRBk4iRzzp5t9dmlYcMmYl8Jc6R1Yyti/9Fs=; b=afLMHyl22C7wf6hi
	WvEgP/otA55jZsJkja05AtLYcx/p5lu/MFAQmRPLODPfhtF+K4f/GdgkBFp4dTnA
	epo0Oq0m/OPERWkK1tva9D0kWqcL+2IG3Nz+yC+99mGqAUbshmHM7aZLhRMFhUg2
	B/2zqVa6vGN/Gg0FHCBuBdimer0VEqEbqXdhBTjkQ5UTXwny+7YUY/KXQv1bGW23
	+JQQ/FCts/Y3iK0PVPH5oTKKXsWdmxWPvu/2finOudIhPnZpnQljMCVCFVHaH/Tq
	g4lhfn7nbEWiU7ccUqM8IUnSyrateYk90hgiHVX0c/cW2E2yPhsw03vatj5O/sgS
	OKDuVg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbp08j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 10:11:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb5f7413beso4385406d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 03:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228676; x=1752833476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1bizVoZMRBk4iRzzp5t9dmlYcMmYl8Jc6R1Yyti/9Fs=;
        b=gWWk3re2nxEy4ENaes36XZGC7f9b5m9zlPN+I9Kb3kwkwnj/mSGx4wCMIewo/i0K6E
         Li6b4jAFKdqcOkp4L1R+4FkCgPgvk9f4z/+o4yGT3VQlvaViKP0Jcr4jElkrEyUs+z/x
         GSj2d4t+d7Mk3fEbCsY4f6skUJ5QRAxuvsO7iZLlG32ErJb5fAqsJ1cACK/hCyeAtg0K
         QjYmQPkKnXWg79SHOyyXhoUgGwmZkt6x/wf5hGHBFq8VA3rDLAlaZV6lQxs91WKKd8c9
         25KPY0yrAH75/cyik63zB8D6lZZI/4XirvTBq7qrkWdvaXEHS3oUI+Ep2yuNexmh5iBA
         mqDg==
X-Forwarded-Encrypted: i=1; AJvYcCVRqpLRpHLmEj0ChzdAE4w7duA/I6kFXAAFlwns5ZeO7YxzNAQcUrCv6Rr/z32tpqzCN3vfx7ahKZabZlk7UiuN@lists.infradead.org
X-Gm-Message-State: AOJu0YyFVIkXU2gNa19KuFEikvq1614HPxRBkfS9pWF5B8pUCH8twmPr
	3MtTgF4ISr3qE++uiCSnPEbFE7eFq5eUEPOIgxF+FHY8xaPcQijwF6CFBXtkMXD0ajomaNZTxJv
	Qggos1LmrMFTE8P+hOZJpiTo1+uY+E8uwfjsqUH3mKR9BTsXOTrQXylZ6Ex4D3jNDHkMbr0vVlj
	V4SQ==
X-Gm-Gg: ASbGncuYzPD+5zoQHrueV2QXKH5qFJMocI+hCQvROAqB2qX9gVMhhGhLkdvZuTGFYDv
	VXsO3PlnNS6+y8ZHD2XzKKQ0pzoq8JVEmG5gpzjbaHyAMHpNQ2feu8mE+AVVh70gyvixIWYCeC/
	A/LcMAJrpPOeC13vEFn6F67le36nWRktiQDR8cQvBZ61YaZqEcExiW2CiHKcIhWpotwG35gEUsf
	hGn7DvZX/yKPsCnx4qB8vEkFTXfaz7s+O6NOI0CjGQGcR485hQOmgDRTRYKiiO8uC2AhG+Jl3xK
	AuBaUztx0XGK9QX3+vcpv8CCQcbTyARsGHhdr9XZZlx+Cr/YD4N/a3IpPr9buiQeZxg3igoCm0X
	avpESxAAy5eRjV16XTRBq
X-Received: by 2002:a05:622a:4815:b0:47a:e81b:cca6 with SMTP id d75a77b69052e-4aa35e97ad9mr11950271cf.10.1752228676326;
        Fri, 11 Jul 2025 03:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+yFGrRyih5NM5B6WfEaKNkJoTbFkt+BimwHv7L8hV/2ji1McRuQtC7efF6UfATIdIB1yjOQ==
X-Received: by 2002:a05:622a:4815:b0:47a:e81b:cca6 with SMTP id d75a77b69052e-4aa35e97ad9mr11950071cf.10.1752228675710;
        Fri, 11 Jul 2025 03:11:15 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611ed4c1830sm602759a12.69.2025.07.11.03.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 03:11:15 -0700 (PDT)
Message-ID: <7335064d-60ee-4045-a119-082daf89464f@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: Add CoreSight QMI component
 description
To: Jinlong Mao <quic_jinlmao@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-2-quic_jinlmao@quicinc.com>
 <6b286132-1c56-43c1-a61e-0e067a73b615@oss.qualcomm.com>
 <aae21139-a4cd-4c5d-8147-56c2352ae195@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aae21139-a4cd-4c5d-8147-56c2352ae195@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MiBTYWx0ZWRfX6zg9+DwBrTZm
 G26j4httMuXBbOarRBJ+KtKqZLer4uGgi9obZTDfai65L1fDM6EwLuC2A4pDfw2WJzZLVlcVy/g
 DR6TmLJW6JpFzw2Qf4qBA2NB6UHAgrCZui0HDmBjfXI7lZsWHwyM/ze/sfwOSwVpEiujzdt4NWF
 3/NrY0YvmForricWp9Ywv1dTquAVmXQNm25U5yEZSKXD1/a2ODtIYfhfDSUVF5UUUI3kz+OpAvc
 d+DIPyQnkhSqsC+nNOTBJ+FTcX09oDHGpnYENnsoteToVjhAJtb0a1rXgT9VWk9a0Q0KnFikUf1
 DFjtwZG6tckLCPhyY2ocql9/aqOBE1wrL1tqIa9YGmSaSPjUV5JvcLTOOlujqnShsRKEIoOntrJ
 CDWg5OD4qtNSxcApVs/wz+15Xh1ubsFgJwlGozzm7H9xD6qNkXu/Teg5sLvUx6HyfAZbflqj
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=6870e345 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=COk6AnOGAAAA:8
 a=tkMjx__ORyt4N1e9db8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VjQPtRYO2L9spLULTAPyi8UsNocrm5pt
X-Proofpoint-GUID: VjQPtRYO2L9spLULTAPyi8UsNocrm5pt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_031118_473606_DE44EBD0 
X-CRM114-Status: GOOD (  14.08  )
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

On 7/10/25 1:03 PM, Jinlong Mao wrote:
> 
> 
> On 2025/4/25 4:30, Konrad Dybcio wrote:
>> On 4/24/25 1:58 PM, Mao Jinlong wrote:
>>> Add new coresight-qmi.yaml file describing the bindings required
>>> to define qmi node in the device trees.
>>>
>>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>>> ---
>>
>> Is the service-id hardcoded/well-known? If so, we can drop
>> this devicetree node and create a new platform device (& probe the
>> related driver) based on the presence of qcom,qmi-id that you add
>> in patch 3
>>
>> Konrad
> 
> service-id is not hardcoded. Different qmi connections will have
> different service ids.

FWIW the OSS qrtr-lookup utility only lists the one you included in
the example.. I'm not saying this list is exhaustive, but I'd like
you to provide a counter-example.

https://github.com/linux-msm/qrtr/blob/master/src/lookup.c#L71

Konrad

