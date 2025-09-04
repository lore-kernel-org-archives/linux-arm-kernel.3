Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B95CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cK4uQLEtwZy/fYoLqypop64Y9ZdcTJG2slYJFSfO8Zo=; b=zTGIbrnQcYyju9qV9CWsBtXrAt
	v2hMai1OpYCrlWTe/zhcrGXelXA9HK9wOrmAC+0fSTWXREyESu6YaNFc3IpEoCcNSf9FnzlEXgxdb
	NtM3oL/fcswr71uCTi08fw7TnqqieDVuBehwrGp8SA6qkDxVd9WuHvEPVNzi7xmOfxRk2xAaqQOZz
	plGWPuOjk3uIL9e5E0WLAJx9teGuDPkrHtXk6aGHXuI5HVTGz7gjMV3RJYDnV819KY41LZ6ag9b68
	p96hARCWMPuOI9ueJc5LRPH2bAkrvxutjihFY8uxs7AuRiDSma6Xl7aRd1wQzBkSg0cIDVcPDzsW3
	DV7LwB0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9m4-0000000Bne2-2Wkd;
	Thu, 04 Sep 2025 13:13:12 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu86Q-0000000BD9q-2UXu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 11:26:07 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 584BQ4v73000569;
	Thu, 4 Sep 2025 06:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756985164;
	bh=cK4uQLEtwZy/fYoLqypop64Y9ZdcTJG2slYJFSfO8Zo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fjH1EecB4/76kATk/8o+Lqp8jNMOld29AsvpmwZjqe3HcVST3zbshoHjdmA4ybRmM
	 UXUE/ldYKuH0qCuxI8IzElwlpT4ow8BQC9EKxH3T8q30zprWDlaOE4sGkZnCHeNUtd
	 AQ0OyQLdqC653/e5A1RC52i3X8h949VSSOPpEkzI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 584BQ3m4831332
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 06:26:04 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 06:26:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 06:26:03 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 584BPedL3179752;
	Thu, 4 Sep 2025 06:25:59 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
        <d-gole@ti.com>, <u-kumar1@ti.com>, <sebin.francis@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>
Subject: [PATCH v4 2/4] arm64: dts: ti: k3-am62x-sk-common: Remove the unused cfg in USB1_DRVVBUS
Date: Thu, 4 Sep 2025 16:55:36 +0530
Message-ID: <20250904112538.529857-3-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904112538.529857-1-a-kaur@ti.com>
References: <20250904112538.529857-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_042606_721998_36A166F4 
X-CRM114-Status: GOOD (  13.73  )
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

After the SoC has entered the DeepSleep low power mode, USB1 can be
used to wakeup the SoC based on USB events triggered by USB devices.
This requires that the pin corresponding to the Type-A connector
remains pulled up even after the SoC has entered the DeepSleep low power
mode.
For that, either DeepSleep pullup configuration can be selected or the pin
can have the same configuration that it had when SoC was in active mode.
But, in order for DeepSleep configuration to take effect, the DeepSleep
control bit has to be enabled.
Remove the unnecessary DeepSleep state configuration from USB1_DRVBUS pin,
as the DeepSleep control bit is not set and the active configuration is
sufficient to keep the pin pulled up. This simplifies the setup and removes
redundant configuration.

This reverts commit 527f884d2d94981016e181dcbd4c4b5bf597c0ad.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 13e1d36123d5..d3bed23134ca 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -249,7 +249,7 @@ AM62X_IOPAD(0x12c, PIN_OUTPUT, 0) /* (AD19/V15) RGMII1_TX_CTL */
 
 	main_usb1_pins_default: main-usb1-default-pins {
 		pinctrl-single,pins = <
-			AM62X_IOPAD(0x0258, PIN_OUTPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (F18/E16) USB1_DRVVBUS */
+			AM62X_IOPAD(0x0258, PIN_OUTPUT, 0) /* (F18/E16) USB1_DRVVBUS */
 		>;
 	};
 
-- 
2.34.1


