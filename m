Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E62CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HwAyrfJ+V4TSwmK/GgziWOx7QhcaPkNR2KkH4uHRG+s=; b=UPaMUG9VgMie8+
	P/SVVpQF+FWhOwfObNbXz6S4yfaFgdM+MQeXefFo8YZfOTyiPfgRBbATuWcCu8ISfV6YzAj+AwcMF
	Elx1qDRSLfrPzYIK9X0aR1C7ErX4J3SH5ma05d+t1RyHjsdBn6dNXKUPS1+r6SllbODe6Snh47GAw
	HyzmHSY/8i0QtCzaUxkbLhAfpEELdeoSrrHSl4JodQ3Q6AI/jRQqdxx6Y8a1UR7w4SKjzwT+/EzB/
	wlwsZYAJhAdmnLuc4IyXe7UUewUsXxtCNBLEIXgHyKoSbeTpoVz11IN+9lgYPpTdSK0eizzTN8YAh
	1GHwp35GYIMXpOafXjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ClS-00000002RXH-3RIK;
	Mon, 29 Sep 2025 12:13:58 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ClQ-00000002RWU-1ERo;
	Mon, 29 Sep 2025 12:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759148024; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OPRvw2SuOTlPCN4iRCgazJ6iZVAlqLpU31kCPzPkWjpIeyD5k7BRbqeWm0DUGPNuKV7q6nojSF+PS6XeKo+KBep8CmFq9gzg61wPBEe8JPi+YyCSGv9h8UMBzD3BXt5c/vmTBqZydfuEEsQXI+HqVBkU2+5hQm3lTPckdtWXOpw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759148024; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HwAyrfJ+V4TSwmK/GgziWOx7QhcaPkNR2KkH4uHRG+s=; 
	b=neGYy6YgC4TDXDaeBcprVqAqGRChKkLD6nJ3hnJKhGg31s7OUja+G72+RC4WxCipeMHWZWOQ1S2lqNywWabzkUxMW5xumSF4/M+hXHH1/KX64Id2UiQu4r5Bw2bE5kY/nf38kV7yLyDU+jsnAyQZHvaMJJC+eb0cmhI0iRtEreI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759148024;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=HwAyrfJ+V4TSwmK/GgziWOx7QhcaPkNR2KkH4uHRG+s=;
	b=i+u4pbLQZ961vYBzWtan6sX2DrD0VeHkM0TJaWNHGxbpn9tK07SONW9ikKLYLSCb
	ytOvyHMB8SLvlTodju2opQ+3Nxpfe0vcD/RGqiJT4SldQdn2PkgS+n504gw97znD42C
	J5KZc2/EaEOVPUFiEGXrFcvgv0W5D1io81gANa0I=
Received: by mx.zohomail.com with SMTPS id 1759148023555626.6296011238145;
	Mon, 29 Sep 2025 05:13:43 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/4] MediaTek Runtime Power Management Clocks for PLL
Date: Mon, 29 Sep 2025 14:13:19 +0200
Message-Id: <20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN932mgC/y3MQQqDMBCF4auEWXcgCVQar1JcqBnboSamk1gE8
 e4Ntcv/wft2yCRMGVq1g9CHMy+xhrkoGJ99fBCyrw1W26t21mEoL0zzjJICDpO9GWe916aB+kh
 CE28/7d6dLfReK1rOEYY+E45LCFxaFWkr+Icb6I7jC9OcVxiOAAAA
X-Change-ID: 20250929-mtk-pll-rpm-bf28192dd016
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Guangjie Song <guangjie.song@mediatek.com>, 
 Laura Nao <laura.nao@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: kernel@collabora.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_051356_399124_12500414 
X-CRM114-Status: UNSURE (   9.33  )
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

This series refactors all users of mtk-pll, just so we can enable
runtime power management. This will then allow us to have clock
controllers that depend on other clocks to be on for their control
registers to be functional.

The final use is to add this sort of relationship to the MT8196 mfgpll
clocks, which all need the CLK_TOP_MFG_EB to be on before their control
registers can even be read.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (4):
      dt-bindings: clock: mediatek: Add clocks for MT8196 mfgpll
      clk: mediatek: Refactor pll registration to pass device
      clk: mediatek: Pass device to clk_hw_register for PLLs
      clk: mediatek: Add rpm clocks to clk-mt8196-mfg

 .../bindings/clock/mediatek,mt8196-sys-clock.yaml  |  28 ++++++
 drivers/clk/mediatek/clk-mt2701.c                  |   2 +-
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c       |   2 +-
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c       |   4 +-
 drivers/clk/mediatek/clk-mt6765.c                  |   2 +-
 drivers/clk/mediatek/clk-mt6779.c                  |   2 +-
 drivers/clk/mediatek/clk-mt6797.c                  |   2 +-
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c       |   2 +-
 drivers/clk/mediatek/clk-mt7629.c                  |   2 +-
 drivers/clk/mediatek/clk-mt7981-apmixed.c          |   2 +-
 drivers/clk/mediatek/clk-mt7986-apmixed.c          |   2 +-
 drivers/clk/mediatek/clk-mt7988-apmixed.c          |   2 +-
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c       |   3 +-
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c       |   2 +-
 drivers/clk/mediatek/clk-mt8183-apmixedsys.c       |   2 +-
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c       |   2 +-
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c       |   3 +-
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c       |   3 +-
 drivers/clk/mediatek/clk-mt8196-mcu.c              |   2 +-
 drivers/clk/mediatek/clk-mt8196-mfg.c              | 104 +++++++++++++++++----
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c         |   2 +-
 drivers/clk/mediatek/clk-mt8365-apmixedsys.c       |   2 +-
 drivers/clk/mediatek/clk-mt8516-apmixedsys.c       |   2 +-
 drivers/clk/mediatek/clk-pll.c                     |  16 ++--
 drivers/clk/mediatek/clk-pll.h                     |  12 ++-
 drivers/clk/mediatek/clk-pllfh.c                   |   2 +-
 26 files changed, 157 insertions(+), 52 deletions(-)
---
base-commit: 905612298ef4f5fa9f85fbc6825af224f40af70f
change-id: 20250929-mtk-pll-rpm-bf28192dd016

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


