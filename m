Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFABC982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyERwNUBJaFhaJLH8DuloJbZ7laRRy5ywKs3n//EALc=; b=1MMued20iN1NVGqfKygQ4PSfV0
	TsxtsUbOTx69S2p9iU7J1ff0RiLmOOKg0h9jXAfHF6GEEm/vao3Z7WOIzZ0ueB5P7poJn0/vKDPHG
	KrE4QX6tU/xdQeVooYMe8VFMMBzFJhIaN7dSfBt5lsWxpK84RvTohF6SZf/lo28GL0VuEmvfxLmbE
	nX25DYuwSNdME8uOjghFPixZpkMzIdhLBtL04Td1N/7jMr7+5B1Z0nwonP9k9JHewXbnKV7mIM1k1
	utSFCy3676RK5eHqUFFCurfdEfC76dDok4tizTzkknsTvpNypYuSgpyJaGdfa3nPZIOHrDG055YV+
	O/Z3eKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ciz-0000000BUp7-4B60;
	Thu, 17 Sep 2026 14:04:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Cir-0000000BUj9-0wkz;
	Thu, 17 Sep 2026 14:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789653858;
	bh=la91QlmnzQ+cMr3xbEYXMZpWQxq/64sHaIS6pJZM8PY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nwwbpKnIkNnZSKCOqVZpNsy/SfJVMAcsWR9LtSQQ6KPBTN+wj+Gs7Po9qKyEHUls4
	 nCeksrOY/U8DF/kMXZGZ5boPyX3OxVpF/TTrrIs6Xrt6C5PmA2JZUBhs5IFISiukx9
	 8c7lxDeHO5SFiaWHsbmvXMFNtIf5mtgOai/WTVLYrQpjHzBvYhyI+NZ8ePiIqMyoc1
	 sh5q+X23ZiEOoOqIbCxdtFgeZK02tJWUMS8/csOAa5iiIr6U2DTbjoq3IyJmoQlj8H
	 QprVGG2EjW/EJtBizpZQOIia0KPh7P5Xu6d2KSc/n6GAEm0SM/jciSe0TCoxopn4CA
	 208NlNcFj9y6Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E2D417E087F;
	Thu, 17 Sep 2026 16:04:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E587748002F; Thu, 17 Sep 2026 16:04:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 17 Sep 2026 16:04:08 +0200
Subject: [PATCH 2/7] clk: rockchip: rk3576: add missing DFI clock branch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-rockchip-dfi-rk3576-support-v1-2-a5752a29f7bd@collabora.com>
References: <20260917-b4-rockchip-dfi-rk3576-support-v1-0-a5752a29f7bd@collabora.com>
In-Reply-To: <20260917-b4-rockchip-dfi-rk3576-support-v1-0-a5752a29f7bd@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jv2cP7PAalymZeRc3au2vjT1JUKCsZkY6Uv6EoH/o0k=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqr82FktkXT94orgup/c43WCmAIcDc8ndErt
 0ZvdhOKI0xWSIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqq/NhAAoJENju1/PI
 O/qabCAP+QEGU1rHYDnoXLzXs4Vmy2mOsll3+fdbfjsyWAvZuXSwpMrwTvGit7mvx0qp1djpQ5a
 OwmYWZ/ZwbW0o2ij1+DV4LjeMA8vlsoxaf+4uqau2LAZ1JHjvCnWyBxrgfCYNHPnbGPwnY8Nm88
 0pK7lW0F/Wv3MUbLgE1JuG30wMZOLhKGpNVVa8UNpJbYYFLyNBB5OXJl+DTXRTxtU+jrMzxWYgL
 9XJJY01rwoQQoSVd3Vk5S7jNGDl8cLOoVIBtTWeuNRy1VLdcSXzGFbLKTf/wzZvI45q1xiX8a3+
 SNMJnQSLqlnZ18OoA2HZbm4/lIJwgPkAr6A3GOflsEAWH2jg2zW+J1Ivo+EzhAX+3xzmtrQhyhm
 BY7wopdOZtxbPoqn5XUgF+inr+JiUwKetTYgeO1D2vnc/WPIspmAAxAbHmhh5uIOCSuwvWiF3Kt
 BkvT4skj69q6+o/FGU4hobixqZqClNtF0A6Kac091VJL/+iQy7z64luLYbjW2C3KUTv7hsxDJjw
 YSobTPmJ2tzqu3KdUgcezlD3TIPJerdhW6T7iKpw5qIL2QuDhv4yPwbf2yDurB5HLJAtnqPKkXM
 umpiN3F2uhSul3ZNIvu1rfndZlJFUyvlu4WbxHb80KN8Jtw+wZbviiPrKCPI4lvYHGHW5VQKuK+
 u0JmBi4egr2/DOeb2qtQy6Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_070421_418132_62BE008B 
X-CRM114-Status: GOOD (  12.47  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

RK3576 DFI has one pclk for each channel's monitor. However, mainline's
clock tree does not model this second DDRMON PCLK gate, and got away
with it so far because they both default to ungated and there is no
upstream RK3576 DFI driver.

Add a clock gate branch for it, and remove the CLK_IGNORE_UNUSED flag
from its sibling. In opposite to RK3588 we can add a mandatory
requirement for a clock reference to the RK3576 DFI DT binding.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3576.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 2cdd667f4004..0c94e9db81c1 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -883,8 +883,10 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 	COMPOSITE(PCLK_DDR_ROOT, "pclk_ddr_root", gpll_cpll_24m_p, CLK_IS_CRITICAL,
 			RK3576_CLKSEL_CON(76), 5, 2, MFLAGS, 0, 5, DFLAGS,
 			RK3576_CLKGATE_CON(21), 0, GFLAGS),
-	GATE(PCLK_DDR_MON_CH0, "pclk_ddr_mon_ch0", "pclk_ddr_root", CLK_IGNORE_UNUSED,
+	GATE(PCLK_DDR_MON_CH0, "pclk_ddr_mon_ch0", "pclk_ddr_root", 0,
 			RK3576_CLKGATE_CON(21), 1, GFLAGS),
+	GATE(PCLK_DDR_MON_CH1, "pclk_ddr_mon_ch1", "pclk_ddr_root", 0,
+			RK3576_CLKGATE_CON(21), 14, GFLAGS),
 	COMPOSITE(HCLK_DDR_ROOT, "hclk_ddr_root", gpll_cpll_p, CLK_IGNORE_UNUSED,
 			RK3576_CLKSEL_CON(77), 5, 1, MFLAGS, 0, 5, DFLAGS,
 			RK3576_CLKGATE_CON(22), 11, GFLAGS),

-- 
2.53.0


