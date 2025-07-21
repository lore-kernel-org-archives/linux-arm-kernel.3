Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B968EC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1dy7xoxRKl1sQ1tb4Ipkebpw3UhPsQ6Fu34IdYEgOA=; b=MwDFOXMSU6SMaAyxySmXE7xV3U
	asEOW3YXjJ6QMXktl8KGxwFsQJhFO3Gt6U62uNPPMIN299sSNpTTmZN8h9MOVD4lEipiyP0X1/lGl
	O79vMXNqUnp+z0cc/4aOR1Rj1CfcOsTEbNCDeso90ZA7tYzFfHDZAQHr5Fv8OunzIaTl87CD1V/RR
	snsQXjfoLYJEjFen/jED0wEGkhXlPGNWeuy9u41akkUp2K8Rs2sJbTYZ1Z/aDxUQc12tTLCb3PEb9
	2iTS4dsX7PwfoQEevVh/MC5s+GtIsNuYvc7o2m0jT3K4gZ625Xdgm9LSFKBg0OwKzHvfjsL9ReTZR
	v/Le6jRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtnE-00000000F2m-2fbx;
	Mon, 21 Jul 2025 16:55:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsNh-000000004Nd-2Whz;
	Mon, 21 Jul 2025 15:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=N1dy7xoxRKl1sQ1tb4Ipkebpw3UhPsQ6Fu34IdYEgOA=; b=N7F21LPIdchD8+2O9CRvE6O6lI
	gX1sGnojJnysvzXKgRZSVl3qksY/yK/9djn9/YWNxOIWo7kFQbymnEjUusxPGd1xxRZxoe4sKglj0
	h5Dh1ridpadW6MvtjkAbPCgYeYBiRCxw1Sg96MnfuX+/9+opxxxztm6oYj0PzZmb1sgUJ4KI2NSYg
	3BVv4bX1JAQbphTSLHK+Me/8AOwc2onF5MjEXKI8VCbzpWtbhsMOvO5HiV0lI01ilo91r6z1ubpOv
	+Zu5Ulx51fV7sPn3ctWr48CQG/p3JV46sJ2rUHDQ9QNCIY9gs1FwB6HfVy+QTbCfCw1igvlrNNkf5
	K4zSFjWA==;
Received: from i53875b2e.versanet.de ([83.135.91.46] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1udsND-00047Z-91; Mon, 21 Jul 2025 17:24:15 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Mon, 21 Jul 2025 17:24:13 +0200
Message-ID: <4109088.mvXUDI8C0e@diego>
In-Reply-To: <b48c6694-2bd1-44d0-9dd1-1b7a67e22d87@oss.qualcomm.com>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
 <b48c6694-2bd1-44d0-9dd1-1b7a67e22d87@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_082445_669214_CA93BAE1 
X-CRM114-Status: GOOD (  16.46  )
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

Hi Jeff,

Am Montag, 21. Juli 2025, 16:55:01 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Jeff Hugo:
> On 7/21/2025 3:17 AM, Tomeu Vizoso wrote:
> > This series adds a new driver for the NPU that Rockchip includes in its
> > newer SoCs, developed by them on the NVDLA base.
> >=20
> > In its current form, it supports the specific NPU in the RK3588 SoC.
> >=20
> > The userspace driver is part of Mesa and an initial draft can be found =
at:
> >=20
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> >=20
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>=20
> This (and the userspace component) appear ready for merge from what I=20
> can tell. Tomeu is still working on his drm-misc access so I've offered=20
> to merge on his behalf. Planning on waiting until Friday for any final=20
> feedback to come in before doing so.

sounds great.

Just to make sure, you're planning to merge patches 1-6 (driver + binding)
into drm-misc and I'll pick up the "arm64: dts: " patches 7-10 afterwards?

Heiko



