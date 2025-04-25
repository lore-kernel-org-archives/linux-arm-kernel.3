Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96BFC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEDQhzfkBEyoaO0jKVBQPJI5FU8Kvj2BFfEXH82wM4k=; b=IvAjpBm8ikFsNRCS1cZLMOX5Fd
	YTIh358+tR6gEuRPxu8MyBDPtEHFIPMzZ17vzXw2o5wKPDfFVBB17KEpSDPYU+tPwAe7Ggka1QZEx
	YmQGfvr0TnZm/+obGE24ocvY/qrzasJLiaG0zNK3mDBc1IGr4Y6EkrPo0x+0AL9EiLd+3EvurSPu1
	O1JQLRABmAfOy7ZKndcyKGTZl0WSC5jGJTGyKyDr5JJNqF6BKHa6ISQX1I69E0SJ8KLYL4ichbkTo
	2kuMYc2AIqZobJ/NndIJ6/b/Fx/D5GGbon5BsrGXbp4xPdBMPKjynaSpAnEHOIKTYtT5dgha4g0Su
	UUGmocfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FHp-0000000GWl3-0nvV;
	Fri, 25 Apr 2025 09:23:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Esi-0000000GRlj-1XO4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 08:58:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4475543FA2;
	Fri, 25 Apr 2025 08:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B81C4CEEA;
	Fri, 25 Apr 2025 08:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745571479;
	bh=SJjOmLS6N4kbYOZUh7McqDYQHoY2qAv/ch95M7/xp/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UzFrajcyCWUQp4NoCuoJGoQpoo4y3MriQf/v7TbQeYVD2C8nnK9mKVhAUV/n5/cHB
	 uozUBKgiEJTaxhvBZ5VOThFQNmQOQCDPxRvHwiuGNn31XeDS+Aj94qqD2bmgksgUHW
	 AmADXjU6lKbDZN+knO59/Xz6PERMNByLLi15I+/HVid6fh3+lGviletKQZhDh7X17i
	 P1FKsUib9mIrYjBdLASOYFXls1sakHURx85B++fDmM4rVXRXA02dBKNMVOSTUUM71m
	 TEGDQ6fxrCbj2XXoVuIQD/WnHSjXdIEB9vG2M/gUhiTL75atMpYzJf5YeKtqn8GEQy
	 /ejOJNzaFI8zQ==
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
	linux-parisc@vger.kernel.org,
	Elad Nachman <enachman@marvell.com>
Subject: [PATCH v2 1/8] net: prestera: Use pure PCI devres API
Date: Fri, 25 Apr 2025 10:57:34 +0200
Message-ID: <20250425085740.65304-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250425085740.65304-2-phasta@kernel.org>
References: <20250425085740.65304-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_015800_441269_115B5A7E 
X-CRM114-Status: GOOD (  13.49  )
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
Acked-by: Elad Nachman <enachman@marvell.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
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


