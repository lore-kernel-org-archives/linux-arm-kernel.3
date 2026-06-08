Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A679CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMpY65sj+dUK6nSVVEKFgaghqYR4p2ChoNTezZ6kJC8=; b=hZJ09Kqrl6Kem0LU/rE4mE+2qF
	WLX7lyIUUKOgjnNGxa2t0r0q6/UKOTFs88aETBsyqdMGR58LBNE62LSyTcKOc3+UYwN//tbvyHQj4
	qRrJ97S83oeA277p5QhuZRIYbPQYMux1zy7UfVlXdDHdSNvwISnHDdkzAiNDxGmaiMZ22CK2ahT3M
	J32DVqEde8Sw2McAFozrKWSVfT11+nX95dzD89M7KJWIYUeiya7ceAC8figSdQ9ksOxVClh8aKwC0
	9jr0Dvln1zLXeGw6SZWA9+fIX4Bq/PhtC+WQBa+cudt2xzHWoRdO0eDYcWGLSxAb8v63MYmjkyJ6R
	txOyvlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWa3Z-00000003dN8-0LhW;
	Mon, 08 Jun 2026 13:30:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWa3W-00000003dMc-305n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:30:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR8SE3721119
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 13:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMpY65sj+dUK6nSVVEKFgaghqYR4p2ChoNTezZ6kJC8=; b=Tu0SSTOgpab62mLt
	zXHYwS1KMRhkkQcivFAU7zeMEHWG8wEN3pnTkOZf5NOf9a/nZr0jw+0+zS3g3xYR
	B7CQK9r92546i2qalbMEZpXS9V/qvPIgWBpHQdH2FYiga0tmQUnarEjiLj2y7o/e
	le4RQiwFKmZ0Kv0W8V7vJH5lZHrNK4eIi3l9P8qBWgNywdOenY6n5KluNyn5L3im
	1d8/6oPW5SM+mAuIePMOB3wmK/FsmgNKdOydY0OSqtw4Ldpv+X7KmpJs3f6F/4zz
	6k4op9tSj/HEGycK98Y0DZ3Z4ozx/+g17T5gMgJIV5xeT52SMCsCaK/QPGygzzVu
	n9T5qA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptgwdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:30:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so3774218a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780925416; x=1781530216; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMpY65sj+dUK6nSVVEKFgaghqYR4p2ChoNTezZ6kJC8=;
        b=EkA4yhNhtv7JIEOurh4REQwdOGXAUaNo3iVPEtrBIoxTb4HdqzoJlI6fFo4VfIMHcI
         cgj9MDmdPHyFkBAFr+SlLRAQyWH0wKu+4Ezg0ymwudVxYKvFO4RmyiqPOyhXP9O53BOn
         F6iFtEqQRG3qzC0IS+hwtD/wjMmEurElFpASCmfAhmazkcr/cmv6taDgVNslfPbtX2T0
         ytisDWF7OxAdSHBoGwLu+dy0RXT3A7vVJUVqGjrEMkHlOsTWeeZnLUMYA0x9Xmp2/76G
         Mw7eyMR8x2vkEOhVfwemNb+Qj2Eeywg0spMtjsBVQXBzT1h/dY7GiYyd4KfOF59qF0Lz
         ySMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925416; x=1781530216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMpY65sj+dUK6nSVVEKFgaghqYR4p2ChoNTezZ6kJC8=;
        b=Ce8iNOgTEvnd37XXr+ODYx4V8D7SM3El3QlstDR1A5hJPE3H0MpRy5H+ISUuLr1vNJ
         Pk3BTd/PQdeuwQ8l2ZRdJ0Cui2FFLg9FlU+OJ26n2N1N0MoWN0d1gXHtx3kdoAajaArN
         D12hQsfzI0FjvEACklAvjO7b9VyqcQr4lr2u42oTpfqgS8fdFCz2XoDLF2/P/k0SyguR
         9xRS1xMx4neyVqzOjb5LovN3wc/4e5WnShUfXGc/KOKJjDAwvQtp/Vr53NtPpnqhG36t
         9sTsYqUhMhgzciZB1LJNt8KHCORD1INXvOQYQH4cDHrQbINsEgG7EMPojedb0lVMD7sx
         GF/A==
X-Gm-Message-State: AOJu0YxQNawo0FkslKL2A6jKM3OheeTpBsV+W8mqKDV1FOCgqxUl2Crz
	GIXOCOc6Z8CB7eBXYtJybNIk5kYnWESBpBFJZY324e4hMEn9ygBGCov5mWJtgye+9Vy7nKjltCw
	SkwtEdFVXgzg42jiLrUY5SuH9UR9yJ94JLPSznTEHkPNpkE4PdAc8KTePnJ44CnPIFtYMouNqyf
	DkbA==
X-Gm-Gg: Acq92OFyr+wDs9uUKgjvubvFqymqJWF0kEPNQNlFMlTML/ZcdaDElFmVCXBNYMqUL1L
	HhWzNjxCklgb3rljqFF4zTpkH8qBKKL6voXvUisYdVoC+dufWYWus87lrWlbwEEq2/0L/2awXZN
	pDrgmnZgZvMIkEWylvrKdtx/hh1rtkogkL3Av6XQ1NVTU2h5iViycfYExdnSyOHP4CxyXx8WRMu
	YqWZRnm4yFn4f72hO10Yj14NreXINQ52QTGHN5FzFWmD8tsy+xsbE7JiE5hul0RBfD2P+Tbg/Oz
	K4cNTQ/tqlw2DW0s/nfxwYZdgxSU5sMbu7UKKkuOuM2DCjV2sd01OKfozYUvGGtTBj8sAU0Ha4Z
	ZVDsurg/054QVv5J1RgmKM1CApTarvodD6mcnl8K5MZFKz3XZpAUPmSEdil9D
