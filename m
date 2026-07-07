Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE382C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 12:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsF8+lnCV59+0yqeWXdSHV6D3xLFbynXeMN7huNriQ0=; b=s1RE5NtomFrQYfEkopVp5X58kz
	+u1oDEWDSVmiE1/JSZSyDg6xh7vO8mm5Y4lTysc2NbSlwqGrBHcQ6yx6qFr7mHDkJ6o8czZs8Sqi3
	I0aUccAZltYUALGpkMEGjgKY/SqFbB4izVKg5lHZFELtshz43XJMrFhijb+ewNuFPhGPHT5sqtUvf
	dZdS/vsIUT0SuEv6twuJUUC3FS7bJ2G82kGorvtA6AX83k0ZqvtVV/ZFX72tyNx5uSg8yzt7+qJbg
	xzukd319F+3cxsaNeWuqJUmvMBjhVfF/HFHejah/YZhph+p0aw+MeRpV3av3Q0NCnB2XU7nKnhkUY
	BQvmzI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh59d-0000000Eyux-2mCM;
	Tue, 07 Jul 2026 12:44:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh59b-0000000Eyt1-0byu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 12:44:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8kSY3606205
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 12:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsF8+lnCV59+0yqeWXdSHV6D3xLFbynXeMN7huNriQ0=; b=XD7NvtCvt+ciicLc
	SFxlsBX3lxxlCeJzhe7+FCQ7sllI9nmp83Wp7Q5Sdw/jmrb5rQBlLklY94ke8uxl
	K6pKpodACkGCwZANRoY/ahbVze0XEd0WNFcHhLwgU45NyWXU71Lmy0HjRcqBT1/2
	3Us/ZWIr7YBgPOnRx+bZ6X4v/YQLBykVEJDkInXoliJRFKkAS5aeKDAGa9+eRVFX
	Pmfneoxro2uCyK3yJpFMhoyo8ImDUV4ajCP+8UxV1LpodyHlMaOY+ojAQ8Y6Gkz+
	jxvu/VCOpPonyiTABDAOLAeapPcB7X82j1ji7/KjywSz0hc9DpPkkJ65jwHRwfOp
	nEXIpg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8j0nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 12:43:58 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9e0e71e05so6358082a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 05:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783428238; x=1784033038; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jsF8+lnCV59+0yqeWXdSHV6D3xLFbynXeMN7huNriQ0=;
        b=Exy5MzfWtIAa8mj6epOosokNxIoTdtD2RbRCS/DLVyQXTo50w0PlpM/MnLEkkUd/sZ
         bb2W0kztO5EsRksqTR2z6Jxm0Rj8uYU6gnpknIcQVyvKkh2tHr9bgu7/FY/Kcse7hoyy
         4aN+hgymocL9uVkPgPfRJkQyN6xwPmM0sGjTiIM5SsXrSgiiWL9rSGoHQ2gT3DfK3tnh
         +JSWaDBY855ItbDZ5QYYNgrdMVfa5RpNVHi+fQh0HWWkBDh+bX0I8LZHkl215FyWVBni
         tMvw33rFMPa3gzmrsM3ElyXuRTjX8/REvuPduExwI2iJ/p3tO1PquiGZFpu7n3AmXh19
         EpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783428238; x=1784033038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsF8+lnCV59+0yqeWXdSHV6D3xLFbynXeMN7huNriQ0=;
        b=bUf9eGRntOZQZbYlLBiUCSMc7ixcXyT0coakDx4DM2PNJIO6tKsUGUV0y7Z1Jl87eI
         nw3Xf1JzrijV2sWpLBmBH9L4LlCIpvfdM7wXSxB9xCASD9lUJsBl7cc5JCTJrWlrIgq5
         Ic9cWtRHKE1x7RCEVt5P3G5SLQleZ6lwoSkS1/IUuBQKVjJM2fzp318EpflRMQS8cE7T
         NcFqMdyRgQUQxPS5eX02awtQL6Q5F2CjryPGTBrQjUrfSlf3JWLCmkb1o1ZrT30n4Kb0
         JMEhck3ZSwzeQPQVCsw7b0flDuX4GBLE0lI4RXGXZM8MXQtwBtGV1Gr4l8/rA47Uun4B
         Kzrw==
