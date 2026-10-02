Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAAECA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ri2HpUjT8qOrOMqbL2h+R1txn9sz+vfKeiacwgzeYJM=; b=LdYSsP64WwzLRi2zDoE4zAECTb
	aIfbRSSDaBLD03q9j+A3Y+nmYEDTjdlf2WOXjW1x+mTR65GuiKjefl4FvewrQvxvkLpABX7K8B/5R
	JIPEmNfdEfK56cAYJSytieaJzA7stD1BDSul2IwCsQSv9pqDeWsh5yIE2DYXtHlOASK4Q5+iYPFKD
	sS9JVH3Ojpwf4QS1kPXTVpJNXUst9Ueg3JoXbebd0fmd24qju9y14b3yQ9Two9Wv2zhzMZuxeHH8Q
	TiUdGC3ePnTAY2rPVbm+Isu27bt+E/uuukUxSzNjGN+O7qawEPCYXNwarEblktO9v+Tk0U3z2Juwn
	lv20d7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXwW-0000000Asfe-2xLX;
	Fri, 02 Oct 2026 07:44:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXwL-0000000AsTE-0mva;
	Fri, 02 Oct 2026 07:44:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ri2HpUjT8qOrOMqbL2h+R1txn9sz+vfKeiacwgzeYJM=; b=Zcvja022EfidXPvn3TX5QdQLBr
	1Tvpw2KwzeYccwV891po077sESyPzzhYlpHWy95zhh7H4LfMLfupiiB6TSn0tgsv4lt5M6zlOZPYr
	ITVm8jMYrYc+lrYCrW1yW3maRXuhBwgkiFDB9kNgo01L5B6N6fFneXz8uz0hUoRWZpnJMSPuTj0s+
	hKiRu9owQs5H5jvTaoKSUucYf4dPMbBl53wNXATH5q/tEfHoKDoUdJ+McNZucPxlYdSkvY3dJGofw
	nw26uXBIB30gr2FlpXBjpsZC8akc9A77FYvlDV08g5UDUv7p0ExPY4Ww1KiY3stChoXQoTO5QEMlF
	ZdT8scig==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCXwE-00000005gkv-1G8k;
	Fri, 02 Oct 2026 07:44:20 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6927hnoL73646819, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790927029; bh=ri2HpUjT8qOrOMqbL2h+R1txn9sz+vfKeiacwgzeYJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=sNQYpjxzr5zOue+wvwPKIHzThVYDGZfVfbCVZ9iI7uaCkFEnA9D1uLvYIjEGDyUr1
	 iKMd4tOpu1zWdA6qMKC44HVuZH1IPRvGjjLjHLxwclGGM2wkthyiEMlQHw1l7vs+Ne
	 CbHrq/oTtDAtLyDP+GsMiEPoKRfNyeMxUqYDwHTkB4/C/lqRcfU0CnTOwVblAVbrrQ
	 Vg8GnTiN+8r3IP6eVDbZ05N+k9DLpj4ovF1XRz77+ahT5zUn0fpS1PmpcNkf9TcA77
	 0lrhbv1Xxmqoyw2xr+qGtEFp1+ai0VhcGPq/Syn36j/9otCFwLbDGMNc43LhV2VTOU
	 pbSrjonx4Pxqw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6927hnoL73646819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Oct 2026 15:43:49 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 15:43:33 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 2 Oct 2026 15:43:33 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <jbrunet+clk@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>,
	<bmasney+clk@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>, Brian Masney <bmasney@redhat.com>
Subject: [PATCH v15 07/11] clk: realtek: Add support for mux clock
Date: Fri, 2 Oct 2026 15:43:27 +0800
Message-ID: <20261002074331.3066919-8-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261002074331.3066919-1-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_084416_110677_22AB7F11 
X-CRM114-Status: GOOD (  17.56  )
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

From: Cheng-Yu Lee <cylee12@realtek.com>

Add a simple regmap-based clk_ops implementation for Realtek mux clocks.

The implementation supports parent selection and rate determination through
regmap-backed register access.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v15:
- Simplify 'rtk_clk_regmap_mux_get_parent()' to return the result
directly.
---
 drivers/clk/realtek/Makefile         |  1 +
 drivers/clk/realtek/clk-regmap-mux.c | 38 ++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-mux.h | 43 ++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 840aff067b61..217ccaf5644a 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
 clk-rtk-y += clk-rtk-common.o
 clk-rtk-y += clk-pll.o
 clk-rtk-y += clk-regmap-gate.o
+clk-rtk-y += clk-regmap-mux.o
 clk-rtk-y += freq_table.o
diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/clk-regmap-mux.c
new file mode 100644
index 000000000000..01017a90d0ef
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-mux.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/export.h>
+#include <linux/regmap.h>
+#include "clk-regmap-mux.h"
+
+static u8 rtk_clk_regmap_mux_get_parent(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap_mux *clkm = to_rtk_clk_regmap_mux(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
+	if (ret)
+		return 0xff;
+
+	return (val >> clkm->shift) & clkm->mask;
+}
+
+static int rtk_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct rtk_clk_regmap_mux *clkm = to_rtk_clk_regmap_mux(hw);
+
+	return regmap_update_bits(clkm->clkr.regmap, clkm->mux_ofs,
+				  clkm->mask << clkm->shift, (u32)index << clkm->shift);
+}
+
+const struct clk_ops rtk_clk_regmap_mux_ops = {
+	.set_parent = rtk_clk_regmap_mux_set_parent,
+	.get_parent = rtk_clk_regmap_mux_get_parent,
+	.determine_rate = __clk_mux_determine_rate,
+};
+EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ops, "CLK_REALTEK");
diff --git a/drivers/clk/realtek/clk-regmap-mux.h b/drivers/clk/realtek/clk-regmap-mux.h
new file mode 100644
index 000000000000..ad524bb86a19
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-mux.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_CLK_REGMAP_MUX_H
+#define __CLK_REALTEK_CLK_REGMAP_MUX_H
+
+#include "clk-rtk-common.h"
+
+struct rtk_clk_regmap_mux {
+	struct rtk_clk_regmap clkr;
+	unsigned int mux_ofs;
+	unsigned int mask;
+	unsigned int shift;
+};
+
+#define __rtk_clk_regmap_mux_hw(_p) __rtk_clk_regmap_hw(&(_p)->clkr)
+
+#define __RTK_CLK_REGMAP_MUX(_name, _parents, _ops, _flags, _ofs, _sft, _mask) \
+	struct rtk_clk_regmap_mux _name = {                                    \
+		.clkr.hw.init =                                                \
+			CLK_HW_INIT_PARENTS(#_name, _parents, _ops, _flags),   \
+		.mux_ofs = _ofs,                                               \
+		.shift = _sft,                                                 \
+		.mask = _mask,                                                 \
+	}
+
+#define RTK_CLK_REGMAP_MUX(_name, _parents, _flags, _ofs, _sft, _mask)               \
+	__RTK_CLK_REGMAP_MUX(_name, _parents, &rtk_clk_regmap_mux_ops, _flags, _ofs, \
+			     _sft, _mask)
+
+static inline struct rtk_clk_regmap_mux *to_rtk_clk_regmap_mux(struct clk_hw *hw)
+{
+	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
+
+	return container_of(clkr, struct rtk_clk_regmap_mux, clkr);
+}
+
+extern const struct clk_ops rtk_clk_regmap_mux_ops;
+
+#endif /* __CLK_REALTEK_CLK_REGMAP_MUX_H */
-- 
2.43.0


