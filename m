Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBB2E69185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yv3fgfAKB0pYrr8UPsqM1aMmtycm9HlM7s6qGZwm3kA=; b=X+RtQYVfIlCPh2NNTOgp5HdeNy
	alywVDIye8JlnEhJ2pZLeoerSkczDLFPpVFsyv+GPuDoF8s74+IzU829hnwR6XHC4bsV+cArTTeyW
	MyiLWw2bk0ElNxxLEwQpVdgIhiyfaazUGNgwI3nYra34fvVgn5MUkrSbKrF4P17JqYRYnF5NXF4YE
	gO0GOMVq/uKVO8aI7uO8BiGWgsgU3wbPezefjtl54aHwb3ef0eHaoFXuVSrSMYb+XHPGNgA3rjvsT
	O2yFg9Qus3rxBGl8tJO+EQrCSQiAHv6ta618eZuvqtXxDIq1cQI8JXHDDayaAaagFS8t/YNVowAou
	btvmmMsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEX4u-00000002uyC-1eB8;
	Fri, 22 Nov 2024 17:04:20 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEX3w-00000002url-2hjr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 17:03:22 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-83e870a646dso63385839f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 09:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732294999; x=1732899799; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv3fgfAKB0pYrr8UPsqM1aMmtycm9HlM7s6qGZwm3kA=;
        b=BC9A5Uvyz/385SPiOXLdDhLxgkaBl2KnZQ+rd242FRgTDZ00AT6XjYjMZ0826yN4/6
         +v9OZUS1OkD0aP5VYGkp35UHElxaEJcpnvpJriTCoKsyVU1EWR/1dcd/yWp07ef431D4
         1XU5zRpjP4gqjIoXF3ZaG7xpbar8TCL0qkNwqyqI/uhWb03Z/PmDubDh7VOnYM6Rgwuh
         8hfc4aqeJ920P3B1pGHrRqRJmAL7uyj/WTtqT65KV6B+sU83dzwhGTCAKQIls676vUNK
         oOgW/IVS8jtzZ2eux6WNhN6COj6ugbjpSbV5n/h67TtaXoyXsB9Ybui4LKXbI3o7cdS9
         WZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732294999; x=1732899799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yv3fgfAKB0pYrr8UPsqM1aMmtycm9HlM7s6qGZwm3kA=;
        b=LOISzoq+Wr82qgv+QyYcRpoxMHDxmcPyAHo6+r/tHjogs5VMIilZHPrl7gy/M4W/IC
         wNx23JW12Nxn+O+NKMFMYORQ3i8PBQ332GyanDIlX0OiUjYmw9N0VeRyBeQ5LIiP2WfI
         Uzxi3VbIiR8Zc7BCCwMviLLSPAI5AL7xeqDQ45LR2Jr5ize+3k/pw5tGutpl9ukmXTeD
         fQfl77xXOH/k7WFu81UgxV8ZtsFxSBSPgBrHkHx+az3ZMJnEzmxQKVoLRjdUx2ocGEEz
         KtoLgT14IrlvFb/wG8o+XoggpjNhYsXnkrrBNXeWTDRwCcsJCdp/WcxJ6VIPsquT2IXu
         VuGw==
X-Forwarded-Encrypted: i=1; AJvYcCV3zZfnktYO4dVfcMOY21lDTGyeRTD2bq+lYmhCz1aJrYFYxho8juN4Gw+tWffXmgUqP7fyNUJ5O0PR/ETUbUJn@lists.infradead.org
X-Gm-Message-State: AOJu0YxXHiEGCJlR3NwdJdUeHav9nIl5b36nw6LFvP/qZrIkQv4x7OnP
	CyOSDicgpZo9Mph11Ua+HTBt0iD3ZtMnYjLjNmn6qhsDZ+es8zI6q6zYUwepbZFUSv2FffLCCnB
	DVRNb9G9RpaQlnTap90hgrqmczf0=
X-Gm-Gg: ASbGncuhYg0ef93ZHWhcPDr+wziwy3+cYhzjfQFIDowym602QZEXHDXihBYjoEt0Xuw
	m6/CDFHG0EcW2fFqXBm0vOdNjGv3zMoBqOo5FbdGoplRAFEeFhLMnvvZjKW6XBQ==
