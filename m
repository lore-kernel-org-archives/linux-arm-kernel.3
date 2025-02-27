Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660F8C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 10:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkDluYegP9fz6ZGoo2X9sZIE1EvxSRLVt+l7d1VddSI=; b=0FJQfdN8kliCjIYC0VrdZZx3Xr
	L5YMw9oCTsEt1YJ10snBh1zXWA1aQEXMyOV6691VXko2ulEhKBTcirYliw9GsuZZHySv8ZcSLlSJU
	5YXZLOYpPowke+wb24/MA5bgO+Puyq8BTc1hFTtqSnlFrB8hFBgs8D0sVm06aHoxTmpHhqrp28a+U
	gDPQr5E9Lh9WdLIs0BtxUOrq18iPEwQ5fyo/+uWi0spkZNRfdIl4qFhhidjFQfm88k4JIIrTBZL1H
	IunJ3AHg8A19LalKqi/o9U1HNenFVQxFdfDq5cEuZgS31LNZM8dv+/GsgNHwBsyTKmyef40eD3Ly8
	IGUAkBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnb6W-00000006zkj-2Oup;
	Thu, 27 Feb 2025 10:26:56 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnb4z-00000006zTE-08Iy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 10:25:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnb4q-0004Ph-2F; Thu, 27 Feb 2025 11:25:12 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnb4p-0036me-2a;
	Thu, 27 Feb 2025 11:25:11 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnb4p-000526-2K;
	Thu, 27 Feb 2025 11:25:11 +0100
Message-ID: <e243ca952b3aaf7e1331dee4da14ac06d878cf61.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: mchp: sparx5: Fix for lan966x
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Herve Codina <herve.codina@bootlin.com>, Horatiu Vultur
	 <horatiu.vultur@microchip.com>
Cc: Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 27 Feb 2025 11:25:11 +0100
In-Reply-To: <20250226182449.61a126ea@bootlin.com>
References: <20250226144645.1950451-1-horatiu.vultur@microchip.com>
	 <5cc5cd05e0a481773212fff0bce574dcfea3f74d.camel@pengutronix.de>
	 <20250226182449.61a126ea@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_022521_065132_D2DB8867 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

On Mi, 2025-02-26 at 18:24 +0100, Herve Codina wrote:
> Hi Philipp, Horatiu,
>=20
> On Wed, 26 Feb 2025 17:32:22 +0100
> Philipp Zabel <p.zabel@pengutronix.de> wrote:
>=20
> ...
>=20
> > > Fixes: 0426a920d6269c ("reset: mchp: sparx5: Map cpu-syscon locally i=
n case of LAN966x")
> > > Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> > > Tested-by: Herve Codina <herve.codina@bootlin.com> =20
> >=20
> > Is this still correct?
>=20
> Yes, it is correct.
>=20
> Reviewed this v3, saw Philipp's comments and I have nothing more to add.
>=20
> Also tested this v3 and no regression were detected.

Excellent, thank you.

regards
Philipp

