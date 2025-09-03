Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CE0CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3po8LD/tlDhYLuSoiG6xgfO9Aa0+IGS8ggHVHTqjVRs=; b=vTCP6A19AiZwuwecQfEP7QeKWJ
	GVMuwt4R0MVgK65zbEiOsS1hqqmYrbJjm9BT0NA+sbTK6VLuHaIuHgxDKw1Jit8GRcaeU/gU/4mgg
	6/ZMKmQ28l77EbYP1l1wljiRAcfwGWXdeOV78lnxhRhXBmJ9ym0DN8HfPRcQBQn/g/ScWthCPzsst
	XClc/bbeCmvzi4agEByp3GkMxktY2BV+MkX4RxL4TAOULaTTUMbjYE1SSzaUYZYydmH1zQWwr10Lf
	Ol5HQgtFGFWomwbEV7UCW9n70Htc2JyX84k+8upDzMz/ASRjZxlO03pW89r+ydGGgZ+1AOU8n4PCB
	iYQE//pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmS1-00000006Mkg-2JYH;
	Wed, 03 Sep 2025 12:18:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlK8-00000006B57-3UCl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 11:06:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AXYLA001402
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Sep 2025 11:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3po8LD/tlDhYLuSoiG6xgfO9Aa0+IGS8ggHVHTqjVRs=; b=kNC7lZElTHx+SieB
	1RXKKthOAUXZYQfJQXj8fQYDnwehpb4OqCksUcVQKs/kool2Ip0usulzq81QOFv0
	yKI1JmhBtdMvXEE8uL1BkKAawdZmDwifCca2CtipwDBt1wchU5Yn/dABfanrI6+r
	431XPvaZmOCnHfTwUGug6v970wfWWhZ/Z45e2dxO0dMJPXvvf77teG7bBW4slcMB
	KMAbX/hg7/LVLts7mYVAy1v7FiPeypQVs1zSePqwy3K0ZxIk8rL2yshLavRgXByX
	VQCApdhjhTk3Nh54E7l5tqSh5HDmbQdlCSIf4F6FUegQYCtAiD/0Ae69KWwk445W
	hfS5/w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy79ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 11:06:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b31f744865so10365381cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 04:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756897602; x=1757502402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3po8LD/tlDhYLuSoiG6xgfO9Aa0+IGS8ggHVHTqjVRs=;
        b=nyPzqhU6/AdVFzRyHG0CUP+UNHsFmlwX7MD7zMA5NiiV4UsEbkqJ36juxkllPRuNEi
         jjN6haCYOoWb0EqcAr1MG8vGqMmDkld2nsy90C0HZWhOqweaNM8CvKwcdvLJG9Rli4ku
         PusgsoDd41PLvJXISgs6s9t4TqnPAfDs4m2G2nRsFSlZoTdsZCaAJsDvl/zoy8cvhz0e
         9OOH+jFTC6OB6Borlq5Z6lOTVZa7ZT4M87Bm4Z3y1ldnwEGpzbtakp0ZrCAm9LsCVJeK
         olXS5pbrUbz5iOaMSZc8KW1UnyJWWrYnYibUGMqsdc4W8GtnduIB9qx//5bCluaPQrIL
         SkBA==
X-Forwarded-Encrypted: i=1; AJvYcCXB6RBQcD6/bJgZcO3jkxzAveinqMr8c6uS2xMT4+nAeJPsnYujEQ8u5lWu+yPrWaKczpKm4sexCxHmjxHI/yOu@lists.infradead.org
X-Gm-Message-State: AOJu0YzbjQCp6/jmuTlEgh3SJM74iz21FKpsKxrb9hTqX1FbvAbdYnSC
	f/Fbbh6ZS/rvXBUESjzcOwrPhjuJ16RAzs4jG4E8cVqYzkejixkxTialR40lc2oQWC7lp38a2qa
	K1kGid0iM/Nl6o12Bv7TVmdUw9OeTYCutnb3f8PvHdiHLWZW7GLB4VXSOV+sAVh4nFdg1smhPnn
	ovsA==
