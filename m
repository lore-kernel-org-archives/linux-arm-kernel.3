Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5CD1098797
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QTVwOEUerBsEtCmkROIyNiU95eGlIoC88ZqLDgmUCdE=; b=ra7OIcV7qsibE+k57r411ptOIG
	i1hChOs1xZLNvMSGopY9NdH6RXXm0YR6PA20zMeEfUlyAB/KKWyDRkiu7HBjTg1HoKLnZ5yDzKcEV
	CCY1xhS6bMRzqDvpw+NxicffCmTwUUg90zz2OW+4J3vLWCr+dF95Lu5AgBU/dEZMOw6/fXO4Ulry9
	tK4Nbq7U3H40rwFzzNRSdpj/ycWsKQnOrpYLLmcSzLOvDLi9fb3K6dzDqA4yg6UX0HClRIw2N6Ujn
	lNDrKfpgd+a1CoyuP8CUqw0u3SnJYnLamUmdncwMobtfxXYKu04bv+cyGcHkQ2u4apop+geL0g14j
	+y4aACxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3c58-0000000D3y5-3gW3;
	Fri, 20 Mar 2026 15:48:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3c56-0000000D3wq-2F62;
	Fri, 20 Mar 2026 15:48:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F181D60126;
	Fri, 20 Mar 2026 15:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84203C19425;
	Fri, 20 Mar 2026 15:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774021691;
	bh=1dMrnbqTyaC4XO48y4vySF7TIQ9/H32UyjQYzElZkY4=;
	h=From:To:Cc:Subject:Date:From;
	b=hdAJWL0x6j7CsyfY51ESBXaZVWB5gbNICLFeVg6TuRDz2xsEdXkBOjxnUGD/YX2pj
	 RflPHdrKaeL2PsJ1cliWTQLbOKU6QDbXCVajxsu0JxMwHZvn7kFjOFHTu/3grlmmfZ
	 wWqY6m+t1Fn0D0DwX/67PHtlveEXKCICkBTal+K9Zj2nujMJU+hmUH2b6zlMjPnZ9t
	 6sKlc3HCgVRa/CCSPaI7jkLem33SShfZdlZS3K12cDMIA0G4vTNdHMwZpalC65YWW5
	 Mzuc+7LwSMcDaxHNtV03MBaF5MZ/Ytxvp1uEm43hx8xpxsdeTsVuCbCNjUR3Bja9/d
	 eB5IIbrusX5Hg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ARM: dts: broadcom: bcm2835-rpi: Move non simple-bus nodes to root level
Date: Fri, 20 Mar 2026 10:48:06 -0500
Message-ID: <20260320154809.1246064-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The 'gpu' and 'firmware' nodes are not MMIO devices, so they should not be
under a 'simple-bus'. Additionally, the "raspberrypi,bcm2835-power" node
is part of the firmware, so move it under the 'rpi-firmware' node.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Florian, you have the fixes for the prior versions in your tree, but not
the original commits they say they fix. These apply without the fixes.

v2:
 - Rebase on v7.0-rc1
 - Move "raspberrypi,bcm2835-firmware" to a child node under /firmware
---
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi |  7 ++++---
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi    | 16 +++++++++-------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 9261b67dbee1..1e76b290510d 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -141,9 +141,10 @@ v3d: v3d@7ec00000 {
 			interrupts = <1 10>;
 		};
 
-		vc4: gpu {
-			compatible = "brcm,bcm2835-vc4";
-		};
+	};
+
+	vc4: gpu {
+		compatible = "brcm,bcm2835-vc4";
 	};
 };
 
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
index e9bf41b9f5c1..46c91468f4c5 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
@@ -1,8 +1,8 @@
 #include <dt-bindings/power/raspberrypi-power.h>
 
 / {
-	soc {
-		firmware: firmware {
+	firmware {
+		firmware: rpi-firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 			mboxes = <&mailbox>;
 
@@ -10,14 +10,16 @@ firmware_clocks: clocks {
 				compatible = "raspberrypi,firmware-clocks";
 				#clock-cells = <1>;
 			};
-		};
 
-		power: power {
-			compatible = "raspberrypi,bcm2835-power";
-			firmware = <&firmware>;
-			#power-domain-cells = <1>;
+			power: power {
+				compatible = "raspberrypi,bcm2835-power";
+				firmware = <&firmware>;
+				#power-domain-cells = <1>;
+			};
 		};
+	};
 
+	soc {
 		vchiq: mailbox@7e00b840 {
 			compatible = "brcm,bcm2835-vchiq";
 			reg = <0x7e00b840 0x3c>;
-- 
2.51.0


