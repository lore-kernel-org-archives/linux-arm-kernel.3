Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369A1CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBeLLeGd6D9gfelgbASleoaGWcIHd60b02pysLN6WeQ=; b=3llqTZ5ygOSmfvgvYC142jOR+9
	T7xBDJKKi1XSxfBXcnyKM/z0fXT14WJjkuTVYqkQhB4WRHKHzzQg94/itJ3kW8Ixk8Cfnlg10Dam+
	zIWNK1M4OXFyG+O05tgI4ddXHc6DT3Amoe2EO5y2+PrWiyJSJ1essRWHxxIC3KGMRN7yaJkPvhXkJ
	GgjTn/ky5sFSo0RluR79cfS8/O/dv+0sSQic/GNTnwMrr0beG1BHSHQHaipiYm/lhu23as50OUtdW
	U78E1FQ7LvpD/y9VIQzJcEUTT/VYGJ/ZBEmH45tNfVuCQQraAv7ZkRKeICnSyLVxxl4/2w/an6Tep
	AxSJeb6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaHe-00000003eOE-3qpe;
	Mon, 08 Jun 2026 13:44:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaHc-00000003eNr-1CzZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:44:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR51m3783031
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 13:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UBeLLeGd6D9gfelgbASleoaGWcIHd60b02pysLN6WeQ=; b=Rk4qYFZpGnlkGGw0
	R3e/WBEm9RaoOSBpuO65hpi+rZ3tPqtV1E9zMZ2HqK9xdim43SifwVfqbo07GHrM
	Ju5dw0NOumxW0CEDPfaJ30J+lDNgKkUsoF6WCZEh4N2Wb+KMRfa+QRgFkprQWFTk
	iunZ+6qnCMVFMxu6pAJ0J+3LTJoDbpyT+cZYY//NyyXHWArvYc8qEmuRSgBDCUux
	NxDFHKhAJG0LCkk/eAKucK+LXxCAKcQabgOugfozTymldl8iDtm48NhNCrktjlqA
	ATL+7rp16SUgQIXbWD78hULIbIGtCx85dFsMd2JLM+KhemVstOmLtODKZlRwSbrv
	GPetDw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxee05ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:44:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf3636d6c0so46757175ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926290; x=1781531090; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBeLLeGd6D9gfelgbASleoaGWcIHd60b02pysLN6WeQ=;
        b=W9UP/pNfKoAqcqkKPrRNYVSNCMZKtkpRiUHsczfoap/FdPUwxD6cWEAGk9ZIjpAbj6
         Ym15bzc8dV5kyuxrzMK1CG5luX2u7LzFXgP8iICJG7u4YpJnzG+GTpMn53vSCIEiiNco
         S+Erp7g+gLXWnhMs2eMwHc4PmRzQ0sW3HV7F//VJIGKYQ9tfvdWMMbb58zFzONpdD+vT
         1h/ERFn+TxE0PCoJfDktAnL75rC2VXDl6mV3IJnRXQFTM/GPVW2/xjQfOf2Bt1Vql8y3
         OGHePjo2uFpfy6pWu79K4rh2yZUaw7CUY6leEdeAyhfEomRlt1oqemo4XYN9X8hU50z7
         rv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926290; x=1781531090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBeLLeGd6D9gfelgbASleoaGWcIHd60b02pysLN6WeQ=;
        b=NBj90uZ0oExh6QO+YyMs31aaGY0lgl5fLHm/gykd7LVw5w2pYovEQbnum4BojcGQRk
         LPTA+81yoxLIQ7NarHQDLd7U40FY+tnBX92Ju74Bhq9eXhEVNk09QUVo038g9Po6nLH3
         J+EBLHd5svrtTZB1YpQjbjBydh7de4yRVZQt1fCtS2qI6yHADZ64Wzb5wOb53TIqomHy
         fFbw5yB/zEtXQIjBPQ8DKjQ00rtnI5XH6B/nP+5NdJR2sFf+0pQ4GX9Ql18s/7Kd77pc
         9kodnf9brTPDi5ou9owSG0dJMTaeBxzVpdI19KKWFckwZ8x7aGOlx6AAcFDXZ2ogLvlc
         w8pQ==
X-Gm-Message-State: AOJu0Yw38iVKv1CJehT+8GERPCM4Eqx8IWlYr0pMfrOjTYsmVfLSZwPL
	NX3GJSTzOMjwlORNTyR7bRhJwOMnQgBgbXOnsx9wvbx/NhNYTEeeFCqJE/8Wkyq4BwV3P4Ds6uE
	yrlpeFyJgxkmd2oTEtv8a6B8lanByhgCp8iQ0PnBwDqrFkVCGARy+twtBFP2uQOxyMN2qioU+4+
	E9Pg==
