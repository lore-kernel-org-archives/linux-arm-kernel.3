Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7CFE77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 18:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Dm+phNaOF6lF+9DcLSZb4FaAsRUdmNhMpbAh3iEkgU=; b=TrNua0EMqXI8/bQuAmHOZZf9xV
	S6IjjwkAGkuop0Xdb7UlJjh3EeaCNwWAF9IWDfuPurRsxhe4POQugschbVoY0vPIswMHRfxJL54Lv
	VqQSbN2KHV7DjovvhWFgxz66sISJq6D5ESRB0IlCGOmavIJsi5SgqSSOBwZqVTmUhFlmwqZ/UCR7I
	Cl9awVrEdHSEjR8V3izMuKE3U4OKi9Ch+PSGcsDkDqVCkSii/oU42d5u/A+jt2G3TSTopPFIQX9fd
	DQNwFMDtqPLsOtqTwcnP39x/wMoYvx7JoXb6orHRX6oUsAJyFW17O5do2le0qljiwtpAXQ4MLw30B
	dL2AEp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMAVn-00000004hDN-44lC;
	Fri, 13 Dec 2024 18:35:39 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMAUi-00000004h5F-48Rg;
	Fri, 13 Dec 2024 18:34:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1734114847; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SvAcOJY4ENjwkh4yqc8jzgQIfxnftgaq/eaNj7wJ7zOpHvNVDof2/8UZUAOZtn3UDGFiO5UxSEf2N+f/u1dwgt0JyjQfHtXqc6FyTifepQ5fDQ4Ko5ZrS2VbsJYu5zVnClkLDr/FTrfTU/4xsattOjY0e8Hye/LY6POLKztRoMw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734114847; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9Dm+phNaOF6lF+9DcLSZb4FaAsRUdmNhMpbAh3iEkgU=; 
	b=ZU+D4io+X1w4oKuq6ToZYMbh5iFAGnA1sJ2JDrggylvYCBA40E49jWo6mobOBca7I+JuBE5Ynxj5o+9T6D/CoYsuSqHgy0/yIfjCIVZWtBhoEQ6IBCtHkeshC9mvDyO2sj0VW+jZZ2/zHz5m4qEsd+sLcB7XO7s1SW8DSWq+iNg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734114847;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=9Dm+phNaOF6lF+9DcLSZb4FaAsRUdmNhMpbAh3iEkgU=;
	b=fZnO6G4PjfRmzE1ndXHGkWFhk5VnRDMGhRwPOoouZRcQG6yh8BmRnfrVL48NL2Rv
	1dwxMrN/S0qxFh+9UrgVhJUs7xDWcUXFGMjz4eGbsrG1R12g3nczGvnyIphB/bMsUwa
	v9Z+yXOwQ4Qu8fIhnte1rR7FZ0K0xbWhm1k77qOg=
Received: by mx.zohomail.com with SMTPS id 1734114845510958.4473681288645;
	Fri, 13 Dec 2024 10:34:05 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
 s.hauer@pengutronix.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, Andy Yan <andy.yan@rock-chips.com>,
 kernel@collabora.com
Subject: Re: [PATCH v5 05/18] drm/rockchip: vop2: Set AXI id for rk3588
Date: Fri, 13 Dec 2024 13:34:03 -0500
Message-ID: <13660005.uLZWGnKmhe@bootstrap>
In-Reply-To: <3f1eace4.75cf.193b9daf585.Coremail.andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com> <5843712.DvuYhMxLoT@bootstrap>
 <3f1eace4.75cf.193b9daf585.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_103433_064984_A374A324 
X-CRM114-Status: GOOD (  26.11  )
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

