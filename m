Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B046D6B6B5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 17:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSgEGqLSHYW5dJnL+akJvNntnbwcTcLxiNTHrobsiFM=; b=rCF/5rreServrIt4AaN6ZDIdBc
	6m40as7cZjarIdkgitpizms6Dj5glJkyLHQf0hEbT5u2hV4Xd9Xt1mL4YeYTZW8J9wrcpXfAsn0RL
	/3cabT7frhDJ0msJOMSQ3x8SDMjIzjYWp4qcmicYAz/pPQOrz8P1HOP/5na+5TetFagFwN42jK9Zc
	eXKih7/GbIqEOWQADtRoizAuBNdOobSOX0a4PvikZZxf06c84uNNExvy64NK9uco7uJviWXY/niNF
	jW/IyHglqS/HPiX0VikMPI/KBUVeso4oKK0QmvOKlP5hOnbPHCoFZpqvpCfhx4Zy4G9HZ25w7QyA+
	dfad6yMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6C7v-00000001BLt-2CZp;
	Wed, 30 Oct 2024 17:04:59 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6C1z-000000019Ya-44cb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:58:53 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3a3b7d95a11so88665ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730307530; x=1730912330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSgEGqLSHYW5dJnL+akJvNntnbwcTcLxiNTHrobsiFM=;
        b=CFqfTkoJKNGxhnCd/YkpH5Qxsu7JX3bOCFiXJsT+x5nyL1abDqpjoFfQ8r7ZKwH6Ig
         cuMvprqh//xdBQW9/C/lpBIS9Fe5MdLFpYzRVvo8jLgtT/eJ8zDpLRa563SLv4zMa+sA
         s6ci4aLCQHmgx3/Cj5rgMEBEpvBbplTAD/L0ivwPgmNxnm3icsqyqgrkxFALB2eBbMQx
         tCOMqFA6Q/knhlI3ZBabLIrSjafPnUmlx4GH/mwn7D3f6fsFnXf0i8MiwhJgHVsJBiqt
         n1H9VtxWFqvuNVonr6O3YPdl1vtEDZOt4rrGHmgkBWk8GSNKM6L2xOfHWas0sMwyPvo4
         c9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307530; x=1730912330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSgEGqLSHYW5dJnL+akJvNntnbwcTcLxiNTHrobsiFM=;
        b=KBPgXoxJl9YTNkEJ8eHV55oJBY7XmmRob/A6G2a/8PcQuSglEtkPBAuvBxn8P/ulmj
         Kc3TpbOVEHslxXkq+HmK5C/lY+t7OrMKMJqqok4Qk8+nS16Ovsqd4f8iOKB+VSUAG6Fa
         nXRWW8VkxBfQYJuU+zZtfAFx1E0Y3VJA9rrP/j1XewKKZxwT0dVuf1m4PM41wTBvWpGM
         SnvmFs1bp1Gtx50NpGAq57XoPoh0F9QVTCDw5XvwTAZ/3gbEQUKwLO2aEYDTeBxVmo6t
         keI+GphMeaMB05PAjOWOunqMIOc0+jX5sBETOcsTH96YN8cfcZU6OJguMnDZiHqp4dLM
         TVTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt309dtFR66IqCOaz4igodeCuabzYniEo22mkFtq3jcWyPdn3y5MZ0WZqdsw9KLPpSu0GNTx4WkaAGhi2ehjPS@lists.infradead.org
X-Gm-Message-State: AOJu0YxVqMFt8DptL9se1M1g86UUu6keKMHnBWeOBp5/xav1MO4VPMm0
	iZbtRTFhR7NLxpgxiXbFH1/J8APvnjLjUuXIzO5rz9t9s1E3qXIaG2Ktq408Aafy3J3ZVSfZ8Ju
	HECDYIdZIfadYc6zdn+YHXPGJtxc=
