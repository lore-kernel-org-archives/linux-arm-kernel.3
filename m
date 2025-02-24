Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DE2C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTEQQqljKeGVF7x1CO69On80OOaaJlEriisuCSbuG0s=; b=wq1RQ/V5XOCzaM7Ms2TIX9PQwM
	8a3PREo1Th9EJ6STFhPqKcPuJ2iUm6TPTFnHR/xMUL8Fuf/9VBdV2QObtjL5E676oV1FstuuJwPyY
	xtmZJEotQ3L1+uCB2pK/WBI3IGfEPe83drt3WbgGkLydEftjIPhWMqtpAlubWufvZSG67Y/PGmTw6
	l9TAtg8bEtK6HCeOamfxTYadwJqQzSwu9xys9iLozpKMWOuVoF2EkItlKT1qoUrDamc7KHWqtfCaO
	7c7vv5r8rYVqGL1AMC3eN1LnfrXgT1hUMtycq6RS6A59pUIQoSR5yoTuPAc8U4WNsoFGNW5XAe9Nm
	+KHIy9/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZIe-0000000E4JY-16IQ;
	Mon, 24 Feb 2025 14:19:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYtu-0000000Dyte-0rZ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A44655C56B9;
	Mon, 24 Feb 2025 13:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72245C4CED6;
	Mon, 24 Feb 2025 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740405217;
	bh=6P8m8bVx+JzTIQzT+IMsyVq8vQFZmn0P+wFQph1uxrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YPbo1OhMtjDcn+xXqfpJq64mkI0wdd7zDpUSFRVcLW1noFvsCWBJdvT0W86vzEAC7
	 ayR9BPBZI6XNWuJV5daUMmilifpzmi6OeUoMzjrh6AnsJjVFJCv2NyObrTWX/UizLA
	 N0fAt+7IJmoY7JA/h0e/8KvF7CFopYteZQaIEnJ1iuiEadLjDeByTAWpV4P8cGfFP5
	 9SiGHnuSZR/vCuGnxXTh5aqgW4NqNlEKI1Ufg5wduBHtsVUrWk4mvz1AmqnIs4uMGY
	 sZy7tzTf+0DUG6LOx2tBIPVCLwfZ5wjwcaz4G/zg5jyuHru4BBYYWQ3j9dYKiec5Oh
	 883uH/cqgSLqA==
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
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH net-next v3 1/4] stmmac: loongson: Pass correct arg to PCI function
Date: Mon, 24 Feb 2025 14:53:19 +0100
Message-ID: <20250224135321.36603-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224135321.36603-2-phasta@kernel.org>
References: <20250224135321.36603-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_055338_306265_6AE8B303 
X-CRM114-Status: GOOD (  13.74  )
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

pcim_iomap_regions() should receive the driver's name as its third
parameter, not the PCI device's name.

Define the driver name with a macro and use it at the appropriate
places, including pcim_iomap_regions().

Cc: stable@vger.kernel.org # v5.14+
Fixes: 30bba69d7db4 ("stmmac: pci: Add dwmac support for Loongson")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index bfe6e2d631bd..73a6715a93e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -11,6 +11,8 @@
 #include "dwmac_dma.h"
 #include "dwmac1000.h"
 
+#define DRIVER_NAME "dwmac-loongson-pci"
+
 /* Normal Loongson Tx Summary */
 #define DMA_INTR_ENA_NIE_TX_LOONGSON	0x00040000
 /* Normal Loongson Rx Summary */
@@ -555,7 +557,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
 		if (pci_resource_len(pdev, i) == 0)
 			continue;
-		ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
+		ret = pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
 		if (ret)
 			goto err_disable_device;
 		break;
@@ -673,7 +675,7 @@ static const struct pci_device_id loongson_dwmac_id_table[] = {
 MODULE_DEVICE_TABLE(pci, loongson_dwmac_id_table);
 
 static struct pci_driver loongson_dwmac_driver = {
-	.name = "dwmac-loongson-pci",
+	.name = DRIVER_NAME,
 	.id_table = loongson_dwmac_id_table,
 	.probe = loongson_dwmac_probe,
 	.remove = loongson_dwmac_remove,
-- 
2.48.1


