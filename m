Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C857DC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVTZZlkVmOkvB5WsIfkhd9UXY1euh5sdiDKh9SvmqYg=; b=AZ217tObEsnebONiN4eEzZR1sf
	py3lIHfnUZ4CCkBSDSPItv7H2Jxn7y+p2yvDuwbXaOS9pbm+88Kl778JMemEaUJ9JnVg2FvmgE0Wi
	lnVUrg1ud5BMCYmce50jxcM7AiCh1o3shFb7HxYs4qPcuEgth5dDyHY2dNpxr9MGWP6CZYNdn5osP
	tzuAqEeOKGs+aIqeoZ28gFbAtq8NMan4oMmLZhHG1UQ7cwu7ccoUaOr4t/AVTc6y01qbRo222cHFa
	RLVqRoB6GyUtwCKe4OIRFyHzq850EqLcSYaVQr96JoxmA3m047jTfumUscNVtvSlFqySI8HaGwuC2
	8UlPcWOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFoA-0000000BcHg-0ejW;
	Tue, 06 May 2025 10:45:54 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEW5-0000000BLu3-2GBb;
	Tue, 06 May 2025 09:23:10 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C1D7725DAD;
	Tue,  6 May 2025 11:23:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlEt75JLCS3Q; Tue,  6 May 2025 11:23:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746523383; bh=6edIhBaoWOfTotZiCQe2Htao2lyDgYNn+iXUNDszYqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PEXv7FAkxF4Xaa98EkEnBJK1K56wPSHTU6h3KDcDodfS1SefgI90HkoQkjRXl9ppj
	 8Ix9WzY/s+fAyzLvmbZmP6siIXGYWRDwcIzJGFkPeSRJDkZO8Ibf5aLiX/6QLjRZNJ
	 6tc+AsN4A4FPklIPjI4A/btU9LSUAiYfjqEu8bJU0ajsdEcdxoPMV88wYV151zKhkG
	 bEG++nFZDsrt+hvpkFl8kydzf9S2oEwm74djD07VmMSEkzmwyu11AFrjG82pREBdYZ
	 PU93gdXc9XknOZEzjALI1jmJan6D+/lqWPMUlhXUeK3HRBbQO3qKGmwQU6i6PeOoP8
	 GHF2kerJMDVDQ==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/5] dt-bindings: clock: Add GRF clock definition for RK3528
Date: Tue,  6 May 2025 09:22:02 +0000
Message-ID: <20250506092206.46143-2-ziyao@disroot.org>
In-Reply-To: <20250506092206.46143-1-ziyao@disroot.org>
References: <20250506092206.46143-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_022309_705744_4780D923 
X-CRM114-Status: UNSURE (   7.33  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.49.0


