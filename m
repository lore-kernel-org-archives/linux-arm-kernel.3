Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814AFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzg0Qq/qg3rAWPPeu5SKfOe56oxW2Nn9A9YqyPialNM=; b=DqdhZml2S0nbEtPhwGaGctzD/q
	jmcqPe7Qt2vsN1TfcW9V552RDZcvyFCQ/ftFNVkCeFfLBR6P4QPO3GRodU72ljPiYsSipO4/hYLg0
	6pwS37tqrIH8lC9VujP303RZWtkSwClKvc/rNfamV5suybdbodQuBGZYPB5j0m5fjf8IVxm6CoauV
	lef2cCknpoL3PAhEhsmkHpa430kazZXoUsdKVG/3SKhIdiCyjZPiWQWJ1aHJMSx5f27vTdNmVh43f
	pAZZyMxoHM/JA2+pkkpgFNiaKK6FBDzZOtcbp1W7aHGdVNY7coc0JkLMr2tGzsPTNnWFTumUAKPOw
	NgNjNhrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFBl-00000007z6X-14eA;
	Wed, 12 Feb 2025 16:02:13 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiExx-00000007v0F-0ckK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:47:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9D8E4416D;
	Wed, 12 Feb 2025 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739375275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pzg0Qq/qg3rAWPPeu5SKfOe56oxW2Nn9A9YqyPialNM=;
	b=VF1tRokkMyYEImLEJmyns1eZ/pyOaOenK0thWrf3WKZUnX7m6bocLhQmT6MaEE+50BN04X
	H7wF4kSvWSU4qqrhcvGJPRQyK/CdyZqtz6G565ULf15yMLQ4x5kOIsK1bCR1BUDcxvY7tn
	X7aDXor5zyiTClB/CwIUHN6QbZwLFN2JEh5vmdJXAAZhnAwC+Ainh5ymHEU/pp91+k1Va3
	a06eAJ5VT/JAxVcdqUswFl2KVfI62qoWwRZXfTTa3F1zFEwiuj2l8wdA3vS0HewTIBOx1V
	PyZZKRbSII74xNgW2TE12C0eQZOaK+kGuc4mNDod2JV6deRMtiCNHO9T9API2w==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Wed, 12 Feb 2025 16:46:27 +0100
Subject: [PATCH 08/12] wifi: wilc1000: add basic functions to allow
 bluetooth bringup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250212-wilc3000_bt-v1-8-9609b784874e@bootlin.com>
References: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
In-Reply-To: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Kalle Valo <kvalo@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Marek Vasut <marex@denx.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgefhlefhveelgfefgfduudduuedvtdevkefgtdeffeduueevffevleevhfejueegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrv
 ggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehluhhiiidruggvnhhtiiesghhmrghilhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_074757_469063_938E6B8D 
X-CRM114-Status: GOOD (  27.59  )
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

Despite using a dedicated uart bus as main interface for bluetooth
operations, WILC3000 needs some initialization to be done over the wlan
bus (either SPI or SDIO) before being able to process HCI commands.
Those operations mostly consists in:
- some internal registers configuration
- a bluetooth firmware download
- bluetooth firmware start

Some of those operations also need to consider whether wlan is running
or not (eg: some coex registers need to be explicitly written if wlan
is not already running)

Add two set of APIs to fulfill those needs:
- two getters (one for sdio, one for spi) to allow retrieving an opaque
  handle on wilc structure
- some init/shutdown APIs, consuming this opaque wilc struct and
  actually performing the needed bluetooth initialization steps

The new code in charge of bluetooth initialization is driven by a
dedicated Kconfig, which will be selected by the new bluetooth driver
Kconfig coming in the next commits. The wilc driver then exposes a few
new functions to allow the future bluetooth driver to request the chip
initialization:
- wilc_<sdio|spi>_get_by_phandle : returns an opaque handle on the wilc
  structure
