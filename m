Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DE4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qaD3KpHXlXTlsicr8XbDQzikndK4UikxNXryf78w+g=; b=epQLICDoMqmKR2Mro+JdDSD/wr
	V7/1dSqMHTU9jzAjDGguKDyI9WAh+GEDqlaTLRY4PGoBa/3m5ynNEkb/6iwQRsG7CaS9MZa2AFlSA
	cDWOCnNXjvxmTy7kf5UZcWiksRiZhRpiSEmXKxfKtYG4jUORnSZ+BrTkA3Q90yrqiSgeHeA3h137s
	qmHCfFoQhqF7kYJTSiI6SIYm8QkJBvlUNk4Vsn1cA0XmUjouv8eZU42sIHcrT0AvC+fhRTUCG3I1u
	H/u8jkbwSlqFHgwaQaOjcyLlkdqF/WPygiA2wrGHH+gH53R3Uthd4YTyBKkl7zi9R2oYP2DETJG4F
	kH4HaCrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfh0-0000000C1yq-3Lck;
	Mon, 06 Jul 2026 09:32:46 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgu-0000000C1s5-1xCK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:32:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47db714766aso450067f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330359; x=1783935159; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qaD3KpHXlXTlsicr8XbDQzikndK4UikxNXryf78w+g=;
        b=MIn9hrioW0Zs43GkraUAVSYBzk7N4nZpb5XgiyduOBlXHm7lkv4VrOG78hb2mRmzFz
         xEK2mNodKkQjzIV+ACxwdWgL93bMv8adidtf9HhWSiTZfNCnkCC3wa8myK8tQ/lBeiLn
         8KiSfJbGOWEoQNBWpCU1/QAVYzfE8MoMksRHdYljBcmi+0IOxAACcNP0AH3S2uSfUzY0
         op2nC0HghhTQBdyZznK20X8x13yk9v5sscJOwFtCcsT9/UK1drq73s2qFjDcbBiMa8bM
         DUxnp770BRu3p+fZ1a4RFxAZyZBI32qLNb4if5OppbcWCPeea1pgCx1g0sAhbA784W5D
         whiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330359; x=1783935159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qaD3KpHXlXTlsicr8XbDQzikndK4UikxNXryf78w+g=;
        b=L1ef9kDixrWFi1xlXZMaKPmpFztMBMQwEp12P0m+LDIf/nlF3bBktWEfzyVVoYh7MQ
         +7tcxIt8xZ2vEZYeleBIRnrFU8hFXT59EY68n99zGJkKMJkhC1MZqulu+rPpPGxEZbTf
         ITdgMQ/YX59qrocjV6yImnk+O67UlodaqBJ4as6t4iVmG91fds84f2gnnPtvCTvVFqZH
         GHm+Ekfg9o3iRUqd83meGiBkv8iR2Tl/g2gXHm4urghDl78pdMYtnmntaayx9NSdrhCN
         4Fi1sVfwmqScan7NODPnDNGouAS3eIGSRIQWkqC7DXia8d/ErFuQzQdCdkeMM1v7QrSa
         kBKw==
X-Forwarded-Encrypted: i=1; AHgh+RoQXqN9XtR0Z0XRii5TWN4gt3zPzf3xxxE99SgcNadBJc7HKB9ZDHEjZMJ2c9sXc0P2BVXFJugAuqEA0fWNvcov@lists.infradead.org
X-Gm-Message-State: AOJu0YzCSx2YsHx/7CB2DN8A+L801dJ5IZTv/4Wl+cEi981wnJE7NCzh
	kXAhJNADpqOCe1ZfhermOBWJ7X9K8xn8Xbef4bPCgU5eo2ARA5jemquLj6ne2Xwdq/I=
X-Gm-Gg: AfdE7cmyCpz7F7do1OU+iA31jEsI8n1Nx4u0AP4JGx8WkVpF2B+0roSytVV9pAk5L5S
	pdn7mRvYxGf49iRGWHdo5mF8mXLb/ButsdaQOfOueY4YiRhQfC4z6EZmEg7zQJnqFFZzXbgtjJk
	/yugCPrXyJ7QH7ycjhfoXRzbavgXpkLkapN2e5J7Rmqai1W0VsQ3TQtnNLN5+HiXhgJ3JSSPzpk
	Duk4AXoVKkoLSJHFkNzg/d46uXKdCHCeI9FjTpCquohGIV3UeL+pMF+DQrN7llsp01Kd185rFQK
	V4Le3LwVPRsMEy4qpr1sZS6vXCJG85ouc8JZ83oQQsic0hLd7xTYdS3vm1qJK/ajDjl4hXGJBM9
	ysYDPae3+ZaPgRXi/B0RFWo60jutnI1cvSuErGRKF1Ixlim7NMklyTB9KsJyPbPSpu8EeZEG8UX
	GUkSCr7laPmqE=
