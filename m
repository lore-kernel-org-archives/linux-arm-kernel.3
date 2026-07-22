Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D244C4453E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCHBjnXnCbVICbmg1fFBQry3N4DeY7D0jzFS6saVNag=; b=B4c54t6hSaJwuFeqk3KCivvgG6
	aWDre2GA2VOtQcs/6pDKcY8g9ClTHZUmLzaiCF+2nX4iotqfCZlpCyTkXROpjcYQ+E7HQgl0aaKLx
	+6N8wW2fQFgj2KNm49diyC6fblgwYGcOH6IHx6G42oioU8qAwR3xZXR9ue9oaRUAJPASB/4zbZQfc
	VRWEvTQ7p3FxxLeImApxfQyZC1xhiF2oNpHuisXKGZVkj2x9Vzp5qSDxLmiavQKjcaiZGD7Wo8eEs
	tznlWzqbQ3+oxTCbZg1RD5TQ9DcdGt3G+nmWgwYZF7E3A5FcrHge74DA80yG3osxNopUNS05CV8E7
	bZnUBdAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYFY-0000000C4aI-2ThW;
	Wed, 22 Jul 2026 14:48:44 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYFS-0000000C4XE-3vET
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 14:48:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f7444576cso2582585f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784731717; x=1785336517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCHBjnXnCbVICbmg1fFBQry3N4DeY7D0jzFS6saVNag=;
        b=KQ8dzLgOSsALm29nJLGa0TanwB1vHpmS1+nOPI+lfdluHcLnqygBXOUlaGPIwJD42F
         ou15mCUXo32NyAYYPHh5SASHjyFus0Z4A5k8CFt5uci1Tk4rDU2j2nPUqAWxH9E5QUW+
         buc2LVkUSauaDUG9LSsnj5aFlILiRFrpQm76RdkFnGJGtth/ibfQP5SGLOBUUz+irSAR
         PGi25DluNYZpYsAi3lMqoHvXGlEmL02XiCIV3tqyAfd2NJYW2jOgpoBv/R1JARZaOFj+
         LxLOKflDCeQ1VpFV3EQJebpw1xLJDHfUiuNkT/7+KoqdHPezZqlJ2OGB+F/hKTV98ty1
         RKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784731717; x=1785336517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCHBjnXnCbVICbmg1fFBQry3N4DeY7D0jzFS6saVNag=;
        b=WZGmm99BKtk27UMj6JhElGLAlS3uJs320IWLUAJ2Mgbc+Wdb0iqH4AB41C/ER85EQK
         KMlNLM8T0YF7t5PztAwqLy69G64EZFtxyLVJrPWLZ4o66VSeZ4+DtzPsShdyYfpUEuxG
         j0VyZawwz8XTKLgDJ1yYw0KmiVm+dlM5HxxLctRFLyMpUKF4xnpz+8uUOQt1F+viYBy1
         X+Fg5JZ0WVkcBpnWJ+HxoT5vtGu5bgDA3yNncpKj5lUUMg08FX/UcOuHbwEF7Ks+kDKZ
         r4yNy9/8V+cUExSBpGgaCy3IjxDuEQDljJrwbG3m69d4O6N3jNDphZO8tgLwEZnEY9K/
         g5oQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTU1EOCmvLSGK1WClg/GTZzbKz/+wkB0eiw9ny+5N05rrRSMM//c5OaHGh9RtIGvVJyIm61g1SO0Dc3kx4v+JD@lists.infradead.org
X-Gm-Message-State: AOJu0YwX2/duhQARbsDUvQeO9co3NgAaqXHVYTX3Ev4PkqdfEhPZj94M
	5SDfApRAf2PItnpYPC5XKnLr2D6z2pD946jt7b/KhnqWWpHzqymgeOPSNlmwY49yIyI=
