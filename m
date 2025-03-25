Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2641C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CO390VnPI9mCDOYNIkiEtS+Qcz2G2NEIzR0AmG0gS5Y=; b=rj+C4FJdoLhz4B9LIkSSHpBSpu
	G7KDe+LwNPnJguUTQdjVtNEbT3jlrJbobF3nInMJ0hp6mwLRWsQY76c9DF1b5xkm2XSgC8bgmtWGg
	Sh4fSZIBWi3qKa8fVtdlnHqvBrCp9QP3kmR7u0ZTvq/JoMQHkqVtiZyj+XtjVZJgyizbOiTIG+OYn
	4N3HJB0j75y82woIDhB6CGI3RfunppVxbnml/x5ur+oxP6DB53MUizuFcgQooYLYu3C25sBFLGhxY
	I84bJQWIeRw1+vcn5t3d5GxIZmanaBlSenmVcB+8rrwQby0g4qcl8URd8xVl8bR2t10gBWRzkS98j
	0eD34TXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx530-00000006AIQ-3qGz;
	Tue, 25 Mar 2025 14:14:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx51I-00000006A8O-2qJP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 14:12:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tx51E-0007AK-RG; Tue, 25 Mar 2025 15:12:40 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tx51D-001avt-0e;
	Tue, 25 Mar 2025 15:12:39 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tx51D-0008wN-1h;
	Tue, 25 Mar 2025 15:12:39 +0100
Message-ID: <13376dff8d861389464b7ecdb2f82fe211638500.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley
 <conor+dt@kernel.org>,  David Airlie <airlied@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring
 <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel
 <sre@kernel.org>,  Shawn Guo <shawnguo@kernel.org>, Simona Vetter
 <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,  Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  imx@lists.linux.dev
Date: Tue, 25 Mar 2025 15:12:39 +0100
In-Reply-To: <22187ae5-7486-416b-b612-53021bfca11e@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
	 <20250321200625.132494-5-marex@denx.de>
	 <20250324094333.7afb17a1@collabora.com>
	 <22187ae5-7486-416b-b612-53021bfca11e@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_071244_711781_0756C8DB 
X-CRM114-Status: GOOD (  20.03  )
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

On Mo, 2025-03-24 at 20:05 +0100, Marek Vasut wrote:
> On 3/24/25 9:43 AM, Boris Brezillon wrote:
>=20
> [...]
>=20
> > > @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
> > >  =20
> > >   	panthor_devfreq_suspend(ptdev);
> > >  =20
> > > +	reset_control_assert(ptdev->resets);
> >=20
> > Hm, that might be the cause of the fast reset issue (which is a fast
> > resume more than a fast reset BTW): if you re-assert the reset line on
> > runtime suspend, I guess this causes a full GPU reset, and the MCU ends
> > up in a state where it needs a slow reset (all data sections reset to
> > their initial state). Can you try to move the reset_control_[de]assert
> > to the unplug/init functions?
> The reset on the MX95 is not really a reset, it is clear-only=20
> set-never-again bit which goes only one way, the "unreset" way, so I=20
> don't think this has any impact.

This sounds like the bit is initially set to 1 (reset asserted) and can
be cleared by writing 0 (once, to deassert the reset). But in the
reset-simple patch it looks to be the other way around (active_low =3D
true)?

If the reset control can't be asserted again on this hardware, it would
be better to have custom driver that doesn't implement the .assert()
callback at all.

regards
Philipp

