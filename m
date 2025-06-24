Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6BBC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 09:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HGRQPm59Pg/7P9uBVV7QAOblnknaZe8TzNj9SKviec=; b=JNpasuyJ3Q5jaOnUzq8oc7WE54
	LVRZjJXbzB36v1oSk7IeMbMMKn9eaFyxUw3P8BSOuwWL2FzR6eBfM90nLQfWgTaZbZ0YX6S0C0YqQ
	6lxP8IdEnfe7XC1J/ZDG0d/muRF4a/KFF7eyA7m8AFvqtYc4S9Ven8SMPFFvXWmA1529r80XVpkDe
	buwnpEDjU7uAq7IddeYHoIsPaBeeNNlCjJQB/PEH3yAEDecUTuF/lCwdSdl22A0FcQSqbPRGRTY5R
	DR1QvNOq6miEE1/X7BPWMYWSMb9sfj4dWZpGuUPxV+s7lyVs1nGxspd/5OOszgatd3i6x91LaF4AL
	XGsBDahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzaK-000000057QW-1VIT;
	Tue, 24 Jun 2025 09:04:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzOu-000000055pV-1jDI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 08:53:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F2FEF5C63C4;
	Tue, 24 Jun 2025 08:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F24CC4CEE3;
	Tue, 24 Jun 2025 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750755185;
	bh=0HGRQPm59Pg/7P9uBVV7QAOblnknaZe8TzNj9SKviec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1ieF0xqmJpXU2h/I0y88hR3cOzu7Dge9teAEkYM8fTROq7PQkvkcL7BkYR7hsCMN
	 c8YRzMRCAv276zeoajjd+2xVrc5Rzxnxjd4HrL/4O+IhU6adFA9Q+JxmQ69wvBnUgP
	 vEFu8bCHm2FtzRWqWtNaPQBke4HKSbRKN0qeWFPIBFETCALOEysdhV3CQZV+kKG+ka
	 ZbWq7UDsil1m42vYE6qNaJVviJe3XFI9gA6lfL95ycbMfn5KOjO/XfTTThfs2LA1in
	 uuIMS46FaEreJ4dEfEmJVprXq91Y78wWaJlrq2avK01M6k6M9wFpI/8gm9sAh7H/b/
	 BSNozO4+TIPrg==
Date: Tue, 24 Jun 2025 10:53:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 04/16] drm/panel/sun4i: Keep up with refcounting
Message-ID: <20250624-invisible-khaki-hog-14f5a0@houat>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
 <20250619-b4-of_drm_find_panel_part1-v2-4-0df94aecc43d@redhat.com>
 <20250620-groovy-imposing-reindeer-e52ed0@houat>
 <CAN9Xe3SsdbwXvDav_TUkryN3nXjujkwMTtcUcigavy5FZ29UcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7gzjxsntd33bcrpz"
Content-Disposition: inline
In-Reply-To: <CAN9Xe3SsdbwXvDav_TUkryN3nXjujkwMTtcUcigavy5FZ29UcA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_015308_542068_89FAB01F 
X-CRM114-Status: GOOD (  22.23  )
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


--7gzjxsntd33bcrpz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 04/16] drm/panel/sun4i: Keep up with refcounting
MIME-Version: 1.0

On Fri, Jun 20, 2025 at 03:54:10PM -0500, Anusha Srivatsa wrote:
> On Fri, Jun 20, 2025 at 8:27=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
>=20
> > Hi,
> >
> > On Thu, Jun 19, 2025 at 02:15:56PM -0500, Anusha Srivatsa wrote:
> > > Put the panel reference back when driver is no
> > > longer using it.
> > >
> > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> >
> > When I asked you to provide a rationale for why you think the
> > drm_panel_put() call belonged where it does, it was pretty obvious it
> > needed to be done for all patches with the same issue, not just a few
> > random ones.
>
> Well, not totally random. THe intention was to specifically explain
> the cases where the drm_panel_put() is part of a probe(), enable() or
> attach() like function since that caused confusion in the last
> version. There must have been misunderstanding on my end when I
> thought only those cases needed additional explanation. I will make
> the commit message more verbose.

Eventually, it's a memory management thing. You can't judge how a
driver, framework or function uses the memory from 3 lines of context.

This patch is a good example: it might make sense from the 3 lines of
context. But if you consider what this function is doing, and how it
uses the drm_panel pointer, what you did is broken.

Maxime

--7gzjxsntd33bcrpz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFpnbgAKCRAnX84Zoj2+
drFCAX41sEkvCTao7a9yQqRtmSfin2kdKCV2JaZfI5cw2dFqsTvw73LOz/t6iRwi
Q+hmmYQBgIRnOILmbnDBTcsLHPwlfo8Xfh92lsXrdf9u2Wq1obP7UONKXxeWc3yG
BRdzhtk14w==
=LaLM
-----END PGP SIGNATURE-----

--7gzjxsntd33bcrpz--

