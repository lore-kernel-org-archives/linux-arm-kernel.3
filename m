Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF3DF3D331
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 16:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qunvVZbr1OHnsRzMMjCCaBPW/FI5Phh9yb4tEKcRPz0=; b=BqBTIdz6320zwDWvJyqWnvFdTj
	PKR0t3YhN8+57rL7aYmetohtaKaD5BN6C5nW+6peFMMDO0Q/J7ySCyyTRfNhOAHn9F4gyGNG15Nbp
	roswSKLNmvI7pN1CSXlLAHNXF/aHoMBUWu6vTiKorBAHVqtl5qatRibPpYXUL6sEX37gJaTVT93U+
	OGLeum6koVlASuMq55U/cf0dcY8Ha5CJ+oeqxGh6YHdSy6YaCLAKe5/fgF/+RGLXTjcWPF+yHGX3H
	9P4jRYeSpSbUCrLbQGOPlJgT3xsr92LQj7ROLlLg4b7Jq7NaPSgXdTyqw4oGhd+xBBcrbTM11nOKD
	PQrOHNpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBpn-00000002EDo-2vsY;
	Thu, 05 Mar 2026 16:45:59 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBpl-00000002EDP-0z4o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 16:45:58 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=qunvVZbr1OHnsRzMMjCCaBPW/FI5Phh9yb4tEKcRPz0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772729149;
 b=e7Ga1b+YvQPtvnbtyiPx20r+ycPORmNxBBiGWQX9ZosRcAf+oIGugtzp0b0N2BbqhR0FdFL1
 0+OtGti1hp1M0SU3NkL2d2pSrCO76X0nEK+QNoH4zPqjZNVXmt1wPlyJa+4MiRdi92KISCe9iAk
 FUVA0Bnw2FV1XdVYqdOqBV6kJRHoX8edVoPoF04z9qlllV8qaHI0+PWV2BZvdT1pOG57P6pVz8L
 WGvX1iauKeSmfILqR7KoawtGyKM3M7L4dv6AcD1QPCxsepdwYyNZTAV16tkXjMHpomRfW0zW+IV
 filZC0WQo3Ux1hH81PETfZ/ubpdNwDgK11+ymVs6PbZpw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772729149;
 b=FjpVI4N2w0L6QvfgcjHZHOGqeA/nTz17e4JDlQFIpw0+luogij/1IJoYQnLd6cQ4BsDJylom
 t9PyLsGlagRL1ljbArnBYq5BSgpdw4p1HvizYFf+/wuelF8gYGUcvjaD2s/HtCIPx/Ydz9FxYJ3
 KEc0MPZzIOy+MZ+/akRcKJny2su+acjYtDq0Wz+ficRhJCO2gGXEH1/pHldPvCvIBsHCb9XjbPc
 R3HV4bNSRYimVl269ec/KwZ90Iy01O6jnRjkH+TVadU8iYh5nG4ZzWFAAat9o7N/RJ9kfjBy0Mj
 aqd3Epr6H8KYWD7HrR1U6+3CEiISg33LKW7H+yASoKzJg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 05 Mar 2026 17:45:49 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C2B32A4079E;
	Thu,  5 Mar 2026 17:45:36 +0100 (CET)
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
Subject: [PATCH v2 1/2] arm64: dts: tqma9352-mba93xx*: Change Ethernet PHY IRQ to IRQ_TYPE_LEVEL_LOW
Date: Thu,  5 Mar 2026 17:45:33 +0100
Message-ID: <20260305164535.2653745-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4fRb4x3bcbz2nG15
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 3cacf677540cba967126d9265231a74c
X-cloud-security: scantime:1.596
DKIM-Signature: a=rsa-sha256;
 bh=qunvVZbr1OHnsRzMMjCCaBPW/FI5Phh9yb4tEKcRPz0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772729148; v=1;
 b=XjAFkSWqloWgrpI200k99c9NruSmxjQexnRAt08+vYL5hvXnhgtfMrCD1ADUWTqY2+HzvYKH
 ryaIJISCYamiz9F2dlOYa5Tr3IxHYKDwejhYId0KLraxv5P4coSDFFybvzM4IDhZ45g4Xdw8PMT
 54H/UKO14y0QWGMnm5raiAdoiMw0M5RmD40MiPHBTJ+eQDRYfBOe4e5DGJF1E9ANo2riUuNM5oT
 tCZa+La6OdLr8TubYkNW+Tp3Hs2jOI60oqK0kQT39kAiyJc6VxOVG2i0JoY8F097eeOcTUPe+NH
 3Q4HaGfhMa8r4Wy1pmexmMM+tCnQcrgs9VSMZGRd5G1nA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_084557_661300_FA24A895 
X-CRM114-Status: GOOD (  12.22  )
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
Changes in v2:
* Adjusted the subject

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


