Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9CAC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lul6bH+KnziLSHsaNUgdDGmD82l4xkx/lf7VxzcZeqY=; b=t2G7ixqk92W7cE
	Gt7jApmN1tM9RDEGmEkPb7G0JHUIDXf6nzCStoDB2zjGXapwEqLEC3UWypY3jfuz5Bqv2VCVcvBIP
	ZlkwerAohliB1W6mEmdeW2RIKKQ5Yktxo36F7lZ88Ixfgaz2XMDWAeD313uyrQ7PqEi+hw/iGbUaD
	Up32lzCSHrM2Ij6uYUeMDAB8LHPKfWs9geixrSc7r4JMle7b53BhxpYsqzwQVQK6opC+P5UMp2s+X
	KlHytuWfoX1po8GlYAjG2lq46F9y+/sKzddXyxCsZI78hFqCYJRxltXaApGP2JMgVXhthF/pwiKKC
	pkLR8tTVYpnAiz9LDn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm8Or-0000000Amae-1SzN;
	Sun, 23 Feb 2025 09:35:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm8Ll-0000000Alh4-2k6G;
	Sun, 23 Feb 2025 09:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740303154;
	bh=IIbQtGdGs7/uoTW3BPrdz9oK55TicYM24n7b/K73gFU=;
	h=From:Subject:Date:To:Cc:From;
	b=mEvbdRS1VxG65ooVjFYOLU7F8HeB1To6Bi79Hb7N9zMDZvL8lbl0MX/6g2u6q+37U
	 4x5ZNGK9SD7cpsNG0F6fw+hLOWhpFzQ8QhAKGzZA9xIPNEUuOTkCd3CGCfRzuKud9J
	 2A2/3Ivu6OWh68VIRPentM+bXr74fL/vtOUmVa3v5GasPfr8Sp/Q1zlyCZpYppKyXj
	 dHq/IWwK/uUtNquzGdqxqF9tP98nj9/pp+B3yGfoFtN32iCtHKBja5bzfoTdwFjmKH
	 fzEAdLXjvhTTdOFstg4yAbIK54ARp6OQ2tXe8jayHVHC0juxHL22s0jyfrEhGBvRPe
	 YRVRphvDUijLw==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id CBB1117E00BD;
	Sun, 23 Feb 2025 10:32:33 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/5] Improve Rockchip VOP2 display modes handling on
 RK3588 HDMI1
Date: Sun, 23 Feb 2025 11:31:36 +0200
Message-Id: <20250223-vop2-hdmi1-disp-modes-v2-0-f4cec5e06fbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPjqumcC/4WNQQ6CMBBFr0K6dgwzEayuvIdhUdpRJgGGtKbRE
 O5u5QIu30v++6tJHIWTuVariZwlic4F6FAZP7j5ySChsKGampqwgawLwRAmQQiSFpg0cAJ2Nrg
 T2d5bNmW7RH7Ie+/eu8KDpJfGz36T8Wf/FTNCDRYvLbkzNhjam9dxdL1Gd/Q6mW7bti+VtVD5v
 gAAAA==
X-Change-ID: 20250215-vop2-hdmi1-disp-modes-ea8da428bc8e
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_013237_885902_123B30CA 
X-CRM114-Status: UNSURE (   9.17  )
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

As a followup to getting basic HDMI1 output support [1] merged upstream,
make use of the HDMI1 PHY PLL to provide better VOP2 display modes
handling for the second HDMI output port on RK3588 SoC, similarly to
what has been achieved recently for HDMI0 [2].

Please note Heiko's fix [3] in of_clk_get_hw_from_clkspec() is also
required for boards that do not provide HDMI0 output, that is to ensure
devm_clk_get_optional() returns NULL instead of ERR_PTR(-EPROBE_DEFER),
which otherwise would put rockchip-drm module in a permanent deferred
probe mode.

Additionally, enable HDMI1 output on Rockchip RK3588 EVB1.

[1] https://lore.kernel.org/lkml/20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com/
[2] https://lore.kernel.org/lkml/20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com/
[3] https://lore.kernel.org/lkml/20250222223733.2990179-1-heiko@sntech.de/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Make use of dev_err_probe() for handling failures when trying to get
  pll_hdmiphy1 optional clock (Sebastian)
- Add a new patch to replace drm_err() calls in vop2_bind() and
  vop2_create_crtcs() with dev_err_probe(), to simplify error handling
  and improve consistency, along with some related fixes
- Link to v1: https://lore.kernel.org/r/20250215-vop2-hdmi1-disp-modes-v1-0-81962a7151d6@collabora.com

---
Cristian Ciocaltea (5):
      drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI1
      drm/rockchip: vop2: Consistently use dev_err_probe()
      arm64: dts: rockchip: Enable HDMI1 PHY clk provider on RK3588
      arm64: dts: rockchip: Add HDMI1 PHY PLL clock source to VOP2 on RK3588
      arm64: dts: rockchip: Enable HDMI1 on rk3588-evb1

 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts |  42 ++++++++-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi   |  22 +++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c     | 108 +++++++++++++----------
 3 files changed, 123 insertions(+), 49 deletions(-)
---
base-commit: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
change-id: 20250215-vop2-hdmi1-disp-modes-ea8da428bc8e


