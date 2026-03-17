Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9C9FB5E90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 00:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bjsh2f+U2hpeWjteAhQ/eYeijSGr3dLnz2WVmUmGTyE=; b=wDP4Kkn+DchCDw7IQegcYqFZA8
	Rw4nH63uVzRZU7SqNQ+bFKRSXG2pcnyK5idEc9l/vTXecm90bfYUf7vSmr3ljPLfDnimboCavgpYq
	dinwA4o7CP4i2VcLGoXqSs+g62GbqJkD7QP12L4uoxkUCrUnEDuyawjqcMvyWYpS/z2nZSWKq9hXb
	/bF8nV9D41X35aEuSJiQ5mG/JXLoX8fvNgk4pEPuCbe+drt20iUL/CKis2OxdljFolHqLxwcQtF71
	sEDNlkIwRH2AsqqV6Y21ox9GWBlHTW1dgWwbNjnYjV/KyPuDrpR/1AHaDYrvFun3heC1atRdcSFmE
	wbRWwv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2IMT-000000058fT-0DVf;
	Tue, 17 Mar 2026 00:32:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2IMQ-000000058eb-3PXI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 00:32:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b0484a6de4so10325555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 17:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773707558; x=1774312358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjsh2f+U2hpeWjteAhQ/eYeijSGr3dLnz2WVmUmGTyE=;
        b=ZuYJ3mOXA+hEAP+j+6B3+ui2GV8uEGyoCCGgY4RO98TP7P1CS2JXiDYgU58PZSeHqK
         0gi3KzNXetkk5wAcNTcaQWrj0rshJOzJlYXysElghtgbr2NmNdl1pspIOtbB36NQcbvy
         wVp9dbYDasBCsPzg7JGnJ+B5VJS+E59vGoMVr3NBVFrLcwzjp5y38zFV4zagqbJMhT47
         3Jj20DX7etU3/cYu8qmGsG/l9LVYbtfnCRXu2y9e5fxKcziYzTtxqGzjFaFUUf6L1AMy
         z8Fmf+72Ru7BrknuU01YSAvZJCQ6fiT0avf0vHW0vqxs8CmGsdOll+Hbk3WJsNMdLVX7
         zjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773707558; x=1774312358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjsh2f+U2hpeWjteAhQ/eYeijSGr3dLnz2WVmUmGTyE=;
        b=ilu5LZUekbtDf0CSW1qkGnGHfocE4IeTeU72IJEvxAfcHZxR31AckFWF7ymDqoVsFk
         bnT9W5E3tQBwMF66l6zLM6U35f3D4G2xW0ErXGn7PbykuvHg8Xc3H+/Ixpew6uMWnOL2
         Pnk8IMiWdVh+BOiKKvg3O3e0vlSpWs7Aot6qCtwK4K9+PWoslN3iZSBcfkUSqw1BgoJV
         mEdHL1JaEoi3cZ2aH3JcYnhHF1ZuYNGBD0hPl2HOaOa7X9qcNIkeqFFhaHpRWeQIRuuS
         EK+Asa/vSrCtYAPA1BceZm6oy+NWs913RyO6oXCI4dNrw0gNhv/yedT4B6Wm3U1xZ/r1
         wiog==
X-Forwarded-Encrypted: i=1; AJvYcCWis0hipJ29dd5FUcG4Pn7ldigIZfyNeYmlXcP0b+kQEdaxlCK1JJDkKyNTp9sOx86Hingnd59P6bfR0A8ShI/G@lists.infradead.org
X-Gm-Message-State: AOJu0YxSHxfnDsaCesWhl2k30lx+LmIbH67eo/PHYCsaTlXEjlxRO1dL
	dxqKqrnBJgGYQPEHCywla/yH82uiHkaFxz4uzOG3ZX0CVemszz98zfml
X-Gm-Gg: ATEYQzwysh8ulRCfGXg0LhxQneGEwdNtKjOgWH1EbRi/ySGFfBdExCfVQ9hpe2X4IwN
	Q35pJMa6AEGxIe9hFZf87O1TL9RaOQmxee6ORtve/0HTx+cSp+29QJlZ21BoQmoL52iOUSJ4ak1
	M/c9bLJ73XB0mT1ppHn50/YhYK9F8ayY53PkSS33+ByQOJ2Q5QSx3dKHzIPDQt+PNF2c1Xf3g/r
	xBDmaMcdkugDcrTxaYTLYVfc26CVZSSJST7B5N7sHofXTP5OIUXxsvObZR9J5NYHA2VSeIgPcRo
	uCNwI8gA9Pi2ZuYsGgT3U6J/1L7bW8s2ZreNYFqbqp6va3tZW0/+Vs0F0QPUbSoP+cXvJ2bumgD
	O3t/1ksMkorthtQRjI5wPh2zA++IaQkmJ8ghCBLORvlN/fWzz0dH8ywea5l0ZaXVZdphiSK6H+e
	hXIQX92SLcazsyYPDL46d+/djXf8RSGhFM8KLh7bskLJBdKDSrdOKdjyM=
X-Received: by 2002:a17:903:3b8e:b0:2ae:aa16:acf7 with SMTP id d9443c01a7336-2aecab0be9bmr141252575ad.40.1773707557570;
        Mon, 16 Mar 2026 17:32:37 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06272ab03sm13019265ad.64.2026.03.16.17.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:32:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/NUVOTON MA35 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: nuvoton: ma35d1-divider: simplify allocation
Date: Mon, 16 Mar 2026 17:32:19 -0700
Message-ID: <20260317003219.71972-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_173238_858038_2886890E 
X-CRM114-Status: GOOD (  12.95  )
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

Use a flexible array member instead of kcalloc + pointer that is not
actually const.

Simplifies allocation slightly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e992e7c30341..6eaca5b35dd8 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -17,9 +17,9 @@ struct ma35d1_adc_clk_div {
 	u8 shift;
 	u8 width;
 	u32 mask;
-	const struct clk_div_table *table;
 	/* protects concurrent access to clock divider registers */
 	spinlock_t *lock;
+	struct clk_div_table table[];
 };
 
 static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_hw)
@@ -83,30 +83,25 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 {
 	struct ma35d1_adc_clk_div *div;
 	struct clk_init_data init;
-	struct clk_div_table *table;
 	struct clk_parent_data pdata = { .index = 0 };
 	u32 max_div, min_div;
 	struct clk_hw *hw;
 	int ret;
 	int i;
 
-	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
-	if (!div)
-		return ERR_PTR(-ENOMEM);
-
 	max_div = clk_div_mask(width) + 1;
 	min_div = 1;
 
-	table = devm_kcalloc(dev, max_div + 1, sizeof(*table), GFP_KERNEL);
-	if (!table)
+	div = devm_kzalloc(dev, struct_size(div, table, max_div + 1), GFP_KERNEL);
+	if (!div)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < max_div; i++) {
-		table[i].val = min_div + i;
-		table[i].div = 2 * table[i].val;
+		div->table[i].val = min_div + i;
+		div->table[i].div = 2 * div->table[i].val;
 	}
-	table[max_div].val = 0;
-	table[max_div].div = 0;
+	div->table[max_div].val = 0;
+	div->table[max_div].div = 0;
 
 	memset(&init, 0, sizeof(init));
 	init.name = name;
@@ -122,7 +117,6 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 	div->mask = mask_bit ? BIT(mask_bit) : 0;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;
 
 	hw = &div->hw;
 	ret = devm_clk_hw_register(dev, hw);
-- 
2.53.0


