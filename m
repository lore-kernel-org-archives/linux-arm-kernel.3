Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4856E10F287A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 00:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFj1swgZY0cQiCwL0lKNikCgBp7iDEG+eoYplYhgMbo=; b=xFfj4I8YUTSdMtwsydp7oqWhNa
	Yk51eSgpNYZgQqp7/KEG7PTigA09pmmqjA0S6pa2B6PvXMU9OjhMp2Qy9RA+t8c5/JLNzQ4NXdwUT
	V14uEH8LWoADVDWKhYUHhskNXTqbgzl4mBDDArqyD7Qwsv52ydfjEpIp2l98cvAAO0Cpn4sLOnr11
	whBlkXLM73a/rLfluUzE4REhk17HgmrziuNSo3QpH+7rVUcEdQk+kLqY3mO5yXt4ZWEx9ajxYNadi
	aQldHceX8/t6Uh9aytNjLeh/A6kbzUG71n+HTlDVXlHDkAExi8hMo+ZoePxWi1ctZnVFIccCl2Dl6
	SzOCpqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6H72-00000008LkF-1q6I;
	Sat, 28 Mar 2026 00:01:12 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6H6m-00000008Let-4C8A
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 00:00:59 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fjHj25n6cz9tnK;
	Sat, 28 Mar 2026 01:00:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zFj1swgZY0cQiCwL0lKNikCgBp7iDEG+eoYplYhgMbo=;
	b=FjufGfrY7qO1BX5ZX8lFtXVxakyFCqGggktrR8SYUs3HPgrKVC0p5VysprG0CNo08vYVfZ
	Wy70e5R4UtYozoFKqsbq8BqCDlGEu3ExgW9uIbO5YaiPrfk43tjBaoIrmWnHgMwohdu6UE
	vuEQ0B8MVXHAFhldXDtL9/ftkCSgi5/SQELg4GSFKFWdEZLNMupn8VwW7+9Uz6rmFp7Gwt
	Juj/VtlCh/sRHWvI9F5intQbpquqiurNzn0BZ0yEGPWRDKF3p+m4G9XIxzUCK30eiWab6w
	Dy0lR1ZmMCOYtGLMpbLZmY0CjIxkalj5b3hFuK5L0jlM8m9d9SG3j2kYO2clOg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=mKcWMAbh;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zFj1swgZY0cQiCwL0lKNikCgBp7iDEG+eoYplYhgMbo=;
	b=mKcWMAbhi/pIUzxeu86wgP4TKjd2KYrlMK7c1QMYw/PHoj1sAgJW+9SqV1ukeVVdGwdyfQ
	Y9bOImZ7Bwtl4ymd4FckNy7cgiDY6k20+WEwQFYvfE4NPqMLS/BmlMlUo79S2xxi5UaQsm
	nBBXQ9pGSlWUzORfJF7lFLPfVDbdfv93dgOdICH5XrCvgYyWg0tBPLSn+bvuz5ru/wIBYq
	rzMTr2fVLgyYq8UYULy8DqYg3mnZlGyU4DSd0N1Wwovnn3zXcUP1QCmki5IM3yrH37qoaM
	z1hBF7nwsBd387mp3Vn1gq+wLY7MyAEF08kZlXc9H4Z1nPR4KeFEfIvuuHz+Cw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [RFC][PATCH 4/4] ARM: dts: renesas: r8a7740: Describe coresight on R-Mobile A1
Date: Sat, 28 Mar 2026 00:58:21 +0100
Message-ID: <20260328000031.94645-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
References: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 11hto1pogtjuona37e5pzkj8u7wbj4gb
X-MBO-RS-ID: f188a53aa2bb19dd3b0
X-Rspamd-Queue-Id: 4fjHj25n6cz9tnK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_170058_308409_B247340A 
X-CRM114-Status: GOOD (  11.38  )
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

Describe coresight topology on R-Mobile A1. Extend the current PTM node
with connection funnel, TPIU, ETB and replicator. The coresight on this
hardware is clocked from the ZT/ZTR trace clock.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 114 ++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index 0a622da79dc1a..eb1abc90c4f59 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -18,7 +18,7 @@ / {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "arm,cortex-a9";
 			device_type = "cpu";
 			reg = <0x0>;
@@ -59,9 +59,117 @@ pmu {
 		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	ptm {
-		compatible = "arm,coresight-etm3x";
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+		clocks = <&cpg_clocks R8A7740_CLK_ZTR>;
+		clock-names = "atclk";
 		power-domains = <&pd_d4>;
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* replicator output ports */
+			port@0 {
+				reg = <0>;
+
+				replicator_out_port0: endpoint {
+					remote-endpoint = <&tpiu_in_port>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+
+				replicator_out_port1: endpoint {
+					remote-endpoint = <&etb_in_port>;
+				};
+			};
+		};
+
+		in-ports {
+			/* replicator input port */
+			port {
+				replicator_in_port0: endpoint {
+					remote-endpoint = <&funnel_out_port>;
+				};
+			};
+		};
+	};
+
+	etb@e6fa1000 {
+		compatible = "arm,coresight-etb10", "arm,primecell";
+		reg = <0xe6fa1000 0x1000>;
+		clocks = <&cpg_clocks R8A7740_CLK_ZT>, <&cpg_clocks R8A7740_CLK_ZTR>;
+		clock-names = "apb_pclk", "atclk";
+		power-domains = <&pd_d4>;
+
+		in-ports {
+			port {
+				etb_in_port: endpoint {
+					remote-endpoint = <&replicator_out_port1>;
+				};
+			};
+		};
+	};
+
+	tpiu@e6fa3000 {
+		compatible = "arm,coresight-tpiu", "arm,primecell";
+		reg = <0xe6fa3000 0x1000>;
+		clocks = <&cpg_clocks R8A7740_CLK_ZT>, <&cpg_clocks R8A7740_CLK_ZTR>;
+		clock-names = "apb_pclk", "atclk";
+		power-domains = <&pd_d4>;
+
+		in-ports {
+			port {
+				tpiu_in_port: endpoint {
+					remote-endpoint = <&replicator_out_port0>;
+				};
+			};
+		};
+	};
+
+	funnel {
+		compatible = "arm,coresight-static-funnel";
+
+		/* funnel output ports */
+		out-ports {
+			port {
+				funnel_out_port: endpoint {
+					remote-endpoint =
+						<&replicator_in_port0>;
+				};
+			};
+		};
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* funnel input ports */
+			port@0 {
+				reg = <0>;
+				funnel0_in_port0: endpoint {
+					remote-endpoint = <&ptm0_out_port>;
+				};
+			};
+		};
+	};
+
+	ptm@e6fbc000 {
+		compatible = "arm,coresight-etm3x", "arm,primecell";
+		reg = <0xe6fbc000 0x1000>;
+		clocks = <&cpg_clocks R8A7740_CLK_ZT>, <&cpg_clocks R8A7740_CLK_ZTR>;
+		clock-names = "apb_pclk", "atclk";
+		cpu = <&cpu0>;
+		power-domains = <&pd_d4>;
+
+		out-ports {
+			port {
+				ptm0_out_port: endpoint {
+					remote-endpoint = <&funnel0_in_port0>;
+				};
+			};
+		};
 	};
 
 	ceu0: ceu@fe910000 {
-- 
2.53.0


