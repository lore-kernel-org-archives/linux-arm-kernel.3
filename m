Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7694CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuiFWpVI6P/StxdOT1pP0j9Dw8e8PBructsF2mN93hY=; b=StHOQGOdJo2oyXM3PjLygYFlfo
	DvRzIrqxFEbDyG9lbfpUzisEjVi7YkveoJoBLnWmwn9h6Ugq4FXTFK1j8S+dZo6oBPOq5QnjTI2ZA
	9LyCI6HeRU6eHF+4DHaE7SUHhamnodiMqO9r1bHvwKvWn1yigIDQdDdK0UoQKUKcLv3i4lzZZl5nj
	RVuN25MJun2opK/3h0mhPpH8pN+U5WiGuZ4Hj2kEXkpZd/Dkts3UA/VV4/1NbAtVKJDTo0t7xUs+r
	kFmZt1Y+rdTM692EAF6wHpRpOKxvBPqmvmk1W1ouduBdPeKth7YcPs7TwaCzyPV5Ga+A7Hedtn1iV
	7dgrhxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhgM-0000000EgbM-1Rih;
	Wed, 03 Jun 2026 09:14:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhgL-0000000EgbE-0dfV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 09:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vuiFWpVI6P/StxdOT1pP0j9Dw8e8PBructsF2mN93hY=; b=bcQYLymRvyptbCNP2cTa/1vTOW
	7Hhc0J9rYlCg6vPjbM1CU8dxR2PdCaGyBETjsmZTBgqjoGRvShXS2f/58qXr3+r8y+bWoKSctfX5T
	VOzCjf3OMflvYiggFl4Atuqxye4Cs29dt6OJUYxm6A9nQTEq7UxjOxI+DfdC2QlKVahIMMjWUi3C4
	LPJZM4qUFHS+8NpjuCAIPGr3cTRoHAOrutFlwBk/S/J4XINXz/DG/OMwUIZ8GZ6EsybRU1yisjc0q
	r6enQunpQVlyCsuGh+QLqRrq976Cr3ZRqJ8Iqdzf9RsGjAJFI4q6h7ApCEQNxCKqR3wTgmqAg51tx
	eNIGBJ4g==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUhgI-0000000BgJ3-0XMd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 09:14:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhg5-0000qw-Ok; Wed, 03 Jun 2026 11:14:21 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhg5-000tFC-18;
	Wed, 03 Jun 2026 11:14:21 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhg5-000000004In-18Cd;
	Wed, 03 Jun 2026 11:14:21 +0200
Message-ID: <99743c29fe81a90d3c1f51889d42ef9d4766de3c.camel@pengutronix.de>
Subject: Re: [PATCH RFC v3 3/5] clk: zte: Introduce a driver for zx297520v3
 top clocks and resets.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 03 Jun 2026 11:14:21 +0200
In-Reply-To: <20260529-zx29clk-v3-3-c7fe54ea388f@gmail.com>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
	 <20260529-zx29clk-v3-3-c7fe54ea388f@gmail.com>
Content-Type: text/markdown; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_101434_317328_78F59CDC 
X-CRM114-Status: GOOD (  19.55  )
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

On Fr, 2026-05-29 at 00:53 +0300, Stefan D=C3=B6singer wrote:

> ```
This register space controls core devices: PLLs, the AHB bus, a lot of
timers, the USB controller, the Cortex M0 processor that boots the board
and a few other devices. For some reason the LTE coprocessor is also
partially controlled by it. The main application processor and DDR
memory are not found here though.

>=20
The register to reboot the board is also found here.

>=20
Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

>=20
---

>=20
Patch changlog:

>=20
v2:
*) Add code to set up PLLs
*) Merge top and matrix controllers into one device
*) Bugfixes pointed out by Sashiko
---
 MAINTAINERS                      |   1 +
 drivers/clk/Kconfig              |   1 +
 drivers/clk/Makefile             |   1 +
 drivers/clk/zte/Kconfig          |  18 +
 drivers/clk/zte/Makefile         |   5 +
 drivers/clk/zte/clk-zx297520v3.c | 775 +++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/zte/pll.c            | 450 +++++++++++++++++++++++
 drivers/clk/zte/pll.h            |  23 ++
 8 files changed, 1274 insertions(+)

>=20
```

