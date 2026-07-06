Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F162BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRVceNWKrizopvzD3aCqIwZgJOVArB+G3JrWb7+Dpwk=; b=skuRUjuA+9GrwE2A6y0HG67ZFn
	Q9J2SO3ZQR8HzjML4xwDLhxZPWimyz/D97L5i2IxYTU8soJwBvCnjSnBiHC69clyb3TFeRjSMWTcb
	5Etr6Wjy+7xf7BQynXBDBqS80OliyB+NL4h/jSZjrrov9OChH7o6e+tNJ2b2imFesRkO3tQszRALJ
	sv9RDVkncNOczH/9m58+EBfAjJYk91yeZBASXaqoFKCcLjRf4c+qAut7gmsuBfB+/6VOZs8b3kVW0
	a5SrD3Usg4g5dEfLD6S7oegROBxSc1lJNxUEbjj5f6KF76vKFTTx9ZJ8z3uy4Ev+h6ln4kNeSH3UJ
	Y89Ce4ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgv-0000000C1ty-30Qx;
	Mon, 06 Jul 2026 09:32:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgo-0000000C1qB-2Xyv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:32:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493b1710405so16765335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330353; x=1783935153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRVceNWKrizopvzD3aCqIwZgJOVArB+G3JrWb7+Dpwk=;
        b=E0HaVw40sjrnUR7Uvm414MYIkUCBiULqjDAxoPGkcxFNbHZLbXg1gm9JK/9g7uUdsA
         Yj1bUoY20cZpDYnjm+yJu6HPPgTGeqCN3+v2379a4apHoBZaXw3BhXgrOIxJz+3WdNo/
         dHkOWg/oj2AAgoHpuR83R0qLUV3a6zjyrnmy4dr/mXf9nAQk2pq9/NiPsN9tp3AQJyKK
         yfIS1LVIXrYtV1sRL19iVLzycqeusJTN63vFt38bMyIf39GubV3CqN4m0fBcLE887ePg
         mzvbuxv3KMk3eNTKevmwYl7jhKQyuaH4/VFROelaqRaT7DeVdVWms+9iln7EqACmOM3q
         V4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330353; x=1783935153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRVceNWKrizopvzD3aCqIwZgJOVArB+G3JrWb7+Dpwk=;
        b=lmO1FSbLoiIVuUt00E/Z0zfE2PAVcQ54nF3bcinw2rz0xuK0vdaMO1H48lga+b2rRt
         SfmynpToXTT7pmu60Y10KOV+KKxioXqukcRdCWQjRMZA+mmTBIC3FzjskmOLBjQQGpZH
         9ZxhiOyeHTeD5f3jG5Fxh5KC+DEhCnUsUcdLsboOset89o7aCy7XOnOKU0DoJYSc3Tl/
         Fbv899K9BrLyT7CyLfaY0IENMQEhEetMECSE2zthQ3gs8rEmljAQjLG6/R1xaWORRCEk
         ZFxoc8FgBNiwMYRkkbnkO5rRMOnv0CHTXHiN8mDtul7CdT/WP0x5StwxSz9LX0nMlQNq
         Sfjg==
X-Forwarded-Encrypted: i=1; AHgh+Rqy+e6l7cr8GG+EIBR37Q2JQ610DsoZbZWgElIW5J0fwqa3QeHl9LqIPVzZ1/xpOciEupga1s5OugCC2fr4J1zF@lists.infradead.org
X-Gm-Message-State: AOJu0YygQTc6dh3YzwMLUDcy5DXWmSr4YJKj/wFrW2bEx4gMzet30DNT
	BEKvGm0A/cZAErcQkEJW3o/nU3KAjDZVFa4nfxUccKaeKE8nhfcQq8HD8R4P4Dxrtqc=
X-Gm-Gg: AfdE7cnztTFD5xv0ajJCyzE/Htv0YRuQCNwjwTvc6jDZ76KIqgHB2nC0LewfeZqZQkT
	Hb9ih1e5AksJcFHAlAG+cFdVE3i+Aamx4ar6XTLxGZU85ZBUDTY+eAQdYuo7c7LTk6T5ZW5+pFv
	KJCt1c17gvIsi27WX2/6wuwl8SXSpaVNmmHV3km6IRmQvIE6ehgfQDa6RsS8GfVciUIbgy3xqvV
	Fjc0mPGNfsNKbBi8LL7bwjq6MTKS+2B2tHz8+2oCHB6/91+auybDPk3sCVTwVQViOP3B2Pdh0zO
	n3ViKVT57/5EfuUOU4mtgFOTyJIyJJFEX69CyJ9mOsRqIZEXN9qqTU6JeeLYhtTtJ8cG+eR3VqH
	JXxsG5E4crgYbNPYgNNpfXYBK0Hvi+qpZsE6RV4VmXKry8HU9VuM3afIrMHqqADf1X88pYINoS7
	aZgBjMpZcS+fA=
