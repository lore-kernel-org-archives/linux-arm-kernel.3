Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5952AC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEzqEdRBKnUviXnEO4U4O1tCqXT7/iFQ2fRR1DhNLR4=; b=SNJK/e+BXKPSaerNRiWW2X8hGi
	mQb0f57rLWzqQMEa5cA9oolIXD+anO7AeUrr0Ab9rmp2Y9PUNCcJ09oddk2RSMNj0NU8Oxi1tJNoQ
	pUkGRULHH8+RoVrJ1vifa6HaQ4kW2rUfSdFvSlTcO+jcbrpxF9KhaYvlcwYqbb9+KAZibW/9nlLCF
	dQZY13V3QbQCxNJrJtdCWr91juZ96RKqQTz83Vyl8CPnJO1zU3HK3XiKIuhcDc5UtvNe+EuBFeQty
	EDa7cuj33UNsBGHPKMBB5Exe2N5UNX6gxAIhUW9S4LzH12kcoDwbjaiCiGROwraBV3Ap/TOc32Hap
	9YtrGdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyDN-0000000AhIh-2YaL;
	Fri, 28 Feb 2025 11:07:33 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxgu-0000000AcJK-3mnu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:34:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnxgt-0002as-BF; Fri, 28 Feb 2025 11:33:59 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnxgs-003HHx-1G;
	Fri, 28 Feb 2025 11:33:58 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnxgs-005Gvf-0k;
	Fri, 28 Feb 2025 11:33:58 +0100
Date: Fri, 28 Feb 2025 11:33:58 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
	Sebastian Reichel <sre@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Steven Price <steven.price@arm.com>, imx@lists.linux.dev,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
Message-ID: <20250228103358.tbcqyrtzzsgacxbm@pengutronix.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de>
 <20250227201709.2diz57xv2tntw36q@pengutronix.de>
 <8bc7e55d-7a8d-436b-ad6f-f7cb8caa28a0@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bc7e55d-7a8d-436b-ad6f-f7cb8caa28a0@denx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_023400_937108_CCC59775 
X-CRM114-Status: GOOD (  16.68  )
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

On 25-02-27, Marek Vasut wrote:
> On 2/27/25 9:17 PM, Marco Felsch wrote:
> 
> [...]
> 
> > > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> > > index 06fe46e320738..2504a456d45c4 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > > @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
> > >   ATTRIBUTE_GROUPS(panthor);
> > >   static const struct of_device_id dt_match[] = {
> > > +	{ .compatible = "fsl,imx95-mali" },	/* G310 */
> > 			  ^
> > 			 nxp?
> > 
> > Can we switch to nxp instead?
> We can ... is that the current recommendation ?
> 
> Why not stick with fsl , is that deprecated now ?

Nope I don't think so but I do see patches adding 'nxp' as vendor
(mostly external chips) and some with 'fsl' (mostly soc internal ip
cores).

My hope was that at some point we could switch to 'nxp' only and make
use of this vendor-prefix. Of course NXP should start with that switch
but this seems not to happen :/

It's more a nit but maybe this triggers NXP to make use of the 'nxp'
vendor-prefix as well once they upstream a new base dtsi.

Regards,
  Marco

