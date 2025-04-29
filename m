Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBEDC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHCThw0LF6KNlE7S568u0/4/9IKYYvNeEEoEyY6s4RY=; b=b6QFQ9BkBHdutyaIA6lyVlzYrt
	sqiAouhoGEhUYuM58DG81Q5I1E8oIBLC7j5fRXTFt4bgl9Qc1Mo5bb8VDPEltIX15gMrjkDk4wRdO
	fg2If72/emtNE8ynucHJ2FKMiJPe9+AKKODr+TdD/HJiUzxSkzwagKr81L9zg0cM2NecRGaHmA4LP
	RPYm31cr2ybKb+zwdsu5hykoHrAMYHCwhgNSaDuYA2d6EYFf2R+yVurOrAf4lYDkTRe0jAAxN/SSm
	EHOev/yoM+RWArKyCYT0icH2dM+djcuEZ20syPmgFD3VVE26hnZhLGyG8jIUan6QoxFaaKOWCb4oZ
	nZk+VyuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nT0-0000000ACkD-30bD;
	Tue, 29 Apr 2025 16:05:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9n5z-0000000A9wx-1ssK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 15:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EHCThw0LF6KNlE7S568u0/4/9IKYYvNeEEoEyY6s4RY=; b=hvv9pJRvjKWiv3VG3ttROuzdvQ
	HW1IzuylYW1jHnThI7z+75ZsdUMLuYRJCz4NrsSw+GKS154ltnJg6BLtl+F34h6hhK/8PT//7LqDd
	Xia2o2dxhVOQ7ukw0GRdUYlGFFYnJ/QUr0OW3R/HcsqzosGETAQh6HNwQwK5BgHWvOMeFMINs/Uvg
	dOUbn/PQHJCmlGtlUXnq3g3+0EMYaA+6bpMBnjDUKuEL+LfX5e9AKpCH01YZZeksSjLFriSmyzZV5
	UQE/Yy+ooeJKqz45xTRnpn1JiCAD1bu0ea2y7DiesiX5sAuKCFocRb0jM/oP5w/DzK9El2o01hKqJ
	y4xZuGbA==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9n5w-0000000DS8U-0Ze0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:42:06 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFfiFf3710390
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 10:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745941304;
	bh=EHCThw0LF6KNlE7S568u0/4/9IKYYvNeEEoEyY6s4RY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jt+B/pFbFfV/BNblEkbkkgiJGOlI/7rsPxQWaFklper395B9p73Du4MAp6j1DSmvV
	 xH4CNYKJZW8YNJ6jxwh6DliyupXSwjWy/MP1XubvyL8diKwjUOvH0dWIsKK2VrjB5N
	 lUoE3xOdQ9F7NqpbL+IcilVHRO1yYmPiOhJ8vLt4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFfipR017660
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 10:41:44 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 10:41:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 10:41:44 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TFfXVq030051;
	Tue, 29 Apr 2025 10:41:39 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <r-donadkar@ti.com>
Subject: [PATCH v1 1/4] arm64: dts: ti: k3-am62p5-sk: Add regulator nodes for AM62P
Date: Tue, 29 Apr 2025 21:11:30 +0530
Message-ID: <20250429154133.3377962-2-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429154133.3377962-1-r-donadkar@ti.com>
References: <20250429154133.3377962-1-r-donadkar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_164204_512441_BEB60AAC 
X-CRM114-Status: GOOD (  10.86  )
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

Add regulator node for AM62P-SK

VCC_3V3_MAIN is the output of LM5141-Q1, and it serves as an input to
TPS22965DSGT which produces VCC_3V3_SYS [1]

VCC_3V3_SYS servers as vin-supply for peripherals like CSI [1].

Link: https://www.ti.com/lit/zip/sprr487 [1]
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index c2f55cc5a8ebc..0af33fccb96bf 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -115,6 +115,28 @@ vddshv_sdio: regulator-3 {
 		bootph-all;
 	};
 
+	vcc_3v3_main: regulator-4 {
+		/* output of LM5141-Q1 */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_main";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vmain_pd>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_3v3_sys: regulator-5 {
+		/* output of TPS222965DSGT */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_sys";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_main>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
-- 
2.34.1


