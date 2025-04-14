Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82B2C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 13:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KEpYH2fL1hZL343CQIkegiAhh7VDBORXCRTiifeB24=; b=PASbVcQ0rdEp5oUaLIB5hewwiS
	GYxzX9KMBjzr+13pgv9Cex838tEzVLXPGZfgz+Jn0lUrdL8EuPyZ6+VjlwJpFmP/9okWWZdnWzffm
	LrqRvKKtxXrkciNcmqNphj4mvfjJxLeSvjiOoT1Xmnrq86FHiEpzeZYWAiaesRVh603XqsgcdCg6n
	Ak+4+kTKYDskE3js6MzsN5zWXoEjfQmMQ0O8ca48aY3brGZ8fchUOOA3Xzgk+Izm7hT5/v27Q7ia0
	G1iBfLrUoynJq40ziC937ee5L7G/SJ+Gpa7ukqK4zkI8YgcZgBAX4r5yWVSQ1riKsqDghBgB66lk8
	8ikfZF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KEs-00000002Eza-21V3;
	Mon, 14 Apr 2025 13:52:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KBD-00000002EGv-46YA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 13:48:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99pbg016520
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 13:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9KEpYH2fL1hZL343CQIkegiAhh7VDBORXCRTiifeB24=; b=cUZxv8KiEnifrGyg
	NPkbNKmnHQrRHd/LGWOuhOoRpWONaljJkArdhzfyUj2kGWz6bIni3rJTE3ov6OXU
	AqFu2ouknX4VOljQHsMZGnwPhkDskIzY7nssZhRwaAdLnokCgcF7Ccp9THO1sE/D
	dmtD5iyiD0rTAUdbjIKxDUbENI2SAjwkniQ1bYChm/oi7FYC4O35+4xL4Oulp5sB
	K9JrHUpHwh0zpmnuxgthNYhywKyJ3z+LctE4vPcGJ2xfZRktgPPqLLpCazkoyMul
	ZYuXQ4wfbHpfROADIIfb1O1jU1YiZ8Em5VhLhK2F6Vfw5pd0VP4B12iWchtclZcv
	w+KCgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69msfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 13:48:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ad42d6bcso91426185a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 06:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638534; x=1745243334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9KEpYH2fL1hZL343CQIkegiAhh7VDBORXCRTiifeB24=;
        b=YZuost9QYFELbkqhieIydMu9efbgO5sJ7hswtZ3Gzi+eSBR4KXpLmhlyHrMx2xWdM1
         KMXsbEt37yTUq5L6o8uI87AG8oTyZnhGtBQTrGSVu0WLu4jKtrgvunY6pkctU6MvOlB4
         xwQ8FkOcfdyUg4zuEfrGLzk3U1CbKUfrWQrZ/4bqWHblGtAl/xq7fDPo6PpyFsZaogwk
         CX2nssvEuw1wzH5m3W18dc4szA18fE7UjIVHSgtz4gB+8lOjehJ6OXIfMcazAJkF9PH2
         oDjwXv63qvu16UmQbTnDB+wJOmSd0BICvlNFreajiLvEHqINUrasPugHkPCmERp2olui
         7fZA==
X-Gm-Message-State: AOJu0YzZSVHsz88GxbI5FhNlCA3CasnfNNfCphocvQ/f05GV7ikMB7bd
	LnRZ85RwYsxZWqEsForiJA1IU12HDh2is1dF63UxmK2N5F9NwKIS475677y5a3TuA18PrsU9NEK
	O6YV0Fu6uIab9/JtDt8EwKElNl7Nubg2u4HBvmnVvYHzluris0vX5SStytLQY5kYVzVIxcMXw2w
	==
X-Gm-Gg: ASbGnctFeQLXhy7dBGGAbgHDlGYaJANHEYYCn0PbIqU/bSjEdrbXusghu4Jk9zY8ICc
	5zBRVp9aS2grEtmWZ2cVBugebKTAfpkNK0BcdP32wf1EXi7EHypg/hi8jhB3Mm8CBWnhc8zmbM4
	Of1bOF7NYM6cJ2CNuUtaLpg17cqQCyf/3m+GzYVWc+E83C+Oy8NW0OPoh3CMYwNy715B/NkfcdC
	E1y4HmdJvzFW+a9gUlSD0NUu17LlpfBakpp97QyDV6TbAWcs4Hj1PdSglHPXuiodP6s88WfeN27
	dsGCR0VV1VOTYblmssuKcpfRkmxB2AWdyV0UewBSttBqQsiw8u/gDgT2t8ayEoJPZg==
X-Received: by 2002:a05:620a:2991:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c7b1af90a8mr547104585a.15.1744638533667;
        Mon, 14 Apr 2025 06:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX4O+qSr5lYuI0xXci8UwClLylPYXi2as5JPMMjmn1VLvTa5A/AYniUqnKC46HZ2UH6QSe5w==
X-Received: by 2002:a05:620a:2991:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c7b1af90a8mr547100885a.15.1744638532970;
        Mon, 14 Apr 2025 06:48:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1c02227sm905491966b.81.2025.04.14.06.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:48:52 -0700 (PDT)
Message-ID: <65663927-cc11-4810-8714-7600786f299b@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210155605.575367-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xjHv7YmFpYRHz3XLXCJUNhcau--ouZ7p
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fd1246 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=iMC0Jze56uYpCOfz6HIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xjHv7YmFpYRHz3XLXCJUNhcau--ouZ7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=825 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_064856_144587_AADF5A4D 
X-CRM114-Status: GOOD (  10.99  )
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

On 2/10/25 4:56 PM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SA8775P.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

> +			interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,

760> +				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,

759

> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,

762

> +				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,

761

Konrad

