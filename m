Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0734EEE265
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 20:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SVW0D3VHQ/9UYMf1H6TYmbhWryKWzOQzD+QDECFAVCI=; b=sWnmMWeOh8U106M8vBrkhEgX1a
	CydBDlWfkpCUNe95wScQxv7B0MgX6Yxp5MJpEDvcYmXC1MXFDw+yyzhFFY9s6B8sWt6/2PtiC1CLY
	fjaxzS8/yfAk1oZ/6NkO1LP9bf7wKMT3QRUnISKRG/wRsLBlCUNVJBP5Ks6dVAfxlhsdx40eCvFWi
	T+KWIhIMlAf1wKz3hhrXYf1nxwQcqdzBSYtnjrZoKWeNYK/KUFmO80/Z1Y3zEgA4ojdELWnd+muU8
	SquN8fYt2OzSH+SGFGkNY+N9N2kwmCQC/k8HqwGl9Z5lIYrA8FAJluU3H701edCs8LzbWiR5ezFnJ
	OU7Wj8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPSk-00000007U6s-0ux7;
	Thu, 01 Jan 2026 20:40:02 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPSf-00000007U5U-12ny;
	Thu, 01 Jan 2026 20:40:00 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dhzGJ6vKyz9slB;
	Thu,  1 Jan 2026 21:39:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767299993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SVW0D3VHQ/9UYMf1H6TYmbhWryKWzOQzD+QDECFAVCI=;
	b=HVVtud7Bpy/sLXqYXGgCGO8pIj7w55qFOc5IsQUvjS+S7IWOvJoIyc6D5e5o7yqJLjQmln
	7pxQIFxai6Q/O4mTYDSzMPemCLkD/RXHJWBFXnxZUQ6oMnR2D/YRtPr1fWXbjeh6C1izSa
	Fd3Ef/mAWS6hSbA+GkpAq3BGHrkWC/R3lHKqm+hv27JvgkSotzFTqRw4klOLPOgKcwdJj0
	uK5rAgBD7jyj8smpMsNuM5i9hvfmQiixlBdb8LliYhMflgX5IDRuPuxYW2UdfHUxZ0YC2o
	WICzAgzLHPX3C/nZoFh6h97I3d6tsrWwfPMLXf9k3UsS4kYfice2SHRj9otyLw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=mbAzoHmD;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767299991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SVW0D3VHQ/9UYMf1H6TYmbhWryKWzOQzD+QDECFAVCI=;
	b=mbAzoHmDtSsvpOE0MXMScrn3TdZqdmt415JFUuUhiEfw5+KQ29vF9BlLiifFODiDwRe3SB
	J0rArQI373uKSSF/lrstCN7FXlRtQEPIqGafvak/JJ9JzsLV6YYXiTJIZ2g0+sHRp1HYm0
	g8yu8U2oSwp94AMRw7SBaetIZPkQDC57uylRQBToeFlNk2uUzkL3d9+1j4ies+S1cxq6es
	LajTyee8Le2e4CbKrRTgK0nNrApfLRJilmqoTdL2K3nqKNClS1JrwDt9Pvjk5TdUlrgrYa
	cadY3jNf/O2nGBni910yOeUJd7lBCynpy7qlyUFGfH/2GysjgT56xQmOLuAZ+g==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/11] Describe PCIe/USB3.0 clock generator on R-Car Gen3
Date: Thu,  1 Jan 2026 21:35:47 +0100
Message-ID: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7pm6idxcp1gs3rc5wka53woapptag165
X-MBO-RS-ID: ed28d9c32f1f63fc69d
X-Rspamd-Queue-Id: 4dhzGJ6vKyz9slB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_123957_438309_2F39B12D 
X-CRM114-Status: GOOD (  10.51  )
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

Describe the 9FGV0841 PCIe and USB3.0 clock generator present on various
R-Car Gen3 boards. The clock generator supplies 100 MHz differential clock
for PCIe ports, USB 3.0 PHY and SATA.

The series effectively has three parts, the first three patches are part 1,
which fills in the missing USB 3.0 PHY on R-Car E3 Ebisu and enables it,
thus aligning the Ebisu USB 3.0 support with the rest of the Gen3 boards.

The second part is description of PCIe root ports on R-Car Gen3 SoCs where
applicable, in this case that is H3/M3W/M3N/E3. The root port is used with
PCIe port power control to also control the PCIe port clock. This is needed
on Gen3 boards, because they often use separate clock output from the PCIe
clock generator 9FGV0841 to supply clock to the controller and to the PCIe
port.

The third part is enablement of the 9FGV0841 PCIe clock controller on the
R-Car Salvator-X/XS, ULCB and Ebisu boards. The boards use the PCIe clock
controller outputs in a slightly different manner, all use the outputs to
supply PCIe controllers and slots, as well as USB 3.0 SuperSpeed PHY. The
ULCB board also uses the 9FGV0841 to supply SATA IP, but this is not yet
described in DT, therefore it is also not part of this series.

Marek Vasut (11):
  dt-bindings: phy: renesas: usb3-phy: add r8a77990 support
  arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and USB3S0 clock nodes
  arm64: dts: renesas: ebisu: Enable USB 3.0 PHY
  arm64: dts: renesas: r8a77951: Describe PCIe root ports
  arm64: dts: renesas: r8a77960: Describe PCIe root ports
  arm64: dts: renesas: r8a77961: Describe PCIe root ports
  arm64: dts: renesas: r8a77965: Describe PCIe root ports
  arm64: dts: renesas: r8a77990: Describe PCIe root port
  arm64: dts: renesas: salvator-common: Describe PCIe/USB3.0 clock
    generator
  arm64: dts: renesas: ulcb: ulcb-kf: Describe PCIe/USB3.0 clock
    generator
  arm64: dts: renesas: ebisu: Describe PCIe/USB3.0 clock generator

 .../bindings/phy/renesas,usb3-phy.yaml        |  1 +
 arch/arm64/boot/dts/renesas/ebisu.dtsi        | 43 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     | 29 +++++++++++++
 .../boot/dts/renesas/salvator-common.dtsi     | 26 +++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      | 21 +++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi         | 13 ++++++
 10 files changed, 213 insertions(+)

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.51.0


