Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B89AE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJqs3LBaHS0qNxIlK9e3tbBAjY2Ry/AmnabvELxwND8=; b=zvzIWow46LJlFZVQguCs2TanuM
	CjGcP0SXraQyM1fKoHK/i+VnWii2pI1nmaAGZGlCmRCQnMctXjgDaEbzdW2NkQ5ozvHuwB+BizA0j
	IjiE052E2fxiykgXh71DLiakgB1/9jlBdvvGixGyroszwq7YETgRcVtW8Xn6zncweIOPx/FpVUJ/5
	vI+OV1v5h2yE8oBxuovNarVCtRfDmQWHper5PB0jNT8J4uffFKDaRgbiHJSWMobyGkWz70IZSLatx
	tOVaQ+BIUOL3PuP0A9ypOGqprUI6VRkHqSOaBUyRaSxP+Af/QxIaxpbJV0zmBbJvepC6jRKC8AZ46
	6eHIqUAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJElP-0000000Gl8g-2HSH;
	Thu, 05 Dec 2024 16:31:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEkN-0000000GkwM-1BnJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:30:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5EVxVc015071
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Dec 2024 16:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XJqs3LBaHS0qNxIlK9e3tbBAjY2Ry/AmnabvELxwND8=; b=Ui6o4i+R9GCCGSGY
	R4H58ceUWi2la9KOlE93gfazq0Vri4v1gQpfe1+ZjyKgv8nPBvhbWCs29c22GX4w
	aFhDiTign1g7rdaI1/22Wx6bdtodhM1CVGCb/xkEgkiVaQdUafNppDtr/cnPPlWo
	zXiJOg5BDbBy1iWMbOqs2HrZh5bzA9fg36w8C6x8Cyg8fyX3mv1NX5IYB2IxRew6
	FlvdizntI2KWMN3CZM+T3P5AvVvWpF4ns3oZfHDRen5EjYZQDCjc0m2JiafiBjw1
	e7DdP7m7/x6TuGJIzM+25e6kuE2BmFWWL0gC1IeMogS9jCaoD+OkQLEWWV/WEWc+
	CaUxGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be170b8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 16:30:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46692fb862bso2257521cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 08:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416233; x=1734021033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJqs3LBaHS0qNxIlK9e3tbBAjY2Ry/AmnabvELxwND8=;
        b=bho1RP07aSXtmtORl+uDkxd1m2kTJAXD1cSCo11CrHCG18g21DtLAjPBDXaHwtQjek
         y1u2rRMTgd/30t2AS6qruoAzN5TbTzok5BYGBfZ7kD9TNcTP+4whV5ou97ZK1N0YHsKj
         0weCG2nB3Z50Y/oXa94Zm6WMYVrh04bRLIoufyNBf7c+WZib56fMCzh97ivv7uR0gkyM
         Wv6q7Tu+jZH7lzZ+ZSTD3OigBWRtWbpFktOVWGxuZKMfCaCK2fNZNDvvmNa5A1DdClu/
         9KN4eQua217mt0zUACpy1n2rSrduApmPhpGrMW4cl0OJtvYbmUIdz7dYfifL36eK1aMn
         gl6g==
X-Gm-Message-State: AOJu0Yx/kcyRqCIVFhxgcs4PoF5s9uAx/wXevrW68pJzwu6P4vWkE0d/
	QezI4EO14NJIv41KKgpLM0KaLMZe3eTpMES2rS94syt5KGWqP913cA1Ayj8ftpjBe/3ASfYoMbz
	x00MZt6LJjnCTCBdiEClism4Dqnbj/c1uiGYsgatQwb6fvxwpgLTOdrUtSAuO3SpuRLhH96JnfA
	==
X-Gm-Gg: ASbGncuNj2gRJxf+tqGZXW5VoE+OL1bymKFz+wdNkPUoH6ZFxFZQtkUJpfrGHowQW6t
	w149YhIQIGPGXP+/bcFW+pBAKNBnteou5BuoChEJXAjpzPkBwOyGFoSe16SAIlA22f+nDIVeNpq
	PqgB0PF2GwFJEkpXVTC6WI5DL3Ndkkx43Fn+ug1IViDpQAwaReF0OqSPDaS+vO4hMRHtV1fj1g8
	4syrxzvHkMd/EPxTk3UUHsG0uTqMkX2iRQz3hxTUxWNyOVC/hK6CcAqtYBW1w1pVsteFfxg5scY
	gwVhIU8F7DEm30Q8S1dCbY0eyCaKN34=
X-Received: by 2002:a05:622a:a:b0:462:fb65:cbb5 with SMTP id d75a77b69052e-4670c75dc63mr66770431cf.16.1733416233564;
        Thu, 05 Dec 2024 08:30:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZeQA8RbgBR7LIKk6MDXuqNewHF3QPDsiRdWfNeMAgVb5kGQVSn+F8U8HBX24n/Y8PMgcsYg==
X-Received: by 2002:a05:622a:a:b0:462:fb65:cbb5 with SMTP id d75a77b69052e-4670c75dc63mr66770271cf.16.1733416233198;
        Thu, 05 Dec 2024 08:30:33 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e58dbcsm112253966b.15.2024.12.05.08.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:30:32 -0800 (PST)
Message-ID: <cf90f570-57ea-4ce2-9592-82a009f198af@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom:
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
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-6-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204100003.300123-6-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7pMMfqX-lIXJixovey3owlOcG9cHj0lS
X-Proofpoint-ORIG-GUID: 7pMMfqX-lIXJixovey3owlOcG9cHj0lS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_083035_439307_EA55D5FC 
X-CRM114-Status: GOOD (  14.03  )
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

On 4.12.2024 11:00 AM, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
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

[...]

> +&camcc {
> +	status = "okay";
> +};

It's already enabled

> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +	status = "okay";

A newline before status is expected
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* The port index denotes CSIPHY id i.e. csiphy3 */
> +		port@3 {
> +			reg = <3>;
> +			csiphy3_ep: endpoint {

Also between last property and subnode

[...]

> +
> +&tlmm {
> +	cam2_default: cam2-default-state {
> +		rst-pins {
> +			pins = "gpio78";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		mclk-pins {
> +			pins = "gpio67";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};

Please sort these by gpio idx

Konrad

