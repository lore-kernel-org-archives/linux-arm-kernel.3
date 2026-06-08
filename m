Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABE9CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjuk1KpG4DK4R94Jw4NYgXvuSWpQTUimOywC/vaPeSw=; b=QdBBN+UTtycvAuWoSeafxdCOOv
	0fAkI54VmlxVEcnslZI5N9VsNwjQg/Py9N4Zz3hn/Wpa6Mv2ReLwtwnAzkUuEDCUAioIqjK3yoxeP
	L4N9Peilrjr/KkSx5+iMcctz8OznMnT4aIpd0V8XQQiGY/4AX6a0spKNH63OIPXnb3X3X1+t8Kpzc
	4vu0YrhWmTxZR51q9x1o6jFOMvEN0CGpzN8259fl9/4emFYHZy7h8sZCo4P3M0ToQE5usSW9XLYqg
	EZEWjvmBROnOh0IU9LqwddNMnawPiq+DGMpsA5505GfJkcsS3fAWkqwpwim8+JtLVu6audCtURNJL
	Mdmr+eLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRh-00000003fao-2cFo;
	Mon, 08 Jun 2026 13:55:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaRe-00000003fVM-0aHm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:55:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRBV83336230
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 13:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hjuk1KpG4DK4R94Jw4NYgXvu
	SWpQTUimOywC/vaPeSw=; b=Zh7cKoXiEuMFEPo8ZkqoCcmFe398OW17QCwiCAzh
	fbA9Ab/+aHiu1NC2P4DgdzlBl/CNlt/5mx77Jjt4E4H5FS4LgPzdI/l+26Ku1Gmx
	I7AbFXxVl2oZKY4UVyNhpJz7twU6okEpevB299J7/6lj9IrIbJ9zRJLWbfwKSpUi
	Nt4guGHM4of6S3OgI60F+uXNrnds0RW+kqboQi+QdkRwVl6F3zPkVgowir7ZpyqR
	72HRymWWvVQH8Yb1V137HL4CSAa9q0TOJG8Rn7JHSNW/cRZgylE8JHR8c7HaggNJ
	o8XWpR81VvPto07HMVD6fwYr0E3ferpDDw4NM7x+Z8uI3A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun40yjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:55:13 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9638fe9399dso1792959241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926913; x=1781531713; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hjuk1KpG4DK4R94Jw4NYgXvuSWpQTUimOywC/vaPeSw=;
        b=ipfxJkw1SHlXTB1TrfMenKmOclQCDDT5leDfNQdF+8ZjYbMd1cCufwVzSTNhY8lk+n
         /61up2+XDlW6i+PZe+c77laAwpvJEu39jsW1cTz6pgpwR3qAgoIv14i9AALUvaPHJBMv
         5TZRoo5KhOgmgbLUpGlK+GIqxubqIBsTZo6O3XVCsAkDNkABRyZw2iKYO2/Wd8E++y+7
         cdIXb3Yarinx0JJq8zJcuXMBHWwC1Y4unhqXWmI/b0UmtEs6pQ70dT9r3hQmuIpZ6KAa
         YobgDX2CKvTijlG2/BYQws18/GOPBGDsHiw2A8HtN/tuPamEk0t0Lt7Jjbjw9zw32uQ3
         J9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926913; x=1781531713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjuk1KpG4DK4R94Jw4NYgXvuSWpQTUimOywC/vaPeSw=;
        b=mzcNB9Hc3IeuU4ZBVlP41f7GcVu0X+2w5jc2YVyN9XdH7SlQehm31lyiW1bjVP0sVf
         xTQfliDocGPNePoN9m2+UhKo4IYRb+iLYuwTSFctswpRNj1nURRCubScHdha4PyLU598
         Q6gD0KkPO4O70coZ+foU/63SFrdstDiuS6eTYBvfXrmAV2cfJ6KG8W9vbo+bgZiF+fCW
         AfsU+OuIb75xxtslrarU2H6rRePPUKSSzhX3rDGsvQKZbiy/pgVSl+SmmiA5Sn081Y1P
         A/HsJf3kfaUX9COtf+JFyQwWtIOTni3ecKPSm3z5pD84sVHzNJxPY8v+2iV2JRnDLOi9
         krwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+CIay8apZ+4+nIG0mgtCua+B4czqU/5hB+mYixwCmWMOsnIgBGnvS5DNOogPEIdbHyz3MkgHoxB5umhxJaKuiG@lists.infradead.org
X-Gm-Message-State: AOJu0YwBm/whQvLSrIlvsCiQphpegx598khq+9Crz8lbpfDFoOxMIRBe
	PPYVGJik74aWOzsNs5IOnF6U6D0ONl1hegkiwnuhnnqT3frh3ZW08LmZV8JZtFrSy/NNPHwrb28
	U8K5ArojcbzK4jKxI+pNuJWzNOHXv+OfHq+Lz1cFHsK4FXp9KBTyeyI0uDAyIUv0q9P57/6BXcq
	pyRQ==
X-Gm-Gg: Acq92OFmMvd5MSIb/Uu5Nw3rbSCGt3ZpiQEd/6zqBLK0QHlmSZpZgDWyL1K1joTy8WQ
	UduxMj0MGTRRr1x/RHdr8ya7IXj/7aR/zvw+xIcu/w9WD4v0fFxu11g4HaUH3z8bT1tCgwgjGcJ
	bCr9RxhaiM7kNkktwukNnc6LpqEZ+flYAWUPxBSN8MfzikIkfE/Pt5/zd4a2PTW5jjAOK82R/P2
	dcwE+8PwX0Nyqi18AHlvN7zUeVCNbr2u7WSW0VC9Uxw6rjJX+3KPLBhDniBoQcNJFezM9tAbGFo
	rsWoC5+PUHTLdAaliIPEL3Ye1rbqMrJrABI/IEQcZYNeJH1VtB/w2A+0FP8esaAWufBFEx7tXsD
	Tb7kzzU5EG8kGCGB3xaNGN4P4kbvCeO/tgG6dQ8NZzvIdBLBXlX2YAUZQa6ob69knG16EadHcc5
	qRTzxkBqRWID9LcDO6GpsEwE2Ufj5Lz/+P/yUqM6+gqs8Ukg==
