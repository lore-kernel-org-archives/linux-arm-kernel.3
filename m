Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E544D26D9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAr/RTwFdI/n17NQTilAA9plvAuucIrYO1NdnIyI/jQ=; b=XAg+0AsmrjORj0KzyPkzaluVDn
	AvJyVj1O4xsrPSIPXKqxKIMZPXKYtOlpFhxDuLFRddmZYEcMfEpGJRFhAeo8us4nqjiLdmSy/6age
	ldlC7EsWEzliyZAq48Vj5pruM5CSQSpvCaAPh+CxYbMC6Xu0geBmPEXg3fJRTey1phrC6h8RhBI+y
	0d8iwDqsK5X/dnA5RWV730k2Svy68ppN5AsFsCEAKZTgUWvOhobCnl8cZL4ZPNFZ0tOJrH9A2/d8b
	ofVkQAz1h/4kgX27xz2krc9ufOjR0s9fa7d4O/avt7gfM9ukrtx6Bre3P8qvAccSmFPRNHEzRe9+1
	jaOmwx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEiy-000000057Cz-2VxS;
	Mon, 12 Jan 2026 10:00:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEiw-000000057BK-2T5S;
	Mon, 12 Jan 2026 10:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BAF1D60159;
	Mon, 12 Jan 2026 10:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB90C19421;
	Mon, 12 Jan 2026 10:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768212033;
	bh=CgzpiGNDQQYwMb8Boz7j9vAMoVu8m4Blj3bLoDD9GuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tqAo3oQWNCAZMZkpbs9QUnJXJJ9y+ef2pDO5pwwPzuD4k8I08PHkyhHbKoVWbO227
	 O+cu204k2KOg+ia9SWkjfn+NbK4E6CL4RY1af82Koi9yRV6vtqOX62g+AEwFbRdjOT
	 Di3yjh+J2XB1foj86YY8RNqj5lapG7EWZhazttPc//+NIesZLSajWh+u86RDr1FIAN
	 +NW4z6zVwa5/uQ/6b4HjZlQfymUC38zkt0gdnn9j/tXjAaDfc5QCwEPP67S6am/lYt
	 fxo9iKi3b5bdjDHeD4t71bUE7KhtGJhz7CmGhqTjNlmJUeb+w6lLiolvhzgLr/ytet
	 jxhoVWrGvprng==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 12 Jan 2026 11:00:08 +0100
Subject: [PATCH net-next 2/2] net: airoha: npu: Add the capability to read
 firmware names from dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-airoha-npu-firmware-name-v1-2-d0b148b6710f@kernel.org>
References: <20260112-airoha-npu-firmware-name-v1-0-d0b148b6710f@kernel.org>
In-Reply-To: <20260112-airoha-npu-firmware-name-v1-0-d0b148b6710f@kernel.org>
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

Introduce the capability to read the firmware binary names from device-tree
using the firmware-name property if available.
This is a preliminary patch to enable NPU offloading for MT7996 (Eagle)
chipset since it requires a different binary with respect to the one
used for MT7992 on the EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 42 +++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 22f72c146065998d5450477f664ed308b1569aa3..bba30582787babd77083c7456349f0af76afc505 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -195,18 +195,18 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 }
 
 static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
-				    const struct airoha_npu_fw *fw_info)
+				    const char *fw_name, int fw_max_size)
 {
 	const struct firmware *fw;
 	int ret;
 
-	ret = request_firmware(&fw, fw_info->name, dev);
+	ret = request_firmware(&fw, fw_name, dev);
 	if (ret)
 		return ret == -ENOENT ? -EPROBE_DEFER : ret;
 
-	if (fw->size > fw_info->max_size) {
+	if (fw->size > fw_max_size) {
 		dev_err(dev, "%s: fw size too overlimit (%zu)\n",
-			fw_info->name, fw->size);
+			fw_name, fw->size);
 		ret = -E2BIG;
 		goto out;
 	}
@@ -218,6 +218,28 @@ static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
 	return ret;
 }
 
+static int
+airoha_npu_load_firmware_from_dts(struct device *dev, void __iomem *addr,
+				  void __iomem *base)
+{
+	const char *fw_names[2];
+	int ret;
+
+	ret = of_property_read_string_array(dev->of_node, "firmware-name",
+					    fw_names, ARRAY_SIZE(fw_names));
+	if (ret != ARRAY_SIZE(fw_names))
+		return -EINVAL;
+
+	ret = airoha_npu_load_firmware(dev, addr, fw_names[0],
+				       NPU_EN7581_FIRMWARE_RV32_MAX_SIZE);
+	if (ret)
+		return ret;
+
+	return airoha_npu_load_firmware(dev, base + REG_NPU_LOCAL_SRAM,
+					fw_names[1],
+					NPU_EN7581_FIRMWARE_DATA_MAX_SIZE);
+}
+
 static int airoha_npu_run_firmware(struct device *dev, void __iomem *base,
 				   struct resource *res)
 {
@@ -233,14 +255,22 @@ static int airoha_npu_run_firmware(struct device *dev, void __iomem *base,
 	if (IS_ERR(addr))
 		return PTR_ERR(addr);
 
+	/* Try to load firmware images using the firmware names provided via
+	 * dts if available.
+	 */
+	if (of_find_property(dev->of_node, "firmware-name", NULL))
+		return airoha_npu_load_firmware_from_dts(dev, addr, base);
+
 	/* Load rv32 npu firmware */
-	ret = airoha_npu_load_firmware(dev, addr, &soc->fw_rv32);
+	ret = airoha_npu_load_firmware(dev, addr, soc->fw_rv32.name,
+				       soc->fw_rv32.max_size);
 	if (ret)
 		return ret;
 
 	/* Load data npu firmware */
 	return airoha_npu_load_firmware(dev, base + REG_NPU_LOCAL_SRAM,
-					&soc->fw_data);
+					soc->fw_data.name,
+					soc->fw_data.max_size);
 }
 
 static irqreturn_t airoha_npu_mbox_handler(int irq, void *npu_instance)

-- 
2.52.0


