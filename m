Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55269D64072
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 18:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9DAkTBQ6lkUb/z5UUzy1348Kes752cpPmeRIw5hf99o=; b=GuVZa9p/4+O3Hx/h0jZY8TYHsw
	64BW8L28YHn9BdGagWHv4Ax+RX3hu1Ma3++pVOSRPY9buhsGvMIMdvhC2B/3SYVJFG8TYptx2GZzI
	VA6NTcUQf77RuAStVhBxF6UhncJ+bmzHV8YsAw67yMPF6ECDDpXcQ4PdN7+z1cpEzqzPqGidY1G3r
	ySMxAIB0P2mvoOIPPPUyIxxv7WzcluDXVOsiX1AyLuWERqC9tjEtvnmMJ/LUFxCtk4NKz+nnKFSiO
	/x2HqGfpaYYdWyqM2oSg3rznPgu84H9WP10RCjc0aHcdgM97gLKqLFn1wS5gWdp29K/064tAOJFk1
	420nKD2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9U7i-0000000BfIx-1kiK;
	Fri, 08 Nov 2024 18:54:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9U5u-0000000BeUH-1vIN;
	Fri, 08 Nov 2024 18:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731091947;
	bh=L9PZiEX333+Du0NXmYmoMzUp2gsXJVu8bc+StkfIx1E=;
	h=From:To:Cc:Subject:Date:From;
	b=e9yPG+j+tbA5rv4eGyOBc65gC2rIW8aGsxtTc9tEA/EDmnlJSTPeqedHOMGE/qtvE
	 VFV5mJ3KU5wl1hez1BGe7Z24yN3t9gAIp2IE5zR9Du9rC4eTHovO2caopGpD6s2nFS
	 voNFKk8l0a0umITXRWRn23jlyl7M+GjNcWDXRmYujFQBAuwYqDg7qvHVXomWG0vksF
	 C+WDDA6e6t2wbaib40Xv+vqgT67Xhezt684ituQIMFvxRnMKb/tJhwM2Lc761Ba3L2
	 YNugjQnn/5mlBwa58HLzbkYbQz47qwflIebsA1Vt5VlNvfQ4V+tueJEuJ47GHV7V17
	 U3wtA5O+Ms4uw==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8903117E376A;
	Fri,  8 Nov 2024 19:52:24 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stubner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 0/3] drm: rockchip: vop2: Add VP clock resets support
Date: Fri,  8 Nov 2024 13:50:38 -0500
Message-ID: <20241108185212.198603-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_105230_694072_222D93DB 
X-CRM114-Status: UNSURE (   9.54  )
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

The clock reset must be used when the VOP is configured. Skipping it can
put the VOP in an unknown state where the HDMI signal is either lost or
not matching the selected mode.

This adds support for rk3588(s) based SoCs.

Changes since v2:
- Rebase on latest master
- Add details on how to reproduce the issue

Changes since v1:
- Add AXI and AHB clock resets
- Set maxItems for !rk3588 in vop2 bindings

Detlev Casanova (3):
  vop2: Add clock resets support
  arm64: dts: rockchip: Add VOP clock resets for rk3588s
  dt-bindings: display: vop2: Add VP clock resets

 .../display/rockchip/rockchip-vop2.yaml       | 40 +++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 30 ++++++++++++++
 3 files changed, 82 insertions(+)

-- 
2.47.0


