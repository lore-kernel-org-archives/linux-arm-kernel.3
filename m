Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029D8C56201
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68DvBw7C0r/sh/Gh8ps74CB7ldatS0EygipCKbHo5Hs=; b=SUrVkrRE8Iac+i1KTkkWv8maMn
	JOL5lKhNLU3ZVUqsaShqkVcpVCAavL4ogZarcnQ51xAy7raDs6bpartwM5RDzc0AzVOHpMHq6URt3
	dCCE+lIg8jPxlyBuj+d088P7+hS3hK7U1H02aJWILBahtU1rpNmh6xWJ93wSXYev5Z03Xtdm6NtlC
	RWYHgtVzO7vQZ6GLALhTuzro7aWwol61Rowx3kbsu6I8KfrFMOmUn1ikgtqKfH2tBKYAIxxxJYqY7
	yWTUJTbwuyT8w3eU8qr44vTUQWTkVWjPY+8Sn+309wA4w6aQOxa3fRzLHuVz3oBiPyjn4P5vdMxiB
	cvIfYTwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRz1-0000000Ev95-10f8;
	Fri, 20 Feb 2026 14:59:55 +0000
Received: from mx-relay90-hz2.antispameurope.com ([94.100.136.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRyt-0000000Ev6f-3SF0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:59:50 +0000
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=68DvBw7C0r/sh/Gh8ps74CB7ldatS0EygipCKbHo5Hs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771599578;
 b=bdKDkyZAByOd6LoS+QiUz9rryKPzQ7Jup9qrv6i/t5fU2Zh1MR+nKL/y4HP3ba/bYDNhG113
 NmqnOzUfCTk0dkehNEY2TTGpmV6eWPnVggk4aKgwEpHTQaeEcsPhJurwx3pFjxN1+F/EFQOgSbq
 5vdjU7um04EqQqyFMPJ58dEmgrVDT2WMRKG0uQXsOMSmP6QrXX9WxTUarwOJ1SCRlTONtJvV5dO
 xJyFsLiU8rA/nCjCFDk0Cdr24sV44xGryBdZhpyE0kv63VCpaFsH2NTtoOVN5YepTo9E9oGCnml
 3ZYg9fwAsV5S3uxzy+iSDJ58XvcF36NowtfEjFonUavyA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771599578;
 b=MQhL5vmtfn6H/lLcToVRt6G0M4WlUVHs0VaKquwmAHTLTjhcgG9CChk/CDVUOSh0LkpAsZ7M
 OrecQFwXQqv1BZaFj8m0thxM4MaML0cxOg3e7UrYBINGeV69x5BH4ozFdvnj8wDAx7aAk9f4urO
 /E3VUA07SVgLqR30hEEAVhaghKi2uWK7S6sMi3yPkn7+7J5KJD1neCOSdfqKswnV3YtnbWjmT2r
 p3SlkgeEPZno0SQVUCaRzq/fF6JFQVfiK906pofghDl1GD4G0T4SxP2VxSR8zEgG72eDyfUO8DB
 Ix6R/G+Gtw6FmIIQiuW9mBSe8piBj6v0qh8YVM/ddgIDg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Fri, 20 Feb 2026 15:59:38 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 76B8D220B38;
	Fri, 20 Feb 2026 15:59:21 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 1/3] ARM: dts: imx7s: add boot phase properties
Date: Fri, 20 Feb 2026 15:59:07 +0100
Message-ID: <20260220145917.1797286-2-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
References: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.feilke@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4fHYLL0kZXzWxwB
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: c614331d226334654bdcc2f6989c9275
X-cloud-security: scantime:2.494
DKIM-Signature: a=rsa-sha256;
 bh=68DvBw7C0r/sh/Gh8ps74CB7ldatS0EygipCKbHo5Hs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771599577; v=1;
 b=kT2uOjzj8wDrpHC0oSbvVwEaG5ks5RCpcmnFMkCR1aeKm5HnCQNczeN2OmjSHP3TfkpgDoXn
 zunIRe6dn8PVSbuWiJ3tGVK/4kUoz9G+V6gHPw5cxVnGJ/c5YuKVbRO2mZsITrgLB/SNIfl9VSa
 mn0Uh0HMXtQwmcDFacXHihMS4/5klPa1NZ57RRo2LBGhYFGkDaNQ2OM0GHiyms2TgtTEhp8Lut9
 OO9ElG9YctYannj18lstwGK7mGbp0x/EYOuWv7XeOR1/5vyL1WQJFhjjBw83YAl6Eb/lXPDiYoh
 kyAxB/ZrztEf2/VFNJ9BXYIZTiHjOEDZoV1pNW7X9bHdQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_065948_119678_9E67FBAA 
X-CRM114-Status: GOOD (  11.84  )
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

Adds boot phase properties to essential resources in imx7s device trees.
This includes the buses aips1-3, iomuxc and SOC access.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
index 9235dd7e93bb..5c9be24ba7c5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
@@ -209,6 +209,7 @@ soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gpc>;
 		ranges;
+		bootph-pre-ram;
 
 		ocram: sram@900000 {
 			compatible = "mmio-sram";
@@ -371,6 +372,7 @@ aips1: bus@30000000 {
 			#size-cells = <1>;
 			reg = <0x30000000 0x400000>;
 			ranges;
+			bootph-pre-ram;
 
 			gpio1: gpio@30200000 {
 				compatible = "fsl,imx7d-gpio", "fsl,imx35-gpio";
@@ -543,6 +545,7 @@ kpp: keypad@30320000 {
 			iomuxc: pinctrl@30330000 {
 				compatible = "fsl,imx7d-iomuxc";
 				reg = <0x30330000 0x10000>;
+				bootph-pre-ram;
 			};
 
 			gpr: iomuxc-gpr@30340000 {
@@ -712,6 +715,7 @@ aips2: bus@30400000 {
 			#size-cells = <1>;
 			reg = <0x30400000 0x400000>;
 			ranges;
+			bootph-pre-ram;
 
 			adc1: adc@30610000 {
 				compatible = "fsl,imx7d-adc";
@@ -902,6 +906,7 @@ aips3: bus@30800000 {
 			#size-cells = <1>;
 			reg = <0x30800000 0x400000>;
 			ranges;
+			bootph-pre-ram;
 
 			spba-bus@30800000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.43.0


