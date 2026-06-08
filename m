Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33208CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNnrFzM56GPx5J4+UEj8QmmkdW/VSFOOyJZ8mOuFa/A=; b=gFty6m6VvxQzpR05M6SXB1oMP+
	odH0hr3nh5ev0qwbyvnVt8uEKljpiVGnvnTyx5u+i9yd18HpIcpmJmxmybcB2bsJc6jmzPOPv0DOh
	c0h8zTVmaIZf2CuU1RemdrMHBF/Dg6koKgSLaaCMpGKqks0J9piGWW6izo/pV7618pNwmLI+/rtUo
	Mb4VpxyNb0qQ+oMhoVVaH4bsQdl9dvnJ3FVqJm3195v1RRqMKSYoz8DPO5/4QdMYqYp63QhnRFcqV
	aL4XuG6cLf9YnX5f5b6qpXVyIct6UgpSyXYuhrVj09N8LmPiQeYt43aHPls78WM02zO+BZ9GmHxOz
	VFuV9btg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaNK-00000003elS-3ub9;
	Mon, 08 Jun 2026 13:50:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaNI-00000003ekv-1D2k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:50:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR6J73336180
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 13:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cNnrFzM56GPx5J4+UEj8Qmmk
	dW/VSFOOyJZ8mOuFa/A=; b=i2qhAemjb10Ek3piQZv/D7JanNvtT9Y0eVk/grdV
	mi+rXCZcEZkSCtzhsFjeJ96cXCIIYR4b0rsP4pP+e8tqD9h1mSVli5DiRBrjLkly
	DAF8g9AyVWvSWDs46Ema/G8l9dI8ZZA+VQkFlSw//hJTG5mXHLRSuw2sVs55Ar27
	LHPTuYgfWUxXc9MMylJfRAjQQetNTIR9em6n1Zlfz+fGZ8P2c+ZRis7wl4PpP423
	6NZPIMKe4q1pMMQ8m23u1ZYTCTU2cQS9aBSMUlZ6AXomUGOEByyBAD83HzBVX0xy
	ETYyG8M7dbvmoYixs4WPBaRfAicH1/r7FP+nRjENsvGWRg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun40y1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:50:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6e907a982f5so7173284137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926643; x=1781531443; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cNnrFzM56GPx5J4+UEj8QmmkdW/VSFOOyJZ8mOuFa/A=;
        b=Fpc9ilY1Op6TVD6UVqrN5eM3CvvTqUXopR/TU3KpopMF95MgbdXzpkLEKM40eh18TB
         T61ed8Q47sR8wevQ6erZlW4HquVd2jPS//gdGzqoaSJJvRvTWSL68XWaD+cEE0I4DgtM
         lfi9V/wMTm5wn8BWVTizhVbsPYtC84fFGPvMQvSbaoRMGscsGTWxS2Azb0qy8q7iD570
         yasYlTBbT08azQ9UXNDCTFDe2O/iCGrvUOcbBSJIafNOoNkfMl88EtegmR3yCjelFYKd
         LKWCP65rzHmiOGvLMEeeWPDKndYJF0s9avOElMUi7JIkSypjUajYoDnAk6ZbaSUPewjC
         aftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926643; x=1781531443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNnrFzM56GPx5J4+UEj8QmmkdW/VSFOOyJZ8mOuFa/A=;
        b=ns18Ea3j3pyRTDjq/yR3eLnKJGhFT56Mh36luqcV9A523ZDgDFFUNF4aWB+eFASfJn
         2n2pptDCkcsSFNZP5Nra3u8hsiW+2a7z+j8pZm2+5FOHaHwKLGhIa/0jMco6tqEls7A5
         cR2tjs7G/X+SViN1ZUBNfBBAXHAaZPe29BA4YhbpwOTSg6z+/MtnAX5h44/N5zXhM9lK
         p3Ho2vZuwMhU8sPtk5rzRNdHN+AmkxGHNW6dDouNCwXuUhsfJDbuhU7d4vYji/x9nQuA
         JtW+WxA9qZxRo8RJzLFvNNqaz0YNNqBWfaN3aXzUvcuq8vgQVUhdB3nyUgNSaaNJgq5N
         LhYw==