X-Forwarded-Encrypted: i=1; AFNElJ9ROYK1EzHCbtWFqClLAyHPM7AG4MsV0+a5tLWE4vyCjEuAn3QPF9CjUnFXcOA2OgDgB0gNwFYitTnUJB0iIOBV@lists.infradead.org
X-Gm-Message-State: AOJu0YykRRAWQQYxCP+A6KpVxLz5FRfkzSkYXOG6pTQWKNgCJUAM+W7c
	Y70DrutzbbjWDdrubyjpCqG/ZBLK1sqt/+lXC5sQWoCZLzrOW5NEvFauMkJWsXRBmzF6y1/EuOM
	3rp5TjLExH0ncJb0bc+jfzWwTz7pZcEiWqtIXykMl4Sl05LOUTLkQrYRqcmUblPOb3Rf40eJAsP
	o83Q==
X-Gm-Gg: AfdE7ckWLKhMN/7nJPNoiyh8NVAm2i7O6Bvcrs+SlKHFE6TSJQlHVywJM4CcVasONzC
	oWL85PbLBo9jFZICNQ7lV25kaPlgIOOxP4ysxA+LbmJ3ff8uzkPzWvHF3PQXBgIrUSzpZBvEqTs
	iTl3PrWkA4yCT+J7mzqtPSKQr5eOpmKhyiAP3cBp97yx+X0hBRvvs2x5fNs2tPwPUOuG7RfRcyx
	IDJ+HjE+0yYFrx3bsd4Wo7OCJIqIkuWLEktxiS7GGUZsRMz71LFgFoWLkNSjA1VIA2Usmf7ln5G
	fRKEu5Qmihei7q3PHSCMexieMiViDqIkf3myqQI+h3E0QKzLsz+RZu1E82k1qbULZRRUPRk/xDI
	Ix4JkerHwGL/u+hI9luedSgkNrMtmIMCuN6WwYeg=
X-Received: by 2002:a05:6820:f004:b0:6a0:f3b5:12a2 with SMTP id 006d021491bc7-6a3553978e6mr3648874eaf.20.1783428237544;
        Tue, 07 Jul 2026 05:43:57 -0700 (PDT)
X-Received: by 2002:a05:6820:f004:b0:6a0:f3b5:12a2 with SMTP id 006d021491bc7-6a3553978e6mr3648859eaf.20.1783428237043;
        Tue, 07 Jul 2026 05:43:57 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a31fd2cf7asm8442320eaf.4.2026.07.07.05.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:43:56 -0700 (PDT)
Message-ID: <8fcdb7be-0bb4-4cf5-b969-6e5b0b516f87@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:13:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-2-afdca0125a65@oss.qualcomm.com>
 <lltyynsswbeqdgpl4bqbil5ohgs6v25pvd5cqfuh36nrzgwv7o@u54exappwjes>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <lltyynsswbeqdgpl4bqbil5ohgs6v25pvd5cqfuh36nrzgwv7o@u54exappwjes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfXwAj56RSyUDRO
 YbLJnw1zKc5C8hq8kLUSsHLsnfWlKtGIne3LbOyrUkog7VjQhKnkUN9tilbH9kPL9qi69Q71Czw
 tmX1e8KXRaOx+IiIWkrcolDpymJKXvBfCCtH0Df5GZF9hQzlom0z5Eq5XFvkCG8lyxpKI1lZVrx
 Y4aVCK9P4X9+yrb4TUOYGESrEGBPoqvkdGLa7srC2mNQGLGyYoYSt4sIO+J+xf4HMDLV8n3Mqlb
 yMcqa6xVtQi7+q5R4aM2Pd5AhyGSM+t77woCrq22u75qCdhApuJJNCaP6kGzdZLV/6KNEdyODnr
 eDKiZKg9vBtm/bKS1usyrKyE/jlBIGcvBDk1nGr42hl9MbeLM3FYZ1LCiE6sYCJQPbujsyauIoj
 m/Cn6mdSBCmxmOY2dbxi6jkKNcDNIOAyPGDS6by0htTSs6FL+uY8DvKL0urggh3eXbtA5w8J8Te
 IYcKbbS2v/w14J29cMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX8yw9VDF1Cud9
 B7gUiRFyPWntrsUGA54xfAwPLhXvkDghxpBM0ibCC9ir6El1wyMCrJ4bYDxQaeF0ISrhXamrjTn
 dH95LBj5pBty9b4XlEiYK6qLh+/4qVg=
