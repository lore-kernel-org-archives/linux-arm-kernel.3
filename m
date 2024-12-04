Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AC1E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cj4ujPAaeCyeAbZ9pqBEXTCkhOV+aItvVddY7czsTYg=; b=eu9o7YoN+2WeoRrFP3Zqk7SW1V
	CJX8XzH88u7bRt1qYJ+MHzNkv3VuJe3qAS3E8KGtqNVfuW2VZkJZO69uPN6hwknCUwSZ4b/DZTaet
	M8jvRkQPDtTBKMQE7Xf9eo6R/oTadSE2aeWNEpO92BNxfp+e1HwXjOvqSqnswGoutD86ruTBhGNpP
	t9T87KjjGMTkXsG27FPRYUsYSxpSLO5g6wkTL6FdNIzY8/7DE4w2wvveQqvUOlY+jSZJafVQzeMU/
	qh7QQMJnbv8rFz0MdisrJdXMLrwbdLMUeaFlz6txbyAli7q72H4Kcs0peGwyxwQK8d9jC6XdWPsAe
	4/Wi3EQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrKj-0000000D0J8-2m5Q;
	Wed, 04 Dec 2024 15:30:33 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrFS-0000000CzWc-1dKQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:25:07 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-841a9366b5eso255090939f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733325905; x=1733930705; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cj4ujPAaeCyeAbZ9pqBEXTCkhOV+aItvVddY7czsTYg=;
        b=mDv40qlzfM3LfWW7rrfBlLCcr+Ge5PBoz9Wtr+bSwGpt7HLBczB6gRfQwluPkO0rnn
         UzfHT4RMifVDA6Y38Igu4A6VqQoIuwrDFKA8LAKYoS3rtF9AJTaVZT0J1/blTmq0ZrQz
         SaAbmyWI/LQRTPr9Twv1wY/u6EEe05Giysz8/xmghxtH3/6KRtcnpGs6wWSelmpHHeHZ
         X5yUEJAPDLdDZlzhFSW/zq86JGTFdHfkqKFb8KnQj0rQz85h+l+3OMdwRYSyjt+WyqPF
         ULNNo/eNc/yFZwwGZkt6eN2V93BzEIFZwOmE6lmXBDf3KrPXEL0XcuvtDii+4K0XCrrs
         Of1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733325905; x=1733930705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cj4ujPAaeCyeAbZ9pqBEXTCkhOV+aItvVddY7czsTYg=;
        b=q83PgKqNTqswspLIf6AtzM5bKJpkxSGxHXN+L75g4zxnMMSyLPRkNKWclMAd5IsSEy
         RLM0CzxYuz8AWpA1qexASh891TQAX/j7bIqzBg8Va4hOh+p509tdgeIvCht344GIVnRN
         +5IVMNZ+aVwzKUiJWzhbwk6HqXKXKYW+RjUcUoYWk0fkpYT8WLyItap7cXBtx+kezFEH
         ly4h0vxgi+dL7Ow44lScw1D9wmimu9N3oyKtfnglHxPoRbzUihhaUFxV/KaaQftDYR5c
         7dKMPRh8HTxFshPSINMcCdIu8seDMWUe1rHeeH6Fiunm8tDb/l5RL7PNdP3Jw3w9yNGS
         iY3A==
X-Forwarded-Encrypted: i=1; AJvYcCW4eh68ecbPJ+U/0NkEVGs4Iw+XXwsb1XoWxZnHix49knGpfXlqUGQjZhWrk1dhLDxcbnnd/1WdHwva1AZ/ERpk@lists.infradead.org
X-Gm-Message-State: AOJu0YxU9/ajKalcdE3ReXUS17CS1FgSESFaudTXkONXgbg9nKto95+3
	NwHZ1wWaFoOisIMLgLayNwAZZwhiQ7ZKWT7wYDNURHpw0YBJFrI7X+kDmEdd4TWl1lZyTLVF9xP
	ocbUuz765on3n1bAcFPmN4YgMqY8=
X-Gm-Gg: ASbGnctZcBlGbxBox/tsymnbJClOoxyXwP2wnNXZkghjHNiiNDKec1/rBYiU/jt76+d
	F3PI2lQvWSi0dfzUPJW/yZMzXGFsSQgcYZNcNvhCX8cDsi9xpQEf3V7KOl2WLuA==
X-Google-Smtp-Source: AGHT+IGXz8ZEpavY/mki3CXE11rwwvgkmZyz0s+4JXHvmWaIgqfTb2XlYZfmbElP0xroAhcJz3jrYOihYr9XvFoXrYI=
X-Received: by 2002:a05:6602:1546:b0:83a:a82b:f856 with SMTP id
 ca18e2360f4ac-8445b53bc6bmr982151039f.3.1733325904978; Wed, 04 Dec 2024
 07:25:04 -0800 (PST)
