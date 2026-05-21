Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C007BCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWZBFoYN5c6+ziPOBHJjfc1Ixv7DTaRKS8ieohJ9Oyw=; b=C/++XMwQuyYG+nJH8KfJtOmRrb
	5fLlvxkuMGjTgM815j1JGaQ3zHEho+bC/oIM86vU7hW8Ju92+1vd/un9quF5U//aHFdk+XWRiyFHj
	X2LxsryZB41N5OSma6eAdO5qmhUJ+xwL3KCxNzHIjILBPvVRNfBzO2S+e6Hb4Drzb5uOWmucnNLAi
	yU+JjSr74fTihV0JARFwdFvAYbSdn6cn3yUmMOHzJ6V4rhXVHjrpqOCWy7GRbjW4lhlgN35oDpEoz
	9X0UUtHssZr0UJx3xFyVjtb6Bh8OZhg2Jl5Ea3H+eavUO97jeax9P+DWuFW3LoV4CzSCxHtvPt9K4
	HStMYIqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyg3-0000000773O-3BGm;
	Thu, 21 May 2026 08:22:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyfv-000000076sj-2Mbc;
	Thu, 21 May 2026 08:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779351757;
	bh=RUycHHP1Y0L/ZH0+76X6ndWUTpwKu3V/QnwT1hPq1FY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dcTeB416Pdt5jfBMucRpLgc7AvzMTWjRLIftziWIBeoO9Ecdape1j61nQE1ibgt4J
	 vAnU48HqvjA10IR8NUDzMkT6Zro7XyQlnOluaejhWUdNvOXNU+lJKtuZqov2nAG1hh
	 A7DMK4Oe1ord+u5UvU0/vVGL23ntGjZqrFjXyfxaDGx7YrlwnsL/Iqhg/KnbMdWaxI
	 aIXbhbuV7TXeIRhZe7KVAzrotIL+C9Z3McSOJp+ehEyOqjKOuHsxwaji7dJmA8EhzO
	 umR+D4kLRCxK7bk9jC73Ea1oHsqaFtBhbND5gz0yYAuV7AtM83jfMnIWVHO24cqkvN
	 UH5qAuKJVDZRg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D3E2D17E1412;
	Thu, 21 May 2026 10:22:35 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 21 May 2026 10:21:56 +0200
Subject: [PATCH net-next v4 3/6] net: phy: air_phy_lib: Factorize BuckPBus
 register accessors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-add-airoha-an8801-support-v4-3-1e4837d30ef4@collabora.com>
References: <20260521-add-airoha-an8801-support-v4-0-1e4837d30ef4@collabora.com>
In-Reply-To: <20260521-add-airoha-an8801-support-v4-0-1e4837d30ef4@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com, 
 matthias.bgg@gmail.com, kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779351750; l=12880;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=RUycHHP1Y0L/ZH0+76X6ndWUTpwKu3V/QnwT1hPq1FY=;
 b=TLqZjAty9JKVzTIO4APLzqs8DTIzZpmSPaQpuC4FMjkg9p9jgDV4EWXUZZGGLQfuH31PsqSm9
 N0n8Iehs+kmDcKDnD1qN/22kJvCsxJSnHiwTSLZtxggA2OkFIj9C4NH
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_012239_913396_2E7A8C4F 
X-CRM114-Status: GOOD (  15.29  )
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

In preparation of Airoha AN8801R PHY support, move the BuckPBus
register accessors and definitions, present in air_en8811h driver,
into the Airoha PHY shared code (air_phy_lib), so they will be usable
by the new driver without duplicating them.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/net/phy/air_en8811h.c | 193 ------------------------------------------
 drivers/net/phy/air_phy_lib.c | 181 +++++++++++++++++++++++++++++++++++++++
 drivers/net/phy/air_phy_lib.h |  23 +++++
 3 files changed, 204 insertions(+), 193 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index be7c3426182a..2498bd3f7993 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -42,22 +42,6 @@
 #define   AIR_AUX_CTRL_STATUS_SPEED_1000	0x8
 #define   AIR_AUX_CTRL_STATUS_SPEED_2500	0xc
 
