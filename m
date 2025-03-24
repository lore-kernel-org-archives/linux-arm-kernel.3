Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0820C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 09:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZKYpik44IVCaTMXHMy+XYgETIxhTnm0TaBl2ZQJtzA=; b=CKtpLnIGd6fwL2aAafd8qU2MlT
	AHCFRLDYhU37tliSeYfR7PPI8nBr7qmBQc/KjCqUIQP+sC0Zbkc4VdVnc3UPrXXNwxjsEtyp4QplA
	ykt65GNK4DTwpJgEunDAOAzS/dkM82UKYzP71aGPrQ0WUDRTVf2C+pLHQylyHVZvNdAaQfuqOuKEi
	9xTVwXpr/lmYHHPNCM1z2R++gilBQ3+rSzI13MW1vPqLwDWde6xMkYoingbe8ZV5jg9vapYiHkt8b
	KPLpW9zhGbxcg9Ba39tPChU/IpYnVdHyeCRz+G1tKBb7xWp2VYCAvcEbWG1LTZziFIFKLJvLsYz7B
	azuCcuJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tweBb-00000002j36-0zs0;
	Mon, 24 Mar 2025 09:33:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twe8M-00000002iTC-3nku
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 09:30:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55E0342BBA;
	Mon, 24 Mar 2025 09:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F0DC4CEDD;
	Mon, 24 Mar 2025 09:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742808614;
	bh=qvEF2fJCzu5X8V0NTQGWFGFuFTWwf3k9To8iBhwcuKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dQsnjwgT19IobHoC77xagOBHjM7+X2zTsG1p1KVZ3LoGlVjSTJPz53YbBM8usS1qy
	 QHTbZJ0GfhHscbbCY+xKD+rYoIAWtWt7v9WSaTRWhXuw730nJMZjSQGnFgBVb1mhRW
	 UB150Qv5i5rEO3kmLxtqk+r5/A3d6hdxUjE2sHM4aanOodw4SOTJ8P++ZtNsEHKQF/
	 HKNR+Fke3jd2L7d2Jw9jadWwZyPlGcZtyUN4x1naENebpKav3/V6W1xSp3OZ7evUTz
	 k23hATeNsw3OK5W4O01F2DZH27fN5JY9otAVSwBxtrkKqhOUCvzX8/cQEmYoyTyIWZ
	 6onfFyj67rbgQ==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Yinggang Gu <guyinggang@loongson.cn>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Henry Chen <chenx97@aosc.io>,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH net-next v4 1/3] stmmac: loongson: Remove surplus loop
Date: Mon, 24 Mar 2025 10:29:28 +0100
Message-ID: <20250324092928.9482-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250324092928.9482-2-phasta@kernel.org>
References: <20250324092928.9482-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_023014_964071_8B8F7609 
X-CRM114-Status: GOOD (  13.48  )
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

loongson_dwmac_probe() contains a loop which doesn't have an effect,
because it tries to call pcim_iomap_regions() with the same parameters
several times. The break statement at the loop's end furthermore ensures
that the loop only runs once anyways.

Remove the surplus loop.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Tested-by: Henry Chen <chenx97@aosc.io>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c    | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index f1c62f237e58..7e8495547934 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -536,7 +536,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	struct stmmac_pci_info *info;
 	struct stmmac_resources res;
 	struct loongson_data *ld;
-	int ret, i;
+	int ret;
 
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
@@ -566,14 +566,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	pci_set_master(pdev);
 
 	/* Get the base address of device */
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		ret = pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
-		if (ret)
-			goto err_disable_device;
-		break;
-	}
+	ret = pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
+	if (ret)
+		goto err_disable_device;
 
 	memset(&res, 0, sizeof(res));
 	res.addr = pcim_iomap_table(pdev)[0];
-- 
2.48.1


