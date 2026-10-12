Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FE3CA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Ym9pmTvHGCvGzIEIbpXI+Ln1kCI6J80Q0tQm6YawUg=; b=CNxISuU99d3fLqL5n3uQTALxRf
	DlQVMrqG/ZOxkbkmumaiLzIGgx50tTMtGaZsTc1GywdwMPZuwGY1ibhrePT0L0592ZGq2dBTcysW5
	ORozKbxjvJWIJ4uCg0PE3JAVaufEieSd3jz5rlFQfTx7iCuK5xKIgadorrXzH0eWuG4dsbJMDwbjl
	k0G+nqD7FtzyChYong9QvD6psr3kQ50zIGk3Xb8eQ35GC9W1JhhZRn4e4W4R9sYV5b9Q5w4VeldKF
	SyDXeAOjCclFgHIBu89qlYySfQk77J0RhOaNbnzqRbUszBo5NLkDtaS5bhuhsTiU4oOXfzweaPes5
	yqldi4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9YY-00000009jZ4-3Cpb;
	Mon, 12 Oct 2026 06:30:42 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9YW-00000009jXd-2hxm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:30:41 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2e836252e1dso12624725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 23:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786640; x=1792391440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Ym9pmTvHGCvGzIEIbpXI+Ln1kCI6J80Q0tQm6YawUg=;
        b=IBVg1hKZmiiZJDE2SBBFGuPO4uPbFoxNsl0UnKHkusWnBF1l7xIgBkSl8EtbsF4INY
         4vYlyN5R7qtGFO+nYE7B2lWtI87cugaGi3Oparu3UPne3GUOXufhQOMJSCSMuWd6hTOX
         ThG24dL+8AFQ3GbRcDqZuAl7llwsQO8bfpUD9icnlFlfJOvkLuKZtnvR6mGTYKKOgFkf
         ab7RO8h6wWyT6i5vdgpgizZGscwsaKCqu5BLXWuTb03lLlhSYE4DAmff4m9ZxCHDzuNn
         PxDChub5cr6YgRTq/vUhpRMN3JZSsFr2Ik0g7NqVDiNqrljiGlmkMlEFEYFaTOeTklWk
         2qUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786640; x=1792391440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Ym9pmTvHGCvGzIEIbpXI+Ln1kCI6J80Q0tQm6YawUg=;
        b=gcXrjF5mV8qYqm/pbVxeRs5/hYxEOmPoHZnzKvapcbEOMBCJzc9NgdaD1SXS1OzD2n
         wwcHKf5v64awt4tgs7G8ZYSc7pDsYyEVo8BmY/fv47uOj03ghg2C/KJipFHlKRnAUojM
         xQ3BeGv0COqA+FssemggY0atDZ/xz2t5GAazZpJnPhT9wnUVghIm4WUx0o0mfHyS6Zjj
         lbkEKqbZwz1FCyvBRKVd1py/uMdZZStT1SKjgzHPpVGOBEIZVfZcyvcKB+IH2xGjrI44
         iyyPb8DX33wI13iFaeFbQqHo+05bq6NGiy++mkJTiu6AzYsYHnF+CFZZg0Wv/+UwS2lL
         WXoA==
X-Forwarded-Encrypted: i=1; AKwUvBww+7RKRp4Nego0t5ybLQ0QmHOKJeIsdEbtMuGm2oE5NX+ClQRAKp58dUAsfTQVfSvMcSQu6GZoPmPBhNIODKM7@lists.infradead.org
X-Gm-Message-State: AFq9FYIJrhnm0UPt/DE6F42OD2Cg6VzYtQDE7feKPdPxaEoP8daDWTwK
	8wnGnVHDk4XReta0Eot5mvwKGhw6uVXqp+TXrIOBtRpR5KVhfnRk3wgK
