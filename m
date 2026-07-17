Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B15EC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wgMh3yFxpSQUpY7Ql+FMu1f7EBXpSaKGdxPimN78QQ=; b=vl28oYn2nwU11gWV0GY5iZeBx6
	4IvOUlil44pWtdL9PyR64pgoiZr1io8LkQ8+lRP8bqogzMfOl2vCTBQKRZ2BQSWKFg+XGSAbLgyG1
	QySJ6aIOtql8YvnW3vdo0sXazvuRF38js8CVs4mSUk6zfV5MZ4LsZPSIcMIJD14qAFDoV4bjhy2Dx
	ZUb650EUxploHSalSOLgE9aU461+3NLilrzR87ydxOSPbmmCQxGuo/wjaSXspwyJooi8zVU2Vwe3N
	Cyj8JoD1SU9fTn7TqlB9jtdLMJI4tO62dJeA9LWo34oxs4KIHGWE+h6zQUEDaPbK2+dvqOIDB9LND
	UJ+2shhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkRC-00000002bR2-31q4;
	Fri, 17 Jul 2026 15:25:18 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkR8-00000002bOY-3lnL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:25:16 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47df6a5202bso5475166f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784301913; x=1784906713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wgMh3yFxpSQUpY7Ql+FMu1f7EBXpSaKGdxPimN78QQ=;
        b=lqDLaep2P/e2tey5KqFvHSbzAkKD+kA5RN0Y4zxaK/pfDq+Qg6b7JemjgPLO1gCAnq
         jetg5bNwX2UW2WXZCX/KlPZB7gScNF/Vdecb8t8D72hStV50EJjdVrKjfj+Kum4j1Oqs
         WiRIZ7ko5z/vEKVIoj1pZFhgSSRIrlPWJdJBPAhc/EULBfjKMQuMWrZmPjwhanKqGDox
         eFb6w1iylFiYCSfZ525GcHABqQ90uuEsAKXKcD28f74Ly+3LIBPe926wcahufMS1c0mp
         6hYsHpyv+zyw+dlDK4HXFL3/X7/jWMD0D4/Ow3zQ1NwxqHLJ4q+GuXWRdS0oubmtuna1
         xvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301913; x=1784906713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wgMh3yFxpSQUpY7Ql+FMu1f7EBXpSaKGdxPimN78QQ=;
        b=TYdBqB43fgWXpDaLL0Nhye6AKxsmczSQPeHoZLkZECcWynzf7aoTS2OXnqHaEdiYS7
         6e0FJKZTkte42g80bl7/7Vc9gHMfidjzj9frlK2Vs9FDv9AkBRfMe/AC9z4Wk7m9fqfB
         7KHFeMUew7FuZX2jtMzOhLdirq8PDCYneC/iX26cuJVg5abZd010WSLemLHnOPABIkKR
         JmSqtEnNtHrt60YHOF8uPseIy0N9a6geWrGL2ECRkUXTgEt8mQho3KXEbKGZV8fQhy1x
         6H2ia+qBRJmaiz954Oy3xmcXiRPWHCwEQrU9f20WPZHe6AkznUnhKUcqao8rqPzQ0fy2
         DRjw==
X-Forwarded-Encrypted: i=1; AHgh+RoTArtRZ0zLfiLKzLVhhztiTg4gyQ+B7e0CwZX1CBTQ7AeqiU4j3JXr6PtQhhYVZyLIzqyqUUD+I3jMrJBYNSKN@lists.infradead.org
X-Gm-Message-State: AOJu0YyTZU6Gt25JK94xsKDvSraSmCGc7ukcGyhwT1uKyghWMln9ssrh
	xAvXLFp+Bmkwz8Lt4VV/hRfjWp8MNgXx9H+h8tjS0XQBf+ECHtHTCxjxf7nT8+OOuOs=
X-Gm-Gg: AfdE7cmiGrbh6/p4grcx3i+d6iB7ztqTKcvv9LhxGndkax40wZB/NC1Sc5UlD8twDex
	6p95MSCryyePN3LPtsaHOnW9dplSpxM0eFLheo8tUXgVVO+9D6Q5/91OXJEWPQlvnwvlSpcaam3
	X+etL+D6PlZK2kTkDaJ5+h3l5K7EOl625vraq+XgwbdoF0nXD84FE16mFgfKi//SSlddAPsQuDa
	f7qzvrIBGnR3niorDy1CKSgwgWAaf1lDMken+8vJ0Bc6HjlCsCs7cHH8S5Rd2t/85mXQWl1rtYz
	00QTtd74+uAlG4ngfyHXf/NsYO1nuK1/SlDqOXFXWlpFUkkZLqZ2ryN5ZQaVgHGw4OSqvbU5BIS
	bwbGrnKb/M0wf7eXZHY7HiWD7moxE1ph7V1bTSlvMeH6tDDnkBEnOo3+itKvmBv+VhKVw3GjliQ
	U5
