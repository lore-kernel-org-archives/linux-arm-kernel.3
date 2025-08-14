Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05686CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 22:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z86arGkd6r6jlVLwjUvCRxxzBxvKNamCGHK9f/qQVic=; b=m1xjT8yttdQ7ReV4DY0cV+08vA
	rtppcVVnlqGlYBzhX0FXv9m1h+Ri0T57reUEmYEBHUuDWLbA3PF1Iw4ZlJyRuZf5pNASc9t04Icyc
	4gZI0SqJsJoRJW8vaqGecd5wOIrKmLfM2fzDnquhg19DyS18KNcmAPJK/BVMbAz3kqOxbCYG2VLpE
	G7dUQjZRGwtg4/EJbk9RQbAqCvfDTo1ij2ZkYmxEbE75LEreYk01HHUoyecKM09WIJj7XZXqFhx7X
	vuj4GWaVWuKKtYTxLZhct1qv1ZYLIywr5X1GIgdfCh+11izeR6yhYqdTXotgk0zqYIZC2dUEJmALL
	A1Sle8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgtC-00000000jXI-0oSA;
	Thu, 14 Aug 2025 22:57:42 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgbf-00000000gqC-3M84
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 22:39:36 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EMdWdZ2027448;
	Thu, 14 Aug 2025 17:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755211172;
	bh=z86arGkd6r6jlVLwjUvCRxxzBxvKNamCGHK9f/qQVic=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=E+mm8Xo9SXGE47MIgXusZq/zmKaHK9e0JyI9Y2D8CDebYJaojFh8paa4AMRRjKCQy
	 7DzEdCbioUcx02FrW7WNMKAulZ2UardaW0UdfELZkgRpiAdzMWW2BiFRCpNJPDiiZN
	 N9rA2x2dLw5BYkFqKZUlmeNrreKj7B81Z1KREDFE=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EMdWsM1461672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 17:39:32 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 17:39:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 17:39:32 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EMcw4f096792;
	Thu, 14 Aug 2025 17:39:28 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: [PATCH 06/33] arm64: dts: ti: k3-j721e-beagleboneai64: Add missing cfg for TI IPC FW
Date: Fri, 15 Aug 2025 04:08:12 +0530
Message-ID: <20250814223839.3256046-7-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814223839.3256046-1-b-padhi@ti.com>
References: <20250814223839.3256046-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_153935_928427_F220FCE6 
X-CRM114-Status: GOOD (  10.30  )
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

The TI IPC Firmwares running on J721E SoCs use certain MAIN domain
timers as tick. Reserve those at board level DT to avoid remote
processor crashes.

While at it, switch the MAIN domain R5F cluster into split mode to
maximize the number of R5F processors. The TI IPC firmware for the split
processors is already available public. This config aligns with other
J721E boards and can be refactored out later.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Cc: Robert Nelson <robertcnelson@gmail.com>
Requesting for review/test of this patch.

 .../boot/dts/ti/k3-j721e-beagleboneai64.dts   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index fdfd46b5b30a..c7ac2b66ee0d 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -937,6 +937,35 @@ mbox_c71_0: mbox-c71-0 {
 	};
 };
 
+/* Timers are used by Remoteproc firmware */
+&main_timer0 {
+	status = "reserved";
+};
+
+&main_timer1 {
+	status = "reserved";
+};
+
+&main_timer2 {
+	status = "reserved";
+};
+
+&main_timer12 {
+	status = "reserved";
+};
+
+&main_timer13 {
+	status = "reserved";
+};
+
+&main_timer14 {
+	status = "reserved";
+};
+
+&main_timer15 {
+	status = "reserved";
+};
+
 &mcu_r5fss0 {
 	status = "okay";
 };
@@ -956,6 +985,7 @@ &mcu_r5fss0_core1 {
 };
 
 &main_r5fss0 {
+	ti,cluster-mode = <0>;
 	status = "okay";
 };
 
@@ -974,6 +1004,7 @@ &main_r5fss0_core1 {
 };
 
 &main_r5fss1 {
+	ti,cluster-mode = <0>;
 	status = "okay";
 };
 
-- 
2.34.1


