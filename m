Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449E3CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 22:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnLWPN74AHBIaLDvOBtrD1EbTBWBcfnhxcDXArDXl2E=; b=MoDtouidvPtF9Sa1+d78K0O2VH
	fyLJm/BdTQhczhVJMvqoHIpUuFviWzZrGiGXCHvD22ZSHBl8QOg/xMgYomZqCSaSywFiOU+x3z2go
	xQqM0dl9HVtbt/ndhY+MAgOxN+SmSPpL4/MErsCr07BzC19F3tb83vvaCZs3nnMO173Z37I6BVxfO
	yTNe/9ukCt91NTGeRWAcfHPw0LVSmr32UWUx1e4Xs1k1Rr5V/Bz2utystpwkZcoLDpZXD5k0G6AVU
	8iuCmFM7OJUC9S3Fo5ECP2cLZI0YUKhlXGvZgqOfp4CJr8dc9nVe8NYIoslSQENWDYmMvtkIKBhnF
	zOANkCCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGkc2-0000000E79U-246U;
	Tue, 13 Oct 2026 22:04:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGkc1-0000000E78o-0Z0K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 22:04:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DBCC043C6B;
	Tue, 13 Oct 2026 22:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A9D1F00893;
	Tue, 13 Oct 2026 22:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791929084;
	bh=tnLWPN74AHBIaLDvOBtrD1EbTBWBcfnhxcDXArDXl2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mtVDUylQ1lNJPnFZhMPcXLIn4u86dWSvceE9nvzxhE5YBHr73m2pCRkZRu6RFNDMp
	 j1dqv0gpnbmxcWx8Rx9dCj/BsRqhzfLROYVpKrKX1Z2NN2+4klYtTJVNQpLPetFekZ
	 PhpOpF4vWN/P0rnHhYGkRlg6kgHORwRBdc211CGsLSIZ5rOjH07yA0VlBwYStap/tY
	 FGAAqnE381c4yLjtQFRK4rb6Te2Ej4x3n6qrdeQO/HPwBGV3/HZZ92pfhgg6e/ZDb7
	 1z7j+gkU1yqw+bO3q4tn8/xDGKHo9D557kmBoOZH6mts0JX7XCsNcsKZswi4xyeVUt
	 Jalxvqg4duumA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Semih Baskan <strst.gs@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Rosen Penev <rosenp@gmail.com>,
	Rani Hod <rani.hod@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v4 1/2] PCI: Expose devm_pci_alloc_host_bridge_release()
Date: Tue, 13 Oct 2026 17:04:20 -0500
Message-ID: <20261013220421.1588051-2-bhelgaas@google.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013220421.1588051-1-bhelgaas@google.com>
References: <20261013220421.1588051-1-bhelgaas@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

devm_pci_alloc_host_bridge() allocates a struct pci_host_bridge and also
parses device tree resources and claims them.  There are drivers, e.g.,
pcie-iproc-bcma.c, that need to allocate a pci_host_bridge but do not need
device tree resources.

Expose devm_pci_alloc_host_bridge_release() so they can avoid the device
tree parts by calling pci_alloc_host_bridge() directly and adding the devm
release function manually.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pci.h   | 1 +
 drivers/pci/probe.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ba3c3fddddc2..5e21cd29cc7c 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -502,6 +502,7 @@ enum pci_bar_type {
 	pci_bar_mem64,		/* A 64-bit memory BAR */
 };
 
+void devm_pci_alloc_host_bridge_release(void *data);
 struct device *pci_get_host_bridge_device(struct pci_dev *dev);
 void pci_put_host_bridge_device(struct device *dev);
 
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 27008e2ea5af..e214da95ca94 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -696,7 +696,7 @@ struct pci_host_bridge *pci_alloc_host_bridge(size_t priv)
 }
 EXPORT_SYMBOL(pci_alloc_host_bridge);
 
-static void devm_pci_alloc_host_bridge_release(void *data)
+void devm_pci_alloc_host_bridge_release(void *data)
 {
 	pci_free_host_bridge(data);
 }
-- 
2.53.0


