Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24992D74961
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jzLNZuN60N9bR5+YQqu9raEKZmtLRlqAM+KawBR1f0g=; b=YxHyCFjOyl6TAgplNPGy4Gu7Gv
	VtK6gKMLzTLtIO3tE70u9KrgmTICsmRnBDOyLXnl6DtyTgn1LMhvevHTtmKr4ZOJp9b38Wa9sjxLf
	91DbgG6Ez+zcV9VZxm2tA4VcvS1kE5RVNNZjQrNvhNLQGzP9g9xuJJgxE267Ys6vb9i42Be2DIz3Y
	lN1nWEmdn+z9IOXsEoJe2CepbliI8AFwPKNWSb3WUYouvA3HAlg/SqeDh3dIOHt1f9zN+c9QWNqqb
	kAbk3QQdjdDZaY0YnReLgB57mNSRlZ9eqekeqWw0lc6KT/VR7+B3JxH4VoyZ4jUn6DzNv3CRihCt7
	8vPkb4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60cl-0000000Ghvx-0qVA;
	Wed, 30 Oct 2024 04:48:03 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60b5-0000000GhSA-1eW0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:46:21 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49U4kEUp089459;
	Tue, 29 Oct 2024 23:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730263574;
	bh=jzLNZuN60N9bR5+YQqu9raEKZmtLRlqAM+KawBR1f0g=;
	h=From:To:CC:Subject:Date;
	b=n+hIZAP+oZABrfGZj8BsJHTYQdG4S0tReAJsZgI7RrslhlR8BWxVRUtNiQj8YGPk/
	 Ig4BH/OFoVu9dDjX2yL0CFDWBLyZKWkjryODb8Ldu5n4FeylMUabLTQdsnMmXC3hz1
	 Squ/7Xx0HkYLsqWQTmb7x7qYeT2mw0+fMaWYzLiw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49U4kEcT011362
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 23:46:14 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 23:46:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 23:46:14 -0500
Received: from lcpd911.dhcp.ti.com (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49U4kAHe056490;
	Tue, 29 Oct 2024 23:46:11 -0500
From: Dhruva Gole <d-gole@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Dhruva Gole <d-gole@ti.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Bryan Brattlof <bb@ti.com>,
        Wadim Egorov
	<w.egorov@phytec.de>
Subject: [PATCH v2] arm64: dts: ti: k3-am62: use opp_efuse_table for opp-table syscon
Date: Wed, 30 Oct 2024 10:15:53 +0530
Message-ID: <20241030044553.3225383-1-d-gole@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_214619_614603_82B9564F 
X-CRM114-Status: GOOD (  14.93  )
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

Add another entry in the wkup_conf for the syscon node, and then use
that for the syscon in opp-table.

Marking entire wkup_conf as "syscon", "simple-mfd" is wrong and needs to
be addressed similar to how other child-nodes in wkup_conf are implemented
in the same file.

Signed-off-by: Dhruva Gole <d-gole@ti.com>
---

Since the driver fixes for ti-cpufreq.c have made it in -next [1],
The DT fixes for SK-AM62x can be supported with support for legacy
style DT as well. This has been tested on SK-AM62x [2]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/cpufreq/ti-cpufreq.c?id=1724ae88efcbcd0daeb203ffeb4a2c0e59f2ddf7
[2] https://gist.github.com/DhruvaG2000/40b80cc04a9ac90c86445d6e67ece4cb

Changelog:

Changes in v2:
- Deleted PATCH to Make the AM625 efuse_offset 0, because with [1] we no
  longer break backward compatibility and hence need to preserve the old
  offset.
- Link to v1:
  https://lore.kernel.org/linux-arm-kernel/20240902093222.2828345-3-d-gole@ti.com/

---
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi | 7 ++++++-
 arch/arm64/boot/dts/ti/k3-am625.dtsi       | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
index e0afafd532a5..b2b65e31c7cf 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
@@ -10,7 +10,7 @@
 &cbass_wakeup {
 	wkup_conf: syscon@43000000 {
 		bootph-all;
-		compatible = "syscon", "simple-mfd";
+		compatible = "simple-bus";
 		reg = <0x00 0x43000000 0x00 0x20000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -22,6 +22,11 @@ chipid: chipid@14 {
 			reg = <0x14 0x4>;
 		};
 
+		opp_efuse_table: syscon@18 {
+			compatible = "ti,am62-opp-efuse-table", "syscon";
+			reg = <0x18 0x4>;
+		};
+
 		cpsw_mac_syscon: ethernet-mac-syscon@200 {
 			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
 			reg = <0x200 0x8>;
diff --git a/arch/arm64/boot/dts/ti/k3-am625.dtsi b/arch/arm64/boot/dts/ti/k3-am625.dtsi
index c3d1db47dc9f..c249883a8a8d 100644
--- a/arch/arm64/boot/dts/ti/k3-am625.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625.dtsi
@@ -108,7 +108,7 @@ cpu3: cpu@3 {
 	a53_opp_table: opp-table {
 		compatible = "operating-points-v2-ti-cpu";
 		opp-shared;
-		syscon = <&wkup_conf>;
+		syscon = <&opp_efuse_table>;
 
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;

base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
-- 
2.34.1


