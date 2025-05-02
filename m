Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C8BC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 22:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gK5SBmFXYmjjjM/9hVZDcynarsrWxGejP5zW8zlLHDM=; b=r4IygmR84vUjcga6d6aJaJE1/n
	vElhzMXp7HwKk3fFz6gthODnKUBu5IVuXml26X6FiFgPpYym1UNZ7m4TxEXXoPpkkUlUO8SUP4qeg
	L/w6pE86ioamRD7gT8Wl4pcyLuhYiZTyAaFVZ82TC7UxXRB+coesOdOk/RREUirnVUnzuDINjZ/HY
	ByVI+2UvHCUDqYUMDPZ9+Jp40ziLvjL5OnNcvYjVOa+RH0plFuFCKmBB6Y4JramfJ4CDrkDHcWDmo
	yG2Y4CVPA0SSsE5I+FDGw2D1nysMeXQpYywQgRBzh/Q7hBHLhmK4Liw45iXehVu3ySodBkhP26VO2
	ElD0eJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAybT-000000038st-1v8U;
	Fri, 02 May 2025 22:11:31 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAyTi-000000037i2-3B7q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 22:03:37 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542M3QXo3955077
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 17:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746223406;
	bh=gK5SBmFXYmjjjM/9hVZDcynarsrWxGejP5zW8zlLHDM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=batBU6xojxFRc+LWPt/mwXOI5hF8jvVf9toOlMDaFILBseBxcDjxY7mO1snstqzX0
	 wfXldenjzuMgVyPTyDGLGL/At8I5vVFLJg5t9w1tdwrK8Z8+GnU9bXLjxTZW8rBHSR
	 yqjVtj2BfhBNmtQPmEMVkVvonkq96fQ2yB2gKm0c=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542M3QJX016231
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 17:03:26 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 17:03:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 17:03:25 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542M3PBx006849;
	Fri, 2 May 2025 17:03:25 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hari
 Nagalla <hnagalla@ti.com>,
        Beleswar Padhi <b-padhi@ti.com>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>,
        Andrew Davis <afd@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 05/11] arm64: dts: ti: k3-am62a-main: Add C7xv device node
Date: Fri, 2 May 2025 17:03:19 -0500
Message-ID: <20250502220325.3230653-6-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502220325.3230653-1-jm@ti.com>
References: <20250502220325.3230653-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_150330_883080_331A1625 
X-CRM114-Status: UNSURE (   9.28  )
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

From: Jai Luthra <j-luthra@ti.com>

AM62A SoCs have a C7xv DSP subsystem with Analytics engine capability.
This subsystem is intended for deep learning purposes. Define the
device node for C7xv DSP.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
Acked-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index a1daba7b1fad..d296e9e17973 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -1123,6 +1123,18 @@ vpu: video-codec@30210000 {
 		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
 	};
 
+	c7x_0: dsp@7e000000 {
+		compatible = "ti,am62a-c7xv-dsp";
+		reg = <0x00 0x7e000000 0x00 0x00100000>;
+		reg-names = "l2sram";
+		resets = <&k3_reset 208 1>;
+		firmware-name = "am62a-c71_0-fw";
+		ti,sci = <&dmsc>;
+		ti,sci-dev-id = <208>;
+		ti,sci-proc-ids = <0x04 0xff>;
+		status = "disabled";
+	};
+
 	e5010: jpeg-encoder@fd20000 {
 		compatible = "ti,am62a-jpeg-enc", "img,e5010-jpeg-enc";
 		reg = <0x00 0xfd20000 0x00 0x100>,
-- 
2.49.0


