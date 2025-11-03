Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2218ECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 23:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heldHUcl5JSmStuy/oLAzwUEGebnwog1OLKO7g7jQRY=; b=CXe5g42FS28/UspUa5w+P1nUlW
	b+7pBkw9oZ4pJ942sLSlFeIldx/l9ENZPfXCGAce2EJu9cjxVu7Uv9ANtK9LtFJa+YfKt1V/zAeRm
	ZcPbjOohXlxThl6I8SYQ0V8dV1SaoUTvvLhVIkEkhfKYwOcoz9Esa0UpmcxMs5+ApS1enK8+3SJVM
	+eEqjceqt+TOJj1pPjnGCvjvl8UtsP72aiYQjKDc+jgxtDNldBDHOwrZcBDsK1m+43Nxy8QPvtOGo
	JZn1QQz6S8Zs8ERp3fhW3hiA29dvCtrph84KbFRlad8l3H4iQsbA4QaHkdfA9IAf1GZiIA5rmaoAP
	yIkX3p9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4Is-0000000AnxF-15yv;
	Mon, 03 Nov 2025 23:49:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4Im-0000000Anu8-2EL5;
	Mon, 03 Nov 2025 23:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=heldHUcl5JSmStuy/oLAzwUEGebnwog1OLKO7g7jQRY=; b=p4nkQcsxCqYrDeiWxYWcJxCuuf
	g0CJIfxxPOV/bMzw5Z9uPnklZnvhlb/YCSvQV+idVkRcBJlf8cdiW/Y6yBYVs5VZK5LuNHGWCIlox
	hEemb/P9SbTKaVlk/jqBuZfJAJCCe4c2+qTYY6/Mr2tw5XSVxPnSxLTqULOStLn/fl3Q5O9fsIE7b
	q7l4BQ9NxXDxhiEFBW/d4uMKO/RgBU75mebMRqzfwe/Iz+mk0LSew/rtz2gRYkfPfvrMHKHzhjCFm
	uyznYXliIqKuRchBVDzwvOMuXMLVkhEzHmRF36dvZmjOQ4TMdE96XeWF59P/JnImlKOeGZwuJefRW
	1wm1+7PQ==;
Received: from i53875a3a.versanet.de ([83.135.90.58] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vG4Ik-0007vT-Ba; Tue, 04 Nov 2025 00:49:30 +0100
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
	michael.riesch@collabora.com
Subject: [PATCH 2/3] arm64: dts: rockchip: use SCMI clock id for cpu clock on rk356x
Date: Tue,  4 Nov 2025 00:49:25 +0100
Message-ID: <20251103234926.416137-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251103234926.416137-1-heiko@sntech.de>
References: <20251103234926.416137-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_154932_570423_EFCB8AB6 
X-CRM114-Status: GOOD (  13.52  )
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

Instead of hard-coding 0, use the more descriptive ID from the binding
to reference the SCMI clock for the cpu on rk356x.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a3361527d4fe..d0c76401b45e 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -53,7 +53,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
-			clocks = <&scmi_clk 0>;
+			clocks = <&scmi_clk SCMI_CLK_CPU>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
-- 
2.47.2


