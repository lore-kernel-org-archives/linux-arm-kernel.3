Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA722CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1sdUkVyuBwycwSEw+9J3aHeyMgVzVVE7BXpeQtOuDac=; b=z7TtnwyKyWRZnaxVt1uc1gr+bC
	qEF+pdHosi15bKV3GHrT165xRSM5K9pLqxeJ7eIwGAWTuR9GcYpHjfrlx4KhINE+xaevVyLLvSrgW
	mB/RUVEejYMz6veip0q/Y8bohTSscdDH/WHSC5nNV24sbgSn7NkaFKjAmY9ezzR9YCqJsVDvFtH2k
	MVKf9RA2rnajgRDsTfY9Wukftl7ShlwlQWFIjJAxNks9Wj3KzEpH21E2PakPa4NFuuUO/guO3177F
	LPz+plOFILCmz5qJSWIFcgC1FmeF0cZQhQ0OG3uBSCftUhpboOLJVN/m4B6UNkMG1trdA1JOPCuaE
	um0PoAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEy-00000008hW3-4AxT;
	Fri, 24 Oct 2025 08:33:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEW-00000008gn6-0iqB;
	Fri, 24 Oct 2025 08:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294790;
	bh=vOWEWKdi3bjK7LjRlKsISvl3DrortAGk12XkW77HR2I=;
	h=From:To:Cc:Subject:Date:From;
	b=MQtolijM30FxuWvoBD+kf27lrR8xCebGpeYNnqaFJo4qyFxQYikFsp4DUCGVCR7UX
	 YTBmSS74ztjJSgIiYpCR86uiVd5UZSGS1bZcrCeCUYa435yvipynsOIOrI+pdJmD+2
	 +8gFfEcqNFGkJaoySPOGrwYaNONUXZ1ucMA9uP6/LTbP6Kof1JJHShaPWLZ49rXOOy
	 aiueRpvKrPs0u84C0zy+Pmz0juqAXKFhi1OnOURxSHuhzMYUL9E4LNVG92I7bSEsjt
	 bw703QbAh+uscn1yy+U2ZZyZeRyq3o32sQAsVis98wt4FmSnYDD+mNoeBFizG/Q7jE
	 eyNcOqmhpKQFg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DE4917E00A6;
	Fri, 24 Oct 2025 10:33:09 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	laura.nao@collabora.com,
	nfraprado@collabora.com,
	wenst@chromium.org,
	y.oudjana@protonmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/7] clk: mediatek: Add support for SPMI Clock Controllers
Date: Fri, 24 Oct 2025 10:32:54 +0200
Message-ID: <20251024083301.25845-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013312_448238_847105CA 
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

Some new PMICs, Clock IC and combos are complex SPMI 2.0 devices that
contain multiple IPs, including clock controllers.

This series expands the MediaTek clock helpers to allow registering
clock controllers over SPMI, and adds a clock driver for the MT6685
SCK_TOP clock controller.

For now, only gate clocks are supported to reduce the complexity of
this change.

NOTE: This series depends on series [1] "SPMI: Implement sub-devices
and migrate drivers"

[1]: https://lore.kernel.org/all/20251021083219.17382-1-angelogioacchino.delregno@collabora.com

AngeloGioacchino Del Regno (7):
  clk: mediatek: Split out registration from mtk_clk_register_gates()
  clk: mediatek: clk-gate: Simplify and optimize registration iter
  clk: mediatek: clk-mtk: Split and rename __mtk_clk_simple_probe()
  clk: mediatek: Add and wire up mtk_spmi_clk_register_gates()
  clk: mediatek: Add support to register SPMI Clock Controllers
  dt-bindings: clock: Describe MT6685 PM/Clock IC Clock Controller
  clk: mediatek: Add support for MT6685 PM/Clock IC Clock Controller

 .../bindings/clock/mediatek,mt6685-clock.yaml | 37 ++++++++++
 drivers/clk/mediatek/Kconfig                  | 15 ++++
 drivers/clk/mediatek/Makefile                 |  7 +-
 drivers/clk/mediatek/clk-gate.c               | 70 ++++++++++++-------
 drivers/clk/mediatek/clk-gate.h               |  6 ++
 drivers/clk/mediatek/clk-mt6685.c             | 70 +++++++++++++++++++
 drivers/clk/mediatek/clk-mtk-spmi.c           | 62 ++++++++++++++++
 drivers/clk/mediatek/clk-mtk-spmi.h           | 31 ++++++++
 drivers/clk/mediatek/clk-mtk.c                | 66 ++++++++++++-----
 drivers/clk/mediatek/clk-mtk.h                |  5 ++
 .../dt-bindings/clock/mediatek,mt6685-clock.h | 17 +++++
 11 files changed, 339 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6685-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt6685.c
 create mode 100644 drivers/clk/mediatek/clk-mtk-spmi.c
 create mode 100644 drivers/clk/mediatek/clk-mtk-spmi.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6685-clock.h

-- 
2.51.1


