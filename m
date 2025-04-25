Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BCDC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 09:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7UqeHAmQebhCw1CJDAMsSAvJheJ+iUgJ4so9dAOcCQ=; b=eIJhdTt6PXpFdhIh8uknK9zfKw
	eQ2nK9X3vRnAmvTPmiWdkXepzEXT2M/CcIC7oF8VxnDqS1AwCagkiD536VtJH/EfuTxFcA/IySAaQ
	ngXKHmmIwxKZoCdGFEyWm7EKZgzIR4xHuMtE9Kv9f5R951EDQvdZvqN1mGpV9PMp6SGFcPXzj2cUx
	WsqEgvkiKNJBCgkboU/TS3Lr6kuRrDFNrLUOLoqrwywjFzLrFFrp7wuy2zuiWZU/GKazXlnN+lyHK
	RankyfEDHgQdI2HAtW3vu1Wp/vXGITQ5ZNGXx+siOkQSQ7Ss3SBlSpKc6rwmVtGl+1ke9C5sOpYvz
	ETIGKFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FLT-0000000GXVp-2HBg;
	Fri, 25 Apr 2025 09:27:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Esv-0000000GRoy-2Eqi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 08:58:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75B7743FA2;
	Fri, 25 Apr 2025 08:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E40C4CEEB;
	Fri, 25 Apr 2025 08:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745571493;
	bh=m+Vi1J2g9X6f8XLQfZWFFa2VyVsNzxMlpbDST6gpme8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rZrO9gEeE+tVfuQHltwGYKi6PyXbaHgIHTGo3zYBdKuknJVc4pYQyrvxYaW/quK/p
	 XVpoCi7xYLfak/z98WjxUqsqr4J7KcOeflv5dPAgiGnQ3q5vGz5iG1xqrrNPUVBnHk
	 NiHbBIPqNflJ6S4v0F/1dM4yDmZaXV/zjdzd9JX0MK1n8a1+DpaPUZOLZUgSxPfj/x
	 iKxaqgfLLdwq+Kw4I2uAhMUG3FhEupoGxt05KXz+ZP5nRa8K/CITUBEA4fvnUchgp5
	 0sj7IxsrtduNvon79eUafdIC7hSX4L8AlzXeR7SX7cIILhBRj3bF2T37RRc3FRuLS+
	 QExag8BAQtuZw==
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
Subject: [PATCH v2 3/8] net: tulip: Use pure PCI devres API
Date: Fri, 25 Apr 2025 10:57:36 +0200
Message-ID: <20250425085740.65304-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250425085740.65304-2-phasta@kernel.org>
References: <20250425085740.65304-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_015813_613740_B837116B 
X-CRM114-Status: GOOD (  15.41  )
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

Replace pci_request_regions() with pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/ethernet/dec/tulip/tulip_core.c  | 2 +-
 drivers/net/ethernet/dec/tulip/winbond-840.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/tulip_core.c b/drivers/net/ethernet/dec/tulip/tulip_core.c
index c8c53121557f..bec76e7bf5dd 100644
--- a/drivers/net/ethernet/dec/tulip/tulip_core.c
+++ b/drivers/net/ethernet/dec/tulip/tulip_core.c
@@ -1411,7 +1411,7 @@ static int tulip_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	/* grab all resources from both PIO and MMIO regions, as we
 	 * don't want anyone else messing around with our hardware */
-	if (pci_request_regions(pdev, DRV_NAME))
+	if (pcim_request_all_regions(pdev, DRV_NAME))
 		return -ENODEV;
 
 	ioaddr = pcim_iomap(pdev, TULIP_BAR, tulip_tbl[chip_idx].io_size);
diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ethernet/dec/tulip/winbond-840.c
index 5930cdec6f2f..e593273b2867 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -375,7 +375,7 @@ static int w840_probe1(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENOMEM;
 	SET_NETDEV_DEV(dev, &pdev->dev);
 
-	if (pci_request_regions(pdev, DRV_NAME))
+	if (pcim_request_all_regions(pdev, DRV_NAME))
 		goto err_out_netdev;
 
 	ioaddr = pci_iomap(pdev, TULIP_BAR, netdev_res_size);
-- 
2.48.1


