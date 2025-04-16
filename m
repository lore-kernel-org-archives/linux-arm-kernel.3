Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C41C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YX/d7L64JrOYUFa+mzeCbGR3vIookQHuQijJyLDH4I=; b=dzZer7z/qPyfj8a/ia6CPDpaHu
	jBLhm4wk2sERhp5O6Py+s/esYfQ5yIDw02bCIcWvwm9oZ0vFESMm+s1+XbpUGgQJN238EyyPImTXT
	zI5qiMU7Ld0G7cqOrFZpe/EkgtaXQixrvpYNyk1UWhvf+7mvXouygsGXHpj+HLGd/Auhj7V1u7RMu
	EtDM+uDfeSd2Vtu7UOeP757hdV3gXrRkKFi9njWHcvrCxevNvw1qANXZmTpknGSFxXHedPO3si6FP
	zeM36hSdvpykECr/ka5UKcVfH1GN32LfQPsZbvy9WTmicnlTJEVl0ZU443kZsplmgcqGO16X05aMJ
	w6U0iaGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56P1-0000000AOIl-0e9p;
	Wed, 16 Apr 2025 17:18:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55sh-0000000AJE6-1rFf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:45:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97C1B5C4A9C;
	Wed, 16 Apr 2025 16:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EACAC4CEE2;
	Wed, 16 Apr 2025 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744821898;
	bh=0r0mi/BP6F0I5TWSsjujNCjEBDZ11myDs0TAlZWLbbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KNYJUhUXz91F1oOr8Yl/Md/UxSC2sfD7qBpC1mgnGkKbbkKfVeoiCL6YOOeXEtz8T
	 s2RhhYPvZC7npN3ldiTPwO8UAccI74kCJr1mejeJVsfw2i6apEFf3loy5Xb6ymS2gy
	 lkrz/vrsZt+olcvVXyF38zfZVOlgGOP9zKHU6e0of4DD4SxJG5hC/NdY5rut8AuNSk
	 Q61bIGWiQBxC+HGVvh8sEVtXY3t11gFxwjmWRQyKGhcp4HPhp7fAfsX4lrQFr1M1RS
	 Mws1S3bIQfcmVS6PvCs5K1q9HrWBfNkAOBcE86ujyOUoHVYHJXbMOx+XCTIciOGU5c
	 94/5g9NU1aCVw==
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
Subject: [PATCH 5/8] net: ethernet: sis900: Use pure PCI devres API
Date: Wed, 16 Apr 2025 18:44:05 +0200
Message-ID: <20250416164407.127261-7-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416164407.127261-2-phasta@kernel.org>
References: <20250416164407.127261-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_094459_530869_101749CB 
X-CRM114-Status: GOOD (  14.10  )
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