X-Gm-Gg: ASbGncuaCRTC+Qg203gGltSrSiSzeEuDg75RtkCVIwUbohMYhg2Anj7rbmk6pigFtJT
	/Y4iXYUvFb1Wg1sN3S/qobqHQ0mujJYrh2hCyEYmrqD4HCEj+95r7o1oQznxAzObnEL1ARFEv+q
	hjuawHsCnSMoyMpkRwJajTvhRu9pnDjdvvkwh7mAD9pdnYPIXl1Ll9ii9NaQjRkmL/d6hzWnVxh
	Z2+QR0/3hPZbGvUYOtiqVY/A7eIHwRod3ku/tOk/D1jfzCT4Whl0xsn6Tdw/C8a4VJv0R8QcuW1
	fI3jp8gORVdhZ+UbCfgcaA9ZFTXtR3v9cprrnpnHGaufmSmAIBJqHQm6ZwGSOWap4YsQn3KY7pt
	l2xsCm3pqY1XW4njzPD+wIw==
X-Received: by 2002:a05:622a:46c7:b0:4b4:9070:f27e with SMTP id d75a77b69052e-4b49070f397mr8044261cf.0.1756897601566;
        Wed, 03 Sep 2025 04:06:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnvWanngRWYl/vDrIJba220OS1NpihDvhNZFTX9RixZk2pRzoKnklmLD8akR5jvqrGDafwkw==
X-Received: by 2002:a05:622a:46c7:b0:4b4:9070:f27e with SMTP id d75a77b69052e-4b49070f397mr8044021cf.0.1756897601000;
        Wed, 03 Sep 2025 04:06:41 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046d420e02sm97552966b.39.2025.09.03.04.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:06:40 -0700 (PDT)
Message-ID: <4a28c9ea-fe71-44de-ada9-eda3111eff9e@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 13:06:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] coresight: tpdm: add static tpdm support
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
 <20250822103008.1029-3-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822103008.1029-3-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b82142 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4Vys72YcJYr5vsCECUwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: lcPM4S25H875dSIziu6AvXpWG2s9-MPs
X-Proofpoint-ORIG-GUID: lcPM4S25H875dSIziu6AvXpWG2s9-MPs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX1AKaOAF33/h5
 1Q0iscmgB+6LzHP2wfRwOVUHWf/cahshbpEu9KogoaCOKczdWiaxKGcPNqddFP3dH3qUkwKGdRH
 83pxMHtIGhOcoAtvISnVEPQW+mUc/ZTKf3ob4xgAy/NNmVrIv31SmyZwsR3AbHVTNC+osWg5gZT
 sRT+kmpl/ZdO5+0UjLB/75RQ/VbeaXQUYYs+cyhUfqRN2gd66R2oHU+Uqf7BYi2jmJGp3tLQGRC
 WS7FB5qtkXkDK6oEHfYu6HW/f1tHXO4HKmd2AdwwWUiQSCesWETz/9/2AfccjkwE5hIGdIFpHhD
 4I1KmRyGyeQ5HokgsTzc7B6c5zaK9oBwnrx2shRhyjMQkuTQDvKunL/QHoCxuBsAwKmqrydrCDq
 QzQfcLXB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_040645_004925_700C6D0A 
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

On 8/22/25 12:30 PM, Jie Gan wrote:
> The static TPDM function as a dummy source, however, it is essential
> to enable the port connected to the TPDA and configure the element size.
> Without this, the TPDA cannot correctly receive trace data from the
> static TPDM. Since the static TPDM does not require MMIO mapping to
> access its registers, a clock controller is not mandatory for its
> operation.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tpda.c |   9 ++
>  drivers/hwtracing/coresight/coresight-tpdm.c | 148 ++++++++++++++-----
>  drivers/hwtracing/coresight/coresight-tpdm.h |   8 +
>  3 files changed, 131 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 333b3cb23685..4e93fa5bace4 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -68,6 +68,15 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>  	int rc = -EINVAL;
>  	struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev->dev.parent);
>  
> +	if (coresight_is_static_tpdm(csdev)) {
> +		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
> +					      "qcom,dsb-element-bits", &drvdata->dsb_esize);
> +		rc &= fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
> +					       "qcom,cmb-element-bits", &drvdata->cmb_esize);

This allows either pass/pass or fail/pass combinations to succeed
- is this intended?

Konrad

