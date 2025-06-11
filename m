Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D221C71137
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 16:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5P1928OJ/hfBXkHA8GPkkj34f9sTZpGnS8JHTo3Dnsw=; b=RIlVMjPX3cjfiiSEuNLIfUo5Xt
	Oj2jMY01PrWT1wsqwXGb6Xxp9Bk7Z2JceahCxgPe4Uqarke+KItPBhcZkjXguPeeZNQ9kLpP8P2I0
	KSZrdOd8lyDpoi7xWn3whKrXf7K084F2gQdQd6k7Wui6GJJ/r5SH0JzH/bsn0FYHEuwPB/t9o5p2u
	VN909vZDq+hS8IDKk2RKEynMyV72N+vZ7F7Qe05s6EFgI8km+UFf1qHdSikNtkMsrrnsm3Bthan6e
	kqn2m31tJ4vL/O3qoq/xhGgRCCadIsdc6wOSaPjrixagNNZc3lKXU3NDXrUPemsAb1na7pYZkxLuI
	8UCOScLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOFF-0000000AbP3-2oPc;
	Wed, 11 Jun 2025 16:24:09 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJs9-00000009lvc-1g1L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:44:02 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55BBhwGm2576491;
	Wed, 11 Jun 2025 06:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749642238;
	bh=5P1928OJ/hfBXkHA8GPkkj34f9sTZpGnS8JHTo3Dnsw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qqQXeRV7qyagLO4+6hagfTzEOqzHspM3vxWqCs46EWJsfazYKnJCfmRXyGfI/E8BF
	 pMWJsDsyN3f7q3Alg8RUXu09L4HtBtG00mTUU2igIql2lNg5nmMnGluZdSU6rT2XWT
	 nzNH0hKkSQbbeyEqIMweQtQG6x+Jiv6cNLciWAbs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55BBhwYv1109018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 06:43:58 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 06:43:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 11 Jun 2025 06:43:57 -0500
Received: from uda0492258.dhcp.ti.com (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55BBhavI270460;
	Wed, 11 Jun 2025 06:43:54 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 5/5] arm64: dts: ti: k3-j721s2: disable "mcu_cpsw" in SoC file and enable in board files
Date: Wed, 11 Jun 2025 17:13:36 +0530
Message-ID: <20250611114336.2392320-6-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611114336.2392320-1-s-vadapalli@ti.com>
References: <20250611114336.2392320-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_044401_530670_4985C6AB 
X-CRM114-Status: GOOD (  12.45  )
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

Following the existing convention of disabling nodes in the SoC file and
enabling only the required ones in the board file, disable "mcu_cpsw" node
in the SoC file "k3-j721s2-mcu-wakeup.dtsi" and enable it in the board
files:
a) k3-am68-sk-base-board.dts
b) k3-j721s2-common-proc-board.dts

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1 of this patch was 2 different patches which have currently been
squashed:
 https://lore.kernel.org/r/20250529133443.1252293-13-s-vadapalli@ti.com/
 https://lore.kernel.org/r/20250529133443.1252293-14-s-vadapalli@ti.com/

In addition to squashing the patches and updating the commit message,
"mcu_cpsw" has been enabled in "k3-am68-sk-base-board.dts" as well,
since it uses the SoC file of J721S2.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts       | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi       | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index 5fa70a874d7b..893b730911e8 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -619,6 +619,7 @@ &main_sdhci1 {
 };
 
 &mcu_cpsw {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_cpsw_pins_default>, <&mcu_mdio_pins_default>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
index e2fc1288ed07..a482b3ad5095 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
@@ -409,6 +409,7 @@ &main_sdhci1 {
 };
 
 &mcu_cpsw {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_cpsw_pins_default>, <&mcu_mdio_pins_default>;
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index bc31266126d0..b5fd012d9564 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
@@ -552,6 +552,8 @@ mcu_cpsw: ethernet@46000000 {
 			    "tx4", "tx5", "tx6", "tx7",
 			    "rx";
 
+		status = "disabled";
+
 		ethernet-ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.34.1


