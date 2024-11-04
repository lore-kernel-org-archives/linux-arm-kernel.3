Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6547CD111B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 07:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RBpswuLRxOZxNXlnIrevuU+zJUadRtGK4fTa3G3D7Cs=; b=LhLDbszyneyefVP0MwQh8LT0LB
	nCZOXJ9E9QMqo1U8SIPc8YsBMMIf0eBhud3W7NMx3CpXbCa1GerIkiOv1JuUPYETiB+D9MYNg7Em3
	H5i2mgKXuyeAthtSJ9Bt9FFrTHD5Y4Pc6ia5g15vyPj8fKVrlWnhRj12uA1v+H9z7Hn8n79eKFSnk
	B4ZxBgRPiC6SVSzSsM9ZfVaPkoXHlNx3trPOUuapcz3yOD4OkZvrZ45rULZSVgtz/QKFpk9CGclIG
	jYgqCWkrYsOaNooJUtqpjFD8uXC2MVFHVUT3M3ls3qe3gqbTKqBv7L0ufd1t5pPyxL7VLhBeKV6qU
	OKeY3uGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rnI-0000000Ct86-0dE2;
	Mon, 04 Nov 2024 07:46:36 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rlZ-0000000CspR-20xb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 07:44:51 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A47iPJM075574;
	Mon, 4 Nov 2024 01:44:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730706265;
	bh=RBpswuLRxOZxNXlnIrevuU+zJUadRtGK4fTa3G3D7Cs=;
	h=From:To:CC:Subject:Date;
	b=lmHbUCcjSgY9hRjxgEpM8GRznC74D1elqB7AoasARInL54BaRHmUY4sGSOZSQwPe/
	 1bNijh5yvg+YXTmJVH0Zuokrs3Q09Oxp2tzYVhWpPt+ZsJYM8cGesb/0cQ+vUXhYXS
	 mfLCxPDjDHfA9o9PQVTZ8wJb39n/RcBWDGQmbvF8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A47iPqx117294
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Nov 2024 01:44:25 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Nov 2024 01:44:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Nov 2024 01:44:25 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A47iKNV076611;
	Mon, 4 Nov 2024 01:44:21 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
        <robh@kernel.org>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <kishon@kernel.org>,
        <thomas.richard@bootlin.com>
CC: <linux-omap@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2] PCI: j721e: Deassert PERST# after a delay of PCIE_T_PVPERL_MS ms
Date: Mon, 4 Nov 2024 13:14:20 +0530
Message-ID: <20241104074420.1862932-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_234449_672128_4EBAE6F3 
X-CRM114-Status: GOOD (  15.93  )
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

According to Section 2.2 of the PCI Express Card Electromechanical
Specification (Revision 5.1), in order to ensure that the power and the
reference clock are stable, PERST# has to be deasserted after a delay of
100 milliseconds (TPVPERL). Currently, it is being assumed that the power
is already stable, which is not necessarily true. Hence, change the delay
to PCIE_T_PVPERL_MS to guarantee that power and reference clock are stable.

Fixes: f3e25911a430 ("PCI: j721e: Add TI J721E PCIe driver")
Fixes: f96b69713733 ("PCI: j721e: Use T_PERST_CLK_US macro")
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on commit
59b723cd2adb Linux 6.12-rc6
of Mainline Linux.

v1:
https://lore.kernel.org/r/20241022083147.2773123-1-s-vadapalli@ti.com/
Changes since v1:
- Rebased patch on Linux 6.12-rc6
- Based on Krzysztof's feedback at:
  https://lore.kernel.org/r/20241102141914.GA3440781@rocinante/
  PCIE_T_PERST_CLK_US has been replaced with PCIE_T_PVPERL_MS in
  j721e_pcie_probe() as well.
- Added Fixes tag corresponding to the above change in the commit
  message.

Regards,
Siddharth.

 drivers/pci/controller/cadence/pci-j721e.c | 26 ++++++++++------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 284f2e0e4d26..e091c3e55b5c 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -572,15 +572,14 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 		pcie->refclk = clk;
 
 		/*
-		 * The "Power Sequencing and Reset Signal Timings" table of the
-		 * PCI Express Card Electromechanical Specification, Revision
-		 * 5.1, Section 2.9.2, Symbol "T_PERST-CLK", indicates PERST#
-		 * should be deasserted after minimum of 100us once REFCLK is
-		 * stable. The REFCLK to the connector in RC mode is selected
-		 * while enabling the PHY. So deassert PERST# after 100 us.
+		 * Section 2.2 of the PCI Express Card Electromechanical
+		 * Specification (Revision 5.1) mandates that the deassertion
+		 * of the PERST# signal should be delayed by 100 ms (TPVPERL).
+		 * This shall ensure that the power and the reference clock
+		 * are stable.
 		 */
 		if (gpiod) {
-			fsleep(PCIE_T_PERST_CLK_US);
+			msleep(PCIE_T_PVPERL_MS);
 			gpiod_set_value_cansleep(gpiod, 1);
 		}
 
@@ -671,15 +670,14 @@ static int j721e_pcie_resume_noirq(struct device *dev)
 			return ret;
 
 		/*
-		 * The "Power Sequencing and Reset Signal Timings" table of the
-		 * PCI Express Card Electromechanical Specification, Revision
-		 * 5.1, Section 2.9.2, Symbol "T_PERST-CLK", indicates PERST#
-		 * should be deasserted after minimum of 100us once REFCLK is
-		 * stable. The REFCLK to the connector in RC mode is selected
-		 * while enabling the PHY. So deassert PERST# after 100 us.
+		 * Section 2.2 of the PCI Express Card Electromechanical
+		 * Specification (Revision 5.1) mandates that the deassertion
+		 * of the PERST# signal should be delayed by 100 ms (TPVPERL).
+		 * This shall ensure that the power and the reference clock
+		 * are stable.
 		 */
 		if (pcie->reset_gpio) {
-			fsleep(PCIE_T_PERST_CLK_US);
+			msleep(PCIE_T_PVPERL_MS);
 			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
 		}
 
-- 
2.40.1


