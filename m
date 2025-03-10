Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1217C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tcXsIAiJOAa58/NDSAP80AZfeqKu9fs0GGWl69yLHQA=; b=vjCT+mO4T2h/iXH+GIL2Rq+BZ4
	14IMOUX4AT8vVPzcS/9E4P3l6jICfoSo+TfHPjpb1OR3gnXfP9FWxPxQoPgxCK5dTqwO9xhW4s71Y
	Ufi+B2yyz1I1zbjUoIQpm6DLoT+BX7aRu/OI6D7POJjVsd8aY9jLBxczXf18bLTMbh8o/2Agz1mk4
	Ab6ajv1zAjLv4ntxNHxk9NeAfKadRMTE5pu2Ja65nxOhfJjf51IMNz8wCUqPoZoddOMEwex45hS3a
	NfBEZa/clqdPNchBJaimrJ92hJqvFMvaNgbYnmLOZhXSOSaq5gs+Q1JC8qECePZELvmXZbu2jZETc
	gj1V3oGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZpe-000000029oR-0joD;
	Mon, 10 Mar 2025 09:53:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZZf-000000026ds-476r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:37:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4724F15A1;
	Mon, 10 Mar 2025 02:37:30 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FD473F5A1;
	Mon, 10 Mar 2025 02:37:17 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Wei Xu <xuwei5@hisilicon.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	coresight@lists.linaro.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH] arm64: dts: hi3660: Add property for fixing CPUIdle
Date: Mon, 10 Mar 2025 09:37:08 +0000
Message-Id: <20250310093708.9332-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_023728_059759_BE0FBAB6 
X-CRM114-Status: UNSURE (   7.26  )
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

During CPU low power modes, ETM components will lose their context.  Add
the "arm,coresight-loses-context-with-cpu" property to ETM nodes to save
and restore ETM context for CPU idle states.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
index 79a55a0fa2f1..4c6a075908d1 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
@@ -17,6 +17,7 @@ etm@ecc40000 {
 			clocks = <&crg_ctrl HI3660_PCLK>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu0>;
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -34,6 +35,7 @@ etm@ecd40000 {
 			clocks = <&crg_ctrl HI3660_PCLK>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu1>;
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -51,6 +53,7 @@ etm@ece40000 {
 			clocks = <&crg_ctrl HI3660_PCLK>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu2>;
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -68,6 +71,7 @@ etm@ecf40000 {
 			clocks = <&crg_ctrl HI3660_PCLK>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu3>;
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -160,6 +164,7 @@ etm@ed440000 {
 			clocks = <&crg_ctrl HI3660_PCLK>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu4>;
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -177,6 +182,7 @@ etm@ed540000 {
 			clocks = <&crg_ctrl HI3660_PCLK>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu5>;
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -194,6 +200,7 @@ etm@ed640000 {
 			clocks = <&crg_ctrl HI3660_PCLK>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu6>;
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
@@ -211,6 +218,7 @@ etm@ed740000 {
 			clocks = <&crg_ctrl HI3660_PCLK>;
 			clock-names = "apb_pclk";
 			cpu = <&cpu7>;
+			arm,coresight-loses-context-with-cpu;
 
 			out-ports {
 				port {
-- 
2.34.1


