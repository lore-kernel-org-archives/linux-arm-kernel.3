Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30BDC54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 07:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6MDUPj39cYfdScK6l2pJt36hKiuoFRjVjXtKbkUBx8=; b=UTp9FWA8GX4Mehn1ya6LHpK4Bx
	/BMsdWumCn4Sd+nnrsHmDBxvVNF8x2/g+9cCOPUd44ehOIMFRmkRjLRnOvEp9oiRJqrKLlWVCDUO1
	s92N9Oeg/QjhFbxwkmttvnaSWpmCix9S129V5mA6AoYTRpVvePcADtS6VUJHipHaMk2hn0/9fD5EH
	PTj1pAZ9dcs09gzoaE6ZOTrSVVGzhgs7N94r36gnmfVxfOFJUi/YikD4yiPioJutxs/ZPgfE/HFFO
	0PntufF9V9lBrQF4IyXmDsgqgTli/ysjqOcQq26VXPUTUAWnyoggn8jgRZGripVrKojH0ZYR5ZPCL
	1LVSokRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0U1-000000009SD-1qJn;
	Thu, 22 May 2025 07:36:53 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0Rx-0000000095v-0vIj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 07:34:46 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54M7Ye0E530792;
	Thu, 22 May 2025 02:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747899280;
	bh=F6MDUPj39cYfdScK6l2pJt36hKiuoFRjVjXtKbkUBx8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=apYiFh4Rw52KZRBS0DE5xP3F9v6lrEX0KScl3fMBSnVtwgvfOjJ6xpoxvHjlUELaJ
	 4o2VCDUbY0ZozOWforGdAUX5fF2Z7wYFhOmX0ZNHqLFE+Ap1LPIk5RkvbNcAYL8tdj
	 N+Hcj9M5e0f4+45ke6ghPaJcjyXZiU6kwHFQt1H0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54M7Yec33319980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 22 May 2025 02:34:40 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 May 2025 02:34:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 May 2025 02:34:40 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54M7YQ4o475080;
	Thu, 22 May 2025 02:34:36 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/2] arm64: dts: ti: k3: Switch MCU R5F cluster to Split-mode
Date: Thu, 22 May 2025 13:04:26 +0530
Message-ID: <20250522073426.329344-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522073426.329344-1-b-padhi@ti.com>
References: <20250522073426.329344-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_003445_354045_CA58CCE7 
X-CRM114-Status: GOOD (  10.09  )
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

Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 have a
R5F cluster in the MCU domain which is configured for LockStep mode at
the moment. Switch this R5F cluster to Split mode by default in all
corresponding board level DTs to maximize the number of R5F cores.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi              | 4 ++++
 arch/arm64/boot/dts/ti/k3-am69-sk.dts                   | 4 ++++
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi             | 4 ++++
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                  | 4 ++++
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi             | 4 ++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi            | 4 ++++
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 4 ++++
 7 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
index 4ca2d4e2fb9b..fe3dc035c067 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
@@ -303,6 +303,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index f28375629739..57404882cc89 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -992,6 +992,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
index 291ab9bb414d..7c3899d608b8 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
@@ -266,6 +266,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index ffef3d1cfd55..2b26471a9181 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -1361,6 +1361,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
index 0722f6361cc8..72fd5d39e145 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
@@ -566,6 +566,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
index 54fc5c4f8c3f..2d420041c0e5 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
@@ -560,6 +560,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index fa656b7b13a1..0d45ca9d92e2 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -1122,6 +1122,10 @@ &mcu_r5fss0_core1 {
 			<&mcu_r5fss0_core1_memory_region>;
 };
 
+&mcu_r5fss0 {
+	ti,cluster-mode = <0>;
+};
+
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
 };
-- 
2.34.1