MIME-Version: 1.0
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <20241114160721.1527934-4-quic_bibekkum@quicinc.com> <CAF6AEGuwWsAkRyF-h5Aj3KzM7iksb12HsfJ5Ks+-P8hv60MWFg@mail.gmail.com>
 <CAF6AEGvVteuOOMod6yw9_6eOn2PxAx+BR8sVOHAHp7Ts8XigBw@mail.gmail.com>
 <5696afa2-c4ab-42fe-b29a-6ecee622fbb4@quicinc.com> <CAF6AEGuMmdnOmATMy8f+YgGxfrYb5mkG_qgy870wZPebKaZjVQ@mail.gmail.com>
 <04da6036-56c4-4b8c-b75b-b5e96a089efc@quicinc.com>
In-Reply-To: <04da6036-56c4-4b8c-b75b-b5e96a089efc@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Dec 2024 07:24:52 -0800
Message-ID: <CAF6AEGt-e_4kGyfiO=_oCLX8E3z76zeZ2MbRe1GicZj4hTEu+g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241204_072506_439376_75F22EE5 
X-CRM114-Status: GOOD (  42.76  )
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

On Wed, Dec 4, 2024 at 3:28=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 11/22/2024 10:04 PM, Rob Clark wrote:
> > On Fri, Nov 22, 2024 at 8:20=E2=80=AFAM Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 11/21/2024 3:40 AM, Rob Clark wrote:
> >>> On Wed, Nov 20, 2024 at 9:17=E2=80=AFAM Rob Clark <robdclark@gmail.co=
m> wrote:
> >>>>
> >>>> On Thu, Nov 14, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
> >>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>
> >>>>> Add an adreno-smmu-priv interface for drm/msm to call
> >>>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
> >>>>> sequence as per request.
> >>>>>
> >>>>> This will be used by GPU to setup the PRR bit and related
> >>>>> configuration registers through adreno-smmu private
> >>>>> interface instead of directly poking the smmu hardware.
> >>>>>
> >>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
> >>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>>>> ---
> >>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++=
++++++
> >>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>>>>    include/linux/adreno-smmu-priv.h           | 14 ++++++++
> >>>>>    3 files changed, 53 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>> index d26f5aea248e..0e4f3fbda961 100644
> >>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>> @@ -16,6 +16,8 @@
> >>>>>
> >>>>>    #define QCOM_DUMMY_VAL -1
> >>>>>
> >>>>> +#define GFX_ACTLR_PRR          (1 << 5)
> >>>>> +
> >>>>>    static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *sm=
mu)
> >>>>>    {
> >>>>>           return container_of(smmu, struct qcom_smmu, smmu);
> >>>>> @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_translation=
(const void *cookie, bool termina
> >>>>>           arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, r=
eg);
> >>>>>    }
> >>>>>
> >>>>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool =
set)
> >>>>> +{
> >>>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>>> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >>>>> +       u32 reg =3D 0;
> >>>>> +
> >>>>> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACT=
LR);
> >>>>> +       reg &=3D ~GFX_ACTLR_PRR;
> >>>>> +       if (set)
> >>>>> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >>>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg)=
;
> >>>>> +}
> >>>>> +
> >>>>> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys=
_addr_t page_addr)
> >>>>> +{
> >>>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>>> +
> >>>>> +       writel_relaxed(lower_32_bits(page_addr),
> >>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_L=
ADDR);
> >>>>> +
> >>>>> +       writel_relaxed(upper_32_bits(page_addr),
> >>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_U=
ADDR);
> >>>>> +}
> >>>>> +
> >>>>>    #define QCOM_ADRENO_SMMU_GPU_SID 0
> >>>>>
> >>>>>    static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> >>>>> @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct arm=
_smmu_device *smmu)
> >>>>>    static int qcom_adreno_smmu_init_context(struct arm_smmu_domain =
*smmu_domain,
> >>>>>                   struct io_pgtable_cfg *pgtbl_cfg, struct device *=
dev)
> >>>>>    {
> >>>>> +       const struct device_node *np =3D smmu_domain->smmu->dev->of=
_node;
> >>>>>           struct adreno_smmu_priv *priv;
> >>>>>
> >>>>>           smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D true;
> >>>>> @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(struc=
t arm_smmu_domain *smmu_domain,
> >>>>>           priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
> >>>>>           priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >>>>>           priv->resume_translation =3D qcom_adreno_smmu_resume_tran=
slation;
> >>>>> +       priv->set_prr_bit =3D NULL;
> >>>>> +       priv->set_prr_addr =3D NULL;
> >>>>> +
> >>>>> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> >>>>> +                       of_device_is_compatible(np, "qcom,adreno-sm=
mu")) {
> >>>>
> >>>> fwiw, it seems like PRR actually works on sc7180, which is _not_
> >>>> mmu-500, so I guess the support actually goes back further.
> >>>>
> >>>> I'm curious if we can just rely on this being supported by any hw th=
at
> >>>> has a6xx or newer?
> >>>
> >>>
> >>> Also, unrelated, but we can't assume the smmu is powered when drm
> >>> driver calls set_prr_bit/addr, could you add in runpm get/put around
> >>> the register access?
> >>>
> >>
> >> I see, thanks for this observation.
> >> It's surely a possible case, when they access these registers
> >> SMMU state is off.
> >> I will add the suggested runpm ops around the register access.
> >>
> >>> Otherwise Conner and I have vk sparse residency working now
> >>>
> >>
> >> Sorry, could not get this. Did you mean that vk sparse residency
> >> is working now using this patch?
> >
> > Yes, vk sparse residency is working with this patch (plus addition of
> > runpm get/put, plus drm/msm patches plus turnip patches) ;-)
> >
>
> Thanks for testing the sparse residency feature with our patch Rob,
> I have an additional query regarding the adreno private interfaces.
> Specifically, I was referring to other interfaces such as
> qcom_adreno_smmu_get_fault_info [1]. It appears that we do not have a
> runpm get/put around the register access in this context.

get_fault_info() is called from the iommu fault handler callback, so
from the fault irq handler, which is why it didn't need the runpm
get/put.  Maybe it is bad to make this assumption about usage, but
then again adreno_smmu_priv isn't really a general purpose interface.

> Could you please clarify whether we need an SMMU vote around register
> access in the case of PRR? IMO, should the users of this callback ensure
> they put a vote before accessing the cb?

How can drm vote for the smmu device?  I guess it could power up
itself and rely on device-link.. but that is pretty overkill to power
up the entire gpu in this case.  I think it is best for the vote to
happen in the PRR callbacks.

BR,
-R

> [1]:
> https://lore.kernel.org/all/20210610214431.539029-1-robdclark@gmail.com/
>
> Thanks & regards,
> Bibek
>
> > BR,
> > -R
> >
> >> Thanks & regards,
> >> Bibek
> >>
> >>> BR,
> >>> -R
> >>>
> >>>>
> >>>>> +               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> >>>>> +               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_add=
r;
> >>>>> +       }
> >>>>>
> >>>>>           return 0;
> >>>>>    }
> >>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/=
arm/arm-smmu/arm-smmu.h
> >>>>> index e2aeb511ae90..2dbf3243b5ad 100644
> >>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>>>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
> >>>>>    #define ARM_SMMU_SCTLR_M               BIT(0)
> >>>>>
> >>>>>    #define ARM_SMMU_CB_ACTLR              0x4
> >>>>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
> >>>>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
> >>>>>
> >>>>>    #define ARM_SMMU_CB_RESUME             0x8
> >>>>>    #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
> >>>>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adren=
o-smmu-priv.h
> >>>>> index c637e0997f6d..614665153b3e 100644
> >>>>> --- a/include/linux/adreno-smmu-priv.h
> >>>>> +++ b/include/linux/adreno-smmu-priv.h
> >>>>> @@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
> >>>>>     *                 the GPU driver must call resume_translation()
> >>>>>     * @resume_translation: Resume translation after a fault
> >>>>>     *
> >>>>> + * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL t=
erminated for
> >>>>> + *             targets without PRR support. Exercise caution and v=
erify target
> >>>>> + *             capabilities before invoking these callbacks to pre=
vent potential
> >>>>> + *             runtime errors or unexpected behavior.
> >>>>> + *
> >>>>> + * @set_prr_bit:   Extendible interface to be used by GPU to modif=
y the
> >>>>> + *                ACTLR register bits, currently used to configure
> >>>>> + *                Partially-Resident-Region (PRR) bit for feature'=
s
> >>>>> + *                setup and reset sequence as requested.
> >>>>> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
> >>>>> + *                physical address of PRR page passed from
> >>>>> + *                GPU driver.
> >>>>>     *
> >>>>>     * The GPU driver (drm/msm) and adreno-smmu work together for co=
ntrolling
> >>>>>     * the GPU's SMMU instance.  This is by necessity, as the GPU is=
 directly
> >>>>> @@ -67,6 +79,8 @@ struct adreno_smmu_priv {
> >>>>>        void (*get_fault_info)(const void *cookie, struct adreno_smm=
u_fault_info *info);
> >>>>>        void (*set_stall)(const void *cookie, bool enabled);
> >>>>>        void (*resume_translation)(const void *cookie, bool terminat=
e);
> >>>>> +    void (*set_prr_bit)(const void *cookie, bool set);
> >>>>> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr=
);
> >>>>>    };
> >>>>>
> >>>>>    #endif /* __ADRENO_SMMU_PRIV_H */
> >>>>> --
> >>>>> 2.34.1
> >>>>>
> >>
>

