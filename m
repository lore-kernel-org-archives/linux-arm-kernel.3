Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77044D5B158
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgydGo78UUNFcEV6DKA5ytibdOMHFroL34YfVzKhiUs=; b=eBGWedyaLXWBRLkDdNyW0OyRTK
	kT7acxMb5pRZxHrMpYT+7HZU3X7JVq7bCDx/qkcg6MG1ur9DMa/SdxsufFIWAxqQaQJbWiEJcKyXl
	PQKbz+rfLUi33yIIuoyAybi76PqEpF5MCUg666N0yvZqDwPu4Dx7ZtOaXY1XU4QZJc2sVb19EqZo+
	npEWXSIOUFFlfnoYKXAtzux26lgNZGMHcPFe1PvOWmHEXNAIQtCYcaL2XZTyUaRpsesrkAMPZzzK3
	GGis1MikIZEpnLKvRYg8DuirnPFTtmkSRw1UD/OkWIzm+g6+2AIhoFlFNT793kUDtjdmfvD2aN+Jy
	6wh+lK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XWe-0000000CNNI-0YKk;
	Mon, 28 Oct 2024 21:43:48 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5X2w-0000000CIjh-1dBq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 21:13:07 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3a3a6abcbf1so19028845ab.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 14:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730149985; x=1730754785; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgydGo78UUNFcEV6DKA5ytibdOMHFroL34YfVzKhiUs=;
        b=IWjScjtuSs8U4cCsXCmwu3Wn2aqQRrSHLU99g2jrKAu7fRvJMekcl9GJ8QDB3NS/t/
         MZZa8dPqrwLynNw+Y8dC7X8oA/h7jCjyII8fLh2Q5CTDvmUnc3yzrfz7EAKivqDZOZO4
         lvEsWjISbfg6cJjvnJniu+NGRYe/CODXgFjqwX2dCo4MZ1N0HMlNVxlLtA1MjX5N55uF
         u4mwBqBzE/q4hqdXErjtC7hDKfvvkCoMKpBdeCwonUL89rp2h0rY64fsovWYKG8Euqec
         DQty6MqXPnSu4xkIRzDRXajlEaX6c64TgNSziITWzzB/RuSL5QxJLqqqgHKo9lq++3cS
         9kqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730149985; x=1730754785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgydGo78UUNFcEV6DKA5ytibdOMHFroL34YfVzKhiUs=;
        b=N1vifLiOWQcWO5gCNHcGF/MmTISbj5vLxW84vwPrCHuMMIPHaSskW5FMfSTtx8P1uq
         nR0aX5wuFzlifPLx/DNALPxBlZc2/xhr8JveQHrMj7FLoubcnj5dCCpUtgZ+SGT03EW7
         WG+HxcmHo9CmdpJSLS3STG6EOWP7WzOXwI9wR2KyBMrFAJ+pIro347/CYflPjRBICXGq
         qbY1dZmBTM8WbOuxuG8HaCukTLl7gAkpkO4D6SvzJoGKAHCqxTmQ6Yxio7/P2LiKGuZQ
         ShKiVJvsEpyVr0UtVKGBWYAefmqIyIUQZRfuiMOrV+jEoN96RK5YO9i4wTczqjTL0GoO
         QbEg==
X-Forwarded-Encrypted: i=1; AJvYcCW3nX3VcpB+5b49mPZpRV1uj/mBmZ+caOTPnKMea0MjxFZ0yP0cUp23sUXyUWmXxU9bXZnrLsWzzVl86HSA4g2Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzHTLnQiXNSvlpD04SV/Kov4RQLlIsbC0I5qFHMtOXHkAClAaYs
	07OF7Cc7W6SbQRLK4X8XXcBPLnbZcsxwf4mZdKB2kCsTm2IqNWZkrNmZCoeFdihpeHgyKUTaJRn
	y8RwkygyLwUnjRnhdkYxd1wJeOBs=
