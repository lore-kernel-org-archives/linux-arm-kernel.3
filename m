Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119AFCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZMjcfL56nfEqXpkbtHqbJ4IXYaeM4YQuE8a5EedgTw=; b=TDYaQcWTdxrKTp4qqaWbV/9v7g
	bYUNRcKZCHKKLFFtvOEtAOWYdpUxT3Zc0KQqoE83fkVuX2NFbshezmE9nvqrlDcGBQXYjUtVnTqzT
	zIzqorZZ2D17GvbIxlE2Q42x7k4w+e0in/QvRgfg3ULzHL+LqzsKsOCtwdckjlblKvN1fN428rT/n
	nsO6rD0WRcSRT7bpUvX+RvQqPsLnTkYuDXGMN4jQX2h86FRxoNg6OaUWSODiuXDsDif724hG97mqF
	BaOD12ZBTrkAzo34Jw7r9GoDyqWdSkYp9hRPDe/BYFRoLbPGuSfBie9gyW2ziICJBGHKzj/hwwJq8
	RdgEmO8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaLF-00000003eZv-1Da8;
	Mon, 08 Jun 2026 13:48:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaLD-00000003eZY-0wfl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:48:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRAFj3340122
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 13:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gZMjcfL56nfEqXpkbtHqbJ4I
	XYaeM4YQuE8a5EedgTw=; b=TpUEp5hF4OSr2snKAVhZ3CwqrUqUi1H+2q5h0/ku
	QUktKmkVWdMq5/iXyGRRgBAJbDKI0cKuY1MQ/ZKjdzpHcyvO6TFdbqhWhxI1/GxW
	qPbzg7uDMuPIHIcnN3o++rsPeS31eFrB+e3vk60HLVbIBeGzVI0or8tXmE90Vdn8
	U9sEOPXSrw4WZoqoRYZoSlcpif8sQeSyk2uLMQot82LMjulxribpFT3Wo1fjT9uE
	YdkmAyw0R6dwe1ZaHtaxvhNdv02A/0dxFwCIhTBsZDVTQ4KGuQrmfGgB1hz+Edng
	sUK/zzkBBdxKMIzLjwbYlzY56pQe1md3KZ6W+mMnCsHkmw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m0hq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:48:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6751db2792dso2129259137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926513; x=1781531313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZMjcfL56nfEqXpkbtHqbJ4IXYaeM4YQuE8a5EedgTw=;
        b=Lzi6ynlUtPA6QvxTG/v1u7+HLikXTt9hJt0+JaQXIH1TWtFacQDlnp+o5fnB9Im/im
         0fH/faiNgPOyfTZBjVBeW0CkIVnAVXCXs3CIn/mFmH9XvsscRxXwSi0M6cqyy2+Ofo+Q
         Y8hAUkmYHSBRbE9Ko3jLr0Oja/QmDOjzPHVWe5aTXe/BP6VYH4VNUqO5mxDr1AUHLsnG
         LkCMbmRp5z/ZI/7CaBQK6hqHP3Hd+1qiBMcE2mScdjkF/Uw8L3eiRh0HoTsUiuRadomU
         phRIRYJ0dIt8RW+3kGvjjS/KLAORc9Fn4oZzUR2I40use90dDs0igwvBFGOC1z/DAUcu
         Hmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926513; x=1781531313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZMjcfL56nfEqXpkbtHqbJ4IXYaeM4YQuE8a5EedgTw=;
        b=pJ5c8yB5k6HZ+eEAufgnuhufJ3Jk9t6dApQcmCjwQzV40gowhtUqaUjWYiHAFf5z7x
         HZMtjlZVc0LWbSwSmo02q7zoxw30vAaJZqEu3HgEErJfb1Wnn8UjkcK9LYnOFR+BoLRD
         0fVdNAu6Dh4XKq9uveaZZ6hzNtn0MzOdGflCcHV4cNDr2F1Mn1UHJXi/70lWzlDWLea8
         Di+6fojMKAuaj41vZyDKAf6MYHcXS1fullYoZVmHe3B5FiiG3ZCjt3XMjk0MtXULd+AP
         aSlWtl9AH5/eiPDPf6G9CRQ9pLkAKr9OuFg01JzWQ4FHiDRlX5bB9gDSujfAYWic+wtj
         /1Bg==
