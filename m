Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9D6C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvcWsSU1W74g0UPgIVYI7HXGVMLAwchn205j9TAtrL8=; b=dpx9L7dqvGD8wSBPSt1Y6HhqmC
	holMeAQ482zqKjKe0QLbjimDPGvKl/dnAJohESt3DSIpSv19pssKWs1lp1CdlKRXYtyN/LX0MfFTN
	ZwrOygGV+4SRse4A3ZbiNk99wfG6D/ECPm3EYjkLv68NcgtRsZlYCOb0UQJa1WjRYdZQlmlBmJwt+
	dUcVIqQRfTwMPTPV2Bl1NAvxfp/4Q3yEJMK/dETUSumaLkNp/dznMQ3PHhpQeE9GtYWs8XbsyUMmz
	tfNvzNKgZXmRO/n4UCiWi4LehXWBfcYjYMFHZb09PLm5+A8h08Mo0pSVr6RwQxarLgArXa3LKb3Wf
	IxjMnvHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56Hi-0000000AN34-0ugz;
	Wed, 16 Apr 2025 17:10:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55sI-0000000AJ5U-2wdA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:44:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B5144A4A415;
	Wed, 16 Apr 2025 16:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B527C4CEE2;
	Wed, 16 Apr 2025 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744821873;
	bh=OiO8b4cG5ozPDFrVf3pL6KsR9fmEuNLafgMjJ8kSJ00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jX1w3J8fsjgGQxKtAIXxfFoh7p3oc59Kx6jg3eqY1wD1puiolXPZC/V58GvXwDlTM
	 1Q8sIUSjNgE9I34R7OLFG3OuCilHdZs0mETkAo0eqvYPaCzpWzZXk2+Mlfszxfdf6g
	 JTgCvg3ePuskRI8UHBL+sKpo4TMmsn/F9kKSvxLL2OeDPEpvKFlnqNPAN1lRnZxnaK
	 Htm9gutwc+mb16oBYt4rznTGburiaZxsn7RlU1BV3c55MpSGrpU0yKlCY3mZzCr3rJ
	 i07L6AoY1xYhHXybLTputWlooNE7/Hn2b5Rv/x9YKPUCaD7NuKobCOEXby0WAmOv/O
	 rO+E8JwE+frzw==
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
Subject: [PATCH 1/8] net: prestera: Use pure PCI devres API
Date: Wed, 16 Apr 2025 18:44:01 +0200
Message-ID: <20250416164407.127261-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416164407.127261-2-phasta@kernel.org>
References: <20250416164407.127261-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_094434_877664_84438FB9 
X-CRM114-Status: GOOD (  13.64  )
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
 drivers/net/ethernet/marvell/prestera/prestera_pci.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/marvell/prestera/prestera_pci.c b/drivers/net/ethernet/marvell/prestera/prestera_pci.c
index 35857dc19542..c45d108b2f6d 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_pci.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_pci.c
@@ -845,9 +845,9 @@ static int prestera_pci_probe(struct pci_dev *pdev,
 		goto err_pci_enable_device;
 	}
 
-	err = pci_request_regions(pdev, driver_name);
+	err = pcim_request_all_regions(pdev, driver_name);
 	if (err) {
-		dev_err(&pdev->dev, "pci_request_regions failed\n");
+		dev_err(&pdev->dev, "pcim_request_all_regions failed\n");
 		goto err_pci_request_regions;
 	}
 
@@ -938,7 +938,6 @@ static int prestera_pci_probe(struct pci_dev *pdev,
 err_pp_ioremap:
 err_mem_ioremap:
 err_dma_mask:
-	pci_release_regions(pdev);
 err_pci_request_regions:
 err_pci_enable_device:
 	return err;
@@ -953,7 +952,6 @@ static void prestera_pci_remove(struct pci_dev *pdev)
 	pci_free_irq_vectors(pdev);
 	destroy_workqueue(fw->wq);
 	prestera_fw_uninit(fw);
-	pci_release_regions(pdev);
 }
 
 static const struct pci_device_id prestera_pci_devices[] = {
-- 
2.48.1


