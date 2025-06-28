Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B626C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 17:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Wg8VsMa7/an42JO9RmaBrIwVEQL9rKjT/Jol2B6lYA=; b=NHBibSnH0yIP9hAd+Neaxvoin0
	/y6BeGJqGpDJATSCa2Qt7BmQMfIVcfam6YARFcm/UB7bnxkRPZGcMVVnbjd4S8o82u5YLxyqKIzK9
	YVAhpcT5gLYXpXVIrZ1RYrDe4vWH2+qrqc9xi+3oIoxle67dGpPi/0D0tE25uZ+S8hAa1IWhkP4jJ
	GrKn+gRpKRbBpgahk4fhwBnOWqX4ljhxcvc0WE54/cyTZoxfm6lYyKGcd4SIWNfnydCIWqlGEKVCc
	lcJcBWQJlJxFnmoT08SyaEKyCLqSNgk7IDpcrjtnhz+n8wsrJ6gmHKmvyiTFtG96gqRK6/m7hdUoH
	oUR+bTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZSS-0000000H8QR-2VbJ;
	Sat, 28 Jun 2025 17:35:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZNl-0000000H7Th-1POY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 17:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2CB461464;
	Sat, 28 Jun 2025 17:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA90C4CEEA;
	Sat, 28 Jun 2025 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751131828;
	bh=zWAmwKnV6f1cwbtaUPgrJ1lIE+Rc2XJQ33KR+f1+GBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l/5rNor2Px+Cl03/jN1HOWynCV9eo9DeSLJ6bO8UiztHyxYNqMuyqqhnzMpSnt9TH
	 3kRNDIs83QmyR1QPNeG7WCWI59VZYaYbtT3Z4uHHSfsVP357KbSIMqAzl2Q/nRTYEx
	 oL63w2UYzn9/d/mr3Ns+0EL9e7sCXCVWM6oQj0pJKOGAuPh/9Gu2jB2bVawB7D5qxe
	 2pwPMr0neIm6Fv06BYVWNU26Frt54kD1MzdyyUugfZvBPxEkIGqf5NkJL9DUg0P1rS
	 ZZIFOxvccdpe4/0TJL6k94CwGN+DGQFO6jwdMb1sn6kDdRXlaVjJusfA+20YePCd3L
	 BJM2bK8IJ+3/w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uVZNi-00AqZC-Fv;
	Sat, 28 Jun 2025 18:30:26 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 04/12] PCI: xgene: Drop XGENE_PCIE_IP_VER_UNKN
Date: Sat, 28 Jun 2025 18:29:57 +0100
Message-Id: <20250628173005.445013-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250628173005.445013-1-maz@kernel.org>
References: <20250628173005.445013-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

XGENE_PCIE_IP_VER_UNKN is only refered to when probing for the
original XGene PCIe implementation, and get immediately overridden
if the device has the "apm,xgene-pcie" compatible string.

Given that the only way to get there is by finding this very string in
the DT, it is obvious that we will always ovwrite the version with
XGENE_PCIE_IP_VER_1.

Drop the whole thing.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-xgene.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index a848f98203ae4..b95afa35201d0 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -54,7 +54,6 @@
 #define XGENE_V1_PCI_EXP_CAP		0x40
 
 /* PCIe IP version */
-#define XGENE_PCIE_IP_VER_UNKN		0
 #define XGENE_PCIE_IP_VER_1		1
 #define XGENE_PCIE_IP_VER_2		2
 
@@ -630,10 +629,7 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 
 	port->node = of_node_get(dn);
 	port->dev = dev;
-
-	port->version = XGENE_PCIE_IP_VER_UNKN;
-	if (of_device_is_compatible(port->node, "apm,xgene-pcie"))
-		port->version = XGENE_PCIE_IP_VER_1;
+	port->version = XGENE_PCIE_IP_VER_1;
 
 	ret = xgene_pcie_map_reg(port, pdev);
 	if (ret)
-- 
2.39.2


