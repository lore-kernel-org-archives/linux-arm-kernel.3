Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFB9C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7tYSkJ6lOcONG+Kk7MS1jRgYa+E91ac/ILJT9gEeSM=; b=BvzINyJD1kLsJcKlzuj+b0Z4gF
	0aj8VQU1FQ1XT5RZXQAxXra0lHr7/01ykefqY4exSNA+x4S4kAKcb4jT7hPM6AVpxSbkmYjWEfnhs
	Rty+xZiwLXAtP3QJrSlJuoxf5qH6wJbiOQ+A2yX+zarUP54PnQ2wt9j8LQUdQ535IF5ZvylwSxgcx
	w2uTDbm9zb3Jd02U/+wzoToUH4sbxeO30IyNLe8QcIVHXltCbbw28Q2d187F/tjXmXpBwMVyBcf9h
	EVN3i65PlljOtxoiumlX0I7gj51DyRzx6c1Um+2T7q2E+Nq0aSz2VLsagHulTECCgAyx6SilEGJ9S
	k+WJDIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDt-00000001gv6-1FCW;
	Mon, 21 Sep 2026 10:26:09 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDX-00000001ggn-11zs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:25:48 +0000
Received: by mail-pz2-x0c.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so2651721b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986347; x=1790591147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7tYSkJ6lOcONG+Kk7MS1jRgYa+E91ac/ILJT9gEeSM=;
        b=JmkufzbEzEVFuUMtPVoD7SKUzJhKBN7f5Zf4tToIGG3G6xnWq0MTf93jj4p0hc0g5j
         yiFzYm5rrad08PmLvwoQV+HDcx8Tftr6+FKu6A7kbOK5IZETego/rBJPgu36pUXAngR5
         UI9jkMhEJeH4T2ubhdLrO1Vh5uyuNHqJt3OZfeR6C/5d9JtkhmhmVe66U9ObCIgwv9aQ
         1mks7URZFCgng+UgdmyN0eePmh+bmbudsmdk8JLDWTZw0DSbabYPpXwtXtlrqt+pCxK5
         l9jhKPr7H7M0xT1eRUVFngl3K5O2UIyFqaYT9bapEjF83gO5lQPhOjLBYw3WGkHVJ58h
         saaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986347; x=1790591147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h7tYSkJ6lOcONG+Kk7MS1jRgYa+E91ac/ILJT9gEeSM=;
        b=d+Mac6JUWJNLuZDThHHuNB8jgYacIGN03u7O0jhSJhy/5Jwgwd+XNd0Osv1OggyVX2
         lDyb5vNaXea+xJA4PaZ4R2jsWcnyKAe8w39uPmCSoquvI4OH9FuljCdha5uLi6E9SGVE
         hlax67Bkj+TJr4bQt55+uIqfR5hFkcS5Y0uIjvDz7DyF0mN3keOqWKvgtpOypS2IUwVi
         S3zSexaBNLKSwzILoe+VUcoyfRf2UN4b7492g3g5m6uVMChlpvb81MUSjpRtNtoTghGt
         4wISQXb9pK7c9irmx29bbTU58F433x2jpkuwp/roklhwWoXVp4HdZuLlOuyhZIAJxWhH
         MOFQ==
X-Forwarded-Encrypted: i=1; AKwUvByygQXL0eg0X1e8lmCm7nXpTjnNiW4OB5mG4DGp+LxE1auQl+RMkIQDoNIuRh3qbv5N2yhXj6y6OPoIqonvW1DC@lists.infradead.org
X-Gm-Message-State: AFuF++mNyoutErGqy9+wFrnFSJ2EzwcZjTF5WWuyQ14TBWdrxk+63CC8
	HZnz8OpHb8REtFVDx1YmIgWjE2THBHFxq7SqgpZdOcLOE3S9u6JAkmhh
X-Gm-Gg: AYBFou16gA1UihVfsaEtT+9hM6Rh0a5WJDBpO4XdwNNk7bGdrl0YwXH8AuWCOLFe2dI
	hHMuh7OifUztQ6heACXuobIGK8KlguxQpyYgG4r/uU/K1sff0eJrymHt1gB/GCoOa/hTG+iaF8A
	5yox62ghJh3jospjoEKDI4Vytf2rj9NRLHZjyYNgfKyn/JmQsog/fx++snX8+rM6UmGmCBRLund
	ar4CEEGU3Qjq4pY4vutdebxeW6BPiUeJG9Mk8JVSa9tydlShtkgpPuEWteQAoK/te/S8W61zNF6
	mSJl6biSeT5IQpeDM+puO57YhnwdZxgpN8SD1Z905wtNrec8h+OuaxEsSaWFMEQw/yOCmuR5Hae
	YMEz/L1W0XHNe9OSi7kQaNwRX017Z5JKpn2WdknaNC7h3lgU6gv0xYsvhxh58f4B1UuvUHcZJZR
	3KUlg1AA2K/uRZQ35epDx4FXMH5lYgZ/wcL0rFR1N1ZxtDHnS9Vze1Wury5WhLzC07Er8ad+qzj
	qdHnHUHJSc3zpMFqleSTyyijB7sdK7HB91qNMU=
X-Received: by 2002:a05:6a00:159b:b0:878:34e7:9a40 with SMTP id d2e1a72fcca58-87834e7a3c9mr6176607b3a.57.1789986346569;
        Mon, 21 Sep 2026 03:25:46 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:46 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 6/6] clk: mediatek: Reserve missing MT8516 top clock IDs
Date: Mon, 21 Sep 2026 19:25:22 +0900
Message-ID: <20260921102522.1640072-7-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032547_293407_7518459F 
X-CRM114-Status: GOOD (  11.41  )
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

Reserve the binding-defined CLK_TOP_EMI_DDRPHY_SEL and
CLK_TOP_DDRPHYCFG_SEL slots in the MT8516 top clock provider
with dummy clocks.

These muxes are not implemented by the Linux MT8516 clock
driver, but their binding IDs must remain represented in the
onecell data to preserve a valid ID-to-slot mapping.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8516.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8516.c b/drivers/clk/mediatek/clk-mt8516.c
index 342a59019fea..b64674559878 100644
--- a/drivers/clk/mediatek/clk-mt8516.c
+++ b/drivers/clk/mediatek/clk-mt8516.c
@@ -545,6 +545,8 @@ static const struct mtk_gate_regs top5_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &top5_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate top_clks[] = {
+	GATE_DUMMY(CLK_TOP_EMI_DDRPHY_SEL, "emi_ddrphy_sel_dummy"),
+	GATE_DUMMY(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel_dummy"),
 	/* TOP1 */
 	GATE_TOP1(CLK_TOP_THEM, "them", "ahb_infra_sel", 1),
 	GATE_TOP1(CLK_TOP_APDMA, "apdma", "ahb_infra_sel", 2),
-- 
2.55.0


