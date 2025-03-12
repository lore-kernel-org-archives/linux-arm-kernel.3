Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5727C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 15:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMrlZ7TtkaQuy37XoBmFTMRDwm8cFmyklhT5/AoAOS0=; b=y0bDChub2/dlkuknamT+SU0UOS
	SeMo1/udz8ZlKijMtQH8xSWrUCm/8HfrmZW+o1+OQ5yrSQoKFpnia1Ly+k6cnywei+NBMswYOOZnS
	/umWDWCbUupQnNXAcAywxY4K7VDVtQETq4tWeszJaFjP6LFrrKjEL5s3VIKoS9oi8HzemnJxhAcEb
	62oh/PL0aznAmssbxHTzLOMdL7Cb0le0/5OcdKOcu6pD9c6QaxhHvsoy4wk9FRrc3EALXRIbNfT+k
	4g64pii0dGFjcD/RZRLH+WiTKd8/dOMjz6eHHzX+PBHooQ+BrbUS5CxeeoBa38lvRNN3isWgieKnE
	fm8Q0JMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOBj-00000008twS-0CpK;
	Wed, 12 Mar 2025 15:40:07 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsO9N-00000008tb1-2eUm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 15:37:42 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3d450154245so29592485ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 08:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741793860; x=1742398660; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMrlZ7TtkaQuy37XoBmFTMRDwm8cFmyklhT5/AoAOS0=;
        b=OpLyiT1AyUdtPzbbFkhgYoWpYSaZGsKSLpV+QyVg/QihFaKys76qhEshj0z25SVSsM
         kfxDgYpqdUzomPFUIhVQ4IAX/HZzGpgQge6uT27p3f8h0YDqaCT6NsrdYCNl4nxvcUBt
         F8YJXTy+p4u1aEci0GXLVy3wK6vWC5QMXGp9Vz01LM23WPsBXmqYhAigGAN/FvowHHJZ
         eEDL9ANgcy1md9ej/WuuI44bH/Ygqc7U06ZV0lba/Osf6/n4ZdpWPmX1urQh+GtHCTCG
         b2o8As7RthgPfs1C+KOZ1m57aIzWJ951R6XOtGXr1EOUmRGS+C+gKF4tO1VA5+HyPzo/
         EVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741793860; x=1742398660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMrlZ7TtkaQuy37XoBmFTMRDwm8cFmyklhT5/AoAOS0=;
        b=wkhuIiJHefd60/7IVbIxnNOxE2BrOSt4EDaVI8/fVCdpKnq2nHmpqBJs7P+TyoSOHn
         6l6Z+zM1UIneSUw1XNGXs+XQXa3KgWIi0TmL89+yEBxnCuirAFaBFaXEu/TdeFx3jor5
         mj/M2x3Ev5X9RoxtV+Lwxv5GmUjA6fRGxY+QggrGBiBvjktyX6vihcgdtpO/fRqR+U9B
         S4vevYMfihQKdyNjqOk1YgvZcvQE1WsoneqFv2qw/e11plULg1ptUvkylnFZl29O58ow
         obnwqfIApTVApV36kjPX/b7dIAWdF6ORAfil72eNFBPvQXBNXXm45fIs0HhyUYA2ZZ03
         QOZw==
X-Forwarded-Encrypted: i=1; AJvYcCVdIjJ/XoL3vG9IAnl4Bmb08b4jyaHyhZuPyDDp0N4gqO9JifGQWm0ktVHGkYq+qx7vaRki/Og43WOxUU4avxpp@lists.infradead.org
X-Gm-Message-State: AOJu0YxiywomZM6fEXFJHlCCSWH+dQWbAtFD88N87ZolKwcmy4XIAeAI
	Kqxw9RQJG858XU6V7VUePkOR5t6DwxsnQMIxOyFqWmLTPJwy89T//0svVM/qvRFeV+KK7WLh2cQ
	kxFoTMtNDAT0bDH5UqycQKz7DT8I=
X-Gm-Gg: ASbGnctesOynhNqlu21BKUmuMqSPrB3K+mO/eHPejtq0OBCcAaFD81dHLNet6zuEkTn
	c9bKsfSH5SeT8XJVZB+eTNFWvYAJiXmeh5MdZGcmB7zNg3SY3Ip8wbHmAOva+XAzuLNkvY0rG5/
	F9PV87NPhlRNUSHnAQY72VYMR+KfIsxZ502MJ/JjRg5HHU7wMxseSTgZmeD0ZKaiEakkw=
