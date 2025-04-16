Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E60C369C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUIinF5PIjvGewYuwt5VSX0HdZXMM/5vnVfZu8vR4T0=; b=4twvzsxCof2oy5pecy57vO3BFs
	YLVu8V8VjbTCp/X3ZMBRe4I1eaymKq7KWxkm/9t4Yn2o3tNXZmo4B0ZbxlRm0D58+MaUQsBPlfv/h
	Frn0zqa+xnwl8/9aGRudxG+Hpgu9dKJM+VqmOytk6ZDGmHLogqu3v+30x7kwBEFhs+xeG6ifVsZlF
	uwE0SEHi2leViGubE4WxEHOv1X1RGfUqnanXKsd4psSb4zoqZ/GSMUKx5I4qI+rgkg4ksDy6h6DNK
	YGSurhw0z772O9orjVn/5Zi7bV/pjnP+hQe2oKeWxMRjVi2QPdv+ZpqMRofzo33g1KiaooA/HXziz
	C4RbfVfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56Qp-0000000AOhG-3hBB;
	Wed, 16 Apr 2025 17:20:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55sn-0000000AJG1-2SBW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:45:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E153A4A3F7;
	Wed, 16 Apr 2025 16:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC703C4AF0B;
	Wed, 16 Apr 2025 16:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744821904;
	bh=aMbylj4k052FRMtMNFmpucn2eCtk3oK7X9pyLg34jlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L+grd4nuGvqBhfRZWu3jTChWYz9QoRaywQ6SjKI6z36om6n4Ju5SOYJ98px4bAxtd
	 rkh5ii5gBtGN9cXF06RnXcHfQvTcBaJGNnoyF+cvULp9Qo1+EauBXC+CUdSUSd7wrS
	 c24tnxy3EMD7HzDchoUJukafq2MVmL4KqvKd/q9PfocuwZL2dH0p1WPN8tVp0DTqq2
	 L3RhfvFNIOMwp3BbON1Lpg5YRWkkAEDs3HMh4Bo4Tc1ezg00jrtRaqoFLujverkCU/
	 mtDWVYCEpKmOLfpS7MzdtIb/MCnfy5tr3b38Nyg5nOmTV0b3LIAzLO/rkeuhjTjiHK
	 KR3yPoz+wy/CQ==
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
	Thomas Gleixner <tglx@linutronix.de>,
	Philipp Stanner <phasta@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH 6/8] net: mdio: thunder: Use pure PCI devres API
Date: Wed, 16 Apr 2025 18:44:06 +0200
Message-ID: <20250416164407.127261-8-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416164407.127261-2-phasta@kernel.org>
References: <20250416164407.127261-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_094505_747931_8957EB79 
X-CRM114-Status: GOOD (  14.17  )
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


