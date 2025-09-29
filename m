Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F228DCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wTnIMh7xoEfksOfJHKUgA8+GhzjMgsbCB2sGq5dPA74=; b=hWFLTUtOmoKEPJ5ZM2kvXtfNB6
	GBzaVHJBl2cWWvYEz8DCwlh1Ka2TJyG09zmMmM54Y17tmksZGm23nKzZTzGcCt1mz5DA0q0ElDYje
	90iF8VlyFW5wQrBy7lw/zqCIzduEEcFZAzie6FylGq2jvEFqOdJmJYf80OELtP1nKbbMZSCUElzzR
	tXmAB6AKdlrBOGQKnp4wgys8fflMHFTY49yZ6Mfed3HeeOzLXEiPyNsC2tkkpGKKKzdMRsz6fv2JD
	F2snHijUxZWvBwHaTA2quQsWAwIzkPgL0cOW+U7d2hYJdLSwD8PtDw/U4JQANMrIyHhVSHtK/bz6I
	MdILkchw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ITO-00000003ECy-0WbK;
	Mon, 29 Sep 2025 18:19:42 +0000
Received: from smtp-80.smtpout.orange.fr ([80.12.242.80] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ITL-00000003ECT-0jDt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 18:19:41 +0000
Received: from fedora ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id 3ITEvqX6XRHxd3ITEvYxTM; Mon, 29 Sep 2025 20:19:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1759169974;
	bh=wTnIMh7xoEfksOfJHKUgA8+GhzjMgsbCB2sGq5dPA74=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=tTpZknqUSmXo+Xqm8X+UH3zMbiw1hD8niVucVZrWGfDeodUlaV2SCMACaBSqPqB5Y
	 XaBQ1i8OAwB6Yi4sogD+qHfYCpqrPPdrpau769Y6lB2GceUIJCspANhI82oD56OaAE
	 jIoxVCmWIf4k2scI7jjIHs4tq4pCkP2Wqi+cmK2V2Vp1j/YVWcHUWCRYF3wdrO27gr
	 h0j5uOmTjVUc7ruZ/Bd0AwpllqoEe9ASIGVsBKHdurEde2whEJ3asMnih0IKIoPtMc
	 V4hBEmaVaJqE5g8uTbdLE3cPRSC+GC8SmuG2fPhcyMd0kAUwRUXOhj4S3NSGab0TaO
	 sNKxpsF2TK7Dg==
X-ME-Helo: fedora
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 29 Sep 2025 20:19:34 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Christian Bruel <christian.bruel@foss.st.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-pci@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] PCI: stm32: Re-use existing error handling path in stm32_pcie_probe()
Date: Mon, 29 Sep 2025 20:19:30 +0200
Message-ID: <e69ade3edcec4da2d5bfc66e0d03bbcb5a857021.1759169956.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_111939_618516_2094F7EA 
X-CRM114-Status: GOOD (  10.52  )
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

An error handling path is already available, so use it instead of hand
writing the same code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/pci/controller/dwc/pcie-stm32.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
index 964fa6f674c8..96a5fb893af4 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.c
+++ b/drivers/pci/controller/dwc/pcie-stm32.c
@@ -287,18 +287,16 @@ static int stm32_pcie_probe(struct platform_device *pdev)
 
 	ret = pm_runtime_set_active(dev);
 	if (ret < 0) {
-		clk_disable_unprepare(stm32_pcie->clk);
-		stm32_remove_pcie_port(stm32_pcie);
-		return dev_err_probe(dev, ret, "Failed to activate runtime PM\n");
+		dev_err_probe(dev, ret, "Failed to activate runtime PM\n");
+		goto err_disable_clk;
 	}
 
 	pm_runtime_no_callbacks(dev);
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
-		clk_disable_unprepare(stm32_pcie->clk);
-		stm32_remove_pcie_port(stm32_pcie);
-		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+		dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+		goto err_disable_clk;
 	}
 
 	ret = dw_pcie_host_init(&stm32_pcie->pci.pp);
-- 
2.51.0


