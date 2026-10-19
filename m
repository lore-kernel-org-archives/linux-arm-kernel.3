Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5C5CCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 03:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5TeWWNtJggGTTz6M8A9FjvcqNzl7loaYSyNhUw4yhc=; b=owUyFnXLLBo0UnXSgjko9k4eOk
	N5h3/PB0jzAWNQHRo1yuYqmCdEBVlnsTdvv/L4bhk0BevpSGzsjL/28w44TptaUqWC4bPHJaerj/7
	qT2tzSAfV/GA6lRWoETBdZ9a3GJPNRYdgLL/ONwlwtmjajHmw34sPzP4I6BK59NTg6NcbjCj9w6dy
	mUETD04m1lKUAZHgAXFxjlvWsIS9x2CdzYbHwpoqcgIwY5TMzDJyg94WsPkF799uSfQ7ij/2Jj9jH
	9Vp0aEAGWXdO4JdM3kBUyO6l6obqab41cRvA1BBEQZSs+XBpdGXc02u4Va+kKozb+VlN3uvIN+ew4
	nO6FRn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIdd8-00000006UjU-2038;
	Mon, 19 Oct 2026 03:01:42 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIdd4-00000006UhC-1X63
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 03:01:39 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-5365d725440so7546901cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 20:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792378897; x=1792983697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5TeWWNtJggGTTz6M8A9FjvcqNzl7loaYSyNhUw4yhc=;
        b=QMzdnR9YL6VtejUBTPNCnMU0xpYNZ4mAmH5jl9OX52B/IXPrE9M4F5WbCCFyF+GJO9
         JdgD6XtcKkn2AOFYCoHDyIT/p1pAy97hnYH56l40tIToC5LXRaGEVuczgiJsQuUUi4jt
         tzKn31L2kxDRlGC5SXmldFXAl68qPFme3Vr/qn8VmyR8DRaEKlwdSF+frost6lP2QG/P
         Ls5S3dyqzYlchJ2BQC/n6zMUlePZ2eP4WsOg99sD1VzsL7RWm78FOMQYL/hs/R0YnXbl
         qOkc6JNpjm8PkKRsyrtgcB9IDsG8RrrnouMlJcbJPd94ZZsYiSPzCn9LBvzoDaMmAj7z
         oGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792378897; x=1792983697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5TeWWNtJggGTTz6M8A9FjvcqNzl7loaYSyNhUw4yhc=;
        b=f4wUhzeFW6iMw/JTB7wGNEnhDSs4gj7pGBLOugR6cVmrjUaE7h1MY8QQgjLrsegkIe
         fHabn50lg9vaDncLQa1DVQwg8Oe1ufFAa/Pnkl8U7OQFSKYwwtHywfO7Tsstam3/fQst
         ovXhODiIsHU4xBNirlj8kBUtxS1ixYAE4pi/CdpBbQe0f47SAhdcIXnY0NbYW58ffSSy
         Cv29EqnLUc0Qu88BWuqY1Sz+kHr0HH64FL0QvudNr99Rp/GjTaBFjBCRXk0ydl36TDbt
         dV3nnrIkhl6OcP6EgP9NpW//He1GSd2Sm9pXifyR0+LXdMV7cicSPZt30YXj+6ojndDE
         qT9Q==
X-Forwarded-Encrypted: i=1; AKwUvByrR6vquRfm9En0UfLkLo+qXLf1gYyvPF0aUgS9O5nM5+R3YItQYA1JE07Yf1K0SyW3aDDrecpOleoziM+WCAP2@lists.infradead.org
X-Gm-Message-State: AFq9FYK/T3tkIDcDqz+E3HAMFKi5wm+TxN9jAaIwue7PxTV5taW/uWRe
	F1g9W+CpINgYM7sQomGvddAnH4q7htNbmmbyDLq8VpvCtJxpXmZbbFTNS2OFn73gEMk=
X-Gm-Gg: AYBFou2xGXWXmsc4vw0hds58O4gQJDl4yPMKgkxgr6axV/f39QTLQg/K5E+eADuFh95
	1IPv8WRUr2dr/Pw2bQjMSU2jf6Mmjzv/paKIQqQ6BueOq0zqUJkDBP6QThC1Zik9lP6jAlwhq1B
	Y5MhwtdaHZBZjq8ciR7gjgtRGnsk2JP9FCDNk21LwX/gtos034Bq8+KIT5Sz5ZhtjFHjGhKm+iS
	3shl7aYrP7P3Fxyc8g00xGLX1ieZR6wIvNRXM2/n6wzFGgFoeXLF2qMQHqsW9wfHijHZ2FaeGz8
	nnYC8N1lc/VIFAN7YfXAea4pAr9pq3jH5JBjVPoAlCFru4qXowiA/AFAWR+TSSle2lpPChe7IoR
	xbBm1/hzfM1poQwagLchpPrGsH1J9wXGYlYv/XfghWPdKHswHZUApA4PToO+swrqe2Oqx/RyDte
	T+82TsjSV5iKM75t45RoXGBdKVKudMnEmI56MXYuIKHL/nKxyvOFa/nwgRO146lCgE7NoXSUGCS
	ouKZdgSuMzvkA==
