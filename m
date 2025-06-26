Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDF2C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NZdVSI77pnVm+u5T/n+dMFQjtFPHtU0M95LscpQWwfM=; b=hJqIKIH9Br69yjC+ugJoGEn32D
	GAzq8UCIR4z8FNNVBfrBHqTGDHduQvOV1/qzUedldagdwqllEhpWuLzNY/cZRaWXybcDKK06IAMzp
	W5Aq/Z4p1GfHRzpttcL2Vg+2beh5Ok9ph3Q5pYB83PGuf2JtWMNxEJbjUz2Sjl9AcBvrkZX82Q7xw
	mbRHh09RZ1HzSRsDE7p81wQ/dy7xHFSx45E6huYqUNy8W2OZXV5YHf9iLU3Lrav6fNEI9Il6nAFd2
	2hh7xYlu8qmBHujCkEMmNTiMiCsWAFdHGJmmJAH6Vf3lY6lZNIYhXp/NvRiNybnwtY0GzUUbEJ6og
	gOGe/ipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUi6Q-0000000AzUG-15c6;
	Thu, 26 Jun 2025 08:37:02 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhgj-0000000AuMa-2zwZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:10:31 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 97FB91F0003D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 08:10:24 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 261D6AC7F80; Thu, 26 Jun 2025 08:10:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id EA652AC7F75;
	Thu, 26 Jun 2025 08:09:37 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 0/5] Allwinner A100/A133 Ethernet MAC (EMAC) Support
Date: Thu, 26 Jun 2025 10:09:18 +0200
Message-ID: <20250626080923.632789-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_011029_902840_7A695291 
X-CRM114-Status: UNSURE (   8.88  )
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

This series adds support for the Alwinner A100/A133 Ethernet MAC (EMAC)
and uses it in the Liontron H-A133L board.

Paul Kocialkowski (5):
  pinctrl: sunxi: Fix a100 emac pin function name
  arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
  dt-bindings: net: sun8i-emac: Add A100 EMAC compatible
  arm64: dts: allwinner: a100: Add EMAC support
  arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support

 .../net/allwinner,sun8i-a83t-emac.yaml        |  1 +
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 35 +++++++++++++++++++
 .../sun50i-a133-liontron-h-a133l.dts          | 19 ++++++++++
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c   | 32 ++++++++---------
 4 files changed, 71 insertions(+), 16 deletions(-)

-- 
2.49.0


