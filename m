Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2423C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 20:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lga6kFdr3u+n9jlLKuJOINjzsumkmfm93NFpKPSgd9c=; b=m9+YYcTj/UUUavJEGYDKh+Z9AW
	igwPoYOjZNkxlhsbKZjsT0PRUof84ZyteUrnS5wbFMfzS873EZEnJVY9JopWUp9TWoF5sBKiZRfDp
	Pz5LRvBaEwiQyW4g9mWVnhSqqH1V/LrVVgEFrvk1GCQJTMYEokU7YaLw/H4YA5IBUMPJG7JC7kl24
	Ptp4nd+KEzSbt/1DRgMcpfhczfXGjXtbTyWd3Z9BCQnen+hjxvUj84HbplOM9ofMTX0XvIrB9KViG
	YkBz2+cqbLv0Iz5NKTjktKhfePYYlVrTBD9r8sBHyLVSiirjrnQc/8epYGqrXRhhHe7HdJW4kY2hr
	jBgKYiyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJZ9-00000004U4s-2Nyf;
	Sat, 03 May 2025 20:34:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJQr-00000004TAO-0i1z;
	Sat, 03 May 2025 20:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lga6kFdr3u+n9jlLKuJOINjzsumkmfm93NFpKPSgd9c=; b=N/Gvo6ceZw8btkaMJCTek7akSv
	plO7MojJVgzAQOYQo93lrI0fcdD4o8mC3pFuKk5pV/EDe0j8vTCF5Yimpobd+SoYvtBeY8PITABSz
	HH1d85LjWxue3EvwgVjKjmxrEESsY0xPGsG2MlpRMdcO0Pt/SnHM3Cn8t5PjXsj6bUOvPPgsoCnqT
	+8XaA5H3+XB3Y3X/74sOpL5CXljkD7DSJOiNN/LSB7MY7uU+Gz+XO/bmQPc19YxHGtXiKOJpFJNU0
	K8NjotymPLswtJb89acLB21atO1XZl/LMaWdG+Hfm2a4Dn/LrzsTP5N+zF8jmvURK1FcUY8b489MK
	iPQn5QWw==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJQp-0001s2-E7; Sat, 03 May 2025 22:25:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] clk: rockchip: rk3036: mark ddrphy as critical
Date: Sat,  3 May 2025 22:25:31 +0200
Message-ID: <20250503202532.992033-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503202532.992033-1-heiko@sntech.de>
References: <20250503202532.992033-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_132557_203328_8304FF95 
X-CRM114-Status: GOOD (  12.30  )
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

The ddrphy is supplied by the dpll, but due to the limited number of PLLs
on the rk3036, the dpll also is used for other periperhals, like the GPU.

So it happened, when the Lima driver turned off the gpu clock, this in
turn also disabled the dpll and thus the ram.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3036.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 41c71bb25171..df9330958c83 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -435,6 +435,7 @@ static const char *const rk3036_critical_clocks[] __initconst = {
 	"hclk_peri",
 	"pclk_peri",
 	"pclk_ddrupctl",
+	"ddrphy",
 };
 
 static void __init rk3036_clk_init(struct device_node *np)
-- 
2.47.2


