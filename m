Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D10C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANuM1EedXU7mO5+fHrN+6vU75uZRwSQMOxEu7bukQuY=; b=G+VB66COCD4VPMSr/VcKi6RZ8k
	Bbz4jN8KhtSjxzVYmM/nEhGYCs0oP+RroMswDneRXAXeCWv49x+RYT6TjbqpEnsXmoC38OKVG46yt
	fTG54Uc7Mp0s/L5vlokI6gW8LfBTSF6lMlnB6Co5Y2c/lGphdKiRADG1uEkKkyCQf9GPMBxgVf399
	Psf7HiALTlLsSOzd9BohKu32wIgfYRq/0XN0j+GXpt7kt45h7dE/8r0mzqUaiyytdB4qIxZHDmlYC
	wNKJ+mFwOu3KuMdypYSgkMvYnHGZZnJrjQPBay6vFu/dYF6/UQ5gCRzz3rc2/E5LGXLQy/i+/zGRW
	GLfGlR3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpuf-0000000DuyC-0q6e;
	Thu, 23 Jul 2026 09:40:21 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpuU-0000000DusK-0YDr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:40:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f633e6058so352376f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784799608; x=1785404408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANuM1EedXU7mO5+fHrN+6vU75uZRwSQMOxEu7bukQuY=;
        b=ELFwkHUjZ6ZcA3lkdSXKAaCLkyfgjs+HM6KHGqnY5UpVSmMqFD9RuA2nTRuE0MyhOV
         1+aS1947DDmYy9Ys2ZNG6fClDkei2ygkGVHm5Vtx12mJLovjadrHa7T3X2rteAtVMXyr
         molB/v+Gr2sQh1CzI4MQrurFfokbGFiGyZeOd3yJX7KCJM/+y2BVyez3taXaDeHCJ6qE
         /NIO7RCOKxUY+bA1kR0GZRO/LOUl5De9kryCV5Ucoua+KIWIlAOJjnKSShuoX2gT7pka
         JxlB5pw8d1ir2fA6H4/Z9CMxz8wxFRU8LGZb3+fcp2mA1Pb7ZFrZKDOf0b8TmCoKqbWI
         FnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799608; x=1785404408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANuM1EedXU7mO5+fHrN+6vU75uZRwSQMOxEu7bukQuY=;
        b=E3+JMPRDFkNM2Gp+eB9lIHY+vW9kPxT3P0DdqWegCvzbvIJHJdjDyeIRWTmHCFXu0d
         +Q/O7kaJULszKu9wAmM7M5fPnHtZ8yBCoF9GFtn6S4DJa5h+eE99RGxiw6z9g90BCVve
         4u/0zcltvTh/lLNX1aCranHsmOLwdCwBsfHmHhE6WeUQDWq9A9192o4o5hBbB6qs+zJl
         7mHnPllzlQJRvK+E4GH8Q0xdVqMXuDssDeYE15feFsz6GWjpbJPAUJ0Cm3uwHOur5J7F
         sGwX5KN93y5kLaFU9ay14iUdxPZrjaRefpS+d2+eGX7H6TRji/pSNudp5i+FL0Uc7OyX
         zRqg==
X-Forwarded-Encrypted: i=1; AHgh+Rpv4hQqIQmQcGZ/sjqD99/lgsJab3P2cD/W2vtRVuWlXh9nwOFTfyIezD7Dx5A0/Tdq61EEx0mo+1PwJi6R/I55@lists.infradead.org
X-Gm-Message-State: AOJu0Yynxy4CGIpKAE9q93Q78u9GWrwAq4+gefsk9kV2GY1Iqi8r/YuS
	j2ncha2hXAIuj68tKC8gi/Un1xEvoufekuuP4gmuLuhZFYvrPXzmVXNKzwSO+Xt/THg=
X-Gm-Gg: AR+sD12HF8B3JvYlKpJ6Hium7EfrFViNppxnBgwQ534H9Xr9Y6nvHqrPd5Dm2OutDdf
	HPX+LkCT6bhtGPzOMBr4PGGh16nTCABektEajG3PB6/369kFC6IF3Fg0lZK6MHPptPKBSYwEF7P
	+edSgCD8LnAdViLG3IvqVWbZuBzXt9p7hQLz4so08/a8dx4BE/etPq3k7inW8/8t8VYxfB4UJWe
	Qa3iYhM1h8e6KPZvtVXijbUb1TSTm4YcMcv85FYFySwjRHvS9rVvuYzboOERceHJDI+XeYBmL0L
	8ty9qd0obeLp+kBblBG8zTuq2bvV63uDQijFFbRRoD9B4JpzFJQZWd76p0hECQ1CqNZ7Q20NNsY
	+iyKBShIw5jZnjzPTLTraNxamkfwDRaMGuo79T+JANqVLhnmSsP9wpwQf/BLYXe/sDsyZxmdZXX
	x6
X-Received: by 2002:a05:6000:1883:b0:474:5a38:f650 with SMTP id ffacd0b85a97d-47f8d710ffemr2834486f8f.3.1784799608255;
        Thu, 23 Jul 2026 02:40:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3274:dbb5:2710:802b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85b9a6d7sm15256235f8f.2.2026.07.23.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 23 Jul 2026 11:39:52 +0200
Subject: [PATCH v7 2/4] clk: sunxi-ng: div: add read-only operation support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-a733-rtc-v7-2-8fd68aab94ae@baylibre.com>
References: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
In-Reply-To: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=BJX69CI3rhPgFIC+UOKYakZAgmiE1nvMLkgOXW1N7vs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYeFuAonlP7DkbS7g2+GVMpDyLmLNQ/yrcz3K4
 GDc7mIRf2aJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamHhbgAKCRDm/A8cN/La
 hXuMD/4yhmqW9LF67++G2u3n2Ore+4UjWpvySCijqdBgw7p7SquucWZp1DLDI2TxsuNXpFv4Vu0
 ZJ6wnSE7VhjkXU8frv89pskHWhdH/uQzwHyFfrUH+uS2J6S95Iha5zJ++bum+V3v4wZ6uzar1rh
 /2EhCsUEVeoG+74PZ5izkjZ4Im3XihSvPXs4zOGX8GGAEiMNRPY6pE5eOXlOG5XPfDqKZswX+GI
 wGZNcGXAzU9CY2B2/wTgy1bfmtZo9F09IeQ4YrZ+a6mTQl3Gb7qVk/JKr39p/Jyvd/tlMiZxkaJ
 2qQZLF+SSPslhfmDmoxW8DGHtln+LI94LvPzjsO2HotayRJgELlH5DBiyE3vV/ZOFPUhHMx9PpA
 MsSr+nobCw9ddH2GmjXRDtQopTN8d80N8jROx5c2p3Jivgz8Hcg6AGZ9bl59BhKnImTIhtPsYGH
 ngyF3AyOUkZlSbu9cHSaS/9+HKDCiOlhH5GOpn/T8lhyQZns6+Ukw8CDbpUPK1JPYMrxNV4/6/M
 6EWg730zZZ0S0jAvdeofo3VTd7PTXG2za6B+PVgJ3H5eOcX5OtZqIMFLlef8EEiIyFpB7LsyXUB
 8+c1NEs6MA0n+m97jU9jrmh1yzs/9QvvoBFaaAbowrv2R+zAnTD+8FUHOvFz68EDYA/A44M4wrI
 t+Eb0dJFejElW5w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_024010_207679_7479E1F7 
X-CRM114-Status: GOOD (  15.36  )
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
 2 files changed, 30 insertions(+), 2 deletions(-)

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

-- 
2.47.3


