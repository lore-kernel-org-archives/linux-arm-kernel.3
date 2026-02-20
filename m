Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88A8C56202
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Wg8hhuphaDA1KXI4FRar5JXbbzUBqxPKxV6zXxqMdA=; b=bR2msU0fARuep8BD0/R08yiEA+
	dIYBEBI58DBxUH+G8C11zT0gA16REUkORbNyR8em0xDMUk/xAv36nBgczNS/UuigdL7iLioW0J8am
	TiBx7TC2iGD+RciGg0C4+j+JG8a3JyaWrfryXd3DzrQ0Ua/va542b5TyCjt9KCvu0Dlk6/F+ZlaoW
	AHZGEJyoQB1vh7YFMfefay7A41oEK2RtkUQmdgQpHwxXahK4lGXqHteln9swVR0SHojkm2y7WrQq9
	Cpn4RIvelEr1UHODX4PbYAtW8FAdNXyHFnPWYsEpoSGUCdaxsB+QLlUOXxCa2T+lpldCBO3vqsJ44
	bKVEdoFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRXf-0000000Ep2r-3Exb;
	Fri, 20 Feb 2026 14:31:39 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRXd-0000000Eozh-01vn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:31:38 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=8Wg8hhuphaDA1KXI4FRar5JXbbzUBqxPKxV6zXxqMdA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597886;
 b=Lu00iP1oymSaADW7obaHaNinWJhBLRyo+GBLuuO1WiUFdTcjweBcGOyD7sKGWxdABY8uHzag
 0+BJJf0PeJpj8Hl64ALNS663CZXzaOodV131rtx2ayjI7OIhVNWdY49PbFCDPICe0RxBB3jnvvM
 HMaOdxroSo54QUbY1/13z+8JRorzhpRze7HKCjN5M1h3ht3L2Aa3+tAj8VhR1vm1owvXZ5DwoXk
 KuknEatmHBTkeqfbM6nnlMci8/8gkTCJi3Yjo6XWXZXzF6i5P2EUJcHU6x9o2pHCZ5N2+4L2pVw
 XBTyZtgzrWCPi3KbVIu1LTYfRAwTaVcZO1/u0j8sQZRHg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597886;
 b=PF17XpyUhfdd1s74W+UHcSNDKhDxGAA2+w+8cQ4LQIG8PisK6YZ+I/Mgpch+C6bgfp2f2qM7
 B0Je+FH3HS1R4TuYlejSK4QwfOHx+nDbdsY7U8gK1a9UYISzjbd9FgcCUCxF0Z7cFHEx2zkgHUO
 ZfFgAQHL5Ztu6DpFlR3o7OBdOfdTTWQFT2Ky4nBGtnwAhqC4i9qOYl5D/dXmgxa5Ka4utPnwTmz
 1DfnKuWEsR3MNLndbmoHWm4b0oZEl8raF/UCMTqkaA9ail9zodkPkTsldmD3fKSARtnlYSKDf/P
 6QKCqUgJHS0nxxyhRX8sBFftSKF6Yv8/8wlHoCTBp+lYQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:31:26 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6C8982205DE;
	Fri, 20 Feb 2026 15:31:10 +0100 (CET)
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
Subject: [PATCH v2 1/4] ARM: dts: imx6ul/imx6ull: add boot phase properties
Date: Fri, 20 Feb 2026 15:31:02 +0100
Message-ID: <20260220143107.186956-2-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
References: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4fHXjq10Y0z1kNt3l
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: b31b8f68e1352bc9e8374fc850558ebc
X-cloud-security: scantime:1.849
DKIM-Signature: a=rsa-sha256;
 bh=8Wg8hhuphaDA1KXI4FRar5JXbbzUBqxPKxV6zXxqMdA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597885; v=1;
 b=iaST2mjN2YXl1MkzLqPUauwfpWg/ulP7T3q+LrXDqtye1gLjanWksdj5Q2OHJOv/SrKLOFjK
 rfLKKR8uO9RwCRO2ZtAISE4jlaZrLhq13xHKfB7Jt2L7tRSeDQ6DSsAJkUSIL3IICLnQoWgS/Gl
 i2bhcHTfdPB0x/s3OGTsMH+d1baqsjjUAcY06UQ+HQ38Sw3g/T/R5JaoHJstzNJ9g3nceBcj5Gx
 umHTsBAI4CMZdiFRFSNJeMxhpykUhFm5l1elJNCEa8Zl77ZIW/7pSi70fHSzierahiKlkKHsz1o
 nu/giTyOJX0O8XwCIjMQF8PFywpwfes3qnIGt9bpgcgxQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_063137_185555_4E2445F3 
X-CRM114-Status: GOOD (  11.07  )
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

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

All SoCs require buses (aips and spba), clock, iomuxc and SOC access
during boot process.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi  | 7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6ull.dtsi | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
index 6eb80f867f50..24541fdf49ce 100644
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
@@ -209,6 +212,7 @@ spba-bus@2000000 {
 				#size-cells = <1>;
 				reg = <0x02000000 0x40000>;
 				ranges;
+				bootph-pre-ram;
 
 				ecspi1: spi@2008000 {
 					#address-cells = <1>;
@@ -580,6 +584,7 @@ clks: clock-controller@20c4000 {
 				#clock-cells = <1>;
 				clocks = <&ckil>, <&osc>, <&ipp_di0>, <&ipp_di1>;
 				clock-names = "ckil", "osc", "ipp_di0", "ipp_di1";
+				bootph-pre-ram;
 			};
 
 			anatop: anatop@20c8000 {
@@ -745,6 +750,7 @@ power-domain@0 {
 			iomuxc: pinctrl@20e0000 {
 				compatible = "fsl,imx6ul-iomuxc";
 				reg = <0x020e0000 0x4000>;
+				bootph-pre-ram;
 			};
 
 			gpr: iomuxc-gpr@20e4000 {
@@ -826,6 +832,7 @@ aips2: bus@2100000 {
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


