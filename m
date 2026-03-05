Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6D0F30942
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PVhuX+l+sVjGT+ko5BL1Nb+mbnU6aEmFddU/rnrJ3m0=; b=c6B5ogFuHms3+6JY57LcuRBUSx
	rdjDXCowpBXyeImyyGa/1YBBYocYE3aIy6vCTGH7SdxvQzJDGfnUWYP6SbFn87SVviyOxyfunHQ+N
	Ko+vzYba17zwN58/emtSBHj5+yuS1VBcxDtfYO3iXoBqvci7/mNa4TVyDFL9zO8rW/ZGFDycChF2M
	3kq3bOuSksk1u2sIGRpkI2CJYIFBBX39qEdX6CKr/WiHj9qfnkGmH4G2vyZ4t0DfLd0oiCrylayZb
	/OdGY9NFADiN/VgHkbtfrdfV5jU2yBy0JuggNRGgjOx/BRvjFFAmGv4YPOHuQOU7a5sPf62BH4hAu
	cBQ1wjmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6bj-00000001eye-2gtr;
	Thu, 05 Mar 2026 11:11:07 +0000
Received: from mx-relay12-hz2.antispameurope.com ([83.246.65.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6be-00000001exJ-3APD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 11:11:05 +0000
ARC-Authentication-Results: i=1; mx-gate12-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=PVhuX+l+sVjGT+ko5BL1Nb+mbnU6aEmFddU/rnrJ3m0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772709053;
 b=Y5kll0HXEwqii42V9YEArSmY0xyYhfDjJsM8M5lOKfSmeJpBKfp7FSOMwGQ0g450KJJt7LSR
 SdLLY6kSPG8J9/m2WR653++zN55av09m3xOiO7DpF5aK2uI74PpPy1NNPgc096f2HKxonChB1p/
 EQmPYiAcPn8GJDHYOVKkUxDxWK5h0j2O4VITGzNfocLBKM/tg4LuJeiEJGRgOXQHNHBWDe2415n
 /oQft4uRm1mIwB7Nkb7yie4gfiPEFA+g12twArL3g+zaJGgHWcQZbfx3tcu+GHOG6XYhlyNnYbz
 DcU6DmYkWcJM3vgOnVNrwRNU/+7wJfBEH7juxAtrW1xSQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772709053;
 b=hQEjaGuaE2orZZzREqMFz6dO+DvhcQ9F1N9v7AVday+9hn8r0Kk8ZasmN6b8+0yd8kG94Q+2
 hpoIhxWDeHRUgvTTGiBc9njQxleQUt7Sv3cXFZ+NiNZJ6XCWFrdXsUxQ6pKhGAGskXNsbzOwbct
 9nA796TSJXImIYhqwgH1+tM4+aEMh8qqGMVpr9LBGFFmYKJ5+wAsSVpgkTNMt/u5pzjIwgv0ODW
 WZJsTxOHW/xO7SJXSkTnDsZ+1LbYAO+ybz1fhx4G3nySlcUVtFtqbhmzUwqpy+NFIDF1OoDWrj+
 djv4UxwM1LMLXX+7qOAYJMXXZLy0LB5xqy3Bk9aGrMRng==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay12-hz2.antispameurope.com;
 Thu, 05 Mar 2026 12:10:53 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5053DA4079E;
	Thu,  5 Mar 2026 12:10:42 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: tqma9352-mba93xx*: Fix Ethernet PHY IRQ support
Date: Thu,  5 Mar 2026 12:10:36 +0100
Message-ID: <20260305111040.1899965-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay12-hz2.antispameurope.com with 4fRRfW0jJDz3B9xY
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 1285649cdad526a2a0167bc5483f14a0
X-cloud-security: scantime:1.458
DKIM-Signature: a=rsa-sha256;
 bh=PVhuX+l+sVjGT+ko5BL1Nb+mbnU6aEmFddU/rnrJ3m0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772709053; v=1;
 b=Ygh6n4+HKoR/LUzqFH4T2XXwqC1d0/KNCGk7TFN0bZWRy314EqmWJmOGPIuBqGxvsKwoJIAt
 09wUMfNFipcVEwyxg4KxRTvWO7TIM1RCJL9MQbfPPDX3QTJU6LHYgEvWPkSaebVa+g4qQ28w7Te
 RgHSce+X8KuhF2haGpXxj69Fj8LO4RzMjEuw27JA9pSppORbMi5XHjnjVwYn2lX6a+upOdhbsyQ
 1x3aa9AIefIUf2w0OQWTHNT5RHLfEggssTZibe5Z5w3IVOn4B/nilx+ASQxDbTL/uQ3xlXcEOSg
 VbWE3WCTxZRiVDPHwRC0ZhaNXzZIVyL0upHsIKUHmMVxA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_031103_059831_AD379AAA 
X-CRM114-Status: GOOD (  12.13  )
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

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index 4760d07ea24b5..9108181e6592b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -242,7 +242,7 @@ ethphy_eqos: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
@@ -275,7 +275,7 @@ ethphy_fec: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
index 8a88c98ac05a7..a78bbc46c59b2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
@@ -172,7 +172,7 @@ ethphy_eqos: ethernet-phy@0 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_eqos_phy>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 			reset-gpios = <&expander1 0 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
@@ -205,7 +205,7 @@ ethphy_fec: ethernet-phy@0 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_fec_phy>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
 			reset-gpios = <&expander1 1 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
-- 
2.43.0