X-Forwarded-Encrypted: i=1; AFNElJ90ukgN8tvtAw/AoXhv53NjnATldpBzfn7Rhqke+xQwZgA8LJnHmdf41ZkQTbvPOej7nJqepEpv3B2EN7L1eiKA@lists.infradead.org
X-Gm-Message-State: AOJu0YyUpaTgsEpA01vCfbPPCNGP+1IwN7xTeJ873vMS/dDtUPFhKLpf
	36eOn/7qdpGRx7BZHWKnpIuKTYE6VgC35gS/87gSC7nNtge9e2mqcSJYqZHxJbdZNt2HrGwNyVM
	/oTmR8EPUdjLXFwjg/mts3PeNGUD3uk2uvBj8DBVBFtrpoaLvnq5ffqlSdiCBwqk6RYa4uaLfTS
	9BoQ==
X-Gm-Gg: Acq92OGQ63FWUEbQk6iq6n6o64uPoM+ozVlwdZbwuTqSJWl7SVqY7Md3UZymaOKIpd1
	L6dSIy9UdcjVmbtJbfz1VB5qsXiwchirNQ+TPexfN+H9Rh6A717jHtBbn2pMd2rCc4D6IkbqDEz
	3n2vh27rwOfzmHTHWNfs+VrYBm+ROxKzURCrX+TS4rNcR7bAhqc6EzFNF5CyjNYejh/tyo/C1NS
	oOwBcLyUfoGZdDTBHh4iEvnsPoEFwGy12ctJ9LVU1aqlifJtl/i+IaScGj2fRVz5wuriFShJKvu
	MCV9zhUTKPKIDTzDuIUSBQvHlCCyIMA8CnOwtltXcW9TZ4deOiUgnqW3HBrrMc+0Nz7hbjzQffL
	F1pA5fquQIJxZ4LrD1W8CJupxDyQoj2Q+FDQYJS6aPe7dO1Bvb6+8AoU4adcFt790+XXnipLXWJ
	2WoGRSLnnRG2R0TGxUKeWelsIyIbsXG1tYRgI7W741M/GaFw==
X-Received: by 2002:a05:6102:808f:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-6fef26cd8b4mr7121141137.12.1780926513410;
        Mon, 08 Jun 2026 06:48:33 -0700 (PDT)
X-Received: by 2002:a05:6102:808f:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-6fef26cd8b4mr7121083137.12.1780926512933;
        Mon, 08 Jun 2026 06:48:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed77esm3885124e87.17.2026.06.08.06.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:48:30 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:48:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <naa4rebf2mpn2uybjgmaidtni5fckbc66t2fx3tv3cfklfsnb5@op3qmkovxz7o>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMSBTYWx0ZWRfX0CN7CuG/t6+V
 AgFwWG04dAelQjnBlk8PyLIWLrqJP4xPyNqBajAIBxdqO8FqlKNVktSowEov7ifAXSi2v2JPfnN
 xdTaHQtvotmUnS3YDTUHA3e3GmuWu44uKgrGkzcNJA5vl8OtWnFoO7XeQJPi2X2cAtdchj6a2zA
 EtLJdKWo+0TiB0LTXCXQuaczYBgzfDPeoLLSs881uqg71H/uSb1uApIxamCbpV9aM5srXO+Rksn
 IHCaiVO3AX9w0GmAx1oC77m+z4rpmaDh0BWtxnvUix+Zs67QqNHVs0CaK+JxnJIiVPVjuDjuETY
 sezd5MMFym4Ju2n6ta81EAcRWLKUmwosfts3KKBnloiVBId0W2mTPfVnmwgRiCNinDTbsuDF85u
 QSNQ9r7zQR4Lg2f2x+j7yMvzZXhZluDkUvkCaRJBRY36k8Br8uFrRgKE8fyfTZzyp31iqyyzFNI
 4l4/y3HmwaKPpm7TJ5w==
X-Proofpoint-ORIG-GUID: rrnucMbJv3HLDXlj3zUeQEoAMn8Z1pE4
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a26c832 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3fmthTPW8Nr5gDDPHxsA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: rrnucMbJv3HLDXlj3zUeQEoAMn8Z1pE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_064835_275090_3A4F9E01 
X-CRM114-Status: GOOD (  23.31  )
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

On Tue, May 26, 2026 at 08:12:02PM +0530, Bibek Kumar Patro wrote:
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

Only these platforms have the interconnect which needs to be voted
upon?

> +            - const: qcom,adreno-smmu
> +            - const: qcom,smmu-500
> +            - const: arm,mmu-500
> +    then:
> +      properties:
> +        interconnects:
> +          maxItems: 1
> +    else:
> +      properties:
> +        interconnects: false
> +
>    - if:
>        properties:
>          compatible:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

