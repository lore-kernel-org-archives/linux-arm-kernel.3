Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD65CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5rvouy0LA0qv0H/lcd4HWDbQ7WITv9x2aTO/Bk6nOo=; b=z7c5kf7tvXj0PlfLnhlfOJkAga
	R8vxXdYI7RwW3aaS2Cajlqcm2Nr6E+WOFxex9vjLqGaDYtbVcWw57YMjcA3cAVoIqrmovKmwrimAi
	tBxOQDc7fdf/Z2N8eGEx9oxUc7WZLQGnqtkwxyIBL5Toamlb6EyHnkFTubBmQUyfQSxR1pODO4C4i
	nAlFiuaw3HcMNWlB4BOPS6A/FtkvXdNkA3wEL4Om6Mckg3ZUD4Zr9VAd1ZITlaeW1D8XVkW5fTODo
	vuaTzgmllwBBhDqhEcZLhB8fgXgonWbhjuzsJzxHxMNtV0P+i+sCBVC4rnyPvefew/oUML4IURsJX
	Fq2Iolgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCk-00000003qXF-2lj8;
	Mon, 08 Jun 2026 14:43:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCj-00000003qWh-1qIs
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=I5rvouy0LA0qv0H/lcd4HWDbQ7WITv9x2aTO/Bk6nOo=; b=rhMGxR2dic45QxOG0NevSljBPJ
	FjdD/6VCkULwm9ai9yyr9vk0ovDjuhA8123ViLaCqoaPYeGVr9LC64DLKCWNvTVC0u2DrfV+UPfho
	A3ChbJqHH4Vw2K10KoRUH1lbWywm2x6irx5oX7gvH3vvEJMQ5SM0FosjQrWBGKJ8iQsiofb4kUO7m
	3s0IDZEmz8+LwvAf7/VpRo9aDP5vBYIZvwb8K75Tjc5bfwhZLjzNnGjmfStwTuyq5xerZ8Uqf0HYr
	I/nQTgtwftH8iBMUxtSpVOz5IPsSNyCdkwtArFup7p0SVqgeWdDHjcXBfgqphhqDas4O8rlRpHWPP
	gRRsaFXg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbCe-000000019Op-24iN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EXm4W3454627
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 14:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5rvouy0LA0qv0H/lcd4HWDbQ7WITv9x2aTO/Bk6nOo=; b=F7L5qxQHsRm61SUJ
	NnokikmxUR5WaZizasytm9Lk8FXczfnV9dL/1b+eK9d/fss9KWtNfJxcRAePv/QT
	Vv/jSMPZRYTIgh52JeXt8uSA8cQVP8zJVECmJOja+c/rdUKnjEfxK3d536KwTp8v
	yTYPj1GpdAYfoNzeowmlMGMhcnqBVGz4chAtpiLQ0IzztKGWacd8CH4I14DlhiTm
	8BZcUB0iGsX6Ov4WYECyNBxGj2BAZmLT+9/x0XF0ykCr/wUlD3qiUWkPPOiqv+kf
	1t0X5wj0wobR/nqvIb9pJleTVnGQ8tNxubAMj5BTinBkn0rMReFBhQ6fABUkMpOV
	xPRrQA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna98n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:43:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso4034900a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780929823; x=1781534623; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5rvouy0LA0qv0H/lcd4HWDbQ7WITv9x2aTO/Bk6nOo=;
        b=DcE6lgBOcGtU+rnxuAtjdUK7I9fWcUH5AMQWHv7vyIDw2Vp6M8hjSjUlqvbF/Y6dxq
         7mgQVZvRhhMUq1Eo9UMsGOWZl4y+hDB8tz3ROPSiNHQCk9Bq8JpJD5VFtGm2mPp8Y70d
         USVuhuszNpAH6V/9pcR8Seu9RZLyvuEJ70GgXsooeElTYwuFyMIWyidKCJ1kUMJGvp5y
         2W9YASrQ/T/xr8pafDy5tSGTMN1O5ilrS5UFAnYF249WDbGsffVdS/dmEyjfAUVf320a
         1GmwfkuxqgPqKzgP855xBuAszBQF4IGfUnVrxntw+p+ZN3BZSuUeQUhhjWWlbMq4xRrU
         0JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929823; x=1781534623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5rvouy0LA0qv0H/lcd4HWDbQ7WITv9x2aTO/Bk6nOo=;
        b=JeGnB5VRHlBuH2HEB55nMqXZQp9xEwUCLPGkpC9ldoPMRt+VE8v53aJ+oYxudBa1sZ
         S3KeOrYz5zJnCnzfYCtNjAadQfogumflmUrKVyqWEICLM/E50hWJNpr8ODBXp9XyFphJ
         SW2n7UZeVu0cII69lQ1s/dTYwJQvIz8BABzCDmEPEKZyij5R6Q1NOUAc2I+mfrxVbMLb
         AbE2cePMpjvI9CxBgGeqRMGYCYxf51PcuZUrVSA502soYh2clod4NQ2dl7kN7H2HYLbV
         VEL2lRlNn3oCb5zHBYMO9nngj3TtqkqO1XdUzPDz6HOeOWb21ryPN6k0g3obCXe1trZQ
         A8EQ==
