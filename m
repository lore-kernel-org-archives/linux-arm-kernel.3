Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7421125859
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yMCeD1Mjdyv7API1IllGvhg9xXRRGo5AkRY41EKET2k=; b=TJcQXbc3+mNXwmAkBdablROXhe
	m7eRlKhcaGBWeFEbHjLtOBPICb9b3ZR4WjafWV3T/bdGNkDpEabaaer4FceCvR2+Hn0wiNHekOXZa
	BzJbhiT8sSJ2aIuWSThRJ0pUeR+qAqbnDkORVR3kFkXDa7flfH6ZQE3z1sxNVkj5YREJBoSjBaZWU
	xGD/kP64SeppVVXNUIb4O/2nTu4TZjNqwlcpp32JZvFoU8PaBkmYWOGi/+v2xLQLcBvx3WSR4lqis
	bylQtxWgAw0ZrjhzdVLhphvOgzRNeuy6a1Es/tIMRWMNxzvSCJ3NW/jeIwIP2wCfPMcs1Hr17Fvkm
	qL2uAgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NXn-0000000C3S3-2Mve;
	Wed, 11 Mar 2026 17:40:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NXk-0000000C3RM-1ZHz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 17:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yMCeD1Mjdyv7API1IllGvhg9xXRRGo5AkRY41EKET2k=; b=FnTbaa4IlKdfYV76E7LIZmL/oG
	vzIRUTIgdRUwlY842hmNYNh3S13GObCixrh7NqYq6vWlxkGxPgJ5ustGPrHvxh5AQLU+KJMU0POAr
	fDyJZMYNrjUltlDsctQVC8fpG7hmmJWHn7Qk4/+fOUmnIXvb0UPz4IHoXN6cyDSie9MMbtiKduj3R
	3WHFJGKVIOa6J9QkgLehBxpK5H2GLdBSWhPLLGQnTsy4jetB2ukPQz1/wZICW6MhzojkT0t7bhJsI
	GZAM+Wqa4NeVL3hrs3IeXBtGWs3uwl3EV/5WY7gt4BKCt768pmfBCft52Vut+jzxEDxSt6rU4tiNd
	rQ1GB9NA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0NXg-0000000HR4I-3mOq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 17:40:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 747741682;
	Wed, 11 Mar 2026 10:40:12 -0700 (PDT)
Received: from e137876.manchester.arm.com (e137876.arm.com [10.33.10.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D28E13F73B;
	Wed, 11 Mar 2026 10:40:16 -0700 (PDT)
From: Debbie Horsfall <debbie.horsfall@arm.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	liviu.dudau@arm.com,
	sudeep.holla@kernel.org,
	lpieralisi@kernel.org,
	linusw@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	debbie.horsfall@arm.com,
	andre.przywara@arm.com
Subject: [PATCH] arm64: dts: zena: Refactor Devicetree nodes
Date: Wed, 11 Mar 2026 17:39:48 +0000
Message-ID: <20260311173948.3478931-1-debbie.horsfall@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_174021_174329_3EA625BA 
X-CRM114-Status: GOOD (  10.13  )
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

Move the SRAM node into the SoC node. Move the memory node out of
the include to make it customizable for each platform variant.

Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
---
This targets for-next/juno/updates in response to
https://lore.kernel.org/linux-arm-kernel/20260309-manipulative-inescapable-labradoodle-7a76e4@sudeepholla/
 arch/arm64/boot/dts/arm/zena-css-fvp.dts |  8 +++++
 arch/arm64/boot/dts/arm/zena-css.dtsi    | 44 ++++++++++--------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/zena-css-fvp.dts b/arch/arm64/boot/dts/arm/zena-css-fvp.dts
index b75204a91882..53c5412d92b2 100644
--- a/arch/arm64/boot/dts/arm/zena-css-fvp.dts
+++ b/arch/arm64/boot/dts/arm/zena-css-fvp.dts
@@ -14,6 +14,14 @@ / {
 	chosen {
 		stdout-path = &soc_serial0;
 	};
+
+	memory@80000000 {
+		device_type = "memory";
+
+		/* ~2GB mapped at 2GB, another 2GB at 2TB */
+		reg = <0x00000000 0x80000000 0x00000000 0x7f000000>,
+		      <0x00000200 0x00000000 0x00000000 0x80000000>;
+	};
 };
 
 &soc {
diff --git a/arch/arm64/boot/dts/arm/zena-css.dtsi b/arch/arm64/boot/dts/arm/zena-css.dtsi
index 9899d2883337..0b41ee4bf4c6 100644
--- a/arch/arm64/boot/dts/arm/zena-css.dtsi
+++ b/arch/arm64/boot/dts/arm/zena-css.dtsi
@@ -634,6 +634,24 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		sram: sram@104000 {
+			compatible = "mmio-sram";
+			reg = <0x0 0x00104000 0x0 0x00001000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x0 0x00104000 0x00001000>;
+
+			scmi_shmem_tx: scpshmem-sram-section@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x0 0x100>;
+			};
+
+			scmi_shmem_rx: scpshmem-sram-section@100 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x100 0x100>;
+			};
+		};
+
 		timer@1a810000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x1a810000 0x0 0x10000>;
@@ -748,30 +766,4 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
-
-	sram: sram@104000 {
-		compatible = "mmio-sram";
-		reg = <0x0 0x00104000 0x0 0x00001000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x0 0x00104000 0x00001000>;
-
-		scmi_shmem_tx: scpshmem-sram-section@0 {
-			compatible = "arm,scmi-shmem";
-			reg = <0x0 0x100>;
-		};
-
-		scmi_shmem_rx: scpshmem-sram-section@100 {
-			compatible = "arm,scmi-shmem";
-			reg = <0x100 0x100>;
-		};
-	};
-
-	memory@80000000 {
-		device_type = "memory";
-
-		/* ~2GB mapped at 2GB, another 2GB at 2TB */
-		reg = <0x00000000 0x80000000 0x00000000 0x7f000000>,
-		      <0x00000200 0x00000000 0x00000000 0x80000000>;
-	};
 };
-- 
2.43.0


