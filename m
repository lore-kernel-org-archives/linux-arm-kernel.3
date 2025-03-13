Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087D7C35FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cI6/VqAKS6bNAbXHyOHCcczT5Asj3Fz4fGJcj+TDuCY=; b=CWt5lG4Ri2bFZto59+pR+7n4Zw
	lyh75NBQzQZpwHRGFlPWHCcQTnw4SmbQszbul5rgB2l61bIgpgXZyL0YgdtMrUesTnk/Cnj+DqG1J
	XoQIU+8dihMZSBwE7qFjXwGzqOvlMOLOu5Y3nEex1HL40ItDPtBzkug3RWDvuyU7opOeVkJClY285
	G+i9yTdPa/oMCub1qzjCkUDwqVVsSCXBFlLI//jqt5Lt6825hDcnteY6vSDCZuWNMcsI1el9J6Q1q
	/JDYO56bubZb8EM3WA1vSLrz2f8rqR/3jiR6cuyyP57tCvtp98EoSjnR3KupsBk/FxoIUZQevH0mH
	xjO5PNeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm8W-0000000BwmR-2FUW;
	Thu, 13 Mar 2025 17:14:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslCj-0000000Bmq1-3sEF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 16:14:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C94EA46745;
	Thu, 13 Mar 2025 16:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4906EC4CEEE;
	Thu, 13 Mar 2025 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741882480;
	bh=XHzsxcNRyzu969GVfBaBMQi0w2xQRXFs1QAQkqGdpgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LlpPk8S1uGh9d6LTFPnY1jA7rpW3bHVSbItI+9C8P5cs7ggGtYxf5Yaf9t/QbkwgD
	 t8x08DBY943XhQZDV0ch9NDCFaDhT20Ev7EZgb9YDzlwGJ0lDEgWXnwYDkBhCPXwz8
	 xRB9VHHS3voN+uQysbf7LO1Zs+nCu6xGHKXKudMCgz8PHd0Uo7pUlmDVtIHpZoNen9
	 AfFXusG6JUv39qIui9pjsw/h8yMM6+/ETJ8Y98s/kGiRkcuDgtJoZvK1YsyBZyBJIX
	 T6bJ13b4KsWm55FEbyZt6ilgkSO47piInHLEGhzEPw4F0wOCyGKwkT/0m+sZpyhwVK
	 +sMwlNKHGVf8A==
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
	Philipp Stanner <phasta@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Henry Chen <chenx97@aosc.io>
Subject: [PATCH net-next 1/3] stmmac: loongson: Remove surplus loop
Date: Thu, 13 Mar 2025 17:14:21 +0100
Message-ID: <20250313161422.97174-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313161422.97174-2-phasta@kernel.org>
References: <20250313161422.97174-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_091442_020910_C1CBED48 
X-CRM114-Status: GOOD (  13.37  )
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
---
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c    | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 73a6715a93e6..e2959ac5c1ca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -524,7 +524,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	struct stmmac_pci_info *info;
 	struct stmmac_resources res;
 	struct loongson_data *ld;
-	int ret, i;
+	int ret;
 
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
@@ -554,14 +554,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
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