- wilc_bt_init: use the handle returned previously and request bluetooth
  initialization
- wilc_put: once done, give back the handle

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
The bluetooth init sequence is heavily inspired from Microchip
downstream kernel, see [1]. While the downstream kernel relies on user
to trigger the bluetooth init sequence (through a chardev), this version
is autonomous and supposed to be triggered by the actual bluetooth
driver in the next commits.

[1] https://github.com/linux4microchip/linux/blob/linux-6.6-mchp/drivers/net/wireless/microchip/wilc1000/bt.c
---
 drivers/net/wireless/microchip/wilc1000/Kconfig  |   3 +
 drivers/net/wireless/microchip/wilc1000/Makefile |   1 +
 drivers/net/wireless/microchip/wilc1000/bt.c     | 322 +++++++++++++++++++++++
 drivers/net/wireless/microchip/wilc1000/netdev.c |   9 +
 drivers/net/wireless/microchip/wilc1000/sdio.c   |  33 +++
 drivers/net/wireless/microchip/wilc1000/spi.c    |  25 ++
 drivers/net/wireless/microchip/wilc1000/wlan.h   |  17 ++
 include/net/wilc.h                               |  19 ++
 8 files changed, 429 insertions(+)

diff --git a/drivers/net/wireless/microchip/wilc1000/Kconfig b/drivers/net/wireless/microchip/wilc1000/Kconfig
index 62cfcdc9aacc007893db85840b5a3a8d11b7ac07..8e7b072a9882094d60ea0d8f85f9df171957cedb 100644
--- a/drivers/net/wireless/microchip/wilc1000/Kconfig
+++ b/drivers/net/wireless/microchip/wilc1000/Kconfig
@@ -46,3 +46,6 @@ config WILC1000_HW_OOB_INTR
 	  mechanism for SDIO host controllers that don't support SDIO interrupt.
 	  Select this option If the SDIO host controller in your platform
 	  doesn't support SDIO time division interrupt.
+
+config WILC_BT
+	bool
diff --git a/drivers/net/wireless/microchip/wilc1000/Makefile b/drivers/net/wireless/microchip/wilc1000/Makefile
index 9a2602b4a1494309ba06e4b553a8fc76a3f5433e..4eb510eedd91e92932e4d611b16a6088d3e3b987 100644
--- a/drivers/net/wireless/microchip/wilc1000/Makefile
+++ b/drivers/net/wireless/microchip/wilc1000/Makefile
@@ -9,6 +9,7 @@ wilc1000-objs := \
 	wlan.o \
 	wlan_cfg.o
 
+wilc1000-$(CONFIG_WILC_BT) += bt.o
 
 obj-$(CONFIG_WILC1000_SDIO) += wilc1000-sdio.o
 wilc1000-sdio-objs += sdio.o
