Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2724DC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txP91yukZ1kQoDPyCm+pb6K7MyO5UEROTQQMIQ/rjYc=; b=VwHlZZC9xMPH1ExVYhK0vo1N3R
	OvlrGCgoL0PflyibJjbcfpCDMV5V9VPVFb6+AwD0+d0qW94R7c314N8vCIyyWgUcVoVi/+yVPqQQf
	XYFt7Bonda0i29OCSsD/N16WL9tY0HAEnZWiwY8F5z8X2ZM2O9g0b2dYwC9Bvz2KUapCbxq5VEYxs
	SQSRjPcbGGgdROXrhENraoIZy6+Sofa1Wna5/8+olcQrlbEA8M096FPuLy0neCRDLno57c8s6FriQ
	ti6j0VemS82ef66KCg72zt7gjBsRO6YMRIslJRIYqqwSaaAVN4QTOQsgPRpayIh1lzI+qND56hNXL
	EOwrj8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3B6-00000007rFf-1VfG;
	Wed, 29 Jul 2026 12:14:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3Ae-00000007qtd-2C9F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:14:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBh2NI1724476
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 12:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txP91yukZ1kQoDPyCm+pb6K7MyO5UEROTQQMIQ/rjYc=; b=AgLNBW7fwOpRdhYN
	thPVmCuY+/NSDyCtQ+z9KZPZg/55tjnmjuJYW6zcgEgN1oosu2dU/PFnDCymNRBb
	ADca1iwhuqr70L4NJt3+/bNZWcmYXNbK09xHQr8QDs7XMwdgHvn0SYGZtX6ElFLz
	BPawdjjy7Kf2A/moIay0L9hoQa7k8e/ffdYz2iUdxJ4HnG8h+vFRQEqa0JMPKYQg
	V8xZNYvTF8vfS1zduIUpXo9EQi50hdMtsqcuKr6Lrktscic/Bf3S9noR29nCS4hA
	nSuyo/bQO5guSzVkCiE0gYAqI/Uo7z0+b5rQtPx8HSYBQjL0bQ6Qy8MUQ6bwy+Fq
	ilHaZg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgw0g3ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 12:13:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c27616421so1123801cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327239; x=1785932039; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txP91yukZ1kQoDPyCm+pb6K7MyO5UEROTQQMIQ/rjYc=;
        b=kL1gJ5TcqHg8/Jbf2xvuPZkXFKmgQYOZ98WwzbAujcjNzBXn7Nfl3IlxrVo8OD3Par
         pnrgztqwm2wvPRd3iyJMcw0WGr5jzVLtzbmiCyT0tdCaISBGodpLMlC2r2FBkyEUNlhL
         wH3KMhmxYUK7N96EP5Cc9yb2XCtGlOrNSqsF8BdQ8HeG2TxKWVHs/VbEAGRDfBlrUpDH
         u3GanTbZrqG91xVlrBdP8alkncsh+Hfdjuy8h/KcXREkC4iEiRFEfIRCLXAtOHa424UB
         njCc7GMF71WEoy7Gc+WH55qdZE4VGc96HiM2sqCAOY497Zppj0P5uRpYPJRPo0z11/R1
         Oy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327239; x=1785932039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txP91yukZ1kQoDPyCm+pb6K7MyO5UEROTQQMIQ/rjYc=;
        b=FnSYAh4wLBj0xmum5LCZi1h43Ky7E1uhXcdtXFVzRjUmlzPbAJvybA136BDcL/oTAc
         BndjGLzKAomj476lG5MnMwV3EHuuK+V5HL6aNQdI3WK9/X3oMWb6Zd2uaOo7sFYfHNp+
         em1klFHUQYDNDqvn0++aeA+bU7u6wxRxZBsB7fm9HpX8Wa9NQ+gkK1XYO2FeVyj353d5
         FHOs8VzuN9fM57zMgaVgxTu5r3YdzweA3S3/oDPxTvEt9sTb/juptKEnMj/4uNVwfQcR
         SJdbs6CB2dyJMs7O4fBtcabqLAdv74Kv69cKuZtI4cmbNXfOxgwISHTJBew03ew6qNPP
         SOgw==
X-Forwarded-Encrypted: i=1; AHgh+RrX37RtIAwcppH3VyTuUPReaf/HL12hq+dndehUjhG2Gl9+ykPS+pu7u3/Ul3U/qf7iNe89i+RKq2Yc3O0yMk4G@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3B1x0Ze7LGaIDRvSDrLODWGB1W4PdwOMb4jC3SRAl5gR5dG1n
	dEuLVH02IKS4t2CIKWtojzT7aP1DiSuPXCxMQUrjAt4rDvLGJpxX34ujU8reV9vDKxkMWAIMRZ6
	0B4rjXEh53gkp1Wbz9yZuIU2mFL3iQkCHBTV8CVO9ACCe/4rrXqnWKhnNeyuP4D9D0oJTr3KHxE
	noGA==
