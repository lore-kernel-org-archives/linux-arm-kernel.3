Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505CEC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 09:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqgfGiH82rPcbf0X4B0Io6hmUzP6CsdcJ54xw3M+dlE=; b=NTzZv4TwdxrE5rNFjNIxHK/fOj
	8ZV9s1x4LHQBghUy4x0sXSd6ANwaffZf4az7+mfgp64BVjS3k2dBqJZh7Gc7DeH6pf2ZVmfzT/DlW
	Wfdi40yhN5b0IDyIA2L40h1WUYO/RitqDSkq6ZoTspCCQ/MuRPt+U7QYQNAvLq8cZdQ23bUmvYeww
	3iJcXSrw1BlJzwIri7EaZ9r2F4rsSEVukHXvDfZ9+GcukHeDodkX3Xg2VZnil5YppsQM6P8Rtn9pB
	PUbgqPK4v+R5nXFlfPy/iCpZFgK8Z9lomvnkevObUAqTI/hZ9Aiysoq2dO4eHcuJ3nP1Qh0PZxluh
	bzhC7aGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FSm-0000000GZ6h-1SiA;
	Fri, 25 Apr 2025 09:35:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8EtG-0000000GRtA-1QV6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 08:58:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F0F668464;
	Fri, 25 Apr 2025 08:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D782C4CEE4;
	Fri, 25 Apr 2025 08:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745571513;
	bh=JwQgJ9CbA/kRE+Ux8ehyLiYx0Jiy2Yv7pNe812gJer0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m/IbDZMYVFFXSrcufpLhIzufuUvYqMslGiwePnXGDVIEK41y8v48e8eEYaS2Cqo+g
	 C/NMce59ezEwNMvldNt1t/Bt2bc9v13er4AJgamAxSExVbOwX1HGnPj3YA6ixJ8oPM
	 mgiKN5dsu3g/h38hc/5Qs6dNOvCv9tc0QthrCXJEn4bfBRSrvmfkvya8Zu7Ayosb2J
	 Iw1A1dvG/fatcvCI9oGCZD42NGaicAdECTTQlAoxcBRRFJkP97bzfr06852N2Yyj19
	 L550ongKlfHvDzpzp6bPYCAb3Gi7MdZm0LXv0DnxZ+XV0S669mdFkpe3TJCPcv+NOb
	 7rKzHpJjBxitg==
From: Philipp Stanner <phasta@kernel.org>
To: Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	Daniele Venzano <venza@brownhat.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Stanner <phasta@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Sabrina Dubroca <sd@queasysnail.net>
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH v2 6/8] net: mdio: thunder: Use pure PCI devres API
Date: Fri, 25 Apr 2025 10:57:39 +0200
Message-ID: <20250425085740.65304-8-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250425085740.65304-2-phasta@kernel.org>
References: <20250425085740.65304-2-phasta@kernel.org>
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

The currently used function pci_request_regions() is one of the
problematic "hybrid devres" PCI functions, which are sometimes managed
through devres, and sometimes not (depending on whether
pci_enable_device() or pcim_enable_device() has been called before).

The PCI subsystem wants to remove this behavior and, therefore, needs to
port all users to functions that don't have this problem.

Furthermore, the PCI function being managed implies that it's not
necessary to call pci_release_regions() manually.

Remove the calls to pci_release_regions().

Replace pci_request_regions() with pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/mdio/mdio-thunder.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/mdio/mdio-thunder.c b/drivers/net/mdio/mdio-thunder.c
index 1e1aa72b1eff..a3047f7258a7 100644
--- a/drivers/net/mdio/mdio-thunder.c
+++ b/drivers/net/mdio/mdio-thunder.c
@@ -40,16 +40,16 @@ static int thunder_mdiobus_pci_probe(struct pci_dev *pdev,
 		return err;
 	}
 
-	err = pci_request_regions(pdev, KBUILD_MODNAME);
+	err = pcim_request_all_regions(pdev, KBUILD_MODNAME);
 	if (err) {
-		dev_err(&pdev->dev, "pci_request_regions failed\n");
+		dev_err(&pdev->dev, "pcim_request_all_regions failed\n");
 		goto err_disable_device;
 	}
 
 	nexus->bar0 = pcim_iomap(pdev, 0, pci_resource_len(pdev, 0));
 	if (!nexus->bar0) {
 		err = -ENOMEM;
-		goto err_release_regions;
+		goto err_disable_device;
 	}
 
 	i = 0;
@@ -107,9 +107,6 @@ static int thunder_mdiobus_pci_probe(struct pci_dev *pdev,
 	}
 	return 0;
 
-err_release_regions:
-	pci_release_regions(pdev);
-
 err_disable_device:
 	pci_set_drvdata(pdev, NULL);
 	return err;
@@ -129,7 +126,6 @@ static void thunder_mdiobus_pci_remove(struct pci_dev *pdev)
 		mdiobus_unregister(bus->mii_bus);
 		oct_mdio_writeq(0, bus->register_base + SMI_EN);
 	}
-	pci_release_regions(pdev);
 	pci_set_drvdata(pdev, NULL);
 }
 
-- 
2.48.1