X-Forwarded-Encrypted: i=1; AFNElJ8Uk24QuNy/dv5fMfdFTrAk5pTa7g2Bs9BHlRniBKazzln2pOMDUPbjLmLkmDp1ot8KKUjW0Zsz7/Ynd4Kw5IJQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwjvHb0FptHXcC0zMN7WRf0y4+Iuc+XOj1ADQ1pWj/MMznz68q1
	PTLgeaZr9UCL9oITHQhI4hZSs0jjdxfMmFwxio1vGZos4cL6NYydJtgt/ptZMJPATBPgrH52snn
	Z1PuaK4+OCALzNYn/iNWli0uVSDc2nsSa44qQb/w6UAvxipJ2SbP2veq55Q0lA0/0gx0s80VJ3o
	qiUw==
X-Gm-Gg: Acq92OHTWmEX40v45SBEmiLbPLo8dF+k3elMNHZTKiWPdX0CnDWUCx+eSp7JECyVQ8P
	cX21zv334157eMNPbtQnXAkvAeBD6SCGXKpGYJqicgU3ck+eKPU/oYHUxc4q1MAgezCafyikaid
	+M+p5fa9wDLbvsZVUhNBawIHUS8TLa8qkXZSeJylm4Sct/DrUXYsI/NS6RE6FemqZrBFgFoWUJw
	YtFGuNv50xZtwbYbC1MsGLjh+RY57SCZK2nCtLCCLllZDycy4pYcUdFDgvARvpIYt6N4oC6v2U+
	GCKQQqjxavOxTg3FUw/fUOoGqCLi9QSZximndD/GG1Yph1gCiCFZVRStCKxQtrku3QN+3DZvg1T
	/QA12Nb1kL+IVhySVkOLyDbvof4WR5ploRzBDkCNHoC3LrkaM8Z2CVGAB/oKrRwYDVtHtPnRuLA
	OQdqVvEdcTk+bnmGxxcSfcw7v1X+eb3t2hWurTs1Jr58dIbw==
X-Received: by 2002:a67:fb92:0:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-700392f5baemr3677225137.19.1780926642690;
        Mon, 08 Jun 2026 06:50:42 -0700 (PDT)
X-Received: by 2002:a67:fb92:0:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-700392f5baemr3677206137.19.1780926642269;
        Mon, 08 Jun 2026 06:50:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b90421dsm3827701e87.30.2026.06.08.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:50:41 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:50:39 +0300
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
Message-ID: <bkve3vmokuyrn4agsqyzxlqr5wuy5y6urnliqypac3h6lb32hy@tfkjstevqv2y>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <68aa9591-49e0-4cb7-9a5b-36405efe7094@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68aa9591-49e0-4cb7-9a5b-36405efe7094@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMSBTYWx0ZWRfX6YX4twYFu3qu
 JAtPOi5lyUXwk4PJ0fYaBo+vHqhb4vNagxhw+quuunIWnk5Pcw6+TKic6ETtAZnJRTdS3elC4NA
 hevS2ppwrR0khc6+nrigiYuacDzCHT2RKH/mLYQDQ7P74vMiVMoGwMLdZx0HyTKJ1p6UsKUy1dB
 htzzZWpDGhhdDFjEH7CFEus95HW/evRd6Ck05P/OcAG8uoJlfy+HS7dqOfOl5StF0NAamrcRtYK
 +k8yeafURpg/bci6nYHy8B665A9BPqKmMG1EDxddiQFc6T3qVqShXdcSTtWyIVhDv3FEmViUhVG
 kpE5vdf/vPOYiL0ocAob4qlQHQ5wdf5Lf65yUjJ938U0PH1ZLJtDYK8IkPZ/oki9yuG/YdvsGOY
 hhGSPSE0tqqBS6AF6dFLcUymc7pZ/tz6FMyHuvTqUl4BJXVBEdnpsksB1fsvf+MLCFSaiWbDJ1K
 m1k32vIeH5+R5B+GjQA==
X-Proofpoint-ORIG-GUID: Ms6TJXXj7i1exCAKsS-gFDVURu3Lzl7A
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26c8b3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=dk3LCUOL6mBsUDzKOqAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: Ms6TJXXj7i1exCAKsS-gFDVURu3Lzl7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065044_334019_0ED3EF8F 
X-CRM114-Status: GOOD (  32.02  )
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

