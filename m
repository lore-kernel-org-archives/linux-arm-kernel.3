Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B31CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+ZH3pbKJzgQuL6QnKATr6OafkTPOMr9HqWaVe0b6Lg=; b=bXOm9B+a5s87oxQFP82TSmf8p4
	LzujKOIiMazo023wRq6CNqZ2IC5uL6mfTpq9qzKQAC/Ffm68jD6gqbxrRZmeUCotBmpxHpbA2bP0b
	7KSa63LREO835OE31NNEnO7KJrflSaEKEMX3kIuLaP9lwD7/Rhbgz38/VmM5LUb8E8LZ26HFczJFa
	wgB0npNTfDXGuBAA7nkCw5oJ5hubsDYJC/vj+3gPbUNlS0bLKXTkbXvmjH87b4vsxKJss7ntVkW27
	VBtsrIO3G8erwdXTt51gKNbnod2dktiaAAS+aoPXb5eAiEVrkwleAn8Df1fONZc0hMqja8TIvC/H6
	lYIqSByg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8J55-0000000DHxn-07Ar;
	Mon, 13 Oct 2025 13:59:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8J52-0000000DHuS-1svf;
	Mon, 13 Oct 2025 13:59:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA385601B3;
	Mon, 13 Oct 2025 13:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31848C4CEE7;
	Mon, 13 Oct 2025 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760363955;
	bh=oZNjK/4YkXKBAfZRaTcNP360qMktPQ4k62wG/OV1jdU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=noLXfYUqov7kgy69TSXL7G6kG2c4qvcLuUMXXu1jzjL2XdgNnjDVDcniLgVRNu8pc
	 9+on7K09Fbf4oeez2zti51VhOEnm6GJuEHIDFEgKH9RT28fyDHLgT4SbJfx7n8tkJQ
	 VN8NoD8DJDPHjJprFk2JBRshTysqyaWbvTI8+BBFRJyIz0+a7Ovbw+IENn1PYSSUqY
	 o0g4rUB9dxoYK7yEIfSg623aaAua1ceLh05gXkDoczNQ9pgiIQCxXa62SxJtuZdH7C
	 zPlljImBs+7Bl7QWFUT7vdsr8TQvsvPlu1C6dGU8FRlRp3VWZu/cdS6dIAouUDhlP1
	 NYkf+a4ucNzdQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 13 Oct 2025 15:58:50 +0200
Subject: [PATCH net-next v3 2/3] net: airoha: npu: Add airoha_npu_soc_data
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-airoha-npu-7583-v3-2-00f748b5a0c7@kernel.org>
References: <20251013-airoha-npu-7583-v3-0-00f748b5a0c7@kernel.org>
In-Reply-To: <20251013-airoha-npu-7583-v3-0-00f748b5a0c7@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
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

Introduce airoha_npu_soc_data structure in order to generalize per-SoC
NPU firmware info. Introduce airoha_npu_load_firmware utility routine.
This is a preliminary patch in order to introduce AN7583 NPU support.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 77 +++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 8c883f2b2d36b74053282bc299f0a0572b2e0e71..41944cc5f6b062129528e9357511fd9e05cbe1e6 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -103,6 +103,16 @@ enum {
 	QDMA_WAN_PON_XDSL,
 };
 
+struct airoha_npu_fw {
+	const char *name;
+	int max_size;
+};
+
+struct airoha_npu_soc_data {
+	struct airoha_npu_fw fw_rv32;
+	struct airoha_npu_fw fw_data;
+};
+
 #define MBOX_MSG_FUNC_ID	GENMASK(14, 11)
 #define MBOX_MSG_STATIC_BUF	BIT(5)
 #define MBOX_MSG_STATUS		GENMASK(4, 2)
@@ -182,49 +192,53 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	return ret;
 }
 
-static int airoha_npu_run_firmware(struct device *dev, void __iomem *base,
-				   struct resource *res)
+static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
+				    const struct airoha_npu_fw *fw_info)
 {
 	const struct firmware *fw;
-	void __iomem *addr;
 	int ret;
 
-	ret = request_firmware(&fw, NPU_EN7581_FIRMWARE_RV32, dev);
+	ret = request_firmware(&fw, fw_info->name, dev);
 	if (ret)
 		return ret == -ENOENT ? -EPROBE_DEFER : ret;
 
-	if (fw->size > NPU_EN7581_FIRMWARE_RV32_MAX_SIZE) {
+	if (fw->size > fw_info->max_size) {
 		dev_err(dev, "%s: fw size too overlimit (%zu)\n",
-			NPU_EN7581_FIRMWARE_RV32, fw->size);
+			fw_info->name, fw->size);
 		ret = -E2BIG;
 		goto out;
 	}
 
-	addr = devm_ioremap_resource(dev, res);
-	if (IS_ERR(addr)) {
-		ret = PTR_ERR(addr);
-		goto out;
-	}
-
 	memcpy_toio(addr, fw->data, fw->size);
+out:
 	release_firmware(fw);
 
-	ret = request_firmware(&fw, NPU_EN7581_FIRMWARE_DATA, dev);
-	if (ret)
-		return ret == -ENOENT ? -EPROBE_DEFER : ret;
+	return ret;
+}
 
-	if (fw->size > NPU_EN7581_FIRMWARE_DATA_MAX_SIZE) {
-		dev_err(dev, "%s: fw size too overlimit (%zu)\n",
-			NPU_EN7581_FIRMWARE_DATA, fw->size);
-		ret = -E2BIG;
-		goto out;
-	}
+static int airoha_npu_run_firmware(struct device *dev, void __iomem *base,
+				   struct resource *res)
+{
+	const struct airoha_npu_soc_data *soc;
+	void __iomem *addr;
+	int ret;
 
-	memcpy_toio(base + REG_NPU_LOCAL_SRAM, fw->data, fw->size);
-out:
-	release_firmware(fw);
+	soc = of_device_get_match_data(dev);
+	if (!soc)
+		return -EINVAL;
 
-	return ret;
+	addr = devm_ioremap_resource(dev, res);
+	if (IS_ERR(addr))
+		return PTR_ERR(addr);
+
+	/* Load rv32 npu firmware */
+	ret = airoha_npu_load_firmware(dev, addr, &soc->fw_rv32);
+	if (ret)
+		return ret;
+
+	/* Load data npu firmware */
+	return airoha_npu_load_firmware(dev, base + REG_NPU_LOCAL_SRAM,
+					&soc->fw_data);
 }
 
 static irqreturn_t airoha_npu_mbox_handler(int irq, void *npu_instance)
@@ -597,8 +611,19 @@ void airoha_npu_put(struct airoha_npu *npu)
 }
 EXPORT_SYMBOL_GPL(airoha_npu_put);
 
+static const struct airoha_npu_soc_data en7581_npu_soc_data = {
+	.fw_rv32 = {
+		.name = NPU_EN7581_FIRMWARE_RV32,
+		.max_size = NPU_EN7581_FIRMWARE_RV32_MAX_SIZE,
+	},
+	.fw_data = {
+		.name = NPU_EN7581_FIRMWARE_DATA,
+		.max_size = NPU_EN7581_FIRMWARE_DATA_MAX_SIZE,
+	},
+};
+
 static const struct of_device_id of_airoha_npu_match[] = {
-	{ .compatible = "airoha,en7581-npu" },
+	{ .compatible = "airoha,en7581-npu", .data = &en7581_npu_soc_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_airoha_npu_match);

-- 
2.51.0


