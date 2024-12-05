Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69746E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Amz6hL2pw8x/SHWoLqNvQ1TRgfepZkFsNEB+hKs1uI=; b=gw0PWv/9NtQbbItvR2m3DZBUlg
	i9YDvxbIDZpuI3hliZ99gD2ywXMA6rH/x39CLpl1kiIl3dUmygguQ5sXqIu6GFTZ2J0YvSNpDYELz
	oPZEDxEwDyzgT6GCqwT5VnPbNr2bCgbb7RPb3CtygAdQfHbus9DTZQooWbIMP3/mNV7CnE3H+arxy
	cdh2jLwWLOHF9Cc0X9Lqgk4HQUUfMoEAdz34i6g4LtO9ifg7kXXOy9fxR7bpaV2zTtPdgXiBFC8HI
	cbMKZriwK1VWwYp7YMH5mWVdy9gToirU7jye3PhOZExoXiiihP6KUm3yRZ7wYPm161a5LvH6zHePS
	j+Yl68gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGex-0000000H7oF-2LXa;
	Thu, 05 Dec 2024 18:33:07 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGcT-0000000H7PF-1wjG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:30:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1733423431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Amz6hL2pw8x/SHWoLqNvQ1TRgfepZkFsNEB+hKs1uI=;
	b=KrHN/yPJZSIGemVuk010y1lAmWFREJjim9GC88LZepf3syOICcGH1lwV2+d+liZUYU6mtI
	J9WvE0qk+AvAflHJAfFNHXJkXVGvpN6AwgQLPVDb5QsyXMFiPCor473fBmUUOd3R53L3l/
	dX46Q8Te1EsaIItsGRbMhdedNF3HB1bEtYRcvW3Hqy6PMc9ojq9P38vLdTAlK+wPeVUosM
	DC5NIGw0yPnsKQxXDBDXMHC8tfpU3Ge2RQB+XKEII0fuAh/Pk/K2P1oyoMhQ/tT0GIqgcY
	w9SFpXN4acLzqINjZy9Da6T3+2ADrn6SB4v8FQHCk1oONC1juK10YdCWrs+7XA==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] clk: rockchip: use PCLK_CIF0/1 clock IDs on RK3066
Date: Thu,  5 Dec 2024 15:29:36 -0300
Message-ID: <20241205182954.5346-2-val@packett.cool>
In-Reply-To: <20241205182954.5346-1-val@packett.cool>
References: <20241205182954.5346-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_103033_641221_780EE7A3 
X-CRM114-Status: GOOD (  10.07  )
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

RK3066 has two "CIF" video capture interface blocks, reference the
newly added IDs for their PCLK clocks.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/rockchip/clk-rk3188.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 684233e72105..81e94b338d0f 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -344,7 +344,7 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 
 	GATE(0, "pclkin_cif0", "ext_cif0", 0,
 			RK2928_CLKGATE_CON(3), 3, GFLAGS),
-	INVERTER(0, "pclk_cif0", "pclkin_cif0",
+	INVERTER(PCLK_CIF0, "pclk_cif0", "pclkin_cif0",
 			RK2928_CLKSEL_CON(30), 8, IFLAGS),
 
 	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
@@ -602,7 +602,7 @@ static struct rockchip_clk_branch rk3066a_clk_branches[] __initdata = {
 
 	GATE(0, "pclkin_cif1", "ext_cif1", 0,
 			RK2928_CLKGATE_CON(3), 4, GFLAGS),
-	INVERTER(0, "pclk_cif1", "pclkin_cif1",
+	INVERTER(PCLK_CIF1, "pclk_cif1", "pclkin_cif1",
 			RK2928_CLKSEL_CON(30), 12, IFLAGS),
 
 	COMPOSITE(0, "aclk_gpu_src", mux_pll_src_cpll_gpll_p, 0,
-- 
2.47.1