On Mon, Jun 08, 2026 at 06:59:34PM +0530, Bibek Kumar Patro wrote:
> 
> ...
> 
> > ---
> >   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
> >   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
> >   2 files changed, 57 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -53,6 +53,11 @@
> >   #define MSI_IOVA_BASE			0x8000000
> >   #define MSI_IOVA_LENGTH			0x100000
> > +/* Interconnect bandwidth vote values for the SMMU register access path */
> > +#define ARM_SMMU_ICC_AVG_BW		0
> > +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> > +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> > +
> >   static int force_stage;
> >   module_param(force_stage, int, S_IRUGO);
> >   MODULE_PARM_DESC(force_stage,
> > @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> >   	}
> >   }
> > +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
> > +{
> > +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> > +	if (IS_ERR(smmu->icc_path)) {
> > +		int err = PTR_ERR(smmu->icc_path);
> > +
> > +		if (err == -ENODEV) {
> > +			smmu->icc_path = NULL;
> > +			return 0;
> > +		}
> > +		return dev_err_probe(smmu->dev, err,
> > +				     "failed to get interconnect path\n");
> > +	}
> > +	return 0;
> > +}
> > +
> > +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
> > +{
> > +	if (smmu->icc_path)
> > +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> > +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
> > +}
> > +
> > +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
> > +{
> > +	if (smmu->icc_path)
> > +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> > +				   ARM_SMMU_ICC_PEAK_BW_LOW));
> > +}
> > +
> >   static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
> >   {
> >   	/*
> > @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
> >   	if (err)
> >   		return err;
> > +	/*
> > +	 * Acquire and vote the interconnect path before accessing any SMMU
> > +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
> > +	 */
> > +	err = arm_smmu_icc_get(smmu);
> > +	if (err) {
> > +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
> > +		return err;
> > +	}
> > +	arm_smmu_icc_enable(smmu);
> > +
> >   	err = arm_smmu_device_cfg_probe(smmu);
> >   	if (err)
> >   		return err;
> > @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
> >   	if (pm_runtime_enabled(smmu->dev))
> >   		pm_runtime_force_suspend(smmu->dev);
> > -	else
> > +	else {
> >   		clk_bulk_disable(smmu->num_clks, smmu->clks);
> > +		arm_smmu_icc_disable(smmu);
> > +	}
> >   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
> >   }
> > @@ -2294,9 +2342,13 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
> >   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> >   	int ret;
> > +	arm_smmu_icc_enable(smmu);
> > +
> >   	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
> > -	if (ret)
> > +	if (ret) {
> > +		arm_smmu_icc_disable(smmu);
> >   		return ret;
> > +	}
> >   	arm_smmu_device_reset(smmu);
> > @@ -2308,6 +2360,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
> >   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> >   	clk_bulk_disable(smmu->num_clks, smmu->clks);
> > +	arm_smmu_icc_disable(smmu);
> >   	return 0;
> >   }
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > index 26d2e33cd328b8278888585fc07a31485d9397e2..c00606a416b2f4bb44a35e5d67f6ef801df68e1c 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -15,6 +15,7 @@
> >   #include <linux/bits.h>
> >   #include <linux/clk.h>
> >   #include <linux/device.h>
> > +#include <linux/interconnect.h>
> >   #include <linux/io-64-nonatomic-hi-lo.h>
> >   #include <linux/io-pgtable.h>
> >   #include <linux/iommu.h>
> > @@ -335,6 +336,7 @@ struct arm_smmu_device {
> >   	int				num_clks;
> >   	unsigned int			*irqs;
> >   	struct clk_bulk_data		*clks;
> > +	struct icc_path			*icc_path;
> >   	spinlock_t			global_sync_lock;
> > 
> 
> Any feedback or concerns on the interconnect voting approach proposed here?
> 
> This helps to address the kernel panic issue [1] reported for one of
> Qualcomm platforms.

Please respond or tend the issues, pointed out by Sashiko.

> 
> [1]: https://github.com/qualcomm-linux/kernel/issues/297
> 
> Thanks,
> Bibek

-- 
With best wishes
Dmitry

