Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24E6C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 16:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKll0OTr+FAupnplWAio3axMf3LjnLIqeSqJawk3ocA=; b=M102V24gfz7zP931EPL3biQX84
	SZFm0d3MHOR0c0rbm9txlV+Vj5aCpKP0l09Ct01EeNE+igg5ROxc1+LTxB1LLG8WlXCA5bS32doJy
	V2XQ4cfJhpBpsCNGX1TX1mc9V4DrCbQf6dbZixWv1OqMvbbRl3esQcZ3O23aPz+iTCaITKnqUcUnc
	EiX8eF6HvS671wrLNIL2m58gax/8W6qiB2jbYK6doilXrDTiYWgp7kBqdv1jAER4+9rzwGLFYpJs/
	RobHrwleTWdgUnv7c2b+8byR3/Y7nRoMLGD+RmLCvwtzfwzrAgLeYRmacg3v4074/yx5Y09sbTsPM
	VcKd3BVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teGM5-0000000CrgM-1YqJ;
	Sat, 01 Feb 2025 16:28:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teGKk-0000000CrXw-2w6W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 16:27:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 511FTPao017378
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Feb 2025 16:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKll0OTr+FAupnplWAio3axMf3LjnLIqeSqJawk3ocA=; b=VhQ1AMM467Pl8oY5
	p3ZdQQMO7ryoJNf9YdmC+UGRXztIfWG93qejsXbeyw3Lt4ceUfE+KTVwgD/HG0HM
	8ZReaItoewDJtWMWUNtqjtJyZ+Tv09cbiY8f2N8KTTtuoLj2j1DpQG1aRNbi0JVe
	bOjHMk7uGp4wIGHEaXweZklqbNhULpMNPhTzgxj+FIdvnIT7C7axtvoptPUJpxBX
	sRALm57UoGkoD/qgbauZuce10ofcC+ZpTJeE38J8AiuGmvqmRGMDrsbGGgtCLeJH
	fBF3z4H0Iq6tm07wgMxOnp6OnznW1Ss14HJ/whocFpPxMT5iaxGYuB0iH1uUAngr
	fFhWDg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd6s14ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 16:27:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8f15481bbso5866946d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 08:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427221; x=1739032021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EKll0OTr+FAupnplWAio3axMf3LjnLIqeSqJawk3ocA=;
        b=rEUAeyMoeVSQe4UV+4U82bRfwova4S1dKNrGWcYDj0Ckq7Ep/CV/MgJ/5BKfWavSdb
         1P4sUl0b9qA+V6NTtfYBg8xc9HERNC4+Re46MfmVaJfHMWKuCzmU5C82XYrj6GpZZ8LX
         8uoQ6wOutGBsvF3r2BfnsEsZMul+Dqngpk+SJDIONjoHucSiDix75MqtqzrrB84eITxI
         3MpKK4OaO2v4fMr34AAqANMj8piFE3KnTunkfGh8Hrv7c3fXmtVcIccQIwYQChyMQLW5
         MM9jE0CJ8rRRClgR8w0Wnw8KuGr/mAuFv7FF5zuXxpfsM0WbxVjLLgBwYlw00g9v3XYa
         2O0w==
X-Gm-Message-State: AOJu0YzqJQzLrzd3wz5T8gCWfSYQYTGV4Ln8kyRphzDWThXyTWqDmKVO
	gAxlL3vH1Ya5z9RfxlGW7UYKIeANKqof0Q3ocZ3JJ6FCiWdegDSWScD7ZPTLwRe/fiVu+CzHAUY
	HBZ7Jhive4n5YTwIJ06Gdn/TKs31V1+LpYteq80THztUlpz1EzY4U2knq0YTm2EV5idFJuxqOCg
	==
X-Gm-Gg: ASbGncsk3jcMy/WLdQlDDbzSsCSfNYhXAU6STuQsfUi2ygWJibfTUY3F6V+HWQaocE2
	yNackfkIN8YINkp8lV9AMzZBWWGPFm8hXEG9HVJRu2pLDhmZicEe3g0cUUY3PyIrtZTgnlp85Xz
	Vt1EjSw21i9T6gg0oC9XBi9temLQYRbZiPEx6NiiSFGR/LlmrojC9aQDsSTNUShPPrsUgmEiES3
	emZ60Rf67Yg61dpO6hJEFKPwfrRhV8DWmcpjprscZKRtDes/rXyJAkEMC8JoXDtfF86b2EIs/qJ
	FMTRdgpefIAOqvglThEYwWJhw1Mk3lijPIAF/JzG92Z8RiE1TC30raF6ko8=
X-Received: by 2002:a05:620a:29d2:b0:7b8:5629:5d58 with SMTP id af79cd13be357-7bffcce5683mr798966785a.4.1738427220696;
        Sat, 01 Feb 2025 08:27:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW5dCt57KxB3QTUkH/DtBPukVEDHPBWvCI3vtS5HPPpewERxqmhT5SNUKe1IVKv5OIuqLK2g==
X-Received: by 2002:a05:620a:29d2:b0:7b8:5629:5d58 with SMTP id af79cd13be357-7bffcce5683mr798963885a.4.1738427220201;
        Sat, 01 Feb 2025 08:27:00 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc7240487csm4570605a12.34.2025.02.01.08.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 08:26:59 -0800 (PST)
Message-ID: <80ca597a-3d85-40d0-a04d-4bb8ca91b687@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 17:26:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250121125010.1853269-1-quic_vikramsa@quicinc.com>
 <20250121125010.1853269-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250121125010.1853269-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v9f01Px3x3Tz5E-yspNTOeV4frcfpRHx
X-Proofpoint-GUID: v9f01Px3x3Tz5E-yspNTOeV4frcfpRHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=818 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502010142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_082702_876741_C00A926D 
X-CRM114-Status: GOOD (  12.66  )
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

On 21.01.2025 1:50 PM, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---


> +&tlmm {
> +	cam2_default: cam2-default-state {
> +		mclk-pins {
> +			pins = "gpio67";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};

If you don't plan on adding more pins there, drop mclk-pins{} and put the
properties directly under the cam2-default-state node, similarly below

with that


Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	};
> +
> +	cam2_suspend: cam2-suspend-state {
> +		mclk-pins {
> +			pins = "gpio67";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +	};
> +};

