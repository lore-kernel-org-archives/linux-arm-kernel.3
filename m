Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9497C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 10:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0Z76gXzXASZvB45zMW7OBOfjiQs1Vtulp5U1K5X9+M=; b=Vm+E9eXabBAZ76x3e3f9TUitF9
	LnfIeh3gTFrE48maj7hSrhFjT2ak91xYSDsPJv35ZJcJldv9Zu1UOvchQ86yui/v6sPnapUe/Vnk/
	/vw95bZPbNVfwlPNVifaX9IqRQuZYiSGiY1XbQcfKUrvzvo8AxQROVm+Iu5WBT09J3c0hW8AJ8FzQ
	k4UBUTOb2JwpAS1GSUhwFcYWyBl2Bor9xYCsRGd15IgZIWvCaHMMLj2OPwpDJUoKGSujkufU6mEpl
	l/uVC2sYoOK4dT6WePuuLZEhrya9mK06vpRf7w1bI8n8IHVhOm+b7ypTHLuh5jAwRgR4luaIOcNQa
	alWGePKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZ6y-0000000FLlN-371f;
	Fri, 20 Jun 2025 10:36:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSY3N-0000000FBhm-3P30;
	Fri, 20 Jun 2025 09:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=O0Z76gXzXASZvB45zMW7OBOfjiQs1Vtulp5U1K5X9+M=; b=E0xVwfePovI7zW07TkUrEmyv3u
	R6+iMMc2szMneU5Th+XbYLGrJMTI6wOnXneDpAa+NUznRovozXXGjIsRNZ3jM5XtXpaSvZ+1O50KY
	/YiANnD7+B6m3xmrAmSMjP/ADzGH+C6YP3KUnsrlFQtdCCWYW1TKw6kg35jrkVA8/N1yz/0KxnISa
	VrP5B9U/Y2f2kkmCCaa5m0sT8obSTTtEQZQ29fJbf2qyDFec7LH9Tvi5mpfWM2Npr8PKr7SZ2DGtm
	gE+NS9aCpNSgCLmcAC0mjhuBV8cJR6kxgEocCpeaFl2Hkr/s+H0fNHscRzNLwFSQ8wO+n2cjCxUnY
	61fY+D8A==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSY2z-0008Po-Kz; Fri, 20 Jun 2025 11:28:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Fri, 20 Jun 2025 11:28:32 +0200
Message-ID: <2241399.8hzESeGDPO@phil>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_022857_847370_89B309F6 
X-CRM114-Status: GOOD (  15.78  )
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

Am Freitag, 6. Juni 2025, 08:28:20 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Tomeu Vizoso:
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
>=20
> In its current form, it supports the specific NPU in the RK3588 SoC.
>=20
> The userspace driver is part of Mesa and an initial draft can be found at:
>=20
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
>=20
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

> ---
> Nicolas Frattaroli (2):
>       arm64: dts: rockchip: add pd_npu label for RK3588 power domains
>       arm64: dts: rockchip: enable NPU on ROCK 5B
>=20
> Tomeu Vizoso (8):
>       accel/rocket: Add registers header
>       accel/rocket: Add a new driver for Rockchip's NPU
>       accel/rocket: Add IOCTL for BO creation
>       accel/rocket: Add job submission IOCTL
>       accel/rocket: Add IOCTLs for synchronizing memory accesses
>       dt-bindings: npu: rockchip,rknn: Add bindings
>       arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base
>       arm64: dts: rockchip: Enable the NPU on quartzpro64

from a handling point of view, I would expect patch 1 - 6
(driver code + dt-binding patch) to go through some driver tree
but have not clue which one that is.

And afterwards, I would pick up the arm64 devicetree additions
patches 7 - 10 .


Heiko