X-Received: by 2002:a05:6102:32d5:b0:633:1b2e:e574 with SMTP id ada2fe7eead31-6ff0300f0b8mr6715665137.29.1780926912508;
        Mon, 08 Jun 2026 06:55:12 -0700 (PDT)
X-Received: by 2002:a05:6102:32d5:b0:633:1b2e:e574 with SMTP id ada2fe7eead31-6ff0300f0b8mr6715640137.29.1780926911952;
        Mon, 08 Jun 2026 06:55:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be29fsm45071611fa.21.2026.06.08.06.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:55:10 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:55:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Message-ID: <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfX010spy/BbQZ9
 KXA0Q/d11+eVUyZ1TPLDst2kaA4XVTPakFFOujkREpGWolTacl2U2lCusbO1eFjblNBmKo12LTD
 uftCcLYeDMM/PnZ5HCt4AHWMFBYjdf1qMET/c1OSF5hMDqhq//wUrjn6YPrmCpoMHApCfCFZwdz
 +XVKY3sP/stQvfEJTGNlVWSMl+Qn99o6PgYg+RxVHKSuJEmz6aY1ruxvpjpdcfl5Vkrwf3jEG24
 iGuoM2NxaDKjIWkI/RM4kXCS5vmyZhoTFCU0zVwpM9rtoavP/CQjLCkrncVCFcM+W6PWMvfbjey
 45Ej6fnIGHau3anvOMBIhzRRIeMlbtS7AtAiRil/szCJhFVUeiBGygwtC66bgVCgTh455vJ2i1Y
 hHO2UNRTzNbS+0Ieq5KJnPydDlrolWQIVbmRWAKrOSFIZo66vVD5Jz8s2ZAqmsbn71/wzoK9/Aw
 f3KOhqlOWmlxqv0qYwA==
X-Proofpoint-ORIG-GUID: iruTdO631xqnvcfs9Gdn5BdljNodOxAa
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26c9c1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6LyoA_EE4LLIN3d-eQgA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: iruTdO631xqnvcfs9Gdn5BdljNodOxAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065514_195224_31BB9842 
X-CRM114-Status: GOOD (  38.70  )
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

On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
> On some SoCs the SMMU registers require an active interconnect
> bandwidth vote to be accessible. While other clients typically
> satisfy this requirement implicitly, certain corner cases (e.g.
> during sleep/wakeup transitions) can leave the SMMU without a
> vote, causing intermittent register access failures.
> 
> Add support for an optional interconnect path to the arm-smmu
> driver and vote for bandwidth while the SMMU is active. The path
> is acquired from DT if present and ignored otherwise.
> 
> The bandwidth vote is enabled before accessing SMMU registers
> during probe and runtime resume, and released during runtime
> suspend and on error paths.
> 
> Generally, from an architectural perspective, GEM_NOC and DDR are
> expected to have an active vote whenever the adreno_smmu block is
> powered on. In most common use cases, this requirement is implicitly
> satisfied because other GPU-related clients (for example, the GMU
> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
> 
> However, there are certain corner cases, such as during sleep/wakeup
> transitions, where the GEM_NOC vote can be removed before adreno_smmu
> is powered down. If adreno_smmu is then accessed while the interconnect
> vote is missing, it can lead to the observed failures. Because of the
> precise ordering involved, this scenario is difficult to reproduce
> consistently.
> (also GDSC is involved in adreno usecases can have an independent vote)
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>  2 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -53,6 +53,11 @@
>  #define MSI_IOVA_BASE			0x8000000
>  #define MSI_IOVA_LENGTH			0x100000
>  
> +/* Interconnect bandwidth vote values for the SMMU register access path */
> +#define ARM_SMMU_ICC_AVG_BW		0
> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000

totally random numbers, which might be different for non-Qualcomm platform.

> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> +
>  static int force_stage;
>  module_param(force_stage, int, S_IRUGO);
>  MODULE_PARM_DESC(force_stage,
> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>  	}
>  }
>  
> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
> +{
> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);

Is there always only one bus / path in question?

> +	if (IS_ERR(smmu->icc_path)) {

if (!IS_ERR(smmu->icc_path))
	return 0;

int err = PTR_ERR();
if (err == -ENODEV) {
	icc_path = NULL;
	return 0;
}

return dev_err_probe();


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

Drop the if.

> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));

WARN_ON_ONCE()?

Pass the error to the caller.


> +}
> +
> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
> +{
> +	if (smmu->icc_path)

Drop the if.

> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> +				   ARM_SMMU_ICC_PEAK_BW_LOW));

Pass the error to the caller.

> +}
> +
>  static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
>  {
>  	/*
> @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
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

Handle the error.

> +
>  	err = arm_smmu_device_cfg_probe(smmu);
>  	if (err)
>  		return err;
> @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>  
>  	if (pm_runtime_enabled(smmu->dev))
>  		pm_runtime_force_suspend(smmu->dev);
> -	else
> +	else {
>  		clk_bulk_disable(smmu->num_clks, smmu->clks);
> +		arm_smmu_icc_disable(smmu);

Handle the error.

etc.

> +	}
>  
>  	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>  }

-- 
With best wishes
Dmitry

