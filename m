Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFFBC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 19:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ce8ziv9NEZVw/ogWyF4YRzNRLf9hhIsAQWae2SYgPsI=; b=ahMyAsk6VeTFofL/3kQLlsx4Fs
	oe2laQX1PVgA3rePKKOavtuAn5UXRKmO+KscNM40di+wMeEK4UtK3RhFA8i27OWQ6MCRSZGP4tmz/
	re5QPfWAcGvEO5xj+tmTL+ksfsdRhYMvuJgAxjlf4reLhz518zRNNafl1/5gRTpWuiOjq+8sH5XgL
	OgKnyGuF1NB/49jEl5PdRYGkGYmvEj2NDLUbA+Fjiv8tQi09kLnL5zbqw+SBqNHsW1lJQFKNszkOU
	Eg6dkbjXPFEVQLYbyx8iibQNS9p2XptlU0AZfN4xFMCPgLA4h5Nwlt7SM/AEpzUOltw9gZ2FK+i+s
	tKLKrd3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgq5N-0000000DPOx-2zXF;
	Sat, 08 Feb 2025 19:01:49 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgq3z-0000000DPHi-1fLJ;
	Sat, 08 Feb 2025 19:00:25 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D2ADB25D01;
	Sat,  8 Feb 2025 20:00:16 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55FrgB_ujl9K; Sat,  8 Feb 2025 20:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739041215; bh=alWLYF/9OcbBa/I1+7yBqk1Z5iaf+prVR/oyQI0H9G4=;
	h=From:Date:Subject:To:Cc;
	b=DOC4jBhf/haJGplx2K8eiCjySQ5qbgEtpmkQ3ImmkbEXeHtImVv7v4Q3fGLF0mGE7
	 7L/OdfBlNBQCIssAqszLDs+H4f+GEskwUBTuThpvWz4DJLpyk7I13rv35duIoF0HIj
	 /ouUMNy8JwCqopdtjG2jKBi+M1Fz2V4bgJc+EjHZjbLHKZwwqgVa8OK2pNlc6PYcRI
	 bdf8ePyZCdfuXsUrTZK+3FShLaP30618vZcaABPPC4Wj/AXXguL7RKve5Pv6ZLbikK
	 xhalBciwDPH2s3/BZF79OXtG5DhHBeu/ojLzG2MQiAuJxWsx6zjhIDh4f/1dvtDzSL
	 biy7RX9N2lDew==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 09 Feb 2025 00:29:30 +0530
Subject: [PATCH] phy: exynos5-usbdrd: fix MPLL_MULTIPLIER and SSC_REFCLKSEL
 masks in refclk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-exynos5-usbdrd-masks-v1-1-4f7f83f323d7@disroot.org>
X-B4-Tracking: v=1; b=H4sIAJGpp2cC/x3MQQ5AMBBA0avIrE1SjVKuIhboYCJKOiFE3F1j+
 Rb/PyAUmATq5IFAJwtvPiJLExjmzk+E7KJBK22UVhbpuv0mBg/pXXC4drIIllRRUVkz5L2FmO6
 BRr7+bdO+7wekWIFpZgAAAA==
X-Change-ID: 20250208-exynos5-usbdrd-masks-7e9e6985c4b8
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739041209; l=2085;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=alWLYF/9OcbBa/I1+7yBqk1Z5iaf+prVR/oyQI0H9G4=;
 b=u7SS0kBpPe4GLUkdpGBcrXSlzjYQ5lTUc9poNrKPxjumtkDDCLanuInoWrIfZdaYIYKdJwsQ8
 spQArA691vLAEsK3NzHrFjhY0s2A0LvAotGppdNelchuuQ1ZOtDXhue
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_110023_847769_566112A1 
X-CRM114-Status: UNSURE (   7.99  )
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

Cc: stable@vger.kernel.org
Fixes: 59025887fb08 ("phy: Add new Exynos5 USB 3.0 PHY driver")
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Patch picked up from:
https://lore.kernel.org/all/20250204-exynos7870-usbphy-v1-1-f30a9857efeb@disroot.org/
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

---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250208-exynos5-usbdrd-masks-7e9e6985c4b8

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


