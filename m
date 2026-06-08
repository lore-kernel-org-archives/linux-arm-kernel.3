Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87C9CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ge2g3qS7PI9YZlh6sQweBknzqeDtO4thMflNb0ch+FA=; b=aMG00QU8GYoJ0Gi/0WmbKgF2RO
	mfgcCWv/KYapOAHVDMIvKqKKUHw/dcZw7F8g+qMpPCDbv1ee78+NeOf3ZV3vuqrEnW/3HsDrhS/MG
	O2M8lAcRuqIwTr76pbzgnOjQRmcR7DgpRnQ1YdmlNvrAPbFk6S0ia1CILsB0kJtKUNQmqbvCUAWh/
	tnrbR6YMhF2tZ5DquZuAVxLht3EPEACWiZyn0zspt7N3tDjKRYToYZS7Eh71qosf55NT8hLZe9g1+
	stLy7aOFbtS/RKf4/AldHzwXQxKv97f4eH7JgVRVvlW06O68y2ezEcSB9I4vMq/6vQphLKXrEq/0x
	5oqIxP1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWahF-00000003hty-22f5;
	Mon, 08 Jun 2026 14:11:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWahC-00000003htV-3I7j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:11:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR5gM3720995
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 14:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ge2g3qS7PI9YZlh6sQweBknzqeDtO4thMflNb0ch+FA=; b=Qk4+vd4433uTNFtV
	oCiZat1EtNS/KU+LHkc2o12gHeB2kAsJqsNe/q/TJtvOrl3BCkqM9piH0YQbRW9p
	Lciw9X4jmk9dPS11xpiMpVh9ckzhX8ZXNw7BNQEf3BobxzcjXw0cTHQP0/s572Ql
	DrTGi0Ia3bU/QNQfGirm8fAGMNjokrcDyCQspK/Yp0Cklzt9wGhUW1zVJ1vc/vPi
	+PbU6NSaV06gM+p3bGFgm2qyYMWmxDf9yA2KOKd+C7dXrzVUGo66aCCWByVQmGg2
	65ccBHSW/5jQrotU96gkbShajrjTo4o2zVDI8g4bK8jPdOa3wolkwu5fC53Tyf3Q
	bzwUoA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enupth2yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:11:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso2665555a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927876; x=1781532676; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ge2g3qS7PI9YZlh6sQweBknzqeDtO4thMflNb0ch+FA=;
        b=XnRHayqPGy96WcqY7yqBJO+Oe7W2xn85vAQDdn4k9RMfc/fLqX3go/gEaalD6/ADWC
         FsgB0aVBlsJieZEDUop45QEw6pd9FbYoJvr1mFA5THMVFcL8CbPzYHhJuQulnvQIltTk
         8xXkUFDiedbszv8zaZKM2dlCfBGu36tA6cFZTKgDMrWl0tPSfMC2EpLiE4XmHrEAJx+F
         5JNRXsJGe6lR8dpQetgIbxoAqW/ef2Tm2vwghVw1CtUxbrNLvOxaaRi+ChJ/yKFCuguy
         tAj7NSXls5d20C6GfQow7jUP3trxYlyoKNlW10LT0a6J7ypuFcxFOHO91X/cU9rR6YAe
         IsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927876; x=1781532676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ge2g3qS7PI9YZlh6sQweBknzqeDtO4thMflNb0ch+FA=;
        b=PYqeiCUbJ/wN/7+lL3nFOtjvoGeI44IPokngzoKR5d+o+b8SCuhDgrPjE74DDMqXmw
         eGqrstS1s95MSLoGRudMvY+topVnD+/nYk5pvbt8sVLyqhmszTOk9/Si96cUaqQvVZ/7
         F8wgz/TbVVTlNa3J0Ux6D67MCyGEdUrtgd/VXyGnMTDVpkMGqJbwE01CPS5N+MNAUZZh
         iSCXtbKmhnNJ/oG6XduJH4XXDnsbB3q450tEahmWbNra8Z14lRsEtoB3ufAOFXyizz/P
         2ZEGM1Y3hmuXTejplVeHuDaPEPT4XvLHmevsCjZKVsGecU77BsDHEoDTm00XOSgVvxS1
         x/tw==
X-Forwarded-Encrypted: i=1; AFNElJ/0A1puv4CVYd0vmYzbtiVZhAbVKvP149PzIdybR42qKKwnXwowEXcP6QDxtzGr2FUsMpRlPxYckP7A5VhqrMMN@lists.infradead.org
X-Gm-Message-State: AOJu0YwNGeJV0EMq31PFietxoab/y0/4V/0wgmiMefyiLhx2auiSq54l
	2ktdw8ML9At/n8ml6Vz5Uo1cHkMEcNa2k1TjwZH8TrCWdGnMebFiIV6bnQ1xtldYukCYkIrOobu
	AddWHccFtBTXfNu36u714z3L2Ogk91Gpn+2zZlxigNE1iNJUb1MY+Ttze/OBCEVpJGNK2qSTQSe
	enJg==
