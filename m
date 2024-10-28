Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6328BD5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9okxa3Q0g0QmicSYuvHmUoOcciSTa4JWfgy8EOP1LU=; b=KZF1Ua0kE5cuRt+JFJLl87uchz
	ePkv1kurwKhF3EQndylrehYRUfCk5hBBSV0GcQjRbg/0sM5KQ7WpV9jtCPXpUfYWfaENyV87NTC8T
	6RXoytdJF69wXnreGieMcXosF51fGvj+ihxqrN3dk1M7fFLU9me4iRFT2x/z3GVl61YDXheuRjOiZ
	BXu0aTjrx0c5UiAwpW/NkITD6CooqDZdvGiqG5IBD4CvXuWssLgjHhzg+WYEnJfLgCxAxa8ZSNPuc
	F5ZJaBKDs0taMDhk+cWCjyxPqQAIS8jzMaqRyV6blZcGYYeAi/o4NwubUzv8dTy47rB1jsNGBaphF
	lg0avB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XC3-0000000CK51-1Bgp;
	Mon, 28 Oct 2024 21:22:31 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5X3u-0000000CIt9-1Rv8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 21:14:07 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3a4dc2fff04so16132005ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730150045; x=1730754845; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9okxa3Q0g0QmicSYuvHmUoOcciSTa4JWfgy8EOP1LU=;
        b=ONyuWKk8cbwYBDkWGNXRNu+uspH6vZNaVihH9a8gqsc4mKe71278ZM1dC7mS22+Dhm
         lLmqx4ZpBQltdBw005l9bUadztj6RGIzAsxLDD1/alvP5tiolfD7tYMSDr9eNpticMFp
         Jw3OLAAlIqmyDrmG79k1iWJjUR7i4eID6dlxE44Bb+k06e4UUQzIQ5mY5YJhzoc0qVCR
         IUGg5RW9VQknjr5FrAz1Qzf9zwfvXHuRD/1ZeKtPQYTSilNSQz9SwbeIzwFcl5prd4J+
         bziRyyqxxZaiQmzClNbWuUjbvzhJgx2dvpmbnSgMDZgkBFUN7UKErTxrHCkb7zEC1Pml
         o91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730150045; x=1730754845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9okxa3Q0g0QmicSYuvHmUoOcciSTa4JWfgy8EOP1LU=;
        b=aSJRNuXjSVYdAb7JZkgGG/Vmi8/OReHnUOROj4X3P5DKlRts645/1ryReb5XQA9vCp
         lbuDrMZgOnzAzxPkYb7TLgKjW2eY+4rfYYWkWunAr5oUvdjzepd3OYMtqNQCTij4JOSC
         erQjpO8UpFidMFphHjvMsqfDg6maD/aHd8y0jm8Xr6oKUNXkMPF0oZEbFN/YKqxP/fSB
         VLkem8YFCUZDJxcaPm63iw3t9odQc6umFlnGO/JybtqbqxrYJbweiWZRh+oNKDT8EKWg
         fd1VbXgaiOkDVsv21cKjuowICGjcgqyQJ0PbKg12O2X7YP/Ldz/7Y6TC+p+TfJwVgjP0
         U0cg==
X-Forwarded-Encrypted: i=1; AJvYcCUTipq8BQD4XA8rsxW3DLbhkBhHR7jnsID9kdQQyqcDLWS9Yrzjrm3L/byLhs+ydDS/632HvRKo9xO9sd3VLi6j@lists.infradead.org
X-Gm-Message-State: AOJu0YzXKmPrB/kycutMfjXn28Wmgch6dgVUXsyqg6/QWeKOhav4nTyJ
	Kd/S/NOq9dkZNPWRp6hyDzKQx41qGOrtiYHWBmHzRkyJzBvcAp0Xwhm8D3q+K1vBxruNfWC1xPs
	dZjtVyuBSzabO/DYGNOwmeQGsymI=
X-Google-Smtp-Source: AGHT+IEoro3zvUNoTUS9DRoCkr30RdGb4Txbh508oi+qXOwLzunjNjeXZW5mwOUVMfFBSM2AC0IlmPQVR59TYAjtfdc=
X-Received: by 2002:a05:6e02:3dc2:b0:3a0:9f85:d74f with SMTP id
 e9e14a558f8ab-3a4ed338581mr88116405ab.16.1730150044912; Mon, 28 Oct 2024
 14:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com> <20241008125410.3422512-4-quic_bibekkum@quicinc.com>
In-Reply-To: <20241008125410.3422512-4-quic_bibekkum@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Oct 2024 14:13:53 -0700
Message-ID: <CAF6AEGst2uOosTiu63mr95w=Km1bMEQbryxEAGRpiUKqr_rM-g@mail.gmail.com>
Subject: Re: [PATCH v16 3/5] iommu/arm-smmu: add support for PRR bit setup
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_141406_427123_5DD6C50E 
X-CRM114-Status: GOOD (  26.57  )
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

On Tue, Oct 8, 2024 at 5:54=E2=80=AFAM Bibek Kumar Patro
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

Reviewed-by: Rob Clark <robdclark@gmail.com>

> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>  include/linux/adreno-smmu-priv.h           | 10 +++++-
>  3 files changed, 48 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 6e0a2a43e45a..38ac9cab763b 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -25,6 +25,7 @@
>
>  #define CPRE                   (1 << 1)
>  #define CMTLB                  (1 << 0)
> +#define GFX_ACTLR_PRR          (1 << 5)
>
>  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>  {
> @@ -109,6 +110,40 @@ static void qcom_adreno_smmu_resume_translation(cons=
t void *cookie, bool termina
>         arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>  }
>
> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
> +{
> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       const struct device_node *np =3D smmu->dev->of_node;
> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> +       u32 reg =3D 0;
> +
> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> +                       of_device_is_compatible(np, "qcom,adreno-smmu")) =
{
> +               reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_A=
CTLR);
> +               reg &=3D ~GFX_ACTLR_PRR;
> +               if (set)
> +                       reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> +               arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, re=
g);
> +       }
> +}
> +
> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_=
t page_addr)
> +{
> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       const struct device_node *np =3D smmu->dev->of_node;
> +
> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> +                       of_device_is_compatible(np, "qcom,adreno-smmu")) =
{
> +               writel_relaxed(lower_32_bits(page_addr),
> +                                       smmu->base + ARM_SMMU_GFX_PRR_CFG=
_LADDR);
> +
> +               writel_relaxed(upper_32_bits(page_addr),
> +                                       smmu->base + ARM_SMMU_GFX_PRR_CFG=
_UADDR);
> +       }
> +}
> +
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
>
>  static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> @@ -249,6 +284,8 @@ static int qcom_adreno_smmu_init_context(struct arm_s=
mmu_domain *smmu_domain,
>         priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
>         priv->set_stall =3D qcom_adreno_smmu_set_stall;
>         priv->resume_translation =3D qcom_adreno_smmu_resume_translation;
> +       priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> +       priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
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
> index c637e0997f6d..03466eb16933 100644
> --- a/include/linux/adreno-smmu-priv.h
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -49,7 +49,13 @@ struct adreno_smmu_fault_info {
>   *                 before set_ttbr0_cfg().  If stalling on fault is enab=
led,
>   *                 the GPU driver must call resume_translation()
>   * @resume_translation: Resume translation after a fault
> - *
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
> @@ -67,6 +73,8 @@ struct adreno_smmu_priv {
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

