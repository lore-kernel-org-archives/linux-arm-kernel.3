Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6CFCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvxVu7ZMj0GrNYVnvEx5o+aB0JEz3pjwUB8+jM1GNAE=; b=yQWRjnEtfrT7ILpW+q+NW2VQLS
	E0Vir6QJPKXuE2BpDX0ek2qH4nRAT0EFILrE7CGgBC0kyLFNavUMlrWOj1J5OnN3E+vf2/bjwTpnH
	/VRTZmzAHNE357OJp2dNfxgW4+reY0e6z5s8o5CeecMpN11eldh0w1x8ko+4iphjf8/hiSbljZhub
	1Aui/wyQKEOpXoFfEy7NR+8zEe2aYxXSeXvWdDhYXEdAKs4KKPRbuWvnx0JEj9fCmaTnY5zZvY/gE
	3wzc3Rl6/goY2TgiLMCTGTlIhZu9sfENbCaXpcZ8utE9gKKScdCUKMLYc1ffQBlOpIYY9s9azAgoI
	mswAvWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ72C-0000000EGGC-2anE;
	Mon, 15 Jun 2026 13:07:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ72A-0000000EGFf-1nbP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:07:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCauD5366569
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 13:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvxVu7ZMj0GrNYVnvEx5o+aB0JEz3pjwUB8+jM1GNAE=; b=k2NnFh8OTE87IxoX
	b/yqlUzI6TGw5uqop0QKf2e8vEKKI3wI9Zf4QbFK6n4wJgBORCv0KyBBZ4kU1GVT
	sj++RiR35ktuXs4SxZ4JGm4gXyGXFn0kZqL7F6wd34eaznVEwTfp5Tcim/UAKlMf
	xth0XqvsvdYNODjm6FgT5cIHw3naQ6IBgZdoE+KMlPvOr2zcP7dAyMsWURP4uArf
	y03G5nwbEuoi0hWdojyAA9buhKBcqPmKwA1stx3KMUwH4pcGleWeCfZMXJLdaLPD
	vnFYhroCkcRegNCDnvd9LJ1eX1BrDYVMoSEVAz1zu5b5s8JJlifQgpldjI0wqGZ2
	cLli9w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx0rg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 13:07:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842208d5b0eso2696886b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 06:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781528838; x=1782133638; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvxVu7ZMj0GrNYVnvEx5o+aB0JEz3pjwUB8+jM1GNAE=;
        b=DhT7CbQ0lW3hI5pH8PqxB2OR+mDR0b6rSbXdwteFZetwLwTGdvPStAlR6HPWlZXKji
         rZTcbU5JWGjWtDzfaIsp/yN1Ey2S1i7kkh/38zB5/f6COy3oE0gAvQ32EEXvsxgfPqVh
         UCZ7mNZMZjA4xyzvdKdeSabQu2d0DjFY5tL3Yy6thpT2T7oPCPZX7moIK9FsVcUpSXnV
         Qs2QhgoVaWpQGAQC1hl0QpRSakTFwff09WMxc8wwQWahsRNNRYQpdVJUC7mM9+0nXS/O
         t4eEVfG0Ik6BXAUxBJa+UURPlH5p81aBZTID5OmbGA3DJezeEMasPBat7mAZDViZEHQ2
         BIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528838; x=1782133638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvxVu7ZMj0GrNYVnvEx5o+aB0JEz3pjwUB8+jM1GNAE=;
        b=IqZcmhYEuiSy7lmuRyR6rj+JZiIfqYO23zSgFM/qqWrW/3Wzb7TjrHk+gOlBYJpmIS
         W0eVH1lrcBIayQXvUDiwym+TBs6IK5mxxNPaYocOIuuNBwPREX4TL3SHFsv4s3MqkS87
         fnpfCJA/daZ2+Hq981UIIbmtDzlKKckOyl5jKObYeGZrT+kIzq0gGKqovQ1++tM/MF00
         nxZ7ZemgfFsj5PQX98S+IW0HyFfgAFinvZSDoFThQjGLL2NvQnNGxSI26uOU5PL+pqGc
         m5WFphRmiBv3CiAsjDaILR/4d59CRTuaYuQa5v6oKpqOoMCuqzB7reaOqTIRNEJ+mHBC
         wQfA==
