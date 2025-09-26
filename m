Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6B4CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 10:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PCNWgN7+R9x4RA0msvoyt/YSQxIRBw+hjf5jLQlB9MI=; b=q793QrS3qkgtnlVEZgFi8sjCH6
	V2ER/rKklpYla/fgpTvgy8WAzZp+DS4QEZdPxYAVbQzk6sTU9t5oR8nwOwXBbJg3Sh0a+3lbhAbTr
	4XYj+KS+wkuKP/1uWEbXuYzo0YKTxO1FreB4A/gD5MjTZD7AkVnyU8VKw/E+sC3jEHtZBwYYxCZqU
	oY76VIXRxJIW3Do1kTxEJbNgt02bGn0p3LNbUtqAMQwb4Gnv/yPvw1Ksq5B/bg1jIQ710PuMj+mQN
	SINHPpoy1L0+VYDGfKt6L66GE2YDarrKYeYzDElROfCpyRtK/ZTZ6fqprOYTIpc6EnPEHRDQAEo4r
	e88OEatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25J6-00000000Djf-2tdK;
	Fri, 26 Sep 2025 10:04:04 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25J3-00000000Dh3-36vO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 10:04:03 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58QA3uac2127473;
	Fri, 26 Sep 2025 05:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758881036;
	bh=PCNWgN7+R9x4RA0msvoyt/YSQxIRBw+hjf5jLQlB9MI=;
	h=From:To:CC:Subject:Date;
	b=APhIChd9b3/pKwFI8jYbZSL4pwVmNEtPIVFapmpERNPQgTqwkrjF7texxhm7hBfIA
	 +5NPqGPhJEPIJ1OungLydXElHvA5ZxM/SclfkXwZ1x6qrl7CYosAbqFjSaQOyPeVuA
	 CIpJW2yz5PVEM4dqqo/ey7q+fqbAaZte49gnGxYM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58QA3uLK3346862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 26 Sep 2025 05:03:56 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 26
 Sep 2025 05:03:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 26 Sep 2025 05:03:55 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58QA3oPj852736;
	Fri, 26 Sep 2025 05:03:51 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kamlesh@ti.com>, <t-pratham@ti.com>, <vishalm@ti.com>,
        <k-malarvizhi@ti.com>, Shiva Tripathi <s-tripathi1@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am62: Add RNG node
Date: Fri, 26 Sep 2025 15:32:29 +0530
Message-ID: <20250926100229.923547-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_030401_870711_93008D7F 
X-CRM114-Status: UNSURE (   9.54  )
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

Add EIP76 Random Number Generator (RNG) node within crypto engine for
AM62 and AM62A SoCs. The RNG hardware is integrated in crypto
subsystem at address 0x40910000.

Mark the RNG node with status "reserved" as it is intended for use by
OP-TEE for secure random number generation. If required, this hardware
can also be used through Linux kernel by enabling this node.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi  | 10 ++++++++++
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 40fb3c9e674c..00148a5ebaa6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -209,6 +209,16 @@ crypto: crypto@40900000 {
 		dmas = <&main_pktdma 0xf501 0>, <&main_pktdma 0x7506 0>,
 		       <&main_pktdma 0x7507 0>;
 		dma-names = "tx", "rx1", "rx2";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x00 0x40900000 0x00 0x40900000 0x00 0x30000>;
+
+		rng: rng@40910000 {
+			compatible = "inside-secure,safexcel-eip76";
+			reg = <0x00 0x40910000 0x00 0x7d>;
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			status = "reserved"; /* Reserved for OP-TEE */
+		};
 	};
 
 	secure_proxy_sa3: mailbox@43600000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 829f00adea6e..9e5b75a4e88e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -247,6 +247,16 @@ crypto: crypto@40900000 {
 		dmas = <&main_pktdma 0xf501 0>, <&main_pktdma 0x7506 0>,
 		       <&main_pktdma 0x7507 0>;
 		dma-names = "tx", "rx1", "rx2";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x00 0x40900000 0x00 0x40900000 0x00 0x30000>;
+
+		rng: rng@40910000 {
+			compatible = "inside-secure,safexcel-eip76";
+			reg = <0x00 0x40910000 0x00 0x7d>;
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			status = "reserved"; /* Reserved for OP-TEE */
+		};
 	};
 
 	secure_proxy_sa3: mailbox@43600000 {
-- 
2.34.1


