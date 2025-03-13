Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAA0C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAOZqGfYNJGyoo068redqjAlWaH9+7p1vY5lq0IQ3LU=; b=auxZUs6SDPnrfEfnaLZQpFfGga
	BDWUvkQe3Y8TuXdIsikkcwfAXfSMbumPY5KsWxuEWf280LIH7PVrLH8B6UuZL9xVO5bOi0HZwKEiV
	dCfEdP4oeypypm54lKVNwVmB1lDiorD8Lb6Nekbo87jkNn3qn381lLLCKb3/XqSvMgXE18iW9bQwn
	j3K8yanVU7DG1/U6/aMjJVDUagWvhTJnnPtm9cg9CBgEVUzEaXaSDc2oBMgqJosHr8+20BAuKrImc
	wBPu/aEifcUuXfv1TN0Ec+cmK+jO1nNYxbXgEW+oR2SCB+7urGzf6eCWIa0oI1RmxKvkSdBJsyeN/
	19l9Mx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm8Y-0000000BwqA-27O0;
	Thu, 13 Mar 2025 17:14:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslCs-0000000Bmsp-48tW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 16:14:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 59B25A47751;
	Thu, 13 Mar 2025 16:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E409AC4CEEE;
	Thu, 13 Mar 2025 16:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741882490;
	bh=Y8/MDMfs1bwprrJrMnPBGIZtYhcw/F6xhmmiWJV6T6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uBas+XyrOTNPJWUphlmNLX688HmEaBK54fr41BRraE1SYejqEdjCHI5FyhBDUmbHS
	 QEW7Zd152Yog4KahsAuOQr1/cObt7WrS8l+QlIP2V1EZ8PgzVej5M7qFkTnkb94yK0
	 FxGByoDLRv8wP3ZnFTGJ/Xci8ME6FV6zfuTOBs0nOmch9y/GSL5ERjZMrtYkmH2kqg
	 MGSfQD0h2KDectZHJbrOfkdD63TvY280mDfoU+YACl7lUBWDlCVRuuxPkjyWVl3lso
	 L/+e/MUGjZtiqIAE1ciFeA/Biayk2qyxOMHqxma08amizDszWbFq/04OUCKEUZt42w
	 RrxdH/yMlOpKw==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yanteng Si <si.yanteng@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Serge Semin <fancer.lancer@gmail.com>,
	Philipp Stanner <pstanner@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Henry Chen <chenx97@aosc.io>
Subject: [PATCH net-next 3/3] stmmac: Replace deprecated PCI functions
Date: Thu, 13 Mar 2025 17:14:23 +0100
Message-ID: <20250313161422.97174-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313161422.97174-2-phasta@kernel.org>
References: <20250313161422.97174-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_091451_167197_DA29F671 
X-CRM114-Status: GOOD (  14.62  )
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

From: Philipp Stanner <pstanner@redhat.com>

The PCI functions
  - pcim_iomap_regions() and
  - pcim_iomap_table()
have been deprecated.

Replace them with their successor function, pcim_iomap_region().

Make variable declaration order at closeby places comply with reverse
christmas tree order.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Tested-by: Henry Chen <chenx97@aosc.io>
---
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |  8 +++-----
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   | 14 ++++++--------
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 5d7746d787ac..25ef7b9c5dce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -521,8 +521,8 @@ static int loongson_dwmac_acpi_config(struct pci_dev *pdev,
 static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	struct plat_stmmacenet_data *plat;
+	struct stmmac_resources res = {};
 	struct stmmac_pci_info *info;
-	struct stmmac_resources res;
 	struct loongson_data *ld;
 	int ret;
 
@@ -554,13 +554,11 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	pci_set_master(pdev);
 
 	/* Get the base address of device */
-	ret = pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
+	res.addr = pcim_iomap_region(pdev, 0, DRIVER_NAME);
+	ret = PTR_ERR_OR_ZERO(res.addr);
 	if (ret)
 		goto err_disable_device;
 
-	memset(&res, 0, sizeof(res));
-	res.addr = pcim_iomap_table(pdev)[0];
-
 	plat->bsp_priv = ld;
 	plat->setup = loongson_dwmac_setup;
 	ld->dev = &pdev->dev;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 1637c8139b9d..b7adda35b7b7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -155,9 +155,9 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 {
 	struct stmmac_pci_info *info = (struct stmmac_pci_info *)id->driver_data;
 	struct plat_stmmacenet_data *plat;
-	struct stmmac_resources res;
-	int i;
+	struct stmmac_resources res = {};
 	int ret;
+	int i;
 
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
@@ -188,13 +188,13 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 		return ret;
 	}
 
-	/* Get the base address of device */
+	/* The first BAR > 0 is the base IO addr of our device. */
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
 		if (pci_resource_len(pdev, i) == 0)
 			continue;
-		ret = pcim_iomap_regions(pdev, BIT(i), pci_name(pdev));
-		if (ret)
-			return ret;
+		res.addr = pcim_iomap_region(pdev, i, STMMAC_RESOURCE_NAME);
+		if (IS_ERR(res.addr))
+			return PTR_ERR(res.addr);
 		break;
 	}
 
@@ -204,8 +204,6 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	memset(&res, 0, sizeof(res));
-	res.addr = pcim_iomap_table(pdev)[i];
 	res.wol_irq = pdev->irq;
 	res.irq = pdev->irq;
 
-- 
2.48.1


