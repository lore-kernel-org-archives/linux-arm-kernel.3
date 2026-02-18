Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13CCE9A049
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmH2gnYHLoGT+gPFoqYfzgcg3mVohz7j0M5EpQAudWE=; b=AgwwZ8jY6Zh/gFzME6Lg32wgI3
	YFlkBOiLd3G7wtAj5og7TExEDQayPBCgIUC/wihZX9wMub9xMIyKDGWc9ftC4tKeWah6WOu12HsHx
	22cEyMSVWqendwRdeWFfjA7dueyY8qr6tKXlzBwmOHIgl4g6SetAwBkbtH4mBJfBGyluSEpjo7DEI
	x4AgnxQLooPHn1WJimmhE4suNzUq33G32BROVxP0Y8onRZxNASYq4NEPGzpRMMyDxgx4kI+pF+Evd
	UhjzPhvX95lpaYNuRUvUafV+6E3iHKhhhOkIZTO76RMqHnnkVSFA9G0pSgKxVDQ5DqZzt3DGkdOn/
	JrQCwklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsi15-00000009uyt-3uSj;
	Wed, 18 Feb 2026 13:54:59 +0000
Received: from mx-relay107-hz1.antispameurope.com ([94.100.132.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsi11-00000009ux2-1sGR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:54:58 +0000
ARC-Authentication-Results: i=1; mx-gate107-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=HmH2gnYHLoGT+gPFoqYfzgcg3mVohz7j0M5EpQAudWE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771422885;
 b=iTdwsnEYiRxtmzNAKjliBK4laWU2vfegRfAeR4e/qmrgqlKMK6pqQNx2v1sytPAQLg0iYvu9
 ljrWHHtuARiegnFqtTbhMClJjzunXCoDlAz0fNisX7WPJd9E34x/Umry2XGWzfZVrdb5r9WRuk5
 ke5hnx8AWQiNGtbSfRiy2UsthtU3JkOI4Wx85xZAL8UQk71gSVDbSvrCndWlxV+dMG0zRPPK/yT
 /u3Y332t2qxs1V8ZGR/CyGQUfy46qDrNwlgTcEU7P5OZGq4QxcPRLYVdOis+C7T4PFKfYnzou0u
 A6RL6J5I/KkOl9RWdhGkFkSDqZGy8oB/IslWKMiWkIFDw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771422885;
 b=mhqYFvENJSMgT5q0i9N8ozzL0eq6tGywfiTuK9lQqT9uE+4GSlTe2qSWTLjg6M1wHdMsq9n2
 AnS/FTCuxA0K1Lv1Gos7pGkEtkC0FhYpPgnYFI/AgQUh6yAGCw4FOfin1NaVm/QGrUCILK0vLN+
 MjgA8ONGpaDht1LYo6EcEsOTfPQFcNmvPLHYwJJsmus8ybyWG34kA1u2rfZ47w5j0e3o/lR88A7
 fHDPReRJl0vVk4d5vip/b94PpaiOnaChTQFlTV8Or7jEGyJWNss8sTPjUze/4RltNmVL/QhUedw
 vOR/TQEkPlNzPIHgSq/jvShi+kvME6k2dGYHTW0Wp430w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay107-hz1.antispameurope.com;
 Wed, 18 Feb 2026 14:54:45 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id EB07C2205DE;
	Wed, 18 Feb 2026 14:54:26 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux@ew.tq-group.com,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: imx7s: add boot phase properties
Date: Wed, 18 Feb 2026 14:54:12 +0100
Message-ID: <20260218135415.204974-2-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
References: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.feilke@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay107-hz1.antispameurope.com with 4fGJ0M4wR1ztZxp
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 005226ad2035b8035f0646bf4904b0c7
X-cloud-security: scantime:1.935
DKIM-Signature: a=rsa-sha256;
 bh=HmH2gnYHLoGT+gPFoqYfzgcg3mVohz7j0M5EpQAudWE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771422884; v=1;
 b=GM245wPWLHAxtr4Jn+Vbx+RoEU5BD/AsxkL72Quk9AQyh5KlCakQ4hijZPfC98GPmP/xDzrt
 YBThXt+T562NyWJSjBdu+PpGJV2kAFY5d4sCX7razC/BFovb07g0F4Zy9iFVCoztY1SKVyg5IP5
 KG3HfnfTymKKW8j1JDMopYaHK/WMtQ1Y++1kjl6frxMHvGKs7URmKg7FTn/CmzGoa7Lq9E3Uxl7
 Ys/ptyYPyyl19RcpK7JaVf2P2SFcbR5TCgT/Fa3u5V/umC6r6fC1yWGV664adMZZNCc2oyZaAzI
 P+RSdU54kjMIOuTH2qujglD25nteAnjSvr5nSADTvNPZw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_055456_342283_065C2C5F 
X-CRM114-Status: GOOD (  10.82  )
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

Adds boot phase properties to essential resources in imx7s device trees.

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


