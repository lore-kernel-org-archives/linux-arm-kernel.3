Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1A3E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhpAHeK5WnP5K7fPONIfRy2XkHtMpwUTgs7kyE7vMb0=; b=BmONPKcHmUCiggRfttICBeJhVK
	H+qxTHY0mBG/wNhT8w46CsX7DssUknJRwHgBZklpTremE+UCxvAIFQ9IeGXJnOOQSSSnl/NOKF6/j
	QPX00JWrlAju2IXdszTSNIs9eXqmxWAJs2I3IP10XZJkjgLQ4xeOj7kgxx8nOPxmAIGe8TJsd1BzH
	RU8sY0MAEp2+5mVebLhyHlnHUc1qw+VE28FZxQtIv0hmRkZ72/++kocKwGDkuMNNLknXQOcFxPDsv
	LbKcSCOvmIYAbgPRKzzPxkoiNjppKlPRbGcm3N1TbyicNIzdV0dsJrmnBf0HzPQmyKeLR5nUf9+/k
	TyRwakNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshXR-00000009rND-0tkR;
	Wed, 18 Feb 2026 13:24:21 +0000
Received: from mx-relay39-hz1.antispameurope.com ([94.100.133.215])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshXI-00000009rE4-1q55
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:24:15 +0000
ARC-Authentication-Results: i=1; mx-gate39-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=mhpAHeK5WnP5K7fPONIfRy2XkHtMpwUTgs7kyE7vMb0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421040;
 b=sgfhiv2L0hN9QrdBU4xmoBw/b8JR3qFr32a5GIJE8dTE9zZPy7MnM6OgXAzjS+ojvf7hCDFc
 0FgxPJJr41QORH6wymWoEUNGYbNZvbyY0mJkp3ogwKKUb/VcvNsECaEid52RQcYSqJ81Q6q4BoI
 wUmRMoeqGGsf+lpu7mlyTxkxAm5fS3LINEOxa6dWlVGDaUViHZBTfOAXTrli3QSoXfvhBK/QVEJ
 t2RrUHD3O1vjW46sBo8P1+2BExfMfbUfZsUbVsr+oo9ISQJrfL79S7lIQG2jbFtWvDFKwz95QuK
 +0Lkwmi6beSt9ueg04JH+UThj4odjW9aWcL2CVLcrNifQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421040;
 b=FCf7WaGQf07u9DuBpY/qg0cdrDkPuaHznsrNC04TP24FCIGvSk6u/EgXhKcgHOpediyBrlvg
 mbBjk9ZnlXS3rulO7Lv6x+LkDXuE/yki70uPEIwmUVrbehVNnUyqlAH6NGqk09H9PWNDC7SfyYz
 Q+xdJ7HPKAfz1M7jOesm9mL7kkFH81Tucj+W5MkMteAmMtGXini2IAE6nREFlBaDWbYMEpU0RLV
 WP8cF+tQ7diSiGoh9xwG+JKUsC7m/WQN07AfmFcVJ45nsx5zTCIYQ5wTfrkndLB7HyjyM1MNapr
 N9TkHL354hcclpxzw5MnwczOZymfAbJKffESXEk2xhglg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay39-hz1.antispameurope.com;
 Wed, 18 Feb 2026 14:24:00 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 846442205C2;
	Wed, 18 Feb 2026 14:23:43 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: imx6ul/imx6ull: add boot phase properties
Date: Wed, 18 Feb 2026 14:23:34 +0100
Message-ID: <20260218132339.32157-2-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay39-hz1.antispameurope.com with 4fGHJw1fnTz18J6L
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 965d9ae517c88a7aee3ccb289887b696
X-cloud-security: scantime:2.251
DKIM-Signature: a=rsa-sha256;
 bh=mhpAHeK5WnP5K7fPONIfRy2XkHtMpwUTgs7kyE7vMb0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421039; v=1;
 b=ed1KHCthfhyZ2o2Gawv+KZRUSVAcDGoDey5lytmGg+SPRvpXY3DTlMV3ZtaTR17m1Exo5JJQ
 gT1p51vHg4jWz4d10OY8pdyWCNN+ZRqOFhDv5Tuzp0goXWX5+2IWL+7HiTOE91mNmztMBPqy2JL
 IuVGqiW15Ia46CH3nEPgJ6Lq+9hdfcMn4JsdfkmTLr6DLCabWGYWnA7baCmCQia04IWb0OtU1St
 eRURVUP4KXQBDKW2x25z5ZLWtZd38qRzwd9KGyT5KO41akOtVXNJRFnhOX1J71UCOjs0VL9ndYl
 kGW8hikn5UCNHI4w8p2OZiAkD8ZQec12CPdxJxjE4ODrw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052412_621418_FE33C3D2 
X-CRM114-Status: GOOD (  11.60  )
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

Add boot phase properties from U-Boot device tree.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi  | 6 ++++++
 arch/arm/boot/dts/nxp/imx/imx6ull.dtsi | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
index 6eb80f867f50..c745f30a9b25 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
@@ -115,6 +115,7 @@ osc: clock-osc {
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
 		clock-output-names = "osc";
+		bootph-pre-ram;
 	};
 
 	ipp_di0: clock-di0 {
@@ -143,6 +144,7 @@ soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gpc>;
 		ranges;
+		bootph-pre-ram;
 
 		ocram: sram@900000 {
 			compatible = "mmio-sram";
@@ -202,6 +204,7 @@ aips1: bus@2000000 {
 			#size-cells = <1>;
 			reg = <0x02000000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			spba-bus@2000000 {
 				compatible = "fsl,spba-bus", "simple-bus";
@@ -580,6 +583,7 @@ clks: clock-controller@20c4000 {
 				#clock-cells = <1>;
 				clocks = <&ckil>, <&osc>, <&ipp_di0>, <&ipp_di1>;
 				clock-names = "ckil", "osc", "ipp_di0", "ipp_di1";
+				bootph-pre-ram;
 			};
 
 			anatop: anatop@20c8000 {
@@ -745,6 +749,7 @@ power-domain@0 {
 			iomuxc: pinctrl@20e0000 {
 				compatible = "fsl,imx6ul-iomuxc";
 				reg = <0x020e0000 0x4000>;
+				bootph-pre-ram;
 			};
 
 			gpr: iomuxc-gpr@20e4000 {
@@ -826,6 +831,7 @@ aips2: bus@2100000 {
 			#size-cells = <1>;
 			reg = <0x02100000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			crypto: crypto@2140000 {
 				compatible = "fsl,imx6ul-caam", "fsl,sec-v4.0";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull.dtsi
index db0c339022ac..ba0ea10c7b74 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull.dtsi
@@ -57,6 +57,7 @@ aips3: bus@2200000 {
 			#size-cells = <1>;
 			reg = <0x02200000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			dcp: crypto@2280000 {
 				compatible = "fsl,imx6ull-dcp", "fsl,imx28-dcp";
-- 
2.43.0


