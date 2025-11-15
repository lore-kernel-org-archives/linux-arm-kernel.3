Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F70BCEB2EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 18:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+C/kU3wegl/g8oahkJ5TL3Nr8ieZ3KWlXonyzZd5hhk=; b=e9NMXLCHtadj+ED2eOHftSk1zf
	y6eh4xTnnYkUyDtkkNXJZa1XDGIjr3N3UzgjAkRg1QRTpwEyGca0OVSIrIDdD9AWpDqQYk222tzFG
	DMQNt8UpcnEqQET3bQ2VgRjbM/XbbZVO/HBJv4PUVwWJ3rkxwSQ7qaWNA1fj/WodYEoB7q/KD563z
	+R+sfSrRrxxima7Ri4AHpafyQYp+L8XiAOmCrHYRTfE+EA/xbUx+tU+SxTpEx1I/Oggk5+dOxX/Sc
	Vrs14I5Ez77tGVm/AYHpLHvDM326cfj8RnhwL8yYOKndLI2phtJMFtAPYtkJBFbmGsgMMg+HciopU
	jQHxTokg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKKZC-0000000DyHa-4AlL;
	Sat, 15 Nov 2025 18:00:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKKZ9-0000000DyHA-3MNU;
	Sat, 15 Nov 2025 18:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+C/kU3wegl/g8oahkJ5TL3Nr8ieZ3KWlXonyzZd5hhk=; b=EakzarZLj9n5uOsx7TlSnRgt1p
	TekWmMyDtSu3MkuD8D27cazGfl76DTAJtM+syFL7+KotnDFUk0A7CuYfj0Ku7oP8KYYsNltqQ6fzi
	l2oM65z9QYEv1L1mIM9kkaUUsCtSLGHlxC2+/Ksu91dF9wxQ7SqUZ65+1/DZd8lY/fajnyav6arJL
	5p0k54jZwHbt4DczlVdZv7MpRMEFkne0oTfB6nt9iII9fRneBiDMvA5ZZ8HBRfutRrQLIv2eu2pd6
	e+liEvqiUpIWrukIScewemOcMXWmaAwSyVBdSQlww2orWZIi+mCHmgKia3fKZN12lpgRwvUGjRg7P
	N8W+O0Qw==;
Received: from i53875bd0.versanet.de ([83.135.91.208] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vKKYk-0007jc-Gg; Sat, 15 Nov 2025 18:59:38 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, michael.riesch@collabora.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@collabora.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v15 00/14] media: rockchip: add a driver for the rockchip camera
 interface
Date: Sat, 15 Nov 2025 18:59:36 +0100
Message-ID: <2678569.Lt9SDvczpP@diego>
In-Reply-To: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
References: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_100003_875514_4C2EC565 
X-CRM114-Status: GOOD (  22.25  )
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

Am Freitag, 14. November 2025, 16:20:11 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Michael Riesch via B4 Relay:
> This series introduces support for the Rockchip Camera Interface (CIF),
> which is featured in many Rockchip SoCs in different variations.
> The series has now been around for a while and has received many comments
> and reviews. Thus, it should be ready for mainline by now.
>=20
> The last issue we discussed (see thread to v14, link below) was the
> necessary integration of a mux subdevice, as the MIPI CSI-2 data can
> be passed to the ISP and/or to the VICAP on RK3568. In order to avoid
> any uAPI breakage, the MIPI CSI-2 receiver support has been removed in v15
> (following an off-list discussion with Sakari).
>=20
> Therefore, the v15 of the series adds a media controller centric V4L2
> device driver for the Rockchip CIF with
>  - support for the PX30 VIP (not tested, though, due to the lack of HW)
>  - support for the RK3568 VICAP, including
>     - capturing frames from the DVP
>     - capturing frames from the MIPI CSI-2 receiver
>  - abstraction for the ping-pong scheme to allow for future extensions
>  - abstraction for the INTERFACE and CROP parts to allow for future
>    extensions
>  - initial support for different virtual channels (not tested, though,
>    due to the lack of HW)
>=20
> Apart from that, there are no changes compared to v14.
>=20
> Looking forward to your comments!

[...]

> Michael Riesch (12):
>       Documentation: admin-guide: media: add rockchip camera interface
>       media: dt-bindings: video-interfaces: add defines for sampling modes
>       media: dt-bindings: add rockchip rk3568 vicap
>       media: rockchip: add driver for the rockchip camera interface
>       media: rockchip: rkcif: add abstraction for interface and crop bloc=
ks
>       media: rockchip: rkcif: add abstraction for dma blocks
>       media: rockchip: rkcif: add support for px30 vip dvp capture
>       media: rockchip: rkcif: add support for rk3568 vicap dvp capture
>       media: rockchip: rkcif: add support for rk3568 vicap mipi capture

for people playing along at home, patches 1-10 seems to have been merged
into the media-committers tree [0]


[0] https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/1f=
2353f5a1af995efbf7bea44341aa0d03460b28
    that commit and backwards in the history



>       arm64: defconfig: enable rockchip camera interface
>       arm64: dts: rockchip: add vicap node to rk356x
>       arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander




