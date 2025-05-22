Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870BFC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 17:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOEl1TkXbJvK+hjxDiM3ONVF+1lJ62eaBPb7K6Qp2HM=; b=xm9m4uZjvMmIYCoL/8rlfqUimu
	vkPYpufS51cXprf6sS5VHohaIAHzElCp6xUdS1SxhcHb4F6H6YuPi7VIklefs9klUjyufoWMARscM
	Gx5Nwaw9hbaaoMYXsGX2wvuWzbJ730mZNfRKOVGTLqQbNnda/ia9rIMDrwywYYm57cE+Qwc7FUULt
	Qc1UH5plE2OUvg6u+vouRHZPx2XBDnEMTi6wioT90ut1Yiuhg5c9G75pLKNiQkbVZY0huFo1wBAge
	h+I54bqrX+ct/TJlfBL+jyWFt2LnBtvdFATI4jbTaRkhr/4LfYD00/nvSVWczqWUxVn4SzlQm8biN
	1ZuWVKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9dA-00000001j9f-14qd;
	Thu, 22 May 2025 17:22:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9b7-00000001iqH-1GNh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 17:20:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7465BA4F03B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 17:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3D6C4CEE4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 17:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747934447;
	bh=f0XMvMxyxmQO+2lM8j8iwFTLKsVl26kGRvuGKeTW2FI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dImguw1T60mad+h3HSsvAIAGBZoPyTPvysg0PLKfbw7ZusucDBwWkXb/t8dv8WMOU
	 ZZ6aAsxZ3NJaHzMeK/jILjLP3f8g/G5mfEWuPVyaHDO7YU2O0/3emWRgm3pOcU/MoM
	 JmlGrDbi1bgSs7VKOTVEUhua/5BFdd5TCnrm1JsexjraKyYjwoxxR/waR0FmqALK7U
	 xbqfkbyRGTquiPEsVtBNQYh/T7x6txLXkXBg1QEvdEh+0GNyr9mlk8LW4muXOp/J3t
	 wYvzYg2cpvpsRfSGiwFDKDnCHx7VRengnDHNYN1c1iRuk7Zj09NcuXByPiXItZX38l
	 KVc5EXz0yFjaw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad51ef2424bso1326223466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 10:20:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUA8FkLP3q7vcURFXwLnz9BxnAtcU71s9bHUVG5BZppJOzxhtUWJbKMlIKG+juAos7FWQBG/KvVaGzkP+eK1pIV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0mTpD0tS5Fugter4LXmrx0cKUdjGowH3XPPh9uedm/zNhvCr4
	NLpHph78os4mVeb0A1fNATQ7SUXvXJknfu2Slvqv9ab8LQtfhQVJnoXsCMmsBULXxEtifc2JTOj
	z7k0L0rI/wp0YWS6ls4NWRXGAMmM6qw==
X-Google-Smtp-Source: AGHT+IGAYYG+vIgGuI/ayC2uGqWgyniPCcMHhUSyeQcygsPjUjSYmhf9rYJn77siFd52fYZ5ibkezDZJq/F4ygapM/I=
X-Received: by 2002:a17:907:3f08:b0:ad5:6939:8333 with SMTP id
 a640c23a62f3a-ad569398704mr1462923066b.37.1747934446333; Thu, 22 May 2025
 10:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-arm-brbe-v19-v22-0-c1ddde38e7f8@kernel.org>
 <20250520-arm-brbe-v19-v22-2-c1ddde38e7f8@kernel.org> <aC9NhvYzajduVm7y@e133380.arm.com>
In-Reply-To: <aC9NhvYzajduVm7y@e133380.arm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 May 2025 12:20:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKWY7rRGTbHXTmm4RC9F8fqrs133=75XFkVdm91bLHfaw@mail.gmail.com>
X-Gm-Features: AX0GCFvVXljRLS6CQowdkTNTXjrD3dK31miPdgViETu3tYaW68KPRqx4Jf1fUa0
Message-ID: <CAL_JsqKWY7rRGTbHXTmm4RC9F8fqrs133=75XFkVdm91bLHfaw@mail.gmail.com>
Subject: Re: [PATCH v22 2/5] arm64: el2_setup.h: Make __init_el2_fgt labels
 consistent, again
To: Dave Martin <Dave.Martin@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	James Clark <james.clark@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Leo Yan <leo.yan@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_102049_479850_237CAAF7 
X-CRM114-Status: GOOD (  27.09  )
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

On Thu, May 22, 2025 at 11:15=E2=80=AFAM Dave Martin <Dave.Martin@arm.com> =
wrote:
>
> On Tue, May 20, 2025 at 05:27:37PM -0500, Rob Herring (Arm) wrote:
> > From: Anshuman Khandual <anshuman.khandual@arm.com>
> >
> > Commit 5b39db6037e7 ("arm64: el2_setup.h: Rename some labels to be more
> > diff-friendly") reworked the labels in __init_el2_fgt to say what's
> > skipped rather than what the target location is. The exception was
> > "set_fgt_" which is where registers are written. In reviewing the BRBE
> > additions, Will suggested "set_debug_fgt_" where HDFGxTR_EL2 are
> > written. Doing that would partially revert commit 5b39db6037e7 undoing
> > the goal of minimizing additions here, but it would follow the
> > convention for labels where registers are written.
> >
> > So let's do both. Branches that skip something go to a "skip" label and
> > places that set registers have a "set" label. This results in some
> > double labels, but it makes things entirely consistent.
> >
> > While we're here, the SME skip label was incorrectly named, so fix it.
> >
> > Reported-by: Will Deacon <will@kernel.org>
> > Cc: Dave Martin <Dave.Martin@arm.com>
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > This one can be applied even if the rest of the series is not.
> >
> > v22:
> >  - New patch
> > ---
> >  arch/arm64/include/asm/el2_setup.h | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/as=
m/el2_setup.h
> > index ebceaae3c749..30f57b0334a3 100644
> > --- a/arch/arm64/include/asm/el2_setup.h
> > +++ b/arch/arm64/include/asm/el2_setup.h
> > @@ -204,19 +204,21 @@
> >       orr     x0, x0, #(1 << 62)
> >
> >  .Lskip_spe_fgt_\@:
> > +
> > +.Lset_debug_fgt_\@:
>
> Dangling label?  There doesn't seem to be any branch to it in this
> series, unless I've missed something.

I tried to explain that in the commit message. To have both what you
wanted and what Will suggested, you end up with 2 labels in between
the last skip and setting registers.

Rob

