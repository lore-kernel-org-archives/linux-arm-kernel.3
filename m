Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BCFC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgpmBm1w1oITFxPAP3o9Uap1UqrLDPvPvUmM3o3SQQM=; b=jxUpXLToH5S0ZK9DSdEhGAXIJa
	cwEcNqeoC2ZXG6zATAS5mKKjyuUybEE0btwBzjZT9uA4lWD60jyT1S4NFRGWzCl5XsyfsaHknCk1b
	OCUMUOKUhig8VDD6tJaIdRsMsy9MR6T3M7cK++3sTgmMZE4vIV5En8thlxppZ9d0uemm2APimivr8
	BNC6xdnBVy3sP14flFk4WjRVtsAloBSNGC9IFz08ucUMCKyOT1uEPgC9ydaoodPSxq6OQF72Ekv81
	H/Iy8/QlECXQDO56nk8nSco8oTlGGBVRBCLVi5rQNTgmYFWOBelAXSaNJUtCs1ZOSaNUphmpdBEwf
	NBPaBZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWe-0000000BPoZ-04ul;
	Wed, 09 Sep 2026 10:27:32 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWT-0000000BPfm-1K77
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:27:22 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 84C2B7A0084;
	Wed,  9 Sep 2026 06:27:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 09 Sep 2026 06:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949640;
	 x=1789036040; bh=WgpmBm1w1oITFxPAP3o9Uap1UqrLDPvPvUmM3o3SQQM=; b=
	EbACrYPJv4HRS+iEIEYLEsfLga6Eubax8m2BCtWEMyzGaACE0AUSqJRhyKZIIqfN
	EF668w23ou/K24THdbX+VThVoz4u/8VXktTayEolacaySYIUb+dihcnqKbRzgNS2
	5E9rvzvLu5X19ygzaii/jqvGWbEX4GTk6dcipsolB5lTnm9R/08qPVTUbRq+FwQR
	v6WFD1eiRQhcJan/TWyQCYsBOpQHh/K4SPwPoeT/pqjZUIxhhtSUDPuSVjdMA9zL
	TNodkTlbqFAtzoi3tVq9Rzg4s9CB6k11uiqvnCu3vQAYormhzWbbqPcFq68caWX/
	ysMYWg6xXZXSmnLyyes/2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949640; x=
	1789036040; bh=WgpmBm1w1oITFxPAP3o9Uap1UqrLDPvPvUmM3o3SQQM=; b=U
	PMICsXYM0TBhfaGiLxS5fS6zW2elvypiP90fOFLjMLiJCVszBb4waMge2TyFW4+/
	6NlUM8s9pA8u2vpK8lX31qnwaUJdHyZJjnNAMgq18KygRglpcS7UdZiQyfN9MS6H
	vL699Jx3/l/hX+fPd8+Y39/qUH308ASDS2J26f2JRNQLN+WCnXy2YUa9hy8nNzO2
	EJGk3Iip0xZWBK7QAQRcGikvtIJZ3ZvxkPXtXQ0d8vujmlr5x81ZwLiYEirNgJuQ
	fKIbvm9dnryPnlaTSz0bx7Q0HkKy2wl8VzKzUsg8rCq8EM/y8oBsMVFHBMi89VFE
	6fz2sDIQQ9kCjYQids4bw==
X-ME-Sender: <xms:iDShaoDqC04gR7ky6SXiTQ85rR07egVNiVTQZQq0Zl2j2Mt_KccLQg>
    <xme:iDShaivpM-An565p6wqFSkA8q1qjk5tkikNVs79x39IkUIpUrjCXkK2g2ntTqTX1j
    VeAXPLUO5_8m_Ght9kJM6H-FmbEEgquoo_rhjuUW5-o0R01MOJcENwS>
