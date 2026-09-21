Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3257C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 20:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t56rUUwRmXd5Bwozpjc5KFkjkkSuskX8gA5Flws04pw=; b=zuowUN1ZLnf1p3zL8wbgrrd+CQ
	PkpTRYXUg2t+qwCKQPOTfkAZ1bOzvbLCmEGV8dj9dyjFEU+G/FoyXW77gwtxdpp5MzfZSqKj3J6j7
	CBDVHj5H/9DsT0zT8lpgBaRE23jpSnrT2g4l6MBrgRStDWDyag9h5dz1Jlzw0aGBdTZAfueCgKcy/
	SSf3SMyRHY48gLCREhyHYOOdQAGpFWSk32B43jK7Im+aQvEdanL/MvfMhQt7Wcr8AIkUUWQYnvRE5
	4tw2fuzX3j+rZNudLXQkl2OK8KTQCdJXkbmARZ0mS8IWamhs2Te6MkvWhA9ygGdVOQnVIATUWEdTS
	ROR1x36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kV4-00000003KSS-21BC;
	Mon, 21 Sep 2026 20:20:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kV1-00000003KRi-0NYA;
	Mon, 21 Sep 2026 20:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=t56rUUwRmXd5Bwozpjc5KFkjkkSuskX8gA5Flws04pw=; b=0YgOTHuRfrXx1uFY1wMgE/U3e0
	+dw/SC2Xa43f3HhGb4BANiW7jobFbsqgyg+H+OHB+9velcZTPQP3OLgQRcZfL3ZuFMhwbsfoU5LpQ
	KscCXVeHleND2dk4DeIMrIyRmDqEd8x0S2W14yqzbij1R0tY0zrPzqENhXhxgQ/oBN/6abHZa0jsm
	5xtYyleOrUyi4tvI1qjEATxfxEhUWURulNBpTFmXcQNpeI6XMz77ZsMBHl59H4Fe1nSDbBEACMs0s
	R9vl+SbDHSNLxIZbf9boY17c+SpCWINR8BSudWHYfoTZz/fQGUOw/ergGpgsnhGaGG8tvgzRk6wau
	8gIKa2bg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v6 4/6] arm64: dts: rockchip: Convert to new media orientation
 definitions
Date: Mon, 21 Sep 2026 22:19:14 +0200
Message-ID: <4535025.ejJDZkT8p0@phil>
In-Reply-To: <20260918-kbingham-orientation-v6-4-5e8b1f01be29@ideasonboard.com>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-4-5e8b1f01be29@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_132027_150236_66ACAFE3 
X-CRM114-Status: GOOD (  10.26  )
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

Am Freitag, 18. September 2026, 12:44:16 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Kieran Bingham:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the rockchip device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de> # PP-1516 and
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Same thing Thierry said, applies for the Rockchip change, if someone
wants to apply (parts of) the series to the media tree, that is fine
with me.

Otherwise I'll just pick "mine" after the next merge-window.


Heiko



