Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DCFCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5fdPOWSvNarorap652JcfE6qoTaYsa4hrEs1QGGG9M=; b=mo2H09DwvTs0nMU2OU1lfK43hm
	1kh/WPkcGIJQiGaAtGRDaVn6QMZYPUTYz85Bqv4jDgLWaFTfFi+cZFfcFo7rN6qzgjxd5p9NDYINM
	RnoGowfDDnlOaoJVRooFWOZccoG1dUPIMAGkxQTOWrNJA2o5N0nkIneum728x9fe/V+gLtM79iPFg
	+v2t2+q+BYdKfzO9PQ62NGFPLHiGIi7CKBrXWvkGzjF8LZMS4NMUWfT9gDzeb5TvO1zCLGhfxbyGI
	alreWlnBBPOtWYHlHooHz/Vf8K7q/L6/1AmIJVTxn3gjEff6rqkPLeaiNFPP+W8QvKnKShsVjGB4L
	QGRfGDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Abr-00000002XJp-1HA0;
	Fri, 26 Sep 2025 15:43:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Abj-00000002XCx-2hHx;
	Fri, 26 Sep 2025 15:43:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4725F43DC8;
	Fri, 26 Sep 2025 15:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD884C4CEF7;
	Fri, 26 Sep 2025 15:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758901419;
	bh=kpbuVipwR3UDHudSxLrP3Qb2ukZs0ZVbkYJ/4xwHids=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I+Ldgd1mdt2RuSctsDUVZw9rhRj7eWwTc898dlk2xpIf1bwRMu41LDOgNZOs0zfL4
	 zhO8GfwHD6ENdNuBXG4oc/K0l9G75MJArzWz2Qe+Wfb7193r9IRDR/YL7jpQ8Jz81A
	 TI+s8FZyrzRyJp1en0wrPRBRNha7e31/zIKuAd1jGLs+baP865THTl+bFyhBtnvIxQ
	 lCWGrsNR92h8Ra/DLUoEOZn6vTaiNepKC5rQVUenY7nxNZt2+ke2uNUx7+JAC6m78Q
	 3FYj3TzhfwYtJ7R0WysX3ygnffOlXi+66Zwkn6fzhl4yji0XZAO8qH4KFuR/n3JuxJ
	 Ret3miDarOazw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 26 Sep 2025 17:43:23 +0200
Subject: [PATCH net-next 2/2] net: airoha: npu: Add 7583 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-airoha-npu-7583-v1-2-447e5e2df08d@kernel.org>
References: <20250926-airoha-npu-7583-v1-0-447e5e2df08d@kernel.org>
In-Reply-To: <20250926-airoha-npu-7583-v1-0-447e5e2df08d@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_084339_743936_A6EC34AE 
X-CRM114-Status: GOOD (  11.89  )
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

Introduce support for Airoha 7583 SoC NPU selecting proper firmware images.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index e1d131d6115c10b40a56b63427eec59ea587d22a..fee611666aa0debf77165d9b10abecceb756ea97 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -16,6 +16,8 @@
 
 #define NPU_EN7581_FIRMWARE_DATA		"airoha/en7581_npu_data.bin"
 #define NPU_EN7581_FIRMWARE_RV32		"airoha/en7581_npu_rv32.bin"
+#define NPU_AN7583_FIRMWARE_DATA		"airoha/an7583_npu_data.bin"
+#define NPU_AN7583_FIRMWARE_RV32		"airoha/an7583_npu_rv32.bin"
 #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
 #define NPU_EN7581_FIRMWARE_DATA_MAX_SIZE	0x10000
 #define NPU_DUMP_SIZE				512
@@ -186,10 +188,15 @@ static int airoha_npu_run_firmware(struct device *dev, void __iomem *base,
 				   struct resource *res)
 {
 	const struct firmware *fw;
+	const char *fw_name;
 	void __iomem *addr;
 	int ret;
 
-	ret = request_firmware(&fw, NPU_EN7581_FIRMWARE_RV32, dev);
+	if (of_device_is_compatible(dev->of_node, "airoha,an7583-npu"))
+		fw_name = NPU_AN7583_FIRMWARE_RV32;
+	else
+		fw_name = NPU_EN7581_FIRMWARE_RV32;
+	ret = request_firmware(&fw, fw_name, dev);
 	if (ret)
 		return ret == -ENOENT ? -EPROBE_DEFER : ret;
 
@@ -209,7 +216,11 @@ static int airoha_npu_run_firmware(struct device *dev, void __iomem *base,
 	memcpy_toio(addr, fw->data, fw->size);
 	release_firmware(fw);
 
-	ret = request_firmware(&fw, NPU_EN7581_FIRMWARE_DATA, dev);
+	if (of_device_is_compatible(dev->of_node, "airoha,an7583-npu"))
+		fw_name = NPU_AN7583_FIRMWARE_DATA;
+	else
+		fw_name = NPU_EN7581_FIRMWARE_DATA;
+	ret = request_firmware(&fw, fw_name, dev);
 	if (ret)
 		return ret == -ENOENT ? -EPROBE_DEFER : ret;
 
@@ -612,6 +623,7 @@ EXPORT_SYMBOL_GPL(airoha_npu_put);
 
 static const struct of_device_id of_airoha_npu_match[] = {
 	{ .compatible = "airoha,en7581-npu" },
+	{ .compatible = "airoha,an7583-npu" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_airoha_npu_match);
@@ -749,6 +761,8 @@ module_platform_driver(airoha_npu_driver);
 
 MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_DATA);
 MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_RV32);
+MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_DATA);
+MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_RV32);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_DESCRIPTION("Airoha Network Processor Unit driver");

-- 
2.51.0


