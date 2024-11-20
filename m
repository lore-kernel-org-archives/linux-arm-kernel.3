Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DD7D711CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 17:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YotYROQz9q7K4a1uqa09vfaK/NLFHZZ6F+0KivLlFwA=; b=dA6iJiVOL8IoMBD5t37YWNAKjf
	fv/QsPU1VAivB9D8nK8d3jOq1R+vqrTrEeLELDJJFOsZh9ebbicrkhijfTvXR+oj4ntCvghOHqdfx
	4kMOA31v4fjyj2c2lSiob8+XBUlubR2JOHuEAFLgf5u8MmhCu71a4JNRjsEKhtBkMARpsXbxMgwzR
	nFT5W5mLb8Mqx0BwHewqg93KaNyJ0+0oLoWHJVyMY/uxQDs+OCyPWqOqFOOv5wY8Hm1ndUnucwplu
	895KKgtFp0UrGlauO6IY4cfmSUzvtTiR7RikmtHzoCCKpVnOtiQ+8w7IYUXo5aXzFn6KrZbLTzwZw
	xteOAArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDoLo-0000000Fu59-2px2;
	Wed, 20 Nov 2024 17:18:48 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDoKr-0000000FtyP-3okL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 17:17:51 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-83ab00438acso34827239f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 09:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732123068; x=1732727868; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YotYROQz9q7K4a1uqa09vfaK/NLFHZZ6F+0KivLlFwA=;
        b=IXeg96dzOaIE1SX91ChtDf0gn+lS1b5xY/p51dKrSVitnpJxd3reQzE3faLojJzi7S
         w4LnT7fPgdzZoHbDLJM/UgW4BCGiuLkt+dfuPEdvcgFmpzEGoBZfxoBYU0ps/CN/6HAl
         AD42ufdgCi51oNDCaTUHxO//JGRmSFWX9hXZQZKNWfg7ii1/+8y5jGnUsN0965F37m0Z
         ieYhaVE8ZvnLXp2LhNXAqOJZG+QN06yUrLRZ486gcgZMNIArTd0xGdfUtqw66Nw44wLd
         tGGrazE44ayTepdTpeceUhPNaVdGvGUfp5Byu17n7fUihTdjvlR/8Tx6BoM5NulrNr1I
         I0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732123068; x=1732727868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YotYROQz9q7K4a1uqa09vfaK/NLFHZZ6F+0KivLlFwA=;
        b=o7FMYBmcWbYLZDBCcREjOhUltmTlTSsy7tlxyU7evpfQk4qdD2XXUWoIrPkEowrloB
         E/fYJBk8nntXbETR+SVy/npMSVS2cN89Nhl+n0q7CmAPFdUZU7QR6SEaxj8Y5sNC0OeO
         UuxL07J+Vvuh1Z+RVSmFl0/FZPKksI1/AhGpRuEm7zQGy0pqs/Nb88bLFV/GTtBmjip2
         bbdmWLOtWLKgGQJvkhiD+UlbH/PqlzxTE85HIIQs+C+IPefnA4pl5Z+ZdYkIQ+rDQgk7
         5k+/XtSJ8IIpbVYYXuRa0gGKDbbBK+VKcgNwh/h2vBKK6Li/Fh2dyyHyfZgqmDvpdInN
         +7cA==
X-Forwarded-Encrypted: i=1; AJvYcCVgensMFxdITefZY0pm48SZC+RLtRZwmkW58wNjrzCnb+VVApqO3nFSsmDsNZeWNUXzPjuQka7/BqsxVIA/2CU7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1gNNBoRVuE7hJl3TeN5YkXgzLSlJg3w1okttvaVqitKvp4gSR
	SfV2O0ZALFkEKUawJf6K8FHUSXOao9wuxwB8ApWkxugxQwLzkCCW3rW4Vh11ZIQCyiLcJmTsdfj
	HKLEOqJu5wTzqdHNz7Oe1TKIXKhY=
X-Google-Smtp-Source: AGHT+IEQqACmV5bTss4ZQRq/AUvYO6p57dtsbTHt1WKWyBcA2XHLrvjSK/y820pL7jrWk7vayySKaeaXQiBG13rvst4=
X-Received: by 2002:a05:6602:15d5:b0:83a:ac2a:922 with SMTP id
 ca18e2360f4ac-83ec1a2e6bcmr12202939f.7.1732123068356; Wed, 20 Nov 2024
 09:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com> <20241114160721.1527934-4-quic_bibekkum@quicinc.com>
