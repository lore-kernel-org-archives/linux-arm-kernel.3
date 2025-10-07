Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80DCCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 19:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iUti3RModmlHi7jtpIcdt26BPjskgCGc5piTAZQzxA=; b=iiOMj7Atay4eIR7JKBXziRsct+
	jA4dZLZ5Rcp0QQYVRJVe2w3HqfmOi5UYjlRj+7TjPkdOUkok2MPSooFv+/e3A4paZukMFyDKxm+qz
	E9dsl+7Yk+Zwy8NHKRDQPuCHSNa9IUisuIEuZxgO7TpsvNLaMI7K4Z5fpUfTibmCNa5jibYYNl3ub
	rHxLs8q+SWA4ZKonFaYuGUJI0AD09ZIljbhYhpCiiN4iPjxzBShic54ZJw1imOE5/vbedQ0q/yywa
	HAFxC7tK+SF1nif5NvwLmsAoP3F4FAVKaPfrSSdaPIQE7NY76ruY3Vka9GDH7aIsjH52pyFPXLUp/
	biv/zsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6D1h-00000002ehT-0agt;
	Tue, 07 Oct 2025 19:07:09 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6D1f-00000002egN-0q7N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 19:07:08 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-635355713d9so7106179d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 12:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759864026; x=1760468826; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iUti3RModmlHi7jtpIcdt26BPjskgCGc5piTAZQzxA=;
        b=z2gejQzbRm6+NTNrfYWSgwjL+OZdMG8c/1+svYoMQKLnVyA9k0PtVRY9k+AHgcXKLo
         pABFBlB/WhfIDyso3iXLmyGotw571DXpeJMTemzOwc0OcyOXlx5j5VaD2GlPU9rPjebh
         V+TTXNqPcDkJY4mlGfnaDw8seyl9gu1NzFQAX5wjU22PIgrTf3RPBH9y/nqLmt+B3Xum
         1Sp7IQaxHtAghm4CrYBLgWHClTPZnkbQcQyt2P0m+iarVbqM1LL3W3OicgFcI0Qt9mER
         qY6A2Nhbk597G6LM/5kVIgqGU3vohimURE89yj8WHHOVCjt2GKuWMjIKRPPDZFy2XFL7
         jpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759864026; x=1760468826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iUti3RModmlHi7jtpIcdt26BPjskgCGc5piTAZQzxA=;
        b=rTovq/iyjf9Dhvxu8FBWQq/rVidI0J5IuChPdHK2E3+gSRaBXpvdwfYD0A/TIEgSLe
         eueMtVv2Z16/qMlNe26TAhxo53x9TXnPA6qAwWwyQdbTwgy2gTuYqOKY8fSbhABhzPgP
         f+/eZcac/CKydseydAY7S/3He119r9NaS3qn327rDQMkQfakAC+cYGh/4OSnWsjOL9OL
         f9VQ5+UTkZK22/HaGq2P700Rv4W9nVSg2I5C5lTLA+VPqeKCavT8MJS8hSuEkwDxTtZC
         vs2bkhEl7UtOzDf6H0G7c/z+xHnqXm8JHXR+3Z0+Sw4ohl+OkFvlyzvu4Ltnu5JHes0a
         V3SA==
X-Forwarded-Encrypted: i=1; AJvYcCVJKrcWTh4cK+vYhVxhAN9nto/UhkwnUsiUKvXLfAp5qbXR7J1sV/MGxMt1vBvq45Aq7iKugz16abX6FOr/Pq0F@lists.infradead.org
X-Gm-Message-State: AOJu0YynEQAPZuwsRG70Bn6/gDuzZ9jMBOglBP2B5VHYOaYecVy+Atii
	4sEPoaioq5pwxTXHZItknzAlOweIv2ErCwmtewTKEmUN8+1N/75opteVcfvtx7y+dlmX1ZlkOmI
	rQd0M5ZA+gURn9pL1lexitAyfvBXVdAKM00uTuM8+ig==
X-Gm-Gg: ASbGncuYFy491smlB1VmIMqffES64qJDWzX0D2asq1XeOPdgXeo8Gdxx+XrO1xz7/Q4
	3XFbh4o/+gNUvH1vx7DrWsLQQ1Dgnedi+R4tjDdgc3bYJrEQQrqXjgbdAYQl/oD/QXbHpG/jkTW
	QLuPSnJbkXF8460WaMzxmXr0+mk2Upl6gxcbR7Hh82e6cHwGrqBifJSLq9O3IELMBaU2iQ/bvk9
	0Oq35TBzo/hHBn1wTwFdcjZ5JxjkjHcJA==
X-Google-Smtp-Source: AGHT+IHGabCWkJ+CSgQuNpDDGJm5CBq1o8eRFzjGkU0N7AFW1WICocRBQKTnUVXzNlv6ZZDS/IDRlDvAToOZJFwsXgE=
X-Received: by 2002:a53:c64b:0:b0:629:ec90:c446 with SMTP id
 956f58d0204a3-63ccb8240e3mr675987d50.12.1759864025589; Tue, 07 Oct 2025
 12:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
 <20251002-gs101-pmu-regmap-tables-v1-3-1f96f0920eb3@linaro.org>
 <CAPLW+4nvuGd8AoDKK1VdF2pabCHzjgYHRJkYrcncRt4s=qt8Dw@mail.gmail.com> <2c36d66dc3eaf8f0f9778dd6a1d45806e7d9bcdd.camel@linaro.org>
