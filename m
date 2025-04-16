Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE8CC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioTBrjEwqD3n3gAidQOnRxCMDqzd7Xx+F+N69NSlK6k=; b=KSn5xKnwZiJ7g159lf1koVBvHp
	/cERTOMy1f9Nd75ra3gSF4EoUOZKuwPaW9pS/GjPC4AE9NTLdiVZrWjTdcpPF1GnlLB4iJrXe49zT
	AR0WLJR2lR5iOdnoRLD7vDN+II7fOABTcMZkiiEKgQScOD1Ahw0sl3Zg+szqPytdIA6DTC/PZOrt/
	QbaSLzJvLy9P7pvVmXCQpQeLZO7dI04ki0JDLoHcZmHn2tOKXrUUERjiEXacQIbwnomzOJD5v/Zvf
	DQXFgrbUHhWQSXiwFDMAw1jk69WaqebxNjz45w1C+wSbsR4Zxd5n7L6zHWT3LpW9aeoLgK8c8od4g
	5UTdPgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56LL-0000000ANVf-2q4f;
	Wed, 16 Apr 2025 17:14:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55sV-0000000AJBA-04EQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:44:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 533A2615CC;
	Wed, 16 Apr 2025 16:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58305C4CEE2;
	Wed, 16 Apr 2025 16:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744821885;
	bh=jHtCD2QxkF5BIe7+BmmcWSeYcXdRHKumusbGoJamdHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oVnUHRbb7tjjxube3cXSPU4s1AEzrYBJ6GB5oOUpTS6ku8ZkRCNLgGmvlMmd75dsx
	 1F5BNSVcILNkvY9wh6DVBe2oMeO0g947R4VMUcMD29p+5Wlns1BqN88Y66mUPmE78B
	 oHjiBu7PZyV7fmVsKxdhS2Ubm10xZzFsA6AgqHM6SLRDkFAg8XBri6DFtoKaHNt6jG
	 ZZfB8YM+KlKbnE5RL8V/jsZluMjUKqVcXC0WCWR/uWMUnxRkpSYAroKE4btW3wGN5z
	 Gvxu6wF30yyrdK2Mdxfp35QIw4QXPSjT9A7sPSH2D7vKdVTxGc3o5//0wF02r+l1dG
	 /BSqBMyaDL/HA==
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
Subject: [PATCH 3/8] net: tulip: Use pure PCI devres API
Date: Wed, 16 Apr 2025 18:44:03 +0200
Message-ID: <20250416164407.127261-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416164407.127261-2-phasta@kernel.org>
References: <20250416164407.127261-2-phasta@kernel.org>
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

Replace pci_request_regions() with pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
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


