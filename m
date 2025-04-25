Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0604C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 09:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1esYsMdClOiYJnMStMZq7p5g6vLoQHmFarNnAAvQKk=; b=lqjQFdDQd8Bfdg/kkOs1zyHqAs
	sFSy5G8XD7qnBxVQ37AQ1vfdb4xSuAioS2i1GyWuVMKd4P8NrCLiBpXmPIXxcnUFu5uOyTxGd0Ezi
	QOpbxFFiUczSkIAnk9v7u8X3shDMJ7yzgMJTyAicfEO+WWyv1bpw9NrAFvpzT4WAjHlx8UW/yYLAW
	GJ0xa2UenmwUzXXQ39M1DWBYer7Xc8+shOcFz4Tk9IRZtqTLiJ480GwFgEOAGCq36IfPjJ2kgHkhw
	kzzAJ2goXNjLyK9ZdgmwMVdSAXfTtCfoNKYw6W86Fk7Y7h4huQ7JVV6mNuejro9oS3ptO3KQwVyGv
	40lDGY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FNI-0000000GXoU-1Kge;
	Fri, 25 Apr 2025 09:29:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Et2-0000000GRqX-2nPQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 08:58:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C238768464;
	Fri, 25 Apr 2025 08:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91555C4CEE4;
	Fri, 25 Apr 2025 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745571499;
	bh=SNLiMhOsszlezKYixhj6I8LuSgz6s/EcE4gCa2JfaPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AXIUSdEaBTP+wb5An5Kz724b5QqR+D1UiEHOKdeoLvVgJ5WB7Ukiadkby+TIGRQoj
	 YIgfc8OWqfSB6+eo3/1SYXbZENETrVmHPFIowyIW+yZjXC+eN1acFx/Npw8LPfFA1n
	 J0bzN/Se98urxB7Fv8EoLYTbpFMu9+/K5myOkjjBQtZwjJ2fYp/azg3I2LTc9pcv5o
	 rPwDpPCuRbnLio5id4DD4I2NNE5m5jcVlh9P6AQEqgE3fJLON9Xoga8JLJ1npP9m1S
	 BLaLhhmnztpzdyL1djs2LAIxk4DDuvGn+bfaVWM5dLh4nPCDMIc8CR1Qe5SxGcItaN
	 Wjw28w7OZXEkg==
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
Subject: [PATCH v2 4/8] net: ethernet: natsemi: Use pure PCI devres API
Date: Fri, 25 Apr 2025 10:57:37 +0200
Message-ID: <20250425085740.65304-6-phasta@kernel.org>
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

Replace pci_request_regions() with pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/ethernet/natsemi/natsemi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/natsemi/natsemi.c b/drivers/net/ethernet/natsemi/natsemi.c
index 05606692e631..dd279788cf9e 100644
--- a/drivers/net/ethernet/natsemi/natsemi.c
+++ b/drivers/net/ethernet/natsemi/natsemi.c
@@ -846,7 +846,7 @@ static int natsemi_probe1(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENOMEM;
 	SET_NETDEV_DEV(dev, &pdev->dev);
 
-	i = pci_request_regions(pdev, DRV_NAME);
+	i = pcim_request_all_regions(pdev, DRV_NAME);
 	if (i)
 		goto err_pci_request_regions;
 
-- 
2.48.1


