Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F131090257
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1m/NKwHzNzra+b05v/mVlZjPUgYyMx5CvoVdPoIIiE=; b=pljEQ2xIcMJp8bj56jiuS/mjDc
	D1EJ0+iM7NBxKPA7OZsPq0W00qJFg1/L3WMbkSLVhUdgXJY39pQdSiUHaqUpZo9QaxM0TvcTyE8vc
	MXxS2lV7TTHCX3IzkSOJMNIC1rUuDhAZIX5g7SJsAQu856Hb7tdeZCRGhRgQEQTbC3CCMI7oclZM5
	tJHCFrp3Ara8yPP6oA4reNYflfE7uIaYUd/GDh5G0Uis+zyXJor4raT0lQpXMkVSqeT+KggWj1bwi
	0Q6lJXt/sFJ/cNkhl3anLINYozs7LqL0lZc6JEQtKsqQpg6tC5eS+yKvll/1PpeGpaLv8S1YAtGEo
	EIUawSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3H1v-0000000BBAr-3dz8;
	Thu, 19 Mar 2026 17:19:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3H1t-0000000BB9W-3JBG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 17:19:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3156443A4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 17:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E1CC19425
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 17:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773940768;
	bh=qRmimtUgu8R/VWBfHxicdR4COyi8h1pw6EXhs61Gshk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lNNgvEVDXKbef3eLOfoU2iBJuZm8RZCDJxkGM4r6STQYoF9WTZ64aWNa4DCnE4VrC
	 m5gYQh/qw2bOQjBGFDgqGZ79cEFAwNIWaAaHcILPiND6FGab3uoQCJjnJ5k7W5Je3k
	 7jBiYWiybxg5eD+fHv1ZhKQdNUBOFRNgoBvGb140h+G24SNd5GfZj7XivWM/Bojjyj
	 zC7F1djLspFmns8GBCOIhBr7jXNvKLf2AM0JtJaMP6kyaKDPkDjj0n7yOAPCJFnUfR
	 og/bMQsjnb3N/3S0Exat8IEwCvvRtU6pGeCw/b5JHEIWXuw2pDkvMQfn0y+ez6A4It
	 m7bkYouwsYEkg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-668abc98923so730789a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 10:19:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXi8AYimJJWBlcC0NFTQeQZImt6qqzpphpGTsbwcCEp53mqToyQKyA2QD0iyYX0vNoobKTNBTsD6smdSJyf5ukM@lists.infradead.org
X-Gm-Message-State: AOJu0YyBdD9Cy645S9jdD7DMapXKJz1LRyBDa67J34I1bTepCFiN7NNW
	dh55F69Zq5GBhCBx2RiJkeGQsnBPgnWy8ycH59xgu+2vuEvEUUsGnTsKObVAL/wjptBHBjMgHjh
	YflwdhiZQ83zOBWDg4xcHADgK7pH884w=
X-Received: by 2002:a05:6402:3593:b0:661:3f3c:400d with SMTP id
 4fb4d7f45d1cf-668c9c52289mr147080a12.26.1773940767380; Thu, 19 Mar 2026
 10:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260303132305.438657-1-ulf.hansson@linaro.org> <CAPDyKFr25L0Omm_uCjZp03_ptnrKR_P2p3e3qxDeUoFFKJg3bQ@mail.gmail.com>
In-Reply-To: <CAPDyKFr25L0Omm_uCjZp03_ptnrKR_P2p3e3qxDeUoFFKJg3bQ@mail.gmail.com>
From: Saravana Kannan <saravanak@kernel.org>
Date: Thu, 19 Mar 2026 10:19:15 -0700
X-Gmail-Original-Message-ID: <CACRMN=c82Npk8m=80ZwshZny9zEO7UU6cR2zB=VUAKXUFC=QaQ@mail.gmail.com>
X-Gm-Features: AaiRm52M6HBVMpHbwsDK3waTZA9ElGzNCB8yzoba-xU0I5Q5Yb41uy2aowwGHJs
Message-ID: <CACRMN=c82Npk8m=80ZwshZny9zEO7UU6cR2zB=VUAKXUFC=QaQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] driver core / pmdomain: Add support for fined grained sync_state
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_101929_867485_7E26D287 
X-CRM114-Status: GOOD (  24.27  )
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

On Thu, Mar 19, 2026 at 9:59=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Tue, 3 Mar 2026 at 14:23, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > Since the introduction [1] of the common sync_state support for pmdomai=
ns
> > (genpd), we have encountered a lot of various interesting problems. In =
most
> > cases the new behaviour of genpd triggered some weird platform specific=
 bugs.
> >
> > That said, in LPC in Tokyo me and Saravana hosted a session to walk thr=
ough the
> > remaining limitations that we have found for genpd's sync state support=
. In
> > particular, we discussed the problems we have for the so-called onecell=
 power
> > domain providers, where a single provider typically provides multiple
> > independent power domains, all with their own set of consumers.
> >
> > In these cases, the generic sync_state mechanism with fw_devlink isn't =
fine
> > grained enough, as we end up waiting for all consumers for all power do=
mains
> > before the ->sync_callback gets called for the supplier/provider. In ot=
her
> > words, we may end up keeping unused power domains powered-on, for no go=
od
> > reasons.
> >
> > The series intends to fix this problem. Please have a look at the commi=
t
> > messages for more details.
> >
> > Please help review and test!
>
> Saravana, Rafael, Greg - any concerns you see with this approach?

Not specifically related to this thread, but a general update so
people know I haven't vanished. I've been reading this and all the
other fw_devlink related patches (Doug's making flags set/clear/check
safe, overlay series, the PCIe patch series, etc) being sent since I
last replied. I somehow missed this one. I'll definitely take a look
at this series.

Email replies to LKML are a pain right now but it's
expected to get much easier in a week or two. I'm holding off on
responding to most emails until then.

Thanks,
Saravana

>
> Especially I need your confirmation for patch 1 and patch2.
>
> Kind regards
> Uffe
>
>
> >
> > Kind regards
> > Ulf Hansson
> >
> > [1]
> > https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.=
org/
> >
> >
> > Ulf Hansson (9):
> >   driver core: Enable suppliers to implement fine grained sync_state
> >     support
> >   driver core: Add dev_set_drv_queue_sync_state()
> >   pmdomain: core: Move genpd_get_from_provider()
> >   pmdomain: core: Add initial fine grained sync_state support
> >   pmdomain: core: Extend fine grained sync_state to more onecell
> >     providers
> >   pmdomain: core: Export a common function for ->queue_sync_state()
> >   pmdomain: renesas: rcar-gen4-sysc: Drop GENPD_FLAG_NO_STAY_ON
> >   pmdomain: renesas: rcar-sysc: Drop GENPD_FLAG_NO_STAY_ON
> >   pmdomain: renesas: rmobile-sysc: Drop GENPD_FLAG_NO_STAY_ON
> >
> >  drivers/base/core.c                       |   7 +-
> >  drivers/pmdomain/core.c                   | 208 ++++++++++++++++++----
> >  drivers/pmdomain/renesas/rcar-gen4-sysc.c |   1 -
> >  drivers/pmdomain/renesas/rcar-sysc.c      |   1 -
> >  drivers/pmdomain/renesas/rmobile-sysc.c   |   3 +-
> >  include/linux/device.h                    |  12 ++
> >  include/linux/device/driver.h             |   7 +
> >  include/linux/pm_domain.h                 |   3 +
> >  8 files changed, 200 insertions(+), 42 deletions(-)
> >
> > --
> > 2.43.0
> >