diff --git a/drivers/net/wireless/microchip/wilc1000/bt.c b/drivers/net/wireless/microchip/wilc1000/bt.c
new file mode 100644
index 0000000000000000000000000000000000000000..b0f68a5479a5bd6f70e2390a35512037dc6c332b
--- /dev/null
+++ b/drivers/net/wireless/microchip/wilc1000/bt.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dev_printk.h>
+#include <linux/mutex.h>
+#include <linux/firmware.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <net/wilc.h>
+#include "netdev.h"
+#include "wlan_if.h"
+#include "wlan.h"
+
+#define	FW_WILC3000_BLE		"mchp/wilc3000_ble_firmware.bin"
+
+static int wilc_bt_power_down(struct wilc *wilc)
+{
+	int ret;
+
+	acquire_bus(wilc, WILC_BUS_ACQUIRE_AND_WAKEUP);
+
+	ret = wilc->hif_func->hif_rmw_reg(wilc, GLOBAL_MODE_CONTROL, BIT(1), 0);
+	if (ret) {
+		dev_err(wilc->dev, "Failed to disable BT mode\n");
+		release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+		return ret;
+	}
+
+	ret = wilc->hif_func->hif_rmw_reg(wilc, COE_AUTO_PS_ON_NULL_PKT,
+					  BIT(30), 0);
+	if (ret) {
+		dev_err(wilc->dev, "Failed to disable awake coexistence null frames\n");
+		release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+		return ret;
+	}
+
+	ret = wilc->hif_func->hif_rmw_reg(wilc, COE_AUTO_PS_OFF_NULL_PKT,
+					  BIT(30), 0);
+	if (ret) {
+		dev_err(wilc->dev, "Failed to disable doze coexistence null frames\n");
+		release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+		return ret;
+	}
+
+	ret = wilc->hif_func->hif_rmw_reg(wilc, PWR_SEQ_MISC_CTRL, BIT(29), 0);
+	if (ret) {
+		dev_err(wilc->dev, "Failed to disable bluetooth wake-up\n");
+		release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+		return ret;
+	}
+	release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+
+	if (!wilc->initialized) {
+		acquire_bus(wilc, WILC_BUS_ACQUIRE_ONLY);
+		ret = wilc->hif_func->hif_deinit(wilc);
+		release_bus(wilc, WILC_BUS_RELEASE_ONLY);
+	}
+
+	return 0;
+}
+
+static int wilc_bt_power_up(struct wilc *wilc)
+{
+	int ret;
+
+	acquire_bus(wilc, WILC_BUS_ACQUIRE_AND_WAKEUP);
+	if (!wilc->initialized) {
+		ret = wilc->hif_func->hif_rmw_reg(wilc, COE_AUTO_PS_ON_NULL_PKT,
+						  BIT(30), 0);
+		if (ret) {
+			dev_err(wilc->dev, "Failed to disable awake coexistence null frames\n");
+			goto fail;
+		}
+
+		ret = wilc->hif_func->hif_rmw_reg(wilc,
+				COE_AUTO_PS_OFF_NULL_PKT, BIT(30), 0);
+		if (ret) {
+			dev_err(wilc->dev, "Failed to disable awake coexistence null frames\n");
+			goto fail;
+		}
+	}
+
+	ret = wilc->hif_func->hif_rmw_reg(wilc, PWR_SEQ_MISC_CTRL, BIT(29),
+					  BIT(29));
+	if (ret) {
+		dev_err(wilc->dev, "Failed to enable bluetooth wake-up\n");
+		goto fail;
+	}
+	release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+
+	return 0;
+
+fail:
+	release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+	wilc_bt_power_down(wilc);
+	return ret;
+}
+
+static int wilc_bt_firmware_download(struct wilc *wilc)
+{
+	const struct firmware *wilc_bt_firmware;
+	u32 addr, size, size2, blksz;
+	size_t buffer_size;
+	const u8 *buffer;
+	u8 *dma_buffer;
+	u32 offset;
+	int ret = 0;
+
+	dev_info(wilc->dev, "Bluetooth firmware: %s\n", FW_WILC3000_BLE);
+	ret = request_firmware(&wilc_bt_firmware, FW_WILC3000_BLE, wilc->dev);
+	if (ret) {
+		dev_err(wilc->dev, "%s - firmware not available. Skip!\n",
+			FW_WILC3000_BLE);
+		return ret;
+	}
+
+	buffer = wilc_bt_firmware->data;
+	buffer_size = (size_t)wilc_bt_firmware->size;
+	if (buffer_size <= 0) {
+		dev_err(wilc->dev, "Firmware size = 0!\n");
+		ret = -EINVAL;
+		goto out_release_firmware;
+	}
+
+	acquire_bus(wilc, WILC_BUS_ACQUIRE_AND_WAKEUP);
+
+	ret = wilc->hif_func->hif_write_reg(wilc, WILC_BT_BOOTROM_CONFIGURATION,
+					    WILC_BT_BOOTROM_DISABLE);
+	if (ret) {
+		dev_err(wilc->dev, "Failed to disable BT bootrom\n");
+		release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+		goto out_release_firmware;
+	}
+
+	ret = wilc->hif_func->hif_rmw_reg(wilc, WILC_BT_RESET_MUX,
+					  WILC_BT_ENABLE_GLOBAL_RESET,
+					  WILC_BT_ENABLE_GLOBAL_RESET);
+	if (ret) {
+		dev_err(wilc->dev, "Failed to configure reset for BT CPU\n");
+		release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+		goto out_release_firmware;
+	}
+
+	ret = wilc->hif_func->hif_rmw_reg(wilc, WILC_BT_CPU_CONFIGURATION,
+					  WILC_BT_CPU_ENABLE,
+					  WILC_BT_CPU_ENABLE);
+	if (!ret)
+		ret = wilc->hif_func->hif_rmw_reg(wilc,
+				WILC_BT_CPU_CONFIGURATION,
+				WILC_BT_CPU_ENABLE, 0);
+	if (ret) {
+		dev_err(wilc->dev, "Failed to disable BT CPU\n");
+		goto out_release_firmware;
+	}
+
+	release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+
+	/* blocks of sizes > 512 causes the wifi to hang! */
+	blksz = (1ul << 9);
+	/* Allocate a DMA coherent buffer. */
+	dma_buffer = kmalloc(blksz, GFP_KERNEL);
+	if (!dma_buffer) {
+		ret = -ENOMEM;
+		dev_err(wilc->dev,
+			"Can't allocate buffer for BT firmware download\n");
+		goto out_free_buffer;
+	}
+	dev_info(wilc->dev, "Downloading BT firmware size = %zu ...\n",
+		 buffer_size);
+
+	offset = 0;
+	addr = WILC_BT_IRAM;
+	size = buffer_size;
+	offset = 0;
+
+	while (((int)size) && (offset < buffer_size)) {
+		if (size <= blksz)
+			size2 = size;
+		else
+			size2 = blksz;
+
+		/* Copy firmware into a DMA coherent buffer */
+		memcpy(dma_buffer, &buffer[offset], size2);
+
+		acquire_bus(wilc, WILC_BUS_ACQUIRE_AND_WAKEUP);
+
+		ret = wilc->hif_func->hif_block_tx(wilc, addr, dma_buffer,
+						   size2);
+
+		release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+
+		if (ret)
+			break;
+
+		addr += size2;
+		offset += size2;
+		size -= size2;
+	}
+
+	if (ret) {
+		dev_err(wilc->dev, "Failed to download BT firmware\n");
+		goto out_free_buffer;
+	}
+	dev_info(wilc->dev, "Finished downloading firmware\n");
+
+out_free_buffer:
+	kfree(dma_buffer);
+out_release_firmware:
+	release_firmware(wilc_bt_firmware);
+return ret;
+}
+
+static int wilc_bt_start(struct wilc *wilc)
+{
+	int ret;
+
+	acquire_bus(wilc, WILC_BUS_ACQUIRE_AND_WAKEUP);
+
+	dev_info(wilc->dev, "Starting BT firmware\n");
+	/*
+	 * Write the firmware download complete magic at
+	 * location 0xFFFF000C (Cortus map) or C000C (AHB map).
+	 * This will let the boot-rom code execute from RAM.
+	 */
+	ret = wilc->hif_func->hif_write_reg(wilc, WILC_BT_FW_MAGIC_LOC,
+					    WILC_BT_FW_MAGIC);
+	if (ret) {
+		dev_err(wilc->dev, "Failed to write BT firmware magic\n");
+		return ret;
+	}
+
+	ret = wilc->hif_func->hif_rmw_reg(wilc, WILC_BT_CPU_CONFIGURATION,
+					  WILC_BT_CPU_BOOT, 0);
+	if (ret) {
+		dev_err(wilc->dev, "Failed to disable BT CPU");
+		return ret;
+	}
+
+	msleep(100);
+
+	ret = wilc->hif_func->hif_rmw_reg(wilc, WILC_BT_CPU_CONFIGURATION,
+					  WILC_BT_CPU_BOOT, WILC_BT_CPU_BOOT);
+	if (ret) {
+		dev_err(wilc->dev, "Failed to enable BT CPU");
+		return ret;
+	}
+	/* An additional wait to give BT firmware time to do
+	 * CPLL update as the time measured since the start of
+	 * BT FW till the end of function "rf_nmi_init_tuner"
+	 * was 71.2 ms
+	 */
+	msleep(100);
+
+	dev_info(wilc->dev, "BT Start Succeeded\n");
+
+	release_bus(wilc, WILC_BUS_RELEASE_ALLOW_SLEEP);
+
+	return 0;
+}
+
+int wilc_bt_init(void *wilc_wl_priv)
+{
+	struct wilc *wilc = (struct wilc *)wilc_wl_priv;
+	int ret;
+
+	if (!wilc->hif_func->hif_is_init(wilc)) {
+		dev_info(wilc->dev, "Initializing bus before starting BT");
+		acquire_bus(wilc, WILC_BUS_ACQUIRE_ONLY);
+		ret = wilc->hif_func->hif_init(wilc, false);
+		release_bus(wilc, WILC_BUS_RELEASE_ONLY);
+		if (ret)
+			return ret;
+	}
+
+	mutex_lock(&wilc->radio_fw_start);
+	ret = wilc_bt_power_up(wilc);
+	if (ret) {
+		dev_err(wilc->dev, "Error powering up bluetooth chip\n");
+		goto hif_deinit;
+	}
+	ret = wilc_bt_firmware_download(wilc);
+	if (ret) {
+		dev_err(wilc->dev, "Error downloading firmware\n");
+		goto power_down;
+	}
+	ret = wilc_bt_start(wilc);
+	if (ret) {
+		dev_err(wilc->dev, "Error starting bluetooth firmware\n");
+		goto power_down;
+	}
+	mutex_unlock(&wilc->radio_fw_start);
+	return 0;
+
+power_down:
+	wilc_bt_power_down(wilc);
+hif_deinit:
+	mutex_unlock(&wilc->radio_fw_start);
+	if (!wilc->initialized)
+		wilc->hif_func->hif_deinit(wilc);
+	return ret;
+}
+EXPORT_SYMBOL(wilc_bt_init);
+
+int wilc_bt_shutdown(void *wilc_wl_priv)
+{
+	struct wilc *wilc = (struct wilc *)wilc_wl_priv;
+	int ret;
+
+	mutex_lock(&wilc->radio_fw_start);
+	ret = wilc->hif_func->hif_rmw_reg(wilc, WILC_BT_CPU_CONFIGURATION,
+					  WILC_BT_CPU_ENABLE, 0);
+	if (ret)
+		dev_warn(wilc->dev, "Failed to disable BT CPU\n");
+	if (wilc_bt_power_down(wilc))
+		dev_warn(wilc->dev, "Failed to power down BT CPU\n");
+	if (!wilc->initialized)
+		wilc->hif_func->hif_deinit(wilc);
+	mutex_unlock(&wilc->radio_fw_start);
+
+	return 0;
+}
+EXPORT_SYMBOL(wilc_bt_shutdown);
diff --git a/drivers/net/wireless/microchip/wilc1000/netdev.c b/drivers/net/wireless/microchip/wilc1000/netdev.c
index d24859d12ccd535c966a9b7f46378ac3b3a21d7b..2f1f68b2156a937a240167d820603ff708507401 100644
--- a/drivers/net/wireless/microchip/wilc1000/netdev.c
+++ b/drivers/net/wireless/microchip/wilc1000/netdev.c
@@ -10,6 +10,7 @@
 #include <linux/firmware.h>
 #include <linux/netdevice.h>
 #include <linux/inetdevice.h>
