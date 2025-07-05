Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A4AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 14:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+R5R9I2nJrR2QShZ+dop4SkxfXqvIouFXsGw6h1onwA=; b=Di4Bx/nzXQD4Mn
	x1+6qJ7xRg3aNsj5JFnUoKGPHNWUdhsCbHe7y32KD1SlXbFm2ZZ29vF3F3ZB6LwZiLVthJQnNHu20
	ilD0oaaNB31XEDfzTHzfyqrj4drifDFt+xKdrlzuybWL4dPNqo/fWtOnKQtOteQNYb2WnNjXEYX7G
	w7hbrG8OQovgUQTCdmrAhkdXh43vA4xDOvSaNRSdwt9yGFCcm7MlQigleTHkCyuLguBb5InPRcl1b
	e62tjg9TsNu6gUKSIH7LZwCkZUipPfQxerXz7IVjlPnf4dq6k8y2TwAvVw9tfrIYIMGoPzZwEwqIu
	gHET2zVd1rSMJ+AwLsaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY3cZ-0000000Gbsf-0mSP;
	Sat, 05 Jul 2025 14:12:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY3aE-0000000Gbaf-3AAJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 14:09:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565DPZuv013716
	for <linux-arm-kernel@lists.infradead.org>; Sat, 5 Jul 2025 14:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=+R5R9I2nJrR2QShZ+dop4SkxfXqvIouFXsGw6h1onwA=; b=FF
	rIZmK98gOrDFTgLpU9cYQ6OJaKD7SMjEijqzCCkcnWOo/d1sJ/4HiX224ZtEUo0w
	OPrNiZj418+PzDvvDYjaV6JFPTocuepmeydVVG6y/PPNSlA8iyokzw+2L6gmolnA
	jN/IQlRu7CS9nN/G1mtzbXBHPctrCfm/R4YzAdbC1tT8bbPxcb6ZIemYHxHp2iC7
	GQu8c0SCvA7vUhza9RacY1pmkgvMSEN8KCh3sigeQe7eKReZBPQDTbzQuzHFPZJ3
	efbVo67SqtJHs0jlypt14J8w142X4hlGj3Te/RcjIn+oBhXfFvnZ+G7+S3Tzu8t5
	mGJ8/PLGQ5SnfkLA/DFg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv9713v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 14:09:36 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-40cf66174e9so1766253b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 07:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751724575; x=1752329375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+R5R9I2nJrR2QShZ+dop4SkxfXqvIouFXsGw6h1onwA=;
        b=aJu3q32m3iH6mF4pNWBXjL8zL0T7xQ9F/F12bfC73Wihb/pnGbrJPOKptEvJKfVQMp
         WFA0wDzOIeYv+X9aLaT1heZbKL6rNXPlz7AGqeF07H1wIT4R1d3xnlFReMX2ZLXQUNT8
         03fOz1yWqErBoPuTeGlH80e4BVQoCda+BpcgmOdIshbAsjjeP9GoW28HztvfWoaU+glO
         X9qV4rnIyTiLlx/38NVdSnP7FEg8LZfIM5y2CG6WFHcO6cv788NS+/k06fKD5iWZvcNu
         hxR5K8za/M+dsu35GA3Su6jy5JMbBqxq/z1oZ1qHnQ/1ohziJ/fRNL4w75jAHYymUTJ8
         xUTA==
X-Forwarded-Encrypted: i=1; AJvYcCUigV1+NeMsmi2bjOqgL/HRGJHfaiL7eKngyWv5I3x57MHSfbwSKUEZEQVmOuevi571rHg39qyF4eLz8Rq3W3ru@lists.infradead.org
X-Gm-Message-State: AOJu0YzjqSFZUs1qlV1MmIpukx8N3BfMqm8KCgzape1+idDLQoJPIsRe
	Ib6HQDq0eqhXbVc3l6N0sMmcHAVtqAoNu0T2p6s+i9Gsi93BMuBdc2jmSW66G9hp+yer+suSMaS
	nZNOEFAKL0hCkZVKnZa4uarjj5acnerlOAtGxsq7nURILLUqKvFRAUZbLT+KCQfXMzyVv/MJi+g
	+TbN7oVBQdPppNPwLJ/Kuy28lzo+pR3yQ9829xKb/xTbz5qK+t9KiK