X-Received: by 2002:a05:6000:1882:b0:47f:5e89:aa2 with SMTP id ffacd0b85a97d-47f62338d7dmr3838108f8f.51.1784301912982;
        Fri, 17 Jul 2026 08:25:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e496ffsm4808169f8f.3.2026.07.17.08.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:25:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jul 2026 17:24:52 +0200
Subject: [PATCH v5 2/4] clk: sunxi-ng: div: add read-only operation support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-a733-rtc-v5-2-3874cc26abf7@baylibre.com>
References: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
In-Reply-To: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
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
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3662; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6iIA0WTn0kaWrc1sr3Kek/HJCNSFbL8qhQ+00WGwRBM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWklNbHRTWu+C+fdTSwA8INAva/DV0orsBtig+
 o8EwQ1NvI+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalpJTQAKCRDm/A8cN/La
 hW7YEACFQgs0gDea4IfvKYhJ1hf7FoiOwHPm4tFr2Kwikrbz/InoPDNLw3I8YPgnEXuT3MNUJkH
 GBywQ3xsx/f8qCtV+nYNELgy1zlm//70eoe8gk0W+O451Acv6ztXiiJBIiNtXC/ArXnUCDJgufo
 oTrn3eKvmlbAdSPUIEEFYPTZR3Q6n0pYAQckIZ13fZyNfW5OlC6D3CI+VSPXFzbTzSqtrwmblyT
 YgEY0TTGhgHKQ4na+E1rTJ5p+pkf56LIvv08Clf5/Bl4POHDz07KMmLbU3DVJ7yHf4vKwHceHjn
 leMhf6SJUEsENp3XIcvo/YDVtAKE8lR0rWfbFAXSI1MpAayGdzgUMKpVIltkpQj8tnznHShrt2J
 ptBOUAvE9+GtFSZW0MvpklDn/fOjMniZ7FadxnUqGJj++GbKm0tVAxCQOu1VmcIQmLl6wt1hamc
 aZz9AHLU2VzQUR9ckVe46iUIHMlkdi6SS0vGPVA5XxCmNO7R2+TWaiVgNygmw4+WkZMs6LUikCc
 0UeuiZIwItjIPQj7IUGtJIT2RPyBQN6ISzoFwf5GKUhOQxRC0FE5CLbXMxhnpPXU0NQbvVKOLoQ
 vK0biMw+yjrTxywcCSFehJLjFnr6n8+/pFldsgGJEpsDIJf2EtXoXHL0H3Z6pD/4b5WpNPDYCrs
 PPg2Ow8dyy3i3bQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_082514_970517_BF68296C 
X-CRM114-Status: GOOD (  15.25  )
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

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 30 ++++++++++++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c |  2 +-
 drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
 4 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..93cb4cb93abe 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -20,8 +20,22 @@ static int ccu_div_determine_rate_helper(struct ccu_mux_internal *mux,
 	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		req->rate *= cd->fixed_post_div;
 
-	ret = divider_determine_rate(&cd->common.hw, req, cd->div.table,
-				     cd->div.width, cd->div.flags);
+	if (cd->div.flags & CLK_DIVIDER_READ_ONLY) {
+		unsigned long val;
+		u32 reg;
+
+		reg = readl(cd->common.base + cd->common.reg);
+		val = reg >> cd->div.shift;
+		val &= (1 << cd->div.width) - 1;
+
+		ret = divider_ro_determine_rate(&cd->common.hw, req, cd->div.table,
+						cd->div.width, cd->div.flags, val);
+
+	} else {
+		ret = divider_determine_rate(&cd->common.hw, req, cd->div.table,
+					     cd->div.width, cd->div.flags);
+	}
+
 	if (ret)
 		return ret;
 
@@ -143,3 +157,15 @@ const struct clk_ops ccu_div_ops = {
 	.set_rate	= ccu_div_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
+
+const struct clk_ops ccu_rodiv_ops = {
+	.disable	= ccu_div_disable,
+	.enable		= ccu_div_enable,
+	.is_enabled	= ccu_div_is_enabled,
+
+	.get_parent	= ccu_div_get_parent,
+
+	.determine_rate	= ccu_div_determine_rate,
+	.recalc_rate	= ccu_div_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index be00b3277e97..a30a92780a05 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
 }
 
 extern const struct clk_ops ccu_div_ops;
+extern const struct clk_ops ccu_rodiv_ops;
 
 #endif /* _CCU_DIV_H_ */
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 75ec3457324c..905570375711 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -67,7 +67,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 	return parent_rate / ccu_mux_get_prediv(common, cm, parent_index);
 }
 
-static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,
 					    int parent_index,
 					    unsigned long parent_rate)
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index c94a4bde5d01..272a2c36a8f2 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -134,6 +134,10 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 					  struct ccu_mux_internal *cm,
 					  int parent_index,
 					  unsigned long parent_rate);
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+					    struct ccu_mux_internal *cm,
+					    int parent_index,
+					    unsigned long parent_rate);
 int ccu_mux_helper_determine_rate(struct ccu_common *common,
 				  struct ccu_mux_internal *cm,
 				  struct clk_rate_request *req,

-- 
2.47.3


