Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A92DD5E15A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51S2zN2wdAlNO7CZ6tg4ggDgdRZ66PTczsqK+t6gA2c=; b=SYWxS4BZ/A41gzvAqNDyubSucG
	tNB6GuAyKOccO6qRwA5A6qZpl9oSfYA8BXsL2Z2QU83qEAc4ltnCj5blFLTd57iIvIC+ePQn4SgAL
	K6uuF/rTPXyRWwWx/vulSezPrSRKbTecq+I3EmZYl73/0wwpAvdWJbXOdNWOXTXrDhlD0vu9GlhSG
	POpLzqkZKwdpWhKtiDKvWOFZRMFQQj/EVbcAp7WRa0ShOkag/Ove9eUFB4GcnvRZ+vUg+HAcHOMwo
	V/LwxU3pUHHOGB8h7SDkd1phFa3bNJZlB4uGGg8p6BiueDtQmTyq9SICRW6/ZEs3cM3JWlL61cgON
	tUPk4gbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVHl-00000005Hb5-2JHT;
	Tue, 16 Dec 2025 13:40:17 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVHh-00000005HaY-1eGk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:40:16 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=51S2zN2wdAlNO7CZ6tg4ggDgdRZ66PTczsqK+t6gA2c=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765892400;
 b=sxRev6XdgTNg90U8/YYEze5/BfYM+OyOKIY7T1meMxzcP44E+SdX8JoMo/5y5mKf1bE4mDcV
 Q0OTsSQOLfJaIzuH918wESV6ubSKSplWiRpQ0Rp0kflNwjfkv33cRCG+bM1ul8eubHg/e+OnHnp
 0ZG/3BO3tU7+3ymO/KT1DhrhXlSpcdtQVJAVuvHnT29alnQO0pEB2CUQH/ElesEVQkbMNAUHMpN
 N+mtmZZMOj071R80bG9gg/09FWzH6BMfUKfNvuFo8yO+uXra5LTg3GLwsjpaNTT9fWU0hIo3TcH
 AM6jLrOZbsn6ElBFRCtSbxvF2gzTHXybm1vGx60SvZUPQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765892400;
 b=fyxQyJOp9bqlgRxlSGDvIlFfaBIZVVA6kHQUF4zUC/ornHpnBwMKcbX2Jxc9fPgx0+ftjtt3
 6iFUUOkaFQ+XjAP8dkcU/wAhEG2vN4EAbZU4134bvO/GHQnJkEMFYA4Q0lmW2na7ePHnnSImANZ
 xnOwDV1vtiQqxEzwLnDT6UXJrNoFv5beWnuxmAWHPE/cAp7+S72yJJik1fYBLk+3ATegV61pndH
 APUMdwjJRBmZFMRp5Et//V9W7GleT+u+4LanwcpNoDa9i4/f7gXLQ+iTLkuZTwuBBfEnz0DcjNn
 VSKtrCyeKsrN9meIYomcv3jAEFiusRIQ7YV66Jt2qMd2A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Tue, 16 Dec 2025 14:40:00 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4F68E5A164D;
	Tue, 16 Dec 2025 14:39:45 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/3] arm64: dts: imx8mn-tqma8mqnl: remove virtual 1.8V regulator
Date: Tue, 16 Dec 2025 14:39:24 +0100
Message-ID: <20251216133927.913039-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133927.913039-1-alexander.stein@ew.tq-group.com>
References: <20251216133927.913039-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4dVyhy0pfhz4MZNx
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: f1f82f19600168d6731e536ebde1b7be
X-cloud-security: scantime:2.336
DKIM-Signature: a=rsa-sha256;
 bh=51S2zN2wdAlNO7CZ6tg4ggDgdRZ66PTczsqK+t6gA2c=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765892400; v=1;
 b=Ju6dYmYchHQKVW29yDR8uYX8mmFJFphI3J1ADI852R4lCSSIU0T7tYmjj7DbU8JXBGyMKNTo
 FAmQq2dLik5LEq6N4YMDxSr0NyoD19hjrVGm0dNZLJbrmAZOLwa9H5dCns3kvks3JWbpr0Kyykz
 i+2uDHLcQpqxRx/M2ROb8DbrLUgMEz5tsh9SosCojVrNxoiav1U7APtBpFg0aNkTsDa6wS7MvkJ
 ROskyUH9zsnC3HiqdliAgrWuFYblWZ9IQTTphZQwY2FCI+3wO1zuxH51B8f4OYDdeS7zPx95Tzo
 2HetWo7bd9yHEki64048iQkFRGgCYNKaR3ZuWYgbQrIhA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_054013_574635_7BD2E7A0 
X-CRM114-Status: GOOD (  11.79  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

BUCK5 regulator supplies the 1.8V rail. Use the actual regulator
instead of a virtual fixed regulator.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index 34d6415348f8c..ac6ce5d814c50 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -15,14 +15,6 @@ memory@40000000 {
 		reg = <0x00000000 0x40000000 0 0x40000000>;
 	};
 
-	/* e-MMC IO, needed for HS modes */
-	reg_vcc1v8: regulator-vcc1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "TQMA8MXNL_VCC1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -236,7 +228,7 @@ &usdhc3 {
 	no-sd;
 	no-sdio;
 	vmmc-supply = <&buck4_reg>;
-	vqmmc-supply = <&reg_vcc1v8>;
+	vqmmc-supply = <&buck5_reg>;
 	status = "okay";
 };
 
-- 
2.43.0


