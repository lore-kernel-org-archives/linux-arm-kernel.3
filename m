Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CABC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 09:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Pc2PEdnGFpaGBgL/oJAKRuPoe5iwoPem8ceWmvXk0o=; b=I4xVfMn/CF+HwVTuSEfVsVUI4Y
	+K/pCYB6enGyOWmS4wRV6THiauLx+7S6la1NbGMnnZ94TbB0Yqb571agdahRF9VRC6l4xiulroBXy
	McZleyChxXY9JVxSMe1Z01fDdkjWRkMG0HKXieo0nekMLmeXLrF2kn/hmIGdnIX0YeqBXEAUQ4r54
	eiizFxNdt6zj8GrgjCZuM6+9ZYEz+ot+hZivZMWtSa7wJWEQg1AXpxPGJLE6SmKPcC3N+OnLToz4W
	6yDeQ3zFk7TuxaNqD9M4pOqJzJPM1GKU6j56JWgf74kgcbWWgnkW9Fpv0lEYhci/uetEetjkVNwA5
	ToV9bQZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taACd-00000007MjK-2B0H;
	Tue, 21 Jan 2025 09:05:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taABL-00000007MTY-34yq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:04:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74A3BA41302;
	Tue, 21 Jan 2025 09:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3280C4CEDF;
	Tue, 21 Jan 2025 09:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737450262;
	bh=834LCvceUx526IEmw0ApuQZvBNYCCIxRzLlO39/DYQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FGKpB0djZnPUbicSPAkZ7dNLNaZZr7Yhhp0DDXD6Sr5YIn+toCie5iW+Ob+NJ6mJj
	 y2OWAxJ1Kpk+OuyRbcAiqO5soJWT8iAJ3wJGk8fxYVPzu3rLC+iGEFOhrM7yhtd1gF
	 JQYuhW8prhTcIXuySzvxBsoohj8DyjjayCU46/O8cqWovekK6CQCBidsX2tzTsl/2l
	 YoXIO0g2YCn0GGO6J+WQW1hKwcMPlL+Z2FeWNrl1j0Uae00MXmFKFY7iDDcOWkWirx
	 pvnQb3MiW9PPLcfB14Kmd3+4Q2eZCy5ZjpP8Dw8pJECRdJIcIpMVKMKAbTyFrJdrzu
	 kRqHwb+nySa9A==
Date: Tue, 21 Jan 2025 10:04:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"joao.goncalves@toradex.com" <joao.goncalves@toradex.com>, "marex@denx.de" <marex@denx.de>, 
	"hvilleneuve@dimonoff.com" <hvilleneuve@dimonoff.com>, "hiago.franco@toradex.com" <hiago.franco@toradex.com>, 
	Peng Fan <peng.fan@nxp.com>, "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>, 
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>, "m.othacehe@gmail.com" <m.othacehe@gmail.com>, 
	"mwalle@kernel.org" <mwalle@kernel.org>, "Max.Merchel@ew.tq-group.com" <Max.Merchel@ew.tq-group.com>, 
	"quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
	"arnd@arndb.de" <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>, Carlos Song <carlos.song@nxp.com>
Subject: Re: [EXT] Re: [PATCH v4 5/5] arm64: dts: imx93: Add labels for the
 references easier
Message-ID: <20250121-belligerent-elephant-of-courage-ed8caa@krzk-bin>
References: <20250121074017.2819285-1-joy.zou@nxp.com>
 <20250121074017.2819285-6-joy.zou@nxp.com>
 <870da365-bb18-47a7-ab78-62ce8a663559@kernel.org>
 <AS4PR04MB9386C8D1E2FF247C28D38BD0E1E62@AS4PR04MB9386.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AS4PR04MB9386C8D1E2FF247C28D38BD0E1E62@AS4PR04MB9386.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_010423_860186_697401E8 
X-CRM114-Status: GOOD (  10.20  )
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

On Tue, Jan 21, 2025 at 08:25:51AM +0000, Joy Zou wrote:
> > THERMAL_NO_LIMIT
> > > THERMAL_NO_LIMIT>, @@ -1334,7 +1334,7 @@ usbmisc2:
> > usbmisc@4c200200 {
> > >                       #index-cells = <1>;
> > >               };
> > >
> > > -             ddr-pmu@4e300dc0 {
> > > +             ddr_pmu: ddr-pmu@4e300dc0 {
> > 
> > Useless commit - there are no users.
> Thanks for your comments!
> Have used the labels in imx91.dtsi. The imx91.dtsi have included the imx93.dtsi.

That's patch 5/5 so I say: impossible.

Either you did not understand the commit or your patchset is
non-bisectable, so anyway that's wrong or fix your builds.

Best regards,
Krzysztof