X-Google-Smtp-Source: AGHT+IETQNXUS47G9SKDmicHSxSQjk2HxvylV+/jMNFioWMi2SJd15y2W6PAAa5jrnbbG4eLxU+17nmW168V2EDC/W4=
X-Received: by 2002:a05:6e02:1546:b0:3a0:8eb3:5154 with SMTP id
 e9e14a558f8ab-3a4ed275c09mr80530505ab.4.1730149984571; Mon, 28 Oct 2024
 14:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com> <20241008125410.3422512-2-quic_bibekkum@quicinc.com>
In-Reply-To: <20241008125410.3422512-2-quic_bibekkum@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Oct 2024 14:12:52 -0700
Message-ID: <CAF6AEGtKP8EGp7iLMomTAFvaUOAPNeu6YiJ=e=MLvBAsA_yHdA@mail.gmail.com>
Subject: Re: [PATCH v16 1/5] iommu/arm-smmu: re-enable context caching in smmu
 reset operation
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_141306_451978_A0FF97B4 
X-CRM114-Status: GOOD (  26.04  )
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
> Default MMU-500 reset operation disables context caching in
> prefetch buffer. It is however expected for context banks using
> the ACTLR register to retain their prefetch value during reset
> and runtime suspend.
>
> Replace default MMU-500 reset operation with Qualcomm specific reset
> operation which envelope the default reset operation and re-enables
> context caching in prefetch buffer for Qualcomm SoCs.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 45 ++++++++++++++++++++--
>  1 file changed, 42 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 087fb4f6f4d3..0cb10b354802 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -16,6 +16,16 @@
>
>  #define QCOM_DUMMY_VAL -1
>
> +/*
> + * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
> + * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
> + * buffer). The remaining bits are implementation defined and vary acros=
s
> + * SoCs.
> + */
> +
> +#define CPRE                   (1 << 1)
> +#define CMTLB                  (1 << 0)
> +
>  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>  {
>         return container_of(smmu, struct qcom_smmu, smmu);
> @@ -396,11 +406,40 @@ static int qcom_smmu_def_domain_type(struct device =
*dev)
>         return match ? IOMMU_DOMAIN_IDENTITY : 0;
>  }
>
> +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> +{
> +       int ret;
> +       u32 val;
> +       int i;
> +
> +       ret =3D arm_mmu500_reset(smmu);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * arm_mmu500_reset() disables CPRE which is re-enabled here.
> +        * The errata for MMU-500 before the r2p2 revision requires CPRE =
to be
> +        * disabled. The arm_mmu500_reset function disables CPRE to accom=
modate all
> +        * RTL revisions. Since all Qualcomm SoCs are on the r2p4 revisio=
n, where
> +        * the CPRE bit can be enabled, the qcom_smmu500_reset function r=
e-enables
> +        * the CPRE bit for the next-page prefetcher to retain the prefet=
ch value
> +        * during reset and runtime suspend operations.
> +        */
> +
> +       for (i =3D 0; i < smmu->num_context_banks; ++i) {
> +               val =3D arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
> +               val |=3D CPRE;
> +               arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, val);
> +       }
> +
> +       return 0;
> +}
> +
>  static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>  {
>         int ret;
>
> -       arm_mmu500_reset(smmu);
> +       qcom_smmu500_reset(smmu);
>
>         /*
>          * To address performance degradation in non-real time clients,
> @@ -427,7 +466,7 @@ static const struct arm_smmu_impl qcom_smmu_500_impl =
=3D {
>         .init_context =3D qcom_smmu_init_context,
>         .cfg_probe =3D qcom_smmu_cfg_probe,
>         .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .reset =3D arm_mmu500_reset,
> +       .reset =3D qcom_smmu500_reset,
>         .write_s2cr =3D qcom_smmu_write_s2cr,
>         .tlb_sync =3D qcom_smmu_tlb_sync,
>  #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
> @@ -461,7 +500,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2=
_impl =3D {
>  static const struct arm_smmu_impl qcom_adreno_smmu_500_impl =3D {
>         .init_context =3D qcom_adreno_smmu_init_context,
>         .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .reset =3D arm_mmu500_reset,
> +       .reset =3D qcom_smmu500_reset,
>         .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_bank,
>         .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
>         .tlb_sync =3D qcom_smmu_tlb_sync,
> --
> 2.34.1
>

