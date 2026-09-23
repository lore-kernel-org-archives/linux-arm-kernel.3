Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B6AC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yrAZQoFJPT7KTZg3XNnAopV9gw2Z3li7Emgmi3ZL4EM=; b=0Z06uhCaiTBgasBFWEQnntYPlT
	8wmw4bSaFROEGUsHB7RCA7nNVC/hS0Le3qfyNAYrXpJZP9frswtvT2j3ssNdbQedIpRKlJKc+qwBy
	L4Z0hruDPfY49rNcEjIuoAPDjUZXiE0fTZpZy8WeXOZmtQc9j23jeLFpzEyrTod+JcV9f5JncjDWI
	3JrN/3y8zzyBD7me6jAehgBvkbmeqHFIA0ownar6guLWX5a/Z+10tDwKwV9CVRw7tVw/T1yTdRMrY
	ooaritnN9Fz7qzioxQoOkS97tIIqiXuou3ygXRl1i5PUc2xgYRbZ6CHrCG/3WQlItmfHJN02GaK5s
	YIThiBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RNA-000000098Wu-4ACn;
	Wed, 23 Sep 2026 18:07:12 +0000
Received: from out-190.mta1.migadu.com ([95.215.58.190] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RN8-000000098WK-3Fjo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:07:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=fLLjzktRThpp0ku+nxVYQNHTTS5nBtNj2dirivgqdeI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790186828; v=1; x=1790791628;
 b=f+5CF+uKYoaeaL55SARSElXxlgsY0rwyMRGGem8hTgWVm/ZvkOoeypJki1Zi6sVWzCxsN+0U
 IOoa6IDb4twSkxhgqKrsEpzF3G/0D8zxQNzYhe58C+3zq1Tm0HvlNEQBF9OgJrm9z+55Jv6qWU6
 yiGBQiMpmFfQGixWYvINI38Y=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0587aecf2ffa7478;
	Wed, 23 Sep 2026 18:07:08 +0000
X-Mizu-Trace-ID: 0587aecf2ffa7478
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
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2] PCI: iproc: Use __free(device_node) in iproc_pcie_msi_enable()
Date: Wed, 23 Sep 2026 19:07:03 +0100
Message-Id: <20260923180703.3901185-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_110710_960900_896FB0D3 
X-CRM114-Status: GOOD (  12.41  )
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
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes since v1:
    - Declare msi_node immediately before of_msi_xlate() rather than at the
      top of the function (Jonathan).
    - Kept Marek's Reviewed-by, since the generated code is unchanged.

 drivers/pci/controller/pcie-iproc.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index afb3aa38ac6bb..bf455f2a9d9a9 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -1338,13 +1338,13 @@ static int iproc_pcie_msi_steer(struct iproc_pcie *pcie,
 
 static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
 {
-	struct device_node *msi_node = NULL;
 	int ret;
 
 	/*
 	 * Either the "msi-parent" or the "msi-map" phandle needs to exist
 	 * for us to obtain the MSI node.
 	 */
+	struct device_node *msi_node __free(device_node) = NULL;
 	of_msi_xlate(pcie->dev, &msi_node, 0);
 	if (!msi_node)
 		return -ENODEV;
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


