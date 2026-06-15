Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E553CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CeFE4vffm7VQHEzk2SuyKKfPfRD48OmgDxEnfneNJE=; b=UnxqdvCH/aNMBPAE5A5dFi/2Hp
	NC9nHG/2Ur82sjYWkm0C4TqiaSeIgKBa/7PM+h39HFxcg99FE0Fp60KwH9kaS0cXye7DQlhTSRW34
	f8bIbO76Bc7Md0qkoK0Z9U5xerMN5Evk96wJlcqSHr39q6lw+Od5FPuvrFgMPJLUm6+mOKj11wGRb
	Blr/PL/1kexdKMDtKWP4pVFJgo3PerwA/rozC+Wp8oMXVcdbdxGQnn/lYIAvdirBlFcixdoBNWh3G
	4nYih5QQF759KAgUDtMldUywYyJp9AXeH0oI3vDOwb55LctJQS9yNqGLa39bwpZALY1Hp7QN23VFw
	WTAPlfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7K9-0000000EIOw-05Yc;
	Mon, 15 Jun 2026 13:25:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7K5-0000000EIO9-1kzh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:25:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZvs4530134
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 13:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8CeFE4vffm7VQHEzk2SuyKKfPfRD48OmgDxEnfneNJE=; b=cBOata2ha3mzT2r4
	NpDWj8zrLNGSUg7IPgZNw0ZxMh6wdFvQ7Lpe2wW1dtVrVuOcnrGTF5DNORb2qj/j
	lhPgBcWvfKnVCNo09tuDB+QlOgNwJrQAAzAQGP+g2S/KIwJG0vrCDRdRterxoSce
	mu6gVgODNhntvCsNyxS7jFeGUw6Nw9UXl38pF5VViGcRYReqGyFK0eVvKw+NXluv
	Sl2VTpTp9xCRqpeWxRA+wz/w/6qg/RVbsihsQNPoCs00flPzB0mwsP/k4kTCV1Sl
	D6eV97jg4mA3A9eQGroeGpbgluG/ftmNzsq0XH0JusyxxIvLkAaj1P39+HjaJ5ns
	NHD68A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter20vrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 13:25:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2da7fa311so33909995ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781529951; x=1782134751; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CeFE4vffm7VQHEzk2SuyKKfPfRD48OmgDxEnfneNJE=;
        b=I/QWdS2SrCmx39rYbV17mbHGcXFkQO+isXpOMJ/15PbiPs2jwPQMtd290GMwliiPM8
         Jn7qi4qu2I9pAZiP5ZzORv/RYyyYRENfzzwX1hJBw199vwYk/xnXduYc6qegyyTYNP9g
         rc6PR3bHaIaKaWihfItmvrKXueBkW0s5lTuz54JpS9/0t2jbfsxRZk8r+IJdaAD42cXG
         4D30zdDXC3Ss1YfqjjZfZGO6PU3altjfTROVS3P/7vl8Rj2WGc/EgZxqDJtsb7LC70U1
         4fY3WwLSo/FIhpBAn7V5AeQ2dFsIF96fnp/jKL+RddwcgBUAcvZ3oKYiWn+jg4IkjA4/
         E6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781529951; x=1782134751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CeFE4vffm7VQHEzk2SuyKKfPfRD48OmgDxEnfneNJE=;
        b=CfA0FqsGg0gmAMNQNCNAdxKNGmzreI0iTu2PGM02k7JiphCixAH3o0s25SKQgU9tHa
         ZFCOVeLkTkD6Ed8Oo7p0lSiIkiUsV3hgpggugLQtui3d0toI4BA01edUqrPszyAlTqJb
         x+awH7xBuGeZlJYXvMeeENM4o8ntBrH3aaOAcbi/6iM1GyCYh6Vj0KNq1ZsjHeJ20SAM
         nyTrrXI1CBOAMuQzw4oR7h40dlcK2NLkVL4yh8wZiVSGIL3FuVc5k7/UcFTZKEmrBCpm
         Dzl/XT68uhNTO7FbiET+BDamDGmTgerl/pcPsUAOLOCe6wfD+GnVgxpAmtJM4hpBtZ6v
         9g8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/P2s0ND3S2hHfy5t5iiY79PwQJ9gay3+8aehfIN7YlJk3LTMdmKkGAZzqb90jowUdYuj/gDcu5AZpc8gIEYNd9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5iz7AdeEL73GeUnaCaAv9GqhG7C5getaEcTrMxj+O1UX13ILp
	37kzxWm4iwljDODLBbS7DvpfL+rJJ2fwmdItj8ciKJVgFahapjtxhqpWIB0bBw5vJuAQDzkEwyS
	HpVn5XvbRFk/ZJh40G0i37QB3suWmHm+4R8jjlEs82uMf+2ck4fSQu2tLOhk8RCvRAEqz1bCPjD
	kC/w==
