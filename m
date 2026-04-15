Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FB8F433D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 23:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuEVUSzujVt/Q/StPJJ2CilLCd/vNo6hNhVV5XzrEwI=; b=qNcw6NyG+gLbfmIEQJfcS4SIXp
	YyRDk1ISDNh+yAWPfMI8ld70Lq52aH8liI9v8RyXsV+wHG3vWZn8wTH80Vy0ha/FAciiqljlpjiBN
	aHYKQ1xtPQIibZ8UP31akHbC9tmsbmRDusd3RmujqJJbgYyc05/WC0S+Fneww9qNnJt5NmbPBwCxJ
	wQ9YHPM/jv5pqlEMvZ0WzAIAOu9aaZ6YSE2HYbG4LU2VBsM7yW/ggvv5pmAFSEkTW9ChyWxK5s00i
	kVq+TyfrSBHq1AbjlFGDQ1nEKZEeZzLtYuU0XCwSsdUYG4DA2S4yI8m0+8xZjEsbEYPQRN3hzRMp7
	iqYwe1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9jg-00000001l6r-085b;
	Wed, 15 Apr 2026 23:33:32 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9jc-00000001l4x-32fj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 23:33:29 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fwyBZ6Ydzz9tVm;
	Thu, 16 Apr 2026 01:33:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776296006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuEVUSzujVt/Q/StPJJ2CilLCd/vNo6hNhVV5XzrEwI=;
	b=xUlVMjk4v1mFYDjrAaLIRg+jPY5sEr1psYaV1mytlHBw5DQfKtFzAi6fnEY1BxVTXNZ/Eq
	RllNtmYcwFnsfVOe6ZG9qxSZl/8DeRiYgjhn62O4K1+W9XqMt69suRGWB5E/nE6ZQyOo/H
	zjeAGZsbi3HRReQPTyt9ZkNPWoIIV15F5CBs2Yi6xIwXS7IkkhbGQdQ5I1lg0TLhGg4zlw
	I6m0o8iKiafDqJmxqZhdepasnnmJbObdFYGKDC0jqO3Vn3HJppGdbBhoFd4KrIVEoRAvTf
	KTBE4KUjiyFdtO9ug9Sj6Y/2ubB+Sgjfem2/21GIKs0mMF56UTUomOFgKnzbeQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=i+NtlbQ5;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776296005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuEVUSzujVt/Q/StPJJ2CilLCd/vNo6hNhVV5XzrEwI=;
	b=i+NtlbQ5A4mo4CKSdD8tEqXhXEdBhbDXw6jQgaPXOjpTbTKd4zugD3kRPmMkurPwyiOe+S
	yuX04Cc1We7z52n1BFA1wACnb6YyXfnkEtbCeI41Q/wBlUdmpRpOv1YpN8Sz3m+aSaCH+b
	vw10/ZgsvdrseXhltSJ+xRJaSW/1PljUpxgeOhBxA911qJG+LV+wUsciAKiBQUG5yuo/yG
	3Wdwxov9l5zIkJxo/PGGJdfWjUcyXjRToPXemRnc2ANZuPL+PLRDlu3mfu6Z9oAgcNhkto
	xIHNid7FOiwYxU3eVrf1XC+2UITFHzIvvGJEpKcIjhOqHMUFeE9l44/V6Ivtkw==
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
Subject: [PATCH v2 4/4] ARM: dts: renesas: r8a7740: Describe coresight on R-Mobile A1
Date: Thu, 16 Apr 2026 01:31:41 +0200
Message-ID: <20260415233300.457892-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: re5sn96ryqeeks1kst6zemrq5ksrtwrp
X-MBO-RS-ID: dc50e9f7d3708bbf752
X-Rspamd-Queue-Id: 4fwyBZ6Ydzz9tVm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_163328_912559_3FBFFBE5 
X-CRM114-Status: GOOD (  11.02  )
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
V2: No change
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 114 ++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index f7136db7a2eae..c7056b96ec0b7 100644
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