X-Proofpoint-GUID: xPosJTxBuZ0oL-H27HJGfeQdi0jvaO2M
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cf48e cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RRvI01qy6g1rNRViaBEA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: xPosJTxBuZ0oL-H27HJGfeQdi0jvaO2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_054359_412338_E79A7C99 
X-CRM114-Status: GOOD (  32.38  )
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



On 7/6/2026 11:10 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 10:26:35PM +0530, Bibek Kumar Patro wrote:
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
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 55 +++++++++++++++++++++++++++++-
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  3 ++
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c      | 27 +++++++++++++--
>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>   4 files changed, 84 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index e2c914fccd6f..5133d3ab023a 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/acpi.h>
>>   #include <linux/adreno-smmu-priv.h>
>>   #include <linux/delay.h>
>> +#include <linux/interconnect.h>
>>   #include <linux/of_device.h>
>>   #include <linux/firmware/qcom/qcom_scm.h>
>>   #include <linux/platform_device.h>
>> @@ -607,6 +608,45 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>>   	return ret;
>>   }
>>   
>> +static int qcom_adreno_smmu_icc_init(struct arm_smmu_device *smmu)
>> +{
>> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
>> +	int err;
>> +
>> +	qsmmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
>> +	if (!IS_ERR(qsmmu->icc_path))
>> +		return 0;
>> +
>> +	err = PTR_ERR(qsmmu->icc_path);
>> +
>> +	if (err == -ENODEV) {
>> +		qsmmu->icc_path = NULL;
>> +		return 0;
>> +	}
>> +	return dev_err_probe(smmu->dev, err,
>> +			     "failed to get interconnect path\n");
>> +}
>> +
>> +static int qcom_adreno_smmu_runtime_resume(struct arm_smmu_device *smmu)
>> +{
>> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
>> +	int ret;
>> +
>> +	ret = icc_set_bw(qsmmu->icc_path, 0, 1);
>> +	WARN_ON_ONCE(ret);
>> +	return ret;
>> +}
>> +
>> +static int qcom_adreno_smmu_runtime_suspend(struct arm_smmu_device *smmu)
>> +{
>> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
>> +	int ret;
>> +
>> +	ret = icc_set_bw(qsmmu->icc_path, 0, 0);
>> +	WARN_ON_ONCE(ret);
>> +	return ret;
>> +}
>> +
>>   static const struct arm_smmu_impl qcom_smmu_v2_impl = {
>>   	.init_context = qcom_smmu_init_context,
>>   	.cfg_probe = qcom_smmu_cfg_probe,
>> @@ -648,6 +688,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
>>   	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>>   	.write_sctlr = qcom_adreno_smmu_write_sctlr,
>>   	.tlb_sync = qcom_smmu_tlb_sync,
>> +	.runtime_resume = qcom_adreno_smmu_runtime_resume,
>> +	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
>>   	.context_fault_needs_threaded_irq = true,
>>   };
>>   
>> @@ -658,6 +700,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
>>   	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>>   	.write_sctlr = qcom_adreno_smmu_write_sctlr,
>>   	.tlb_sync = qcom_smmu_tlb_sync,
>> +	.runtime_resume = qcom_adreno_smmu_runtime_resume,
>> +	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
>>   	.context_fault_needs_threaded_irq = true,
>>   };
>>   
>> @@ -667,11 +711,14 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>>   	const struct device_node *np = smmu->dev->of_node;
>>   	const struct arm_smmu_impl *impl;
>>   	struct qcom_smmu *qsmmu;
>> +	bool is_adreno_smmu;
>> +	int ret;
>>   
>>   	if (!data)
>>   		return ERR_PTR(-EINVAL);
>>   
>> -	if (np && of_device_is_compatible(np, "qcom,adreno-smmu"))
>> +	is_adreno_smmu = np && of_device_is_compatible(np, "qcom,adreno-smmu");
>> +	if (is_adreno_smmu)
>>   		impl = data->adreno_impl;
>>   	else
>>   		impl = data->impl;
>> @@ -691,6 +738,12 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>>   	qsmmu->smmu.impl = impl;
>>   	qsmmu->data = data;
>>   
>> +	if (is_adreno_smmu) {
>> +		ret = qcom_adreno_smmu_icc_init(&qsmmu->smmu);
>> +		if (ret)
>> +			return ERR_PTR(ret);
>> +	}
> 
> Move this to a runtime hook to be declared in *data.
> 