X-Google-Smtp-Source: AGHT+IH8sNbtyRtPBc86b6yqtNTtxLe+g14B50y3MAoRxzA6AkWmg3s1QxxNYTJ6OnJNaPf6hfx0HKWOAGJrh4dWDCY=
X-Received: by 2002:a05:6e02:1a05:b0:3d3:d067:73f8 with SMTP id
 e9e14a558f8ab-3d4418d0596mr221485665ab.11.1741793859848; Wed, 12 Mar 2025
 08:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <173625436399.258197.10961901698600591079.b4-ty@kernel.org>
 <20250311175528.GA5216@willie-the-truck> <CAF6AEGvDyPtXN7Cn98BKsTM9GjUzy1sTEOsLiz-cdvaZ14qWyA@mail.gmail.com>
 <20250312130846.GE6181@willie-the-truck>
In-Reply-To: <20250312130846.GE6181@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Mar 2025 08:37:28 -0700
X-Gm-Features: AQ5f1JovmMWQD_O1PD6cpwLN-pH1HxH4w3bZZDBIgzK7Opj6tqGtZU_Fkjgi4xs
Message-ID: <CAF6AEGtrUKybxPZMxkUgjg8JCxPr7-pRe0noS7=y6UrbHxDzZw@mail.gmail.com>
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Will Deacon <will@kernel.org>
Cc: robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, 
	robh@kernel.org, krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, 
	dmitry.baryshkov@linaro.org, Bibek Kumar Patro <quic_bibekkum@quicinc.com>, 
	catalin.marinas@arm.com, kernel-team@android.com, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_083741_668888_264A5720 
X-CRM114-Status: GOOD (  23.02  )
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

On Wed, Mar 12, 2025 at 6:08=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 11, 2025 at 01:03:29PM -0700, Rob Clark wrote:
> > On Tue, Mar 11, 2025 at 10:55=E2=80=AFAM Will Deacon <will@kernel.org> =
wrote:
> > >
> > > On Tue, Jan 07, 2025 at 04:42:39PM +0000, Will Deacon wrote:
> > > > On Thu, 12 Dec 2024 20:43:57 +0530, Bibek Kumar Patro wrote:
> > > > > This patch series consist of six parts and covers the following:
> > > > >
> > > > > 1. Provide option to re-enable context caching to retain prefetch=
er
> > > > >    settings during reset and runtime suspend.
> > > > >
> > > > > 2. Remove cfg inside qcom_smmu structure and replace it with sing=
le
> > > > >    pointer to qcom_smmu_match_data avoiding replication of multip=
le
> > > > >    members from same.
> > > > >
> > > > > [...]
> > > >
> > > > Applied to iommu (arm/smmu/updates), thanks!
> > > >
> > > > [1/5] iommu/arm-smmu: Re-enable context caching in smmu reset opera=
tion
> > > >       https://git.kernel.org/iommu/c/ef4144b1b47d
> > > > [2/5] iommu/arm-smmu: Refactor qcom_smmu structure to include singl=
e pointer
> > > >       https://git.kernel.org/iommu/c/445d7a8ed90e
> > > > [3/5] iommu/arm-smmu: Add support for PRR bit setup
> > > >       https://git.kernel.org/iommu/c/7f2ef1bfc758
> > > > [4/5] iommu/arm-smmu: Introduce ACTLR custom prefetcher settings
> > > >       https://git.kernel.org/iommu/c/9fe18d825a58
> > > > [5/5] iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500
> > > >       https://git.kernel.org/iommu/c/3e35c3e725de
> > >
> > > Hrm. I'm not seeing any user of the new ->set_prr*_() functions in
> > > linux-next yet. Is there something under review, or should I revert t=
his
> > > for now?
> >
> > It is WIP, part of a larger patchset adding sparse binding support in
> > drm/msm.  Please do not revert.
>
> Sure, if it's actively being worked on then I'll leave the hooks in
> place.
>
> Do you have a link to the patchset so that I can follow along, please?
>
> Will

https://patchwork.freedesktop.org/series/142263/

I'm currently working on resolving the shrinker hack, which is the
remaining TODO.  So I'll hopefully be able to drop the RFC tag and
post a new version in a couple of weeks.

BR,
-R