X-Gm-Gg: AYBFou1ZCjJYfdJDj2JTogWX4/yhN3vu7QkdOxmKxk5FPrvpcqIQBh2xAqDDSTTARVk
	tMZTpUSyOl4ezwhhMtx284v9FwYAgpkNs9bsB1/TxK3hvF2r8u436RJTvBf/IusOp/rMCATLKoF
	QkHrBdki11sCbjvVDubbNkDtMpdBMuATfc20YDLZQYC99uAaVO4vOX4ByoHaSCQ1bEUAqLw3RYx
	1Afq+MHdehJ4eBq2JqtOszMvsrz2AMzXS50m9tMgFLOtfAt7yn7WC6HD/f23HasUmaLbUcsLiNw
	LoFoDmyDHXo0OAp1JMgSErPr5srGMhZcunO9i43NNCanCmWwSHdSJY1Gr0+FF7jI6i7R/NsDcww
	k06DWx44axoeMqvgl4mIfdaNW8F/9Tbx6X/i6EfZsIH1+58EoAwuXO03Y0RK2i1SXHFxNLrsNqC
	1/rYuOsZhHvYp/eN0MVY9bOKSU/8cei05M+acEMUzdcR7fFcgmW0sL1N9a69CTnVqDVBQ2EJ/4x
	tnjhpVEyw/tsd8rp6u9lJGO57w0ub1FtWi3/LC1zPaOyclLGA2A7VQ6Mfe2lwE=
X-Received: by 2002:a17:903:15c8:b0:2e2:dc6c:a6d6 with SMTP id d9443c01a7336-2e842aa60cbmr66919225ad.16.1791786639721;
        Sun, 11 Oct 2026 23:30:39 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422da9b1sm39071745ad.66.2026.10.11.23.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:30:39 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	arnd@arndb.de,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 3/3] clk: nuvoton: ma35d1: remove the unused ADC divider driver
Date: Mon, 12 Oct 2026 14:30:20 +0800
Message-ID: <20261012063020.3331443-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012063020.3331443-1-a0987203069@gmail.com>
References: <20261012063020.3331443-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_233040_717723_D0AAAECF 
X-CRM114-Status: GOOD (  16.51  )
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

The ADC divider is now registered with the generic clk divider, so
clk-ma35d1-divider.c and its ma35d1_reg_adc_clkdiv() prototype have no
users. Remove them, including the divider table it built with one entry
per possible divider value.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/Makefile             |   1 -
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 133 -----------------------
 drivers/clk/nuvoton/clk-ma35d1.h         |   5 -
 3 files changed, 139 deletions(-)
 delete mode 100644 drivers/clk/nuvoton/clk-ma35d1-divider.c

diff --git a/drivers/clk/nuvoton/Makefile b/drivers/clk/nuvoton/Makefile
index c3c59dd9f2aaa..3d95466e69b9c 100644
--- a/drivers/clk/nuvoton/Makefile
+++ b/drivers/clk/nuvoton/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CLK_MA35D1) += clk-ma35d1.o
-obj-$(CONFIG_CLK_MA35D1) += clk-ma35d1-divider.o
 obj-$(CONFIG_CLK_MA35D1) += clk-ma35d1-pll.o
diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
deleted file mode 100644
index e992e7c303419..0000000000000
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ /dev/null
@@ -1,133 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2023 Nuvoton Technology Corp.
- * Author: Chi-Fang Li <cfli0@nuvoton.com>
- */
-
-#include <linux/clk-provider.h>
-#include <linux/device.h>
-#include <linux/regmap.h>
-#include <linux/spinlock.h>
-
-#include "clk-ma35d1.h"
-
-struct ma35d1_adc_clk_div {
-	struct clk_hw hw;
-	void __iomem *reg;
-	u8 shift;
-	u8 width;
-	u32 mask;
-	const struct clk_div_table *table;
-	/* protects concurrent access to clock divider registers */
-	spinlock_t *lock;
-};
-
-static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_hw)
-{
-	return container_of(_hw, struct ma35d1_adc_clk_div, hw);
-}
-
-static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
-{
-	unsigned int val;
-	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
-
-	val = readl_relaxed(dclk->reg) >> dclk->shift;
-	val &= clk_div_mask(dclk->width);
-	val += 1;
-	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
-				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
-}
-
-static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
-					struct clk_rate_request *req)
-{
-	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
-
-	return divider_determine_rate(hw, req, dclk->table, dclk->width,
-				      CLK_DIVIDER_ROUND_CLOSEST);
-}
-
-static int ma35d1_clkdiv_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
-{
-	int value;
-	unsigned long flags = 0;
-	u32 data;
-	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
-
-	value = divider_get_val(rate, parent_rate, dclk->table,
-				dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
-
-	spin_lock_irqsave(dclk->lock, flags);
-
-	data = readl_relaxed(dclk->reg);
-	data &= ~(clk_div_mask(dclk->width) << dclk->shift);
-	data |= (value - 1) << dclk->shift;
-	data |= dclk->mask;
-	writel_relaxed(data, dclk->reg);
-
-	spin_unlock_irqrestore(dclk->lock, flags);
-	return 0;
-}
-
-static const struct clk_ops ma35d1_adc_clkdiv_ops = {
-	.recalc_rate = ma35d1_clkdiv_recalc_rate,
-	.determine_rate = ma35d1_clkdiv_determine_rate,
-	.set_rate = ma35d1_clkdiv_set_rate,
-};
-
-struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
-				     struct clk_hw *parent_hw, spinlock_t *lock,
-				     unsigned long flags, void __iomem *reg,
-				     u8 shift, u8 width, u32 mask_bit)
-{
-	struct ma35d1_adc_clk_div *div;
-	struct clk_init_data init;
-	struct clk_div_table *table;
-	struct clk_parent_data pdata = { .index = 0 };
-	u32 max_div, min_div;
-	struct clk_hw *hw;
-	int ret;
-	int i;
-
-	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
-	if (!div)
-		return ERR_PTR(-ENOMEM);
-
-	max_div = clk_div_mask(width) + 1;
-	min_div = 1;
-
-	table = devm_kcalloc(dev, max_div + 1, sizeof(*table), GFP_KERNEL);
-	if (!table)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < max_div; i++) {
-		table[i].val = min_div + i;
-		table[i].div = 2 * table[i].val;
-	}
-	table[max_div].val = 0;
-	table[max_div].div = 0;
-
-	memset(&init, 0, sizeof(init));
-	init.name = name;
-	init.ops = &ma35d1_adc_clkdiv_ops;
-	init.flags |= flags;
-	pdata.hw = parent_hw;
-	init.parent_data = &pdata;
-	init.num_parents = 1;
-
-	div->reg = reg;
-	div->shift = shift;
-	div->width = width;
-	div->mask = mask_bit ? BIT(mask_bit) : 0;
-	div->lock = lock;
-	div->hw.init = &init;
-	div->table = table;
-
-	hw = &div->hw;
-	ret = devm_clk_hw_register(dev, hw);
-	if (ret)
-		return ERR_PTR(ret);
-	return hw;
-}
-EXPORT_SYMBOL_GPL(ma35d1_reg_adc_clkdiv);
diff --git a/drivers/clk/nuvoton/clk-ma35d1.h b/drivers/clk/nuvoton/clk-ma35d1.h
index 3adee440f60a3..06300511987ae 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.h
+++ b/drivers/clk/nuvoton/clk-ma35d1.h
@@ -10,9 +10,4 @@
 struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const char *name,
 				  struct clk_hw *parent_hw, void __iomem *base);
 
-struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
-				     struct clk_hw *parent_hw, spinlock_t *lock,
-				     unsigned long flags, void __iomem *reg,
-				     u8 shift, u8 width, u32 mask_bit);
-
 #endif /* __DRV_CLK_NUVOTON_MA35D1_H */
-- 
2.43.0