X-Gm-Gg: AR+sD1319fN4CuxghsXfpZ7ZkaIL/XEMSwGMqzEf2NL5Peiq07/gVpuHCMN3Zq1APul
	W9oRJctXFcDhP7Tc+OlI463Tu7t1V6EuyL7Obi6bsaq+ak4SGbXAeuVBrXm8sNP0XXgccS2+9LI
	foa55dKY8qPbkWztvRbzHuWpFDV86LCxXOeTLi9fsbqCYy0JsoKCi2fdfCZFui4LZ9meQwu0agV
	i38T9PZdZpjLnJkA30pJt542hAKXvDYKgyNOvpB83nGN0V+vsBRkqM9mneG7KUO4Hskx/7C8Jdv
	W1ivCmoNsEZlyZtL73k/+xnotILTJkKa33cGymfXhjWSqCg1lRrEqwscn2lBYIaUYTUkxNeubP6
	gi+QdNmTl74x3wao9O04eejd0
X-Received: by 2002:a05:622a:aa46:20b0:51b:8543:cbbd with SMTP id d75a77b69052e-529d6f6db71mr44778651cf.1.1785327239058;
        Wed, 29 Jul 2026 05:13:59 -0700 (PDT)
X-Received: by 2002:a05:622a:aa46:20b0:51b:8543:cbbd with SMTP id d75a77b69052e-529d6f6db71mr44778141cf.1.1785327238610;
        Wed, 29 Jul 2026 05:13:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83cdf452sm106406166b.14.2026.07.29.05.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:13:57 -0700 (PDT)
Message-ID: <df03eb18-6928-453e-971b-681875e9cb0d@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:13:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
 <20260723-rubikpi-next-20260615-v2-2-47c5add80114@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-rubikpi-next-20260615-v2-2-47c5add80114@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zKxSN7aEDcMaLWowASrUL3AldD2PdaOu
X-Proofpoint-ORIG-GUID: zKxSN7aEDcMaLWowASrUL3AldD2PdaOu
X-Authority-Analysis: v=2.4 cv=AOkSgtoa c=1 sm=1 tr=0 ts=6a69ee87 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Wdb1h0LgAAAA:8 a=cV_IwbTCVfHGfDX6aFIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfX56JDhSiQYlxB
 3b4AbWrtwtkDEo2ZCvG1dgaLbQC34EJf93PaEeqVpLK5MgVFPj6qsWXUjXQrvTt/Y3gQUq6yfS9
 dRUGn6wogtZuaPUcoZoyec8cQ9Y3rhQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfX+vtPQVoqpKq3
 my2QmTdntz05PywAS5DlgJXujHtFaKIP7deTKwl9t1TVC/37yWYKhvQdBqrGsvO8l8wlVhnHZ44
 DsrOYzW/vtq/2UHE7XyMP0N88CoTbzfsqC2XBPmx6GuH0c7ViwAIrbxIZ/s2sQfI/N2Hqba4lb9
 nDG8JZ371O/dHNdmuCbQFxRIBLdhQbUgabjArj36PuVZAe83ahEKxf/LOCjUyRNX9IwIjc2hM3b
 e81mJ4Bxjt8CBm25azBsiVILxiuEizTxIs8xHFDYmsnnYd3T7RkOEHCZVjwDN2estQ52f9GjzU4
 8Bay0jUVIfnuPe3nP23lBllKOo/k9gyPj+zOmncrZFyejyvi9Ll1WTJHUNU6xjMJe++nYqoTy/l
 hoTE/RGPNI1lCJE2eR5RMNZ9YtZvNFx6aV/CSRqjmYvj2TUWvYvkuahswDlpJKOHMTZJGSpNLDv
 cEd6tm8M+ykIz4wl35w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_051400_695026_15767C13 
X-CRM114-Status: GOOD (  15.59  )
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

On 7/22/26 6:12 PM, Hongyang Zhao wrote:
> RUBIK Pi 3 ships without camera sensors, and its two connectors support
> multiple modules. Keep module-specific nodes out of the base board DTS
> and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
> sensors.
> 
> CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
> overlay describes the 24 MHz sensor input clock and the three sensor
> rails derived from the switched 3.3 V connector supply.
> 
> Describe each connector CAMERA_GPIO signal as a privacy indicator LED
> and associate it with the corresponding sensor. This lets the V4L2 core
> control the LED while the sensor is streaming.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

[...]

> +	/* The module enables its three sensor rails together through PWR_EN. */
> +	vreg_cam2_pwr: regulator-camera2-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camera2_pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;

Is this (and the other) regulator on the SBC, or on the module (with
the PWR_EN pin just being an output to the module connector)?

Konrad