X-Gm-Gg: Acq92OE1EUvJy9O7I9/dFUVniZKZMCxuRt71hJsTCE/R7ZpRCbEDCQAVWyvPcs/zxvG
	FjIKboulRgUZj5LysaymnjyDoJ4qawQVnGsQEy5IYqhbdCvCSQAFOV7aG7L51+LhAWHikU7Pxx3
	8vNSn2ZMcDa1f/ezz6dzUFMTZpsdfQ9Hdltgd1HmynKxUr1mySXhFSTJ78jKE0mpQF2ytwu/Yqy
	Ju/tYWWdij6oERgzONJx2JY22X1nJGAw3Hm+xVCxP4nRaGmbttLWgwJsOnARR3m+9SoUsXcTdhF
	c07sWKDzOsY2S9oQxE6rpjKBi1wlfuXKhE9FzLw1nw50/GkTQisg8eRCuB5Rdg4fi3hVEn6X/qP
	LlCya1MYMfTewKZIAyCiSzeioldejX64oXzMGKI5izgjT8d5pBQ==
X-Received: by 2002:a17:902:d4cf:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c4130100a2mr158666245ad.30.1781529951411;
        Mon, 15 Jun 2026 06:25:51 -0700 (PDT)
X-Received: by 2002:a17:902:d4cf:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c4130100a2mr158665745ad.30.1781529950823;
        Mon, 15 Jun 2026 06:25:50 -0700 (PDT)
Received: from [10.219.57.228] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c58c3sm104350545ad.23.2026.06.15.06.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 06:25:50 -0700 (PDT)
Message-ID: <8518a085-b8b7-4ee6-b08c-8dde3971a6f1@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:55:45 +0530
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE0MSBTYWx0ZWRfX57TtkjGnsshb
 v51HgipNUrAXyKK+wetsriElSYB/iQxUdOvwf7q8rlyMFMRdJ/hOaxFu9F3xejW6DTFhxebwIBw
 l+7VG80gnZ5jo3fjtVJHQoItOIw9fI8=
X-Proofpoint-GUID: OxTeksySzf79BigxMUkWR936W1FoBmx1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE0MSBTYWx0ZWRfX/ywO5/wgxT5e
 SDsvX9H0Ccy+lAEeSN9u9QLPmb2BZ0CaDU8cm+TjHGPjB2520dDdQJs5kEoLWLojDACNM4Jxbmx
 2nliQU/MseIA8T0y05DMaYQHYFrHGdFMTCnqdtzcVhd1M4tEyYyVDMNXSJMo0d0W5/GtYw8ltxS
 dSONEpp+72RXt0F2HOt07Ltz8FF5j4KiCSi6lfngI/Qd48d/f+oKSbgTaKBwXS0K8oybkpzhJl3
 RdKtpFqE3ZxGkLokoEhzCcry3l0HZsJtUAaTvyBC75AwxyOH0299pSotv3pdjOXeJks7DzA7dob
 LgVFDbyCkBuivWIiGIsUHqSXJhO+axryJ7z+f7xFbUPcxe2SyvEjVbX31OvGhf+IGXFbQu75fiH
 P7iiftGBkgj+CYwzGNN+M9YIXpul5BYx8J1laCaSbCq0rroFkxoWtv7Pgg99hlvPTxSZoeUZZEU
 9vyefhvChW8YdoZr5ZA==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a2ffd60 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=he2KC8_JSkmjwAK-aeQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: OxTeksySzf79BigxMUkWR936W1FoBmx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_062553_584749_E6535B72 
X-CRM114-Status: GOOD (  33.88  )
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

<Apologies, missed to respond to this query>
Yes for TCU, it needs to only have a vote on GEM_NOC interconnect
while accessing the DDR in downstream path (client->TCU->DDR), which we 
are addressing here.
Hence it's only one icc path in question here.

Thanks & regards,
Bibek

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
>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
> 
> WARN_ON_ONCE()?
> 
> Pass the error to the caller.
> 
> 
>> +}
>> +
>> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
>> +{
>> +	if (smmu->icc_path)
> 
> Drop the if.
> 
>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
> 
> Pass the error to the caller.
> 
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
>> +	}
>>   
>>   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>>   }
> 


