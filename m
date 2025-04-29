Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56683C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 11:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgyhIqI6R7U0FrORGELeeyBSm2wWl3XJdSnlKrJ1GvE=; b=gRHCUbPDpJWqcS6yq6xMTvEsA+
	KT1U/woWHcn4FZh3gLlmvkE/iUSFmvigHMccy4aQuIDhiiab+wOddrbp+28J33bcKZNB7IESasXIP
	BwRurcnzc/VpO1ntWGeTaiWS7hy7/xF5m8INm3L7Z8dOAzjXaqH8Bd1oZcMgvvAtCWIFbcnzi+oE2
	YpjEKsLSyvJ6EO6yBqRCzMOBreoJvJnSvDXyFtAXdVGUq+4Lt+x4ZjTMzMwP8TCbzIwhdB0hFBBox
	OCneV8VBibzgnv1fsLiVNf+XUgy6ygxWEIpcd9BPOPOt3ohmbzbj+RSXElayogmmgYhuVHqJJX/DO
	AlyZgkBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jJE-00000009Uwi-16xR;
	Tue, 29 Apr 2025 11:39:32 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jBY-00000009SHE-1Nnd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 11:31:38 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 027E01F9BE;
	Tue, 29 Apr 2025 13:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745926289;
	bh=PgyhIqI6R7U0FrORGELeeyBSm2wWl3XJdSnlKrJ1GvE=; h=From:To:Subject;
	b=j/oTH0g5UfDISMN+QvKXJ+rgwqoZ2kZ4MN9AEl68nM69lZv2H2keBUjolOPCguvfp
	 PhGcArVPkzaYluRKl8nyer6OfxZfCl/TwssMUg68ADrcQqzKd6PhrdEIsZvuqdKiTK
	 j6gStV5B0WAh1huHcipn/voghQ/1Cg0lwaor6diZgg8yXxKWTS4GoKDnKqZSHM/QpK
	 UOyFTpNDnke00/7iZnXFn9CyFa6gimddEaUdD3YYYKqtvDG19qNdDnV8uvSkjkXgIk
	 hF3cRbxrlM4SouYpXy1xnaDR2yPi68SjfPGEqU85yerGzg68r65bI5WFgcUFZJL8PR
	 RRcEK0oRaBQQA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 2/4] arm64: dts: freescale: imx8mp-toradex-smarc: add embedded controller
Date: Tue, 29 Apr 2025 13:31:17 +0200
Message-Id: <20250429113119.124427-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429113119.124427-1-francesco@dolcini.it>
References: <20250429113119.124427-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_043136_520965_E695046C 
X-CRM114-Status: UNSURE (   7.80  )
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Add the embedded controller node to the device tree, this is required
for reset and power-off functionalities.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index 0a8b9eee5ed9..c4ca01ce60d0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -534,6 +534,11 @@ reg_sd_3v3_1v8: LDO5 {
 		};
 	};
 
+	embedded-controller@28 {
+		compatible = "toradex,smarc-imx8mp-ec", "toradex,smarc-ec";
+		reg = <0x28>;
+	};
+
 	rtc_i2c: rtc@32 {
 		compatible = "epson,rx8130";
 		reg = <0x32>;
-- 
2.39.5


