Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C63C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 10:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+2Tyzy6yh5ilGbJV236A8dmsrL/FM6gEqFOZc/caRis=; b=FfJPga+bB1KMRluZzPlg36MGF4
	qMpXNZEiY1Q21NfUmJFYgFRpOhWGgzP2BqymhGyuNYSyxZWVYTlKb3HrJfPFE5oXYMZ4GgnVBoKeM
	/vj/bMPJy2keVPgli4BF+TcY/FJpyOoJvu1YKdEo91gWaM+JhRy0kKHyenoCprjmtGnsVQrp/Idbt
	81u3DXxWDWmalBCkqdk28lDF0SucZxJeSs7oowBK/5VUXL0yks6SkUiR6oJZWf7aEDXypobyZAHpp
	S5K+GNuDiDIrALF1W2IanhnZHXx0pQz0U9/7jtf7u07u83Pig0G+hYCG8JWQZUhbvm7bFFtZdSHcV
	qb8s76WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toKSs-0000000Dn2Z-1UMv;
	Sat, 01 Mar 2025 10:53:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toKKw-0000000Dm4q-1HR6;
	Sat, 01 Mar 2025 10:44:51 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0C37A25DBB;
	Sat,  1 Mar 2025 11:44:49 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-seUOwGjVr2; Sat,  1 Mar 2025 11:44:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740825887; bh=zwk+LtszMoHSIYjGCAqbuOU0QSVYlP5K54ulz6VjFyA=;
	h=From:To:Cc:Subject:Date;
	b=cusEpx7U6cVra4Av0kljPG7s/Z+2Nkpmc/8HjdRJAnRK0zBim6wVGtKJJy6MsnYgS
	 8vhw0HHivQdEFpTmerOrGX4j/wpzJf6x1lIFJUSAaPM/+cW0XRZLtD9X3L3naQxFhr
	 eEerUaBziLo9TsazDr4n0qINaaJl+YF1k3IcD11IYOMkZJWDIZp03+FT8njZobFPXP
	 eJ3z2BXwvMBApexnMNLbJc4juNpaMavnnFjNLYlqoDto5X6ehi/BPq0kbKKND/fmEZ
	 3Qi7RqWA09iLcujtfmbTtluVyocqVifsp3v++OB/fAIUE7xHN/FCvW9FAdYW/RNeMW
	 G1qR3zwddZjtQ==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 4/8] dt-bindings: clock: Add GRF clock definition for RK3528
Date: Sat,  1 Mar 2025 10:44:13 +0000
Message-ID: <20250301104413.36335-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_024450_466832_BB3641E9 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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

These clocks are for SD/SDIO tuning purpose and come with registers
in GRF syscon.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 include/dt-bindings/clock/rockchip,rk3528-cru.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3528-cru.h b/include/dt-bindings/clock/rockchip,rk3528-cru.h
index 55a448f5ed6d..0245a53fc334 100644
--- a/include/dt-bindings/clock/rockchip,rk3528-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3528-cru.h
@@ -414,6 +414,12 @@
 #define MCLK_I2S2_2CH_SAI_SRC_PRE	402
 #define MCLK_I2S3_8CH_SAI_SRC_PRE	403
 #define MCLK_SDPDIF_SRC_PRE		404
+#define SCLK_SDMMC_DRV			405
+#define SCLK_SDMMC_SAMPLE		406
+#define SCLK_SDIO0_DRV			407
+#define SCLK_SDIO0_SAMPLE		408
+#define SCLK_SDIO1_DRV			409
+#define SCLK_SDIO1_SAMPLE		410
 
 /* scmi-clocks indices */
 #define SCMI_PCLK_KEYREADER		0
-- 
2.48.1