X-Forwarded-Encrypted: i=1; AFNElJ8i0lrJ3P/+yTuj2NOSOaGhAwRdsF/qjaVoskwu3786bX90W4wOS+cpCYLMMgLPOMUvn3CGjy75gjB3SNGn1VYd@lists.infradead.org
X-Gm-Message-State: AOJu0YxAaqe15jFSAUtwO7YJp3/jPFKu9Yl+e8lx6J7ck372UBMbJpFt
	YuX2opSiHdLrMPisWz1ncCtVtb5H/uLZOjJqdWVCeGa1Bhpl7QM4WrofZ/KPW8LeG2jBaJWmvCT
	g7XHqWjcrQUYMvshABkZPhSeQfASx1EOPBkMjxn8SYYVY4/biXzrm3vkbbX908WeTittA+9EJ+z
	/KZP+pP3it4A==
X-Gm-Gg: Acq92OHSnJKvEEMkFCawbfxzbpSpGf9QcTS2c6zRqDKsarM8t7fpQ8jo6a4QYBPfjxn
	afv/nphGnM8XQcXFupLRJikVLmhbaRaH7mIr5Mp9cuUOuFPJSTCywS8MIXWljKtCpO6/ZSSQCvm
	xhY4BnIOExN6NZYbz3OH26k2p3tt8VcjB5ylrMSVGo60AjwQuY+zYaluEi71vC9Bol0DJZBJzmV
	gyKU3mVQK5Q9mjWbGa0W8pP/mnAET2iSozzs7Muml5ZYdzp48V/8rVv4Yiw0nrRN5cz7Ec4geQ9
	megzuHfPub5S0rzig8QcoTOzq8FCRL4Y4/LAz8j+hEMDGdeGLxtYxlBDI3j7qnRTGet+vK4fjTm
	cjRxlIkcCFm9OegQbjHWxE919Huvezy2PN/GtBXxEl5bhhcWChLxFfgR81HoP
X-Received: by 2002:a17:90b:180a:b0:36a:7da3:266b with SMTP id 98e67ed59e1d1-370f0c54d08mr16715124a91.21.1780929822993;
        Mon, 08 Jun 2026 07:43:42 -0700 (PDT)
X-Received: by 2002:a17:90b:180a:b0:36a:7da3:266b with SMTP id 98e67ed59e1d1-370f0c54d08mr16715093a91.21.1780929822496;
        Mon, 08 Jun 2026 07:43:42 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827f1sm19620137a91.3.2026.06.08.07.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:43:42 -0700 (PDT)
Message-ID: <a3523574-8eaf-452f-8126-db17892d5b40@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 20:13:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
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
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <68aa9591-49e0-4cb7-9a5b-36405efe7094@oss.qualcomm.com>
 <bkve3vmokuyrn4agsqyzxlqr5wuy5y6urnliqypac3h6lb32hy@tfkjstevqv2y>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <bkve3vmokuyrn4agsqyzxlqr5wuy5y6urnliqypac3h6lb32hy@tfkjstevqv2y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE0MCBTYWx0ZWRfXxcJ45smrmbh8
 xY61xOnAQltmVVK8brU8rZsWst/DA0VEbmfSA9fs4xvXc/2s3I3fj+KdArAU2dRYaA9faVIrb0w
 G8P++VcQmeCTemw9pUGHpFQ6dREzfHNpyZxzL1tVJvXolTBMf+z/1GkKEt2p1nUr7kUgVB5Ilr9
 MNnC7ZCDsvhdA1wPlFKnPpf6L+YjJRz/kIJWqZaWn1GAw/A1UAWMzsCgOllOl+d8wn98cZb0UAZ
 n9XkGK1fSVpTBisl7Xhrt3ukrtvfRg6si8y9Dx15zPZlGwItAlJbS6MUg09brqJ+YoYPnI0Je6y
 3nFpD/DJytIfirEvl0Hk8TVaAwbTzDsK9+3ubyWCF3QJ62pbgZBAH46857dPd326Up+l9XyLltx
 8nX2ntMT7pisA+nqi9crKoQouqvTxlmvqPTdibHGEy8rX69MzjCKYypfgP7XlqIim4LrVJ3XgvJ
 DxaWL2SpJVxa0NfIxNA==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26d51f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=ow02GMYoO05H5sz-MT4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: YwEq3MPA2xQMb9sFw27THhfjnvPdv8mR
