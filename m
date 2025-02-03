Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5107C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnQ/Yw9u8lHA5/KIL39alLrkEPe/ZW45qmvWWCAF8t4=; b=GBueLPRZAPD3XxkCDblTPfQth2
	pfZyQB4IA9oAYH5cUjyAw5LoWOzFtdkCqu1qfKH0DU0XoctfCRkSG0R519mvPJdO36ffozlEtNFkS
	qz6RBiBR+iIHN3gyFhMO5oaFEm4IGGPnWj0ogyykGOzJqUHfEn0OfgwInVy2P6017m9RKceb4oTRM
	REGkUkQYs2MX69LSNEefOAbpOfHbLK2BRXoU+0C2/cqPY5Z8DT2QOS+CtS7K9+NJFRGmehDz5HLMt
	wXhak+Rb6Wb+0e4fyMcKOrNK1DdS1eQUgcLePCwfcBWBNwkt3XwesVntGlS73W6puzN26f0ux4bSU
	6gKHvKeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3hi-0000000GcO1-38td;
	Mon, 03 Feb 2025 21:10:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3FL-0000000GYr5-1L3I;
	Mon, 03 Feb 2025 20:40:44 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2991F25C5C;
	Mon,  3 Feb 2025 21:40:42 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qq7L7MlcKT6L; Mon,  3 Feb 2025 21:40:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615241; bh=pror0XWyyGe/mjoG6mkYXCLKXmddXdbejFXeV//EYQ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UJk4oZnQGFCOjinrOxl5zEpg30LKkWUeRJRDRBv05H0/aMXjHGo0j1X1ceh0ooVQ2
	 Jj/qonuF4R9hfpilOulkAkpjsT27yBYlSPCybc1ExWGiaY5Io4cm9OObRWEi+ojJrn
	 Ue3Q/9+PbvlWcolexR49ve3nMROQ0DYKWKHew18BwgI2uFgZbs0gKKTylXvGOgZXYs
	 8rBIPUuuHhaXE9FQarN+JYvquCcvgLzPpNrp4IW6FyiFpeXHbFKVkYCa6lhYpWbPEO
	 fcVBPpRysNhO3V//3Swvwr8CYedriPsfVRiGqz+el2beOU00/bTmdl0psoWTuSIOgg
	 J3ELPqGbAFD5w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:10:12 +0530
Subject: [PATCH 1/4] phy: exynos5-usbdrd: fix MPLL_MULTIPLIER and
 SSC_REFCLKSEL masks in refclk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-usbphy-v1-1-f30a9857efeb@disroot.org>
References: <20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org>
In-Reply-To: <20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Vivek Gautam <gautam.vivek@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615219; l=1704;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=pror0XWyyGe/mjoG6mkYXCLKXmddXdbejFXeV//EYQ8=;
 b=D6jFW4npMZfbRijNOv1ltq1eV8zqSQ3LrZ0t3CAVb0kFz0l72lXaMnqN+kDvOIy698yLVJLkb
 JBjXiN3AXZZDssTe761EKpqlAigR1r86/7UstWp3h5tVT6WALuhdtrl
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_124043_497342_FE526E74 
X-CRM114-Status: UNSURE (   8.74  )
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

In exynos5_usbdrd_{pipe3,utmi}_set_refclk(), the masks
PHYCLKRST_MPLL_MULTIPLIER_MASK and PHYCLKRST_SSC_REFCLKSEL_MASK are not
inverted when applied to the register values. Fix it.

Fixes: 59025887fb08 ("phy: Add new Exynos5 USB 3.0 PHY driver")
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index c421b495eb0fe4396d76f8c9d7c198ad7cd08869..4a108fdab118c0edd76bd88dc9dbf6a498e064b3 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -488,9 +488,9 @@ exynos5_usbdrd_pipe3_set_refclk(struct phy_usb_instance *inst)
 	reg |=	PHYCLKRST_REFCLKSEL_EXT_REFCLK;
 
 	/* FSEL settings corresponding to reference clock */
-	reg &= ~PHYCLKRST_FSEL_PIPE_MASK |
-		PHYCLKRST_MPLL_MULTIPLIER_MASK |
-		PHYCLKRST_SSC_REFCLKSEL_MASK;
+	reg &= ~(PHYCLKRST_FSEL_PIPE_MASK |
+		 PHYCLKRST_MPLL_MULTIPLIER_MASK |
+		 PHYCLKRST_SSC_REFCLKSEL_MASK);
 	switch (phy_drd->extrefclk) {
 	case EXYNOS5_FSEL_50MHZ:
 		reg |= (PHYCLKRST_MPLL_MULTIPLIER_50M_REF |
@@ -532,9 +532,9 @@ exynos5_usbdrd_utmi_set_refclk(struct phy_usb_instance *inst)
 	reg &= ~PHYCLKRST_REFCLKSEL_MASK;
 	reg |=	PHYCLKRST_REFCLKSEL_EXT_REFCLK;
 
-	reg &= ~PHYCLKRST_FSEL_UTMI_MASK |
-		PHYCLKRST_MPLL_MULTIPLIER_MASK |
-		PHYCLKRST_SSC_REFCLKSEL_MASK;
+	reg &= ~(PHYCLKRST_FSEL_UTMI_MASK |
+		 PHYCLKRST_MPLL_MULTIPLIER_MASK |
+		 PHYCLKRST_SSC_REFCLKSEL_MASK);
 	reg |= PHYCLKRST_FSEL(phy_drd->extrefclk);
 
 	return reg;

-- 
2.48.1


