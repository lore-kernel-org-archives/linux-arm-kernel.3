Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516F6CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZY/vylQEcnHZGwe2yyT0vpoLm07JbP2wAY1l5DhPu4=; b=hZ7VHWL9CrWo5mFV0/vozPNbpk
	mTGSRuCJLi+lEQ6xWoofa4EfT/AldO9n7zBoCrq7GxjYFocUBzLcLSecZZdcEnbet0f7r9ooSQQFC
	OYYW8Y00vtwEIUgf5osMhhNpL1+xaKPVL2u9vjQVuwUKUWozOe+frODZ6JoUDrQsW/LcY+XwqvKdB
	prdu3/MN+pSNIrerwg/HMOZgEd20W9LpoWgNWeZd7LP2zr9Lb2V0jWg3k/A6ybcRJACk7LYzddWa4
	1V4NmUNulRmwKu1pM7/qbO0audHU57ZJ88wG3/grcMp3rgOC0265RJKE6eqbQqdE6Ls/Iyeu0Lrqy
	9LBt6Dbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWer-00000003EaU-1q7R;
	Mon, 08 Jun 2026 09:52:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWep-00000003EZi-0s9T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:52:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Pmo92733184
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 09:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZY/vylQEcnHZGwe2yyT0vpoLm07JbP2wAY1l5DhPu4=; b=CtkAdHoJs1PMSPAR
	n73pYZM4cgjvO6Fx6FIB+DKxM3jeaqX5spxHir3YcBzmWwWd2k912vHQsLFmDo2O
	FKitW6k/zsm7NF0ibJmLy0Ke2Fk8xxmO702cMGLdxycXy2TDk1YVQTsa3RgEkgIM
	1ZCGXx6LrGeNKSunZSUfhwvP8HLOOaUn23Ppq8dogUiiWDnbU9VO2/iA3ZR7C89Y
	4rvgewRUS4+itu6TCLYUfr38G1zCO1Lnv4zV8oKQkhSkkEzcA0V8dI6HvvN0xQEj
	3FqLwYquY13XauRDefn8SWxjP/alE7iDpiJhD0G8WaNlaG2ggAWdhzZwOOWfW7k3
	txoakQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf7a4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:52:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915a547f4b3so105489785a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780912354; x=1781517154; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZY/vylQEcnHZGwe2yyT0vpoLm07JbP2wAY1l5DhPu4=;
        b=YWg57p9I5PCCLByx+f1brJos3p7yOSXRLKl1TSyg3DDtQOxiQMUb5JD4O5s1IcTcqg
         exhRVDWGY5tRZZQ+QPg6u0xlFvQxYqJBMFjI5pwVB2fX8z5XYU9mpzr67A0bbc02pUS8
         SXoiA3ds5uYGDcZgjJ+cs7QGUsxTGKCLgZiJgRBSLEW/0SRn79HTVHA5CMjalkAA895w
         wk/iBX9CEsRudgoi9uvLPMDRyozb1CKsmwi+jGyMzkf5r57pTFahJ/6HQKCaU04Tq2CC
         3HeKPrt3mC/UOdwL5pBYI6j1VI0a3BqLFLj3G++tLtMapfG2D5Vjqlf5d+1IL+NosKEQ
         eatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912354; x=1781517154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZY/vylQEcnHZGwe2yyT0vpoLm07JbP2wAY1l5DhPu4=;
        b=Gr7TGWJr5tR5qkN+DU384QX/QJFBM1GedxH+qGnCQM7tpzgd+rpe8os2glWtSiJpfw
         vx+JdwiZ2Q4/QzJ/iA3Y7iCT5EPsttr4JIcNuNUf2fRsWtWrIm3fs+JlEHy5K5sKqnVj
         jsI8RvfS6etylaQ/fQgstOA+yKWyNJSeEqQWHJRNTvLbE9qI6lAe5JyknOl7OtcSXBIb
         JeblYIg4G31t0o2UmFj+vBXAWDa4/4mDAQIkTevZXCZweSBGJsS9v0ZaduBAPgZx+eZ+
         PnLEZRP30eMm0SXQdhPcsuWcTxEKhRtGSQ3famzWj+I+Qb9Y3OTF2/hvqYRVl2m/swnE
         3Ffg==
