Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845F9C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvElYGxbUgfGLHwTggNkO6oW/94xCB8HSeEjWFVcDz0=; b=UMld3UYF3bxkZpEcdp2KpoHNPm
	kEqBXUq46niStiha5mc/uBoRIJZsWGdmN2fFtrTqCYvJCLjfHtBX1BrhT0uftGPitACsqic/Mlztj
	0NVd02GxnV1+4yJ0c61WOr5lQ3s8G1n2zYK5GFFd82sWJl1rWNCPlUwi2I7wyG8nl3IKv2p0M/xcp
	kd03thgIOub0tw50+z0wCJmmKsz6h7w3NLsyk50r/Yl8rTQcm99Sek3o08NOf85QxsdDNKZWtXyxg
	FMNm/R4GEXqoBW6qUOWD4rY+olHPBcNnZLiTv1oGojWz5rJEVSHoZL12qW2dTuXudn/iMdA7+JI4f
	I6AVUGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDS0x-00000004Vfi-2lQI;
	Fri, 09 May 2025 18:00:03 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQ49-00000004B5F-24ln;
	Fri, 09 May 2025 15:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lv
	ElYGxbUgfGLHwTggNkO6oW/94xCB8HSeEjWFVcDz0=; b=PR9ov2QujZ5597Hu+c
	hexQ+mdYPSQHxc5O4IrchlCD+aLmL0nq23Ry1Cwy6nLwckpATO99bON7Aerqdd2n
	j8gB73BT8Kus+WxrKMUhRnRaCkEMlI1bJzesQjPEtI2Lrl44S4ToqelxjxFhVqAf
	jBYl8SYCgvqTHb+MOxZUdvi5o=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCH+a9CJR5oqYT+AA--.23731S5;
	Fri, 09 May 2025 23:54:45 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de,
	manivannan.sadhasivam@linaro.org
Cc: robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 3/4] PCI: rockchip-host: Refactor IRQ handling with info arrays
Date: Fri,  9 May 2025 23:54:01 +0800
Message-Id: <20250509155402.377923-4-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509155402.377923-1-18255117159@163.com>
References: <20250509155402.377923-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCH+a9CJR5oqYT+AA--.23731S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jw1rWF1xuF15Gw4Dtr4ktFb_yoW7tF1rp3
	yUtFnrAr48Xw1fZr9Iyw15X3WrXFnI9aykCrs3G3y7Z3Wvyw1jga1jgFZxWw1IgFWDX342
	kw43tF97ZFsruFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR9NVJUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWxRIo2geJBoy5wAAs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_085513_954820_828134DE 
X-CRM114-Status: GOOD (  13.43  )
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

Replace repetitive if-conditions for IRQ status checks with structured
arrays (`pcie_subsys_irq_info` and `pcie_client_irq_info`) and loop-based
logging. This simplifies maintenance and reduces code duplication.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 110 +++++++++-----------
 1 file changed, 48 insertions(+), 62 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 209eb94ece1b..ba1f7832bda5 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -36,6 +36,45 @@
 #include "../pci.h"
 #include "pcie-rockchip.h"
 
