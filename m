Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF1DD6E2AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNktqPdORa2qnhbyWV/LXLPJYGLHHIks8TSaavnZQv8=; b=ojeanbGaMh77Rn63GwoZ+pQG1v
	fpw5Du6VX1WH2wHyoxukkfEj6pv5fB8ZhldEU8TTCV6vcrgXRWiWo4UaSvTqBx5kVuNAzu4iL1k74
	6YxQ2bfivdUEfN60Hl6+X888iqRduMT6j3uxTFtKz69HJgPeJku7WBVnd/+FUyksbAGjdE/1CX9ub
	qWFD3ywNXVVW0nUAp1+pDzUmyr3Fpj0nc98rw6xMhn/DLAy3SN7sjEYP5oWQl70hU3Ydq4rPoXIew
	C9EhkNQqZrAzX3QtRdyxpK16YsTxj8JX96H3OK2+MDwB5to1/23CwZgwdWN74NTCAbgnKrkf4wsoU
	ee4qm/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGBa-00000008ijb-44iL;
	Thu, 18 Dec 2025 15:45:02 +0000
Received: from mx-relay95-hz2.antispameurope.com ([94.100.136.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGBX-00000008iin-2jeV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 15:45:01 +0000
ARC-Authentication-Results: i=1; mx-gate95-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=cNktqPdORa2qnhbyWV/LXLPJYGLHHIks8TSaavnZQv8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766072680;
 b=qfdMqFL5mZqvq6OOi2GR8kPnl5Kdht5pByY+kCV0ifvEYbFM+wrpw8d78x5ktgDeoY4q/im5
 eRE3bu3+go4IxTi0IuTQ24nz8gf+Iz/G7IHGxFlb1HZ/RT2R4D3+qdQMKvBZ1AeGwBmG/FXUXpS
 aTMtaaOqdIpn+RuR2kBooZkdgBfWEs1j6vvvGNwIqZKScXQhB0Qpww8U9pyHk4bwUKRoIEaDz/b
 XBGoV+/haS71LMzo99QdAkHIRjmTXotzHe8NxikH3MOIXy/Xam5STF8O+CGh5sD+GGNTJav4MBs
 cZlR9oczsCyPYiWUAlFhPFt7w/jIQ1ib8cu2zc8c5OXaA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766072680;
 b=LKA/xAPzO+40Mds/j1pO5SGFgi5n736XH324nORJXC0aNkmGkYGfJVFvLQutETwY6jPGloCx
 K/xOgFyW3u1SnToTK46f/m3chdAFzgiYQY6h6b1YyHt8G4cGSW/IriLyCFhHaqyPOwlBE8ZzXc9
 L7ELr4f2XUEeEMq2TvQ18pkJmH5Ke2KPw/SzBc1hpGVCnUIIcNFKJx7iawFwDo8dJxlQL/dokNy
 dqR9SQ6Sy4NZL669G5vlyFhiabD+Q04zmuJqmCNOYqLJNY1suMQzSlQcuXj8g8gVyqQDo5QSzLS
 QwRHflgGG+xwtPdX19TA5v41UU9lMqYiWtL9WmoWaktvw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay95-hz2.antispameurope.com;
 Thu, 18 Dec 2025 16:44:39 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6EA1B220619;
	Thu, 18 Dec 2025 16:44:25 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 6/6] arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster
Date: Thu, 18 Dec 2025 16:44:08 +0100
Message-ID: <20251218154412.1524249-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay95-hz2.antispameurope.com with 4dXFMt4MRFz2F8Jm
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 30ac5d452f02eb17521dada3ca6d72f8
X-cloud-security: scantime:1.560
DKIM-Signature: a=rsa-sha256;
 bh=cNktqPdORa2qnhbyWV/LXLPJYGLHHIks8TSaavnZQv8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766072679; v=1;
 b=pmz0FSS/fXhlasZcCza6oxh5Q2ztUBBf06bjpm9wogpYLgme7XJHZJIsGUCU3QNRtVlfCSQW
 F1wvv4VK4Ru5B6DNrIyBfs8nXlCDm4jRHwYvWeL4XHvUjaTUUQAtvQYJoGFZPHdvrP1UQ716sbD
 UYP+o2U3qIFDY+mNZCsuQqKgSGd8C0Q0ThVdnmjR6VmD1wG6V5gpIEmhFI69xsOdqr5QWCxkmJA
 LatGPaZAFTlT+ZHEgxWpLbe4tVYfvucem32uTronHM/ytEhP1AJoAxQbG93F5Fy3Hg+GCtke9rK
 AE9YigjQVSylW11Bb/cfsnyDy8dhs4uaZdpshwO3Wj/cQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_074459_957128_A43D5843 
X-CRM114-Status: GOOD (  12.01  )
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

Due to missing workaround for "ERR050104: Arm/A53: Cache coherency issue"
disable the whole Cortex-A72 cluster.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 39 -------------------
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 13 +++++--
 2 files changed, 10 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
index ba19c3c17c496..4a5ab14ddc550 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
@@ -296,45 +296,6 @@ map3 {
 				};
 			};
 		};
-
-		cpu1-thermal {
-			trips {
-				soc_active1_0: trip-active0 {
-					temperature = <40000>;
-					hysteresis = <5000>;
-					type = "active";
-				};
-
-				soc_active1_1: trip-active1 {
-					temperature = <48000>;
-					hysteresis = <3000>;
-					type = "active";
-				};
-
-				soc_active1_2: trip-active2 {
-					temperature = <60000>;
-					hysteresis = <10000>;
-					type = "active";
-				};
-			};
-
-			cooling-maps {
-				map1 {
-					trip = <&soc_active1_0>;
-					cooling-device = <&fan0 1 1>;
-				};
-
-				map2 {
-					trip = <&soc_active1_1>;
-					cooling-device = <&fan0 2 2>;
-				};
-
-				map3 {
-					trip = <&soc_active1_2>;
-					cooling-device = <&fan0 3 3>;
-				};
-			};
-		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
index 718c792259a65..57d06817aab63 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
@@ -11,6 +11,13 @@ / {
 	model = "TQ-Systems i.MX8QM TQMa8QM";
 	compatible = "tq,imx8qm-tqma8qm", "fsl,imx8qm";
 
+	/* Due to missing workaround for ERR050104 */
+	cpus {
+		/delete-node/ cpu-map;
+		/delete-node/ cpu@100;
+		/delete-node/ cpu@101;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		/*
@@ -171,6 +178,8 @@ &mu2_m0 {
 };
 
 &thermal_zones {
+	/delete-node/ cpu1-thermal;
+
 	pmic0-thermal {
 		polling-delay-passive = <250>;
 		polling-delay = <2000>;
@@ -196,9 +205,7 @@ map0 {
 					<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 					<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 					<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A72_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 			};
 		};
 	};
-- 
2.43.0


