Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5228EC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 09:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svnQ2l286kV3owMA3bhfJ9QuAP5pVgcBYhOv22gc5Js=; b=y+HUbxn7F53bpIIwRo5vqeMoZ4
	hlbm1yoggkATUSfOUtB015JUuTsJ/xc4hjE8cNDWDyvxTuicF3sbWWjEa2GDYfLwJNF9vnT3pLrQ7
	eZP8EaLAYBK5mq7iw6+3t8/d05ZRL1KsqwbX7p3wpCTYa2LAxWPAcjh92wUwIdUm1j0fj/QZxbKCo
	PejJulqUyMyIWd8zRwP6jQtMhb8R6dQvg+IrKHRXuOnnzvlbJcWXZAuwhFvOI/s/xjczhNqTcCqdm
	vwgjdDToCgYkqE7q5qTWdVFuvaSKTCKT2ud7XBMCgzuE+7LpwGf0aXgE239x9UrDt6bMRt9XTAp9j
	/DsD/pdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FP7-0000000GY86-40xP;
	Fri, 25 Apr 2025 09:31:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Et9-0000000GRrO-2VSV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 08:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B93366845F;
	Fri, 25 Apr 2025 08:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56035C4CEEA;
	Fri, 25 Apr 2025 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745571506;
	bh=ReLh28MMXe+RCC+isNK/dhc8sJPi0We7tbuIOvBGcMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QYUZQrCso3T23LALKw0C7Xd397quUlqZYpWiKk/VQfZ9Ut/+uMgj4EkwVQeor3alh
	 NItGOYyddkAC+RODzbwkyubLdDUXr0qIgf5ln/ndPKYL2+DjJyg2pTavXrlY97Mfqm
	 gXkDzipiyPOaB66oPZ45HGkjedVytgq1whLTfr1wy19bfn5DH/BwHuyhK9W9gzX+nD
	 kT2FYv7rR6fysxtZ/wpIUEbShtnTqOeyLiryXitRzDaYdyY2jAHBcESzqQpeWGr+iR
	 DQVQhnfsa+67LbQpP1vuUCjI3qRNT13MqRbz3bgwYu6FYWWiN4FS8VKJ17VsvjC8AR
	 3yD1Oovvs9ezw==
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
Subject: [PATCH v2 5/8] net: ethernet: sis900: Use pure PCI devres API
Date: Fri, 25 Apr 2025 10:57:38 +0200
Message-ID: <20250425085740.65304-7-phasta@kernel.org>
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
 drivers/net/ethernet/sis/sis900.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sis/sis900.c b/drivers/net/ethernet/sis/sis900.c
index 332cbd725900..df869f82cae8 100644
--- a/drivers/net/ethernet/sis/sis900.c
+++ b/drivers/net/ethernet/sis/sis900.c
@@ -468,7 +468,7 @@ static int sis900_probe(struct pci_dev *pci_dev,
 	SET_NETDEV_DEV(net_dev, &pci_dev->dev);
 
 	/* We do a request_region() to register /proc/ioports info. */
-	ret = pci_request_regions(pci_dev, "sis900");
+	ret = pcim_request_all_regions(pci_dev, "sis900");
 	if (ret)
 		goto err_out;
 
-- 
2.48.1