X-Forwarded-Encrypted: i=1; AFNElJ+s840GKC82nHaotR+KqtGFKnUMsFsiVFH42gRkU726OkOY+OPgp8NSS1DCAZfciO3gBIyjp3rDrJR/R/dMkNQE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz19qIUAtIkh8D4kpsCmtQfB/kKz/O2TH6Zs9WR5n4M9TiO0jkh
	ulZElgKi2UrA+fToBdzSenY3UClaHr+c4qFi+/Hzj1fCGVCK0wQt/MbB9dfRbudZRshBRkad0Mt
	8/cq8Nd2vVmDZcDOLbX9e+P+8uAio2d17DIu0ikhUiOQK8FXJErE2+231IM8FaKwG9+Pp9h8CZv
	9JOA==
X-Gm-Gg: Acq92OGFCvRUG92/WhpW/tPMX0vz8vrjL0yzu48fGRs+cvibdaZRkfLiAH9irzgnUnA
	65qfWOYfeNf3Yg0PWrrNo/v7dT8+WiFb7zAvJ9S7fFXAjFmVIXsJdL3PJ52r7ExU0tkq7k+rzsX
	jE8rSkfs7vjwYtCjcRWq9+rllYv8kBP/NSFMWar54qETRc+pW/Op/3vOeolDOP7k8KAI4owrL0Y
	tcZJ/7vjAckwWObP5iBgy0VjmnuqTdYvxwUydMBS4y/jagqTWO4pWLILEBUPSO633ZwOROCzraf
	S5ni0StfthaDI8eAQu9iJLZvH/WwE0QCVGom2TYZ2/FuSZeONl9eimXTsEWeuw0sPKkS/phPWEY
	Kob7xrp/FMVJycmQISX7iyw8LcFNcd7iA5YpotAfFTSDkxalvwQ==
X-Received: by 2002:a05:6a00:4fc7:b0:842:54c1:8e15 with SMTP id d2e1a72fcca58-8434ce42058mr15689258b3a.29.1781528837804;
        Mon, 15 Jun 2026 06:07:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fc7:b0:842:54c1:8e15 with SMTP id d2e1a72fcca58-8434ce42058mr15689210b3a.29.1781528837300;
        Mon, 15 Jun 2026 06:07:17 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b04808dsm10116612b3a.52.2026.06.15.06.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 06:07:16 -0700 (PDT)
Message-ID: <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:36:51 +0530
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
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r_zSQXrrm-1sntzBWbO5r0UFJEDQovhH
X-Proofpoint-GUID: r_zSQXrrm-1sntzBWbO5r0UFJEDQovhH
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a2ff906 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fh4Lr3tRg7ETXUjdBf0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzOCBTYWx0ZWRfX38aIXjWfXs4L
 GKK19CqlfWbUxtnrBPoRgteRPwXx5Icnhav0cQ6C2lcaHC+aCWu5rn2HJBzHn+Hcut0Ja1f/XmB
 wkarud2eJbmi1fxtcJYzxo3cHCTHv6g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzOCBTYWx0ZWRfX8GCbnr2GDNP5
 KGy2shV1EriaWCBbZCylrmOyi+qzTy7Bn2md0oLL3oQAQcC/2DP6oIjNDFlyHVLP8nJsz88Muyd
 OSeIdg7qDX6fVIjirR+3qnjSFgIfljbDtk/omljzx0Obbcg9GvUnu0kcS3/Epx4a6stDjbUbw2j
 atCfP/228tavUIr11rlJ7mQgSiH66DmvAshgTB5MXgzXIT2rFWTefvG4vNwqiVecDpHjBozHkY3
 s3OhyIc7cl4JGC28Y6gxmJAT/Cx3n2oti34c+UKIGWxsQUhk7Ql2Rx/krvF57DdeUy9Ik4wo6qj
 B/vJdOkIcwYgdnUNMokrwIazcyrFBradI2Yvw9j2sMo9qO8zjvgykNw7JcmzbE/GgHbjz22D/xH
 IfrlUWg9lUVXMMBPehLdzs6DMaGBodYakrgSiITwvKkQT37WOtts77Rax9ZFIhR9IR5IZ3lXF0I
 TsOg5Jit2uQhOnvjThQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_060722_592508_89D68635 
X-CRM114-Status: GOOD (  37.10  )
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