X-Gm-Message-State: AOJu0YzpPGZBBRlrtuttTVBTFAgUhFkBArlXK3WmrCBjtHucSqx/YbKl
	R4Z/HqjVdfYXJte960RF5bVzYnNlyX/QPSvDGlNwjpH7Q2zrnoqbOPS3lvVvQecB/ljuqCjgajY
	4lecBZwl7TvHqhgpIxlH2PbL4F7Xp2xbYCtqkgtXBCdAzQ5V3PJGCYQo8JLOhzlbuWU+RYHkCDc
	gDZQ==
X-Gm-Gg: Acq92OFCsqce03l0kgAg5oRHhsjSiqj2Y+2hZY6iDsuL+p+9mDrtwBRONM5e+nnPGsV
	xpfZQQbQWD9j12PCTzXwR1E26ifLtRsTC2U2MTTvQeMGS6/KsdHPgLZKEWu/iE9NaUVKs9XCqTq
	FojOD57t6oqtRijIfXO/siWuG+YmP3EtZ+f7XgI2Pn2eO2azKb+Uht2CaB+DyrV8PMB2pdPXdRW
	aDoik+0RJ9+EVxQLu0Jf9Q9FgtSrRvAppxFdO6qnc934/r6sao67jVQyfZ/LhxqWHsgALCLB/mC
	9n7iIyhFf5jzrIx7wivT4c2dhO2jcTTmohL8txWx0xYAtMx2cr7HDOgoCyis75CnDXavMrIjupC
	XT5UvuX+PSDUddWuVlA+LUnImYwNybGyGz8Hp7oX5de5D/gMTpuJslykK
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr1233793185a.1.1780912353529;
        Mon, 08 Jun 2026 02:52:33 -0700 (PDT)
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr1233791485a.1.1780912353127;
        Mon, 08 Jun 2026 02:52:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054efd5dcsm852161266b.39.2026.06.08.02.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:52:32 -0700 (PDT)
Message-ID: <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a2690e2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=thcKRG5PhHeBPCh_FOAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: oEcPC3GhS-78_tKLPtnJv-MJmw2aCyjP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MSBTYWx0ZWRfX+Vt1tASOk+d/
 zfdBeLhe1MmaGnIn7LzpvYE7sKV1sO+N6r79Z+3I2W3WRu/p4RFPXMp6BMAp9vo/gNLPUFsbeWe
 Ev8Vs4YcOTwbWgdWjWfkt6dRu6goBcehatmQBvGPflAM9en5E3bgvp/9IGhbktp3aluT+0KGaCi
 zW1/nxYJ84bpSmzM5Zn4Xe5p6yIyT3ntJQNDJJXRl6OxUH9YSGCekztVIc3J4hdkhOB1+8ZUA0L
 iIPMTx+/44Lug0cnUXJQNS+P8thjuj83EBxCzF9gFdeo5U9nBVB8qM1e32rYb/DBGU117aDOV+2
 HMxIRRTfIzXM4o5lfTor6r3qnpmnm6AMjHJNJ9hhuH210fdvvBUG6+3FjAU8RiVkaPp8elD0p5y
 fuJekB6ayZFhrClhRgzmCU57v86Q8O8SaGAW1mzdlOr2O7S3xyWRE6JxcIDHnwHhskCbHNJYBhu
 VJa2AkQCaP1WbjtDHNg==
X-Proofpoint-GUID: oEcPC3GhS-78_tKLPtnJv-MJmw2aCyjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_025235_370759_03942809 
X-CRM114-Status: GOOD (  20.49  )
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

On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
> Some SoC implementations require a bandwidth vote on an interconnect
> path before the SMMU register space is accessible. Add the optional
> 'interconnects' property to the binding to allow platform DT nodes
> to describe this path.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -243,6 +243,13 @@ properties:
>      minItems: 1
>      maxItems: 3
>  
> +  interconnects:
> +    maxItems: 1
> +    description:
> +      Interconnect path to the SMMU register space. Required on SoCs
> +      where the SMMU registers are only accessible after a bandwidth
> +      vote has been placed on the interconnect fabric.
> +
>    nvidia,memory-controller:
>      description: |
>        A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
> @@ -602,6 +609,26 @@ allOf:
>          clock-names: false
>          clocks: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - enum:
> +                - qcom,qcs615-smmu-500
> +                - qcom,qcs8300-smmu-500
> +                - qcom,sa8775p-smmu-500
> +                - qcom,sc7280-smmu-500

This is a list of targets that happen to be supported by QLI.. but should
this list not contain _all_ Qualcomm SoCs, or at least a much broader range?

Perhaps

if: properties: compatible: contains: qcom,adreno-smmu

?

Konrad

