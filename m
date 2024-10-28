Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7B0D5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGj4nvrYi+UV4BMXSEK74nk2UvFueWrFMbcWim1QgII=; b=OAoD/so+aXcb/71cb60K7aiF4c
	ObC+UI2Gyamlc55+jhyFUuiCl860AO8Huq5ofaxV624rlaym6S9bPQNcrodTkBBrMwxODlKAqMaF4
	GBjdwBp+MOzfDSCyqTaBGvac7XFwrrC/7caZCt/LaxM6S2EBzal2YKQitP85xn8IyyiZX7vk0UuVe
	vKoQyuuIzbLKnvQOa6PRxsZnqVRgkCNI4c9az6GsNHl+f07ffGNowhHVgF2/gaLvAf5DEEviAppV7
	k+p6J/0lmaLwx8Lq6rWSaQRqQ6NNghU7vbxMaGu+jpEhcZ28T2REdDpz3UBfzk7Q4ZrRUSuWuw3Nt
	Bzv6apmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XYE-0000000CNj2-0hBP;
	Mon, 28 Oct 2024 21:45:26 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5X3F-0000000CIne-1oCb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 21:13:26 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3a4e5f07c8fso12887545ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 14:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730150004; x=1730754804; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGj4nvrYi+UV4BMXSEK74nk2UvFueWrFMbcWim1QgII=;
        b=VVdJ8sHgx8+3T4xdqcB2Jj0MjOo153nBrsaSCbQMoaRKAgXmOBCWmNUv8sGAmxHYr9
         6aDbXiY4nAQ9gtc0xhFXqAaw+IEwI5hnWP2r8293aHQimgRvbcHlWGgBQX3+17ZdoDxh
         /dQkVgkSqlIjJ+ZYePRm77gXmGjX+HKfH0p0lE+ipbP0CACqdO+WujkHI4JjDTmr9pTr
         5M2XenFHvWUoktkUEw8ypwLDl+jc5GTn7Vur4a8IObUXYdPoNX0FjRP+/K32hhYPRQhX
         Y9rZUD8LHldEorMaCkqJEtIMRk4umuu6LgaoYymLr3eQvIzgXv11/i+Pm215Q3mgNRqZ
         Vl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730150004; x=1730754804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGj4nvrYi+UV4BMXSEK74nk2UvFueWrFMbcWim1QgII=;
        b=PzEF9tPDIBXjK3+FNCrKQuO43jJxTPUV4floLz6uGp2RWxaBGH0IDYQ9RzUdtKllBP
         JwphF08gW5CUOL7zX3YgPrhhWrUWiu0EL8voUx1gOkgTfznkbt3Y496/sak4JCIHkOqZ
         qzJcS8RP0BCG2y3l+HXM/qhk79l04HlCc7iOqrsuzALxwBUqMl8Xy3B/vCnf/QkZXhlF
         Txm9KhyuiL4peyAsWJChfAbgJcf7M8ZiWTch5nbBMu4vl/Jjyx2CYUhkAJ5bPWJhxP68
         0gp/p8XvD+OIsg+YC9XnDSNecc58mJ5csuxBiwCPEOuQqIs0GSgKzcOtjOvwC4sRnoRC
         D+XA==
X-Forwarded-Encrypted: i=1; AJvYcCXtg5/QW5Y6xBWM19njpjOFsgHfvCPBY+T3+PzYVMN65CefMBFtt4I0n4HcZc4VZnS9QL3/PTljNUR2gOZJ/j9K@lists.infradead.org
X-Gm-Message-State: AOJu0YwyE2a+o/rEI4z6YlvWdAbB2rRaGBkrAw04KnCLasX/vUo/95fW
	FZphIkDzsA4h7GgngDvoE6Ge6tzpx63AAcQ5j6XY3Qa5wcoxgJB2BvGG0ayWZnD8flKnXoGvvOy
	Zsp2kfY12veXyM4mhanpnWX8JYPE=
X-Google-Smtp-Source: AGHT+IHkAip3QtvMIsGAcSCjbt25YJnHoEeUIt+TrlK362ycmT+j63k00KWrpG0VJyorocPL41G3lK8a2TaMD61ih3E=
X-Received: by 2002:a92:ca4a:0:b0:3a4:e308:2f5 with SMTP id
 e9e14a558f8ab-3a4ed1ba8camr91673605ab.0.1730150004074; Mon, 28 Oct 2024
 14:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com> <20241008125410.3422512-3-quic_bibekkum@quicinc.com>
In-Reply-To: <20241008125410.3422512-3-quic_bibekkum@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Oct 2024 14:13:12 -0700
Message-ID: <CAF6AEGt6xNe5VpHq=fiz03M1_m+psn8ouX_uuRgRV6=kthfF+w@mail.gmail.com>
Subject: Re: [PATCH v16 2/5] iommu/arm-smmu: refactor qcom_smmu structure to
 include single pointer
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_141325_493795_AAEED62C 
X-CRM114-Status: GOOD (  17.97  )
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
> qcom_smmu_match_data is static and constant so refactor qcom_smmu
> to store single pointer to qcom_smmu_match_data instead of
> replicating multiple child members of the same and handle the further
> dereferences in the places that want them.
>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c | 2 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 2 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 548783f3f8e8..d03b2239baad 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -73,7 +73,7 @@ void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *s=
mmu)
>         if (__ratelimit(&rs)) {
>                 dev_err(smmu->dev, "TLB sync timed out -- SMMU may be dea=
dlocked\n");
>
> -               cfg =3D qsmmu->cfg;
> +               cfg =3D qsmmu->data->cfg;
>                 if (!cfg)
>                         return;
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 0cb10b354802..6e0a2a43e45a 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -534,7 +534,7 @@ static struct arm_smmu_device *qcom_smmu_create(struc=
t arm_smmu_device *smmu,
>                 return ERR_PTR(-ENOMEM);
>
>         qsmmu->smmu.impl =3D impl;
> -       qsmmu->cfg =3D data->cfg;
> +       qsmmu->data =3D data;
>
>         return &qsmmu->smmu;
>  }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.h
> index 3c134d1a6277..b55cd3e3ae48 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -8,7 +8,7 @@
>
>  struct qcom_smmu {
>         struct arm_smmu_device smmu;
> -       const struct qcom_smmu_config *cfg;
> +       const struct qcom_smmu_match_data *data;
>         bool bypass_quirk;
>         u8 bypass_cbndx;
>         u32 stall_enabled;
> --
> 2.34.1
>

