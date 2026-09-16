Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA4FC982C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 00:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vWYll36YW2pV6zpDuR42fgg8c3Jz+zEvT7ZMbaK9z/k=; b=UEmROuyX/CC8iB
	r2SqUaU7TlhP7/8u1fQMchcsX+W+et9xQxO54mwK5BYDaVmE/C3274ak70asAx9YswCT5d/7Zk2A1
	0WEc7zlmZjhR6b61bsic3/I60doRWtr2GbWsQpzCMf0efRdIXAniZAFx3ik9+Lmt4IjnPpAClKKxB
	KPDDcJzgjnrfyhoEDuo7zDyKWj6K5rI0CZgs4fxRoROR5JWW5BuFyQQ6RQYHiPSvzROF2yJdQsFKE
	EZk8KzZxXEeAKclYPgQcgFacaKLf5Mi81h9BHPeO/Bk5FgzOzn1ZK84rKnt1jO61v4IcCWyoajZy2
	Ql2bb52TXdmDPSrWWx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dfJ-000000087Xy-0OYT;
	Wed, 16 Sep 2026 00:38:21 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dfF-000000087WT-2KG9;
	Wed, 16 Sep 2026 00:38:19 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Sep
 2026 08:38:02 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 16 Sep 2026 08:38:02 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH v4 0/3] Add AST2700 USB3.2 PHY driver
Date: Wed, 16 Sep 2026 08:38:00 +0800
Message-ID: <20260916-upstream_usb3phy-v4-0-812e76037d01@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOjkqWoC/23NTQqDMBCG4atI1k3JJGqarnqPUoqaSc3CHxINF
 fHujUJpQZfvB/PMTDw6i55ck5k4DNbbro2RnhJS1UX7Qmp1bMIZzxkAp2PvB4dF8xx9Kfp6ohI
 gNxdtUEpF4lnv0Nj3Rt4fsWvrh85N24cA6/rF0j0WgDLKMVOZYiVyLW+F7xH1gFV9rrqGrGLg/
 0p+oPCosJJVyggsc5MeKuKnSAYHilgVhsAFZFFRO2VZlg+SNrajQQEAAA==
X-Change-ID: 20260112-upstream_usb3phy-7116f8dfe779
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, Manivannan Sadhasivam <mani@kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
CC: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, "Manivannan
 Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789519082; l=2215;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=oarP0zPWM7rU28jobfWNT27FoqPEuVIEmWhjt7NQyxA=;
 b=EMxjupueFd3ly98mgyHjXZFSFYeEy5k3r9ojtvQp8xpLiU0BzwUoqM8AjVd4Nvf6dSJEliGbq
 c7jvntvp256C7r8BFUfOvv4eGFuPLhH+1YLRaYDsABQoho8QbymxBnj
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_173817_602970_ECA9F821 
X-CRM114-Status: UNSURE (   8.84  )
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

Add AST2700 USB3.2 PHY support.
 - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
   High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps).

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v4:
- Indent the register bitfield definitions so they are distinguishable
  from the register offsets, and use lowercase hex.
- Set PHY3S00_SRAM_EXT_LOAD rather than PHY3S00_SRAM_BYPASS. Bypassing
  the SRAM leaves the PHY on the default RTL design configuration,
  whereas the external load path applies the ROM patch so the PHY runs
  the ROM configuration.
- Describe the SRAM handshake in the driver's commit message.
- Link to v3: https://lore.kernel.org/r/20260701-upstream_usb3phy-v3-0-00e12315b6f9@aspeedtech.com

Changes in v3:
- Wire drivers/phy/aspeed/ into drivers/phy/Kconfig and
  drivers/phy/Makefile so the driver is actually built.
- Fix the Makefile config symbol to CONFIG_PHY_ASPEED_USB3 to match
  the Kconfig symbol.
- Expand the Kconfig help text.
- Link to v2: https://lore.kernel.org/r/20260116-upstream_usb3phy-v2-0-0b0c9f3eb6f4@aspeedtech.com

Changes in v2:
- aspeed,ast2700-usb3-phy.yaml
 - Drop clocks, resets descripton.
- Kconfig
 - add COMPILE_TEST, remove default n
- Link to v1: https://lore.kernel.org/r/20260114-upstream_usb3phy-v1-0-2e59590be2d7@aspeedtech.com

---
Ryan Chen (3):
      dt-bindings: phy: aspeed: Document AST2700 USB3.2 PHY
      phy: aspeed: Add AST2700 USB3.2 PHY driver
      MAINTAINERS: Add ASPEED USB3 PHY driver

 .../bindings/phy/aspeed,ast2700-usb3-phy.yaml      |  48 +++++
 MAINTAINERS                                        |   8 +
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/aspeed/Kconfig                         |  15 ++
 drivers/phy/aspeed/Makefile                        |   2 +
 drivers/phy/aspeed/phy-aspeed-usb3.c               | 236 +++++++++++++++++++++
 7 files changed, 311 insertions(+)
---
base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
change-id: 20260112-upstream_usb3phy-7116f8dfe779

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