[...]

> ```
diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx29752=
0v3.c
new file mode 100644
index 000000000000..986042dd4caf
--- /dev/null
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -0,0 +1,775 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan D=C3=B6singer
+ */
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
+#include <linux/reset-controller.h>
+#include <linux/platform_device.h>
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/reboot.h>
+#include <linux/iopoll.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+
+#include "pll.h"
+
+/* All LSP and some Matrix registers contain both resets and clock gates, =
so access to them needs
+ * to be synchronized between the reset and clock callbacks.
+ */
+static DEFINE_SPINLOCK(reg_lock);
+
+struct zx29_reset_reg {
+	void __iomem *reg;
+	u32 mask, wait_mask;
+};
+
+struct zx29_clk_controller {
+	struct clk_hw_onecell_data *clocks;
+	struct reset_controller_dev rcdev;
+	struct zx29_reset_reg resets[];
+};
+
+static int __zx297520v3_rst_assert(struct reset_controller_dev *rcdev, uns=
igned long id)
+{
+	struct zx29_clk_controller *data =3D container_of(rcdev, struct zx29_clk_=
controller,
+							    rcdev);
+	u32 val;
+
+	val =3D readl(data->resets[id].reg);
+	val &=3D ~data->resets[id].mask;
+	writel(val, data->resets[id].reg);
+
+	return 0;
+}
+
+static int zx297520v3_rst_assert(struct reset_controller_dev *rcdev, unsig=
ned long id)
+{
+	unsigned long flags;
+	int res;
+
+	spin_lock_irqsave(&reg_lock, flags);
+	res =3D __zx297520v3_rst_assert(rcdev, id);
+	spin_unlock_irqrestore(&reg_lock, flags);
+
+	return res;
+}
+
+static int __zx297520v3_rst_deassert(struct reset_controller_dev *rcdev, u=
nsigned long id)
+{
+	struct zx29_clk_controller *data =3D container_of(rcdev, struct zx29_clk_=
controller,
+							    rcdev);
+	u32 val;
+
+	val =3D readl(data->resets[id].reg);
+	val |=3D data->resets[id].mask;
+	writel(val, data->resets[id].reg);
```


I'd move the spinlock in here ...


> ```
+	/* This is a special case used only by USB reset */
+	if (data->resets[id].wait_mask) {
+		return readl_poll_timeout(data->resets[id].reg + 4, val,
+					  val & data->resets[id].wait_mask, 1, 100);
```


... because this might sleep.


> ```
+	}
+
+	return 0;
+}
+
+static int zx297520v3_rst_deassert(struct reset_controller_dev *rcdev, uns=
igned long id)
+{
+	unsigned long flags;
+	int res;
+
+	spin_lock_irqsave(&reg_lock, flags);
+	res =3D __zx297520v3_rst_deassert(rcdev, id);
+	spin_unlock_irqrestore(&reg_lock, flags);
+
+	return res;
+}
+
+static int zx297520v3_rst_reset(struct reset_controller_dev *rcdev, unsign=
ed long id)
+{
+	unsigned long flags;
+	int res;
+
+	spin_lock_irqsave(&reg_lock, flags);
+
+	res =3D __zx297520v3_rst_assert(rcdev, id);
+	if (res)
+		goto unlock;
+	udelay(100);
```


Is this delay long enough for all potential users of reset_control_reset()?=
 Are there actually any at all?

Why delay under the global spinlock? =20
You could use fsleep() instead and only lock the read-modify-write cycles.


> ```
+	res =3D __zx297520v3_rst_deassert(rcdev, id);
+
+unlock:
+	spin_unlock_irqrestore(&reg_lock, flags);
+	return res;
+}
+
+static int zx297520v3_rst_status(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct zx29_clk_controller *data =3D container_of(rcdev, struct zx29_clk_=
controller,
+							    rcdev);
+	u32 val;
+
+	val =3D readl(data->resets[id].reg);
+
+	return val & data->resets[id].mask;
```


This will return a negative value for bit BIT(31), I'd wrap this with a dou=
ble negation.

regards =20
Philipp