+struct rockchip_irq_info {
+	u32 bit;
+	const char *msg;
+};
+
+static const struct rockchip_irq_info pcie_subsys_irq_info[] = {
+	{ PCIE_CORE_INT_PRFPE,
+	  "parity error detected while reading from the PNP receive FIFO RAM" },
+	{ PCIE_CORE_INT_CRFPE,
+	  "parity error detected while reading from the Completion Receive FIFO RAM" },
+	{ PCIE_CORE_INT_RRPE,
+	  "parity error detected while reading from replay buffer RAM" },
+	{ PCIE_CORE_INT_PRFO, "overflow occurred in the PNP receive FIFO" },
+	{ PCIE_CORE_INT_CRFO,
+	  "overflow occurred in the completion receive FIFO" },
+	{ PCIE_CORE_INT_RT, "replay timer timed out" },
+	{ PCIE_CORE_INT_RTR,
+	  "replay timer rolled over after 4 transmissions of the same TLP" },
+	{ PCIE_CORE_INT_PE, "phy error detected on receive side" },
+	{ PCIE_CORE_INT_MTR, "malformed TLP received from the link" },
+	{ PCIE_CORE_INT_UCR, "Unexpected Completion received from the link" },
+	{ PCIE_CORE_INT_FCE,
+	  "an error was observed in the flow control advertisements from the other side" },
+	{ PCIE_CORE_INT_CT, "a request timed out waiting for completion" },
+	{ PCIE_CORE_INT_UTC, "unmapped TC error" },
+	{ PCIE_CORE_INT_MMVC, "MSI mask register changes" },
+};
+
+static const struct rockchip_irq_info pcie_client_irq_info[] = {
+	{ PCIE_CLIENT_INT_LEGACY_DONE, "legacy done" },
+	{ PCIE_CLIENT_INT_MSG, "message done" },
+	{ PCIE_CLIENT_INT_HOT_RST, "hot reset" },
+	{ PCIE_CLIENT_INT_DPA, "dpa" },
+	{ PCIE_CLIENT_INT_FATAL_ERR, "fatal error" },
+	{ PCIE_CLIENT_INT_NFATAL_ERR, "Non fatal error" },
+	{ PCIE_CLIENT_INT_CORR_ERR, "correctable error" },
+	{ PCIE_CLIENT_INT_PHY, "phy" },
+};
+
 static void rockchip_pcie_enable_bw_int(struct rockchip_pcie *rockchip)
 {
 	u32 status;
@@ -411,47 +450,11 @@ static irqreturn_t rockchip_pcie_subsys_irq_handler(int irq, void *arg)
 	if (reg & PCIE_CLIENT_INT_LOCAL) {
 		dev_dbg(dev, "local interrupt received\n");
 		sub_reg = rockchip_pcie_read(rockchip, PCIE_CORE_INT_STATUS);
-		if (sub_reg & PCIE_CORE_INT_PRFPE)
-			dev_dbg(dev, "parity error detected while reading from the PNP receive FIFO RAM\n");
-
-		if (sub_reg & PCIE_CORE_INT_CRFPE)
-			dev_dbg(dev, "parity error detected while reading from the Completion Receive FIFO RAM\n");
-
-		if (sub_reg & PCIE_CORE_INT_RRPE)
-			dev_dbg(dev, "parity error detected while reading from replay buffer RAM\n");
-
-		if (sub_reg & PCIE_CORE_INT_PRFO)
-			dev_dbg(dev, "overflow occurred in the PNP receive FIFO\n");
-
-		if (sub_reg & PCIE_CORE_INT_CRFO)
-			dev_dbg(dev, "overflow occurred in the completion receive FIFO\n");
-
-		if (sub_reg & PCIE_CORE_INT_RT)
-			dev_dbg(dev, "replay timer timed out\n");
-
-		if (sub_reg & PCIE_CORE_INT_RTR)
-			dev_dbg(dev, "replay timer rolled over after 4 transmissions of the same TLP\n");
-
-		if (sub_reg & PCIE_CORE_INT_PE)
-			dev_dbg(dev, "phy error detected on receive side\n");
 
-		if (sub_reg & PCIE_CORE_INT_MTR)
-			dev_dbg(dev, "malformed TLP received from the link\n");
-
-		if (sub_reg & PCIE_CORE_INT_UCR)
-			dev_dbg(dev, "Unexpected Completion received from the link\n");
-
-		if (sub_reg & PCIE_CORE_INT_FCE)
-			dev_dbg(dev, "an error was observed in the flow control advertisements from the other side\n");
-
-		if (sub_reg & PCIE_CORE_INT_CT)
-			dev_dbg(dev, "a request timed out waiting for completion\n");
-
-		if (sub_reg & PCIE_CORE_INT_UTC)
-			dev_dbg(dev, "unmapped TC error\n");
-
-		if (sub_reg & PCIE_CORE_INT_MMVC)
-			dev_dbg(dev, "MSI mask register changes\n");
+		for (int i = 0; i < ARRAY_SIZE(pcie_subsys_irq_info); i++) {
+			if (sub_reg & pcie_subsys_irq_info[i].bit)
+				dev_dbg(dev, "%s\n", pcie_subsys_irq_info[i].msg);
+		}
 
 		rockchip_pcie_write(rockchip, sub_reg, PCIE_CORE_INT_STATUS);
 	} else if (reg & PCIE_CLIENT_INT_PHY) {
@@ -473,29 +476,12 @@ static irqreturn_t rockchip_pcie_client_irq_handler(int irq, void *arg)
 	u32 reg;
 
 	reg = rockchip_pcie_read(rockchip, PCIE_CLIENT_INT_STATUS);
-	if (reg & PCIE_CLIENT_INT_LEGACY_DONE)
-		dev_dbg(dev, "legacy done interrupt received\n");
-
-	if (reg & PCIE_CLIENT_INT_MSG)
-		dev_dbg(dev, "message done interrupt received\n");
 
-	if (reg & PCIE_CLIENT_INT_HOT_RST)
-		dev_dbg(dev, "hot reset interrupt received\n");
-
-	if (reg & PCIE_CLIENT_INT_DPA)
-		dev_dbg(dev, "dpa interrupt received\n");
-
-	if (reg & PCIE_CLIENT_INT_FATAL_ERR)
-		dev_dbg(dev, "fatal error interrupt received\n");
-
-	if (reg & PCIE_CLIENT_INT_NFATAL_ERR)
-		dev_dbg(dev, "non fatal error interrupt received\n");
-
-	if (reg & PCIE_CLIENT_INT_CORR_ERR)
-		dev_dbg(dev, "correctable error interrupt received\n");
-
-	if (reg & PCIE_CLIENT_INT_PHY)
-		dev_dbg(dev, "phy interrupt received\n");
+	for (int i = 0; i < ARRAY_SIZE(pcie_client_irq_info); i++) {
+		if (reg & pcie_client_irq_info[i].bit)
+			dev_dbg(dev, "%s interrupt received\n",
+				pcie_client_irq_info[i].msg);
+	}
 
 	rockchip_pcie_write(rockchip, reg & (PCIE_CLIENT_INT_LEGACY_DONE |
 			      PCIE_CLIENT_INT_MSG | PCIE_CLIENT_INT_HOT_RST |
-- 
2.25.1


