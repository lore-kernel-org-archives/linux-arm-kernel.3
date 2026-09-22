Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59650C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 21:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PMH22imOcniT9n8fNl/LfwvN4I1qM42v7JXXBlyhKJc=; b=Mel3mjukwbQY2jRqlCrWAVOSfg
	jogIgTDlQmkNeHmQR72EzpdkWIQPpYeeACehm4hxb27ueCIh+6r73/0yYeEmFiNEJ1QZtHDRH2c6m
	E1F92YvQHnjtc0coajehcCEPwJxfCAK2hwrByIKaACukZu0cxH28Hfcm0LpXxzjuv3N2qmqchUthd
	Aav0hBaycyqkl5fxYGreYjZsZJ4wMje29TKh4ysQVLi2malwJDYkpN7oA5y6G9CmdRhajwqRhOIhr
	pYPaCcf979D67D3hY7bCQMXjiI6qAhb4+8CBJSOhQsvM/4fbtd/sSRWVGLP8slY3omz6f9qnSLILh
	cFHJs+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97jS-00000006ajJ-1ypM;
	Tue, 22 Sep 2026 21:08:54 +0000
Received: from out-75.mta1.migadu.com ([2001:41d0:203:375::4b] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97jP-00000006ahr-0rZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 21:08:53 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mwU7r2R0iXancqDMVbrNZC/D/wd+eK8OiPSqY0f/ZZ8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790111325; v=1; x=1790716125;
 b=npD3YMe1TauKwFokkT0upDAePuBU6kkQifazjjuCBbUfwOrNU0L63a7vIm7dPP3tBH0JqU0V
 6GXI3A+iyA1U5xJTeMyZ54yGaeFG/33dJW07F4KvU8wy1cjN2KVCNiqjQM7bZRNPJqQ8PQH2Efw
 c1V4wyVFeD4DNMBz9MqR81zE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a0710456afc2675d;
	Tue, 22 Sep 2026 21:08:44 +0000
X-Mizu-Trace-ID: a0710456afc2675d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH] PCI: iproc: Use __free(device_node) in iproc_pcie_msi_enable()
Date: Tue, 22 Sep 2026 22:08:39 +0100
Message-Id: <20260922210839.3765444-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_140851_768582_747CCF2F 
X-CRM114-Status: GOOD (  11.23  )
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

Declare msi_node with __free(device_node) and drop the out_put_node
label and its goto: the scoped cleanup puts the MSI controller node on
every return, as the label did.

No functional change intended.

Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Link: https://lore.kernel.org/linux-pci/61488ddc-b346-4ba3-b32a-e972a3bd75a4@mailbox.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/pci/controller/pcie-iproc.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index afb3aa38ac6bb..b4f4e6e1d4b41 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -1338,7 +1338,7 @@ static int iproc_pcie_msi_steer(struct iproc_pcie *pcie,
 
 static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
 {
-	struct device_node *msi_node = NULL;
+	struct device_node *msi_node __free(device_node) = NULL;
 	int ret;
 
 	/*
@@ -1357,18 +1357,14 @@ static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
 	if (pcie->need_msi_steer) {
 		ret = iproc_pcie_msi_steer(pcie, msi_node);
 		if (ret)
-			goto out_put_node;
+			return ret;
 	}
 
 	/*
 	 * If another MSI controller is being used, the call below should fail
 	 * but that is okay
 	 */
-	ret = iproc_msi_init(pcie, msi_node);
-
-out_put_node:
-	of_node_put(msi_node);
-	return ret;
+	return iproc_msi_init(pcie, msi_node);
 }
 
 static void iproc_pcie_msi_disable(struct iproc_pcie *pcie)

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


