Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863D3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/FW7h8IeS6yPhuHUmuiZkT7rFpwulK/foFKldJ+TkE=; b=AcbzoLn915JnNCbmWn1oai3ezc
	n4uen2DTXQrl5Iq7PtLOKRMIlchduoGhsOBuP/M4vlLtyYEXGhSbrAET3I5ofs1Km3mnGLInmWCwp
	Eh2/yCjaPN8IYPB37+mypFr8Dg1v0eM4kBpxuUKRLAKAncL9qhFQWR0PWV14OX7CNcPUW+xpaL+7l
	aA88kwtA4t10MGzZtPjnmzI2J71xXICkAkAEUAxswPs9dRpmLkPVinJ8iz0UX4YoC2CZnM44NA8Ta
	w+O4iVBB6ZrfkKO2kKO2wsq1LiJ8+xXllyCnT5JQr6i0tVRqH95qw89gpQfMY3joonK3Y/QbC0RDd
	0phOYcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnJU-0000000DECD-0GGU;
	Mon, 06 Jul 2026 17:41:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnJR-0000000DEBt-2OVs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:40:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFBiV972247
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 17:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0/FW7h8IeS6yPhuHUmuiZkT7
	rFpwulK/foFKldJ+TkE=; b=AJA8k54f42eEHtLlS9U0tCuyF/lDpgaSm+Ph4dmL
	Y2+d16UStpZXeA6xw+t04DTWYM1lPGWJS1vh32jfCSssCaWqILlhyoyoZZab5r41
	xETAO87nna0gkmQq+4267kO+4tA3scnBM3oLyAk90E6a3eEtslEWIKmtJLpTbu0b
	+vE1FPNjA6M30cDXwr3mud4Ka3zuTTqlAIIATG/FuWsUA/W0woPzhYIWat2oeiEf
	D/ttXsQMlP+OCX4GlkK2qcJD3UDGAasvlS4h/azxnaVUcIkWuvZZRhnG/aDR1z59
	m8IHLwrFWnx382/z2E38jDHAd5khSFiE6BeDiKkxp9SQzA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r23v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 17:40:56 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bd6f09f03aso4424639e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783359656; x=1783964456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/FW7h8IeS6yPhuHUmuiZkT7rFpwulK/foFKldJ+TkE=;
        b=R9LxxyeeMBp+3yUuFZzQvbLwDyrurVgYIjhjY3X5FODG/py2Lvhal1+M8JL8DdVByV
         VJNV4w2TbRMvgaA+5aXo22bQfIrlJKKBMkI1NoGhj8VHM3qJ9iE84AcYGM+1Dsr8i7qC
         e0jv+KtrNk+NaOKFT1l8PuN4fvrGKyTBJrrdWVy5hwZlSGuHfHqK+Sfp4G4kP5kG1fMP
         AK0OFd7qMOp2D0KYt1t6d1ZOBXDftf2kSoncjSGx85BgP2fnuwiwsAmsZoZNh2FDlfvP
         PShKyWK2R4uI13cnk5dXk/thSuEy/Qsk9MF7F1NOWGMNPVC/F9T3mt90pJss9agdsPzH
         wmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783359656; x=1783964456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/FW7h8IeS6yPhuHUmuiZkT7rFpwulK/foFKldJ+TkE=;
        b=bM9NlVd/iCPk34PkE17k9g/UXrOeRZUnwwO1OU43NWSZltq8EtzNt2ADVYkDPM3TQM
         XaroqOQKu4Q/RgC1GKRGD13Lggn3De4FeFaV0IvAWMj4jnycO0GKN8+c/IY3cbQSLXYx
         8erwUY4ypQox/tLqvv3m1/J6J5EGuBts7tL25rQp1NfinkXTj9MrqPlG8gEMT3zb6Og8
         NmVqQka3/vo6D00yUbugwbgHueumjXQB4oszHS7Js+Z+8M+eDT6YjnvAj9BGIAI2yION
         PL0tAU9+6H1SF00hVAz9Mlz5AeeoD7jjhqFdMdNggmYWgbdA2QixJTxaXj2KBp40qbZM
         pxQA==
X-Forwarded-Encrypted: i=1; AHgh+Roa+BhhnfALt8gr6fnevQhZ1ymkGXSFYcEzJoJVcgU+Vg0KMAJsTdg+BbCT+E4HXFu4L0cbU8F0d0H0QGVFzKmw@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv+HQ1l2TVrp98w33YLC36+LuMMsmGwzqIdTsA/YR1s/dLVDGT
	oU0tOo4xfPYebVKvoPpuSidsiot/ISC47QzGW1YZ3GiNi5cbywcOItTfr+naa/cBEL9w6dpvbmL
	F6b0cVNII2wPBebmD0SMI/uVPncZGIpG06gprnpeH330zd3B6HT96UWw62q/ImaOU5eGl3nuHeN
	x1Qg==
