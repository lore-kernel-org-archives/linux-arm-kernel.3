Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF64CA9EC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 16:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kg0flKuZxklfp3f0LVYuPD+szLye44JcPjqHpdiL+LI=; b=v6nQ30SH7RLX2TB4MDyC2A5i0c
	oCE4fscRhGIch+BYFPtFxCRkapjOFOPNuNGQDv6ollWBjQvwl1Z7jIIdFBtmzqWr8cMZe63YsndgX
	XqyW+o2cZ+2WiH9VfWs5JPJ33i5ui4a9u3RXoJzk1iwotuIZ1HxqKfsNsZPSaaX4CJ8m5dZFUUqGM
	XhcDoOi11xr13g9+N/c3bmZ+boV01ioSgrO71JbEPjEanioL8bnA5ZsChZieesLjcsIrnzRlM9EsT
	/PiVggcoBL+ujEw/vqmf8jREiic/d3PjWqOw5EM8S/TA5plSR64JwHCsSlKAzoh3jQaLKWFnV+UxX
	lpp3HUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZmx-00000008Foj-21Vd;
	Sat, 10 Oct 2026 16:19:11 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZmu-00000008FoI-2AJI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 16:19:10 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 77C8A807C7;
	Sat, 10 Oct 2026 18:19:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47OIXOBtmTSa; Sat, 10 Oct 2026 18:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791649140; bh=fGo0ENJUfeMBImXgrDZx5qB9HxEPo7FMx1opDzrkJo4=;
	h=From:To:Cc:Subject:Date;
	b=ksl6Ix34rrtexVNLWo/x4C1BwXveXOnYtRd/rcTti0GrXYjcPQIJdtjZts8pyw6Mf
	 j6hXgopOc9nnBeRRU5oM5EuAZaMK+sSIN024pxl3alr7gLN/FhMvSNCNkkP+wOFKDt
	 53j07cv2zRiFRtxb8hZn+q/gAFBO6BLdRVTT+SApNQz9pcptk7jIdDsw1AY36cPkBo
	 rYTsgYT/u8lKTFa3zWr3NoOnrfoFxOR6c8Vmo0HTMZSnyQvPfLv979R3Xpwjt+G1Mb
	 SD9xdftlHszViZxnrkzHT6yMWH0U4kc+456X/Vf6akN+JBbze0CcRN6laB8K9Zqnsr
	 VV0x/2u+U0Kdw==
From: Rustam Adilov <adilov@disroot.org>
To: Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH] pinctrl: single: add big endian support
Date: Sat, 10 Oct 2026 21:15:44 +0500
Message-ID: <20261010161545.62959-1-adilov@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_091909_096977_4494C941 
X-CRM114-Status: GOOD (  10.65  )
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
 drivers/pinctrl/pinctrl-single.c | 41 ++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index e0eb7240a985..001a0c157d6a 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -265,6 +265,26 @@ static void pcs_writel(unsigned int val, void __iomem *reg)
 	writel(val, reg);
 }
 
+static unsigned int pcs_readw_be(void __iomem *reg)
+{
+	return readw_be(reg);
+}
+
+static unsigned int pcs_readl_be(void __iomem *reg)
+{
+	return readl_be(reg);
+}
+
+static void pcs_writew_be(unsigned int val, void __iomem *reg)
+{
+	writew_be(val, reg);
+}
+
+static void pcs_writel_be(unsigned int val, void __iomem *reg)
+{
+	writel_be(val, reg);
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