X-Google-Smtp-Source: AGHT+IHNX7XBAn3wnPiLxXNWpHHx9iKOcEAYOqcO3+I/1rgxgip7FuRZP5VM6fHOHXEgVIN8PnpSdl2S3PKe/oRYz9Q=
X-Received: by 2002:a05:6602:29c3:b0:837:7f1a:40af with SMTP id
 ca18e2360f4ac-83ecdd2ed74mr438512139f.14.1732294998538; Fri, 22 Nov 2024
 09:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <20241114160721.1527934-4-quic_bibekkum@quicinc.com> <CAF6AEGuwWsAkRyF-h5Aj3KzM7iksb12HsfJ5Ks+-P8hv60MWFg@mail.gmail.com>
 <9beca099-5cf3-42b5-b1f9-fb1551219b18@quicinc.com>
In-Reply-To: <9beca099-5cf3-42b5-b1f9-fb1551219b18@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 22 Nov 2024 09:03:06 -0800
Message-ID: <CAF6AEGvAOswFTpS5PHrgCsG_2-QN_Bi4YjZbPpV+r3x=9D2aUQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v17 3/5] iommu/arm-smmu: add support for PRR bit setup
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_090320_687482_36F4F7EF 
X-CRM114-Status: GOOD (  45.30  )
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

