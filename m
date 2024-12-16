Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38740E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 20:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGu56YKO1XlSS7wwJkm05qsGyYVWIdWmEMISHyf2DmA=; b=XQnMPTvS5/6EfwgKZsYlZG5LO3
	b009Qvyndo6WBy/apcqfTfW8voztTIAA1tujlLRiRuXe2lNYwqiE8/9pTt1o5MGSKWY+FasTxx6ci
	afM855H0pHc8fMUxCUGxA2RNjFd4CSqY1gu/dbjPNj1H6npYp99DQtbXIktpaouwIz8exOkfBzqOG
	LwmPZQeLedaH2Q0iQhT1u1mnOf5EWlJssAo3+tsl5zW4YygCPOhafLBoEoMHkfshy3ZHoyJ52ca8V
	TQglvayNxeAm+9X9IFRPzS5R0NZA3Sc7U/ohU0O7WePDemK8UbsmgdbX7jJQL7pxJOtUit1VPIFgd
	jtOWIjHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNI8K-0000000BL9P-2uj8;
	Mon, 16 Dec 2024 20:56:04 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNI7F-0000000BKw5-0xp7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 20:54:58 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3a813899384so15467985ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 12:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734382496; x=1734987296; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGu56YKO1XlSS7wwJkm05qsGyYVWIdWmEMISHyf2DmA=;
        b=JkLoidU0/uR0nZoFGEEzTzkezRaz44oBuvSCXtbDE9WsEtYyZ3pVsoAh3pR3xb1MNj
         ok7QsgkAoqe5HEgxV57MhL3a8dPoIekzHIsWptXTGzUs2vL4QCRCrGPUNNfpMT8oSLfq
         AHdeZRpCtDn3JPxdkHJSjch+e/iRqaS6BBJIHuiFUGDJqisBUIGd8WIB4r4Tqcrfrxz1
         72U7ONCrx8pL1uvFtGygFBiphcOzwEw+zg1nbR07azLdrf/kbIcu2wWp3ZWK9OC5lXjM
         /Dy6ff59M7hKSN+jh8+k440SKWvJRHQulGS1tQU0lju8jLD2mh1yur6jvw33X+2+3rWP
         j1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734382496; x=1734987296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGu56YKO1XlSS7wwJkm05qsGyYVWIdWmEMISHyf2DmA=;
        b=vekJcOeiEhhw0h2zBtmNgtbnyNI6GVBzOXRR5/VCnVhuBX0n7mk3xDmm5C1acZspJv
         eb7vo26TSXdljyzaA5mBHCAE0iwEL2jrmQUUrfYbRwNkMN5G9X0gCYN3ZyKo5rNAO4mE
         WcKbDAS4/w3ME2NfaWhsfrkfctvSP3yOdvAtLJjfM1TU2CsgZUw57RZRAUK8kKtJUSL/
         87pTj/RjbCrVmCm0pXjNT+ku9rlgjhutQmMh6kcvAQdhg3vZbFLqEurjxyK/swQ0P4B2
         pTX0rPLVJ5NOg9impMNKoWa3GtiiWqJ7lD6DMCHhH3q6PRBBPaqGocUzXJ04FrtsINaw
         tr0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgQBd4NyS9yiTKPRHCj+oFfz0oFDCRxlN1+/R9rt8xTf/v9N6l8x4HUzOwrPnp4Ij0Gvd25bv5uSgDiro/kvyP@lists.infradead.org
X-Gm-Message-State: AOJu0YyL6LfHGBAaHObwhcn3S0mdP2Ovh7uuCXPhLLIa5+ha3VxbFSKN
	/AXN7rto5Lc4ow4vEsWU3yLLFrtDjU9nJmgU3Tv2iJTpLs8mZl3JPB1OHRnjc0qLZASSZucq/So
	1AVGBF+KSO0UJYJsl9K1oSVqJZM4=
X-Gm-Gg: ASbGncumkYpCdR1Cz7vGolFhwxeguDHRmdgSFKyVC+S8es/38ReIjx2ZfR67pKJgw+i
	bIePEsO+cX1DHcFzhevYv0pR9uVBYNrnLwWKi+310fomZA4ILqX/7irKGF3acRCQRb7cw
X-Google-Smtp-Source: AGHT+IE6NSDPDfv/Nr17YFiwuwQ8NV0QFzK1yfUD5+dRWkpGvLeKWKyM4SsI5zKJl53NjUsanNs56HL6Xdim8pgvJWw=
X-Received: by 2002:a05:6e02:1a07:b0:3ab:4bea:df97 with SMTP id
 e9e14a558f8ab-3affbbb656fmr160374485ab.23.1734382495871; Mon, 16 Dec 2024
 12:54:55 -0800 (PST)
MIME-Version: 1.0
References: <20241216171017.4881-1-robdclark@gmail.com> <a15a7594-8793-478b-a86e-81a06812e4ff@quicinc.com>
In-Reply-To: <a15a7594-8793-478b-a86e-81a06812e4ff@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 16 Dec 2024 12:54:43 -0800
Message-ID: <CAF6AEGsFeibyH5_a7m=9PMKReD4Xb+c=dEGsbCN0_UHiJK1vbA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_125457_268138_5ABA5CD1 
X-CRM114-Status: GOOD (  20.80  )
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

On Mon, Dec 16, 2024 at 12:28=E2=80=AFPM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On 12/16/2024 10:40 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > On mmu-500, stall-on-fault seems to stall all context banks, causing th=
e
> > GMU to misbehave.  So limit this feature to smmu-v2 for now.
> >
> > This fixes an issue with an older mesa bug taking outo the system
> > because of GMU going off into the year.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu=
/arm/arm-smmu/arm-smmu-qcom.c
> > index c4c52f7bd09a..1c881e88fc4d 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -331,8 +331,10 @@ static int qcom_adreno_smmu_init_context(struct ar=
m_smmu_domain *smmu_domain,
> >       priv->get_ttbr1_cfg =3D qcom_adreno_smmu_get_ttbr1_cfg;
> >       priv->set_ttbr0_cfg =3D qcom_adreno_smmu_set_ttbr0_cfg;
> >       priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
> > -     priv->set_stall =3D qcom_adreno_smmu_set_stall;
> > -     priv->resume_translation =3D qcom_adreno_smmu_resume_translation;
> > +     if (of_device_is_compatible(np, "qcom,smmu-v2")) {
> > +             priv->set_stall =3D qcom_adreno_smmu_set_stall;
> > +             priv->resume_translation =3D qcom_adreno_smmu_resume_tran=
slation;
> > +     }
>
> Shall we disable this from the driver instead? A debugfs knob to trigger
> coredump after a pagefault is very convenient.

It would require the driver to find the compatible for the smmu, so it
could differentiate btwn smmu-v2 and mmu-500, which seemed like it
might be a bit uglier.

Ideally/hopefully we could figure out how to make GMU a bit more
resilient in the face of stalled translations, because it is useful to
get accurate devcore dumps on smmu faults.  At that point we could
revert this change.

BR,
-R

>
> -Akhil
>
> >       priv->set_prr_bit =3D NULL;
> >       priv->set_prr_addr =3D NULL;
> >
>

