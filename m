Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86EA103E305
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WX4qYM6yIxT0a2DLuaOkGAno/i1iuimCEnc1Sg4uSlk=; b=KyOkFFdXKRFu5gGNF7dfThtTZu
	kd8UvR6m76/SwhZOlADhfwoJcup+inPCgBvT1IArfWUCsTUWBdaEkdspbreC0JvoZrJBfpaGJoLC5
	MgfPOpneCev2QXv5SQmVuYARF0jXd24ks+gC//z/eB3eAZKVZT3wA14NQUYRUcdf5QIkAHW1hsMJG
	5QZuoE0WtkmvDkDgM0SrJL5ta8xojIlmLMyPn8Dni7qNperBsGSG/i702xYK52QY3Qqke+Hq6g0qj
	8ClsWWtpm7hPRnv15PcAvx7QlT0f+fku0WwdVbBIm0FmL2UCDebREmNqrVpK7/YQwJwxtkxgy+B9A
	l7zuEcjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Xy-00000000ZEf-2QyK;
	Fri, 13 Mar 2026 15:35:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Xw-00000000ZDw-2AIf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:35:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14Xo-0002MH-Ua; Fri, 13 Mar 2026 16:35:20 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14Xo-0006RT-0u;
	Fri, 13 Mar 2026 16:35:20 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14Xo-00000000Ep8-0oQK;
	Fri, 13 Mar 2026 16:35:20 +0100
Message-ID: <3d65ce5f3f6217e68ce6be3bb75ae722ba9bc151.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/2] drm/imx: ipuv3-plane: support underlay plane
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo	 <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 13 Mar 2026 16:35:20 +0100
In-Reply-To: <20260219-drm-imx-underlay-plane-v2-0-26ef829c5483@pengutronix.de>
References: <20260219-drm-imx-underlay-plane-v2-0-26ef829c5483@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_083528_550495_7D8811F9 
X-CRM114-Status: GOOD (  11.59  )
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

On Do, 2026-02-19 at 12:32 +0100, Michael Tretter wrote:
> The IPUv3 overlay plane may be placed over or under the primary plane.
> This series allows user space tools to properly detect that the overlay
> plane may be used as an underlay.
>=20
> The first patch removes the assumption that the primary plane has the
> default zpos 0 and the overlay plane has zpos 1. This allows changing
> the zpos more freely.
>=20
> The second patch changes the default zpos of the planes. The primary
> plane always has the fixed zpos 1, which allows the overlay plane with
> zpos 0 to 2 to be placed relative to this fixed primary plane.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Applied to drm-misc-next, thanks!

[1/2] drm/imx: ipuv3-plane: decouple zpos from plane type
      commit: a872e90e3668f9f8d0bc9c2fae3c328835b98bf0
[2/2] drm/imx: ipuv3-plane: support underlay plane
      commit: ecbcceea4767dc11881986cb41a9962cac6f6c39

regards
Philipp

