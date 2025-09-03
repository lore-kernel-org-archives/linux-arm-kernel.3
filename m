Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56894CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 02:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MR4kOjYGWE+3dtlgB4cQLtnV0AU3BFNkg+7eBEnx9Uk=; b=MPgkG0zySa98eQCm+dBn5LlVgR
	D333eU0W4vcr9g0Bbx86JcSWTdX3gO0+fMcCtSsYx2T5e3X8pFfS0Lmil6ywYc/lgCEFm20pPcxbU
	yIcOabN+H4GTjkHEJGehQ9LCKiMrY3vrSkK89W1xGFFlz9KD9gFJ1M0Vi/EXyY1doTz9JeZTg/Jrr
	p+WQGERHrTBQIMO6gdsSxjDavJJpkbljlsE0uh4stV911KbO26G7mXwflwwo5akuPgVH7+UR/xhIs
	CmxRuonXmVu3iI0lDo2d9dQbTGs2vWpqamLw4rAQk8JHivi8OhNZDBlO3MjOnSzm8+LfBZvI/Zycm
	6s4UUbxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utda4-00000003MKm-3rlR;
	Wed, 03 Sep 2025 02:50:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utdXM-00000003Ler-0GWa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 02:47:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832TB7L012191
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Sep 2025 02:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MR4kOjYGWE+3dtlgB4cQLtnV0AU3BFNkg+7eBEnx9Uk=; b=md2rXUYjLn7pvb5o
	QRnLxFk7VUDgATnzM7VFIxeHLiv62syDGG7jSg/vRL0Nhv0R3b1oGLBTYT3+eE9M
	YvCRchozMgSJq0D19sqPCMXRvVPtpX0bF54FU1wKk513xRi0DOw1tjwDLJ1w0bIq
	2S8+M7UtRBB8I4UrP5L/8v/QsWpR30IlesAXxJTAGaYO1Qt507YzHUEopGw00RLP
	DvWj8KXMpZSkrOPwmEWMRIKYSWx1iGpmCnNmxNPHH1nN+X6esaQJG/VRUBi2iWCr
	CGbQ08bFcCPBUmuXJnjqqatayB+iaU45K/Qwadx6v6/1KQhwZYxuWqsn754Y+Rcb
	QdGwog==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fhtsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 02:47:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7724487d2a8so5381648b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 19:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756867670; x=1757472470;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MR4kOjYGWE+3dtlgB4cQLtnV0AU3BFNkg+7eBEnx9Uk=;
        b=uL1dLAR4g/IMz+vUVYlo9Vzy/rim1q8dCBjRBODR7PEr2/8sn+S6lMkDw0aR2zYoOm
         aW5b6f9PRviG4kiDsHIlOltBtBK8OzdVynM8QmtEC4aXTdeLZud1yoxcrQL3I0qFDkBN
         A6TWsxieDHP7Y70OjfL4d5BLAaD+FoVh8QL90yOk21rLux0wfA15vj083AvG3vx3T1Oi
         XfZKrDpWpqglML5/0qKbBO3BJPgfk/n3ETzd63Sa0SwWBWRf/RPXGmtQXdXt987RhqSa
         i1FRMKi631UJjhvflraSw2Ks5AEcIDjuPS6rh5fMG3E5GO9R/052lEaWfZ8kixb6RxFj
         NhUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy2ofsUDOOQEFWqb8AoqEa3JJ6h8S3Jskw5BxmyKKBGhaaHSiINBwiu+otJmvG1IGe5VWurLYivLGot9ja1LGG@lists.infradead.org
X-Gm-Message-State: AOJu0YwPEXP4tV8plQOL9vplelc/HiR5h0sT1Ik/Tn3rTl5pU0dzzLMb
	IWh1Oz31DcJX0kdhG3JtOOWwV6HkYLwzK19U4oJYObGtUXsn6LR22nwhhut153LLl5pVhvdCyh9
	t8s1GeJeS0lBwugY/kW+jOe/ECxs6Q6fVy60JH+1cEj3Xe6mao+A1Sad0hqOQTW5rMwUpmluW1z
	eqqg==
