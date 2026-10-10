Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0451CA9EC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NcLxYcyjl3rv6yiREhvsRX9qtmBUYZdhEyT6A+qu69A=; b=tmiWrLvH3s8vGPlbH6ifkojmn+
	T2YHSXzePSEfqTGoVUBsTuzP8eQmI8MyTFaIaoMgWCS8LafuJuB8Dks01Oe2gvISZrznFJnOsO4ZP
	S3jdbHujFHcaWvfKigzQFEiptJHT2b6IF33druZpc5bWXs4huBH0W7B5czj4RqQM/ZGTSCfjFaZQc
	JValyzPcqXrNBxDb+YiJzmh4SVYQyMNNcVy7hvjz87J+LV+7QUMqDB1p9nGKheAnn+DAcXGJ5zeHs
	8wI+TNL/72l8FePIqA73YTFOtJWi4BCO31IupyfnpArmWKY20l/v+C56MOCQ/bBtvYdEKmMyka+0S
	GHhcyYLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbKc-00000008M41-1TGu;
	Sat, 10 Oct 2026 17:58:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbKZ-00000008M3H-1qxH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 17:58:01 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B16AC82A48;
	Sat, 10 Oct 2026 19:57:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kf6abI61CVjB; Sat, 10 Oct 2026 19:57:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791655066; bh=amUnCp8nO/3YDfeN8K6fzquoB8WYxfrrFRaRFx4B9xI=;
	h=From:To:Cc:Subject:Date;
	b=MrP3MGdPHBjQqW2QKx9m5v0deClKQfdcmK9LQJneCnlLX4dTiA85kW4zToX1+OBgD
	 Nv9UgAbpa9n2NCircHWkpemNXlfDVq6KT3W+y3m70soJDjfWUiROTlF765U41wPJbR
	 rEgp1So5JXacGgX/2T7XyxQ3cdwcFmnHgz2mGopEpUmU+CCgXcqRuBzLe0iP+yI0bM
	 UnNwVploy6zqmmYbu9O+1SBhkyBp4igeVfniPt9s5AB73itopgu+L+HTMO7/0QzLKN
	 39GJbZlzhF6wcz4xjYTCVRu08gt1UudumKzPBh44UkTMXX8LP8iYVFWcPGqOuZrtyO
	 kcl9jwQn7YCiw==
From: Rustam Adilov <adilov@disroot.org>
To: Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH v2] pinctrl: single: add big endian support
Date: Sat, 10 Oct 2026 22:57:21 +0500
Message-ID: <20261010175721.76213-1-adilov@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_105759_983876_914A33F1 
X-CRM114-Status: GOOD (  10.82  )
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

Add support for big endian pin controllers by taking into account
a big-endian device tree property.

This is needed on big endian MIPS platforms like RTL930X, RTL931X
and RTL9607C who use pinctrl-single, because when SWAP_IO_SPACE is
enabled, the mmio accessors in pinctrl-single perform a byte swap.

Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
Change in v2:
- Change to generic big endian io read/write functions.

 drivers/pinctrl/pinctrl-single.c | 41 ++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index e0eb7240a985..cdfe38f259b0 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -265,6 +265,26 @@ static void pcs_writel(unsigned int val, void __iomem *reg)
 	writel(val, reg);
 }
 
+static unsigned int pcs_readw_be(void __iomem *reg)
+{
+	return ioread16be(reg);
+}
+
+static unsigned int pcs_readl_be(void __iomem *reg)
+{
+	return ioread32be(reg);
+}
+
+static void pcs_writew_be(unsigned int val, void __iomem *reg)
+{
+	iowrite16be(val, reg);
+}
+
+static void pcs_writel_be(unsigned int val, void __iomem *reg)
+{
+	iowrite32be(val, reg);
+}
+
 static unsigned int pcs_pin_reg_offset_get(struct pcs_device *pcs,
 					   unsigned int pin)
 {
@@ -1785,6 +1805,7 @@ static int pcs_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct pcs_device *pcs;
 	const struct pcs_soc_data *soc;
+	bool byte_be;
 	int ret;
 
 	soc = of_device_get_match_data(&pdev->dev);
@@ -1860,18 +1881,30 @@ static int pcs_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcs);
 
+	byte_be = device_is_big_endian(pcs->dev);
+
 	switch (pcs->width) {
 	case 8:
 		pcs->read = pcs_readb;
 		pcs->write = pcs_writeb;
 		break;
 	case 16:
-		pcs->read = pcs_readw;
-		pcs->write = pcs_writew;
+		if (byte_be) {
+			pcs->read = pcs_readw_be;
+			pcs->write = pcs_writew_be;
+		} else {
+			pcs->read = pcs_readw;
+			pcs->write = pcs_writew;
+		}
 		break;
 	case 32:
-		pcs->read = pcs_readl;
-		pcs->write = pcs_writel;
+		if (byte_be) {
+			pcs->read = pcs_readl_be;
+			pcs->write = pcs_writel_be;
+		} else {
+			pcs->read = pcs_readl;
+			pcs->write = pcs_writel;
+		}
 		break;
 	default:
 		break;
-- 
2.56.0


