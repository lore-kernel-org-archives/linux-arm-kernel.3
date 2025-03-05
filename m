Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B39C28B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0rwdbOsrvhVQWkD+6wv4GBig+hVeZ1WlsuKcRFEC24=; b=norZoM3RiI2m69vcAo5WWVrv+5
	tuGfx6pyOhKD5RxRZOxQ3cREZB/fOCKffswPnsA1AY+hzUv5B1fX8OrWNVUqA3zARbcrDCn2cKUXZ
	9MR/BUdiFWleV8nA5J6AL1I1mhiqve8gn6clWrCMpJNMwjInWCHKAu6tAMTnm2uWJqwn74oyF+zqH
	ysGhQdzFga967vohoewxvEjkiYWLzC+XH6+6NcxwZuxCaAe6QT6MX9nsxEIsm1NLPpb7s9+fsa3Jk
	dEjxNF/u/l+kgXjxT5NpjnggiPo6/8KOowy7SEorSu/u5EIOPEm1KG7EtcB8xiGriSz5ZUjE+v2Qu
	//hshJRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvfb-00000009GWS-0hSQ;
	Wed, 05 Mar 2025 20:48:47 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpu6v-000000091sm-11rc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:08:54 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3d2f5a932f5so23484835ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741201732; x=1741806532; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0rwdbOsrvhVQWkD+6wv4GBig+hVeZ1WlsuKcRFEC24=;
        b=cBJDICTpLgIE4AVum/6EIedZGE8ztXD8zFK/2sYHLCBN75n38FisaxQpiNNxNVJ47e
         cCYaD4WduktSyV+WVT8UZeuQigO/PonP351fEyOtlwaEGcECfP2rMviSySQr/VevJSTG
         KchUmqTvG0lPl8lSYSqEGOm6biGjDBnCAp2HtEjylGvGkEPgEuuloFaQ8eoFc8DN6JcO
         UqY9524DZ0dF7tOBxNTKTyYEnB5aR+OwtBgaSOguU/b8QoMGdVumK+yAlrGytWO5BqcV
         KJiWgwCv6ODN726QH/Lu5FBYdT0vTJNKN0jiDBSGMhwRnHZT64mhFA4wkSWS+lyjnmvx
         UJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201732; x=1741806532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0rwdbOsrvhVQWkD+6wv4GBig+hVeZ1WlsuKcRFEC24=;
        b=uLipyTrviI74FMebfk6uCTqdSBcxIMXIwu+65RIdmqvAzYbq3hw237gO9heqXOmE/p
         I+63fGpZYAxrF467KrtTTRXD9H0EaHKQqK1oaizyBF3DgMgaHCN646IQ/yi8rgtvuQJq
         ErTipVGSzX7Lydmb+wML7h4jPDiEjNaMetUEXPyHsZbCSuz8e2qxryKAZ2lxIjlQXx/p
         BSkC75TPCzS3AksTWPDwlYhYUK73oIqq8Xju10oy3cW6sT/rVThrbKpHa1smLKtDSYqU
         rWjhgFaz/f03iL+1YJtXRDMvl9VVUs4g5F+kHvyp83hRHjtXWVy1i3u4Drrd1yafY/Rf
         3E4g==
X-Forwarded-Encrypted: i=1; AJvYcCWST5XVR6Uoy9QBGjNVYsRySuzygzYh0KljJlTbu0nbPBZPnXdjcwD+FMAG9yTJ1+j2WylGTs26T37y90TW+JsQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxyNeMPvpwUKhrMwcxFBwwo463g+2C6tC6Lp/B8V9DhmI+mHe4w
	pTKzopFbX48eiENnTjY+9/MVV2YHdd5foGyDzrzUfEenzFVoUtDFeIZZ8nSgQSbGCa6mWIYwKps
	yEeQ+BpCfOc+tymIXnKh03wZHmPc=
X-Gm-Gg: ASbGnctpqiglAlgebTLTNAoE/QtjiGejbUpAC5hw2iMUpRsT4KdOtk1b6iADl4Hfg0u
	JqkRzZqAAs0nHFZoAWYmCkJH2kpvU6q+r5LCIsJKA8ErtN/x446qMNZdV8ddwDtcfuRBX3nzhZY
	q/xxRE6ZTc7oKqW90wBWc78QDf3A==
X-Google-Smtp-Source: AGHT+IGKqFB68VbJCdjMZhHRQpbk0T6xNTpyv7D0PC3oDuNU1RuVIo7za2nmnastCLN4xv3VgbROaNLz10jhsmRGJtk=
X-Received: by 2002:a05:6e02:1ca5:b0:3d3:f27a:9104 with SMTP id
 e9e14a558f8ab-3d42b87d366mr55414225ab.3.1741201731910; Wed, 05 Mar 2025
 11:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com> <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:08:39 -0800
