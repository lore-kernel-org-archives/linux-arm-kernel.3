Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10739D29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fpM3Zwq4I2dFSo0LmL0MEsxC2tjXaGQ4SDx+DUwEmY=; b=ZpHD9jpeyFoEdnbOCailCvTSqc
	KQ3o1nj9uCrGBirtavys1crGWkTo/E1Q3BKkMe5UiDesMx6Wq8HatqlZmWHI9nZy4rc0owjF6Dy56
	AYKGopuSxsHbO6e0BQ3VIOT6gC2sTOOz9cQoiW/jAZg284MYAOLOmTdQwX9O+rx6c1tT0X4D14It0
	9j/r21ZaL3f7nabGtVCU76LEVed8qGBqkZSlFSCiUjcB21f0hU20ZU4AVDNPTtwS52o4opxxjcAdI
	TPHO9IPvSRPKWHqCJSx5dTw3HZmYcKv+TjYohj96NwgECxL0m0y9NUep1UxLDMK4IMEgvizl/NkcM
	4kYCc1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrFi-00000002MCa-3f0K;
	Mon, 19 Jan 2026 15:33:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrFe-00000002M9j-1rAs;
	Mon, 19 Jan 2026 15:33:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26F6940875;
	Mon, 19 Jan 2026 15:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73F6C116C6;
	Mon, 19 Jan 2026 15:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768836790;
	bh=g4EMvivv1KvxIoB75VdK85k1/A241u1GrwJWdxivwio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PkBDwgdv9OERseTv1EYRgeE2MbMydxZQgg7xGqK4FmbBRI3iVPeQXP5jgZt5693UW
	 BKZOdNtfxs5K/k/rDSUpDMhxmfdlITbCDRulDATWEOTulisaNVgRpOhnBF88C9S0GP
	 S+RZD2MYhMQlgNLEdDooww8IvivnW+Ff6UD3ADk35+mGhCTgv3/wjKR+Jsat6TIefy
	 0U6lEhH+V4gH2ODPVXIDnh+bMaXNykrQUPV4edwtgMuq9VSwH9KAuuPtzszmspHA5t
	 c4qJV+Gc3wjCWSgvYqMDhr0PfrJdcV70geOOKTvciwWGpO4uzmjAjOssqLvPE6WrhQ
	 gzfisnPOMuMaQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 19 Jan 2026 16:32:41 +0100
Subject: [PATCH net-next v3 2/2] net: airoha: npu: Add the capability to
 read firmware names from dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-airoha-npu-firmware-name-v3-2-cba88eed96cc@kernel.org>
References: <20260119-airoha-npu-firmware-name-v3-0-cba88eed96cc@kernel.org>
In-Reply-To: <20260119-airoha-npu-firmware-name-v3-0-cba88eed96cc@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_073310_700474_A16EC751 
X-CRM114-Status: GOOD (  17.74  )
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
This patch is needed because NPU firmware binaries are board specific since
they depend on the MediaTek WiFi chip used on the board (e.g. MT7996 or
MT7992) and the WiFi chip version info is not available in the NPU driver.
This is a preliminary patch to enable MT76 NPU offloading if the Airoha SoC
is equipped with MT7996 (Eagle) WiFi chipset.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 42 +++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index a56b3780bb627cc393b94210b6b5c72cc95baea3..d684e5cc8af2fbde3e274c6fa22c4336474092b5 100644
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


