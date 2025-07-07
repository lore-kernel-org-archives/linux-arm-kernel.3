Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F111C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JZcynsvnDSxG44nSJOzOoxMaRleP/awBF0vJUSMa2oA=; b=3X2QGL84xdMnpKcQK6hXivILV1
	mOPa+Jzop1reWAV6wUNmRrae4itTWQMfUPs0wBN9GWJAVztpgZtrdrb7MVH+VcpETktoaXKFGrhSR
	nIfrzJDnBfRY+JM2RSklItjoKBtGN6n7Aarnj7MtDBPbdsyoxxWbJLPYZGV25cJ5nWWKFF8PqEf+1
	3gyk++qN7BxUR9Z3Rt3MYKdDc+fjFIgJLqX9lrh54444Bir5mzKAyF6OF/G8upH2DjuOGZ90kz6sA
	RadwSIG/GKdQTAxPStT9B+EluyyPbYTYxvPU01gsY2F8v8U2RBegFBfWua4YX+TrRbuIR+3Xd0Smg
	XXhPWn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpty-00000003Coj-391U;
	Mon, 07 Jul 2025 17:45:14 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp5A-000000034qu-2hPm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:52:46 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 97EE21F0003D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 16:52:42 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 0AE85ACAEEB; Mon,  7 Jul 2025 16:52:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 2C0B8ACAEE0;
	Mon,  7 Jul 2025 16:52:08 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 0/4] Allwinner A100/A133 Ethernet MAC (EMAC0) Support
Date: Mon,  7 Jul 2025 18:51:51 +0200
Message-ID: <20250707165155.581579-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_095244_849946_BB736557 
X-CRM114-Status: UNSURE (   9.26  )
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

This series adds support for the Alwinner A100/A133 Ethernet MAC (EMAC0)
and uses it in the Liontron H-A133L board.

Changes since v1:
- Reverted the emac0 to emac rename;
- Added collected tags.

Paul Kocialkowski (4):
  Revert "pinctrl: sunxi: Fix a100 emac pin function name"
  arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
  arm64: dts: allwinner: a100: Add EMAC support
  arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support

 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 35 +++++++++++++++++++
 .../sun50i-a133-liontron-h-a133l.dts          | 19 ++++++++++
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c   | 32 ++++++++---------
 3 files changed, 70 insertions(+), 16 deletions(-)

-- 
2.49.0