X-Gm-Features: AQ5f1Jrw9lGRpl9F6jcnDiNBl5g1M5MC8H0JX8l57Dd5AI53ivtmLQ11CYhZEew
Message-ID: <CAF6AEGsd2DcdGdLX67RDNob9aev8wojwzyMqgwxMmN4RZiJKrA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers directly
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
X-CRM114-CacheID: sfid-20250305_110853_284449_B8FFAA66 
X-CRM114-Status: GOOD (  23.73  )
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
> In some cases drm/msm has to resume a stalled transaction directly in
> its fault handler. Experimentally this doesn't work on SMMU500 if the
> fault hasn't already been acknowledged by clearing FSR. Rather than
> trying to clear FSR in msm's fault handler and implementing a
> tricky handshake to avoid accidentally clearing FSR twice, we want to
> clear FSR before calling the fault handlers, but this means that the
> contents of registers can change underneath us in the fault handler and
> msm currently uses a private function to read the register contents for
> its own purposes in its fault handler, such as using the
> implementation-defined FSYNR1 to determine which block caused the fault.
> Fix this by making msm use the register values already read by arm-smmu
> itself before clearing FSR rather than messing around with reading
> registers directly.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
>  3 files changed, 27 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 6372f3e25c4bc24cb52f9233095170e8aa510a53..186d6ad4fd1c990398df4dec5=
3f4d58ada9e658c 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -62,16 +62,15 @@ static void qcom_adreno_smmu_get_fault_info(const voi=
d *cookie,
>                 struct adreno_smmu_fault_info *info)
>  {
>         struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> -       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> -       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> -
> -       info->fsr =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR)=
;
> -       info->fsynr0 =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_F=
SYNR0);
> -       info->fsynr1 =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_F=
SYNR1);
> -       info->far =3D arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR=
);
> -       info->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNR=
A(cfg->cbndx));
> -       info->ttbr0 =3D arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_T=
TBR0);
> -       info->contextidr =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_=
CB_CONTEXTIDR);
> +       struct arm_smmu_context_fault_info *cfi =3D &smmu_domain->cfi;
> +
> +       info->fsr =3D cfi->fsr;
> +       info->fsynr0 =3D cfi->fsynr0;
> +       info->fsynr1 =3D cfi->fsynr1;
> +       info->far =3D cfi->iova;
> +       info->cbfrsynra =3D cfi->cbfrsynra;
> +       info->ttbr0 =3D cfi->ttbr0;
> +       info->contextidr =3D cfi->contextidr;
>  }
>
>  static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index a9213e0f1579d1e3be0bfba75eea1d5de23117de..498b96e95cb4fdb67c246ef13=
de1eb8f40d68f7d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -453,26 +453,26 @@ void arm_smmu_print_context_fault_info(struct arm_s=
mmu_device *smmu, int idx,
>
>  static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  {
> -       struct arm_smmu_context_fault_info cfi;
>         struct arm_smmu_domain *smmu_domain =3D dev;
> +       struct arm_smmu_context_fault_info *cfi =3D &smmu_domain->cfi;
>         struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>         static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
>                                       DEFAULT_RATELIMIT_BURST);
>         int idx =3D smmu_domain->cfg.cbndx;
>         int ret;
>
> -       arm_smmu_read_context_fault_info(smmu, idx, &cfi);
> +       arm_smmu_read_context_fault_info(smmu, idx, cfi);
>
> -       if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
> +       if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
>                 return IRQ_NONE;
>
> -       ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> -               cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE :=
 IOMMU_FAULT_READ);
> +       ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi->iova,
> +               cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE =
: IOMMU_FAULT_READ);
>
>         if (ret =3D=3D -ENOSYS && __ratelimit(&rs))
> -               arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> +               arm_smmu_print_context_fault_info(smmu, idx, cfi);
>
> -       arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> +       arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
>         return IRQ_HANDLED;
>  }
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a7033833716635ef=
b3968a0bd3ff237 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
>         ARM_SMMU_DOMAIN_NESTED,
>  };
>
> +struct arm_smmu_context_fault_info {
> +       unsigned long iova;
> +       u64 ttbr0;
> +       u32 fsr;
> +       u32 fsynr0;
> +       u32 fsynr1;
> +       u32 cbfrsynra;
> +       u32 contextidr;
> +};
> +
>  struct arm_smmu_domain {
>         struct arm_smmu_device          *smmu;
>         struct io_pgtable_ops           *pgtbl_ops;
> @@ -380,6 +390,7 @@ struct arm_smmu_domain {
>         const struct iommu_flush_ops    *flush_ops;
>         struct arm_smmu_cfg             cfg;
>         enum arm_smmu_domain_stage      stage;
> +       struct arm_smmu_context_fault_info cfi;
>         struct mutex                    init_mutex; /* Protects smmu poin=
ter */
>         spinlock_t                      cb_lock; /* Serialises ATS1* ops =
and TLB syncs */
>         struct iommu_domain             domain;
> @@ -541,16 +552,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct a=
rm_smmu_device *smmu);
>  void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
>  int arm_mmu500_reset(struct arm_smmu_device *smmu);
>
> -struct arm_smmu_context_fault_info {
> -       unsigned long iova;
> -       u64 ttbr0;
> -       u32 fsr;
> -       u32 fsynr0;
> -       u32 fsynr1;
> -       u32 cbfrsynra;
> -       u32 contextidr;
> -};
> -
>  void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int =
idx,
>                                       struct arm_smmu_context_fault_info =
*cfi);
>
>
> --
> 2.47.1
>