X-Gm-Gg: ASbGncssyZR/axubbThXOmMiK4FtPdzpiJscO7QH809KPDAc5Hv2SwhYB+DvOIrzDBa
	AeNZHGy+bI1jyfyz0uGCBSz7+OoimywUXwWht+ksuQyqz6fTvGUyyHPBa0BbI37Q+xfry3jLAIv
	UPMaBymHxObCNqQ+biEbMhAt12TQXwwbWWSYQ=
X-Received: by 2002:a05:6808:118b:b0:406:794b:462 with SMTP id 5614622812f47-40d071d00d9mr3649974b6e.0.1751724575181;
        Sat, 05 Jul 2025 07:09:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA3q5wqh/EEUmvvZC73mDnOVowdgQnzs4lFfcQ936+1v/mgxLsm36MjdYRojGl9YJyJa80drv/pWEU7h6E+Pc=
X-Received: by 2002:a05:6808:118b:b0:406:794b:462 with SMTP id
 5614622812f47-40d071d00d9mr3649953b6e.0.1751724574700; Sat, 05 Jul 2025
 07:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com>
In-Reply-To: <20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 5 Jul 2025 07:09:23 -0700
X-Gm-Features: Ac12FXy3XxVN2bch22DCGw0GFR8wOdtcX4y80G4QjD1Fqf0Tx93RWyLsTzUvS5k
Message-ID: <CACSVV01nA4jbeUx-cbbKKvr0GPaLo=RtBJD-mYazFRnwbV0Wwg@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu: disable PRR on some of SMMU-500 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=68693220 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=gUAwG1mKp6tzq-jN0zEA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5MiBTYWx0ZWRfX0ACiRZatPw1e
 QSOAygheQPICzEaFXQVlmDZN9BCdnKHFIeGKe2Ke0qpk/SS+wGaxyGrUsNMxTVmeq3sGafD5JvS
 g4Vhk3VIn4XTeEQOIOrVhHiP/Pmwa+uD6311+pdaTzCDNdcyNg0ORnzEVUnidZJKRi8Qd1nI76l
 0NyW3FPGh1o6a0c7DtHZK6+BlqV40qEUAkCds09fnx/mdToR/dleJOsAnfmfErp+szKq1sOLLBv
 X8oLVMipsYyPNX1luGTvADBoL3wKKBcbczLIV3iKuuB3l4IOie+g2bhCI3DiusfVrhfzWsPj7vn
 GXsai5gwQ3PN3VHi1norfGktlGnmOimaMziprsceeuyNeaM0lfpQUFceyJ3fB/NIWlwCbxPZcxM
 QWXrQXp0lFRQAaZQ2oic/boW4c4cLb/e5Il8iRIeMp5gJO3KukhBKsw4gxeL1/FkkKdGfmQ4
X-Proofpoint-GUID: Q9Wh8HcGhOoeKA4Y-6C9HF-J9NHVAtFE
X-Proofpoint-ORIG-GUID: Q9Wh8HcGhOoeKA4Y-6C9HF-J9NHVAtFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_070938_803327_6EA839A6 
X-CRM114-Status: GOOD (  25.20  )
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
Reply-To: rob.clark@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Jul 5, 2025 at 2:55=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On some of the platforms (e.g. SM8250 / QRB5165-RB5) using PRR bits
> resets the device, most likely because of the hyp limitations. Disable
> PRR support on that platform. Instead of adding more compatible checks,
> set PRR-related callbacks through the match data, making it easier for
> other platforms to apply the same workaround.
>
> Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> I currently don't have access to other devices from these generations.
> It might be necessary to apply the same workaround to other platforms.

It appears that a650 is the one special one:

https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/lineag=
e-21/qcom/opensource/graphics-kernel/adreno.c#L1257-L1262
https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/lineag=
e-21/qcom/opensource/graphics-kernel/kgsl_iommu.c#L2657-L2671

so I think we can go with a simpler compatible check