-#define   AIR_PHY_PAGE_STANDARD			0x0000
-#define   AIR_PHY_PAGE_EXTENDED_4		0x0004
-
-/* MII Registers Page 4*/
-#define AIR_BPBUS_MODE			0x10
-#define   AIR_BPBUS_MODE_ADDR_FIXED		0x0000
-#define   AIR_BPBUS_MODE_ADDR_INCR		BIT(15)
-#define AIR_BPBUS_WR_ADDR_HIGH		0x11
-#define AIR_BPBUS_WR_ADDR_LOW		0x12
-#define AIR_BPBUS_WR_DATA_HIGH		0x13
-#define AIR_BPBUS_WR_DATA_LOW		0x14
-#define AIR_BPBUS_RD_ADDR_HIGH		0x15
-#define AIR_BPBUS_RD_ADDR_LOW		0x16
-#define AIR_BPBUS_RD_DATA_HIGH		0x17
-#define AIR_BPBUS_RD_DATA_LOW		0x18
-
 /* Registers on MDIO_MMD_VEND1 */
 #define EN8811H_PHY_FW_STATUS		0x8009
 #define   EN8811H_PHY_READY			0x02
@@ -245,183 +229,6 @@ static const unsigned long en8811h_led_trig = BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
 					      BIT(TRIGGER_NETDEV_RX)          |
 					      BIT(TRIGGER_NETDEV_TX);
 
