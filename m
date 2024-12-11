Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F7FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k6UBTx9ZKI9dHVjpUza8rkw1lL3TnOB8Df7IkQ2/wGQ=; b=d3Ed4SY8sNlIJ5
	NkIfgk1S4STS7oSVenAkYfKPLZdWqPFK+ncVYgGrwEuR1UqN9UnQn3WDBmcOqMqaUCXSOcXObP5uU
	KNe8ix5xinOAqFNqoxzcMjC/o7S1S1hYFjAR5XJNwzKbPpSolTcvQEEq0pb2/ZVyJAekIiilbZ6vc
	EG863bgE9SK+QIuIEGgS7kgRi7IIKKoTB0zSPdkSGrvY2XMmGlZMM9vSiREVoc2UFS5lMVK2K0TAk
	JUkxBARJhE6obNCgXKxu9r7oaZNp3/4JnTkJ3MG+kQzSWBXazm5mM4PXQujij9IdhJyrOgkFKL1Yq
	U3w5Ay/f0KzZTHqqAhfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJnG-0000000EY9l-1ZsG;
	Wed, 11 Dec 2024 10:18:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJkf-0000000EXYY-430I;
	Wed, 11 Dec 2024 10:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733912127;
	bh=ih7Vsnj9ywdYxh7tR2qjlznCSvRVx5lmggLsQKhoolI=;
	h=From:Subject:Date:To:Cc:From;
	b=IKrpu1xPLywnKIeJ53zP0EULAmN3li50hVFXh2h8PoJ56+0TOh8pjicWQRgcPun5N
	 wsAtHooBHZH/JsRTU66C/RcxcdXou1sV95/A46QFVTGcvxEvMFYDgMpqapncJLqpCF
	 qBYgAK47aPvXfAtPYD/9qaGHUjt9c1Q92YrSql5eqyPEHTA5OHoFd9MugDPVtoaNYn
	 5faLjjYOgqmoZcJZwsUEXdAbsoa0v2UG956+pFxY+iGgfhhXffXPa3uunWY8uUh0n/
	 KANbkGeQs9Vty3nV9HyH3t7jYFrBVGQTCYs5n0sChEBqy+F30QRb3YYagWlcMyA4o5
	 p4qxkd88HP24Q==
Received: from localhost (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1888017E35F5;
	Wed, 11 Dec 2024 11:15:27 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/5] Improve Rockchip VOP2 display modes handling on
 RK3588 HDMI0
Date: Wed, 11 Dec 2024 12:15:04 +0200
Message-Id: <20241211-vop2-hdmi0-disp-modes-v2-0-471cf5001e45@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAChmWWcC/4WNTQ6CMBBGr0Jm7RhaEMGV9zAs+jPIJMCQ1jQaw
 t2tXMDle8n3vg0iBaYIt2KDQIkjy5JBnwpwo1mehOwzgy51rZRqMMmqcfQzl+g5rjiLp4i26qh
 qVHdt2gHydg008PvoPvrMI8eXhM9xk9TP/ismhSVq68xFeVu3XXt3Mk3GSjBnJzP0+75/AXjGU
 P6+AAAA
X-Change-ID: 20241116-vop2-hdmi0-disp-modes-b39e3619768f
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 FUKAUMI Naoki <naoki@radxa.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_021530_183254_1BBC7EED 
X-CRM114-Status: GOOD (  11.74  )
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

VOP2 support for RK3588 SoC is currently not capable to handle the full
range of display modes advertised by the connected screens, e.g. it
doesn't cope well with non-integer refresh rates like 59.94, 29.97,
23.98, etc.

There are two HDMI PHYs available on RK3588, each providing a PLL that
can be used by three out of the four VOP2 video ports as an alternative
and more accurate pixel clock source. This is able to correctly handle
all display modes up to 4K@60Hz.

As for the moment HDMI1 output is not supported upstream, the patch
series targets HDMI0 only.

Additionally, note that testing any HDMI 2.0 specific modes, e.g.
4K@60Hz, requires high TMDS clock ratio and scrambling support [1]. The
patch is usable but not yet ready to be submitted - I will handle this
soon.

Thanks,
Cristian

[1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/rk3588-hdmi-bridge-next-20241115

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Collected Acked-by tag from Rob and Tested-by from Naoki
- Rebased series onto v6.13-rc1
- Link to v1: https://lore.kernel.org/r/20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com

---
Cristian Ciocaltea (5):
      dt-bindings: display: vop2: Add optional PLL clock properties
      drm/rockchip: vop2: Drop unnecessary if_pixclk_rate computation
      drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI0
      arm64: dts: rockchip: Enable HDMI0 PHY clk provider on RK3588
      arm64: dts: rockchip: Add HDMI0 PHY PLL clock source to VOP2 on RK3588

 .../bindings/display/rockchip/rockchip-vop2.yaml   |  4 +++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  7 +++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       | 36 +++++++++++++++++++++-
 3 files changed, 44 insertions(+), 3 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241116-vop2-hdmi0-disp-modes-b39e3619768f


