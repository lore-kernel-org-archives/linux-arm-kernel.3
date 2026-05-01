Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F8ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 20:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sUDh98dBW0OZwQ8bxnrNCDWFEz+kEpu4VmfyulKQTRo=; b=U1QipxN1g/hjj8WtX1PevZdu0V
	cKT2PqJd78AKbDajNbyj6S0eRL1IUc0VfDkhindodcECJbjKbpw7lPaJ3jub8Y+f5L7EGnEWwq6IB
	10cdmlbPitwHvKVvQ3sPDD8+rRL8uIQWxdcI02rSQK0sncOCzFZAJNGCIpHJ2ohMoqXhAONiEcgPa
	rMneMHcrouTB5bHh35nbjQ4zed3ReXhXuEElGt8Xxh7Cy7RC+r0Yc6GyHV2lR/rXRYeZ3LZ7mZVS+
	xKsjPoOe3An8u0BiqwDlYTPBVtPlx3m8AvHGNjvxtwsF/9X4j/vFl+/y1+Ju2VGiDIvTFh7EZnGK0
	cFqVKUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIuPq-00000007edf-1FqV;
	Fri, 01 May 2026 20:24:50 +0000
Received: from lpdvsmtp12.broadcom.com ([192.19.144.207] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIuPo-00000007edC-0LL7;
	Fri, 01 May 2026 20:24:49 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id AF029C011567;
	Fri,  1 May 2026 13:24:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com AF029C011567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1777667083;
	bh=U0cMOOEs8vuicbsDgb1uUaBP6prmFBje5WPlrU6/glI=;
	h=From:To:Cc:Subject:Date:From;
	b=iqtzmaeDc6muw48aUvqjppWJmf8yEKCnfGDrp3PgQl1jK8ZTw3TyJ498AuW7VaAXp
	 AjtCMjLToOWrVWnL+USpPhkqn5j1Tkk/5FytTPkSFDDJAAJCizIzT6eH8TQvnc8+rv
	 CkSxsMUOiefixYejTV2V9ksnsaTx+Gpmj3Rjk59g=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 49E2EB85;
	Fri,  1 May 2026 13:24:43 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-pci@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Hans Zhang <18255117159@163.com>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] PCI: brcmstb: Assign pcie->gen from pcie_get_link_speed()
Date: Fri,  1 May 2026 13:24:38 -0700
Message-ID: <20260501202438.376033-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_132448_214110_91219606 
X-CRM114-Status: GOOD (  11.24  )
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

After commit 03f920936977 ("PCI: controller: Validate max-link-speed"),
pcie->gen stopped being assigned and as a result the established PCIe
link would stop supporting Gen3 speeds on 2712 since pcie->gen is used
to populate LnkCntl2 and LnkCap in brcm_pcie_set_gen().

Link: https://github.com/raspberrypi/linux/issues/7343
Reported-by: Dom Cobley <popcornmix@gmail.com>
Reported-by: Phil Elwell <phil@raspberrypi.com>
Fixes: 03f920936977 ("PCI: controller: Validate max-link-speed")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 714bcab97b60..6138fc4bc064 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -2072,8 +2072,7 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		return PTR_ERR(pcie->clk);
 
 	ret = of_pci_get_max_link_speed(np);
-	if (pcie_get_link_speed(ret) == PCI_SPEED_UNKNOWN)
-		pcie->gen = 0;
+	pcie->gen = pcie_get_link_speed(ret);
 
 	pcie->ssc = of_property_read_bool(np, "brcm,enable-ssc");
 
-- 
2.43.0


