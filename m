Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5185C28B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MaiMyt+dgXQn1FXtXZ4qzvS0McmvnfMbhAjNl5s0fqs=; b=YklrTtJ9Lyh4l3GQSar+v3cpU8
	P5RrHddt95tELxOhEPWG01yBRJU0q7qSTjmykMUWBz+HiCddQKa+d3tj+nlngDUCjfEJahwoQbZu/
	+fkFa6p0OLQfgzatsTWjFB/cemOymNrS5Cr4H0ai8U+vk3QYJNJ3oJigQ8XKeyPir2y0vPipPpAWx
	KSZ2Odw670id6ptxPJBHqmLd2oI5FfVIOXUEj3563nYHXfcxDwGphO/Q3Bsw5+KY5xYst/R7owRWq
	wdKJKZ5sOBTn71v7p2SzO68PAlogDhSLtutwofY5Zu7FALNI1AnGvSXsmkgKVE39VptXrXfZImqEx
	cyRoh6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvfc-00000009GXf-45QK;
	Wed, 05 Mar 2025 20:48:48 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpu86-0000000922K-1KOv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:10:08 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3d03d2bd7d2so66209085ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741201805; x=1741806605; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaiMyt+dgXQn1FXtXZ4qzvS0McmvnfMbhAjNl5s0fqs=;
        b=SRTd4hCEkPQcYFDnY8Gno+4LOcRnuRwpUBwN8GnVcBVonyWxhj6jAzhfj41QgOS3X5
         EEB7+m4rD60kFkrv+80CaGSwmbhb3Mhn7/w1NPQoLo8kF645Hg6MTfodE6cP1ffpIydV
         82KndyAxeInrKhVCaT1rl2r8FhmdbF7xVvVTc4/sVjeVjrjxWj7r2Wytu4tnYwW1iIgr
         uksPJg0pZ7m6NWRkTQ3P6vRISkG2fMOCDxYMgDNuCo+55At/o3YVKNOQSnpl8fn+7ZUn
         rBXXTA35lSfVAaJ/pCiFX+I24V0z/CdFIANLCbPfZxDuBKJuwybB9efimyRzX2jxq5K+
         QS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201805; x=1741806605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaiMyt+dgXQn1FXtXZ4qzvS0McmvnfMbhAjNl5s0fqs=;
        b=UTTI0sl28xGdY5joYjqvlMe9s7PK2FMUs8QFIuVKM0eZ6n3tXnSIivcfLeQAhrMz2e
         igeThdZOsXwIOPOvmOP8urfYmqtxIMbZdg/saAOhmt13tZt/EgE4e795+q9IfsXJLFaR
         QoQrAEHC/49YEXDfvo5eMfywn0OppBT1/SYvnWFDAEsBBeQ7lO0r4x1qN6Ow0GusHm1L
         J9K16+e8C1qTPmqNR96LxvjKn1fA57E431OP3da02rKnbyAYAitXkBG/ZM+bR8Sy0KaR
         xriMsLe0KkNRIzO8RP6U3rp8K6etYciaUZC6MJLPV1KwO8qTRFX+L1cB4p/7NBQmcIGy
         omCw==
X-Forwarded-Encrypted: i=1; AJvYcCWGE0EOgiA2RFUJMUkpfa6havOulFTPje5jhuEQ8PTh3WpV5/fdsv0vZaXf2Kdo9VnA/7SCW/YWgD6BaYwwdyNi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7PDiKmMJdAafoturLmcZhjbh/yvJNwTo/L5qGMmAOk8yuJ8ao
	ebBWPi7Pe8nRloQZ/sFaJKP2H4yIm0Pp3/9xUqHDREwmnXTvlPBtW3R5WpkOkS4MDYGy58CNN/f
	NrZP8p+XK/+TOGsi13o1Bpgpo8Fc=
X-Gm-Gg: ASbGncvVJ4oYxHmgA3PEMvfIcO4VozfX2Tr1EaKex3liA9UodEDl6/ua15Ah6/2g9Nv
	LP3y9LwS8Xz4onLSG2NYMCFlJw/2EBu4uqsbklpvqZ5G5zDTDNLTS/PRwBKvVjopC7Uty+A0lbW
	L0yi+fwKseFmvOomWbUyheJveprw==
X-Google-Smtp-Source: AGHT+IHwXUPkcwmz1dEZv6qs1mqFyRbKWhc6VLppFLp13raa+hash9p1l8om7PD+XzyVVCshzoOtuLCzkfE1/WnrK9s=
X-Received: by 2002:a92:c54e:0:b0:3d3:dfc2:912f with SMTP id
 e9e14a558f8ab-3d42b8a6723mr65466505ab.7.1741201805384; Wed, 05 Mar 2025
 11:10:05 -0800 (PST)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com> <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:09:52 -0800
X-Gm-Features: AQ5f1JraaawwkUmCt4yL_sk7YXrsKqREgeX17Qs1rzauOQ1SG0Q4PNOpFqsI15E
Message-ID: <CAF6AEGszbZ_2J_LkkPMuCeQwma1xtO2=ZwWQcyrsxb+=qb-koQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
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
X-CRM114-CacheID: sfid-20250305_111006_352569_6978C515 
X-CRM114-Status: GOOD (  19.58  )
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
> Up until now we have only called the set_stall callback during
> initialization when the device is off. But we will soon start calling it
> to temporarily disable stall-on-fault when the device is on, so handle
> that by checking if the device is on and writing SCTLR.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 ++++++++++++++++++++++++=
+++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a24b3ce7=
2f48e3b38474da2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const void *co=
okie, bool enabled)
>  {
>         struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
>         struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> -       struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu_domain->smmu);
> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> +       u32 mask =3D BIT(cfg->cbndx);
> +       bool stall_changed =3D !!(qsmmu->stall_enabled & mask) !=3D enabl=
ed;
> +       unsigned long flags;
>
>         if (enabled)
> -               qsmmu->stall_enabled |=3D BIT(cfg->cbndx);
> +               qsmmu->stall_enabled |=3D mask;
>         else
> -               qsmmu->stall_enabled &=3D ~BIT(cfg->cbndx);
> +               qsmmu->stall_enabled &=3D ~mask;
> +
> +       /*
> +        * If the device is on and we changed the setting, update the reg=
ister.
> +        */
> +       if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
> +               spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> +
> +               u32 reg =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_C=
B_SCTLR);
> +
> +               if (enabled)
> +                       reg |=3D ARM_SMMU_SCTLR_CFCFG;
> +               else
> +                       reg &=3D ~ARM_SMMU_SCTLR_CFCFG;
> +
> +               arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, re=
g);
> +
> +               spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
> +
> +               pm_runtime_put_autosuspend(smmu->dev);
> +       }
>  }
>
>  static void qcom_adreno_smmu_resume_translation(const void *cookie, bool=
 terminate)
>
> --
> 2.47.1
>