X-Gm-Gg: Acq92OGKRYPrCQ/86lp0000kqMTNq+kwNdx5cHvXhgr7cquHoM2kESOK4r3SwD+RB7F
	yovk65qJUVGWt1PTPfeKeYYkTKqnuiW4ycaisLOJvjQCh4mUz35UfEz4vEceN3lRhuKE5MDD7JV
	79on0KePvOOZGw67u3oFo1/VtKY8elyEjQvGk0lo0WJS3sk/KPGnOD2UIGkL7ATXax5zZ/2v7Ev
	0toBzVJuXALbOZN8FFFTmDtPa+lVIzh+3OCZ9Mg/hYKe0GHnhYxAFzkdwh2K7y+ZN6WYK3TDuYK
	tHsq4dvs8qX3KcX0SRl6Bvbt8lUTLCO+uzjhF2Ms447sUrlaV3AMLHojtZ4jlkjlSVtfAZN/qB6
	GIBYGSJmkCEvuaLAyxAOWE/hJyQTruZa2aE5n7oRjC0+vGgUmnY1pwDGVd2CQ
X-Received: by 2002:a05:6a00:90a7:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-842b0e835d1mr15041535b3a.19.1780927876543;
        Mon, 08 Jun 2026 07:11:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a7:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-842b0e835d1mr15041493b3a.19.1780927876081;
        Mon, 08 Jun 2026 07:11:16 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428706fa9asm17907958b3a.45.2026.06.08.07.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:11:15 -0700 (PDT)
Message-ID: <b0700a75-7585-4779-85b1-5c9a85958b92@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 19:41:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <naa4rebf2mpn2uybjgmaidtni5fckbc66t2fx3tv3cfklfsnb5@op3qmkovxz7o>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <naa4rebf2mpn2uybjgmaidtni5fckbc66t2fx3tv3cfklfsnb5@op3qmkovxz7o>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dxCwzZKtMmbEQMFIzaKFxpaiBsJhvWWc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzNCBTYWx0ZWRfX/7fUe/o8CWR0
 0avPg03gJecBp4Q2fl8GU2fecOOzNEScolMzT0uA7GR7biNtcipA2s1JCMLya4GUbcE6CvqwIND
 h9A4RfkxwWzUYXESZKDgd4bI6rvFCNaVSRhnrYwFp8F79EQxHxAgC/d/NRU5QoSBgCd293i68Jb
 C7VcZD0rzjRFifgD+7DzXU+uZX7sLGtPcKv1TmmoBKI96GaupMRUno4qEvPEs7gbJILJB+Cgmuc
 bO86RRWQKttdp8o8bPMA2B6NTr62WBkjZazo5tGIq84rG15qVNvGeKnG5RY7eSadBX04iULtccP
 11fN/hV1gn+0B7mFvYXs2mktohh6CIF180urfS3R613mnDmNZROTXy81S3Ey6wFzHCUDArK0ZDd
 AmO8yTnJmbqeCfBMFPY1WRixAyoM2DymUEqHbtJZMQIeFZ3A/8wrjXzNI0poRexiBvMNSv6q8oq
 Vll3WAkxg0WMefWkBOQ==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a26cd85 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nHMyhPlvQ-XDY_K2CzoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: dxCwzZKtMmbEQMFIzaKFxpaiBsJhvWWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_071118_943319_73D9D920 
X-CRM114-Status: GOOD (  20.76  )
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



On 6/8/2026 7:18 PM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 08:12:02PM +0530, Bibek Kumar Patro wrote:
>> Some SoC implementations require a bandwidth vote on an interconnect
>> path before the SMMU register space is accessible. Add the optional
>> 'interconnects' property to the binding to allow platform DT nodes
>> to describe this path.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -243,6 +243,13 @@ properties:
>>       minItems: 1
>>       maxItems: 3
>>   
>> +  interconnects:
>> +    maxItems: 1
>> +    description:
>> +      Interconnect path to the SMMU register space. Required on SoCs
>> +      where the SMMU registers are only accessible after a bandwidth
>> +      vote has been placed on the interconnect fabric.
>> +
>>     nvidia,memory-controller:
>>       description: |
>>         A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
>> @@ -602,6 +609,26 @@ allOf:
>>           clock-names: false
>>           clocks: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          items:
>> +            - enum:
>> +                - qcom,qcs615-smmu-500
>> +                - qcom,qcs8300-smmu-500
>> +                - qcom,sa8775p-smmu-500
>> +                - qcom,sc7280-smmu-500
> 
> Only these platforms have the interconnect which needs to be voted
> upon?
> 

Apart from these QLI platforms, sm8650 and kaanapali would also need the 
interconnect support as per the SoC documentation, but it hasn't been 
tested yet [1].
So haven't added it as part of the ongoing series, hence as mentioned 
[2] this list might grow to accomodate other platforms.

<The list of non-QLI targets to be evaluated might be extensive>

[1]: 
https://lore.kernel.org/all/a1db573b-bcb4-44a5-89b6-6d1c76f4a18a@oss.qualcomm.com/
[2]: 
https://lore.kernel.org/all/0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com/

>> +            - const: qcom,adreno-smmu
>> +            - const: qcom,smmu-500
>> +            - const: arm,mmu-500
>> +    then:
>> +      properties:
>> +        interconnects:
>> +          maxItems: 1
>> +    else:
>> +      properties:
>> +        interconnects: false
>> +
>>     - if:
>>         properties:
>>           compatible:
>>
>> -- 
>> 2.34.1
>>
> 


