Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65884EB7EB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z5F1xHevokIdYUTpw8nlsMd8XqO95RKvReIBkCrMMwI=; b=fRo4S6H0ruGc8e
	r4uOHyjn06nZl0bsxIY9PsmZN0HrZNhB++tJIfk17lJHsAIOM2l8GFs1uC/Fjqhnc7J6zsVow2uix
	LKW5+1S43iXnvRhIoyQYnBwGgpOPHc43JTHDYICjYfQygGQlf2ZmPfA71lWtGZKKKHVeVTBreQxp2
	NW6nKP5tF6PzFd+hScR9btPCQ1AbVX0swUgwjVJJx22p8E3WLa2WP2NtzjWOpm+p9v2umFmUOGr7V
	6RD2JfIUcAbjQVi+OW4keFQNDzQebp0PKBJNRx0nvwnbMfFDt2kC/e3HWxgcpi7YGxWlmBRTkjZWM
	P6w+w8cbwrs4npQBfZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxieS-0000000GtFU-1B5o;
	Wed, 04 Mar 2026 09:36:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxieP-0000000GtEA-16gz;
	Wed, 04 Mar 2026 09:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772616974;
	bh=2R7/eNnX/6fgjXow5X/hQIDpbueZctqQyMkZeUPD3Zg=;
	h=From:Subject:Date:To:Cc:From;
	b=gU6aUdC6kbOfvCyKVzGIJ/YbT+A+agy1LU6O9HNv865acYzDED1GDlGlo1GlUNzZs
	 hFHNHcXGwVwaINPH2UZe3W6epkwfbQ0NDi/mmgNqnCv26bcdfHqT1y6P95+khcUM/r
	 RS+cs3N8W+k3MZP8ermqcqBPZ3MSHNhl5I+SEDmq98Ey2Mtnsct20i1h7wBmmPho6I
	 ECpegWJmCPKKtPLlrTFVPZ1B/lbBJf84s9CGrSHSSyPRLyq2wEB50HfkoMXyYcmZc4
	 1eD8fuD2BwSs1cKeHNRMemITm2dy/A+OTKgYSfmNtuUKMywPBnLVvI0f9crOXMpNkU
	 /JtFQBmErgh9w==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1BE1817E0D90;
	Wed,  4 Mar 2026 10:36:14 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH net-next 0/2] Introduce Airoha AN8801R series Gigabit
 Ethernet PHY driver
Date: Wed, 04 Mar 2026 10:35:27 +0100
Message-Id: <20260304-add-airoha-an8801-support-v1-0-0ae4ee5a2f9d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2Nyw6DIBBFf8XMupOAYH38SuNihKGyEC1gY2L89
 5K2y5OTe+4JiaPnBEN1QuS3T34NBeStAjNTeDJ6WxhqUd+FEgrJWiQf15mQQtcJiWnftjVmbFr
 baE2aHFso+y2y88e3/YDAGQMfGcafifzay1n+64kSo1mXxeehYitoctwrZ6VqLJm6Vty1pEyvG
 yHbSTrqJmdgvK4Pj9Ed7cEAAAA=
X-Change-ID: 20260303-add-airoha-an8801-support-57d544a4afed
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com, 
 matthias.bgg@gmail.com, kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772616974; l=1977;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=2R7/eNnX/6fgjXow5X/hQIDpbueZctqQyMkZeUPD3Zg=;
 b=B87Z3g8NFoaXD7nNm4y0khdWOoYUP0ZxT7XGmcxAmxVfRqLR0uhRDIQ5g80Nfsm/ij0CMbfr+
 KPeAsHQGPYPBEo5C2/v6ECbJjUGY1JsYdwMRHa9aoqb6l8PtiaDDT37
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_013617_458978_CA805374 
X-CRM114-Status: UNSURE (   9.60  )
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

This series introduces the Airoha AN8801R Gigabit Ethernet PHY initial
support.

The Airoha AN8801R is a low power single-port Ethernet PHY Transceiver
with Single-port serdes interface for 1000Base-X/RGMII.
This chip is compliant with 10Base-T, 100Base-TX and 1000Base-T IEEE
802.3(u,ab) and supports:
  - Energy Efficient Ethernet (802.3az)
  - Full Duplex Control Flow (802.3x)
  - auto-negotiation
  - crossover detect and autocorrection,
  - Wake-on-LAN with Magic Packet
  - Jumbo Frame up to 9 Kilobytes.
This PHY also supports up to three user-configurable LEDs, which are
usually used for LAN Activity, 100M, 1000M indication.

The series provides the devicetree binding and the driver that have been
written by AngeloGioacchino Del Regno, based on downstream
implementation ([1]). The driver allows setting up PHY LEDs, 10/100M,
1000M speeds, and Wake on LAN and PHY interrupts.

The series is based on net-next kernel tree (sha1: ed0abfe93fd1) and
I have tested it on Mediatek Genio 720-EVK board (that integrates an
Airoha AN8801RIN/A Ethernet PHY) with early board hardware enablement
patches.

[1]: https://gitlab.com/mediatek/aiot/bsp/linux/-/blob/mtk-v6.6/drivers/net/phy/an8801.c

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
AngeloGioacchino Del Regno (2):
      dt-bindings: net: Add support for Airoha AN8801/R GbE PHY
      net: phy: Introduce Airoha AN8801/R Gigabit Ethernet PHY driver

 .../devicetree/bindings/net/airoha,an8801.yaml     |   81 ++
 drivers/net/phy/Kconfig                            |    5 +
 drivers/net/phy/Makefile                           |    1 +
 drivers/net/phy/air_an8801.c                       | 1059 ++++++++++++++++++++
 4 files changed, 1146 insertions(+)
---
base-commit: ed0abfe93fd135dac223e87a3c945017b1fa8bfc
change-id: 20260303-add-airoha-an8801-support-57d544a4afed

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


