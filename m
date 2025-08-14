Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2EFCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 00:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLHxUFjfLmqm/i4YDPATjTVBn9dA+0sj+cclW38Fa4I=; b=Mx7qpGxNgEmh66hyLOgWw0RY2E
	6Y07Cc3Z1ZM59MLXanJzgycFgnsLxa3Ezgp8GjZbfdH+DvFeeJWqVbW+yj0OaXqtVMxrnxY/gCrZX
	MJVdXriomYPaPL2Iggsgo/oF16/tQ3pXgtabbztmoMdT07BEvZwbWgzOX2SjhdOxlMGMUEZBVqyx7
	Hm8QFWbzQYh5lKbr3c2mnyuS4vDfqccgb2tj23P80wCxF3rwK/DFwpvJFM1GJxejTnzhB10FJkJ9P
	d2uLyC8mNUs6SNp+v/nkmseAHQWoyc3Wloso9OS7Q0DVf8r72iU1c3SxTvMTt/Jd4WZwph2/SYuQJ
	5spfs+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umhzR-00000000qYb-0DiU;
	Fri, 15 Aug 2025 00:08:13 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgdZ-00000000hH3-1Vmp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 22:41:34 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EMfVgn1973684;
	Thu, 14 Aug 2025 17:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755211291;
	bh=wLHxUFjfLmqm/i4YDPATjTVBn9dA+0sj+cclW38Fa4I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GDVKK2CRinJzwXhGWC6S+/FVen7oC3LTXhY7sJN3357b6G0vXvlASWUK4Ea4moUu/
	 p37MMCmr9OJjlMh48cE2IPHV3QOL4iwlTKTqDzJqFprqKPjh0vPRXS7X7eD6Ft4KY3
	 SgAgD3h6r2cOTFbH/+ErTfdIx7ssqxsYj31LejWs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EMfVaN2150859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 17:41:31 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 17:41:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 17:41:30 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EMcw58096792;
	Thu, 14 Aug 2025 17:41:27 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 33/33] arm64: dts: ti: k3-j7*-ti-ipc-firmware: Switch MCU R5F cluster to Split-mode
Date: Fri, 15 Aug 2025 04:08:39 +0530
Message-ID: <20250814223839.3256046-34-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814223839.3256046-1-b-padhi@ti.com>
References: <20250814223839.3256046-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_154133_485893_376A6567 
X-CRM114-Status: GOOD (  12.21  )
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
the moment. The necessary support to use MCU R5F cluster in split mode
was added in the bootloader. And the TI IPC firmware for the split
processors is already available public.

Therefore, Switch this R5F cluster to Split mode by default in all the
boards using TI IPC Firmware config (k3-j7*-ti-ipc-firmware). This
gives out an extra general purpose R5F core free to run any applications
as required. Lockstep mode remains default in the SoC level dtsi, so
downstream board dts which do not use TI IPC Firmware config should not
be impacted by this switch.

Users who prefer to use the fault-tolerant lockstep mode with TI IPC
firmware config, can do that by setting `ti,cluster-mode` property to 1.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi             | 1 +
 arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi             | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi            | 1 +
 .../boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
index 8eff7bd2e771..ddf3cd899d0e 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
@@ -94,6 +94,7 @@ &main_timer2 {
 
 &mcu_r5fss0 {
 	status = "okay";
+	ti,cluster-mode = <0>;
 };
 
 &mcu_r5fss0_core0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
index 5b3fa95aed76..57890a3b38a2 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
@@ -211,6 +211,7 @@ &main_timer15 {
 };
 
 &mcu_r5fss0 {
+	ti,cluster-mode = <0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
index 40c9f2b64e7e..7ee8a8615246 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
@@ -179,6 +179,7 @@ &main_timer5 {
 };
 
 &mcu_r5fss0 {
+	ti,cluster-mode = <0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
index b5a4496a05bf..e12fa55a4df0 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
@@ -254,6 +254,7 @@ &main_timer9 {
 };
 
 &mcu_r5fss0 {
+	ti,cluster-mode = <0>;
 	status = "okay";
 };
 
-- 
2.34.1


