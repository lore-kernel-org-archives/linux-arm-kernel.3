Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FF4C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 11:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Bw1E7VebGu/07f+zwSP8xjgvwa8wtrXVpYgFq69OsM=; b=ndxIitXxx5XtFRtsTvKhMkRK/+
	N6UDYqQEJBh8CQqWeBGibTLtIt+BHwS2MNgq3UdzGA9nR99XPFwvBKcg4jPbSrCzbqut4x9gUT/QU
	M59iZNPIZbStiupCmzNy6cOxuEchMeexEpuAFqIAzf0M6UqLUJ3zvHssIWIE+dBErk4iuyTRrMMRS
	07aFBwMasY/8diKRnfowk1MW3G7Jg5VQzfqui7c6aOFXqCiLc+YFy974sWXSOf8yvFZMP+MpzM1TL
	4Nn5CIrLcb3znion2TMZY54K+42jnBnfG8IUf3yZmtZMMfiC52AiJxxOtA2UMJ3CdcXJLnDaBPxnd
	dxjblj7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ6sh-00000002G0Q-1Dw7;
	Sat, 18 Jan 2025 11:20:47 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ6ma-00000002FLW-2nFh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 11:14:30 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YZvBH4YDJz9sqc;
	Sat, 18 Jan 2025 12:14:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Bw1E7VebGu/07f+zwSP8xjgvwa8wtrXVpYgFq69OsM=;
	b=kj2DNjCPmRH532qvXtgxawm9kOFDrURMVk5LQrJiPJORbWgXAO9csNtXtcEc8mBmDe/yiV
	nH6gKmRyYNdidyKAB+ohrzHjaHOl96jHfKlOTDmq8+sIam68VUwttQpUNcv8e2VrPZsUl+
	mgDGQlAHJ+JGhw0bCeeMkRlSnD5scTkJLk9LtcDXEHOqQa6lM7l6SF9Gluxqc0Cnx1o/7z
	OmC5KYnPUu2CNj+L1Io118EEkyEmzc7q+TmkZLsG0r+af4VS9XIOkfNRxjMM4nCZu/2nVi
	vY2/uDPOw+HGinh9G4ALyMc90HPYyEt33/Sl6X2dCwGyqxPA7nJuSZjTAkUvHA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Bw1E7VebGu/07f+zwSP8xjgvwa8wtrXVpYgFq69OsM=;
	b=T3Pc+1dKX14T1/bfGwE6O9BliCPmJPyEv1HfcKagzMXDxOWkOKLesdTA9vcStmOdA3wLFZ
	vdsQ0SwvoxF4DG1Js46SiFGrroZKLhKObgMvr+D37XXsDA0YXi6goZkL4GTtLvyhtJheJr
	hJU9MfEioGfQcNd3VCpcEmR7ov9jZ2O1H2/E4AXIDsrJhLdpjYL06EFxNE1/Vm9IyXQS6W
	KlrZdiIs2qC/dcwOE2QRZLUB4gsRY/yVESJDJ638mn5HL8iTN+S0TTRy8lQ170KWmi1egD
	1pdCM8vUmfjT4rQOngHuOw6c5cyD6P99mEU4Sh8Q3XiNR695+ihit3q2K9hNXQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: renesas: s4sk: Access rswitch ports via phandles
Date: Sat, 18 Jan 2025 12:13:10 +0100
Message-ID: <20250118111344.361617-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: s78poq3c4knqny85yzo4whxmqj1pz3y7
X-MBO-RS-ID: 9aa30760ce97dac0b11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_031428_880877_9FD3AF6D 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

The r8a779f0.dtsi now contains labels for each rswitch port in
the form 'rswitchportN'. Use those to access rswitch ports and
slightly reduce the depth of this board DT. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts | 67 +++++++++----------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
index 5d71d52f9c654..4bf526535ee05 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
@@ -179,53 +179,48 @@ &rswitch {
 	pinctrl-0 = <&tsn0_pins>, <&tsn1_pins>;
 	pinctrl-names = "default";
 	status = "okay";
+};
+
+&rswitchport0 {
+	reg = <0>;
+	phy-handle = <&ic99>;
+	phy-mode = "sgmii";
+	phys = <&eth_serdes 0>;
 
-	ethernet-ports {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		port@0 {
-			reg = <0>;
-			phy-handle = <&ic99>;
-			phy-mode = "sgmii";
-			phys = <&eth_serdes 0>;
-
-			mdio {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				ic99: ethernet-phy@1 {
-					reg = <1>;
-					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupts-extended = <&gpio3 10 IRQ_TYPE_LEVEL_LOW>;
-				};
-			};
-		};
-
-		port@1 {
+		ic99: ethernet-phy@1 {
 			reg = <1>;
-			phy-handle = <&ic102>;
-			phy-mode = "sgmii";
-			phys = <&eth_serdes 1>;
-
-			mdio {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				ic102: ethernet-phy@2 {
-					reg = <2>;
-					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupts-extended = <&gpio3 11 IRQ_TYPE_LEVEL_LOW>;
-				};
-			};
+			compatible = "ethernet-phy-ieee802.3-c45";
+			interrupts-extended = <&gpio3 10 IRQ_TYPE_LEVEL_LOW>;
 		};
+	};
+};
 
-		port@2 {
-			status = "disabled";
+&rswitchport1 {
+	reg = <1>;
+	phy-handle = <&ic102>;
+	phy-mode = "sgmii";
+	phys = <&eth_serdes 1>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ic102: ethernet-phy@2 {
+			reg = <2>;
+			compatible = "ethernet-phy-ieee802.3-c45";
+			interrupts-extended = <&gpio3 11 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
 
+&rswitchport2 {
+	status = "disabled";
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.45.2


