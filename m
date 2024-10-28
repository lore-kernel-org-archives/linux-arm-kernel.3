Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A1ED5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktS5JZlVOvEaixmraj14grQIGS0mOTMVZfsZ8ze71Ik=; b=12qfmJAN+3Wamr6pF2X3ylVaxt
	9RJMYpimN4fcB3pNBHJMgGyR5zJCqgIDawYhIIpN1yqthvFIXQ3mNg1IN2kYNvdONppkeUJ6I3Qca
	3BkRPE7hH9WGCGmOs0zNfxuEZxZBEqZ4gjt+5GXKf8W7TRMnWnKhphJx7VnNHe2B1cBcTtbwOYDBX
	kC4x1Us1lGPC981WjSl2qNMHCTlZkBF6FmmMfK++KhIpUcfEtYz+BLsJ3C4pliYJWkjXS4Us1X/oJ
	duXujSoJIEFI9a9rqh3tgsjDQOQu+PdYlAP1/sE9wH4Erho4US/M+20RpmYxrntrstreeJ7KSOPGH
	uuttslSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XGn-0000000CKZ4-32k3;
	Mon, 28 Oct 2024 21:27:25 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5X6J-0000000CJMe-1cb6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 21:16:36 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3a4e5e57679so11971645ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 14:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730150194; x=1730754994; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktS5JZlVOvEaixmraj14grQIGS0mOTMVZfsZ8ze71Ik=;
        b=kwdVwRposanL3uqGKGbz82PAAAc87VtxtjKhfTmtBr5HSglTERpixFKw4T6CJ24fQf
         Jke2qeSidl8JhD9vem8VW1TAxM/zc0bU2B+S3Us1OTn4JEWF/eeClawQxONH4tPVdWTS
         EzG/NwA44aE0ZyA6wQVPpge4YL6YG3IsB8HXzsT8BjKb1TR8lN8KjoQKTghs0PV4aJYj
         uJsX8coBY3cCvGf+lRcvc0xrcG3LJt0iR3UwHqCFX4FoZLFmfZlZIr0nOxHLxCMGWRCM
         WycBfZHIbSmC0Mj7DOGHZ0aie1iU1dpxl1kywX8QlROykxNbVe4tCc9kmheyHiQzf4Y+
         gEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730150194; x=1730754994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktS5JZlVOvEaixmraj14grQIGS0mOTMVZfsZ8ze71Ik=;
        b=Ti89w7scUNugrN4yP7/R7/29JiDOitbEY/LV38fw43cQx3qK1eNMA9FUXSOVC98ca4
         PsTSE6GLq2wy3RzavpqpjIaTeeedHYK5TCAitn1bxCNAyLizEoVeP+BTzI2VHjJXPjyV
         sr4YIc5gW1oC/GhYnR3nDucYe7ujFzEdRJe7LuJ731csBBhj1Ws1X3WmxjAZ6bUF+R6i
         46ltahw4c3OjDFbhr/LnKpmN7ngLSdwLts8QQ7S/65eT1uw0Q2TLVJpgyRdrb8HqPx+r
         4/yYipcWU0Bzlgz13k5IVEZhrpLlbQ+lUzvrnzzAT2veHjED/WMII1vHqvo/BJhjY52F
         2P+g==
X-Forwarded-Encrypted: i=1; AJvYcCW+JJ+toF2CJ8sjTG9zdHaMChekADu1Zv61klBy7BAi6e/pRDiga/vabfzmr6jqjAE0qL04C6/sBGjnvxOQa8KQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7J7bwa+oyfaogm3SgGHjoc2RlMGeSTFnMvWCFQObOkpoF5ANz
	M8m2Guf/CT9UzBuhNxHEm8eplHJZqKJ1kOZ+C3VdsKUp722kzXgeCtHAbkzaiDHCh8+2UYC+Qm5
	2JQl4ntDj9/d91snpUnF5mY6yj5g=
X-Google-Smtp-Source: AGHT+IG9XrLh5NKIexOxyfcazqPge3CPHDgNBsyKjId3gtC/MJJHMtgd1LcfGFYvXzXYtIB2lAVzQZdmZdFDCxa0qBU=
X-Received: by 2002:a05:6e02:20c8:b0:3a0:8c68:7705 with SMTP id
 e9e14a558f8ab-3a4ed3012b2mr68380955ab.21.1730150194399; Mon, 28 Oct 2024
 14:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com> <20241008125410.3422512-6-quic_bibekkum@quicinc.com>
In-Reply-To: <20241008125410.3422512-6-quic_bibekkum@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Oct 2024 14:16:22 -0700
Message-ID: <CAF6AEGtOn3+99KMVRvpH=8Qs-g52ajVQyeBkxThSES_dEdVH+Q@mail.gmail.com>
Subject: Re: [PATCH v16 5/5] iommu/arm-smmu: add ACTLR data and support for qcom_smmu_500
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_141635_458889_ADE60455 
X-CRM114-Status: GOOD (  18.81  )
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
> Add ACTLR data table for qcom_smmu_500 including
> corresponding data entry and set prefetch value by
> way of a list of compatible strings.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 2d2c1e75632c..dd4fb883ebcd 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -25,8 +25,31 @@
>
>  #define CPRE                   (1 << 1)
>  #define CMTLB                  (1 << 0)
> +#define PREFETCH_SHIFT         8
> +#define PREFETCH_DEFAULT       0
> +#define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
> +#define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
> +#define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
>  #define GFX_ACTLR_PRR          (1 << 5)
>
> +static const struct of_device_id qcom_smmu_actlr_client_of_match[] =3D {
> +       { .compatible =3D "qcom,adreno",
> +                       .data =3D (const void *) (PREFETCH_DEEP | CPRE | =
CMTLB) },
> +       { .compatible =3D "qcom,adreno-gmu",
> +                       .data =3D (const void *) (PREFETCH_DEEP | CPRE | =
CMTLB) },
> +       { .compatible =3D "qcom,adreno-smmu",
> +                       .data =3D (const void *) (PREFETCH_DEEP | CPRE | =
CMTLB) },
> +       { .compatible =3D "qcom,fastrpc",
> +                       .data =3D (const void *) (PREFETCH_DEEP | CPRE | =
CMTLB) },
> +       { .compatible =3D "qcom,sc7280-mdss",
> +                       .data =3D (const void *) (PREFETCH_SHALLOW | CPRE=
 | CMTLB) },
> +       { .compatible =3D "qcom,sc7280-venus",
> +                       .data =3D (const void *) (PREFETCH_SHALLOW | CPRE=
 | CMTLB) },
> +       { .compatible =3D "qcom,sm8550-mdss",
> +                       .data =3D (const void *) (PREFETCH_DEFAULT | CMTL=
B) },
> +       { }
> +};

I guess by now there are some more entries to add
("qcom,x1e80100-mdss", for example), but I guess those could be
followup patches

Reviewed-by: Rob Clark <robdclark@gmail.com>

> +
>  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>  {
>         return container_of(smmu, struct qcom_smmu, smmu);
> @@ -640,6 +663,7 @@ static const struct qcom_smmu_match_data qcom_smmu_50=
0_impl0_data =3D {
>         .impl =3D &qcom_smmu_500_impl,
>         .adreno_impl =3D &qcom_adreno_smmu_500_impl,
>         .cfg =3D &qcom_smmu_impl0_cfg,
> +       .client_match =3D qcom_smmu_actlr_client_of_match,
>  };
>
>  /*
> --
> 2.34.1
>

