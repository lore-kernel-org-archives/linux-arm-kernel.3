Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D76D11185
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 06:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nGVz5KejI+6GMQUMN3KYKvT7myfaxUoc/i4p+RM9ypI=; b=CQeFZskbgSIkSpdOe6AOs8iWDh
	N/HSyeplc7g4R+pUB95A679ZrgATCmsKhlWESoexHlawpNM/Jyx/+BLbl1Uho7ocphjwqHMt52VEP
	5UfVMQXAo+UXWML7X4Q6CbSI5DSfQ1CK1NLkrlE5LzVb6ioe5uc0nTJ6j0CGNC9td7i97uR7SncCs
	C9/DLQWgeDWK+ZouFW3hUgE7ijWcqZRPtb2K3omsNn0TeSU4iA2o5CiF6isNMjMAHqziFuYEeMC3a
	3xZ9EvhQOVD0c/CKFpkzHd/raj0Ym5bI4cpXXjDcb/hyggbEIINpTGYlpTTT6/e1wDfmyBAi5790S
	VCpYJbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7qmj-0000000CmMf-0DFg;
	Mon, 04 Nov 2024 06:41:57 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7qjQ-0000000Clyb-2x54
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 06:38:34 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A46cLcE057212;
	Mon, 4 Nov 2024 00:38:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730702301;
	bh=nGVz5KejI+6GMQUMN3KYKvT7myfaxUoc/i4p+RM9ypI=;
	h=From:To:CC:Subject:Date;
	b=nZcjlJE2WqciqJjHksmXiRxrbAMM7mRxyb86cqdanUPb1aT7ZE/R5fKJIl9zGhLbW
	 8CXjSqZ4Eqyl/SkNeQ+PwdByUbZh/aFUQWP9eLvJ92m+CC71y/RxQy/UMjv+L+9esq
	 jXV38vPcsrCmy5QnwoILsLkvyIXroRVyQpHYplNk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A46cL9m106737;
	Mon, 4 Nov 2024 00:38:21 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Nov 2024 00:38:21 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Nov 2024 00:38:21 -0600
Received: from lcpd911.dhcp.ti.com (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A46cHVi123048;
	Mon, 4 Nov 2024 00:38:18 -0600
From: Dhruva Gole <d-gole@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Dhruva Gole <d-gole@ti.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Bryan Brattlof <bb@ti.com>,
        Wadim Egorov
	<w.egorov@phytec.de>
Subject: [PATCH V3] arm64: dts: ti: k3-am62: use opp_efuse_table for opp-table syscon
Date: Mon, 4 Nov 2024 12:07:08 +0530
Message-ID: <20241104063707.3604302-1-d-gole@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_223832_897298_D50F544C 
X-CRM114-Status: GOOD (  14.73  )
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

[2] https://gist.github.com/DhruvaG2000/40b80cc04a9ac90c86445d6e67ece4cb
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/cpufreq/ti-cpufreq.c?id=1724ae88efcbcd0daeb203ffeb4a2c0e59f2ddf7

Changelog:
v3:
- Update syscon@43000000 to say bus@...
- Validated that these changes don't break U-Boot:
https://gist.github.com/DhruvaG2000/2833b895dc79d5ce16265ecf15310add
- Link to v2:
https://lore.kernel.org/all/20241030044553.3225383-1-d-gole@ti.com/

v2:
- Deleted PATCH to Make the AM625 efuse_offset 0, because with [1] we no
  longer break backward compatibility and hence need to preserve the old
  offset.
- Link to v1:
  https://lore.kernel.org/linux-arm-kernel/20240902093222.2828345-3-d-gole@ti.com/

---

 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi | 9 +++++++--
 arch/arm64/boot/dts/ti/k3-am625.dtsi       | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
index e0afafd532a5..9b8a1f85aa15 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
@@ -8,9 +8,9 @@
 #include <dt-bindings/bus/ti-sysc.h>
 
 &cbass_wakeup {
-	wkup_conf: syscon@43000000 {
+	wkup_conf: bus@43000000 {
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


