Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ADDC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iKupqP90kjHe611IT/Qp+RTzNpRKLP4Ly+rzhT8HFQ=; b=J3Yogo8Dix8PHFozAyBTs7OGtc
	sxCSvba5m+RARf3bPz/KWLPMN6ILCnf62cc2ptun2+LDGeslj4/BmFhLpdqyh05ecvY9jgn51bHMr
	2K2kKq2wakBmQRBz50lIPe1l9ovj4nADZnfDSzU5PeHDyfoFA9gpt8W+QXrXV3K0baJZJT4oiFK8H
	w560yhiQTne3Zkahy6yKhY0/x277/Nkicfp/KrYL8Kj7YSxdYLLGQWPNHcJQOvdcGijfexzOLXYpt
	1bp+0FzhoYo0yo1VHCS+tAa54CzZxRtCCC2QCLq+AUguhM9XzeNR4/7pMqK3DdC1YAR4w6Dc/Q89H
	0TOj9VeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvfb-00000009GWr-39Gt;
	Wed, 05 Mar 2025 20:48:47 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpu7P-000000091xT-1RME
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:09:24 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3ce868498d3so22995205ab.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741201762; x=1741806562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iKupqP90kjHe611IT/Qp+RTzNpRKLP4Ly+rzhT8HFQ=;
        b=aZvRQIwl4JcKFXxDGAJoSUvHKGFlnfqXrNjKtEue8t5p4ZTVU+GWjyNKTgmV9ZkPyi
         592NJcPPAGxspF0z9vq1Rrh3OYEJqiN/83cJFeoLHkh3DARKYm/JBbJMbEHxrrItXPcU
         HR+nKT8fgZL4RdH7N2hmSniEceantZd82rR/8sEz4QJ8kVoacGlpLlPj7CSkhyiAFI6y
         9meON0+tK1ryNfD/qaLMv8lvia/QNxMBDkZVuasbZ6+gg4jCrq8Hy4SSWXdhl8S+3bsD
         CPh9Ws+y5CfVk/TvL/ZtdZeQnByUHfnbFHtowgF5Vu0NqufEp2NCVhbevKD+t8YJ+BDr
         riOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201762; x=1741806562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iKupqP90kjHe611IT/Qp+RTzNpRKLP4Ly+rzhT8HFQ=;
        b=bCMx2V2ezBnyuu1FiRGarw5qy9i3L5epxU/mDEgCcp8CkQhsPiMDM2foAR4UC0QO+i
         UV4QS3i7iDUpv8QeflOgXTcTJxhnttzoGh+Ao5fuSFd5dXkZNoYCXjFcgUO1SMQvCtmW
         fOebjHHajSlaWQPdMwSBjyj9HKsJsuZPSLaII8SKDKHQYhYgtd3T1nrU1/xSrHPD3as4
         hwiFzIrrKWcbBKVbnTfYq6yzbGuypCy0uDuvYecj26/m+yI0uL7leATyL5RslsV53BNn
         Xr3QtRg5XIDggVG61R1lkx6akU4Nlnwd7fNz7Tr6R/2aVqk4M+bulCF67juZj95sOu/I
         tVvw==
X-Forwarded-Encrypted: i=1; AJvYcCUk62GvGkI4k2MXVJtHv79Ek+2pq0+JQz5ObnqlQ7dS/KSgnM0xovPLa6TAT/Xi4DCgDUy3YmE8hsSaO5+cuDyG@lists.infradead.org
X-Gm-Message-State: AOJu0YwGc/44SXFK5GZYYq//Gwoy6LeKz/ar5PTLcl9qsxNxm+NYf3sq
	6QO+yd570mssvzpZ/vVtWgb26JRUhClehD4BiUbk3/3yTIUKqf03Qi9ZEK9hVDU6BHcCfea1v5f
	JFqE3+CVzK86lCQONndvljEXmRns=
X-Gm-Gg: ASbGncvWPgxEcKLVKcCDdGd/0B0pL+SSdy85g+ZfNoY8bw04lB9f+BOSTEoco+98d+j
	DfcWdyp7tYvWoKBqYM5JAr/Pqcpidoz/fa7hZO4Ktu8TBdUrf9IjWlX4dicAt7J0Q/u2Pkyffz4
	riMpyOWRsA2QeU7jxtn3H04EUigw==
