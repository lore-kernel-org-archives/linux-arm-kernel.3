Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF67C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xnUcdBvnWiNCp7yTgWXorfhoxPJD3su6at4f5v/ffw=; b=qXDFV+Ol1DXI7ZkVFqxlW7IGT6
	hvupZ0uge/wO0MRFtKEWTY62ZgHy8Hqn7TVqeJMLTlnRsbfUW2j3GeqoZMsCUiDnACHbGmP59W5lQ
	hGnYQNXrN8RRpl1MMS89HNe4syBcQBkmkpuYJzoDTmHyPp+L035jBrhScTC8FL+zIyJxv97A1R36/
	e+HiCukw5OJbKp/2m7akhkYlqmAMDn0KX5lyE8W51ah1I9m2DQKkPKjk7o/E83EDVxgEWor6e3jFy
	arcsrlZFq84xX8r4c0aWX8w/RSw7ActiH9lnZh7s/2e35WOkCJiMeFCgxfFIA9kIPqu9mYVVILIBG
	R5Ne4Ftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNvu9-00000001pnS-1zR0;
	Sat, 07 Jun 2025 15:56:21 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNvng-00000001pEm-0oJP;
	Sat, 07 Jun 2025 15:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3x
	nUcdBvnWiNCp7yTgWXorfhoxPJD3su6at4f5v/ffw=; b=K/TjeYsGv5+JF6ifSW
	Y3cHhH10l1uRzkq9k0XbVNyqRhDbAME4pjnZwgcNcjl5kt+RNDu9ROLYEWr7sZyp
	o6SdkzBGtn1OguVZhAB8ZUI/hdo082wOniDojQAaB20Pic+sJMx37UmZh/wVBYQk
	zTAiFsGXeOxFdk26sc89kUeRQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnzz17X0RoTZo8Gw--.4221S3;
	Sat, 07 Jun 2025 23:49:16 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	shawn.lin@rock-chips.com,
	heiko@sntech.de
Cc: robh@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 1/2] PCI: cadence: Replace private message routing enums with PCI core definitions
Date: Sat,  7 Jun 2025 23:49:12 +0800
Message-Id: <20250607154913.805027-2-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250607154913.805027-1-18255117159@163.com>
References: <20250607154913.805027-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnzz17X0RoTZo8Gw--.4221S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArWxXF4xXw4UKF1ktr1DZFb_yoW8KF4fpF
	W7KryfCF1fXrW5u3Z5Za4UGr13XasxC34xtw4vkw1xZF17CF15GFy29FyrGrW3GrZFqr12
	9398tr9rGF4ayFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE-BMJUUUUU=
X-Originating-IP: [124.79.114.92]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOhNlo2hEXNoO6QACsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_084940_546963_2A461A59 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

The Cadence driver previously defined its own message routing enums (e.g.,
MSG_ROUTING_LOCAL) and message codes, which duplicated existing PCI core
macros (PCIE_MSG_TYPE_R_LOCAL, PCIE_MSG_CODE_ASSERT_INTA, etc.) in
drivers/pci/pci.h. These core definitions align with the PCIe r6.0 spec.

Remove the driver-specific enums and switch to the centralized PCI core
macros. This eliminates redundancy, ensures consistency, and simplifies
future updates. No functional changes are introduced.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 .../pci/controller/cadence/pcie-cadence-ep.c  |  2 +-
 drivers/pci/controller/cadence/pcie-cadence.h | 20 -------------------
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
index 8ab6cf70c18e..77c5a19b2ab1 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
@@ -353,7 +353,7 @@ static void cdns_pcie_ep_assert_intx(struct cdns_pcie_ep *ep, u8 fn, u8 intx,
 	}
 	spin_unlock_irqrestore(&ep->lock, flags);
 
-	offset = CDNS_PCIE_NORMAL_MSG_ROUTING(MSG_ROUTING_LOCAL) |
+	offset = CDNS_PCIE_NORMAL_MSG_ROUTING(PCIE_MSG_TYPE_R_LOCAL) |
 		 CDNS_PCIE_NORMAL_MSG_CODE(msg_code);
 	writel(0, ep->irq_cpu_addr + offset);
 }
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index a149845d341a..1d81c4bf6c6d 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -250,26 +250,6 @@ struct cdns_pcie_rp_ib_bar {
 
 struct cdns_pcie;
 
-enum cdns_pcie_msg_routing {
-	/* Route to Root Complex */
-	MSG_ROUTING_TO_RC,
-
-	/* Use Address Routing */
-	MSG_ROUTING_BY_ADDR,
-
-	/* Use ID Routing */
-	MSG_ROUTING_BY_ID,
-
-	/* Route as Broadcast Message from Root Complex */
-	MSG_ROUTING_BCAST,
-
-	/* Local message; terminate at receiver (INTx messages) */
-	MSG_ROUTING_LOCAL,
-
-	/* Gather & route to Root Complex (PME_TO_Ack message) */
-	MSG_ROUTING_GATHER,
-};
-
 struct cdns_pcie_ops {
 	int	(*start_link)(struct cdns_pcie *pcie);
 	void	(*stop_link)(struct cdns_pcie *pcie);
-- 
2.25.1


