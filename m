Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F84EC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tN7FQ5FSWRVIOCmkrGnYCLzSDwZZa9ScFd6idUO4Fcw=; b=oFwO/DvxRnPkzDtndzfPeCVlS9
	S/ljNw89yh9sRDt3KJJleL71V4CrcYYwvFwfBYYshOOSkkr93hy6BXO0/Jx9Dbsy16gpA8ZXfKr4/
	78O6cmZE6ohTjUF4ySdgHr4Yjn7ovzSlVzbi58ZvbzG9eBH/XjxV3dwz7wlsu3wmEwN976Vl7kdAs
	/MsIbD5GZDPdKJmt4Mwjua7hCaSn/UGsTphK7vIJLCyRqF/gxiEAv8KbToKp7dJ4xci/WWO/fGxPX
	WfJec2gKNynLNPP0sK8WOzkTXb3IVxmmjF3rwajraoAc7itJ4uU6PYPOB0IrmL4KGdQVpcOkj4iKN
	AdQV2zSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56Se-0000000AP1p-2G14;
	Wed, 16 Apr 2025 17:22:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55st-0000000AJHV-3OsY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:45:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7D7EA49DD2;
	Wed, 16 Apr 2025 16:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2168FC4CEE2;
	Wed, 16 Apr 2025 16:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744821910;
	bh=5GFi/S9V+RPxeDj71v6She90EyPqsjI1DvAkv9zvuRk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gsCchKDQYSDDnMi/pwI8gZLEMbdalcKBBlw85eYmiIa5uEDm390FEvsSgm9R0RWwN
	 jbv0T891L/P7C6oHPRXziwRI2FeMrGtX+oWrlM+Yw2sErb6Vi9vKi2y2sSFK8230QV
	 LnENN1RJP42K/WWApFQ9wN+SQ+K107HvSPQqUg3hIGIXEZU4odDdsoBz9Zrm2sRliz
	 61WMC5dZAi+PDlzhQ6YGVne5VpHngSgOawt5B3RbtP1SmbiUvqy5VnbOb6MOJKy6Gh
	 cWhFTZO8dw0BXnQ+5ch2ZuQCeB9CFm/+NrG01/ATAzd1bgvOGy/eSFEGlTssTt9RSr
	 cQGbJHNbhrWtg==
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
Subject: [PATCH 7/8] net: thunder_bgx: Use pure PCI devres API
Date: Wed, 16 Apr 2025 18:44:07 +0200
Message-ID: <20250416164407.127261-9-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416164407.127261-2-phasta@kernel.org>
References: <20250416164407.127261-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_094511_981302_F4F71BBD 
X-CRM114-Status: GOOD (  13.95  )
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
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index 608cc6af5af1..c9369bdd04e0 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1605,7 +1605,7 @@ static int bgx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return dev_err_probe(dev, err, "Failed to enable PCI device\n");
 	}
 
-	err = pci_request_regions(pdev, DRV_NAME);
+	err = pcim_request_all_regions(pdev, DRV_NAME);
 	if (err) {
 		dev_err(dev, "PCI request regions failed 0x%x\n", err);
 		goto err_disable_device;
@@ -1616,7 +1616,7 @@ static int bgx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!bgx->reg_base) {
 		dev_err(dev, "BGX: Cannot map CSR memory space, aborting\n");
 		err = -ENOMEM;
-		goto err_release_regions;
+		goto err_disable_device;
 	}
 
 	set_max_bgx_per_node(pdev);
@@ -1688,8 +1688,6 @@ static int bgx_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_enable:
 	bgx_vnic[bgx->bgx_id] = NULL;
 	pci_free_irq(pdev, GMPX_GMI_TX_INT, bgx);
-err_release_regions:
-	pci_release_regions(pdev);
 err_disable_device:
 	pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
@@ -1710,7 +1708,6 @@ static void bgx_remove(struct pci_dev *pdev)
 	pci_free_irq(pdev, GMPX_GMI_TX_INT, bgx);
 
 	bgx_vnic[bgx->bgx_id] = NULL;
-	pci_release_regions(pdev);
 	pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
 }
-- 
2.48.1


