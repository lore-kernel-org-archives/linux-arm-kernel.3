Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB2AFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 19:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rb4LC4RoKjMwkAoMYkZMORsdxxUBkkBcuhhkQcQ9qHU=; b=x9XsLwl+qMR4sfu/+uhhu0U62a
	5jJ0Ox5kN2pjDy23A+hikyuin7aZODHzPz7Viw5dmFfBExuX69Dbt+XYBQlpckpCNXBxBVXOC8Dq6
	qK93Dxid1M6VThU4OfhXq6fQY1jhBl1CcV7fFC8UoEUpjhSFfiiqKEdN/c5Iqd+nzRnfFH6ZWlBIF
	b+YhBNJHIGklRphLGfs7br7lnX++AghLVS35qOITb2+SjQkcCPU4ae7su0tFNY7PYIH4prcZSdmw9
	NTy2H1qzh22EowL1OhDIEUSMboPCMxbNT8ezHNNl4RknFEqONfP6Enn7icGfseDixmmljjX6PwxAZ
	61sZnewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRLK-00000000271-46SA;
	Mon, 27 Apr 2026 19:10:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRLI-0000000025o-2uuQ;
	Mon, 27 Apr 2026 19:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Rb4LC4RoKjMwkAoMYkZMORsdxxUBkkBcuhhkQcQ9qHU=; b=VaiZ0EuMs/V/UpaUqhIxQT4kOQ
	m2fmNRxLnBGy786PBF2Z0XkvBMAdhyEjrVoKui6GQ8giNSHAgxOJ65AnNm08rjG9ZcemAVGmlbYo/
	x0vLZwJUF06BH6iWuyebP6piC19SdZ3GLQlXRGSEATGAP7cM7uguCYD7l8bg82hup8QcS5AT6NLAK
	O1rudfGXB/blSVVheseL8grFMm70H+C1ElnAg1J4VOHI1ueOm2U+FYROlQkL8Vzg77Rlg4y8VwKlq
	IekUEQ9uAOQ5SFiBYkhiDulThCYOT1lPRHpbX2efjvngHBt09pilTEDB+hXdcnKs1SbNOdXWus5zo
	4MNyAfbg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v5 05/10] drm/bridge: dw-hdmi-qp: Add HDMI 2.0 SCDC scrambling and
 high TMDS clock ratio support
Date: Mon, 27 Apr 2026 21:09:09 +0200
Message-ID: <890451008.0ifERbkFSE@phil>
In-Reply-To: <d3b5239b-e3d9-4d81-9220-d6057d670ff3@collabora.com>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <3826043.PYKUYFuaPT@phil>
 <d3b5239b-e3d9-4d81-9220-d6057d670ff3@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_121004_764703_F7527100 
X-CRM114-Status: GOOD (  27.12  )
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

Am Montag, 27. April 2026, 18:39:44 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Cristian Ciocaltea:
> Hello Heiko,
>=20
> Thanks for the quick reviews!
>=20
> On 4/27/26 1:49 PM, Heiko Stuebner wrote:
> > Am Sonntag, 26. April 2026, 02:20:17 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Cristian Ciocaltea:
> >> Enable HDMI 2.0 display modes (e.g. 4K@60Hz) by adding SCDC management
> >> for the high TMDS clock ratio and scrambling, required when the TMDS
> >> character rate exceeds the 340 MHz HDMI 1.4b limit.
> >>
> >> A periodic work item monitors the sink's scrambling status to recover
> >> from sink-side resets.  On hotplug detect, if SCDC scrambling state is
> >> out of sync with the driver, trigger a CRTC reset to re-establish the
> >> link.
> >>
> >> Reject modes requiring TMDS rates above 600 MHz, as those fall in the
> >> HDMI 2.1 FRL domain which is not supported. In no_hpd configurations,
> >> further restrict to 340 MHz since SCDC requires a connected sink.
> >>
> >> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> >> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 188 ++++++++++++++++++=
++++++---
> >>  1 file changed, 172 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gp=
u/drm/bridge/synopsys/dw-hdmi-qp.c
> >> index d649a1cf07f5..c482a8e7da25 100644
> >> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> >> @@ -2,6 +2,7 @@
> >>  /*
> >>   * Copyright (c) 2021-2022 Rockchip Electronics Co., Ltd.
> >>   * Copyright (c) 2024 Collabora Ltd.
> >> + * Copyright (c) 2025 Amazon.com, Inc. or its affiliates.
> >=20
> > I have no real clue about the inner workings of hdmi, but that line
> > does make me curious, because no part of the patch authorship does
> > mention Amazon ;-) .
>=20
> That was intentional: although the code was written by Collabora, the cop=
yright
> belongs to Amazon.

They selected a nice chip then :-D


> > Also I think "or it's affiliates" might be way too broad, because this
> > can be essentially everyone. So noone in the future will know who to
> > ask on copyright questions.
> >=20
> > Similarly when _somebody_ comes forward with "I hold a copyright on thi=
s"
> > no-one could verify this claim as well.
> >=20
> > I somehow expect _one_ entity being specified, not possibly hundreds.
>=20
> Hmm, I followed the wording already used elsewhere in the kernel tree:
>=20
> $ git grep 'Copyright.*Amazon.*affiliates' | wc -l
> 93
>=20
> There appears to be only a single instance that omits =E2=80=9Caffiliates=
=E2=80=9D:
>=20
> $ git grep 'Copyright.*Amazon' | grep -v affiliates
> drivers/power/supply/max14656_charger_detector.c: * Copyright (C) Amazon =
Technologies Inc. All rights reserved.
>=20
> Which was added nearly ten years ago, so I=E2=80=99m not sure it makes se=
nse to adopt
> that form now.
>=20
> Actually, this seems to be fairly common among other vendors as well:
>=20
> $ git grep 'Copyright.*affiliates' | wc -l
> 1014

okay then ... if that is already used a lot, and nobody else complained
then it should be fine I guess :-) .

It just sounded strange to me when reading that earlier.


Thanks a lot for digging those stats up
Heiko