X-Gm-Gg: ASbGncsIZbHtCPRHAC0Nw/wPJFyj1S6Oj5SeMEsm/zNG2BZRG9jcKMGQ98FNt41cfmN
	YQMIu584rmQDvR9SIeim5M384+17Qix6PjzYzAgPT7whaatKzKiJr4m+Zipx76o7+/YEmVXkclM
	LLXnB1bhn/j0oP15EuYKdCevTTveNM2z35WsfVq1SSxcxbFTigwec8LGRdyQWMwfRqCf27tMgPT
	OGuIZSY/ep9YQon48ao98V+7kuQPjjwUxgOZql2Xu1DfoLJ2Ma+WNwCdqcGHTdhNTRmGXReMhM/
	4R5ko24vi6Th6n54EfyWAQ9RSVPB4jTrp03QYCcXadMurkY5rXXhMKiUdRAVw/2W97Y88oDr8o9
	aWvK7xJHLXwQ4oghaC/QNGuaHjXsu
X-Received: by 2002:a05:6a00:39a0:b0:757:ca2b:48a3 with SMTP id d2e1a72fcca58-7723e259561mr15595224b3a.9.1756867670484;
        Tue, 02 Sep 2025 19:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDO7sTee57O3KQCsZo26R1EkKcAn2uGXwp7NsC8REemaNjEc7JaagReOo8ixwYY9UtqoAwbg==
X-Received: by 2002:a05:6a00:39a0:b0:757:ca2b:48a3 with SMTP id d2e1a72fcca58-7723e259561mr15595192b3a.9.1756867669946;
        Tue, 02 Sep 2025 19:47:49 -0700 (PDT)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725d5b90fasm6884902b3a.100.2025.09.02.19.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 19:47:49 -0700 (PDT)
Message-ID: <67e3d491-0af3-4fd7-87f9-5ece1521174d@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 10:47:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] coresight: tpdm: add static tpdm support
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
In-Reply-To: <20250822103008.1029-3-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX2A6wAqAjOYyK
 iC+gGZjYnpaBzxBXeRGoTuTJGmrl/czls8O4sgPQRuVfAWwGZcYOVLybUJdJUW+qMrMw8Q/PUeo
 f6/NVaKkkhRbZVS5As+7uZRw11ghkunPlfjhSkkLhWEohUqMu8ynyRk20wtTsKswEvchSj6NZap
 hvzxifCL6y0bUxbCGvT2ggVddSnac55Vdme/8qdp/crZWHc4sqO2Gfmwa4TLuO5oV/hnjP9XP+x
 Tv6NAJAPph0S0kERKhfnSdJCCs+fS2cFKfES3jE77aGYHdnjS2FkGXd2O4Nu6WWTC7qRTRCh5t2
 yGd/doU/K90FQ/SWInbUsP8UUv1WfcIGfDwPoRhyPF6ch9An80RETAu48zkSEaSoMhvOnQ8ZYdK
 o+V7aCGt
X-Proofpoint-ORIG-GUID: drMZ_gWzCSJEsuNbd2rcCFaIDj8BJ4-u
X-Proofpoint-GUID: drMZ_gWzCSJEsuNbd2rcCFaIDj8BJ4-u
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b7ac57 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DS5xQBhA3tpC-DeSMgwA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_194752_121085_7CB30402 
X-CRM114-Status: GOOD (  33.94  )
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



On 8/22/2025 6:30 PM, Jie Gan wrote:
> The static TPDM function as a dummy source, however, it is essential
> to enable the port connected to the TPDA and configure the element size.
> Without this, the TPDA cannot correctly receive trace data from the
> static TPDM. Since the static TPDM does not require MMIO mapping to
> access its registers, a clock controller is not mandatory for its
> operation.

Gentle ping.

Can you please help to review the patch?
This patch has a dependency:
https://lore.kernel.org/all/20250806080931.14322-1-jie.gan@oss.qualcomm.com/

Thanks,
Jie

> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpda.c |   9 ++
>   drivers/hwtracing/coresight/coresight-tpdm.c | 148 ++++++++++++++-----
>   drivers/hwtracing/coresight/coresight-tpdm.h |   8 +
>   3 files changed, 131 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 333b3cb23685..4e93fa5bace4 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -68,6 +68,15 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   	int rc = -EINVAL;
>   	struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev->dev.parent);
>   
> +	if (coresight_is_static_tpdm(csdev)) {
> +		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
> +					      "qcom,dsb-element-bits", &drvdata->dsb_esize);
> +		rc &= fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
> +					       "qcom,cmb-element-bits", &drvdata->cmb_esize);
> +
> +		goto out;
> +	}
> +
>   	if (tpdm_data->dsb) {
>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,dsb-element-bits", &drvdata->dsb_esize);
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 7214e65097ec..1766b0182819 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -495,7 +495,9 @@ static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
>   		return -EBUSY;
>   	}
>   
> -	__tpdm_enable(drvdata);
> +	if (!coresight_is_static_tpdm(csdev))
> +		__tpdm_enable(drvdata);
> +
>   	drvdata->enable = true;
>   	spin_unlock(&drvdata->spinlock);
>   
> @@ -551,7 +553,9 @@ static void tpdm_disable(struct coresight_device *csdev,
>   		return;
>   	}
>   
> -	__tpdm_disable(drvdata);
> +	if (!coresight_is_static_tpdm(csdev))
> +		__tpdm_disable(drvdata);
> +
>   	coresight_set_mode(csdev, CS_MODE_DISABLED);
>   	drvdata->enable = false;
>   	spin_unlock(&drvdata->spinlock);
> @@ -1342,10 +1346,9 @@ static const struct attribute_group *tpdm_attr_grps[] = {
>   	NULL,
>   };
>   
> -static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
> +static int tpdm_probe(struct device *dev, struct resource *res)
>   {
>   	void __iomem *base;
> -	struct device *dev = &adev->dev;
>   	struct coresight_platform_data *pdata;
>   	struct tpdm_drvdata *drvdata;
>   	struct coresight_desc desc = { 0 };
> @@ -1354,32 +1357,33 @@ static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
>   	pdata = coresight_get_platform_data(dev);
>   	if (IS_ERR(pdata))
>   		return PTR_ERR(pdata);
> -	adev->dev.platform_data = pdata;
> +	dev->platform_data = pdata;
>   
>   	/* driver data*/
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>   	if (!drvdata)
>   		return -ENOMEM;
> -	drvdata->dev = &adev->dev;
> +	drvdata->dev = dev;
>   	dev_set_drvdata(dev, drvdata);
>   
> -	base = devm_ioremap_resource(dev, &adev->res);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +	if (res) {
> +		base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
>   
> -	drvdata->base = base;
> +		drvdata->base = base;
> +		ret = tpdm_datasets_setup(drvdata);
> +		if (ret)
> +			return ret;
>   
> -	ret = tpdm_datasets_setup(drvdata);
> -	if (ret)
> -		return ret;
> +		if (drvdata && tpdm_has_dsb_dataset(drvdata))
> +			of_property_read_u32(drvdata->dev->of_node,
> +					     "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
>   
> -	if (drvdata && tpdm_has_dsb_dataset(drvdata))
> -		of_property_read_u32(drvdata->dev->of_node,
> -			   "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
> -
> -	if (drvdata && tpdm_has_cmb_dataset(drvdata))
> -		of_property_read_u32(drvdata->dev->of_node,
> -			   "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
> +		if (drvdata && tpdm_has_cmb_dataset(drvdata))
> +			of_property_read_u32(drvdata->dev->of_node,
> +					     "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
> +	}
>   
>   	/* Set up coresight component description */
>   	desc.name = coresight_alloc_device_name(&tpdm_devs, dev);
> @@ -1388,34 +1392,51 @@ static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
>   	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
>   	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM;
>   	desc.ops = &tpdm_cs_ops;
> -	desc.pdata = adev->dev.platform_data;
> -	desc.dev = &adev->dev;
> +	desc.pdata = dev->platform_data;
> +	desc.dev = dev;
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
> -	desc.groups = tpdm_attr_grps;
> +	if (res)
> +		desc.groups = tpdm_attr_grps;
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
>   		return PTR_ERR(drvdata->csdev);
>   
>   	spin_lock_init(&drvdata->spinlock);
>   
> -	/* Decrease pm refcount when probe is done.*/
> -	pm_runtime_put(&adev->dev);
> -
>   	return 0;
>   }
>   
> -static void tpdm_remove(struct amba_device *adev)
> +static int tpdm_remove(struct device *dev)
>   {
> -	struct tpdm_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev);
>   
>   	coresight_unregister(drvdata->csdev);
> +
> +	return 0;
> +}
> +
> +static int dynamic_tpdm_probe(struct amba_device *adev,
> +			      const struct amba_id *id)
> +{
> +	int ret;
> +
> +	ret = tpdm_probe(&adev->dev, &adev->res);
> +	if (!ret)
> +		pm_runtime_put(&adev->dev);
> +
> +	return ret;
> +}
> +
> +static void dynamic_tpdm_remove(struct amba_device *adev)
> +{
> +	tpdm_remove(&adev->dev);
>   }
>   
>   /*
>    * Different TPDM has different periph id.
>    * The difference is 0-7 bits' value. So ignore 0-7 bits.
>    */
> -static const struct amba_id tpdm_ids[] = {
> +static const struct amba_id dynamic_tpdm_ids[] = {
>   	{
>   		.id	= 0x001f0e00,
>   		.mask	= 0x00ffff00,
> @@ -1423,17 +1444,76 @@ static const struct amba_id tpdm_ids[] = {
>   	{ 0, 0, NULL },
>   };
>   
> -static struct amba_driver tpdm_driver = {
> +MODULE_DEVICE_TABLE(amba, dynamic_tpdm_ids);
> +
> +static struct amba_driver dynamic_tpdm_driver = {
>   	.drv = {
>   		.name   = "coresight-tpdm",
>   		.suppress_bind_attrs = true,
>   	},
> -	.probe          = tpdm_probe,
> -	.id_table	= tpdm_ids,
> -	.remove		= tpdm_remove,
> +	.probe          = dynamic_tpdm_probe,
> +	.id_table	= dynamic_tpdm_ids,
> +	.remove		= dynamic_tpdm_remove,
>   };
>   
> -module_amba_driver(tpdm_driver);
> +static int tpdm_platform_probe(struct platform_device *pdev)
> +{
> +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	int ret;
> +
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = tpdm_probe(&pdev->dev, res);
> +	pm_runtime_put(&pdev->dev);
> +	if (ret)
> +		pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static void tpdm_platform_remove(struct platform_device *pdev)
> +{
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
> +
> +	if (WARN_ON(!drvdata))
> +		return;
> +
> +	tpdm_remove(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static const struct of_device_id static_tpdm_match[] = {
> +	{.compatible = "qcom,coresight-static-tpdm"},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, static_tpdm_match);
> +
> +static struct platform_driver static_tpdm_driver = {
> +	.probe		= tpdm_platform_probe,
> +	.remove		= tpdm_platform_remove,
> +	.driver		= {
> +		.name	= "coresight-static-tpdm",
> +		.of_match_table = static_tpdm_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +
> +static int __init tpdm_init(void)
> +{
> +	return coresight_init_driver("tpdm", &dynamic_tpdm_driver, &static_tpdm_driver,
> +				     THIS_MODULE);
> +}
> +
> +static void __exit tpdm_exit(void)
> +{
> +	coresight_remove_driver(&dynamic_tpdm_driver, &static_tpdm_driver);
> +}
> +
> +module_init(tpdm_init);
> +module_exit(tpdm_exit);
>   
>   MODULE_LICENSE("GPL");
>   MODULE_DESCRIPTION("Trace, Profiling & Diagnostic Monitor driver");
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index b11754389734..9f52c88ce5c1 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -343,4 +343,12 @@ struct tpdm_dataset_attribute {
>   	enum dataset_mem mem;
>   	u32 idx;
>   };
> +
> +static inline bool coresight_is_static_tpdm(struct coresight_device *csdev)
> +{
> +	struct device_node *node = csdev->dev.parent->of_node;
> +
> +	return (csdev &&
> +		of_device_is_compatible(node, "qcom,coresight-static-tpdm"));
> +}
>   #endif  /* _CORESIGHT_CORESIGHT_TPDM_H */


