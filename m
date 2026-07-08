Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9411C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqseJKw45hRXs0Xsj9yYbmCdsUhBG43DpFEld216CxA=; b=ASJJVAmW1W8FQ35NRQrBbKvjbM
	FJ//whF78+oSDwyDErj2qt8x3rGqSQ3S6VPhvFXXM09el+KF6YdfuVUG+iIoF01ADKG4E28iBHI7R
	n0FKxESrW1DgxJzPgd0g3X00INnXJfz306nLaIbqgEOb8OsRSo8v3EiPdy+jloQmJNCJKnLmr8keF
	3etL+0wofZ6IuWMDcldoyZcmwO0a8FmCQVLI2ed3JYer+qI2OD4abV+A2fYx8OMTJSau6UGfPAdqt
	/ipndcmy27YWfI/AD7SwrmDVbm6+/r+TLSMN7v6ZZlsuIPDJUkqbrL+q/RXCp6AX2LTIdr2iZ/3wS
	sow5SRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whWLi-000000008E5-0wFy;
	Wed, 08 Jul 2026 17:46:18 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whWLf-000000008DW-3P4V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 17:46:16 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c126b8118afso140043066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 10:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783532773; cv=none;
        d=google.com; s=arc-20260327;
        b=UkCWdEem06V6sPUHXodzYub29QyeB5QuLO30gyEtq43JfIm/NLNHaIYYlfCfkx1dUn
         ygbcbtuC9HuwoUa3PmEdpLYRbwe11dy4q6tHp8tNlzS21asAidV2GKtj3L/LipCwWTGA
         R/9VGA4jVG3s7AUDhEu31R+LEXCAUFUOYjEqslxue85/MmfiXG1ua8x+qGsu3XITOqrk
         vf6x3dXr48cdtCucwXIHXjYwGRtjq/Qcsz5AVzzVZYQyHH0v7xYOfWKuoKYGK0KzW041
         yQb4fu9YcfuoPZhALXFfeeDPoMFUiWO57KXOqIy9IbHWmMAHnoQ5UQdc0b96k2i1WW1X
         vjuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iqseJKw45hRXs0Xsj9yYbmCdsUhBG43DpFEld216CxA=;
        fh=jhzsIeCXJzr6iL7n+EBusHitlKIJiy+2yQIsOkYv/aw=;
        b=qa7/zX2h2A7LMHYXqgmppi/8zCPrLnseLedeSRB5HRT0u5x7hAyoUQAoBLWQj8dR2H
         0mXzGICA18S4TP9jlMMv79Hoefb70P2FmLubRl/LylS1MI+hPccHMcITuVz+4rn15z4b
         mI/NKDkrW5IUM3f8UKMKshLDi43ltdwGDneRh+ZAPq4X8oFcnu20uQtwh2aYs8MTsCo/
         ZKcklmER0rRg/7HzB70fr8i2GYsM/+B/dFJfy4WR2d6C6RFiKBNfi/FOZjX0oy/chcRp
         CERRPeUCR9PSdzHs4WpUQLz0+roUOgYoQ8LYDkDOrux4u248fGdsJBA6Ke3H1Bu0xOPw
         IVvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783532773; x=1784137573; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iqseJKw45hRXs0Xsj9yYbmCdsUhBG43DpFEld216CxA=;
        b=PtbkMDCqTkXM2oVqFFYJ34nZhE/eJCnvF0b18yVtyn3Xs2OpH70mJuiZNJoxoSufz1
         2VU41KE8Plqp8NbeUD8D9Oo+yUwgjB5wPgiend2ZrYNub3ygCPN2AdIVP7pt7TUxB7z6
         UBJVeEZkV47V9628w4SeGck3A8MAwwezb3nGDRBj2eO9UHa87hLdlHV26VaPbnjeMCmt
         KtKhi5TpjWAJvmxj9VV11t7NJIJK40cCKw3Lqlq4KFtrTIK+TAg0+YgIdN3o+TBkHt/3
         bj4tpljZl0uFkMg5MzLWFNGLUFTC3mK/uJ7B6q/yvsBViJLlIrGeroMAgWAboU4FwvlS
         7tzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783532773; x=1784137573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqseJKw45hRXs0Xsj9yYbmCdsUhBG43DpFEld216CxA=;
        b=VlHjlovkAg9I0XUUtrpcWnl18AzC8rnqM4PfwFVrVVrpFJQNUpiAO3VZX0JjKmoobh
         lR5iyllih/MNmWrH4vi26jpJteJ7Glfiz0+ZSVwzwaypvAJmvtV18bwjO5eyvBdMF2zo
         XNWuOSh5D/Pi6GDDd90I5PtdfJEeThWqgzCdsE5M4lVEFgeWHXTFP4RnfCT8gySWqG6r
         gniGocIrPDEneaIfdqRVgE2Pa826xcEqq9I8ZpHzXhPq1EQR6FptPt+9WtKYy9A6BphK
         f+tcDB3SDulI58wRjMDPWkqVM+jLD+xf1muSyxcTAg946/48sLEWOAC5y+zfABkbZxet
         LZSw==
