Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8A0C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 20:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EfnyUTyHOPwX0oCaugRjIcWURC49enBtnNuv/zy5lM=; b=aKMdFi60+6S2DQy9hvpvqNrYo2
	oc56Dm+v9PoKuuuXZLnfoMpwbVQDeHiFQ1Ctt4Jxu88xhbw17s2iPro2UrDsxK7NhILUj+Nq7Rx8D
	UH4ZwyfNxKpZHgpfxVyvlbZLer4feh86gp51CjIiWTCU6GTGuIj36w4O9IvO/YqGPfcD7b0PWzZgK
	qthNfPo7B2S5/ETkUkQQa7VjL4glafZIt0b1WF6r6wZTzZbgxQZFvdeuiC7DPopoQtyd5a5n3CSnN
	35FARwkizbNkvseKuLLAQUF2EcowsaeVyts2YqDbiU6IHr8i9JC3VFFKv7s2EjEo1JCz2CXT7iteh
	MqW7H3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrOF-000000005FP-3pYT;
	Tue, 29 Jul 2025 20:57:39 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrJN-000000004so-0ZEJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 20:52:39 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 2EBCDC0000DE;
	Tue, 29 Jul 2025 13:52:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 2EBCDC0000DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1753822354;
	bh=zBLNmvKbrgqGs0Ax1UJG+EsEMkfc9OigzsQ9bQodKqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ezKidRNIXtoGCcD6clzhbrvdA/DJLghN+Expet6wd+5G3jO0PR0Ivj7vnJevuDqFo
	 WuWIilnQBZN+ZRJRmcDjB49cxkbh+GnPmeFBByCGmvcX8UMbyZiHuQkySFxzNay3lZ
	 VwXHpQqS38HuclrMNGiWPYFalG8k47LH3U6+9SL8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 10C05180004FC;
	Tue, 29 Jul 2025 13:52:34 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 2/2] MIPS: BMIPS: Properly define memory controller compatible
Date: Tue, 29 Jul 2025 13:52:13 -0700
Message-ID: <20250729205213.3392481-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
References: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_135237_220385_A39EB894 
X-CRM114-Status: GOOD (  11.20  )
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

With the DT binding updated with 501be7cecec9 ("dt-bindings:
memory-controller: Define fallback compatible") we need to define a
proper compatible string for the memory controller node(s).

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/mips/boot/dts/brcm/bcm7346.dtsi | 3 ++-
 arch/mips/boot/dts/brcm/bcm7360.dtsi | 3 ++-
 arch/mips/boot/dts/brcm/bcm7362.dtsi | 3 ++-
 arch/mips/boot/dts/brcm/bcm7425.dtsi | 6 ++++--
 arch/mips/boot/dts/brcm/bcm7435.dtsi | 6 ++++--
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm7346.dtsi b/arch/mips/boot/dts/brcm/bcm7346.dtsi
index 2afa0dada575..9d6f97e02ff9 100644
--- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
@@ -531,7 +531,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
index a57cacea91cf..a7f60f059e50 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -450,7 +450,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
diff --git a/arch/mips/boot/dts/brcm/bcm7362.dtsi b/arch/mips/boot/dts/brcm/bcm7362.dtsi
index 728b9e9f84b8..2d483cbf254f 100644
--- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
@@ -446,7 +446,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 62588c53d356..c3bb020ff2b5 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -542,7 +542,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
@@ -569,7 +570,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
index cfdf9804e126..60cfa4074cce 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -558,7 +558,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
@@ -585,7 +586,8 @@ memc-arb@1000 {
 			};
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-a.0.0",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x300>;
 			};
 
-- 
2.43.0