X-Google-Smtp-Source: AGHT+IGmbmSXox8oAVQKBdxqprSBcxGpJ91Xocq6QrwRiJgePmhF7ve9q4dPiAMajWeQWmKzteD5uHeTwomcrUrLAXY=
X-Received: by 2002:a05:6e02:1a4e:b0:3a3:b4ec:b400 with SMTP id
 e9e14a558f8ab-3a4ed2df0f2mr181154985ab.17.1730307530123; Wed, 30 Oct 2024
 09:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-4-quic_bibekkum@quicinc.com> <2d651f1b-4f51-4984-903f-7f5a14151f84@arm.com>
 <531d0144-e027-4589-b4ef-79f02583df8b@quicinc.com> <65132b36-49f6-4b08-8e7d-6d6cb8da5960@arm.com>
In-Reply-To: <65132b36-49f6-4b08-8e7d-6d6cb8da5960@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 30 Oct 2024 09:58:38 -0700
Message-ID: <CAF6AEGvAYeY-fuk1Dg-0gsrod7Dy91qifKvChCd03=bs_zfs-g@mail.gmail.com>
Subject: Re: [PATCH v16 3/5] iommu/arm-smmu: add support for PRR bit setup
To: Robin Murphy <robin.murphy@arm.com>
Cc: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, will@kernel.org, joro@8bytes.org, 
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, 
	dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_095852_069757_C7EBC773 
X-CRM114-Status: GOOD (  31.71  )
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

On Wed, Oct 30, 2024 at 8:23=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 30/10/2024 1:14 pm, Bibek Kumar Patro wrote:
> >
> >
> > On 10/29/2024 6:59 PM, Robin Murphy wrote:
> >> On 2024-10-08 1:54 pm, Bibek Kumar Patro wrote:
> >>> Add an adreno-smmu-priv interface for drm/msm to call
> >>> into arm-smmu-qcom and initiate the PRR bit setup or reset
> >>> sequence as per request.
> >>>
> >>> This will be used by GPU to setup the PRR bit and related
> >>> configuration registers through adreno-smmu private
> >>> interface instead of directly poking the smmu hardware.
> >>>
> >>> Suggested-by: Rob Clark <robdclark@gmail.com>
> >>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>> ---
> >>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 +++++++++++++++++++=
+++
> >>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>>   include/linux/adreno-smmu-priv.h           | 10 +++++-
> >>>   3 files changed, 48 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/
> >>> iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> index 6e0a2a43e45a..38ac9cab763b 100644
> >>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> @@ -25,6 +25,7 @@
> >>>
> >>>   #define CPRE            (1 << 1)
> >>>   #define CMTLB            (1 << 0)
> >>> +#define GFX_ACTLR_PRR        (1 << 5)
> >>>
> >>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> >>>   {
> >>> @@ -109,6 +110,40 @@ static void
> >>> qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
> >>>       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> >>>   }
> >>>
> >>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool se=
t)
> >>> +{
> >>> +    struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>> +    struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>> +    const struct device_node *np =3D smmu->dev->of_node;
> >>> +    struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >>> +    u32 reg =3D 0;
> >>> +
> >>> +    if (of_device_is_compatible(np, "qcom,smmu-500") &&
> >>> +            of_device_is_compatible(np, "qcom,adreno-smmu")) {
> >>
> >> These conditions aren't going to change between calls - wouldn't it
> >> make more sense to conditionally assign the callbacks in the first
> >> place? Not the biggest deal if this is a one-off context-setup type
> >> thing, just that it looks a little funky.
> >>
> >
> > Let me know if you want to pursue this still.
> >  From the current PRR implementation in the graphics
> > vendor layer, this seems to be just setup kind-of thing.
> > Also if we keep this conditional check before assigning callbacks,
> > and vendor layer caller won't be having any such check,
> > wouldn't it be an issue in unsupported platforms (!qcom,smmu-500 or
> > !qcom,adreno-smmu)
> > as the callbacks won't be assigned?
> > So as per my understanding I think it would be safe to keep the
> > condition check here?
>
> Like I say, it makes more sense to me personally if SMMUs which don't
> have a PRR don't offer a callback for setting the PRR which they don't
> have, and for it to be the caller's responsibility not to call a NULL
> callback where they wouldn't need to call one anyway. But the
> adreno_priv interface is kind of Rob's thing, so I'll leave it to his
> preference.

We can go the route of NULL cb if it is not supported (but should make
note of that in the adreno-smmu-priv.h header comment)

BR,
-R

> Thanks,
> Robin.