X-Received: by 2002:a05:6000:25e4:b0:473:41c6:f1b9 with SMTP id ffacd0b85a97d-47abad9f4e9mr10488782f8f.11.1783330358720;
        Mon, 06 Jul 2026 02:32:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e4d6da9sm22724967f8f.12.2026.07.06.02.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:14 +0200
Subject: [PATCH v4 6/9] clk: sunxi-ng: div: add read-only operation support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-6-f330728db3d3@baylibre.com>
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
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3945; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=YM5ShWAEXTvmgI5Fwj/9iD61+1bTWSy4EWyE1bdkdA4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Yl3dlm1jKmbVqsn7Rcc9HiTF6eoKTChjUWI
 t1qYB/aI5OJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JQAKCRDm/A8cN/La
 hbzyD/9+ecBIMkVBHC9SbhtGLh+1Wq/re/x8RaQWpRit6MC1z/qa3av70z1wyB2NcUDQkRWHeBA
 SjFnA/G6Ba3ajJfE7fEzeqeoGCeApCTWt9js6jPSzMbQzQl8c2JBmRF1sRlxWzkTJl+L/Vp/yqb
 mWCp4QZAFRq7xxeBYzuAeGYj0mObaO57Th7VCqYlTxQFrBtDURG5eXacWE46CA7qC1QYl9oDb95
 gPPKegGUH40KsqiC7k+dQXklTL8bU61dR1CzYx4jzYIcQmTWCr2TCPy/sI1ft1uL1P0Du9TfXaf
 AxPDUv98UFuUcAJXZlive0q8HiYhwUe39R9DhriwKXzGTt19Axex6TRBEIh0v6FZ/VNjmZEJEKq
 29p7D6jXKU06slB4XfVElIyW949dAdP5cNWjFtpdb6Y+HGh0EuxAIajiGTmcqgxCEt8SmHKk5DH
 rPSIQKzA3HZwk6oIJficJ/t7RwAUo7VE6zTFQ0BY/skXgzwin0D48AfyAeTIJtyzGLRDdFaR18K
 mQB1F47Ks5G89dWYJpsYOzcb6YYlCXKVN1BzsruSmYO0MIfFEt++ssSijsUzaUx3NPEZyR1JFYO
 szCS45D5E4IJuFEZuwlcWr4GUUJQmxp+WwUX9SJ9kCul0K0log1R1X8qH1FWizjlI5Ov9Pv2Fym
 579DH1hjT/dZqKQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023240_542918_455C0520 
X-CRM114-Status: GOOD (  16.16  )
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
 drivers/clk/sunxi-ng/ccu_div.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c |  2 +-
 drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
 4 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..d1c8c7baa12d 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -84,6 +84,36 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
 					     req, ccu_div_determine_rate_helper, cd);
 }
 
+static int ccu_rodiv_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	struct ccu_div *cd = hw_to_ccu_div(hw);
+	unsigned long val;
+	u32 reg;
+	int ret;
+
+	reg = readl(cd->common.base + cd->common.reg);
+	val = reg >> cd->div.shift;
+	val &= (1 << cd->div.width) - 1;
+
+	req->rate = ccu_mux_helper_unapply_prediv(&cd->common, &cd->mux, -1,
+						  req->rate);
+
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		req->rate *= cd->fixed_post_div;
+
+	ret = divider_ro_determine_rate(hw, req, cd->div.table,
+					cd->div.width, cd->div.flags, val);
+
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		req->rate /= cd->fixed_post_div;
+
+	req->rate = ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
+						req->rate);
+
+	return ret;
+}
+
 static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 			   unsigned long parent_rate)
 {
@@ -143,3 +173,15 @@ const struct clk_ops ccu_div_ops = {
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
+	.determine_rate	= ccu_rodiv_determine_rate,
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
index 766f27cff748..775d396ccf31 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -68,7 +68,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 }
 EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
 
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


