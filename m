Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D38C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 21:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpucKaFQXs24/Gdxy0fvjSfjmEgyvs47syPRCcBg2xY=; b=TwkRiuIDQ+bSp/xdGsT27jiRnd
	2rJsaUfoD7mrC5vK4YEncXpms2sc2uUGgJlvMnIOEgSi5yAStATfBAwrVy1KDb9/W08rnI34Gko7c
	Crmx/Pj7SgBFAhmZ726tXiZG3htnHL3rH2qNId6i60sju5mpopvB6vcAYGdKqjdLJzC8ERhvHeOjQ
	zte7SK+WljUN2gcGj1FM6Nb6At7ckM8ZFZlAxzD1zpruga9j59XEyaeDBnmBGW0QAAM46vyyrXpqK
	kBduY8bAsTngHabXfSKOcUdFCHRVfTY5jzf4FcVL3OBcH5OIur6rmIS6D5HvvENTgT4AZ4T5DYxUT
	mXiiuV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58e-00000009bWB-04dh;
	Wed, 02 Jul 2025 21:37:08 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX56I-00000009bFk-16ZS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 21:34:43 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-4e8135adfccso1822142137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 14:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751492081; x=1752096881; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpucKaFQXs24/Gdxy0fvjSfjmEgyvs47syPRCcBg2xY=;
        b=qz98ccEg2rFXSpJDKteyUSjgleOSikF/xPBeQwSpJQaaeYeX9KwhfWFqvSvPcin7nK
         WzqvmN4bzvVN8Crqtq6gG5Ked1AVkrERss7lMvRQQCDIvt59KKMxAusCou3zq0Bx3e6s
         jtKU8dD1pcERbZR6itINuVbowu1ghPuTWgNDXxMlrqV4VYaaUxHfgPOxQk2NnJabzS6+
         LuuEHuOqlKTckbF1ScHRDsEaBoDlLl+YFL6uhjBDmGaLwyRlJPgNSj+y46oslTj5n0H9
         dH8nkt+QuyvpDva+Lx1REIzebLdREpCH04jaxC/K1mpzdM/Bw0LE79oT57znDZuTlZXY
         wd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492081; x=1752096881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpucKaFQXs24/Gdxy0fvjSfjmEgyvs47syPRCcBg2xY=;
        b=HvxSBizRjtZ92ennSnZ4I4vOZ8a5Tz9MDID5gZRx+icb9vNlWvxrb5CjF+ruqJW2k5
         GZ93za9+zLwb1JlpiX40CTCHq1VvgDcWJ+wjhN0PwUMP/4NU/zMRvH0rFn3PiyexPboA
         xANT7kkMTlsJPBfEFnBYzCXwsVxRVGI1JaQ4tH5qN7ekRKokoiD7KNaYKiQrFo2UQq6X
         hzxq2DuYljlVxlxBd5oocN/5oBx95ecIyjd8oea+qVE/A/EOXrOUjcLpGKZBHGSHrbuk
         kG1LphLs5XxiWjdeDdVHYYPyx/Vvyvpz5XECPz1N8x0jxZlzWxScMk9CtiMJoWNDsrjs
         KKhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyL4fiMUVuq42eHrV9BE8iUrWQOV1aVYXcECVGfqbjpBaAT+gV/aGhEx6eBCiK7YbyspBP7jqkrWuINEDIPl79@lists.infradead.org
X-Gm-Message-State: AOJu0YwM7WC4kGOT/TTKbseCGQoMuk5urvND75eLqOHnb93Ls7UjzZK+
	/ZFMRef6ac2IKurzyq3fwHp0SR257XAwu37Sr/zL+ocLMIw9dwcG48Hpznr63hbDotzn1+5wulF
	ccnPKvqVztZPfS2/xslGpTDQWyRbUaz03voV66jCk
X-Gm-Gg: ASbGncst/V0uF5j3050+4VZFDrtRKMUBFoizWnwUhtpGlMLjKw3ZBHpjXdUct221FC7
	PoxUsichIPfY0YnXFMYI6SS/4m7oJSj6qJ6xqfZD/uQla0gUAkE49vqGNsbArWpRL52Rj8kxnPD
	t/YDYJQPIM2ZtpbY9kHO7ab+8rOPunYodSWJ4smb+PM/8zQKC10O6hU2X1z86n/imWINy6iWX5
X-Google-Smtp-Source: AGHT+IH1fp/oO8knYExoVI4CZr0MWB4CCN3Ddzd0DoffyBdgk98L0zPZn5aGpXX4Klhx4XnOgbiAKitEu5ixJn7kSp4=
X-Received: by 2002:a05:6102:5486:b0:4e5:59ce:471b with SMTP id
 ada2fe7eead31-4f1613c8319mr3578113137.23.1751492080860; Wed, 02 Jul 2025
 14:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <20250701114733.636510-18-ulf.hansson@linaro.org> <2025070205-ignore-passive-17b4@gregkh>
 <aGWH2mH6iZJ3s3lL@pollux>
In-Reply-To: <aGWH2mH6iZJ3s3lL@pollux>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 2 Jul 2025 14:34:04 -0700
X-Gm-Features: Ac12FXzxNwy9Q8y7eUa-yNyxqV22KlOcq4v5ePhyN7HxiHMeoKsg2U5kRHPewzA
Message-ID: <CAGETcx_yVXgvmbDFYe+Nbdp18D-m14W8xO_G9RyAujpag+M9ow@mail.gmail.com>
Subject: Re: [PATCH v3 17/24] driver core: Export get_dev_from_fwnode()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Michael Grzeschik <m.grzeschik@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Michal Simek <michal.simek@amd.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_143442_300915_13E1C9C3 
X-CRM114-Status: GOOD (  25.01  )
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

On Wed, Jul 2, 2025 at 12:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, Jul 02, 2025 at 09:34:12AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jul 01, 2025 at 01:47:19PM +0200, Ulf Hansson wrote:
> > > It has turned out get_dev_from_fwnode() is useful at a few other plac=
es
> > > outside of the driver core, as in gpiolib.c for example. Therefore le=
t's
> > > make it available as a common helper function.
> > >
> > > Suggested-by: Saravana Kannan <saravanak@google.com>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> > > Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62=
A,Xilinx ZynqMP ZCU106
> > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > ---
> > >  drivers/base/core.c    | 8 ++++++--
> > >  include/linux/device.h | 1 +
> > >  2 files changed, 7 insertions(+), 2 deletions(-)
> > >
> >
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> I'm a bit concerned about exporting get_dev_from_fwnode() -- at least wit=
hout a
> clear note on that this helper should be used with caution.
>
> AFAIK, a struct fwnode_handle instance does not have a reference count fo=
r its
> struct device pointer.
>
> Hence, calling get_dev_from_fwnode() with a valid fwnode handle is not en=
ough.

Not enough for what?

> The caller also needs to ensure that the device the fwnode has a pointer =
to has
> not been released yet.

Why? The point of the API is to give you the driver core's notion of
the primary device that corresponds to a fwnode at that instant.

There's no refcount needed for that. This is just a simpler way than
looping through all the devices to find the first device that has that
specific fwnode.

It's only the device that needs to be ref counted because the caller
needs to do stuff with it.

-Saravana