X-ME-Received: <xmr:iDShanKrteBOT_jMXgG-xvw7z5uzCfLYY2fm_54h9IbR3Bpvx9CEKZ78_19tw7KKwLmxS60EzQya0iH8ofzqyHpubg8iS5JUmEH_lw>
X-ME-Proxy-Cause: dmFkZTGrfMJS/BPnzvFtxFWH7T2NvqB5iRSUYFltsQYoqh91AcAlEZdgxuHZyrYLq3kEOk
    j5wvhkqN1OKl91HrWXzjjavcMXmgvEWC1tfNMr6YyuWRD6//RUDkmVO3/ATEajCWyfZedL
    8sHEPefu4TqdYPDdk53dU84dTpDQmvitB4Jd8BhRBQx2FhHfLph5+6E9Uyo985vYlfK3rV
    DNGLSCjFuasa5/IY8K3MZyQs8cwzlsSAXH1aJt2liMZr6UglJb7lvyAF9z6AbPEzIyhVzl
    HRoRmsqTYvRh/nPj5OrrpEMagZdYAssoR8SKXOADJ0/HyjV/ybNJdeD0QwSSZATBimrjno
    Q2xXGefsUNCX4hGOsT8zU2yyi5+645BM8GaU1wu7nVI5+GKfyIj6zUeIgccNybCE+NfzC9
    q9SEhNfeSDy77DFNNVW5XGtlfoYAop12vI7ZH7rq2AEVRX5QCHrop7IWL6w9YzQKh3czsH
    4MkPQajwCz5fjl2NeTv6LWBtCRDU4WRc23RG5wsnQBxtkYjIAoRX+gV/OtLsu02K5y7ixK
    NHtun2giLJ//HXHZJL0hsQS8oquM7m+sa+ptlCtSvDvfuYsYRLfpuV5UFIkFE9a1pC+867
    NEQ6FiZGqESwHsA6gL0s440dpkF1RUzrxvOJ5wrjlcFy+m+dsy4bCTj/4csQ
X-ME-Proxy: <xmx:iDShapbx8jCJMpSVpnAXhxngt9RaM-MIlm6ytrd_F0mbinT4XEqGKQ>
    <xmx:iDShapDkE94FYDSkYNOJlNLSS5Y3217O1pyy5iw5vx3P7wB-BjvdoA>
    <xmx:iDShajaEdvlj9pj5QxzqUEVFKmpb-mHlhVcOcfcD4EAFc-GA8d1YVA>
    <xmx:iDShahnq0TcXik-oTL-osiLfTh7D2k-Do8WrjvQkw65VMsJbbb2qnQ>
    <xmx:iDShanjuUmwOMvupqtT7T3tGSy2BBOWBQXlgdUgpWtvbMYVjjW3cWRL0>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:19 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:01 +0200
Subject: [PATCH 05/13] arm64: dts: apple: t8122: Fix child-address-order
 dt-style-check issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-5-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2607; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=p38AXMzca/I6aVtQpRZ8f+WAdxrgQ6IGXGdUO01HADo=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJpWfOV1W1/Ls/Gn0z37Z+y6TjSJiHJesP65nCe5dN
 df3rNXrjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABO5953hn4KT9uODvd719zIE
 T19zUHlRLHFqaVF349majClL+zsVzjEyPJn12rtLfd05Aa4rSkJP8ubG+GzW3mplWF3R3O5fvL6
 FHwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_032721_706856_5A8B78BE 
X-CRM114-Status: GOOD (  10.10  )
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

Reorder device nodes in the soc node by their unit address.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 60 ++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 481f68a570ec..3c7677079a29 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -284,36 +284,6 @@ serial0: serial@2a1200000 {
 			status = "disabled";
 		};
 
-		aic: interrupt-controller@2d1000000 {
-			compatible = "apple,t8122-aic3";
-			#interrupt-cells = <3>;
-			interrupt-controller;
-			reg = <0x2 0xd1000000 0x0 0x184000>,
-				<0x2 0xd1040000 0x0 0x4>;
-			reg-names = "core", "event";
-			power-domains = <&ps_aic>;
-
-			affinities {
-				e-core-pmu-affinity {
-					apple,fiq-index = <AIC_CPU_PMU_E>;
-					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
-				};
-
-				p-core-pmu-affinity {
-					apple,fiq-index = <AIC_CPU_PMU_P>;
-					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
-				};
-			};
-		};
-
-		pmgr: power-management@2d0700000 {
-			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			reg = <0x2 0xd0700000 0 0x14000>;
-			/* child nodes are added in t8122-pmgr.dtsi */
-		};
-
 		pinctrl_ap: pinctrl@2c7100000 {
 			compatible = "apple,t8122-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x2 0xc7100000 0x0 0x100000>;
@@ -361,6 +331,36 @@ i2c4_pins: i2c4-pins {
 			};
 		};
 
+		pmgr: power-management@2d0700000 {
+			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x2 0xd0700000 0 0x14000>;
+			/* child nodes are added in t8122-pmgr.dtsi */
+		};
+
+		aic: interrupt-controller@2d1000000 {
+			compatible = "apple,t8122-aic3";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x2 0xd1000000 0x0 0x184000>,
+				<0x2 0xd1040000 0x0 0x4>;
+			reg-names = "core", "event";
+			power-domains = <&ps_aic>;
+
+			affinities {
+				e-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_E>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
+				};
+
+				p-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_P>;
+					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
+				};
+			};
+		};
+
 		pinctrl_nub: pinctrl@2e41f0000 {
 			compatible = "apple,t8122-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x2 0xe41f0000 0x0 0x4000>;

-- 
2.55.0


