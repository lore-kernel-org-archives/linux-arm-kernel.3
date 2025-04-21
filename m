Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1989AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M38xF51b1ggw3drmG6MuoYV6Zybl+JKQwAP6cHLbmCk=; b=3pd6vr2PbAxlxmNw37IlA31v8E
	ZhRzN68Gi4NTVEPCcXzgIB6r4zZE6N7d5DeEXKVVAOHCkiDgqlIP1rEci38efGU4F5H54VuvvHhV4
	KF5wAI+Mp7TfG/5qwuqQos0HHKgPMDH4tlRTs3op+8Q2f42uYjXyfIXx5o0b4CF9oZiYSEuOGO1Qh
	aQLnm+45xEZ9Jvx0nTk/2RXNn6JCmPzdgfLWNr6Bs/zvxiHgGfW4/DML/iMaE83/ajzNTL4jdzWOt
	86ypok5GJ0ZldWVGR7/sUs4Ocs40l5VtlVKfeVn3wicUAiFNwckx+lDmIn0znCCFd8a7eNOA5CFBf
	LtA6GCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6z8D-00000005FtM-3KKa;
	Mon, 21 Apr 2025 21:56:49 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yyB-00000005DOj-12Ax
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 21:46:28 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkNRr1033932
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 16:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745271983;
	bh=M38xF51b1ggw3drmG6MuoYV6Zybl+JKQwAP6cHLbmCk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kG6yoPN+Nc/Zj/MCmq5rlJQ5L/l7818Sz+RuFt9FF6JSEs3s9RMtSeitKAYCGzkhQ
	 TJcvUfsCXl1IcWml/y30yPQ6N221yPmvor5/mrVYiG4V2vuSFrWrgHnJCKhspbSgB9
	 MICwxwU2TFzLWL1eD4McI5+/WOj6F9E9VPmwFJHU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLkNRU130992
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 16:46:23 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 16:46:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 16:46:23 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LLkLqN038764;
	Mon, 21 Apr 2025 16:46:22 -0500
From: Andrew Davis <afd@ti.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 3/3] arm64: dts: ti: am65x: Add missing power-supply for Rocktech-rk101 panel
Date: Mon, 21 Apr 2025 16:46:20 -0500
Message-ID: <20250421214620.3770172-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250421214620.3770172-1-afd@ti.com>
References: <20250421214620.3770172-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_144627_448524_79F959AA 
X-CRM114-Status: GOOD (  11.58  )
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

Add the 5v0 supply that is provided over the display panel cable and
used by the LCD. This is required by "simple panels" or we get the
following warning from DTBS_CHECK:

k3-am654-gp-evm.dtb: display0: 'power-supply' is a required property

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../ti/k3-am654-base-board-rocktech-rk101-panel.dtso | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board-rocktech-rk101-panel.dtso b/arch/arm64/boot/dts/ti/k3-am654-base-board-rocktech-rk101-panel.dtso
index 364c57b3b3a06..7a3953d64fd84 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board-rocktech-rk101-panel.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board-rocktech-rk101-panel.dtso
@@ -15,8 +15,20 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 
 &{/} {
+	vcc_5v0: lcd-regulator {
+		/* Output of LM5140 */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&evm_12v0>;
+	};
+
 	display0 {
 		compatible = "rocktech,rk101ii01d-ct";
+		power-supply = <&vcc_5v0>;
 		backlight = <&lcd_bl>;
 		enable-gpios = <&pca9555 8 GPIO_ACTIVE_HIGH>;
 		port {
-- 
2.39.2