+#include <net/wilc.h>
 
 #include "cfg80211.h"
 #include "wlan_cfg.h"
@@ -1024,6 +1025,14 @@ struct wilc_vif *wilc_netdev_ifc_init(struct wilc *wl, const char *name,
 }
 EXPORT_SYMBOL_GPL(wilc_netdev_ifc_init);
 
+void wilc_put(void *wilc_wl_priv)
+{
+	struct wilc *wilc = (struct wilc *)wilc_wl_priv;
+
+	put_device(wilc->dev);
+}
+EXPORT_SYMBOL_GPL(wilc_put);
+
 MODULE_DESCRIPTION("Atmel WILC1000 core wireless driver");
 MODULE_LICENSE("GPL");
 MODULE_FIRMWARE(WILC1000_FW(WILC1000_API_VER));
diff --git a/drivers/net/wireless/microchip/wilc1000/sdio.c b/drivers/net/wireless/microchip/wilc1000/sdio.c
index 7eab1c493774e197e43bdf265063aa8c5e6dff14..78789682f145aa06f30d274efc75805e583c0b43 100644
--- a/drivers/net/wireless/microchip/wilc1000/sdio.c
+++ b/drivers/net/wireless/microchip/wilc1000/sdio.c
@@ -5,11 +5,16 @@
  */
 
 #include <linux/clk.h>