On Thursday, 12 December 2024 02:52:34 EST Andy Yan wrote:
> Hi Detlev,
>=20
> At 2024-12-11 23:45:01, "Detlev Casanova" <detlev.casanova@collabora.com>=
=20
wrote:
> >On Wednesday, 11 December 2024 01:34:34 EST Andy Yan wrote:
> >> Hi Detlev,
> >>=20
> >> At 2024-12-11 02:40:14, "Detlev Casanova" <detlev.casanova@collabora.c=
om>
> >
> >wrote:
> >> >Hi Andy,
> >> >
> >> >On Monday, 9 December 2024 07:29:18 EST Andy Yan wrote:
> >> >> From: Andy Yan <andy.yan@rock-chips.com>
> >> >>=20
> >> >> There are two AXI bus in vop2, windows attached on the same bus must
> >> >> have a unique channel YUV and RGB channel ID.
> >> >>=20
> >> >> The default IDs will conflict with each other on the rk3588, so they
> >> >> need to be reassigned.
> >> >>=20
> >> >> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> >> >> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> >> >> Tested-by: Derek Foreman <derek.foreman@collabora.com>
> >> >>=20
> >> >> ---
> >> >>=20
> >> >> Changes in v5:
> >> >> - Added in V5
> >> >>=20
> >> >>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 +++++++++++
> >> >>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  9 +++++++
> >> >>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 26
> >> >>  +++++++++++++++++++-
> >> >>  3 files changed, 48 insertions(+), 1 deletion(-)
> >> >>=20
> >> >> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> >> b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c index
> >> >> dc4edd65bc9e..8b9ca046eeeb 100644
> >> >> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> >> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> >> @@ -1426,6 +1426,12 @@ static void vop2_plane_atomic_update(struct
> >> >> drm_plane *plane, &fb->format->format,
> >> >>=20
> >> >>  		afbc_en ? "AFBC" : "", &yrgb_mst);
> >> >>=20
> >> >> +	if (vop2->data->soc_id > 3568) {
> >> >
> >> >Shouldn't this be done only for rk3588, as specified in the comments
> >> >below
> >> >? The test we did before showed that it is failing on rk3576 and 3576=
 is
> >> >>
> >> >3588.
> >>=20
> >> I think this is because you tested before with the patch I gave Derek
> >> without axi id assigned for rk3576.
> >> I assigned axi id for rk3576 in this version 18/18=EF=BC=88The new ID =
assignment
> >> can adapt to more application scenarios.=EF=BC=89, can you test it wit=
h the
> >> whole V5 version again?
> >
> >Yes, I will do that. But patch 18 mentions:
> >+       /* Read only bit on rk3576*/
> >+       [VOP2_WIN_AXI_BUS_ID] =3D REG_FIELD(RK3568_CLUSTER_CTRL, 13, 13),
> >
> >And the bit is being written here. If it is indeed writable, then I would
> >drop that comment.
>=20
> The AXI_BUS_ID for two Cluster windows on RK3576 are fixed by hardware, t=
hat
> means whether we write it or not, it won't change anything.
> But the AXI_BUS_ID for Esmart windows on rk3576 and  AXI_YRGB/UV_R_ID for
> all cluster/esmart windows on rk3576 are writeable.
> I think we directly write it here as the current code can make things eas=
y.

I see, saying it is read only may be a bit confusing then, but it makes sen=
se.=20
You could be more specific adding that writing has no effect.

Anyway, I tested this and it works as expected:

Tested-by: Detlev Casanova <detlev.casanova@collabora.com>

Regards,
Detlev.

> >> >I suggest
> >> >
> >> >	if (vop2->data->soc_id =3D=3D 3588) {
> >> >
> >> >Regards,
> >> >Detlev
> >> >
> >> >> +		vop2_win_write(win, VOP2_WIN_AXI_BUS_ID, win->data-
> >> >>
> >> >>axi_bus_id);
> >> >>
> >> >> +		vop2_win_write(win, VOP2_WIN_AXI_YRGB_R_ID, win->data-
> >> >>
> >> >>axi_yrgb_r_id);
> >> >>
> >> >> +		vop2_win_write(win, VOP2_WIN_AXI_UV_R_ID, win->data-
> >> >>
> >> >>axi_uv_r_id);
> >> >>
> >> >> +	}
> >> >> +
> >> >>=20
> >> >>  	if (vop2_cluster_window(win))
> >> >>  =09
> >> >>  		vop2_win_write(win, VOP2_WIN_AFBC_HALF_BLOCK_EN,
> >> >
> >> >half_block_en);
> >
> >Detlev.
> >
> >
> >
> >_______________________________________________
> >Linux-rockchip mailing list
> >Linux-rockchip@lists.infradead.org
> >http://lists.infradead.org/mailman/listinfo/linux-rockchip