X-Gm-Gg: AfdE7cnRaDfbVrLIIKCJqRMvt+S4qz2HaJEIwtUy/UgepYiYnHCZUO8xb3OOIbLNRDS
	/4/KPMq88crT55cwIbmAUV7YBawpM6o2OTuApXXtnc/Q+B3evDAyghKGcidhx/cpzntKfjJ6ajt
	OTwSWB7oNzOYX8yPd80dxlr8UnNvgyiQ6L/YfPAzIyH5P9XEJPU4FQ3TXn3GJ+Dgep5sjVl9HRO
	y0tnhwnvjJe+FoxUxoxrPBeZEKpMuceKf8jO4zCylR8OTI+pazMeVZzJbGX9EWAA0R4xRXTZ6VT
	u5MpE/Osr880mNi6aBuyXdAycoHqLYmvfJY4STYYUr7a+O24ALM+Co5sz7nx3SBSuUXe3/bqMir
	1N4tT+NLGeyXJAGFMnSYWZRFtKiKQI53hFCIcAEmvpzkef9p62Uep9BtPKf3n8E2HReboFQW4Fc
	gs3LgKH9gBCULkPAi71sdT1pv3
X-Received: by 2002:a05:6122:a0c:b0:5a4:7e8b:3171 with SMTP id 71dfb90a1353d-5be90860c25mr995151e0c.11.1783359655774;
        Mon, 06 Jul 2026 10:40:55 -0700 (PDT)
X-Received: by 2002:a05:6122:a0c:b0:5a4:7e8b:3171 with SMTP id 71dfb90a1353d-5be90860c25mr995141e0c.11.1783359655331;
        Mon, 06 Jul 2026 10:40:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1383a29sm3034362e87.36.2026.07.06.10.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:40:54 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:40:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Message-ID: <lltyynsswbeqdgpl4bqbil5ohgs6v25pvd5cqfuh36nrzgwv7o@u54exappwjes>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-2-afdca0125a65@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-smmu_interconnect_addition-v3-2-afdca0125a65@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfX/ez6ogMWeHfB
 VNwyiSaROxkAmrWUI9l2q4ne3LNv1sDnnKbvoSox/Uc6XiCixRqQntYzCImL7fiXLvGLxKx37Bd
 aniPohV3rVkztwTUoW5EiqZJt4W8ttDFV3H4Yvw/Qufz0z1SncvUhetOQ7o9tqHtuCWhzf/YzXD
 M7a9cO4vUKxzB7Jrxk+BGe047bEZ6CGbyspfLJSqS+EQyl9C1o/t0mTqQ9AFW2kN7A1iX0wm6Io
 ErpaPptEv0rGi7gYe24jktn4W8xLxbMXTlWPbK29sQIyS6PFTx6FBxpScCgB+g9UZ1YuG+4HbkF
 F2jcWXoOSEedPYB5ViNSCR2T8wgSjT4FFkc44d7mDdVqY5zv8KkonHPLg3qTOBcHSfkQlfPGtqz
 mbNrmgsGdeq5s/JWf/QJ0QVtrA3G/0g0Z/JF968NB+uQ2M31HLFoPvvaJ5vGH9pfqYsZaFR2S1k
 Vb64MMX1xRHe0kQVxQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3OCBTYWx0ZWRfXweFl4EXPc86N
 5zqiR/kVJpLZeFXZVwgB0dQcMi/6i8D6jFnFFjJHKHaknPGWxN0lZaSUvhohN1nk+VF6RBQtC5q
 q5sUIAd5Ud0axFuFpBDdh7P7pkxMtGM=
X-Proofpoint-GUID: Fd2cqmXiowhfY_OS91EYiVQZ5RQ-Ks_q
X-Proofpoint-ORIG-GUID: Fd2cqmXiowhfY_OS91EYiVQZ5RQ-Ks_q
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4be8a8 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=y9Wl6y6DRnsaoLG14jUA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_104057_797705_8AED0BE4 
X-CRM114-Status: GOOD (  38.36  )
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

