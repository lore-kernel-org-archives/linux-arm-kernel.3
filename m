Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B63BE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYz6GN2uF4bktyMBn1WEegYkUKLB98RX0JlCoopJ2zo=; b=MdQDmjxX39OcHUCsfw62KclpF9
	Hy/WIkSnHHlJBoMoZGRScRWntu3FcI80nILhV/v51kMZeayovlvXy3EY8dpYpeJQW0jwfLe6jfZ0P
	D9PjbST4D46QFIDVbACI6uSn6TSqIeVq75t9VY+U2Vv2bgBvB1q5eTch4E5RBVoxDz0Zf3/p+YX6w
	zV92BxBU+nXHCfp1IejOYGfjQrdzLTLc4h7KBVqV0v+2qCqHebRiyYlGJdgsHcpAQuYfFmZ3zr4wD
	czhmHbHukiFLxctiTiqlYMvd2en/acQeFaEEeOKx6cn3KDls8vNFgumzvmLPzbEgFxcEfBTZUfIXs
	ysnYQLYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshWq-00000009r1V-3t06;
	Wed, 18 Feb 2026 13:23:44 +0000
Received: from mx-relay18-hz2.antispameurope.com ([83.246.65.160])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshWm-00000009qzo-2ueR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:23:43 +0000
ARC-Authentication-Results: i=1; mx-gate18-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=FYz6GN2uF4bktyMBn1WEegYkUKLB98RX0JlCoopJ2zo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421008;
 b=bCJUxJ3RhuyOeYrVWMTaZZb3ldhd2Yn4HyAVpN7zYkhgbpaQATU7v62x7aKLV/OU98gvuLnk
 LgIpUDyiM2u2GQPTfwSGtL6YEzvrxHtaPh8N68haqDjgiVtYh5HW1Kun81TUU5uC0UGZyxoWtlf
 wT2HjFBxbqHxrsvTZD9cEGNKY6/ZlaVyvvy2NEhcOmVEHzBdFdeV++xOH8/CHI0rcXnuRPEhXiF
 HuSrRFDh82utZ6oZ1vOJ0Q126/b5j7/MFizsWb21wE18oLFPcWWyU+qPvrSvUEpivxuCHgQe/J7
 qfx1JlzX6p0TWHVQu/2Gdf0kZZEzj+74uVTaNRqZXesYA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421008;
 b=g+P8f7HzmJ18YVOpmeGRZhAV1RGH69Iyqy/zz/T0lLG8OBtGivilghWVB6qGlpT5nOp1kEjV
 Tbr6Qfyf4ZfGLVqk2UFb8MMz/cO6Yb9xNxhJu4Udo/GaiVqY5r/V14k9fLNwwgrF+B8tEJqLm88
 sQg5aJWZfD94eNCnsPG23xNyymTgCp4vqnzROFlXX13oTkyiSjGQtU6kkSx8A5/1uHS3xhqZ58z
 LEbkEYe7Y4hbA8c5WTXi4d8p6y7P4QelJ9iby43IV8QHJonC4yfVgYnV91stdzmo94750W20IZ8
 tMav2ltRSFLRv84fu2m8GA5C1v8SlBMLqNJCIuPmpuzNA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay18-hz2.antispameurope.com;
 Wed, 18 Feb 2026 14:23:28 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C9921CC0956;
	Wed, 18 Feb 2026 14:23:11 +0100 (CET)
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
Subject: [PATCH 1/4] ARM: dts: imx6qdl-tqma6: add missing labels
Date: Wed, 18 Feb 2026 14:22:22 +0100
Message-ID: <20260218132228.32056-2-Max.Merchel@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay18-hz2.antispameurope.com with 4fGHJJ4KsQz2lHGg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 2005588d5e16dbcb100f8c3a37af506b
X-cloud-security: scantime:1.984
DKIM-Signature: a=rsa-sha256;
 bh=FYz6GN2uF4bktyMBn1WEegYkUKLB98RX0JlCoopJ2zo=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421007; v=1;
 b=FUz07ry9z/2sPCazbXPsPv/RTFKTG3/GaZ5K7Fok9Z4P0C085rs28heYSyMUhsWMOZNoBmRf
 xI8kzwJktYC+OmWAy/dqEMiwtC7UCaQZRkkhq90KimEac69uU6xyxijAmFJSyzn+gHXvg2Jmjae
 52qP5hS/aMWheL08Tg03iOYrB0IwaE7N02gPmZHlajA4Yi3E5RynqCTjyn5qIeCHtmR5lmHBiyq
 Kk2o+ZMqDFonhoj19G9eE+n25nts50udCRk4rkB0xgFbkyZzIciFqkP8/60Eqw+RbGxkGNOAszt
 sZtaFlI/eYr66ihtehHeltLZAB29b1VYnhXIT3p2cFpZw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052340_876265_97F9AC40 
X-CRM114-Status: GOOD (  13.19  )
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

Add the missing labels for the temperature sensor and the EEPROM.
In SoM variants A and B, the components are connected to different
I2C buses. These labels are needed to reference them in subsequent
device trees.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
index e8fd37dd8835..1251749a8dd0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
@@ -27,13 +27,13 @@ pmic: pmic@8 {
 		reg = <0x08>;
 	};
 
-	temperature-sensor@48 {
+	lm75_48: temperature-sensor@48 {
 		compatible = "national,lm75a";
 		reg = <0x48>;
 		vs-supply = <&sw4_reg>;
 	};
 
-	eeprom@50 {
+	m24c64_50: eeprom@50 {
 		compatible = "st,24c64", "atmel,24c64";
 		reg = <0x50>;
 		pagesize = <32>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
index 0e404c1f62f2..7f526f39e0f2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
@@ -20,13 +20,13 @@ pmic: pmic@8 {
 		reg = <0x08>;
 	};
 
-	temperature-sensor@48 {
+	lm75_48: temperature-sensor@48 {
 		compatible = "national,lm75a";
 		reg = <0x48>;
 		vs-supply = <&sw4_reg>;
 	};
 
-	eeprom@50 {
+	m24c64_50: eeprom@50 {
 		compatible = "st,24c64", "atmel,24c64";
 		reg = <0x50>;
 		pagesize = <32>;
-- 
2.43.0