X-Gm-Gg: Acq92OFFe9PuZjPibsR79aZEDRDBJt4Ug+fQeFwllGkJM1oKUt/ni9L/t3yUp1DCwVn
	/8cfhSe1PRPy399ZciEV3QWKifyXgmsW7N1JFcaA/ltq8GtWikdMbG4aTsukDo0YPTztCCvavfg
	2YgQP9guQhlYZIkLlLhpz58mfUWu1IkSyiJFcmeM0fx55Y2VdomhAiipcKH0J/w57zhDQmf0WQp
	VGhtLzZYK5YOcj21zquyjgzzYrHELfqn7AXrdyYZMFqvgbLnk6/6ipOm5YQFdYAx3+Dq+ZFW2It
	y7yz+pQt2op8IPz27/M8rCaXzRmT1kaSXTRV4fSa6VM1HwlAQPsl/pCelfkaqUfvk7NIuspR/NI
	N1BF5QHNze2SYvIR2LgOw3gAq86+XN6zGO4Pz/lMhqErUnjxZTgEMwRR2ctQh
X-Received: by 2002:a17:902:f543:b0:2c2:27be:39a3 with SMTP id d9443c01a7336-2c227be3b4fmr113831835ad.29.1780926290257;
        Mon, 08 Jun 2026 06:44:50 -0700 (PDT)
X-Received: by 2002:a17:902:f543:b0:2c2:27be:39a3 with SMTP id d9443c01a7336-2c227be3b4fmr113831305ad.29.1780926289645;
        Mon, 08 Jun 2026 06:44:49 -0700 (PDT)
Received: from [10.218.33.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f88473sm200506985ad.25.2026.06.08.06.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 06:44:49 -0700 (PDT)
Message-ID: <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 19:14:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMCBTYWx0ZWRfX+L7a4fhmaXTn
 UUybwpEb0DeZRQQJkQ/FebRgHVN43ZrTBsdzenF+sFaTtdbeoSy3s8oHML4Q4IX0EL80vspwGyQ
 hWPOV/4FXAMEKxvQwWZbPVjWMEajxIydD6O95U4DZ2RPqIyRNlPhbqmOWkruh0SLZfSDl/QQ6OL
 ZWLIJNB0nKQBpJKSPRYruWGvCqnon+MX1sNdFalGzS4YE6xVH8R3PcVOFJLO/O3/TSe1yxjMDd+
 K49Zt0eEHmSxTnqDLnA0Y2wjQCnv03ZfOQbnZpdtmR/R8b0FTFNA0SibqghNiFb9KSSlYUiDjZe
 egpvfaMo/1xCe9xAntU+cjHEeE7godVX8NC7Uql5C0xE2BPPIuUlBAPAIX3tT+8BvDvyUGK0RVf
 PT7hOy0I0PeT2fC6u6nIYhmMMuwO8cUIBuPeb7gx8xDrOM+JHv9X0wq/RzMRO9O3ou60bBZE/np
 Tyctwmo3MxIi3qfaj+A==
X-Authority-Analysis: v=2.4 cv=V6BNF+ni c=1 sm=1 tr=0 ts=6a26c753 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nHMyhPlvQ-XDY_K2CzoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: A384suzyC9wPFamLYORKfSX_0aoafEu4
X-Proofpoint-ORIG-GUID: A384suzyC9wPFamLYORKfSX_0aoafEu4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_064452_477202_CF5051C3 
X-CRM114-Status: GOOD (  20.50  )
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



On 6/8/2026 3:22 PM, Konrad Dybcio wrote:
> On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
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
> This is a list of targets that happen to be supported by QLI.. but should
> this list not contain _all_ Qualcomm SoCs, or at least a much broader range?
> 
> Perhaps
> 
> if: properties: compatible: contains: qcom,adreno-smmu
> 
> ?
> 

As of now platforms where the issues [1] getting reported are added, the
list will grow.
<We still have to evaluate and test on other non-QLI platforms hosted in
upstream [2]>

[1]: https://github.com/qualcomm-linux/kernel/issues/297
[2]: 
https://lore.kernel.org/all/a437f9f9-3560-40f8-85ea-35433e33c428@oss.qualcomm.com/

> Konrad