On Fri, Nov 22, 2024 at 8:19=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 11/20/2024 10:47 PM, Rob Clark wrote:
> > On Thu, Nov 14, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >> Add an adreno-smmu-priv interface for drm/msm to call
> >> into arm-smmu-qcom and initiate the PRR bit setup or reset
> >> sequence as per request.
> >>
> >> This will be used by GPU to setup the PRR bit and related
> >> configuration registers through adreno-smmu private
> >> interface instead of directly poking the smmu hardware.
> >>
> >> Suggested-by: Rob Clark <robdclark@gmail.com>
> >> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >> ---
> >>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++=
++
> >>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>   include/linux/adreno-smmu-priv.h           | 14 ++++++++
> >>   3 files changed, 53 insertions(+)
> >>
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iomm=
u/arm/arm-smmu/arm-smmu-qcom.c
> >> index d26f5aea248e..0e4f3fbda961 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> @@ -16,6 +16,8 @@
> >>
> >>   #define QCOM_DUMMY_VAL -1
> >>
> >> +#define GFX_ACTLR_PRR          (1 << 5)
> >> +
> >>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> >>   {
> >>          return container_of(smmu, struct qcom_smmu, smmu);
> >> @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_translation(co=
nst void *cookie, bool termina
> >>          arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> >>   }
> >>
> >> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set=
)
> >> +{
> >> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >> +       u32 reg =3D 0;
> >> +
> >> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR)=
;
> >> +       reg &=3D ~GFX_ACTLR_PRR;
> >> +       if (set)
> >> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> >> +}
> >> +
> >> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_ad=
dr_t page_addr)
> >> +{
> >> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >> +
> >> +       writel_relaxed(lower_32_bits(page_addr),
> >> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LADD=
R);
> >> +
> >> +       writel_relaxed(upper_32_bits(page_addr),
> >> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UADD=
R);
> >> +}
> >> +
> >>   #define QCOM_ADRENO_SMMU_GPU_SID 0
> >>
> >>   static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> >> @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_sm=
mu_device *smmu)
> >>   static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smm=
u_domain,
> >>                  struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
> >>   {
> >> +       const struct device_node *np =3D smmu_domain->smmu->dev->of_no=
de;
> >>          struct adreno_smmu_priv *priv;
> >>
> >>          smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D true;
> >> @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(struct a=
rm_smmu_domain *smmu_domain,
> >>          priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
> >>          priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >>          priv->resume_translation =3D qcom_adreno_smmu_resume_translat=
ion;
> >> +       priv->set_prr_bit =3D NULL;
> >> +       priv->set_prr_addr =3D NULL;
> >> +
> >> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> >> +                       of_device_is_compatible(np, "qcom,adreno-smmu"=
)) {
> >
> > fwiw, it seems like PRR actually works on sc7180, which is _not_
> > mmu-500, so I guess the support actually goes back further.
> >
>
> As I checked sc7180 was on previous variant of SMMU,
> so targets on this variant have different steps to set PRR bit.
> <Do not have both prr bit and PRR page registers>.

Experimentally, I have to set both the PRR LADDR/UADDR regs and
ACTLR.PRR bit on sc7180 to get the sparse-residency tests passing.  So
the underlying hw seems to work in the same way as mmu-500.  _But_
this is on a sc7180 chromebook, the situation might be different
depending on fw on things that have QC hyp.

> It's MMU-500 targets only where PRR support is with both PRR bit
> and PRR page addr registers. As I was re-visiting our discussions on v13
> regarding this - I remember that's why we started using the SMMU-
> compatible string based PRR procedure selection instead of the reserved-
> memory node. [1] i.e Based on SMMU variant (as selected by compatible
> string), specific sequence will be selected.
>
> So for now only MMU-500 based selection has been supported as part of
> this series and will add subsequent support for other SMMU-variants
> thereafter.
>
> > I'm curious if we can just rely on this being supported by any hw that
> > has a6xx or newer?
> >
>
> I'd need to check on targets which will be based on a6xx onwards, on
> what will be the procedure planned to support PRR feature. I'll update
> the information over this space.

One of the open questions about the drm/msm sparse-memory patchset is
whether we need to expose to userspace whether PRR is supported, or if
we can just rely on sparse-binding support implying sparse residency
(ie, PRR) support.  All a6xx devices support per-process pgtables,
which is the only requirement for basic sparseBinding support.  But
PRR is required to additionally expose
sparseResidencyBuffer/sparseResidencyImage2D.

I think, long term, turnip probably will want to drop support for
older kernels and remove support for legacy buffer mapping.  But if we
have some a6xx devices without PRR, then to do that we'd need to
decouple sparse binding and sparse residency.  (Vulkan allows a driver
to expose the former without the latter.)

BR,
-R

> [1]:
> https://lore.kernel.org/all/5790afa3-f9c0-4720-9804-8a7ff3d91854@quicinc.=
com/#:~:text=3D%3E%20I%20guess%20if,part%20as%20well.
>
> Thanks & regards,
> Bibek
>
> > BR,
> > -R
> >
> >> +               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> >> +               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
> >> +       }
> >>
> >>          return 0;
> >>   }
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm=
/arm-smmu/arm-smmu.h
> >> index e2aeb511ae90..2dbf3243b5ad 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
> >>   #define ARM_SMMU_SCTLR_M               BIT(0)
> >>
> >>   #define ARM_SMMU_CB_ACTLR              0x4
> >> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
> >> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
> >>
> >>   #define ARM_SMMU_CB_RESUME             0x8
> >>   #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
> >> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-s=
mmu-priv.h
> >> index c637e0997f6d..614665153b3e 100644
> >> --- a/include/linux/adreno-smmu-priv.h
> >> +++ b/include/linux/adreno-smmu-priv.h
> >> @@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
> >>    *                 the GPU driver must call resume_translation()
> >>    * @resume_translation: Resume translation after a fault
> >>    *
> >> + * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL term=
inated for
> >> + *             targets without PRR support. Exercise caution and veri=
fy target
> >> + *             capabilities before invoking these callbacks to preven=
t potential
> >> + *             runtime errors or unexpected behavior.
> >> + *
> >> + * @set_prr_bit:   Extendible interface to be used by GPU to modify t=
he
> >> + *                ACTLR register bits, currently used to configure
> >> + *                Partially-Resident-Region (PRR) bit for feature's
> >> + *                setup and reset sequence as requested.
> >> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
> >> + *                physical address of PRR page passed from
> >> + *                GPU driver.
> >>    *
> >>    * The GPU driver (drm/msm) and adreno-smmu work together for contro=
lling
> >>    * the GPU's SMMU instance.  This is by necessity, as the GPU is dir=
ectly
> >> @@ -67,6 +79,8 @@ struct adreno_smmu_priv {
> >>       void (*get_fault_info)(const void *cookie, struct adreno_smmu_fa=
ult_info *info);
> >>       void (*set_stall)(const void *cookie, bool enabled);
> >>       void (*resume_translation)(const void *cookie, bool terminate);
> >> +    void (*set_prr_bit)(const void *cookie, bool set);
> >> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
> >>   };
> >>
> >>   #endif /* __ADRENO_SMMU_PRIV_H */
> >> --
> >> 2.34.1
> >>
>

