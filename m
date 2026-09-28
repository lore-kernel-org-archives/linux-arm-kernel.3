Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554AACA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 21:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfXTJyp6yjbRu0qwVAwpSfhNYTOxDGjNF8A7PpynkKU=; b=BPJI+qilP6GUmbnnTx1eRoWcg2
	xBnW/bIp6nnl+ECfNgN4bLJfUp71hY/DrqHo0zojLewjUks+OQgjk7qgT9Smvzjz9nZlT3W7taUM1
	itEWWLG8O0H1i2lgUJOUws2bSdMOTnIO9v5J6YXZA+2Dj/GLnF9t1ydIAzxezDAuRHP5BITPBiPpg
	Wb/tRpbqwhgEQSbALT0nrxKUZ0DWaWnu3TX+qhB3ScaOQXJPAdMmOfSG9LGjwjR1SaFy0X1mUfJUU
	kB1gKd41nBUzZ9gw2O70aw4IiqRGtLuCOIcU+lSN/yj3AL56pFB8vr3ViHVVCTgipE3i3ogAGXxEn
	/XJNTF/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIpx-00000001fOp-3JmM;
	Mon, 28 Sep 2026 21:24:37 +0000
Received: from mail-106100.protonmail.ch ([79.135.106.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIpu-00000001fON-3lpK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 21:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samcday.com;
	s=protonmail; t=1790630668; x=1790889868;
	bh=dfXTJyp6yjbRu0qwVAwpSfhNYTOxDGjNF8A7PpynkKU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I4DsH1qXQ2PQGDCXKZ8k2mbehlZKwgYCa3OehZLJ7ZEw3UdGr4v7+H08qJOgAcshf
	 b3G1+7xQN9oK9BSWeF1GCjDc8nrBr/wdJaEEhoybDa9qozFH1X0KHBQ08lu+4UoxVo
	 RRNrDKvAZtuw8npsoRgoktTTQD94JqSnp1MHU3NGcc0PS3AN+QWZWOR0hF8X87RQrK
	 AcI8F9uEyimLyXQh74EnGlLJ9LMTVF+2/lswNkVBmE2MckBI3to9+oWGsETUGFlSFD
	 3qVC/jRY+GH6Eo57z8bg470qaz6mKBMayLDfaCc/zK+YuALt39HkUKWTKehfIuceLM
	 qkMnNw91c2+gg==
Date: Mon, 28 Sep 2026 21:24:22 +0000
To: Robin Murphy <robin.murphy@arm.com>
From: Sam Day <me@samcday.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Joerg Roedel <jroedel@suse.de>, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom: Invalidate TLB during context init
Message-ID: <enoPRqYYUjyyM0YwlSoxShxeNJxghej7Zhq8UxzN6WtU_JZk8Vzvl0qFkczoIFpEl8y_vbytWT7A_BntCl4HtWPcHUkAi57JoKHJA64Ap1o=@samcday.com>
In-Reply-To: <887e91bc-03a0-4977-aed6-baa2e069d9ee@arm.com>
References: <20260928-qcom-iommu-clean-contexts-v1-1-c88fe2b4ff48@samcday.com> <887e91bc-03a0-4977-aed6-baa2e069d9ee@arm.com>
Feedback-ID: 25366008:user:proton
X-Pm-Message-ID: 13122422adc9c6b1bdaba4e0e81f48ea485fb758
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_142435_606659_7D2C5E1B 
X-CRM114-Status: GOOD (  35.93  )
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

Hello Robin,

On Monday, 28 September 2026 at 10:22 PM, Robin Murphy <robin.murphy@arm.co=
m> wrote:

> On 28/09/2026 7:27 am, Sam Day via B4 Relay wrote:
> > From: Sam Day <me@samcday.com>
> >
> > qcom_iommu derives each context bank's ASID from DT data, so a kernel
> > booted via kexec reuses the same ASIDs as its predecessor.
> >
> > Programming a new TTBR0 doesn't discard entries the SMMU has already
> > cached under that ASID, so these residual and stale
> > translations/table-walks will go into effect as soon as the context is
> > enabled again.
> >
> > On MSM8916 devices (I confirmed it on both a Samsung Galaxy A5 and a
> > DragonBoard 410c) the result is MDP5 taking context faults on
> > framebuffer IOVAs and stuck in a continuous underrun storm during scan
> > out, if the previous kernel had itself initialized the display and
> > programmed the SMMU.
> >
> > arm-smmu invalidates the whole TLB in arm_smmu_device_reset() before
> > enabling the SMMU. qcom_iommu can't do that on these TZ-managed devices
> > (SMMU_SCR1.GASRAE=3D1), however.
>
> Can you not hit SMMU_CBn_TLBIALL in qcom_iommu_ctx_probe()? That would
> seem like the logical equivalent.

That sounds much more civilized, assuming it works the way we hope :) I wil=
l
respin the patch and test to see if SMMU_CBn_TLBIALL behaves correctly on
my apq8016-sbc + samsung-a5u-eur.

Kind regards,
-Sam

>
> Thanks,
> Robin.
>
> > Instead, qcom_iommu now invalidates each context bank by ASID whilst it
> > is still disabled, before programming it for the new domain. Secured
> > contexts are protected by TZ so they're skipped.
> >
> > There's been previous discussion on the list (see link) about how to
> > best deal with this kind of situation. This patch opts for a fix in the
> > incoming kernel, rather than the outgoing one. This ensures newer
> > kernels will always behave correctly, and also covers the kdump use
> > case.
> >
> > Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
> > Link: https://lore.kernel.org/all/20240319154756.GB2901@willie-the-truc=
k/
> > Assisted-by: LLM
> > Signed-off-by: Sam Day <me@samcday.com>
> > ---
> > Tested on my DragonBoard 410c. Starting from one unpatched kernel
> > scanning out at 640x480 and kexecing into the same kernel at 1280x720
> > results in context faults starting at the first IOVA past the previous
> > kernel's mapped extent, with continuous MDP5 underruns thereafter.
> > During this time I observed an all-blue HDMI signal. With the patch
> > applied, the same kexec hop is free of faults, and the HDMI signal is
> > clean throughout.
> >
> > Further, it was proven that kexecing into an unpatched kernel and
> > causing the fault storm can then be resolved by subsequently kexecing
> > into a patched kernel.
> > ---
> >   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 32 +++++++++++++++++++++---=
--------
> >   1 file changed, 21 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/ar=
m/arm-smmu/qcom_iommu.c
> > index 21d18ce67b982..a37955cd90d5e 100644
> > --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> > +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> > @@ -111,23 +111,26 @@ iommu_readq(struct qcom_iommu_ctx *ctx, unsigned =
reg)
> >   =09return readq_relaxed(ctx->base + reg);
> >   }
> >
> > +static void qcom_iommu_ctx_tlb_sync(struct qcom_iommu_ctx *ctx)
> > +{
> > +=09unsigned int val, ret;
> > +
> > +=09iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
> > +
> > +=09ret =3D readl_poll_timeout(ctx->base + ARM_SMMU_CB_TLBSTATUS, val,
> > +=09=09=09=09 (val & 0x1) =3D=3D 0, 0, 5000000);
> > +=09if (ret)
> > +=09=09dev_err(ctx->dev, "timeout waiting for TLB SYNC\n");
> > +}
> > +
> >   static void qcom_iommu_tlb_sync(void *cookie)
> >   {
> >   =09struct qcom_iommu_domain *qcom_domain =3D cookie;
> >   =09struct iommu_fwspec *fwspec =3D qcom_domain->fwspec;
> >   =09unsigned i;
> >
> > -=09for (i =3D 0; i < fwspec->num_ids; i++) {
> > -=09=09struct qcom_iommu_ctx *ctx =3D to_ctx(qcom_domain, fwspec->ids[i=
]);
> > -=09=09unsigned int val, ret;
> > -
> > -=09=09iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
> > -
> > -=09=09ret =3D readl_poll_timeout(ctx->base + ARM_SMMU_CB_TLBSTATUS, va=
l,
> > -=09=09=09=09=09 (val & 0x1) =3D=3D 0, 0, 5000000);
> > -=09=09if (ret)
> > -=09=09=09dev_err(ctx->dev, "timeout waiting for TLB SYNC\n");
> > -=09}
> > +=09for (i =3D 0; i < fwspec->num_ids; i++)
> > +=09=09qcom_iommu_ctx_tlb_sync(to_ctx(qcom_domain, fwspec->ids[i]));
> >   }
> >
> >   static void qcom_iommu_tlb_inv_context(void *cookie)
> > @@ -270,6 +273,13 @@ static int qcom_iommu_init_domain(struct iommu_dom=
ain *domain,
> >   =09=09/* Disable context bank before programming */
> >   =09=09iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
> >
> > +=09=09/* The TLB may still hold cached and stale entries for this
> > +=09=09 * ASID, if a previous kernel programmed the SMMU before
> > +=09=09 * a kexec into this kernel.
> > +=09=09 */
> > +=09=09iommu_writel(ctx, ARM_SMMU_CB_S1_TLBIASID, ctx->asid);
> > +=09=09qcom_iommu_ctx_tlb_sync(ctx);
> > +
> >   =09=09/* Clear context bank fault address fault status registers */
> >   =09=09iommu_writel(ctx, ARM_SMMU_CB_FAR, 0);
> >   =09=09iommu_writel(ctx, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
> >
> > ---
> > base-commit: 3339792beb5fb1c9c423c544ba2fbc235e7d7f75
> > change-id: 20260926-qcom-iommu-clean-contexts-3ccda804c08d
> >
> > Best regards,
>
>