On Mon, Jul 06, 2026 at 10:26:35PM +0530, Bibek Kumar Patro wrote:
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
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 55 +++++++++++++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  3 ++
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 27 +++++++++++++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>  4 files changed, 84 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index e2c914fccd6f..5133d3ab023a 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -6,6 +6,7 @@
>  #include <linux/acpi.h>
>  #include <linux/adreno-smmu-priv.h>
>  #include <linux/delay.h>
> +#include <linux/interconnect.h>
>  #include <linux/of_device.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/platform_device.h>
> @@ -607,6 +608,45 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>  	return ret;
>  }
>  
> +static int qcom_adreno_smmu_icc_init(struct arm_smmu_device *smmu)
> +{
> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
> +	int err;
> +
> +	qsmmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> +	if (!IS_ERR(qsmmu->icc_path))
> +		return 0;
> +
> +	err = PTR_ERR(qsmmu->icc_path);
> +
> +	if (err == -ENODEV) {
> +		qsmmu->icc_path = NULL;
> +		return 0;
> +	}
> +	return dev_err_probe(smmu->dev, err,
> +			     "failed to get interconnect path\n");
> +}
> +
> +static int qcom_adreno_smmu_runtime_resume(struct arm_smmu_device *smmu)
> +{
> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
> +	int ret;
> +
> +	ret = icc_set_bw(qsmmu->icc_path, 0, 1);
> +	WARN_ON_ONCE(ret);
> +	return ret;
> +}
> +
> +static int qcom_adreno_smmu_runtime_suspend(struct arm_smmu_device *smmu)
> +{
> +	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
> +	int ret;
> +
> +	ret = icc_set_bw(qsmmu->icc_path, 0, 0);
> +	WARN_ON_ONCE(ret);
> +	return ret;
> +}
> +
>  static const struct arm_smmu_impl qcom_smmu_v2_impl = {
>  	.init_context = qcom_smmu_init_context,
>  	.cfg_probe = qcom_smmu_cfg_probe,
> @@ -648,6 +688,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
>  	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>  	.write_sctlr = qcom_adreno_smmu_write_sctlr,
>  	.tlb_sync = qcom_smmu_tlb_sync,
> +	.runtime_resume = qcom_adreno_smmu_runtime_resume,
> +	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
>  	.context_fault_needs_threaded_irq = true,
>  };
>  
> @@ -658,6 +700,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
>  	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
>  	.write_sctlr = qcom_adreno_smmu_write_sctlr,
>  	.tlb_sync = qcom_smmu_tlb_sync,
> +	.runtime_resume = qcom_adreno_smmu_runtime_resume,
> +	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
>  	.context_fault_needs_threaded_irq = true,
>  };
>  
> @@ -667,11 +711,14 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>  	const struct device_node *np = smmu->dev->of_node;
>  	const struct arm_smmu_impl *impl;
>  	struct qcom_smmu *qsmmu;
> +	bool is_adreno_smmu;
> +	int ret;
>  
>  	if (!data)
>  		return ERR_PTR(-EINVAL);
>  
> -	if (np && of_device_is_compatible(np, "qcom,adreno-smmu"))
> +	is_adreno_smmu = np && of_device_is_compatible(np, "qcom,adreno-smmu");
> +	if (is_adreno_smmu)
>  		impl = data->adreno_impl;
>  	else
>  		impl = data->impl;
> @@ -691,6 +738,12 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
>  	qsmmu->smmu.impl = impl;
>  	qsmmu->data = data;
>  
> +	if (is_adreno_smmu) {
> +		ret = qcom_adreno_smmu_icc_init(&qsmmu->smmu);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}

Move this to a runtime hook to be declared in *data.

> +
>  	return &qsmmu->smmu;
>  }
>  
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> index 8addd453f5f1..6835b40339ce 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -6,12 +6,15 @@
>  #ifndef _ARM_SMMU_QCOM_H
>  #define _ARM_SMMU_QCOM_H
>  
> +#include <linux/interconnect.h>

Not necessary here. Just forward-declare the struct.

> +
>  struct qcom_smmu {
>  	struct arm_smmu_device smmu;
>  	const struct qcom_smmu_match_data *data;
>  	bool bypass_quirk;
>  	u8 bypass_cbndx;
>  	u32 stall_enabled;
> +	struct icc_path *icc_path;
>  };
>  
>  enum qcom_smmu_impl_reg_offset {
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 0bd21d206eb3..a27804e15738 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2189,6 +2189,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> +	if (smmu->impl && smmu->impl->runtime_resume) {
> +		err = smmu->impl->runtime_resume(smmu);
> +		if (err) {
> +			clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
> +			return err;
> +		}
> +	}
> +
>  	err = arm_smmu_device_cfg_probe(smmu);
>  	if (err)
>  		return err;
> @@ -2273,8 +2281,11 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>  
>  	if (pm_runtime_enabled(smmu->dev))
>  		pm_runtime_force_suspend(smmu->dev);
> -	else
> +	else {
>  		clk_bulk_disable(smmu->num_clks, smmu->clks);
> +		if (smmu->impl && smmu->impl->runtime_suspend)
> +			smmu->impl->runtime_suspend(smmu);
> +	}
>  
>  	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>  }
> @@ -2294,9 +2305,18 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
>  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>  	int ret;
>  
> +	if (smmu->impl && smmu->impl->runtime_resume) {
> +		ret = smmu->impl->runtime_resume(smmu);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
> -	if (ret)
> +	if (ret) {
> +		if (smmu->impl && smmu->impl->runtime_suspend)
> +			smmu->impl->runtime_suspend(smmu);
>  		return ret;
> +	}
>  
>  	arm_smmu_device_reset(smmu);
>  
> @@ -2309,6 +2329,9 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>  
>  	clk_bulk_disable(smmu->num_clks, smmu->clks);
>  
> +	if (smmu->impl && smmu->impl->runtime_suspend)
> +		return smmu->impl->runtime_suspend(smmu);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 26d2e33cd328..ed08f86cf99d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -455,6 +455,8 @@ struct arm_smmu_impl {
>  	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
>  	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
>  	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
> +	int (*runtime_resume)(struct arm_smmu_device *smmu);
> +	int (*runtime_suspend)(struct arm_smmu_device *smmu);
>  };
>  
>  #define INVALID_SMENDX			-1
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