+#include "linux/device.h"
+#include "linux/device/driver.h"
 #include <linux/mmc/sdio_func.h>
 #include <linux/mmc/sdio_ids.h>
 #include <linux/mmc/host.h>
 #include <linux/mmc/sdio.h>
 #include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <net/wilc.h>
 
 #include "netdev.h"
 #include "cfg80211.h"
@@ -1072,5 +1077,33 @@ static struct sdio_driver wilc_sdio_driver = {
 };
 module_sdio_driver(wilc_sdio_driver);
 
+static int find_wilc_device(struct device *dev, const void *data)
+{
+	struct device_node *target_node = (struct device_node *)data;
+	struct sdio_func *func = container_of(dev, struct sdio_func, dev);
+
+	return func->card->dev.of_node == target_node ? 1 : 0;
+}
+
+void *wilc_sdio_get_byphandle(struct device_node *wlan_node)
+{
+	struct wilc *wilc;
+	struct device *wilc_dev;
+
+	/* Search in devices bound to the driver if any has a device_node
+	 * matching the targeted one
+	 */
+	wilc_dev = driver_find_device(&wilc_sdio_driver.drv, NULL,
+				      (void *)wlan_node, find_wilc_device);
+	if (!wilc_dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	get_device(wilc_dev);
+	wilc = (struct wilc *)dev_get_drvdata(wilc_dev);
+
+	return wilc;
+}
+EXPORT_SYMBOL(wilc_sdio_get_byphandle);
+
 MODULE_DESCRIPTION("Atmel WILC1000 SDIO wireless driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/net/wireless/microchip/wilc1000/spi.c b/drivers/net/wireless/microchip/wilc1000/spi.c
index aae4262045ff3e5f3668493ef235486e601996f7..93082de3d6ba4cf545a3ec741d8ed16c5372d69b 100644
--- a/drivers/net/wireless/microchip/wilc1000/spi.c
+++ b/drivers/net/wireless/microchip/wilc1000/spi.c
@@ -4,11 +4,16 @@
  * All rights reserved.
  */
 
+#include "linux/device/driver.h"
+#include "linux/of.h"
+#include "linux/of_platform.h"
 #include <linux/clk.h>
 #include <linux/spi/spi.h>
 #include <linux/crc7.h>
 #include <linux/crc-itu-t.h>
 #include <linux/gpio/consumer.h>
+#include <linux/platform_device.h>
+#include <net/wilc.h>
 
 #include "netdev.h"
 #include "cfg80211.h"
@@ -1390,3 +1395,23 @@ static const struct wilc_hif_func wilc_hif_spi = {
 	.hif_is_init = wilc_spi_is_init,
 	.hif_rmw_reg = wilc_spi_rmw_reg
 };
+
+void *wilc_spi_get_byphandle(struct device_node *wlan_node)
+{
+	struct wilc *wilc;
+	struct device *wilc_dev;
+
+	/* Search in devices bound to the driver if any has a device_node
+	 * matching the targeted one
+	 */
+	wilc_dev = driver_find_device_by_of_node(&wilc_spi_driver.driver,
+						 wlan_node);
+	if (!wilc_dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	get_device(wilc_dev);
+	wilc = (struct wilc *)dev_get_drvdata(wilc_dev);
+
+	return wilc;
+}
+EXPORT_SYMBOL(wilc_spi_get_byphandle);
diff --git a/drivers/net/wireless/microchip/wilc1000/wlan.h b/drivers/net/wireless/microchip/wilc1000/wlan.h
index e45c2db0f5cd2de6844993dde15034ebbd93e73b..74381f81e3f236cc55d3af3e7906ed7fb7d790ed 100644
--- a/drivers/net/wireless/microchip/wilc1000/wlan.h
+++ b/drivers/net/wireless/microchip/wilc1000/wlan.h
@@ -116,6 +116,21 @@
 
 #define WILC_SPI_CLOCKLESS_ADDR_LIMIT	0x30
 
+#define WILC_BT_RESET_MUX		0x3b0090
+#define WILC_BT_ENABLE_GLOBAL_RESET	BIT(0)
+
+#define WILC_BT_CPU_CONFIGURATION	0x3b0400
+#define WILC_BT_CPU_ENABLE		BIT(2)
+#define WILC_BT_CPU_BOOT		(BIT(3) | WILC_BT_CPU_ENABLE)
+
+#define WILC_BT_IRAM			0x400000
+
+#define WILC_BT_BOOTROM_CONFIGURATION	0x4f0000
+#define WILC_BT_BOOTROM_DISABLE		0x71
+
+#define WILC_BT_FW_MAGIC_LOC		0x4f000c
+#define WILC_BT_FW_MAGIC		0x10add09e
+
 /* Functions IO enables bits */
 #define WILC_SDIO_CCCR_IO_EN_FUNC1	BIT(1)
 
@@ -174,6 +189,8 @@
 
 #define GLOBAL_MODE_CONTROL		0x1614
 #define PWR_SEQ_MISC_CTRL		0x3008
+#define COE_AUTO_PS_ON_NULL_PKT		0x160468
+#define COE_AUTO_PS_OFF_NULL_PKT	0x16046C
 
 #define WILC_GLOBAL_MODE_ENABLE_WIFI	BIT(0)
 #define WILC_PWR_SEQ_ENABLE_WIFI_SLEEP	BIT(28)
diff --git a/include/net/wilc.h b/include/net/wilc.h
new file mode 100644
index 0000000000000000000000000000000000000000..60c69d4d8442907c05e644ecd646b24ccd161f47
--- /dev/null
+++ b/include/net/wilc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __WILC_HEADER_H
+#define __WILC_HEADER_H
+
+#include <linux/of.h>
+
+#if defined(CONFIG_WILC1000_SDIO) || defined(CONFIG_WILC1000_SDIO_MODULE)
+void *wilc_sdio_get_byphandle(struct device_node *wlan_node);
+#endif
+#if defined(CONFIG_WILC1000_SPI) || defined(CONFIG_WILC1000_SPI_MODULE)
+void *wilc_spi_get_byphandle(struct device_node *wlan_node);
+#endif
+void wilc_put(void *wilc_wl_priv);
+
+int wilc_bt_init(void *wilc_wl_priv);
+int wilc_bt_shutdown(void *wilc_wl_priv);
+
+#endif

-- 
2.48.0