Ack, will implement this in next revision.
<Missed to make this a runtime hook as it was not being used
anywhere else outside the current scope of this file.>

>> +
>>   	return &qsmmu->smmu;
>>   }
>>   
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> index 8addd453f5f1..6835b40339ce 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
>> @@ -6,12 +6,15 @@
>>   #ifndef _ARM_SMMU_QCOM_H
>>   #define _ARM_SMMU_QCOM_H
>>   
>> +#include <linux/interconnect.h>
> 
> Not necessary here. Just forward-declare the struct.
> 

Ack, will take care of this in next revision.

Thanks & regards,
Bibek

>> +
>>   struct qcom_smmu {
>>   	struct arm_smmu_device smmu;
>>   	const struct qcom_smmu_match_data *data;
>>   	bool bypass_quirk;
>>   	u8 bypass_cbndx;
>>   	u32 stall_enabled;
>> +	struct icc_path *icc_path;
>>   };
>>   
>>   enum qcom_smmu_impl_reg_offset {
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 0bd21d206eb3..a27804e15738 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -2189,6 +2189,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	if (err)
>>   		return err;
>>   
>> +	if (smmu->impl && smmu->impl->runtime_resume) {
>> +		err = smmu->impl->runtime_resume(smmu);
>> +		if (err) {
>> +			clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
>> +			return err;
>> +		}
>> +	}
>> +
>>   	err = arm_smmu_device_cfg_probe(smmu);
>>   	if (err)
>>   		return err;
>> @@ -2273,8 +2281,11 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>>   
>>   	if (pm_runtime_enabled(smmu->dev))
>>   		pm_runtime_force_suspend(smmu->dev);
>> -	else
>> +	else {
>>   		clk_bulk_disable(smmu->num_clks, smmu->clks);
>> +		if (smmu->impl && smmu->impl->runtime_suspend)
>> +			smmu->impl->runtime_suspend(smmu);
>> +	}
>>   
>>   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>>   }
>> @@ -2294,9 +2305,18 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
>>   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>   	int ret;
>>   
>> +	if (smmu->impl && smmu->impl->runtime_resume) {
>> +		ret = smmu->impl->runtime_resume(smmu);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
>> -	if (ret)
>> +	if (ret) {
>> +		if (smmu->impl && smmu->impl->runtime_suspend)
>> +			smmu->impl->runtime_suspend(smmu);
>>   		return ret;
>> +	}
>>   
>>   	arm_smmu_device_reset(smmu);
>>   
>> @@ -2309,6 +2329,9 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>>   
>>   	clk_bulk_disable(smmu->num_clks, smmu->clks);
>>   
>> +	if (smmu->impl && smmu->impl->runtime_suspend)
>> +		return smmu->impl->runtime_suspend(smmu);
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> index 26d2e33cd328..ed08f86cf99d 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> @@ -455,6 +455,8 @@ struct arm_smmu_impl {
>>   	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
>>   	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
>>   	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
>> +	int (*runtime_resume)(struct arm_smmu_device *smmu);
>> +	int (*runtime_suspend)(struct arm_smmu_device *smmu);
>>   };
>>   
>>   #define INVALID_SMENDX			-1
>>
>> -- 
>> 2.34.1
>>
> 


