Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B10606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3VYPJtns;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Ht3r8ZbP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Unsubscribe-Post:
	List-Owner; bh=eBVG4o5Q+efGxzA1i/yK8O3OZQl+XBXEI5EUCcqeJDk=; b=3VYPJtnsIjqeH/
	r3IiBDiqefy1ehHyOX6HPjZQtaEy7a0yyf5MpngltV62XG9IBh5e4Ka8jQ2xTNDlEGeTG3s2Vdiyd
	MrW2COYWYrPlBYUA5IM8shuwQIIG9Giyj8v5rOA6ECijAwXDFj5aE4jQ4LTUALSzol7RTIZVZ0uyJ
	gYszisjdN+vqwe6/d3yKMmu9Nb8pX479tMG1uO2oqZjiozkcCwdmxy8GrcbA/N/fNDhOQ8NOYZCMQ
	J78vzxh+/ZAeHG+/5GOL2lNSrNpHx7RHTYoEUpvqR14ax+ZNKBftrmcOTsu1weDJOH0BUrJDVG1Yb
	lw9pFwIuSXJk75zL1LWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5U6-00000007LKT-3zfC;
	Wed, 28 Oct 2026 15:22:38 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Tx-00000007L7z-23D0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:22:35 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261028152226euoutp027dc5c5a8f7f86f79e56e33fd732a9192~iusJ7bllo1489814898euoutp02F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 15:22:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261028152226euoutp027dc5c5a8f7f86f79e56e33fd732a9192~iusJ7bllo1489814898euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793200946;
	bh=eBVG4o5Q+efGxzA1i/yK8O3OZQl+XBXEI5EUCcqeJDk=;
	h=From:Subject:Date:To:Cc:References:From;
	b=Ht3r8ZbPzNEEKcx+1KxOvYF+okaPL4voM/rlfSDkgIHFrGiJTrm4xVAzuPadR+sGQ
	 S2qRspU0ZOteNKzZXxVI3rpIXg7b7s3YErZNqRsozWyNPwDlEk0YWfQn7PKAtrBjAo
	 PVOSvY6o4vKJquq3KMzELmpp1fYIxd4NI3GKc0LI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261028152225eucas1p133ea1b7981dfa2afe085b83e1bd6de3b~iusJjPOhi0628506285eucas1p1y;
	Wed, 28 Oct 2026 15:22:25 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261028152224eusmtip14ff4edada07d0beea9c9bddae2f23311~iusIrBPBq1826418264eusmtip1i;
	Wed, 28 Oct 2026 15:22:24 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v6 0/5] phy: Add the StarFive JH7110 Innosilicon HDMI PHY
Date: Wed, 28 Oct 2026 16:21:40 +0100
Message-Id: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQT4moC/zWNwQ6CMBAFf4X07JrSQime/A/DobYLXSOFtEokh
	H+3knicSd68jSWMhIldio1FXCjRFDKoU8GsN2FAIJeZCS5UyYWGh2/KkgOFMIF3I8HsV9ASa9s
	bVUmULE/niD19juyty+wpvaa4Hi9L/bNHkLei/QftE02AhMHBUgMHLe6V0yitss01mTG9w3C20
	8i6fd+/FvQ0wLcAAAA=
X-Change-ID: 20261028-jh7110-inno-hdmi-phy-83e5cfa643e3
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>,  Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Emil Renner
	Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>, Byron Stanoszek <gandalf@winds.org>, 
	OOHehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3586;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=DYIe08HIrEITFvW4Wmq05N5Ik9goDCsoGozIIBA8kp4=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9EjaQWs9msu2tYfjK3+2JRnETs2bv+KK+Zb3Zkr9/q
	vz4ksQqOkpZGMQ4GGTFFFnObow2kvzH8LT8+ONfMHNYmUCGMHBxCsBE1FsYGXZvWjUz/V789JgH
	fed3/Tv3anvpc5GFxa28H9JPnv35pWkKI8P+O9JKzm2851jOK3QWvPAzWr/o9OLyjVu4QoPrdaU
	XGDMDAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261028152225eucas1p133ea1b7981dfa2afe085b83e1bd6de3b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028152225eucas1p133ea1b7981dfa2afe085b83e1bd6de3b
X-EPHeader: CA
X-CMS-RootMailID: 20261028152225eucas1p133ea1b7981dfa2afe085b83e1bd6de3b
References: <CGME20261028152225eucas1p133ea1b7981dfa2afe085b83e1bd6de3b@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_082229_850781_8D1A685E 
X-CRM114-Status: GOOD (  18.83  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the HDMI PHY driver for the StarFive JH7110 and shares
the pre-PLL code it has in common with the Rockchip RK3328 Innosilicon
HDMI PHY.

Up to v5 it was part of the JH7110 display series [1]. It is split out
as Vinod suggested, so it can go through linux-phy on its own; the rest
continues as v6 of "drm: starfive: jh7110: Enable display subsystem".
Nothing here depends on the display series. The display series depends
on this one: its HDMI subsystem binding references the PHY binding from
patch 1, and it needs the PHY driver at runtime.

[1] https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/

The JH7110 has the same Innosilicon PHY as the RK3328, offset by 0x100
because it sits behind the HDMI controller in a shared register block.
Patch 2 factors out the pre-PLL config format, table lookup,
determine_rate, recalc_rate and the pre-PLL programming; patch 3 moves
Rockchip onto it; patch 4 adds the JH7110 driver. Pixel clock tables,
post-PLL and analog config stay SoC specific.

Patch 3 should be a no-op for Rockchip - same writes, same order, same
values - and RK3228, whose pre-PLL is at different addresses, keeps its
own register code and shares only the lookup. I have no Rockchip
hardware, so it is build tested only (arm and riscv). A Tested-by would
help.

Patch 5 adds a MAINTAINERS entry for the binding and the driver, as the
other JH7110 PHY drivers have.

Testing
=======

Tested on a VisionFive 2 v1.3B together with the display series, using
modetest: all 42 modes the sink advertises work, with pixel clocks from
25.175 MHz up to 297 MHz.

Every commit builds for riscv and arm.

Changes in v6:
- Split out of the JH7110 display series (Vinod)
- inno_read() returns the regmap_read() error and recalc_rate checks it,
  instead of a failed read turning into a zero divisor (Vinod)
- Bound the pre-PLL and post-PLL table walks with the table size instead
  of relying on a sentinel (Vinod)
- Lowercase hex in the JH7110 pixel clock table (Vinod)
- New patch 5: a MAINTAINERS entry for the JH7110 HDMI PHY, moved out of
  the display series' entry
- Rebased onto v7.3, collected tags
- Link to v5: https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/

---
Michal Wilczynski (5):
      dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
      phy: Add common Innosilicon HDMI PHY helpers
      phy: rockchip: inno-hdmi: Use the common Innosilicon PHY helpers
      phy: starfive: Add jh7110-inno-hdmi-phy driver
      MAINTAINERS: Add StarFive JH7110 HDMI PHY entry

 .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  49 ++
 MAINTAINERS                                        |   6 +
 drivers/phy/Kconfig                                |   8 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-inno-hdmi.c                        | 358 +++++++++++++
 drivers/phy/rockchip/Kconfig                       |   1 +
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 169 +-----
 drivers/phy/starfive/Kconfig                       |  20 +
 drivers/phy/starfive/Makefile                      |   1 +
 drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 587 +++++++++++++++++++++
 include/linux/phy/inno-hdmi-phy.h                  |  88 +++
 11 files changed, 1144 insertions(+), 144 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261028-jh7110-inno-hdmi-phy-83e5cfa643e3

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>