X-Received: by 2002:a17:90b:5747:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-370eee03facmr15489647a91.8.1780925415619;
        Mon, 08 Jun 2026 06:30:15 -0700 (PDT)
X-Received: by 2002:a17:90b:5747:b0:36b:9798:4f67 with SMTP id 98e67ed59e1d1-370eee03facmr15489584a91.8.1780925414897;
        Mon, 08 Jun 2026 06:30:14 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf8284dsm19173198a91.4.2026.06.08.06.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 06:30:14 -0700 (PDT)
Message-ID: <68aa9591-49e0-4cb7-9a5b-36405efe7094@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 18:59:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8nc1KMvZGUjvU_4Wb-PIlTcXMR9rMgZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNyBTYWx0ZWRfXx5gA5qz3sS/e
 1CUXbGdokuhuMUaooxHlIRpMC6Yp+W+sNY++UlM3kHGzBpHOT6HbZgVQPBBTLd1rOpbFpJcSBV8
 fXPALWOVDZlOtxYNTETe5V4ONSqpuYav9HcMaufPgbtViqc+qicCIoHCrzf8IvNgHs43WB7QH/t
 QFk+Gh04u1ZaHlMAf1GgGidER0EraRUigeWgrak5JfRkxqpdHKG6YSTEgqe9LEnrtatsgmMadBR
 kDNf0JuhywmbF1H1X4kdSpgi+r8A2y17pS9IhdeowFIZ3gSG0SR6b5ftGf025KoUmYgFITES9qf
 J6SD1HRG8rS/nHZApp7PfU8QgSSJehlomZJEIVFdlN0BkZvMOUMd1b2ji/SyoLqxhTV/wR4J7MO
 FTIRkhZftONhFgGZYIQco+r2DLb8XTmPaGi2ObbKqJWvaW4btEIP0+d/P11wZT0ZJ/K3OrDV5GD
 EZvj0ccN+/gqWtFbGxQ==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a26c3e8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=vPN-sUkGHC-xCyVeAx8A:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 8nc1KMvZGUjvU_4Wb-PIlTcXMR9rMgZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_063018_882542_3F26CB86 
X-CRM114-Status: GOOD (  26.88  )
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


...

> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>   2 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -53,6 +53,11 @@
>   #define MSI_IOVA_BASE			0x8000000
>   #define MSI_IOVA_LENGTH			0x100000
>   
> +/* Interconnect bandwidth vote values for the SMMU register access path */
> +#define ARM_SMMU_ICC_AVG_BW		0
> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> +
>   static int force_stage;
>   module_param(force_stage, int, S_IRUGO);
>   MODULE_PARM_DESC(force_stage,
> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>   	}
>   }
>   
> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
> +{
> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> +	if (IS_ERR(smmu->icc_path)) {
> +		int err = PTR_ERR(smmu->icc_path);
> +
> +		if (err == -ENODEV) {
> +			smmu->icc_path = NULL;
> +			return 0;
> +		}
> +		return dev_err_probe(smmu->dev, err,
> +				     "failed to get interconnect path\n");
> +	}
> +	return 0;
> +}
> +
> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
> +{
> +	if (smmu->icc_path)
> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
> +}
> +
> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
> +{
> +	if (smmu->icc_path)
> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
> +}
> +
>   static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
>   {
>   	/*
> @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   	if (err)
>   		return err;
>   
> +	/*
> +	 * Acquire and vote the interconnect path before accessing any SMMU
> +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
> +	 */
> +	err = arm_smmu_icc_get(smmu);
> +	if (err) {
> +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
> +		return err;
> +	}
> +	arm_smmu_icc_enable(smmu);
> +
>   	err = arm_smmu_device_cfg_probe(smmu);
>   	if (err)
>   		return err;
> @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>   
>   	if (pm_runtime_enabled(smmu->dev))
>   		pm_runtime_force_suspend(smmu->dev);
> -	else
> +	else {
>   		clk_bulk_disable(smmu->num_clks, smmu->clks);
> +		arm_smmu_icc_disable(smmu);
> +	}
>   
>   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>   }
> @@ -2294,9 +2342,13 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
>   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>   	int ret;
>   
> +	arm_smmu_icc_enable(smmu);
> +
>   	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
> -	if (ret)
> +	if (ret) {
> +		arm_smmu_icc_disable(smmu);
>   		return ret;
> +	}
>   
>   	arm_smmu_device_reset(smmu);
>   
> @@ -2308,6 +2360,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>   
>   	clk_bulk_disable(smmu->num_clks, smmu->clks);
> +	arm_smmu_icc_disable(smmu);
>   
>   	return 0;
>   }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 26d2e33cd328b8278888585fc07a31485d9397e2..c00606a416b2f4bb44a35e5d67f6ef801df68e1c 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -15,6 +15,7 @@
>   #include <linux/bits.h>
>   #include <linux/clk.h>
>   #include <linux/device.h>
> +#include <linux/interconnect.h>
>   #include <linux/io-64-nonatomic-hi-lo.h>
>   #include <linux/io-pgtable.h>
>   #include <linux/iommu.h>
> @@ -335,6 +336,7 @@ struct arm_smmu_device {
>   	int				num_clks;
>   	unsigned int			*irqs;
>   	struct clk_bulk_data		*clks;
> +	struct icc_path			*icc_path;
>   
>   	spinlock_t			global_sync_lock;
>   
> 

Any feedback or concerns on the interconnect voting approach proposed here?

This helps to address the kernel panic issue [1] reported for one of 
Qualcomm platforms.

[1]: https://github.com/qualcomm-linux/kernel/issues/297

Thanks,
Bibek

