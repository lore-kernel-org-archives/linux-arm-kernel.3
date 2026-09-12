Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F376C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 00:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eigGeAMP83LxrsKBiSA2Uv71rHDhlLqddwKc16SH2gs=; b=bdlrDf+kvH9+fgWEpE0cRJLPJ+
	OtAt9dlBu9SRi85Xdh5bIca33WuEVffIdYvlSLE4aCNtbgHbYy/sE+/jBwjNjhXU9sicnWRcvZUvS
	IWSl5/AIYH0ByI1m2toX/FoJ7qtke6dsdt/ozxH9OhpIQF6skW4IVnVI7i6vyiXDmrhgHS9nzROG+
	tQkrxanhxli02+L5zFGEUr+/VoRDuZUNkjl/hdx5YfKjmGG8j9ZPH9hn8aPuxkqzjrw0IFewQlY2U
	977fthtLc8AENu+kCHl/P3keApd8yG2FWrkG7WGsTsEt9uyL5++OzaGGgPCW9Jw1+Rbkhw0VVgEOV
	JMLLxFDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BWp-00000000R9x-0MFl;
	Sat, 12 Sep 2026 00:23:35 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BWl-00000000R9c-3Lyo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 00:23:33 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2192512a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 17:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789172611; x=1789777411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eigGeAMP83LxrsKBiSA2Uv71rHDhlLqddwKc16SH2gs=;
        b=K5NqnNQbgK7LSqbIh3hao/FM6x7Pzpo9W/JhPhyJL09YxeOYuPi85ghNovwQQUor30
         0Lg43tKC5x9v5Sb9pxVa78VM+nzaMCGRRywRSzfVIDLw17QXBCg/14IiqzyV41V2FSx5
         GuqZk9wvQio74xJ4SsXc7Upcd+TOih6lHsz9bHfDBIWHSOBCwTaKLK4KcdMyATldugxO
         uvhT6I1grJqsFgHFyMDC2xtr4ern5QlxK60J6h7eFmvwhS5qdaMahJvX9Zoub2slgXR6
         wmF7g7gwWhBCc0CgKip77XQZZIee7SkwjbZT/t3HAeyl8Mi7lL2PPLOmWjKam00p8aW9
         LuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789172611; x=1789777411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eigGeAMP83LxrsKBiSA2Uv71rHDhlLqddwKc16SH2gs=;
        b=kXjIR66aKFZQuuTGUubssNhFArNmsK2vWglkIih30OOv8w72eDvwk29LPvLoAvEq7J
         RxiBNa/lHhMDbGcRQnNLZY62HttHKIkraengilvZ1XI6qAhAnMhvtIdJLL3O7LL+QuUp
         kkzxkGrEFYTi2bEfbzFnt9/uVhN11TSdqrIFBv0pjksbVSLHiIzZQB5B5SYVskQGWffM
         v1Gr6qza6bgzEXVEaibF/QiqGhxV+Rypf9AAZuCX0DLrOuWB2gOs8cDFrjdd2Uk2JA7y
         ct+0N2x3tYoZXnfD+oV6aFC7vRQ44zEdhKhHfPDveUbSHL8buK0QBpt8hkN9wK34PY+P
         j7dQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIlRlvEW1MWgr1gb6iFklEfa90iJXNo7mq6zPAAQ0hoTLnOXQr3Fj3KgKK4a6H13sr/8VM4O1ptC8s+BVomM0u@lists.infradead.org
X-Gm-Message-State: AFuF++nH/lkbUewiNEUa23yKMVZ/jJ6N0yvdHa8G7qE2CDtpvBZTjUjE
	wHledygD1DxJ46DOruA/CUCLGEcsSGqPLIuqNkVs8/0j8Rh7uuNI/Jby
X-Gm-Gg: AYBFou1YMLcxt2yzAChWZp0qYWK5dzeujBDtcbNnsKTOMYdkr2kLXR0kTGW/m+XsFST
	VCvawlWRPnzHj7dVEuYLluo+Vhc9/SoH+K4QKV7zeQtMRH3gsda7FyB1ySxh54CzVAwPXbSWGq4
	qyqvpM6ItbgIshn7AJYJB8LD2O7TVNZN24GSPVKmjFlx/oxlegkoXFfncpCZDd+yObJkmXLskSR
	FDGqvMRZJdWz/t+JyjNrqYG0GmnWUjcyYlczsa/QiqoWVlhY6VWssDr01YVHBC01Lb1BfqIF4CQ
	F8pvz6AKXpO5R4f2qalYj0g2i2Sz00DgZn93W7mZ3/KN/NwHYDlPIyhkBLEhyOWD+C64Zzjn+Uj
	DoAHByZPQHv6aSEAKkL6rZ+BsS5SPO0ItE/iy0OLlkdDFPt8Q6sYEMceVp9rXi7n5/VLHDXuT35
	N7iLJiWBuPjCTg0HXsgEE47yMbsd0Wvdk15h3JVryXaEd3iuvT25H5HzYC9DX4E7kh9f7R3IzQ1
	WHSiWPkrLFgs/mAuxOb1tZ9gLTXLAM2yvqYhELgYQIdxCI6uwPH+FHp1GMR6i2H/lWSQ24w10T+
	CK+YGaneIpXcSPOaw+cGBdaYsefy5a7xClrv0I4IS163JuVK
X-Received: by 2002:a17:90b:270c:b0:39b:a8d8:985 with SMTP id 98e67ed59e1d1-39d9c0ad3edmr11221696a91.12.1789172610740;
        Fri, 11 Sep 2026 17:23:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff6780sm17510475ad.76.2026.09.11.17.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:23:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/NUVOTON MA35 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND] clk: nuvoton: ma35d1-divider: simplify allocation
Date: Fri, 11 Sep 2026 17:23:26 -0700
Message-ID: <20260912002326.237419-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_172331_844874_ECAD01B5 
X-CRM114-Status: GOOD (  13.48  )
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
2.55.0


