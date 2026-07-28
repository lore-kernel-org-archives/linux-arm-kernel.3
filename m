Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE7CC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5faQwISMgtl2nH8ImRGXS510RUHcjrYzSgsUcLwwm4o=; b=13chkGEsUxnqHTmuXQ18juA3/G
	3AiVU6MVKDdpCMglp5mszV88rkaumchgHoHqHUSu9Nq54av2fzgAcqSlAjRZmCkzIKytantZQGzzJ
	Kx3mdXYe5MnbnqsoK9cNjieOmnV93fx5TyV3nA+XR4ksvmZa9lORZeHSKoGA7UTa5F9OvAyyEioUq
	06ZcFJ2HOZNCPspFpKE2mHioNBWhxJgN4Y/fXar9DLFo+eLm5+MhniMhsuZNrySyJ2IYziJAurQpN
	8qpNFfxS1PHElJQ/5i/IVnFXwvD7ATwSpKjKqwg3onJNJHitUTQ3Pz/756Un0fNDsiLzF7fBZjhWW
	hVX1CHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woinv-00000005Txj-2Rgt;
	Tue, 28 Jul 2026 14:29:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woinu-00000005Tx0-2ava;
	Tue, 28 Jul 2026 14:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5faQwISMgtl2nH8ImRGXS510RUHcjrYzSgsUcLwwm4o=; b=NsDQBLNUSY2RAJRIi3YMWGGW4E
	PneO2V0twWtTwcjPdTcb3lHIgv1MLtIMP5iV4BfNhsp4yCygUgtfx2ZgsACc73LS6CKeJue8L6PA1
	iN5vZ4651rSbvbHGQRxPnPC8mxu+Med5iK7ThiksdCwfK0A+2hA+y2cxcePeWUKfQ2UCXiHOEp5y5
	4xN85eFMoLi3VfxnffSxGTNHaIe15/WCf27GF2u5ilfNypH5wKcddDdYYzykfOb5WIaFHWHRyevZ2
	mScllMxDkiRWRo2gwelReaEbDG1im/wl2FyQl7pD1cG2ge2Ljzre0KE95zY+IVxX2WQbLli5THoFT
	qXWWzNUw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1woinq-000000051An-1IZA;
	Tue, 28 Jul 2026 14:29:08 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66SES7jjC3929845, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785248887; bh=5faQwISMgtl2nH8ImRGXS510RUHcjrYzSgsUcLwwm4o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=e9KbIqbtLrNejepj+4aJib1e/FP9dr5s/Ewn/Krsny8dBK5UE7fn5a055qKLtmZdD
	 uLhPyTXEUvnEPKfxL+drGVY2PlFCD5zLDglNh4z3JLz0i9Y619hX3CGhhW62HpUF+j
	 hLvemJfbjCwk/6pNWZBZjkDd0oIzedtXifYDv0Q1Ln+YMxEwLpfTkzHCKYv8tOyt/E
	 CBf9OIh1fhpwg4w0iM+qLaBH7QsCktqesgzc0EeriqKIhvORLmKZ2Y9HtP0MQkZkTl
	 fmYKxH6JYvOpDopvcVqNsL3r1EuvOaz5zfDvgRb9I8fGvxuGQEEMOkYHezID3PY782
	 PmsxCKqOGwwrA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66SES7jjC3929845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jul 2026 22:28:07 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 28 Jul 2026 22:28:07 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Jul 2026 22:28:07 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <jyanchou@realtek.com>, <bmasney@redhat.com>
CC: <afaerber@suse.com>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v11 07/11] clk: realtek: Add support for mux clock
Date: Tue, 28 Jul 2026 22:28:02 +0800
Message-ID: <20260728142806.1954638-8-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260728142806.1954638-1-eleanor.lin@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_152907_042277_CB4A9F37 
X-CRM114-Status: GOOD (  16.00  )
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
---
Changes in v11:
- Add 'rtk_' prefix into struct names and function names.
---
 drivers/clk/realtek/Makefile         |  1 +
 drivers/clk/realtek/clk-regmap-mux.c | 41 ++++++++++++++++++++++++++
 drivers/clk/realtek/clk-regmap-mux.h | 43 ++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.h

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index 90c0658a83bf..3b014240a211 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -5,3 +5,4 @@ clk-rtk-y += clk-rtk-common.o
 clk-rtk-y += clk-pll.o
 clk-rtk-y += freq_table.o
 clk-rtk-y += clk-regmap-gate.o
+clk-rtk-y += clk-regmap-mux.o
diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/clk-regmap-mux.c
new file mode 100644
index 000000000000..aecb57e58505
--- /dev/null
+++ b/drivers/clk/realtek/clk-regmap-mux.c
@@ -0,0 +1,41 @@
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
+	int num_parents = clk_hw_get_num_parents(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
+	if (ret)
+		return 0xff;
+
+	val = (val >> clkm->shift) & clkm->mask;
+
+	return val >= num_parents ? 0xff : val;
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
+EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ops, "REALTEK_CLK");
diff --git a/drivers/clk/realtek/clk-regmap-mux.h b/drivers/clk/realtek/clk-regmap-mux.h
new file mode 100644
index 000000000000..f19b88108876
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
+	int mux_ofs;
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
+			 _sft, _mask)
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


