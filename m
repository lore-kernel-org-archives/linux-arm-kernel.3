Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38084C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Of2AhLtRWdRKZXYsSJ8WhmFDOJCmc6e61ElVarvEe/E=; b=t7Cd0NB+S4f/UxiTvi3EFzUJNS
	UXPIB9KZdtni5EGYgTIoFTeGjH4My6osldqkhjHxhML+vmSCF0lThNp2m7r1mKmQgoBHumSzNv1ww
	i74axaelBwxSvERWxjRF9pli21o5ku/DYJXObbq/n6aKC0vq9O1oEk7sPM9vohxdd19yz+vQb+J0I
	sYrJ+3N5oLrMUfn9VHOzL6cEI9n1anqLvdxjBCytjPCeWFnTeFHHiP1kblYMOV7Br31ZJUs+UEaQc
	O+ItrvTuRs4ETI0asgKNI8SMrUViNfSFMjvyIuhYYoK1qrLQQLGwhfQvJoavj+wz4laj5dmYcL4Jq
	l991j4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZOT-0000000E5Rq-3nSM;
	Mon, 24 Feb 2025 14:25:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYu6-0000000DyyM-1coV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:53:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8DB15C57F4;
	Mon, 24 Feb 2025 13:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC87FC4CEEE;
	Mon, 24 Feb 2025 13:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740405229;
	bh=6AJEKimFGREFIv6dQXE7i5boQezEtjb7GqUPTRe+6Ac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D7Eg3/ShhVOZNOsWWOj84nY2fquvYuZpUvYenGvAUgmhWX+mAYZmO8am9h6dT564f
	 qWxqcrxt8f5SmxaXCrtJA/Kr+reZx49QhlqCD5oERYLLmTZ6LohaoUS4hHIcZUO3xr
	 j7yPRbs6Q+cmjY8fpLQqppHnIi+5rjc68Ml18F0WSPZTRXLlE4GXBuUliqg8dh0VOW
	 c7PvPlDqqHCh+x8e+beLjNp/mb5IGNQBuHJcYEVu8W7gqfy18bq4TvJbjCL3+Q++MA
	 bqUta3GptmlhDmQiKV7euT29ujamO7V/lxBE0BLojb7usecjMaVMC6jq6tY/oIMDZE
	 MvATDSRqbdLbw==
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
	Yinggang Gu <guyinggang@loongson.cn>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Philipp Stanner <pstanner@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Qing Zhang <zhangqing@loongson.cn>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 4/4] stmmac: Replace deprecated PCI functions
Date: Mon, 24 Feb 2025 14:53:22 +0100
Message-ID: <20250224135321.36603-6-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224135321.36603-2-phasta@kernel.org>
References: <20250224135321.36603-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_055350_509486_594D4A3B 
X-CRM114-Status: GOOD (  15.32  )
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
---
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   | 11 ++++-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   | 14 ++++++--------
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index f3ea6016be68..25ef7b9c5dce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -521,10 +521,10 @@ static int loongson_dwmac_acpi_config(struct pci_dev *pdev,
 static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	struct plat_stmmacenet_data *plat;
+	struct stmmac_resources res = {};
 	struct stmmac_pci_info *info;
-	struct stmmac_resources res;
 	struct loongson_data *ld;
-	int ret, i;
+	int ret;
 
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
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
@@ -603,7 +601,6 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
 	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	struct loongson_data *ld;
-	int i;
 
 	ld = priv->plat->bsp_priv;
 	stmmac_dvr_remove(&pdev->dev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 91ff6c15f977..37fc7f55a7e4 100644
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