X-Proofpoint-GUID: YwEq3MPA2xQMb9sFw27THhfjnvPdv8mR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154349_881551_CCAF9BEA 
X-CRM114-Status: GOOD (  25.23  )
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



On 6/8/2026 7:20 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 06:59:34PM +0530, Bibek Kumar Patro wrote:
>>
>> ...
>>
>>> ---
>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>    2 files changed, 57 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> @@ -53,6 +53,11 @@
>>>    #define MSI_IOVA_BASE			0x8000000
>>>    #define MSI_IOVA_LENGTH			0x100000
>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>> +#define ARM_SMMU_ICC_AVG_BW		0
>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
>>> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
>>> +
>>>    static int force_stage;
>>>    module_param(force_stage, int, S_IRUGO);
>>>    MODULE_PARM_DESC(force_stage,
>>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>>>    	}
>>>    }
>>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>>> +{
>>> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
>>> +	if (IS_ERR(smmu->icc_path)) {
>>> +		int err = PTR_ERR(smmu->icc_path);
>>> +
>>> +		if (err == -ENODEV) {
>>> +			smmu->icc_path = NULL;
>>> +			return 0;
>>> +		}
>>> +		return dev_err_probe(smmu->dev, err,
>>> +				     "failed to get interconnect path\n");
>>> +	}
>>> +	return 0;
>>> +}
>>> +
>>> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
>>> +{
>>> +	if (smmu->icc_path)
>>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>>> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
>>> +}
>>> +
>>> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
>>> +{
>>> +	if (smmu->icc_path)
>>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>>> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
>>> +}
>>> +
>>>    static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
>>>    {
>>>    	/*
>>> @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>>    	if (err)
>>>    		return err;
>>> +	/*
>>> +	 * Acquire and vote the interconnect path before accessing any SMMU
>>> +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
>>> +	 */
>>> +	err = arm_smmu_icc_get(smmu);
>>> +	if (err) {
>>> +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
>>> +		return err;
>>> +	}
>>> +	arm_smmu_icc_enable(smmu);
>>> +
>>>    	err = arm_smmu_device_cfg_probe(smmu);
>>>    	if (err)
>>>    		return err;
>>> @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>>>    	if (pm_runtime_enabled(smmu->dev))
>>>    		pm_runtime_force_suspend(smmu->dev);
>>> -	else
>>> +	else {
>>>    		clk_bulk_disable(smmu->num_clks, smmu->clks);
>>> +		arm_smmu_icc_disable(smmu);
>>> +	}
>>>    	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>>>    }
>>> @@ -2294,9 +2342,13 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
>>>    	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>>    	int ret;
>>> +	arm_smmu_icc_enable(smmu);
>>> +
>>>    	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
>>> -	if (ret)
>>> +	if (ret) {
>>> +		arm_smmu_icc_disable(smmu);
>>>    		return ret;
>>> +	}
>>>    	arm_smmu_device_reset(smmu);
>>> @@ -2308,6 +2360,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>>>    	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>>    	clk_bulk_disable(smmu->num_clks, smmu->clks);
>>> +	arm_smmu_icc_disable(smmu);
>>>    	return 0;
>>>    }
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>> index 26d2e33cd328b8278888585fc07a31485d9397e2..c00606a416b2f4bb44a35e5d67f6ef801df68e1c 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>> @@ -15,6 +15,7 @@
>>>    #include <linux/bits.h>
>>>    #include <linux/clk.h>
>>>    #include <linux/device.h>
>>> +#include <linux/interconnect.h>
>>>    #include <linux/io-64-nonatomic-hi-lo.h>
>>>    #include <linux/io-pgtable.h>
>>>    #include <linux/iommu.h>
>>> @@ -335,6 +336,7 @@ struct arm_smmu_device {
>>>    	int				num_clks;
>>>    	unsigned int			*irqs;
>>>    	struct clk_bulk_data		*clks;
>>> +	struct icc_path			*icc_path;
>>>    	spinlock_t			global_sync_lock;
>>>
>>
>> Any feedback or concerns on the interconnect voting approach proposed here?
>>
>> This helps to address the kernel panic issue [1] reported for one of
>> Qualcomm platforms.
> 
> Please respond or tend the issues, pointed out by Sashiko.
> 

Sure, I have addressed and replied to the Sashiko warnings on v1,
I'll check on the fresh warnings on V2 along with your suggestions on 
this patch.
< I was wondering if it's needed to respond to Sashiko comments earlier 
or silently address the relevant ones,
so thanks for confirming this as well :) >

Thanks,
Bibek

>>
>> [1]: https://github.com/qualcomm-linux/kernel/issues/297
>>
>> Thanks,
>> Bibek
> 


