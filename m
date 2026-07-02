Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE7CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4DUzlDYde7+nlA7K6gg98zrSYXmo4pVwxHlPtRIQOc=; b=iStFi0lRbo2ZEr/5trN1b2Dif3
	7/4FvPbiEun67xTcIWqCZceCwtwIAxqMf8QWbp32nzBxzyCBenc8XbmhKFJegwQfgB4PFVCNkLUWM
	AMHlCeK0kPNbxjw8gS6gOjP3cNVlK9id6e8wsH1WqSbkktyInq2Q1AK73ihZoihvVglywHCIHklGy
	67AV0jvY37QPYmsLRULzA1jsC7ZLm/bVXEoQmbR0EcQEH6SoKbpzF+Pusks6pSL7jCvfq3pE20lPK
	bcui74g2FfF4ry+c5mGoYtZtjWXVeie7x83pYSaPkLCxib5E3SGOg4+/O4Fe7ITa/k/Zpq2kY6HyO
	5znjGvbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVc-00000003oEE-42Xd;
	Thu, 02 Jul 2026 08:10:56 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVX-00000003oB7-3PAQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:10:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so13229735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979850; x=1783584650; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4DUzlDYde7+nlA7K6gg98zrSYXmo4pVwxHlPtRIQOc=;
        b=Ssl0FOCWRicJB3M1AOGz9pX14dCSY0mJp34Apxc5F80/eP4IIOIMJABGRb4QztRXOE
         4X7nscPXGKqbgAtfqXwh4/WBPWiSzItxVHdGqtvAFehebaKDUgESf7JWH+ZVIpSAwdN2
         1JvYER+q5wVyJXtKpeHVNKIx7PhJ5sgYmfpM1q5EBKrUOukYJxI6W6TdFpD2wL0OB65E
         eY1QpSz5ETPfZCT/tUnBVFELG99AxcQey8EkYrFXut9GKLTmtjJr5UfrgGDsZAMG6TQH
         0Oc/gtqomFgrdRFJBuALFgI4LZTx/60DpP1/5y8CWuwAnWiVZ5uLgXjNAcl3zxOpTO6p
         WNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979850; x=1783584650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4DUzlDYde7+nlA7K6gg98zrSYXmo4pVwxHlPtRIQOc=;
        b=sRr6MN0q6moywu/M88umRyHrX8iv2H3cxbKQbN5sXGm7O5R5DeR1mp0guNvFOBbO1C
         2jVNTQ/eY8+aNCpDsrAE2/iJWI/S5ivVnBw49Vp+RDmhzTLwqT9AjfTk18woAE8IAblZ
         gTcS0BpHbi7m42HtkJR/eSheeGvgb4l//JlXuTtYCzRSyT3LetrpduV714ScSUUIJPs3
         L8Lu1tvf3eGmqhyvTIssznuRSo0Nhs5vwcx4Cav4NXdppUbRiGeOsRJjrryb9AhhDAXS
         QxJh70ZRsXepp5T9qGv16MUq/PEi9Q8leEHO8hZwrpmPik6uPZGb3qt912/ajEWUubif
         u2oA==
X-Forwarded-Encrypted: i=1; AFNElJ+ybCM11at8r3s7Y4hUQp3lFRbHrF+lo9uQVr/JTk8TZp69cxeN18nWc0T/mXX5CetQVdHTTFUwA15CAwHY3poB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf8Y7xnXFJGVqQe8NtYzULV9qUjFY6NlippVY9kR+5eC+kD1a/
	Gk9JqrBuSU9HDneCJy/TQ0Q2p19PBGNOy9No41uFdQyRuYL4hSYrnjyDwRc/VDakHTE=
X-Gm-Gg: AfdE7cnSeI99JuLOurCcU9tg4sdCKIUIoGTuJLivbdNSwNfAAIgn/hH0RfDAnuc6Avc
	O6rhrFZ1Gl9IWiC++QqKYzR+MVV85Wd9EH98r+N1lARTdvZ+GvEqPcJeEAoY44grBYBh6njQ/e6
	aeXRrL00i9X2eFMTjuICkKMmqx4Xs2GnzLEHQAIlJMJUSI5W6tP1kc4/IrBYRwQj7wdqmbZnckk
	qPlSXyI1FzS09uhw1kow3ThqpJck5/ECrtQAvEnruHT8iwtSfOMV1Y1q10ObMlx18zOObtKVyz+
	cyG4DvmrN1caWXSriAwU4jTFFqk1cFHxPQ2QlzerWHAmbXKY7hWn3bLopf/E1arH57LBefK0FHg
	X0/aTptNBwZSEzidQal8v9nmGHs2RY2R7BLV8xZvN/2UIdCefm64rPUGd0cHuFCIDvWkjOf4EQl
	Xls1QY8eOXr9A=
X-Received: by 2002:a05:600c:4ba1:b0:493:af56:8e64 with SMTP id 5b1f17b1804b1-493c2b9e74fmr46177105e9.32.1782979849885;
        Thu, 02 Jul 2026 01:10:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c636ea60sm26008745e9.3.2026.07.02.01.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:02 +0200
Subject: [PATCH v3 3/8] clk: sunxi-ng: fix ccu probe clock unregister on
 error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-3-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2127; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=xEow9YFv9tWxKuTGRmYBanqZYgnlQCz+XPTruWbAxlY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz4y0UzWpG2vq9pNsBeXNaVPQAXpCwoH/CqF
 5UKSr9tabGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc+AAKCRDm/A8cN/La
 heBcEACG7fRdAKaggYdYW+Kmy5AukfFGo0WDxvZitKeqqERRluPiowtv+fiW72Eh+xmI6rB88xT
 A9NgJkcYyLsMKEa30ZOg6paZS/e1Wyfg3apNWs04HXG/SCHZ1TO5FUrXxjDAynwHEvOprtof54n
 ZLep4U6cVL48VOhgvX+nqF5WLDhVSQbK1jnIVR2kaMNj7a/240tzf/mAmrrUKOJMVH5qzNP1+qZ
 /PR38HOQLqe+7u8mM3QBRDraZ2jCio4OxQy1IgVN5hXCEXCiCf2FmN+bmfZ/jcJNZlBJ9GPgz4W
 G8PAZ3AvDVIcT8KAtgqJ2tCqZ3yeKPrXB28FAJc+40ocBqjJBa+LUWI+KqyRQe014Xyl/FMvbSf
 gQ3jd+LBj+Rzu0p6SMgkS1qdOhtsYBT3FX4LMuKFGeU66/pWtS8JorozPyetUsdhu1jVEafMysx
 EAdBUqHexlFlrIaiRITCK2q72pAO87AEBno0EjyJp50T3JM+X3TuZ3Q5DxPQeiLA6go+cc8p3yn
 w5SNHC+GNWQK3GXnqjK5KaUQkw0IJu/QZIk+UadfkrPS8A6qY8+MmDPytdCqXoXBn5SzIHQ6uGI
 lr7rCwIHXbb0Zb9O2YfDG2T/vooP48C9zFfsO9fx6pXw5qjqEWU64yAokgm1wxnnYPZJjKY4a5s
 LgBFgUmnX/HASMQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_011051_883437_2124810D 
X-CRM114-Status: GOOD (  15.98  )
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