X-Received: by 2002:a05:600c:34c2:b0:493:d9f7:a3cf with SMTP id 5b1f17b1804b1-493d9f7a46emr40792585e9.17.1783330352689;
        Mon, 06 Jul 2026 02:32:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f21328sm23563937f8f.32.2026.07.06.02.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:11 +0200
Subject: [PATCH v4 3/9] clk: sunxi-ng: fix ccu probe clock unregister on
 error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-3-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0wL9DFcZk2JYigmbAzm9ZXDoHfKQS3sFzWW4YpBPgNE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Yi2lp9VUHi+gso0+D9KwXzeep3V0RfyNlFD
 8oFLIsmOIuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IgAKCRDm/A8cN/La
 hRUhD/43mj/jSnmTPc6rmiE4hnV86LDOF0szU0PUXIpytazGHAtIxmIDIlDKZTKCzeCtFb+X2yN
 O/s/rHXB1C+BZ9MaOlMCYM0niirJAu00pMeBFGETxKG3I8YRHs+rNdJmC6VoqYC4z0Xz6ouUuB6
 F7H4bIvuRdl/OyxsKmlj68XDBC6sEmE45CWMw3K495dkJO2MVRzo44+PdOeS2CBMGaqyMm6rlLQ
 HfcyybFMnwendBHYvURq3Tj5X7jtU2Z7OU874xC513CD24FpoPPB9XlZEV7WC9VtuJATL+FDQKU
 quYzgL6d0ZupraF4eBWGwMhmS6c6K7XL6utTkJcVwkriLHpqpG7EYAIFYLhv3f2qeXg6Dhp0FTQ
 MT8mWJzoeWF0osIDidUxMJXyVokwTSLbcz9hl+erkiIcpeBCVAK8lDg6jGlI3n7cJmfobT24H0y
 Oav4Vbj5g5N4MVMWj+xPc2USxc/fHEVfFUb51Ah8xbogDUhoqXVN9TAluM65k0ZT466yFRMs7XP
 6584kIeGiCARD+aRYt7m+Hbu79oTxky41yMn7qDhoh9x8jkZLXaO6E2yTxjwaKrOJTf/1xRNgex
 wCMFX/3ZZOlE8ra7Ib9VghVqUgvZe8/5yH3ZQweTa5lMCEdY5u4Sj8XWdBV6IcUprwnLKdIf/fB
 FYqd09N7mJzneZw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023236_285177_B9410929 
X-CRM114-Status: GOOD (  15.78  )
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

When registering clocks with sunxi_ccu_probe(), the number of ccu_clocks
and the number of hw clocks might be different, eventhough they usually are
the same.

If they are different, it could lead to out-of-bound access or registered
clock left behind on error.

Use a different variable when iterating on hw clocks so every registered
clock, and only those, gets unregistered on error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260629131254.7E34C1F00A3A@smtp.kernel.org
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index 1c083b4d0b7e..43d8eca6abee 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -114,7 +114,7 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 			   const struct sunxi_ccu_desc *desc)
 {
 	struct ccu_reset *reset;
-	int i, ret;
+	int i, j, ret;
 
 	ccu->desc = desc;
 
@@ -130,8 +130,8 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 		cclk->lock = &ccu->lock;
 	}
 
-	for (i = 0; i < desc->hw_clks->num ; i++) {
-		struct clk_hw *hw = desc->hw_clks->hws[i];
+	for (j = 0; j < desc->hw_clks->num ; j++) {
+		struct clk_hw *hw = desc->hw_clks->hws[j];
 		const char *name;
 
 		if (!hw)
@@ -143,7 +143,7 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 		else
 			ret = of_clk_hw_register(node, hw);
 		if (ret) {
-			pr_err("Couldn't register clock %d - %s\n", i, name);
+			pr_err("Couldn't register clock %d - %s\n", j, name);
 			goto err_clk_unreg;
 		}
 	}
@@ -186,8 +186,8 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 err_del_provider:
 	of_clk_del_provider(node);
 err_clk_unreg:
-	while (--i >= 0) {
-		struct clk_hw *hw = desc->hw_clks->hws[i];
+	while (--j >= 0) {
+		struct clk_hw *hw = desc->hw_clks->hws[j];
 
 		if (!hw)
 			continue;

-- 
2.47.3