X-Received: by 2002:a05:620a:8812:b0:93e:fa30:f1dd with SMTP id af79cd13be357-93f29dac9e9mr998353385a.70.1792378897136;
        Sun, 18 Oct 2026 20:01:37 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f3c61c440sm216840185a.10.2026.10.18.20.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:01:36 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	peppe.cavallaro@st.com,
	joabreu@synopsys.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/5] net: pcs: pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via regmap
Date: Sun, 18 Oct 2026 22:01:25 -0500
Message-ID: <20261019030129.1470307-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019030129.1470307-1-elder@riscstar.com>
References: <20261019030129.1470307-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_200138_424581_8C3D0053 
X-CRM114-Status: GOOD (  23.14  )
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

From: Daniel Thompson <daniel@riscstar.com>

In some DesignWare XPCS implementations the memory-mapped MDIO bus is
allocated to a register window that does not align to a page boundary.
This makes iomapping the registers problematic.

For example the Toshiba TC9564 (a PCIe Ethernet-AVB/TSN bridge) provides
an "eMAC" subsystem with the XPCS base address cuddled up to XGMAC
registers.

Let's introduce helpers to allow the driver that owns the eMAC to register
an XPCS using is regmap for the memory-mapped MDIO bus.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 MAINTAINERS                         |   2 +
 drivers/net/pcs/Makefile            |   3 +-
 drivers/net/pcs/pcs-xpcs-regmap.c   | 169 ++++++++++++++++++++++++++++
 include/linux/pcs/pcs-xpcs-regmap.h |  13 +++
 4 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
 create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 55ead3d1007a8..972c9faead5b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27148,8 +27148,10 @@ F:	drivers/net/ethernet/synopsys/
 SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER
 L:	netdev@vger.kernel.org
 S:	Orphan
+F:	drivers/net/pcs/pcs-xpcs-regmap.c
 F:	drivers/net/pcs/pcs-xpcs.c
 F:	drivers/net/pcs/pcs-xpcs.h
+F:	include/linux/pcs/pcs-xpcs-regmap.h
 F:	include/linux/pcs/pcs-xpcs.h
 
 SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER
diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index 4f7920618b900..088d35f21a4c3 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -2,7 +2,8 @@
 # Makefile for Linux PCS drivers
 
 pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
-				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
+				   pcs-xpcs-nxp.o pcs-xpcs-regmap.o \
+				   pcs-xpcs-wx.o
 
 obj-$(CONFIG_PCS_XPCS)		+= pcs_xpcs.o
 obj-$(CONFIG_PCS_LYNX)		+= pcs-lynx.o
