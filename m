Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881E0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 23:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXovFnfcSE04VNOttjSXdWJX5A1XCYk7NqbvcjN3zH4=; b=nbwEsK7TP4dKmiCSSJGaj+VEpg
	js3fRoMYlsx+GnXU7smt78/ZO53poQdKqsxWEa17aWW4GoPcyn/ya+7ylW2KH+01DHjDNAyCvpTyS
	DE3Uj/zbnmfV8s8iYG8saNLsu864+Dfkp/JFMjw5xAw7ZM2/sPuwj+sLN555Qg/1bT7tHQpFPKGP1
	w57aiKGH8NFBCn96SnjcrLZDS55Z+h6uXuCpez7MLM74Oi8+fGMwFNqtjafpBbsxy3f5U2AlelXGe
	zNzJ/B4DGH6p8aTabBbllm4agqPn6YGZ20s2CSi77+82ShJVwmP9OuS1KPNSsvmzW+UQxAyji8rTx
	e2pOi/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUD81-000000076wC-0QAu;
	Tue, 24 Jun 2025 23:32:37 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUD1v-000000075r8-1SZg;
	Tue, 24 Jun 2025 23:26:20 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B2397C000906;
	Tue, 24 Jun 2025 16:26:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B2397C000906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1750807577;
	bh=AFaRBAZ+oKpjRIG0fymIIkcHut2SQDdgBKnw0N3xxWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g3okBWmNI307l/bBrVrjznONQaBk/uAeKeOorcWIMaSX7IM9vzZ4ySesOq7LEaPeD
	 dLk88pUV74NjS43t2N1pV03sZ04JTwPNYZJe2kEO41ECiQrWkuytNA7SgGXmjaR8Da
	 5f9pZHVySBVkSIjD8NHELBFhChhSu1COal30g+0Y=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 72A0718000853;
	Tue, 24 Jun 2025 16:26:17 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-pci@vger.kernel.org (open list:BROADCOM STB PCIE DRIVER)
Subject: [PATCH 2/2] PCI: brcmstb: Replace open coded value with PCIE_T_RRS_READY_MS
Date: Tue, 24 Jun 2025 16:19:23 -0700
Message-ID: <20250624231923.990361-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624231923.990361-1-florian.fainelli@broadcom.com>
References: <20250624231923.990361-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_162619_535080_54A4F6A7 
X-CRM114-Status: GOOD (  11.30  )
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

The delay that we are waiting on in brcm_pcie_start_link() is
PCIE_T_RRS_READY_MS, use it.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 92887b394eb4..7fa2087e85db 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1337,7 +1337,7 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 	 * Wait for 100ms after PERST# deassertion; see PCIe CEM specification
 	 * sections 2.2, PCIe r5.0, 6.6.1.
 	 */
-	msleep(100);
+	msleep(PCIE_T_RRS_READY_MS);
 
 	/*
 	 * Give the RC/EP even more time to wake up, before trying to
-- 
2.43.0


