Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BCDC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vqncmF3Qcb8LUEHw/vQJn4QB020e8T4AqKFIsPGWH8=; b=HyT6IHyAE/tiGPwbd0MP8JeaFn
	Nkf3F7v7AtQu0WGfuqnXvwu8+phmJOkCavI6FOnzw400Ib+Gdm/n3f9jrKAywBEnKkUXKtk8/CMNK
	5lZftLtnpuSwMxidBjIeTnbp4+emkFyqR6b08uzXwKJragXAAjt+khjTkhNB6d6IFaqlKEAhHlq63
	ywlw/mC8LFZK+Ke/uTRZg4RtVe8h3xsyw0iFi1zseqNaEJnw5NBzkSZamC0X6BsZWaheAtLp9veeo
	2TF2gXrz7DT6esSAXK7kMPCGphXFfsQfIWEBMq/YatEsFz2+P+5n8ai4VAgRgED1OQN4+cViWGAPZ
	o8vKUn+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYL0-00000002XR4-49TN;
	Tue, 01 Apr 2025 09:55:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXka-00000002Rfy-3dRP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8864944DE7;
	Tue,  1 Apr 2025 09:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DE8C4CEF6;
	Tue,  1 Apr 2025 09:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743499059;
	bh=AAuy9Z9m36xv9DXKX/wWD75Rj6BA4DlBWKDzkQ/fHC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bNwxZOOOxUH/Z6G48s3eQKbkAfqdTQ0zbxx+DrqbfS3wg/VcVz18dkgEe9RCc6QTv
	 owjyDYqbuf/hwwW1bKh/PhWxrFPKOkS/xUnRXLalvf0slJqt910tSG9JFAN1g2m2h5
	 v0JacZ+2+mTB50VUOHANmJU/WPEZ5aze+8wVDbww0bbrpNo4MvGOqqh3SZItXpuv+i
	 wOWg7tDPA7rfH3eCZFamQ9AbEygbhYIwSPk3Q6N5RXPuAay8l3YrhY5KdnHwV20wMB
	 zmEatSHvHbWzirIWAxygiYavQbz275epMogwa7/Yi/flbgYlBWfls6OsoGJKXCGFPq
	 9mXRQkBv7RRoQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tzXkX-001GqU-Sa;
	Tue, 01 Apr 2025 10:17:37 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: [PATCH v3 13/13] PCI: apple: Add T602x PCIe support
Date: Tue,  1 Apr 2025 10:17:13 +0100
Message-Id: <20250401091713.2765724-14-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250401091713.2765724-1-maz@kernel.org>
References: <20250401091713.2765724-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org, mark.kettenis@xs4all.nl
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_021741_037253_F5821D44 
X-CRM114-Status: GOOD (  15.80  )
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

From: Hector Martin <marcan@marcan.st>

This version of the hardware moved around a bunch of registers, so we
avoid the old compatible for these and introduce register offset
structures to handle the differences.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pcie-apple.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 847cba753d28d..5b85d9497070c 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -124,6 +124,13 @@
 #define   PORT_TUNSTAT_PERST_ACK_PEND	BIT(1)
 #define PORT_PREFMEM_ENABLE		0x00994
 
+/* T602x (M2-pro and co) */
+#define PORT_T602X_MSIADDR	0x016c
+#define PORT_T602X_MSIADDR_HI	0x0170
+#define PORT_T602X_PERST	0x082c
+#define PORT_T602X_RID2SID	0x3000
+#define PORT_T602X_MSIMAP	0x3800
+
 #define PORT_MSIMAP_ENABLE	BIT(31)
 #define PORT_MSIMAP_TARGET	GENMASK(7, 0)
 
@@ -158,6 +165,18 @@ static const struct hw_info t8103_hw = {
 	.max_rid2sid		= 64,
 };
 
+static const struct hw_info t602x_hw = {
+	.phy_lane_ctl		= 0,
+	.port_msiaddr		= PORT_T602X_MSIADDR,
+	.port_msiaddr_hi	= PORT_T602X_MSIADDR_HI,
+	.port_refclk		= 0,
+	.port_perst		= PORT_T602X_PERST,
+	.port_rid2sid		= PORT_T602X_RID2SID,
+	.port_msimap		= PORT_T602X_MSIMAP,
+	/* 16 on t602x, guess for autodetect on future HW */
+	.max_rid2sid		= 512,
+};
+
 struct apple_pcie {
 	struct mutex		lock;
 	struct device		*dev;
@@ -425,6 +444,7 @@ static int apple_pcie_port_setup_irq(struct apple_pcie_port *port)
 	/* Disable all interrupts */
 	writel_relaxed(~0, port->base + PORT_INTMSK);
 	writel_relaxed(~0, port->base + PORT_INTSTAT);
+	writel_relaxed(~0, port->base + PORT_LINKCMDSTS);
 
 	irq_set_chained_handler_and_data(irq, apple_port_irq_handler, port);
 
@@ -865,6 +885,7 @@ static int apple_pcie_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id apple_pcie_of_match[] = {
+	{ .compatible = "apple,t6020-pcie",	.data = &t602x_hw },
 	{ .compatible = "apple,pcie",		.data = &t8103_hw },
 	{ }
 };
-- 
2.39.2


