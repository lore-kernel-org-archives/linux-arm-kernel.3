Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2B9CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0EZWjrAJ2CRU7AyqHp2SXperS3Fl2HqgdU2yfdqsymw=; b=235U5DYf5ibbux7ScM7+ajZHG4
	zL3/VE3SIN5GdD9/RQ0HM6xBwk0rIkFxEkY/92b/cU9ysLc7qu0ixPVtBhH0oxaBJTm6g3gU4s27U
	v5VFok4ldjXywU7g1nr6jThotUtAWbl8sgdHBjAbxSWI9bJewyAeozXHQdrlzCW97GQPIFuNCmnMF
	OmV3HyeRwTZKM5LI84wmvJOBuabwu/y6ibXoSEX9fCj7fe6QoSdIr8Cn5wjHo5DYKPsYfVonT6F0M
	RMCGWt7EhZoui2wk5ln17GKlHLeF4hS/ddSkCojnxkkaW7weaLxOrg/PpAn3QhgBwMm3IazfMyE2O
	bP2OtchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iJe-00000007deM-3aeI;
	Thu, 25 Sep 2025 09:31:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iJN-00000007dIU-0qpr;
	Thu, 25 Sep 2025 09:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=0EZWjrAJ2CRU7AyqHp2SXperS3Fl2HqgdU2yfdqsymw=; b=cbz8x5lybjSxmkU/605g3Qhewj
	OHcUgsnwbO2GfKZJSAs9Imw5ZFficCLTTKeewIGhhht+INv2j4DDXGWCQ1bJsRuKle1vZ7DTV3qYq
	peGbi8unU9YziTBgTdBB7bTfvCrqsYg2A5/CbIuvtYHI6WGeX3Km1LWJ4h/SJrG/nUCFGnatLIpET
	MxBl4cAy3njoe7E+3XD0BAuC5yey3dX1qKAHlH3vLGFN8t9Dugulqa8RkuUCZ7z0DjD6s17Zbb2oD
	1Cf3+58dsS5SKc60B/hD8tFOpDlateQSK1wY0Om13ppwiSv8P1B7JqGSQQTO+aq0mGAEvNLh5f+Nv
	no3zZwAA==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v1iJE-0001Nz-Fk; Thu, 25 Sep 2025 11:30:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 0/6] Some cleanups and addition of another Qnap TSx33 device
Date: Thu, 25 Sep 2025 11:29:17 +0200
Message-ID: <20250925092923.2184187-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_023049_259061_D097EA3E 
X-CRM114-Status: GOOD (  12.35  )
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

This fixes the 2nd network adapter on the TS433 and adds the TS233
a 2-bay device being otherwise similar to the TS433.


Heiko Stuebner (6):
  arm64: dts: rockchip: move cpu_thermal node to the correct position
  arm64: dts: rockchip: Fix the 1Ghz ethernet on Qnap TS433
  arm64: dts: rockchip: describe mcu eeprom cells on rk3568-ts433
  arm64: dts: rockchip: move common qnap tsx33 parts to dtsi
  dt-bindings: arm: rockchip: add TS233 to RK3568-based QNAP NAS devices
  arm64: dts: rockchip: add QNAP TS233 devicetree

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3568-qnap-ts233.dts   | 133 ++++
 .../boot/dts/rockchip/rk3568-qnap-ts433.dts   | 606 ++---------------
 .../boot/dts/rockchip/rk3568-qnap-tsx33.dtsi  | 608 ++++++++++++++++++
 5 files changed, 785 insertions(+), 569 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi

-- 
2.47.2


