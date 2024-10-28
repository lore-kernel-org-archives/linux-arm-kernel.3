Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A866D5B156
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VhBTgRcvoEu0iow72UBK8g23QXw3BQ0zWkKZeXjZxc=; b=1qN8W7bCVDchacqrFEkSK4+nRb
	etnscZEBm+RfoADF/uB9t7P77Ziqpqt2Pvs2oD289tE9D3FHrbQVkaxmuFNBDdnj0R/xvKd/Ba9tt
	KFoLkJRQvuxyjVx8+c0M+fddM1lZzDmpFesx/iWcAwgwsMCKf4rxxvZ4z+K5vBgAQAyewwyaTKIdM
	4K5WXZQtqiDCgaq5Jpm/gG4vGQqRPn6RsvSWz4GnNZi+FvC2mX51VRi0LZHO2miMEgGj1osvLZXKp
	bFqXUuqcgps4AHwpvjAy2gC0YBOxC3VJEMooFFpypcyBzBWuGWrbpAzfmoBMk4idp0ay/6WZ4+ePU
	L3vuMt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XDb-0000000CKCV-0rOh;
	Mon, 28 Oct 2024 21:24:07 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5X4J-0000000CJ0N-3SwP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 21:14:33 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3a394418442so15576555ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 14:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730150070; x=1730754870; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VhBTgRcvoEu0iow72UBK8g23QXw3BQ0zWkKZeXjZxc=;
        b=AkxSHr4DlDIsTRT3FXm77zrRw924eZhJ/jHz/L0x1JjTZMzY1VO/qqeYl8oIupqjA8
         RY9T8+PPGmcogewmZCrvQAb+7rxkJVBI7hGpSQYYlwt71bO1NXMt8hE1vU9XRYM1u8jy
         87kbUt4l0JOjxqLm+fv5cfa55JPjAF4CK/UnZ0wm6A2sybbw2U3M4hLPDNGRqihsF0fk
         qgzp4FoTsS+0BHiaLwJkP6iaq+h8Trau6kB3Siy2DfKjSv5ZWJRsVWKuDG8LTPXvc0YY
         4xCpDe+tPy04x/VI3yXkgP8YJw3RWcgb42YT0eTFMgyPPkRcBCOq1+eaiEKQL3KV/gXk
         XcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730150070; x=1730754870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VhBTgRcvoEu0iow72UBK8g23QXw3BQ0zWkKZeXjZxc=;
        b=Z7nRv9NXc2rxFj29ZTO3+GqM88ty5vXeRn3Y1slhc2A2U3GZ2em3B9G5na77Cwyf3p
         zDqNVPFYGtJGWCpFVbNuhWXgVk70TuWt5gNK9zIrLAmMEMvHMlLHmgnCl6N7XngOeee9
         Qm86rmHwjQ8KbOEQI8cK5QkUt/25M0gK3TBSqUxwZDCu5HfDNl6t2u/94cuilyoFAaln
         PsNysXZl4imU40cFZ48DbKj3i+vTUAm+Omc4mn4mYNeaeLjztsIbIKOIEAZZ8tGYPuM3
         ea+7BU0GuPxfSSgwQ8qrqwko3QfyrEmmsWxPhFPvTtW/WW/IDlBk3TfIJI9+btb7GOgt
         WIAA==
X-Forwarded-Encrypted: i=1; AJvYcCWDJH47SFgr/sYnIUwwQDrKjBdZBYDsh9jYkMOLW0K2w4rDoheqyRaKrO+K5AQP4wgQsllefSlws5cCeULAuYgY@lists.infradead.org
X-Gm-Message-State: AOJu0YxwWyz3AIw7hT7uctYF3/g/iz/ZCHUhWCIXY9IktPSMunljDbXk
	sw0PD/CeUP0SvW+UMP2Xp64/mJk1mkll6y3Q5BAAyZZHyqIXdzzbv3XFxKcwceYtUK/xqi2mXMo
	ukm/s792ygRAdg4EyEHG8KkncNJE=
X-Google-Smtp-Source: AGHT+IHhFCxiRxfNhtJxV/D4dzofAyWTuWm7f9BRM/ecWCIKcKlpSKo+pbKgNvyJlnuEuFMGIZ+4UAGr/b4EGAEODzw=
X-Received: by 2002:a05:6e02:1c0d:b0:3a3:968b:4e3f with SMTP id
 e9e14a558f8ab-3a4ed2f67a0mr85108735ab.18.1730150070444; Mon, 28 Oct 2024
 14:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com> <20241008125410.3422512-5-quic_bibekkum@quicinc.com>
In-Reply-To: <20241008125410.3422512-5-quic_bibekkum@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Oct 2024 14:14:17 -0700
Message-ID: <CAF6AEGtZ=7KmfYjOXRHZx4nxdnh3VDr+UAGqKY_y_=pmfo3b=Q@mail.gmail.com>
Subject: Re: [PATCH v16 4/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_141431_887034_54BE4C29 
X-CRM114-Status: GOOD (  22.11  )
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

On Tue, Oct 8, 2024 at 5:55=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
> the TLB to fetch just the next page table. MMU-500 features ACTLR
> register which is implementation defined and is used for Qualcomm SoCs
> to have a custom prefetch setting enabling TLB to prefetch the next set
> of page tables accordingly allowing for faster translations.
>
> ACTLR value is unique for each SMR (Stream matching register) and stored
> in a pre-populated table. This value is set to the register during
> context bank initialisation.
>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>


> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  1 +
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 38ac9cab763b..2d2c1e75632c 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -252,6 +252,20 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu=
_device *smmu)
>         return true;
>  }
>
> +static void qcom_smmu_set_actlr_dev(struct device *dev, struct arm_smmu_=
device *smmu, int cbndx,
> +               const struct of_device_id *client_match)
> +{
> +       const struct of_device_id *match =3D
> +                       of_match_device(client_match, dev);
> +
> +       if (!match) {
> +               dev_dbg(dev, "no ACTLR settings present\n");
> +               return;
> +       }
> +
> +       arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR, (unsigned long)=
match->data);
> +}
> +
>  static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_do=
main,
>                 struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> @@ -316,8 +330,20 @@ static const struct of_device_id qcom_smmu_client_of=
_match[] __maybe_unused =3D {
>  static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>                 struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> +       const struct of_device_id *client_match;
> +       int cbndx =3D smmu_domain->cfg.cbndx;
> +
>         smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D true;
>
> +       client_match =3D qsmmu->data->client_match;
> +
> +       if (!client_match)
> +               return 0;
> +
> +       qcom_smmu_set_actlr_dev(dev, smmu, cbndx, client_match);
> +
>         return 0;
>  }
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.h
> index b55cd3e3ae48..8addd453f5f1 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -28,6 +28,7 @@ struct qcom_smmu_match_data {
>         const struct qcom_smmu_config *cfg;
>         const struct arm_smmu_impl *impl;
>         const struct arm_smmu_impl *adreno_impl;
> +       const struct of_device_id * const client_match;
>  };
>
>  irqreturn_t qcom_smmu_context_fault(int irq, void *dev);
> --
> 2.34.1
>

