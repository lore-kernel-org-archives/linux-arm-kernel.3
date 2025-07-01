Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6849C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 23:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z10SMXD73TdJWAj2OJDOUnG00bjIHtCClg4rnkIGpPI=; b=J9tU4ek4SSZP4IYv6WqHVDyBFR
	bzmCgaOWq36o+cncPcYYqPjrhGcmpNqvotXtRLzAenmrOq/uGX6E6QmMZXdx2eNPhKMA+zDHMHMn4
	zk2/kiUr6EAUg61Nhg25WljBIXA3YNkBehAsKHZgBvUf/eSbFn5QxebpksILd+J35+OX393mXJG8P
	+kT42Yjl/T9fPqgTxxHdTS/73+CO8Y7Ahw00fwrn76pzlZ6CAIqmLdyzgCieoY/q386q5UPLg+HBJ
	qvTABElvO6KIXPCUn8Y0D3Jooy+F3GgkI0MqlwArgt7pD0h41Afmv9KOieAJFEyPVu+cCjaUsosIa
	QiHc5+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWk1I-00000006pBG-3X1z;
	Tue, 01 Jul 2025 23:04:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjOc-00000006mFN-1mgS;
	Tue, 01 Jul 2025 22:24:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C54CCA52C3F;
	Tue,  1 Jul 2025 22:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C58DC4CEEB;
	Tue,  1 Jul 2025 22:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751408649;
	bh=xKLHQDg56Z1k+PJMz2yNnsr2Wa6oxMXBF2BQJ2yofR0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PKQRLMrYU+laDZ7oJqWcZvLSzE7IppRRf8k15Rhi+goIrjgzEKQVB1lOMzenTTPtR
	 Xz8BrTvFxqUHYYUoxhAbME9lWzYa8APTY5S2DhGYJky83yJ2mhxiChdl7AqXTUtGpn
	 5jFH/TyycllaDANjCKcI8xczPV0qg2ukRF+B5/Q19L0RxXhYSfEPdh+jzV6uii7nd0
	 sItnty3JWOUqErewFLwUACs5O+DMSxHP/+2jO0AB2bIVr5e8TJ25OjtLUCbBWTJh33
	 VHmJA2XhJS0bbwnXKLxhWlwi4v+PRo/j9Il8+8wq2JtH884k+26iZrbnWvxsbK4UQX
	 HJjXRCWKiVc7A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 02 Jul 2025 00:23:33 +0200
Subject: [PATCH net-next 4/6] net: airoha: npu: Read NPU interrupt lines
 from the DTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-airoha-en7581-wlan-offlaod-v1-4-803009700b38@kernel.org>
References: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
In-Reply-To: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_152410_529455_3B64E0C9 
X-CRM114-Status: GOOD (  14.02  )
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

Read all NPU supported IRQ lines from NPU device-tree node.
This is a preliminary patch to enable wlan flowtable offload for EN7581
SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 8 ++++++++
 drivers/net/ethernet/airoha/airoha_npu.h | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 7d552ab7f692ba0f720e4fef89082e6ab233d809..1cf431469ca034bbaeb922fed3ebdab41aafef05 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -848,6 +848,14 @@ static int airoha_npu_probe(struct platform_device *pdev)
 		INIT_WORK(&core->wdt_work, airoha_npu_wdt_work);
 	}
 
+	for (i = 0; i < ARRAY_SIZE(npu->irqs); i++) {
+		irq = platform_get_irq(pdev, i + ARRAY_SIZE(npu->cores) + 1);
+		if (irq < 0)
+			return irq;
+
+		npu->irqs[i] = irq;
+	}
+
 	err = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
 	if (err)
 		return err;
diff --git a/drivers/net/ethernet/airoha/airoha_npu.h b/drivers/net/ethernet/airoha/airoha_npu.h
index 23318b708f81eacc11753f54350ae33ea83a11ee..19cfc6b7fb52f4a176d91c7b39383b4c3e13d777 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.h
+++ b/drivers/net/ethernet/airoha/airoha_npu.h
@@ -5,6 +5,7 @@
  */
 
 #define NPU_NUM_CORES		8
+#define NPU_NUM_IRQ		6
 
 struct airoha_npu {
 	struct device *dev;
@@ -17,6 +18,8 @@ struct airoha_npu {
 		struct work_struct wdt_work;
 	} cores[NPU_NUM_CORES];
 
+	int irqs[NPU_NUM_IRQ];
+
 	struct airoha_foe_stats __iomem *stats;
 
 	struct {

-- 
2.50.0