On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>> On some SoCs the SMMU registers require an active interconnect
>> bandwidth vote to be accessible. While other clients typically
>> satisfy this requirement implicitly, certain corner cases (e.g.
>> during sleep/wakeup transitions) can leave the SMMU without a
>> vote, causing intermittent register access failures.
>>
>> Add support for an optional interconnect path to the arm-smmu
>> driver and vote for bandwidth while the SMMU is active. The path
>> is acquired from DT if present and ignored otherwise.
>>
>> The bandwidth vote is enabled before accessing SMMU registers
>> during probe and runtime resume, and released during runtime
>> suspend and on error paths.
>>
>> Generally, from an architectural perspective, GEM_NOC and DDR are
>> expected to have an active vote whenever the adreno_smmu block is
>> powered on. In most common use cases, this requirement is implicitly
>> satisfied because other GPU-related clients (for example, the GMU
>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>
>> However, there are certain corner cases, such as during sleep/wakeup
>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>> is powered down. If adreno_smmu is then accessed while the interconnect
>> vote is missing, it can lead to the observed failures. Because of the
>> precise ordering involved, this scenario is difficult to reproduce
>> consistently.
>> (also GDSC is involved in adreno usecases can have an independent vote)
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>   2 files changed, 57 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -53,6 +53,11 @@
>>   #define MSI_IOVA_BASE			0x8000000
>>   #define MSI_IOVA_LENGTH			0x100000
>>   
>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>> +#define ARM_SMMU_ICC_AVG_BW		0
>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> 
> totally random numbers, which might be different for non-Qualcomm platform.
> 

Ideally, any non-zero value would be enough to keep the path active.
Here 1 Would be enough to keep the path active, but might be too small 
to reliably keep the bus active.
Other is UINT_MAX, which will reliably keep the bus active but might 
cause a power penalty.

#define ARM_SMMU_ICC_PEAK_BW_HIGH	UINT_MAX

seems to be suitable here to reliably keep the bus active by BCM
for both Qualcomm and non-Qualcomm platforms (with some power penalty).

LMK, if you feel otherwise.


>> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
>> +
>>   static int force_stage;
>>   module_param(force_stage, int, S_IRUGO);
>>   MODULE_PARM_DESC(force_stage,
>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>>   	}
>>   }
>>   
>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>> +{
>> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> 
> Is there always only one bus / path in question?
> 
>> +	if (IS_ERR(smmu->icc_path)) {
> 
> if (!IS_ERR(smmu->icc_path))
> 	return 0;
> 
> int err = PTR_ERR();
> if (err == -ENODEV) {
> 	icc_path = NULL;
> 	return 0;
> }
> 
> return dev_err_probe();
> 
> 
>> +		int err = PTR_ERR(smmu->icc_path);
>> +
>> +		if (err == -ENODEV) {
>> +			smmu->icc_path = NULL;
>> +			return 0;
>> +		}
>> +		return dev_err_probe(smmu->dev, err,
>> +				     "failed to get interconnect path\n");
>> +	}
>> +	return 0;
>> +}
>> +
>> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
>> +{
>> +	if (smmu->icc_path)
> 
> Drop the if.
> 

Ack, will address it in next revision

>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
> 
> WARN_ON_ONCE()?
> 
> Pass the error to the caller.
> 
> 

Ack, would be better to pass. Thanks for pointing this.

>> +}
>> +
>> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
>> +{
>> +	if (smmu->icc_path)
> 
> Drop the if.
> 

Ack.

>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
> 
> Pass the error to the caller.
> 

Ack.

>> +}
>> +
>>   static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
>>   {
>>   	/*
>> @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	if (err)
>>   		return err;
>>   
>> +	/*
>> +	 * Acquire and vote the interconnect path before accessing any SMMU
>> +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
>> +	 */
>> +	err = arm_smmu_icc_get(smmu);
>> +	if (err) {
>> +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
>> +		return err;
>> +	}
>> +	arm_smmu_icc_enable(smmu);
> 
> Handle the error.
> 

Ack, will address this in next revision. to disable the clocks here as well.

+       err = arm_smmu_icc_enable(smmu);
+       if (err) {
+               clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
+               return err;
+       }

>> +
>>   	err = arm_smmu_device_cfg_probe(smmu);
>>   	if (err)
>>   		return err;
>> @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>>   
>>   	if (pm_runtime_enabled(smmu->dev))
>>   		pm_runtime_force_suspend(smmu->dev);
>> -	else
>> +	else {
>>   		clk_bulk_disable(smmu->num_clks, smmu->clks);
>> +		arm_smmu_icc_disable(smmu);
> 
> Handle the error.
> 
> etc.
> 

Ack, will address the if(), and error handling suggestion in next iteration.

Thanks & regards,
Bibek

>> +	}
>>   
>>   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>>   }
> 