X-Forwarded-Encrypted: i=1; AHgh+RoE2pRv1Zxl5b2ITJeQzZcjqqVTHb0E+3jXjOVWnHN9bRhiP23U2K70Q6MElKNd9P1XTBGtkmljbd5RlKMnynw/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv8qX8kbBYqzV4535kEu0aXtxC3o2UBTS9684PDxXs1Z8Id1mY
	3zOXv2cAe+r+adowk8iER92wOeT9QLJvKHxQMxZbkXtVrE3iOLE4j8G8XMMqsoqkHuOO0FXR0Mo
	T1A86OliZLdxNUFRYbSHnM2ntarKfWj/WuvzXsQGp6A==
X-Gm-Gg: AfdE7cntDjaWx9J85dmGGc52SWFJSCnYi13gTYDJcwNfFqULljvk33ll/8NnDPbvXMB
	pYLI6wdW5SK8Hh16HIRWJEV+nXfx8zcGxIpFE4qE7B3rXHLwhSjp0Hu74GKmLExngDIN3Y29jXK
	pFtUq5uXJ7fibm/QnkkMxv4pRjEtD1F0qOx9jMpL/aLC0byUg/4x3aIAxBoH8TEa3Sl3NCa4NYA
	qmN0vdr2tyYAM5F4wmcWor2TQTvm3nwjfHCOvqhUU7m1dmHemPLRSV617MRG1OsaH3XNQ6WoVXV
	I+wwp+PlEknmSTFcM9ynXvtG79iNrfFALS7R4OVLImw1CAWvPcQ=
X-Received: by 2002:a05:6938:a08c:20b0:c11:fb01:c642 with SMTP id
 a640c23a62f3a-c15ce005650mr115272066b.17.1783532773640; Wed, 08 Jul 2026
 10:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260708165201.624271-1-robert.marko@sartura.hr> <550f7779-8188-45db-8de3-c25eda948cbb@sirena.org.uk>
In-Reply-To: <550f7779-8188-45db-8de3-c25eda948cbb@sirena.org.uk>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 8 Jul 2026 19:46:00 +0200
X-Gm-Features: AVVi8Cfz0AdebYHyA0wucUiR5Guc3jIkYaeEJZQYyfl7PA2Z50uPMBVIKA0DJLA
Message-ID: <CA+HBbNE6Y=N2677j5Lzs_edx1bTVjtmrP6jTaT-Mh_5GdFNNvA@mail.gmail.com>
Subject: Re: [PATCH 1/4] spi: atmel-quadspi: add controller init callback
To: Mark Brown <broonie@kernel.org>
Cc: conor@kernel.org, nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	robh@kernel.org, krzk+dt@kernel.org, alexandre.belloni@bootlin.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, daniel.machon@microchip.com, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_104615_899327_B8D773D8 
X-CRM114-Status: GOOD (  13.60  )
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

On Wed, Jul 8, 2026 at 7:23=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Wed, Jul 08, 2026 at 06:51:08PM +0200, Robert Marko wrote:
> > Allow controller variants to provide a custom initialization callback
> > through their capability data.
>
> This doesn't apply against current code (specifically the DT patch).
>
> As mentioned in submitting-patches.rst when submitting a patch series
> you should supply a cover letter for that patch series which describes
> the overall content of the series.  This helps people understand what
> they are looking at and how things fit together.

Hi Mark,

Thanks for pointing that out. I missed that the SDMCC is not yet
upstream, which is why this one didn't apply cleanly.

I'll make sure to include a cover letter when I respin the whole series.

Regards,
Robert



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