diff --git a/drivers/net/pcs/pcs-xpcs-regmap.c b/drivers/net/pcs/pcs-xpcs-regmap.c
new file mode 100644
index 0000000000000..f3f3aaaf0b75a
--- /dev/null
+++ b/drivers/net/pcs/pcs-xpcs-regmap.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Synopsys DesignWare XPCS regmap helpers
+ *
+ * Copyright (C) 2026 RISCstar Solutions.
+ * Copyright (C) 2024 Serge Semin
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mdio.h>
+#include <linux/pcs/pcs-xpcs.h>
+#include <linux/pcs/pcs-xpcs-regmap.h>
+#include <linux/regmap.h>
+
+#include "pcs-xpcs.h"
+
+/* Page select register for the indirect MMIO CSRs access */
+#define DW_VR_CSR_VIEWPORT		0xff
+
+static ptrdiff_t xpcs_regmap_addr_format(int dev, int reg)
+{
+	return FIELD_PREP(0x1f0000, dev) | FIELD_PREP(0xffff, reg);
+}
+
+static u16 xpcs_regmap_addr_page(ptrdiff_t csr)
+{
+	return FIELD_GET(0x1fff00, csr);
+}
+
+static ptrdiff_t xpcs_regmap_addr_offset(ptrdiff_t csr)
+{
+	return FIELD_GET(0xff, csr);
+}
+
+static int
+xpcs_regmap_read_reg_indirect(struct regmap *regmap, int dev, int reg)
+{
+	ptrdiff_t csr, ofs;
+	unsigned int val;
+	u16 page;
+	int res;
+
+	csr = xpcs_regmap_addr_format(dev, reg);
+	page = xpcs_regmap_addr_page(csr);
+	ofs = xpcs_regmap_addr_offset(csr);
+
+	res = regmap_write(regmap, DW_VR_CSR_VIEWPORT, page);
+	if (res < 0)
+		return res;
+
+	res = regmap_read(regmap, ofs, &val);
+	if (res < 0)
+		return res;
+
+	return val & 0xffff;
+}
+
+static int
+xpcs_regmap_write_reg_indirect(struct regmap *regmap, int dev, int reg, u16 val)
+{
+	ptrdiff_t csr, ofs;
+	u16 page;
+	int res;
+
+	csr = xpcs_regmap_addr_format(dev, reg);
+	page = xpcs_regmap_addr_page(csr);
+	ofs = xpcs_regmap_addr_offset(csr);
+
+	res = regmap_write(regmap, DW_VR_CSR_VIEWPORT, page);
+	if (res < 0)
+		return res;
+
+	return regmap_write(regmap, ofs, val);
+}
+
+static int xpcs_regmap_read_c22(struct mii_bus *bus, int addr, int reg)
+{
+	struct regmap *regmap = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	return xpcs_regmap_read_reg_indirect(regmap, MDIO_MMD_VEND2, reg);
+}
+
+static int
+xpcs_regmap_write_c22(struct mii_bus *bus, int addr, int reg, u16 val)
+{
+	struct regmap *regmap = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	return xpcs_regmap_write_reg_indirect(regmap, MDIO_MMD_VEND2, reg, val);
+}
+
+static int xpcs_regmap_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
+{
+	struct regmap *regmap = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	return xpcs_regmap_read_reg_indirect(regmap, dev, reg);
+}
+
+static int xpcs_regmap_write_c45(struct mii_bus *bus, int addr, int dev,
+				 int reg, u16 val)
+{
+	struct regmap *regmap = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	return xpcs_regmap_write_reg_indirect(regmap, dev, reg, val);
+}
+
+static void devm_xpcs_regmap_destroy(void *data)
+{
+	struct dw_xpcs *xpcs = data;
+
+	xpcs_destroy(xpcs);
+}
+
+struct dw_xpcs *devm_xpcs_regmap_register(struct device *dev,
+					  struct regmap *regmap)
+{
+	static atomic_t id = ATOMIC_INIT(-1);
+	struct dw_xpcs *xpcs;
+	struct mii_bus *bus;
+	int ret;
+
+	bus = devm_mdiobus_alloc_size(dev, 0);
+	if (!bus)
+		return ERR_PTR(-ENOMEM);
+
+	bus->name = "DW XPCS MCI/APB3";
+	bus->read = xpcs_regmap_read_c22;
+	bus->write = xpcs_regmap_write_c22;
+	bus->read_c45 = xpcs_regmap_read_c45;
+	bus->write_c45 = xpcs_regmap_write_c45;
+	bus->phy_mask = ~0;
+	bus->parent = dev;
+	bus->priv = regmap;
+
+	snprintf(bus->id, sizeof(bus->id), "dwxpcs-%x", atomic_inc_return(&id));
+
+	/* MDIO-bus here serves as just a back-end engine abstracting out
+	 * the MDIO and MCI/APB3 IO interfaces utilized for the DW XPCS CSRs
+	 * access.
+	 */
+	ret = devm_mdiobus_register(dev, bus);
+	if (ret) {
+		dev_err(dev, "failed to create MDIO bus\n");
+		return ERR_PTR(ret);
+	}
+
+	xpcs = xpcs_create_mdiodev(bus, 0);
+	if (IS_ERR(xpcs))
+		return xpcs;
+
+	ret = devm_add_action_or_reset(dev, devm_xpcs_regmap_destroy, xpcs);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return xpcs;
+}
+EXPORT_SYMBOL_GPL(devm_xpcs_regmap_register);
diff --git a/include/linux/pcs/pcs-xpcs-regmap.h b/include/linux/pcs/pcs-xpcs-regmap.h
new file mode 100644
index 0000000000000..c6d934b1054ed
--- /dev/null
+++ b/include/linux/pcs/pcs-xpcs-regmap.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_PCS_XPCS_REGMAP_H
+#define __LINUX_PCS_XPCS_REGMAP_H
+
+struct device;
+struct regmap;
+struct dw_xpcs;
+
+struct dw_xpcs *devm_xpcs_regmap_register(struct device *dev,
+					  struct regmap *regmap);
+
+#endif /* __LINUX_PCS_XPCS_REGMAP_H */
-- 
2.53.0


