Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D495C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 20:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2Us4mdNEvhuyOgKQU3GzWXQxNS9dEkI8BiRToUpUN4=; b=Fnf5owNbke5s3HjZ1g1t/UmpE1
	0iCXalxXAa3CQWA+r0QnDCdVpdl0gHd7sQr51sTQow584RUslJ6AumaRvHc6c5wsA4CfvRvxmhjVs
	KyZCm36ttEyiWrOa+khJvz/qB7G16T+Ii7nhwZ78PNWgtI91XsBPtaUNNjFPyT45dj4zH89fue/he
	qKBPkoAqQvejzAwf6KeTptWUBQRGgkgUvrdIQuslyxeFIh3bZcrdldlw9HiXSzPkloSoJFeTShJ9i
	AV2FgUieV9jNuEtYRq0NOwUwFYaaXvIC+4lGyerwvGybENZ2G1EJKGi8B8LOmVSUwUflKR4ogzGvl
	Y4dkRKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCYT-0000000FsKi-2Yut;
	Tue, 07 Jul 2026 20:38:09 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCYQ-0000000FsJG-0p7q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 20:38:07 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gvtMv5yBGzMlMJ;
	Tue, 07 Jul 2026 22:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2Us4mdNEvhuyOgKQU3GzWXQxNS9dEkI8BiRToUpUN4=;
	b=Tmxt6nto5vPwu2cDgw3ZE1aOER2/fwL/o8QTkxlb1D3WMHQtFRuOw/EwwYhWenpOVN7D4e
	lYY/cKImq427Lkhp7UfiDgsY1cWq1qge7a2jcJ1Bar/zcF9TYNG2dJ5DE6USCXasVkxvmd
	rf6mGOxjJSf7A6bBTiWVH/dG1aJHOv8am7u2FnpsrJQ1n8qalKOuP3EP8MKKmf9AcG49hM
	8Iova3+cnmhdZD5L65uSepuMlC7MbftlelCtBmIycKYh+QKCuV9yiUFPja7/iAAcC0EwUC
	msvcGyAplSWkr75vS+NIJCRgYEimBKQ6XJ4EhlmdPfvtM6W+kED0r6UgUXE0mQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2Us4mdNEvhuyOgKQU3GzWXQxNS9dEkI8BiRToUpUN4=;
	b=YdS1CmmjByWm7CZo4bLVwH/7paBZDulYxGFpsF0EN3oN6Nv8Opd1PqZqZ2ZEA2yr4PmnfO
	zsem0EAM3t9zExN7bEpwsTkjDWTV+FLG3eynh8ghZbL407r6ObMu1QPF53QFchpwO4YD3y
	icVrAnn0AIYy/oqpLqCUqbiZevj9nWtcPbQYdLYbjuj7mAw2OX8LLpIhzNQuOmMb+uGzF1
	Oo+nxQBk/aJtXipiTP6GWpwtpKEPRrg5pSL/Ej3NzfDz4eBAAfUiNWQA6I/+rQWW7qeYZ1
	s/TBPo8FcVVrGWCQYfwj3HENFbc0E2S2UhL4mvyfuagiVv1DyEcNj85FrNifug==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/5] PCI: dwc: Determine whether iMSI is used before calling .init
Date: Tue,  7 Jul 2026 22:35:39 +0200
Message-ID: <20260707203743.88299-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: r583po4qoa15sromgjb4oesm4cdjryrp
X-MBO-RS-ID: f11fc97ecda8cba6624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_133806_404838_A7796761 
X-CRM114-Status: GOOD (  14.19  )
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

The R-Car Gen4 PCIe controller integration configures MSI registers
in the controller driver .init callback, because those registers
have to be configured while PERST signal is asserted, and the PERST
signal is asserted across the controller driver .init callback.

The registers have to be configured differently in case the iMSI is
or is not used. Assign pp->use_imsi_rx before the controller driver
.init callback is called, so the controller driver .init callback
implementation can use the pp->use_imsi_rx value.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V3: New patch
V4: No change
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 06722259d2e37..f5a38e6fd8d79 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -587,6 +587,12 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
+	if (pci_msi_enabled()) {
+		pp->use_imsi_rx = !(pp->ops->msi_init ||
+				    of_property_present(np, "msi-parent") ||
+				    of_property_present(np, "msi-map"));
+	}
+
 	if (pp->ops->init) {
 		ret = pp->ops->init(pp);
 		if (ret)
@@ -594,10 +600,6 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	}
 
 	if (pci_msi_enabled()) {
-		pp->use_imsi_rx = !(pp->ops->msi_init ||
-				     of_property_present(np, "msi-parent") ||
-				     of_property_present(np, "msi-map"));
-
 		/*
 		 * For the use_imsi_rx case the default assignment is handled
 		 * in the dw_pcie_msi_host_init().
-- 
2.53.0


