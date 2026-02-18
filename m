Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21094E9A04D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3X41+/DDb79VlrAXhpveO5mOonDaOzhaJoIuv+461r4=; b=gOS04L/rsypy9EddqhPRXiK+wJ
	wJ6ckxDMTp4bAQ0+LteW7VpH8J0tUPKJacY4IcH26YKBODbJrRsi2r59vDjHXPxnJbyJiN+YWD9B4
	emXNFQInx4T4wIlqZxabj1O5M5d+nRpvta1A8LCAHBnh+q5Kd3p5YqsJF2qHAsoGIj5aV9U6Ns5zC
	4ktgOMD/W7exUW0ARBao9wBlPwUcN/pSX9kJiy6ZHNONlDv8fbnU4Y+byMI8fBDS5++0FE0TqkZe2
	X119prAPPooWh+R0M+UsSSmy2y48wCVzVPlG5QmNYchcrEw2LwDaRtu8uQh0GL5tBh7JgNOhffljm
	/NubnxoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshWw-00000009r3R-2A8X;
	Wed, 18 Feb 2026 13:23:50 +0000
Received: from mx-relay13-hz2.antispameurope.com ([83.246.65.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshWm-00000009qzn-2uIV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:23:44 +0000
ARC-Authentication-Results: i=1; mx-gate13-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=3X41+/DDb79VlrAXhpveO5mOonDaOzhaJoIuv+461r4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421009;
 b=VV+J5a126RZ5uR+wqIwyau0fWSxhWap2RyQe1bEYrOBlU0XsjHeblSI75CTYZ+C1WpZ+UODK
 dO9nj+AikE/DawBwrhR+P5+cRSzSAfod536MpvGLrgddTmYuWW3l0V5lGbADWWTeEgI/JAJGzbk
 hGD1FAq4qNwtG780mhNU3dxeelLhueZAjRlJNtJ9HAJ9X+ezsBwlrlas0Hfo7Bn/zkRdkJ95OpY
 uMBCzAGncMNz+y8sbfRO1dv0a8ugPXr/R1sS5qVwQkwqhqdfXQgxAJG0zmxjMCGw+pm0N8Lif9u
 pmWtCWDmhrNIa8fnLAspiV7HMBOJh3f0OOJnxFyUt741A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421009;
 b=l/HQ0KcXu9pEgWs/L9hyxVm9+0d7UumMPTigdVBljH35Pj8aDllH0GJgJKrXYingXOv5ZA9F
 qT3pASzJXwzTx6Z35ETbS5z8BNWjkusslhfFDf8PcEdfTfvPhbmsOAoGFIMzHY0smpBUvJkdgw7
 5Tl1ZQN5WRtksCdojH8bWXVLPOkxl4hQSaJbOX2wmKZtQiMTAsawXbhQBlt6VWkK5oZm4OLgYOq
 2zz+GTV/CoLWO4xr0dBV9JMTCccaLMvEoMvvCUX28cd6EzVK6kRqlmrvJmDncsqQKbfEqIk4XZW
 09I7Pdl+kqsKxmXbkX/rJEDVIeqGbvTAaquore1KxuOEA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay13-hz2.antispameurope.com;
 Wed, 18 Feb 2026 14:23:28 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 89519CC0CC2;
	Wed, 18 Feb 2026 14:23:12 +0100 (CET)
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
Subject: [PATCH 2/4] ARM: dts: imx6qdl: add boot phase properties
Date: Wed, 18 Feb 2026 14:22:23 +0100
Message-ID: <20260218132228.32056-3-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
References: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay13-hz2.antispameurope.com with 4fGHJK21JZz3skYp
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 6bfe6034a05854dbc69e031af52159fd
X-cloud-security: scantime:1.909
DKIM-Signature: a=rsa-sha256;
 bh=3X41+/DDb79VlrAXhpveO5mOonDaOzhaJoIuv+461r4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421008; v=1;
 b=qnm00PmIXHyxYIJC3pjJORKkjYN+fYQSR/fGYsTpzfJLFuwg3Pg3KGu/W5SPAssxTyBfs3sY
 1fVCiru89sm9Up+W5aMJtha2k0YdA54yMZAO6gzZz7xBj5obF1Lf/yHP/aHQcOc24965F9AfsFW
 dUVF1HJJIABs4oesxnfs+EzEkThB7X9XZfFpUFX2Ot/Do3+weL+Rb490RWZzzEnw115YykOrFBV
 C28W40KPSkHwe9rLTM0JlJtC11PChB/vFdDio3GlEwxQNZwI5LnkPraDZfi43QKDyADp9zKGmzx
 nzFBZx59dt1UqCiqwAcoEztlVPliAc2cW8sNntxcYq2Jg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052340_876324_AC612526 
X-CRM114-Status: GOOD (  11.41  )
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
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
index 76e6043e1f91..1fcfe0751327 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
@@ -149,6 +149,7 @@ soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gpc>;
 		ranges;
+		bootph-all;
 
 		dma_apbh: dma-controller@110000 {
 			compatible = "fsl,imx6q-dma-apbh", "fsl,imx28-dma-apbh";
@@ -297,6 +298,7 @@ aips1: bus@2000000 { /* AIPS1 */
 			#size-cells = <1>;
 			reg = <0x02000000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			spba-bus@2000000 {
 				compatible = "fsl,spba-bus", "simple-bus";
@@ -304,6 +306,7 @@ spba-bus@2000000 {
 				#size-cells = <1>;
 				reg = <0x02000000 0x40000>;
 				ranges;
+				bootph-pre-ram;
 
 				spdif: spdif@2004000 {
 					compatible = "fsl,imx35-spdif";
@@ -920,6 +923,7 @@ mux: mux-controller {
 			iomuxc: pinctrl@20e0000 {
 				compatible = "fsl,imx6dl-iomuxc", "fsl,imx6q-iomuxc";
 				reg = <0x20e0000 0x4000>;
+				bootph-pre-ram;
 			};
 
 			dcic1: dcic@20e4000 {
@@ -950,6 +954,7 @@ aips2: bus@2100000 { /* AIPS2 */
 			#size-cells = <1>;
 			reg = <0x02100000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			crypto: crypto@2100000 {
 				compatible = "fsl,sec-v4.0";
@@ -1320,6 +1325,7 @@ ipu1: ipu@2400000 {
 				 <&clks IMX6QDL_CLK_IPU1_DI1>;
 			clock-names = "bus", "di0", "di1";
 			resets = <&src 2>;
+			bootph-all;
 
 			ipu1_csi0: port@0 {
 				reg = <0>;
-- 
2.43.0