X-Gm-Gg: AR+sD123ulFS4/gjD0tVtoKpC1Tf1Xe7/5VaNAIFQjm78WiVM0RDdrHfkXMf61aepty
	+ulFYHeqRvv4o18LqlgtAVhftXpagR5fCRJ2LjNIiy/wN04Uw2uXF1n0u3IYi4lHkC7VO6VYwLy
	CwL0pJ31YJvJMhzW2r6sSQEzx1CXxeVtIh6yQaKlTfIQ9X94eT44+QXOGGXZi1Wasba6Y/aXR7h
	8W8NTDiACHBOpQyC2Sx1NWL4+zRH7pQLqTAYGzFf78d0w+psKLojk7Lu7SWnWVh29n/yHcSx8at
	nJIfB5rEV1zfKJEAiW02tfMaELFX+OSCbEDDnnv69qB2+vWdnb69XMsSMrXYkB5EFoDkgZO0DH2
	SJSot9XktIFej1GlZnfrAgolyD3gtgenx63n4RriefK0TydxMpK2Yfa15qAoyANRJmshGduXVS0
	dQ
X-Received: by 2002:a05:6000:298e:20b0:47f:6d4e:4cdf with SMTP id ffacd0b85a97d-47f6d4e4e09mr15710230f8f.58.1784731716959;
        Wed, 22 Jul 2026 07:48:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85bd77a9sm6306269f8f.14.2026.07.22.07.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:48:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 22 Jul 2026 16:48:20 +0200
Subject: [PATCH v6 2/4] clk: sunxi-ng: div: add read-only operation support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-a733-rtc-v6-2-631cca28cc9a@baylibre.com>
References: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
In-Reply-To: <20260722-a733-rtc-v6-0-631cca28cc9a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vX/TCHLAjOkQRelKPMwYvdNToDOf4unxRAm1iZEzSxs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYNg70PtrvTpA4LWczjYUn7V/UXWZ9hOuvW3P+
 O0Lia3J/vCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamDYOwAKCRDm/A8cN/La
 hawdEACxatHfiQJA9GAhWuY+R5eP92r1ye/bpxxeNgaevjHIs1u1UMo3XqTzbVP8rgDpmw8zmyy
 Ja0tqYLVTqx74NMqLcBPuXXRe41PSxyc301FcUQcqW2B5CQJoit2dSnsRPtDMm/IDoWOKnap94U
 ZMe2fz7U3BVo2nHwhNrLD6dx7WBwi3QFAxwoipIHvht+RwqKTgfMi4YEBzL4bDP1kJi3AmTKj0j
 psjlQmncda6vKprmIHEu1gY1sCzcwb+qrVm1Ml5cG7zRMfr2f4MbjOfc5ka6B3JnDl7W20dOUid
 xrnLMrxixVCexbbvR/868TGSe7hsYXhlcOLFxVGyr1okgk925IE9+UuFSg5tMU4NQlGvB547MPs
 1UqorgDd6oITa9OUx4gTwKPfZ0C01mVBSjZy0SIv0I/eiHm2b906V3YcRQ34n2ASEc5RC5nZ1v+
 B2M7aXJPTRVAhuCZ7Z8TO0oSvyRL2Yr0lfSFxCTYcKS/xAh+BrRw8MbW0CC6SIke1vqh6+PALZ6
 Da4z/sKrP3Eqm2LG8trpNsIcwcqGXtrHwTuzTkkOsDtcFP9TlB5lTVAIkIL6pWD8KFEy1fVmV3/
 Xz3/AQPG/D2jiPSBQrFIVGdICFEK2ppSHclER7XEBL/Ql0yyVDKIyhdSHGD3OnFmYQ9KkszQS5D
 FtimUa/AqjJCufQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_074839_015148_2835EB6E 
X-CRM114-Status: GOOD (  16.67  )
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
 drivers/clk/sunxi-ng/ccu_div.c | 31 +++++++++++++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c |  2 +-
 drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
 4 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..c385e0160f13 100644
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
 
@@ -143,3 +157,16 @@ const struct clk_ops ccu_div_ops = {
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
+	.set_parent	= ccu_div_set_parent,
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
index 4503c9780c39..12bfc99c9172 100644
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


