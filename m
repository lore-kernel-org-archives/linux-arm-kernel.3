Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FE7C3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gE5XW7LYRJERQKlLeNBH8x1//oKVJHYsrqcpiH4BRGE=; b=W52umR7+YYHsTIE7Rpeo4Tsfvj
	9cS7zDLDdSHll08W3cRanMcABsb17eIko0YS/jwjr3pcJrRXKvO2/QOiUR3BqA8Jq7ExjjvBnlDgh
	cgy/ao4MkMqBe5iGcR5Zgu5CYSNwLserW07QIDj1y7LsV06UQKFiQm66zJz4IQVtrYWeaAMVzJGcX
	SquUkarXtiqlYgPKc3rqHSzocXkFii4t9KVWc0QIK0D4mRlwZERs+FlPr7fCtABx7V2OCmD9/BThJ
	Go7DI+vXB82WByVPWoH6hWuUGywGpSZVIYbifn4isu8UIL4um125oeGXwpNNUKPT8fkLh6QU6XCzT
	eGfjTP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hjn-00000008Yuz-2Boq;
	Thu, 03 Apr 2025 10:23:55 +0000
Received: from fr2000.dnsiaas.com ([151.106.4.82])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Gjg-00000008NQk-3SOC;
	Thu, 03 Apr 2025 09:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gE5XW7LYRJERQKlLeNBH8x1//oKVJHYsrqcpiH4BRGE=; b=Dtg7kAm6uAfrEMN+ZklmNzn6GR
	z1oyvqP2sYOxP+ptGnu1pVFP2Dblhwj5ZvD/77CQEx0Q8jpCs76Z8Editv/q9oWO5M2nB05J3dRTP
	hxJbuRBioNxWSnzDgGrk2DhvIQPtyGd4fisZ8KwWJ2lKRU45ctCaH1sapLFt1Bo9vNxksErIhwMn/
	+63Y8MKzON7oaWXdRZQcQ6gQ/1xry7jdsyrEyWAS7Oog2KaNnf7D038ckcxJqAG+fRBr1w7UjIhni
	yLdy01i6SIdk72RmigpEpKuVishPhWDhzWha6o/YvY3wvTtc21NndmfhB+Uu1/foJlI1fWsSlVc8R
	3Gyo4GwQ==;
Received: from [185.94.132.237] (port=37142 helo=vscode.superkali.lan)
	by fr2000.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <hello@superkali.me>)
	id 1u0Gip-0000000HaiW-3uRN;
	Thu, 03 Apr 2025 11:18:51 +0200
From: Daniele Briguglio <hello@superkali.me>
To: devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	alchark@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniele Briguglio <daniele.briguglio@icloud.com>,
	Daniele Briguglio <hello@superkali.me>
Subject: [PATCH] rockchip: dts: rk3588: add missing OPP nodes for lower frequencies
Date: Thu,  3 Apr 2025 09:18:40 +0000
Message-Id: <20250403091840.3349637-1-hello@superkali.me>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr2000.dnsiaas.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr2000.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr2000.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_021945_031762_A8D3D61D 
X-CRM114-Status: UNSURE (   4.33  )
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

From: Daniele Briguglio <daniele.briguglio@icloud.com>

This Patch adds missing Operating Performance Point (OPP) nodes for lower
frequencies to the RK3588 device tree. These additions improve power
management by enabling the CPU clusters to scale down to lower
frequencies when under light loads, which should improve energy
efficiency and reduce power consumption.

The changes add OPP nodes for 408MHz, 600MHz, 816MHz, and 1008MHz
(for cluster1 and cluster2 only, as cluster0 already had 1008MHz)
with appropriate voltage settings across all three CPU clusters in
the RK3588 SoC.

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi | 58 ++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
index 0f1a77697351..1b018823d5d3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
@@ -5,6 +5,22 @@ cluster0_opp_table: opp-table-cluster0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <675000 675000 950000>;
+			clock-latency-ns = <40000>;
+			opp-suspend;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <675000 675000 950000>;
+			clock-latency-ns = <40000>;
+		};
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <675000 675000 950000>;
+			clock-latency-ns = <40000>;
+		};
 		opp-1008000000 {
 			opp-hz = /bits/ 64 <1008000000>;
 			opp-microvolt = <675000 675000 950000>;
@@ -37,6 +53,27 @@ cluster1_opp_table: opp-table-cluster1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+			opp-suspend;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+		};
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+		};
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+		};
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <675000 675000 1000000>;
@@ -78,6 +115,27 @@ cluster2_opp_table: opp-table-cluster2 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+			opp-suspend;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+		};
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+		};
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+		};
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <675000 675000 1000000>;
-- 
2.34.1