X-Google-Smtp-Source: AGHT+IHXSq8mWw3KY8YoLCBCIFRQJmRjg67dMe+0ZPdRqaHGrvPtLaHOP4skAGzoNpcXGSt7lkAets5eLSq4yACekVE=
X-Received: by 2002:a05:6e02:1a6b:b0:3d1:78f1:8a9e with SMTP id
 e9e14a558f8ab-3d42b9aca8dmr52094955ab.20.1741201762171; Wed, 05 Mar 2025
 11:09:22 -0800 (PST)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com> <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:09:10 -0800
X-Gm-Features: AQ5f1Jq4dtaQy1zNSNrep0WaI-YiXYB1_xIUUY21RnpPU0GevSqQZgpgVwJN9cQ
Message-ID: <CAF6AEGvPvQuptuA07kDYdUDQh4iQA=g+c3t0OCjR1HfWZ6mSbg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_110923_382640_87FEBAEE 
X-CRM114-Status: GOOD (  16.90  )
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

On Tue, Mar 4, 2025 at 8:57=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> This will be used by drm/msm for GPU page faults, replacing the manual
> register reading it does.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 +++++++++++++-----=
------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
>  3 files changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f539557a=
39866a932360d4e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *de=
v)
>
>         if (list_empty(&tbu_list)) {
>                 ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cf=
i.iova,
> -                                        cfi.fsynr & ARM_SMMU_CB_FSYNR0_W=
NR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +                                        cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_=
WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>
>                 if (ret =3D=3D -ENOSYS)
>                         arm_smmu_print_context_fault_info(smmu, idx, &cfi=
);
> @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *de=
v)
>         phys_soft =3D ops->iova_to_phys(ops, cfi.iova);
>
>         tmp =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> -                                cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOM=
MU_FAULT_WRITE : IOMMU_FAULT_READ);
> +                                cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IO=
MMU_FAULT_WRITE : IOMMU_FAULT_READ);
>         if (!tmp || tmp =3D=3D -EBUSY) {
>                 ret =3D IRQ_HANDLED;
>                 resume =3D ARM_SMMU_RESUME_TERMINATE;
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75=
eea1d5de23117de 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smm=
u_device *smmu, int idx,
>                                       struct arm_smmu_context_fault_info =
*cfi)
>  {
>         cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> +       cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
>         cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -       cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +       cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +       cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
>         cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA=
(idx));
> +       cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTE=
XTIDR);
>  }
>
>  void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int=
 idx,
> @@ -419,7 +422,7 @@ void arm_smmu_print_context_fault_info(struct arm_smm=
u_device *smmu, int idx,
>  {
>         dev_err(smmu->dev,
>                 "Unhandled context fault: fsr=3D0x%x, iova=3D0x%08lx, fsy=
nr=3D0x%x, cbfrsynra=3D0x%x, cb=3D%d\n",
> -               cfi->fsr, cfi->iova, cfi->fsynr, cfi->cbfrsynra, idx);
> +               cfi->fsr, cfi->iova, cfi->fsynr0, cfi->cbfrsynra, idx);
>
>         dev_err(smmu->dev, "FSR    =3D %08x [%s%sFormat=3D%u%s%s%s%s%s%s%=
s%s], SID=3D0x%x\n",
>                 cfi->fsr,
> @@ -437,15 +440,15 @@ void arm_smmu_print_context_fault_info(struct arm_s=
mmu_device *smmu, int idx,
>                 cfi->cbfrsynra);
>
>         dev_err(smmu->dev, "FSYNR0 =3D %08x [S1CBNDX=3D%u%s%s%s%s%s%s PLV=
L=3D%u]\n",
> -               cfi->fsynr,
> -               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr),
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : ""=
,
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
> -               (cfi->fsynr & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
> -               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr));
> +               cfi->fsynr0,
> +               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr0),
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : "=
",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
> +               (cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
> +               (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr0));
>  }
>
>  static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> @@ -464,7 +467,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, vo=
id *dev)
>                 return IRQ_NONE;
>
>         ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> -               cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : =
IOMMU_FAULT_READ);
> +               cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE :=
 IOMMU_FAULT_READ);
>
>         if (ret =3D=3D -ENOSYS && __ratelimit(&rs))
>                 arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index e2aeb511ae903302e3c15d2cf5f22e2a26ac2346..d3bc77dcd4d40f25bc70f3289=
616fb866649b022 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -543,9 +543,12 @@ int arm_mmu500_reset(struct arm_smmu_device *smmu);
>
>  struct arm_smmu_context_fault_info {
>         unsigned long iova;
> +       u64 ttbr0;
>         u32 fsr;
> -       u32 fsynr;
> +       u32 fsynr0;
> +       u32 fsynr1;
>         u32 cbfrsynra;
> +       u32 contextidr;
>  };
>
>  void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int =
idx,
>
> --
> 2.47.1
>