-static int __air_buckpbus_reg_write(struct phy_device *phydev,
-				    u32 pbus_address, u32 pbus_data)
-{
-	int ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data));
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static int air_buckpbus_reg_write(struct phy_device *phydev,
-				  u32 pbus_address, u32 pbus_data)
-{
-	int saved_page;
-	int ret = 0;
-
-	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
-
-	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_write(phydev, pbus_address,
-					       pbus_data);
-		if (ret < 0)
-			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
-				   pbus_address, ret);
-	}
-
-	return phy_restore_page(phydev, saved_page, ret);
-}
-
-static int __air_buckpbus_reg_read(struct phy_device *phydev,
-				   u32 pbus_address, u32 *pbus_data)
-{
-	int pbus_data_low, pbus_data_high;
-	int ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
-	if (pbus_data_high < 0)
-		return pbus_data_high;
-
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
-	if (pbus_data_low < 0)
-		return pbus_data_low;
-
-	*pbus_data = pbus_data_low | (pbus_data_high << 16);
-	return 0;
-}
-
-static int air_buckpbus_reg_read(struct phy_device *phydev,
-				 u32 pbus_address, u32 *pbus_data)
-{
-	int saved_page;
-	int ret = 0;
-
-	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
-
-	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_read(phydev, pbus_address, pbus_data);
-		if (ret < 0)
-			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
-				   pbus_address, ret);
-	}
-
-	return phy_restore_page(phydev, saved_page, ret);
-}
-
-static int __air_buckpbus_reg_modify(struct phy_device *phydev,
-				     u32 pbus_address, u32 mask, u32 set)
-{
-	int pbus_data_low, pbus_data_high;
-	u32 pbus_data_old, pbus_data_new;
-	int ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
-	if (pbus_data_high < 0)
-		return pbus_data_high;
-
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
-	if (pbus_data_low < 0)
-		return pbus_data_low;
-
-	pbus_data_old = pbus_data_low | (pbus_data_high << 16);
-	pbus_data_new = (pbus_data_old & ~mask) | set;
-	if (pbus_data_new == pbus_data_old)
-		return 0;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data_new));
-	if (ret < 0)
-		return ret;
-
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data_new));
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static int air_buckpbus_reg_modify(struct phy_device *phydev,
-				   u32 pbus_address, u32 mask, u32 set)
-{
-	int saved_page;
-	int ret = 0;
-
-	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
-
-	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_modify(phydev, pbus_address, mask,
-						set);
-		if (ret < 0)
-			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
-				   pbus_address, ret);
-	}
-
-	return phy_restore_page(phydev, saved_page, ret);
-}
-
 static int __air_write_buf(struct phy_device *phydev, u32 address,
 			   const struct firmware *fw)
 {
diff --git a/drivers/net/phy/air_phy_lib.c b/drivers/net/phy/air_phy_lib.c
index 8ef5af4becf0..aba4f95fe9e6 100644
--- a/drivers/net/phy/air_phy_lib.c
+++ b/drivers/net/phy/air_phy_lib.c
@@ -10,11 +10,192 @@
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/phy.h>
+#include <linux/wordpart.h>
 
 #include "air_phy_lib.h"
 
 #define AIR_EXT_PAGE_ACCESS		0x1f
 
+static int __air_buckpbus_reg_read(struct phy_device *phydev,
+				   u32 pbus_address, u32 *pbus_data)
+{
+	int pbus_data_low, pbus_data_high;
+	int ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
+			  upper_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
+			  lower_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	if (pbus_data_high < 0)
+		return pbus_data_high;
+
+	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	if (pbus_data_low < 0)
+		return pbus_data_low;
+
+	*pbus_data = pbus_data_low | (pbus_data_high << 16);
+	return 0;
+}
+
+static int __air_buckpbus_reg_write(struct phy_device *phydev,
+				    u32 pbus_address, u32 pbus_data)
+{
+	int ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
+			  upper_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
+			  lower_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
+			  upper_16_bits(pbus_data));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
+			  lower_16_bits(pbus_data));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int __air_buckpbus_reg_modify(struct phy_device *phydev,
+				     u32 pbus_address, u32 mask, u32 set)
+{
+	int pbus_data_low, pbus_data_high;
+	u32 pbus_data_old, pbus_data_new;
+	int ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
+			  upper_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
+			  lower_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	if (pbus_data_high < 0)
+		return pbus_data_high;
+
+	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	if (pbus_data_low < 0)
+		return pbus_data_low;
+
+	pbus_data_old = pbus_data_low | (pbus_data_high << 16);
+	pbus_data_new = (pbus_data_old & ~mask) | set;
+	if (pbus_data_new == pbus_data_old)
+		return 0;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
+			  upper_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
+			  lower_16_bits(pbus_address));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
+			  upper_16_bits(pbus_data_new));
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
+			  lower_16_bits(pbus_data_new));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+int air_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
+			  u32 *pbus_data)
+{
+	int saved_page;
+	int ret = 0;
+
+	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
+
+	if (saved_page >= 0) {
+		ret = __air_buckpbus_reg_read(phydev, pbus_address, pbus_data);
+		if (ret < 0)
+			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
+				   pbus_address, ret);
+	}
+
+	return phy_restore_page(phydev, saved_page, ret);
+}
+EXPORT_SYMBOL_GPL(air_buckpbus_reg_read);
+
+int air_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
+			   u32 pbus_data)
+{
+	int saved_page;
+	int ret = 0;
+
+	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
+
+	if (saved_page >= 0) {
+		ret = __air_buckpbus_reg_write(phydev, pbus_address,
+					       pbus_data);
+		if (ret < 0)
+			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
+				   pbus_address, ret);
+	}
+
+	return phy_restore_page(phydev, saved_page, ret);
+}
+EXPORT_SYMBOL_GPL(air_buckpbus_reg_write);
+
+int air_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
+			    u32 mask, u32 set)
+{
+	int saved_page;
+	int ret = 0;
+
+	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
+
+	if (saved_page >= 0) {
+		ret = __air_buckpbus_reg_modify(phydev, pbus_address, mask,
+						set);
+		if (ret < 0)
+			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
+				   pbus_address, ret);
+	}
+
+	return phy_restore_page(phydev, saved_page, ret);
+}
+EXPORT_SYMBOL_GPL(air_buckpbus_reg_modify);
+
 int air_phy_read_page(struct phy_device *phydev)
 {
 	return __phy_read(phydev, AIR_EXT_PAGE_ACCESS);
diff --git a/drivers/net/phy/air_phy_lib.h b/drivers/net/phy/air_phy_lib.h
index 79367e8e5907..b637f3e0f2d5 100644
--- a/drivers/net/phy/air_phy_lib.h
+++ b/drivers/net/phy/air_phy_lib.h
@@ -10,6 +10,29 @@
 
 #include <linux/phy.h>
 
+#define AIR_PHY_PAGE_STANDARD		0x0000
+#define AIR_PHY_PAGE_EXTENDED_1		0x0001
+#define AIR_PHY_PAGE_EXTENDED_4		0x0004
+
+/* MII Registers Page 4*/
+#define AIR_BPBUS_MODE			0x10
+#define   AIR_BPBUS_MODE_ADDR_FIXED		0x0000
+#define   AIR_BPBUS_MODE_ADDR_INCR		BIT(15)
+#define AIR_BPBUS_WR_ADDR_HIGH		0x11
+#define AIR_BPBUS_WR_ADDR_LOW		0x12
+#define AIR_BPBUS_WR_DATA_HIGH		0x13
+#define AIR_BPBUS_WR_DATA_LOW		0x14
+#define AIR_BPBUS_RD_ADDR_HIGH		0x15
+#define AIR_BPBUS_RD_ADDR_LOW		0x16
+#define AIR_BPBUS_RD_DATA_HIGH		0x17
+#define AIR_BPBUS_RD_DATA_LOW		0x18
+
+int air_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
+			    u32 mask, u32 set);
+int air_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
+			  u32 *pbus_data);
+int air_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
+			   u32 pbus_data);
 int air_phy_read_page(struct phy_device *phydev);
 int air_phy_write_page(struct phy_device *phydev, int page);
 

-- 
2.54.0


