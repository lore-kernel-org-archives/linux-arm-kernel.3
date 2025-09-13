Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982F8CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 06:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykk5QGN4fnoQrsSb/DKTeAFELuUFHS/B90NVM1SCIQM=; b=CbqnFDVW+mB0ujJkKXIuuQRGzk
	4rNF3LSyqzA+a2CxAUkyBMZ8PRVzeqIn779Eh2Z2eOZae+rr2pTdNnSoVxr/v8tae8xQCaTlHpl8Y
	2oNCV+OPwWfAavqKCf+Fk4wpxiP59lS7elBu7i7AnDRerTMPge7Q4S14lOwZR9ozg1An/xOB0xGRP
	NeEqm8l9Bkl/zmhpaYgyygLKya5uDmYM7yxRctrtKTFAquCIqQaZ1A0R4g5wOtMlwz5cIMoLP4gfP
	wdA9JOH2D2pUXzuYekSRW5hOp9GJAykSZHxWrU7wU7zFJvVhrHhnURztAl9JaEzFMdlsYJFpFBX6m
	HvqK7qAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJyD-0000000Da57-46pG;
	Sat, 13 Sep 2025 06:42:49 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJyB-0000000Da3k-2sCp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 06:42:48 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58D6gRU0664142;
	Sat, 13 Sep 2025 01:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757745747;
	bh=ykk5QGN4fnoQrsSb/DKTeAFELuUFHS/B90NVM1SCIQM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RN2UHVVwFsle+xKTitrbJgNXLBX0mOBbghT/5Ihgsv/4Y7S4gHmRk6332EZfm2MmG
	 q1qrtlqbbT7Wrd70D2Y/ZbaLty7bGuTSzjo+yEqSmjiiJivWMudDhEoxY+J+0yhA6n
	 iUMxheK1rtwCVOqadE3qj9WYQES1eHBPAOLLWiO8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58D6gQaR2531657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 13 Sep 2025 01:42:26 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 13
 Sep 2025 01:42:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 13 Sep 2025 01:42:26 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58D6g5v0543875;
	Sat, 13 Sep 2025 01:42:20 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jyri.sarha@iki.fi>,
        <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <aradhya.bhatia@linux.dev>
CC: <h-shenoy@ti.com>, <devarsht@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <s-jain1@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am625: Add OLDI support
Date: Sat, 13 Sep 2025 12:12:05 +0530
Message-ID: <20250913064205.4152249-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250913064205.4152249-1-s-jain1@ti.com>
References: <20250913064205.4152249-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_234247_812412_EF11272A 
X-CRM114-Status: UNSURE (   8.93  )
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

The AM625 SoC has 2 OLDI TXes under the DSS. Add their support.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index dcc71db8afd4..d240c157d819 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -793,6 +793,53 @@ dss: dss@30200000 {
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 		status = "disabled";
 
+		oldi-transmitters {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			oldi0: oldi@0 {
+				reg = <0>;
+				clocks = <&k3_clks 186 0>;
+				clock-names = "serial";
+				ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					oldi0_port0: port@0 {
+						reg = <0>;
+					};
+
+					oldi0_port1: port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
+			oldi1: oldi@1 {
+				reg = <1>;
+				clocks = <&k3_clks 186 0>;
+				clock-names = "serial";
+				ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					oldi1_port0: port@0 {
+						reg = <0>;
+					};
+
+					oldi1_port1: port@1 {
+						reg = <1>;
+					};
+				};
+			};
+		};
+
 		dss_ports: ports {
 			#address-cells = <1>;
 			#size-cells = <0>;