In-Reply-To: <20241114160721.1527934-4-quic_bibekkum@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Nov 2024 09:17:36 -0800
Message-ID: <CAF6AEGuwWsAkRyF-h5Aj3KzM7iksb12HsfJ5Ks+-P8hv60MWFg@mail.gmail.com>
Subject: Re: [PATCH RESEND v17 3/5] iommu/arm-smmu: add support for PRR bit setup
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_091749_954832_1B1E40C4 
X-CRM114-Status: GOOD (  27.44  )
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

On Thu, Nov 14, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> Add an adreno-smmu-priv interface for drm/msm to call
> into arm-smmu-qcom and initiate the PRR bit setup or reset
> sequence as per request.
>
> This will be used by GPU to setup the PRR bit and related
> configuration registers through adreno-smmu private
> interface instead of directly poking the smmu hardware.
>
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>  include/linux/adreno-smmu-priv.h           | 14 ++++++++
>  3 files changed, 53 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index d26f5aea248e..0e4f3fbda961 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -16,6 +16,8 @@
>
>  #define QCOM_DUMMY_VAL -1
>
> +#define GFX_ACTLR_PRR          (1 << 5)
> +
>  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>  {
>         return container_of(smmu, struct qcom_smmu, smmu);
> @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_translation(const=
 void *cookie, bool termina
>         arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>  }
>
> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
> +{
> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> +       u32 reg =3D 0;
> +
> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
> +       reg &=3D ~GFX_ACTLR_PRR;
> +       if (set)
> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> +}
> +
> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_=
t page_addr)
> +{
> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +
> +       writel_relaxed(lower_32_bits(page_addr),
> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
> +
> +       writel_relaxed(upper_32_bits(page_addr),
> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
> +}
> +
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
>
>  static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_=
device *smmu)
>  static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_do=
main,
>                 struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> +       const struct device_node *np =3D smmu_domain->smmu->dev->of_node;
>         struct adreno_smmu_priv *priv;
>
>         smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D true;
> @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(struct arm_=
smmu_domain *smmu_domain,
>         priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
>         priv->set_stall =3D qcom_adreno_smmu_set_stall;
>         priv->resume_translation =3D qcom_adreno_smmu_resume_translation;
> +       priv->set_prr_bit =3D NULL;
> +       priv->set_prr_addr =3D NULL;
> +
> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> +                       of_device_is_compatible(np, "qcom,adreno-smmu")) =
{

fwiw, it seems like PRR actually works on sc7180, which is _not_
mmu-500, so I guess the support actually goes back further.

I'm curious if we can just rely on this being supported by any hw that
has a6xx or newer?

BR,
-R

> +               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> +               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
> +       }
>
>         return 0;
>  }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index e2aeb511ae90..2dbf3243b5ad 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
>  #define ARM_SMMU_SCTLR_M               BIT(0)
>
>  #define ARM_SMMU_CB_ACTLR              0x4
> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
>
>  #define ARM_SMMU_CB_RESUME             0x8
>  #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu=
-priv.h
> index c637e0997f6d..614665153b3e 100644
> --- a/include/linux/adreno-smmu-priv.h
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
>   *                 the GPU driver must call resume_translation()
>   * @resume_translation: Resume translation after a fault
>   *
> + * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL termina=
ted for
> + *             targets without PRR support. Exercise caution and verify =
target
> + *             capabilities before invoking these callbacks to prevent p=
otential
> + *             runtime errors or unexpected behavior.
> + *
> + * @set_prr_bit:   Extendible interface to be used by GPU to modify the
> + *                ACTLR register bits, currently used to configure
> + *                Partially-Resident-Region (PRR) bit for feature's
> + *                setup and reset sequence as requested.
> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
> + *                physical address of PRR page passed from
> + *                GPU driver.
>   *
>   * The GPU driver (drm/msm) and adreno-smmu work together for controllin=
g
>   * the GPU's SMMU instance.  This is by necessity, as the GPU is directl=
y
> @@ -67,6 +79,8 @@ struct adreno_smmu_priv {
>      void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_=
info *info);
>      void (*set_stall)(const void *cookie, bool enabled);
>      void (*resume_translation)(const void *cookie, bool terminate);
> +    void (*set_prr_bit)(const void *cookie, bool set);
> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
>  };
>
>  #endif /* __ADRENO_SMMU_PRIV_H */
> --
> 2.34.1
>

