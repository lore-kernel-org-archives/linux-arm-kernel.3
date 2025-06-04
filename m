Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F040C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 10:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URUAuGhJ6oVpvppDA506Q+cOUcLV4A0Cy2nR7TJqxBA=; b=1F0EAL7R/QtQzO+k4+oV8bmEV3
	6TMI5/c+ZPTDUETAW/3ooi6jZmeiowCDn7SADTsrtYExo3z+Zf827qnHeoreCAV1eACibdeChaAGQ
	UtbUx/ZL5WbjGXuLVAYcvFl/XjTq4RuDsNIgoOG/Y1VhPWO5fjUEI5c4CxGCGr8JcNQhE8szmHeVv
	7SLUqVwZQQ/+zD6W0tPiYBAHd3CgGTMiVyohoHbritFXjTWdPSR9YEFaC7sU25lbseOaSG3Gjpv8/
	F8u2QqMQgC0gtcO/GrjHv+8yOWEOUHCQieru3ICn7nv+kp5NHfljP2kealD4yUROCBv9L1bFJIOd4
	20H5irXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlgJ-0000000D9k0-1hnm;
	Wed, 04 Jun 2025 10:49:15 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMleE-0000000D9Qu-21Gr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 10:47:07 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 554Al12Q3789918;
	Wed, 4 Jun 2025 05:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749034021;
	bh=URUAuGhJ6oVpvppDA506Q+cOUcLV4A0Cy2nR7TJqxBA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hIkqJzEKREQcoCXDqFEQCNQ/nmNIeRUyJSWlOTg/9qKw+4smOxu/evYrSiuzmBtCz
	 G7CouK0O7ebdwhwdghsB49tYbz7w8QCqu+XQo+Pr7Ek/ANPwQYYwdFy4KEoYIl08mH
	 IiqwTSy5T95qR1snHUb83a8N96wWUcFz1PlJD5Fg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 554Al1PE1977638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 05:47:01 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 05:47:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 05:47:00 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 554Al0OL1830865;
	Wed, 4 Jun 2025 05:47:00 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <r-donadkar@ti.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH 2/3] arm64: dts: ti: k3-j721s2-main: Add audio_refclk node
Date: Wed, 4 Jun 2025 16:16:55 +0530
Message-ID: <20250604104656.38752-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604104656.38752-1-j-choudhary@ti.com>
References: <20250604104656.38752-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_034706_563084_97D6C8A9 
X-CRM114-Status: GOOD (  10.32  )
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

On J721S2 SoC, the AUDIO_REFCLK1 can be used as input to external
peripherals when configured through CTRL_MMR.
Add audio_refclk1 node which would be used as system clock for
audio codec PCM3168A.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 6dee0c573980..e21f6092b3f0 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -74,6 +74,15 @@ ehrpwm_tbclk: clock-controller@140 {
 			reg = <0x140 0x18>;
 			#clock-cells = <1>;
 		};
+
+		audio_refclk1: clock-controller@42e4 {
+			compatible = "ti,am62-audio-refclk";
+			reg = <0x42e4 0x4>;
+			clocks = <&k3_clks 157 299>;
+			assigned-clocks = <&k3_clks 157 299>;
+			assigned-clock-parents = <&k3_clks 157 328>;
+			#clock-cells = <0>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
-- 
2.34.1


