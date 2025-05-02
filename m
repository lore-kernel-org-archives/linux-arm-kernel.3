Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8CAC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16Jtfa8zqRduD5bzBqBFlLax/AqYDVwaMHqP+NoVmxM=; b=Fj3Y8hNJB8VdlCOECPkrVzve/+
	J9RFeV1xBABDFhXC3QO8FbFhIN8KuP94/Y3Zt5YLPhASbmQ+x8mOodlwWTHkjccMnLDvXwBCFwS/3
	LSZmbJ/AVHfa0RofvgagL5M1Bypge9W9BI5t/EBg9LAs0MSSwWnwRP/YVF6/lo/aanooTwI5K78FW
	j7Q37ngvtXlFyBxN3wLID49ZWxKY741i50H8xUwju4hreBUlkZ8tQXPiydVYFCy/8serICHOySK3B
	m6oJ8E5zRLb9L3DRRmJ3dHI4uVAbm6vP/Ns4e3GIozQJLZtv2iL+MaYxnVUDsT0x/4PmhCdP8P7q2
	TQaPSzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6G-00000002dnX-3Ir0;
	Fri, 02 May 2025 17:23:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtDL-00000002VNZ-0mGu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 May 2025 16:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=16Jtfa8zqRduD5bzBqBFlLax/AqYDVwaMHqP+NoVmxM=; b=YvlkeMCkiV2AA350L5MXtHGnia
	5UE2/a/mAscAuYIIlgHANUXBsbNNhsadgUdmdMI2qfO1vzmuYSruubD246u3+6nQtr8OrTWtkY76z
	FBanSuMU7psD7LzhSURoW/bXIf8TZSKQnOKhOrQsRtGPI+vRklJf9Zd3RaiVqq2dnT2C4VeGsIsVy
	Sl6mgqiKwSr3mXQA1NxzptUT7bwG+RBgHQweNPB5bYzGOINIhA1f1yukeIF94vMfPLJIX48ag2Gkl
	tKXPwi2mrZB3p7rJTAXg4ARxXgC9QTuOLer8+KlpCl/nkeEKkltJqdmjT9+t4gCYAxpaw+ZHXs4+q
	q5DkrSNg==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAtDF-0000000F3u8-1aRX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:26:12 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542GPpc3448858
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746203151;
	bh=16Jtfa8zqRduD5bzBqBFlLax/AqYDVwaMHqP+NoVmxM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ekP8Ur6009k0t27DhpEprqwLOZOH4maSjgxyg+8tHFWGLaAa9cBBwdmaz3OqR9YHr
	 5QyraGEHgtwlU0vdZ8X6NJEpgO7NNYtF5js0rR6xm8C16lTRK5VQ91nnx61+HhTvLU
	 QilQlFDO+K47ho6Ts6YPobg2w6Vieddrs1aAdfTw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542GPpxR067523
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 11:25:51 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 11:25:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 11:25:50 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542GPex7028994;
	Fri, 2 May 2025 11:25:46 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <r-donadkar@ti.com>
Subject: [PATCH v2 1/4] arm64: dts: ti: k3-am62p5-sk: Add regulator nodes for AM62P
Date: Fri, 2 May 2025 21:55:36 +0530
Message-ID: <20250502162539.322091-2-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502162539.322091-1-r-donadkar@ti.com>
References: <20250502162539.322091-1-r-donadkar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_172609_953090_5A6E1B04 
X-CRM114-Status: GOOD (  11.53  )
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
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
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


