Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A97E7FDE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 00:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSzBHZdVygKXukk+iQ1E1BqwM0RrqN94x3Zvnkp6Hc8=; b=d2uFojTB53lGgaMSMTl1ttrnMN
	yFQWsQmDNsWbchf9npKOIUbMM4dleso5yTUTcnjw52T3Lalp//OINtOU53tWTBLPe9cKc7oenY7AA
	RcrUKsthGHQB9KKPJzHU3S2fKLrn/KBVFrmZcPbDbwejzLrngr/kI9X+ZRqX0zVyVDJMByb2ZfXq5
	oMIVPFOoevBX8WyoDVYM3pAPJhZ5qNlkkHkBqcwKJYrTGPJKxVglbP/lU+glaPNo02xi4gNsGiSa0
	lmOQkrA5YmZ8Os/wOFrbwlTyML53aIu3KhzeSK65bLLHahfwTFqbRiTA+lj2mK8AMvvqyjAJVsv3X
	2dqOVT3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4B2-00000005mkE-2hvl;
	Tue, 03 Feb 2026 00:21:56 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4B0-00000005mgd-1UVE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 00:21:55 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770078112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSzBHZdVygKXukk+iQ1E1BqwM0RrqN94x3Zvnkp6Hc8=;
	b=G4Sb+I8kM9gfwkpIfWB6Q9chGzCZDLL4XA7UXqu6mEzNp2obCYBdVFniqPfgV61J8gxLFl
	SwS8Tjh3iOEbVZuhJKic+JCuTd04pT7Et+ubEPZnnzeKiO0V2ywYm3UtmmG/dXUKPZKVSg
	Cn6NV7aXAr8CqQiyitJ5f1DUAqxAO/g=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-phy@lists.infradead.org
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-kernel@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 3/8] phy: zynqmp: Refactor common phy initialization into a helper
Date: Mon,  2 Feb 2026 19:21:23 -0500
Message-Id: <20260203002128.935842-4-sean.anderson@linux.dev>
In-Reply-To: <20260203002128.935842-1-sean.anderson@linux.dev>
References: <20260203002128.935842-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_162154_546506_A00D3217 
X-CRM114-Status: UNSURE (   9.89  )
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

All lanes undergoing ILL calibration must be initialized. Split off
common phy initialization into a helper so that we can ensure all lanes
are initialized before performing calibration.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/phy/xilinx/phy-zynqmp.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
index 0d3c578d0f3f..152af1702bbd 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -520,6 +520,21 @@ static void xpsgtr_bypass_scrambler_8b10b(struct xpsgtr_phy *gtr_phy)
 	xpsgtr_write_phy(gtr_phy, L0_TX_DIG_61, L0_TM_DISABLE_SCRAMBLE_ENCODER);
 }
 
+static int xpsgtr_common_init(struct xpsgtr_phy *gtr_phy)
+{
+	int ret;
+
+	/* Enable coarse code saturation limiting logic. */
+	xpsgtr_write_phy(gtr_phy, L0_TM_PLL_DIG_37, L0_TM_COARSE_CODE_LIMIT);
+
+	ret = xpsgtr_configure_pll(gtr_phy);
+	if (ret)
+		return ret;
+
+	xpsgtr_lane_set_protocol(gtr_phy);
+	return 0;
+}
+
 /* DP-specific initialization. */
 static void xpsgtr_phy_init_dp(struct xpsgtr_phy *gtr_phy)
 {
@@ -682,19 +697,14 @@ static int xpsgtr_phy_init(struct phy *phy)
 		gtr_dev->tx_term_fix = false;
 	}
 
-	/* Enable coarse code saturation limiting logic. */
-	xpsgtr_write_phy(gtr_phy, L0_TM_PLL_DIG_37, L0_TM_COARSE_CODE_LIMIT);
-
 	/*
 	 * Configure the PLL, the lane protocol, and perform protocol-specific
 	 * initialization.
 	 */
-	ret = xpsgtr_configure_pll(gtr_phy);
+	ret = xpsgtr_common_init(gtr_phy);
 	if (ret)
 		goto out;
 
-	xpsgtr_lane_set_protocol(gtr_phy);
-
 	switch (gtr_phy->protocol) {
 	case ICM_PROTOCOL_DP:
 		xpsgtr_phy_init_dp(gtr_phy);
-- 
2.35.1.1320.gc452695387.dirty