BR,
-R

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 134 ++++++++++++++++++-----=
------
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  11 ++-
>  2 files changed, 91 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..f1cb30cd99af6020a8b472f11=
d4999ad70d0bce0 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -55,6 +55,11 @@ static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_=
device *smmu)
>         return container_of(smmu, struct qcom_smmu, smmu);
>  }
>
> +static const struct qcom_smmu_impl *to_qcom_smmu_impl(const struct arm_s=
mmu_impl *base)
> +{
> +       return container_of(base, struct qcom_smmu_impl, base);
> +}
> +
>  static void qcom_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
>                                 int sync, int status)
>  {
> @@ -313,9 +318,9 @@ static void qcom_smmu_set_actlr_dev(struct device *de=
v, struct arm_smmu_device *
>  static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_do=
main,
>                 struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> -       const struct device_node *np =3D smmu_domain->smmu->dev->of_node;
>         struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>         struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> +       const struct qcom_smmu_impl *qsmmu_impl =3D to_qcom_smmu_impl(smm=
u->impl);
>         const struct of_device_id *client_match;
>         int cbndx =3D smmu_domain->cfg.cbndx;
>         struct adreno_smmu_priv *priv;
> @@ -351,14 +356,8 @@ static int qcom_adreno_smmu_init_context(struct arm_=
smmu_domain *smmu_domain,
>         priv->set_ttbr0_cfg =3D qcom_adreno_smmu_set_ttbr0_cfg;
>         priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
>         priv->set_stall =3D qcom_adreno_smmu_set_stall;
> -       priv->set_prr_bit =3D NULL;
> -       priv->set_prr_addr =3D NULL;
> -
> -       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> -                       of_device_is_compatible(np, "qcom,adreno-smmu")) =
{
> -               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> -               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
> -       }
> +       priv->set_prr_bit =3D qsmmu_impl->set_prr_bit;
> +       priv->set_prr_addr =3D qsmmu_impl->set_prr_addr;
>
>         return 0;
>  }
> @@ -558,65 +557,89 @@ static int qcom_sdm845_smmu500_reset(struct arm_smm=
u_device *smmu)
>         return ret;
>  }
>
> -static const struct arm_smmu_impl qcom_smmu_v2_impl =3D {
> -       .init_context =3D qcom_smmu_init_context,
> -       .cfg_probe =3D qcom_smmu_cfg_probe,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .write_s2cr =3D qcom_smmu_write_s2cr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> +static const struct qcom_smmu_impl qcom_smmu_v2_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_smmu_init_context,
> +               .cfg_probe =3D qcom_smmu_cfg_probe,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .write_s2cr =3D qcom_smmu_write_s2cr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
> +       },
>  };
>
> -static const struct arm_smmu_impl qcom_smmu_500_impl =3D {
> -       .init_context =3D qcom_smmu_init_context,
> -       .cfg_probe =3D qcom_smmu_cfg_probe,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .reset =3D arm_mmu500_reset,
> -       .write_s2cr =3D qcom_smmu_write_s2cr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> +static const struct qcom_smmu_impl qcom_smmu_500_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_smmu_init_context,
> +               .cfg_probe =3D qcom_smmu_cfg_probe,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .reset =3D arm_mmu500_reset,
> +               .write_s2cr =3D qcom_smmu_write_s2cr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
>  #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
> -       .context_fault =3D qcom_smmu_context_fault,
> -       .context_fault_needs_threaded_irq =3D true,
> +               .context_fault =3D qcom_smmu_context_fault,
> +               .context_fault_needs_threaded_irq =3D true,
>  #endif
> +       },
>  };
>
> -static const struct arm_smmu_impl sdm845_smmu_500_impl =3D {
> -       .init_context =3D qcom_smmu_init_context,
> -       .cfg_probe =3D qcom_smmu_cfg_probe,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .reset =3D qcom_sdm845_smmu500_reset,
> -       .write_s2cr =3D qcom_smmu_write_s2cr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> +static const struct qcom_smmu_impl sdm845_smmu_500_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_smmu_init_context,
> +               .cfg_probe =3D qcom_smmu_cfg_probe,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .reset =3D qcom_sdm845_smmu500_reset,
> +               .write_s2cr =3D qcom_smmu_write_s2cr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
>  #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
> -       .context_fault =3D qcom_smmu_context_fault,
> -       .context_fault_needs_threaded_irq =3D true,
> +               .context_fault =3D qcom_smmu_context_fault,
> +               .context_fault_needs_threaded_irq =3D true,
>  #endif
> +       },
> +};
> +
> +static const struct qcom_smmu_impl qcom_adreno_smmu_v2_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_adreno_smmu_init_context,
> +               .cfg_probe =3D qcom_adreno_smmuv2_cfg_probe,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_ba=
nk,
> +               .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
> +               .context_fault_needs_threaded_irq =3D true,
> +       },
>  };
>
> -static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl =3D {
> -       .init_context =3D qcom_adreno_smmu_init_context,
> -       .cfg_probe =3D qcom_adreno_smmuv2_cfg_probe,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_bank,
> -       .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> -       .context_fault_needs_threaded_irq =3D true,
> +static const struct qcom_smmu_impl qcom_adreno_smmu_500_noprr_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_adreno_smmu_init_context,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .reset =3D arm_mmu500_reset,
> +               .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_ba=
nk,
> +               .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
> +               .context_fault_needs_threaded_irq =3D true,
> +       },
>  };
>
> -static const struct arm_smmu_impl qcom_adreno_smmu_500_impl =3D {
> -       .init_context =3D qcom_adreno_smmu_init_context,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .reset =3D arm_mmu500_reset,
> -       .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_bank,
> -       .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> -       .context_fault_needs_threaded_irq =3D true,
> +static const struct qcom_smmu_impl qcom_adreno_smmu_500_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_adreno_smmu_init_context,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .reset =3D arm_mmu500_reset,
> +               .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_ba=
nk,
> +               .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
> +               .context_fault_needs_threaded_irq =3D true,
> +       },
> +       .set_prr_bit =3D qcom_adreno_smmu_set_prr_bit,
> +       .set_prr_addr =3D qcom_adreno_smmu_set_prr_addr,
>  };
>
>  static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *=
smmu,
>                 const struct qcom_smmu_match_data *data)
>  {
>         const struct device_node *np =3D smmu->dev->of_node;
> -       const struct arm_smmu_impl *impl;
> +       const struct qcom_smmu_impl *impl;
>         struct qcom_smmu *qsmmu;
>
>         if (!data)
> @@ -639,7 +662,7 @@ static struct arm_smmu_device *qcom_smmu_create(struc=
t arm_smmu_device *smmu,
>         if (!qsmmu)
>                 return ERR_PTR(-ENOMEM);
>
> -       qsmmu->smmu.impl =3D impl;
> +       qsmmu->smmu.impl =3D &impl->base;
>         qsmmu->data =3D data;
>
>         return &qsmmu->smmu;
> @@ -686,6 +709,13 @@ static const struct qcom_smmu_match_data qcom_smmu_5=
00_impl0_data =3D {
>         .client_match =3D qcom_smmu_actlr_client_of_match,
>  };
>
> +static const struct qcom_smmu_match_data qcom_smmu_500_impl0_noprr_data =
=3D {
> +       .impl =3D &qcom_smmu_500_impl,
> +       .adreno_impl =3D &qcom_adreno_smmu_500_noprr_impl,
> +       .cfg =3D &qcom_smmu_impl0_cfg,
> +       .client_match =3D qcom_smmu_actlr_client_of_match,
> +};
> +
>  /*
>   * Do not add any more qcom,SOC-smmu-500 entries to this list, unless th=
ey need
>   * special handling and can not be covered by the qcom,smmu-500 entry.
> @@ -712,7 +742,7 @@ static const struct of_device_id __maybe_unused qcom_=
smmu_impl_of_match[] =3D {
>         { .compatible =3D "qcom,sm6375-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
>         { .compatible =3D "qcom,sm7150-smmu-v2", .data =3D &qcom_smmu_v2_=
data },
>         { .compatible =3D "qcom,sm8150-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
> -       { .compatible =3D "qcom,sm8250-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
> +       { .compatible =3D "qcom,sm8250-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_noprr_data },
>         { .compatible =3D "qcom,sm8350-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
>         { .compatible =3D "qcom,sm8450-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
>         { .compatible =3D "qcom,smmu-500", .data =3D &qcom_smmu_500_impl0=
_data },
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.h
> index 8addd453f5f1c9659fbfbc68a84a3ab1267b356e..e805ad604339463b706a43e35=
9ccca657d42a602 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -24,10 +24,17 @@ struct qcom_smmu_config {
>         const u32 *reg_offset;
>  };
>
> +struct qcom_smmu_impl {
> +       struct arm_smmu_impl base;
> +
> +       void (*set_prr_bit)(const void *cookie, bool set);
> +       void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
> +};
> +
>  struct qcom_smmu_match_data {
>         const struct qcom_smmu_config *cfg;
> -       const struct arm_smmu_impl *impl;
> -       const struct arm_smmu_impl *adreno_impl;
> +       const struct qcom_smmu_impl *impl;
> +       const struct qcom_smmu_impl *adreno_impl;
>         const struct of_device_id * const client_match;
>  };
>
>
> ---
> base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
> change-id: 20250705-iommu-fix-prr-600451b1d304
>
> Best regards,
> --
> With best wishes
> Dmitry
>