In-Reply-To: <2c36d66dc3eaf8f0f9778dd6a1d45806e7d9bcdd.camel@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 7 Oct 2025 14:06:54 -0500
X-Gm-Features: AS18NWBO7FvM4SL8eDmLZftkdQk-t8hGwCLxZkF8ye__N3jbcGABazPA6EkFfAk
Message-ID: <CAPLW+4mmbtFvdyijMQ+xG1S_FQeZyHt+cYJgycWTmpsnNNmamg@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: samsung: gs101-pmu: implement access tables for
 read and write
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_120707_254905_B7B7C8C7 
X-CRM114-Status: GOOD (  31.33  )
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

On Mon, Oct 6, 2025 at 2:06=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> On Fri, 2025-10-03 at 13:24 -0500, Sam Protsenko wrote:
> > On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszi=
k@linaro.org> wrote:
> > >
> > > Accessing non-existent PMU registers causes an SError, halting the
> > > system.
> > >
> > > Implement read and write access tables for the gs101-PMU to specify
> > > which registers are read- and/or writable to avoid that SError.
> > >
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >
> > I think having "Fixes:" tag would be justified here?
>
> I decided against, because IMHO it's not a bug fix as such, it's a new fe=
ature.
> >
>
> > > ---
> > > Note there are checkpatch warnings 'Macros with complex values should
> > > be enclosed in parentheses' and 'Macro argument reuse' for macros lik=
e
> > > CLUSTER_CPU_RANGE(). Since they are used in an initialiser, the only
> > > way to get rid of the warnings is to avoid the macros and duplicate a=
ll
> > > the related register ranges I believe, which I'd rather not due to th=
e
> > > sheer amount of similar blocks.
> > > ---
> > >  drivers/soc/samsung/gs101-pmu.c             | 306 ++++++++++++++++++=
++++++-
> > >  include/linux/soc/samsung/exynos-regs-pmu.h | 343 ++++++++++++++++++=
+++++++++-
> > >  2 files changed, 640 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs=
101-pmu.c
> > > index b5a535822ec830b751e36a33121e2a03ef2ebcb2..5be1cbfa58c95e466bbdf=
954923f324f74460783 100644
> > > --- a/drivers/soc/samsung/gs101-pmu.c
> > > +++ b/drivers/soc/samsung/gs101-pmu.c
> > > @@ -8,6 +8,7 @@
> > >  #include <linux/array_size.h>
> > >  #include <linux/soc/samsung/exynos-pmu.h>
> > >  #include <linux/soc/samsung/exynos-regs-pmu.h>
> > > +#include <linux/regmap.h>
> >
> > If you decide to add this line to exynos-pmu.h (as I commented in the
> > preceding patch), it can then be omitted here.
> >
> > >
> > >  #include "exynos-pmu.h"
> > >
> > > @@ -19,9 +20,312 @@
> > >  #define TENSOR_PMUREG_WRITE            1
> > >  #define TENSOR_PMUREG_RMW              2
>
> [...]
>
> > > +#define CLUSTER_NONCPU_RANGE(cl)                                    =
   \
> > > +       regmap_reg_range(GS101_CLUSTER_NONCPU_IN(cl),                =
   \
> > > +                        GS101_CLUSTER_NONCPU_IN(cl)),               =
   \
> > > +       regmap_reg_range(GS101_CLUSTER_NONCPU_INT_IN(cl),            =
   \
> > > +                        GS101_CLUSTER_NONCPU_INT_IN(cl)),           =
   \
> > > +       regmap_reg_range(GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl),  =
   \
> > > +                        GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl))
> > > +
> > > +       CLUSTER_NONCPU_RANGE(0),
> > > +       CLUSTER_NONCPU_RANGE(1),
> > > +       CLUSTER_NONCPU_RANGE(2),
> > > +       regmap_reg_range(GS101_CLUSTER_NONCPU_INT_EN(2),
> > > +                        GS101_CLUSTER_NONCPU_INT_DIR(2)),
> > > +#undef CLUSTER_NONCPU_RANGE
> > > +
> > > +#define SUBBLK_RANGE(blk)                                           =
   \
> >
> > Reusing the same names for different macros seems a bit confusing. But
> > that might be just a matter of my taste, so no strong opinion.
>
> And I OTOH explicitly picked the same name because it's the same block, j=
ust
> for r/o instead of r/w :-)
>
> [...]
>
> >
> > That's quite an extensive list of registers! Does this PMU driver
> > really have to cover all of those?
>
> That's what all Samsung PMU drivers do, it's the PMU region after all. Al=
so,
> in the gs101 case, only the PMU driver knows how to do the secure access:=
 Various
> other drivers have references to this PMU regmap, e.g. phy drivers for is=
olation
> (USB & UFS) and upcoming PD driver will do too. We don't want to reimplem=
ent
> secure access in all of those.
>

Ok, thanks for explaining this.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> Cheers,
> Andre'

