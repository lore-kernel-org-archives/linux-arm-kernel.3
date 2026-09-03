Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED15C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIy2jDUjDSAzq3rl2IQj+FVKtP8cUbBzF4JE8HwUg7I=; b=RCqllWkQ66BbGTYaGaXBfgTmFn
	s5yiQmE4a4WVnvQzdMG69dnzbqsU8V0SQfsXCEG0Zr9me2hxXFiFAgndzg/N8j4EKESzXOkdCSxDA
	FVdXVcewEqP8ftGglkMTAkAp+7/TLp05FxLBrs1nkqU74gvvacbN54PT7YGknJyibjAdKASVllY4h
	n+jtrDVCLf47pCJRaznvfuoqFB4hXHu98JXGP7nitPUb/KkyQlD1UspBvfFJUnnPCyqQOGOP/ijf2
	v6Gc1CxaEBgSq3hfv9FCGDn3tD3kaOKqu0SRmG4tdLqyODoyFDAJDtbbGeljlLkCmQStO0+mfPe7i
	NTd+klyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27yi-0000000HSLq-1r6i;
	Thu, 03 Sep 2026 13:59:44 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27yf-0000000HSHz-1LZv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:59:42 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 9C4D1EC0326;
	Thu,  3 Sep 2026 09:59:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 03 Sep 2026 09:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788443980;
	 x=1788530380; bh=ZIy2jDUjDSAzq3rl2IQj+FVKtP8cUbBzF4JE8HwUg7I=; b=
	JRt7SxMuq9IczuoFLeKnV+xmCBKqTyM4Eah5p+CAQI+7ebBIyALZU3f9OzRbgxmW
	TgIqLCT/JAbageB9wCj1rN+vXLzi2EmKT1DZCQ2DcvmvVHo9K/FV+gxU/NSFFIEK
	glOGM96fXaMlR6vPfmmX+dyBA1l2KOSWKNZ8+DOneWXq1azlJvQIEME+UgbucONd
	U4//7F1MPbROzKqsEjm2cQUS/lTYJxCoQvVf+1H0SCimZEnfAzp1ddNIWjwreYUB
	jPcpIYXCSBgtihEM5Hvd7EGmH2JuDrn7D2ms8/qG3HZhAjmUNNJ4gh7OwBUTZXr9
	mD8sxpqTuCppZWXNLiMpxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788443980; x=
	1788530380; bh=ZIy2jDUjDSAzq3rl2IQj+FVKtP8cUbBzF4JE8HwUg7I=; b=l
	giPQG2gYSRNfnkzfUE55GdNC7fCRhfAUNU8krzdp11eIPWNhoXqYII26c0NhLIHd
	S9g0KX8Y9v29PKkoUEwTQh6HC7yqQarphzkUxl4uX/4ETYzkiGOM0HcqwM+yI2z2
	6lepwIW960h1LSWAZG2W+445y6mgC6WeHT90UAulqGfP5rrE/bqk9mY8a8Nx9bHK
	+Pgvnod2rIM+ilBWwu0aCfm3LO0OnbeAlpAd/GOYKC9gGQ43AOAb045ZlWcQja83
	2G9kP43Nn+yoMrAKLvgJm8pzYme18TeysgeAne/edgj3k/SnyXm1HTRtY8oyAJHn
	6aHqs3ECCWiNmoZyXhjMw==
X-ME-Sender: <xms:TH2ZatLfEXgnSKNYRO3QLjfmwj2DMIrnlktiq5NzVL19Uzdtt-YN_Q>
    <xme:TH2Zak9jfF2Ks5ESXjcEEeYs1JHy3sRQKCbDwzAkIHSr3YRFqp2deJ6EYVuJZ6QA5
    Y50YyXqdz4jNwBzIvvlapdGN_TZllotKu8zzc0EiAZ56idbXwHFiQE>
X-ME-Received: <xmr:TH2ZahF8VGYF9gTKy2ukh9gq2lofd_xhF4J17BaZ1ba32cie1aKArTXR42APu4_mkEU8KhGlnHod0V5ch8tu8ZoBKWb_0UDQE-yZsA>
X-ME-Proxy-Cause: dmFkZTFcpYBTRCFgODwx4IUPoR4bJaChIXKsH3afFh2Xpvizaclb5S80INlpKeKv9BXFDq
    yMiKsUELK0YRBY2/3hc4KHy6MZ7+ukA8Bsji12NtSMlKDu7omlMWGJILS+nkqBsvx4lAvX
    QyL6tx71DnbrVejTwb9SC1ubmR5U6JByW6CfEDlo5jadjY6i6Asq9X+Pj0CgCbJDQuypY+
    dE2XudzWCIm/XbuPUNuGXbDz+EMs3E4DYPNedwhjdwXk78b9ptrdC+i1jlA8pr/NGncTN1
    Fmj24k3fFvYxIY4xYrFU6RuwbZ1Q1Kr2Zwb7/7NQQ6F8bGvEw5bv2yW+tAOyzVRvKJw7MQ
    JgliSoBGNOj8OaDuwrWKLIWgn9PU6KGMwRfyAyyUPEpyqobqqna3OofwsXCx7PyjHEMlvU
    K/KCPviyFDP1VEqU/NEB796y39PwPQBjsJU834XVlQ3YnDiEpjy/CJAjd55seZ7+obO8HI
    QgCBZsVJFNvLHhsF5rKmkWy3y8HHO03qaHeJW+CKARmskBlW6rtp9fup8i9dM47oIe5IXq
    K4KTMGSrEMsUBWiSWgZoR17uL/rPNOwVtM2WrqWSLHsIZN84mibSNl+/PXlJ9U9be7l7Ps
    hCMoNvSMD/hZg2DO+9JDMm4CRtKgPzMRUn62Zu0NH1kEiiGdK+v0Pwqn/yDA
X-ME-Proxy: <xmx:TH2Zan5WyskQLzDGKiZDOfwY8wPF4bRnd9K4PD3wVx8hFbfew7ObyQ>
    <xmx:TH2ZaiaejvvVWyK-x0-_lKpnT-aTFBPeVWJ8PWJ9ILnqeOdf5yzhkA>
    <xmx:TH2ZathL1iewcbjcCgqYyDi_oZTfK-IZD8IGQdigZPiZ6gmtJuwZoQ>
    <xmx:TH2ZasdoG4OZl6Z_5v2mZMnr7E67kByvhTe2wqDv3REV2KpZvfEZLA>
    <xmx:TH2ZajWRgApIX3SW53mXvGJWbumIG_oTLW3Na1ZKMK2ULjM-ox17pI4w>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 09:59:40 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 03 Sep 2026 15:59:34 +0200
Subject: [PATCH 3/3] arm64: dts: apple: Fix style issues for t6031 multi
 die .dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-apple-soc-multi-die-style-v1-3-eeb05ea0c187@jannau.net>
References: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
In-Reply-To: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3433; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=Jmv8TOkTNNbuZrKlY6isB4PxsULVGUqZEwDiBEXAa0Y=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyZtS6Ts/3eXwiuW+f5VPSabnLUmeyCHTVuMzd6qYUe4
 deauqi3o5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwEROv2Fk2PbGYkf9mrcyhwy3
 sH1y2F8rfF7q+6bFkhv67jKY/KyKVGP473pK5JcEv5/phNS9DDUZZdH7RXVFd4aJRcmtja7yt1n
 OBQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_065941_454877_2DF3437A 
X-CRM114-Status: GOOD (  10.53  )
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

The M3 Max/Ultra .dtsi files containing most MMIO nodes are a collection
of nodes without parent. The proper embedding inside a "simple-bus"
parent only happens in t6031.dtsi and t6032.dtsi.
Fix these dt style issue by using a define for their parent soc node and
bracket those MMIO nodes inside it.

Link: https://lore.kernel.org/asahi/e2365307-32d6-4ef9-9919-55ba69786741@kernel.org/
Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6031-die0.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6031.dtsi      |  9 ++++-----
 arch/arm64/boot/dts/apple/t6032.dtsi      | 16 +++++++---------
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6031-die0.dtsi b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
index 47d08672a047..cffab6b51d12 100644
--- a/arch/arm64/boot/dts/apple/t6031-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
@@ -6,6 +6,7 @@
  * Copyright The Asahi Linux Contributors
  */
 
+&SOC_NODE {
 	aic: interrupt-controller@292400000 {
 		compatible = "apple,t6031-aic3", "apple,t8122-aic3";
 		#interrupt-cells = <4>;
@@ -195,3 +196,4 @@ serial0: serial@391200000 {
 		power-domains = <&ps_uart0>;
 		status = "disabled";
 	};
+};
diff --git a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
index 2e9d3d2e6dea..524a72f5483e 100644
--- a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
@@ -6,6 +6,7 @@
  * Copyright The Asahi Linux Contributors
  */
 
+&SOC_NODE {
 	DIE_NODE(pmgr): power-management@292280000 {
 		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
 		#address-cells = <1>;
@@ -105,3 +106,4 @@ DIE_NODE(pmgr_gfx): power-management@408e80000 {
 
 		reg = <0x4 0x8e80000 0 0x4000>;
 	};
+};
diff --git a/arch/arm64/boot/dts/apple/t6031.dtsi b/arch/arm64/boot/dts/apple/t6031.dtsi
index 0059afe9a844..2ba0768c33bc 100644
--- a/arch/arm64/boot/dts/apple/t6031.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031.dtsi
@@ -35,14 +35,13 @@ soc: soc {
 
 #define DIE
 #define DIE_NO 0
+#define SOC_NODE soc
 
-&soc {
-	#include "t6031-die0.dtsi"
-	#include "t6031-dieX.dtsi"
-};
-
+#include "t6031-die0.dtsi"
+#include "t6031-dieX.dtsi"
 #include "t6031-gpio-pins.dtsi"
 #include "t6031-pmgr.dtsi"
 
 #undef DIE
 #undef DIE_NO
+#undef SOC_NODE
diff --git a/arch/arm64/boot/dts/apple/t6032.dtsi b/arch/arm64/boot/dts/apple/t6032.dtsi
index bbf19ecdaaec..12171efe8e2e 100644
--- a/arch/arm64/boot/dts/apple/t6032.dtsi
+++ b/arch/arm64/boot/dts/apple/t6032.dtsi
@@ -317,31 +317,29 @@ die1: soc@2200000000 {
 
 #define DIE
 #define DIE_NO 0
+#define SOC_NODE die0
 
-&die0 {
-	#include "t6031-die0.dtsi"
-	#include "t6031-dieX.dtsi"
-};
-
+#include "t6031-die0.dtsi"
+#include "t6031-dieX.dtsi"
 #include "t6031-pmgr.dtsi"
 #include "t6031-gpio-pins.dtsi"
 
 #undef DIE
 #undef DIE_NO
+#undef SOC_NODE
 
 #define DIE _die1
 #define DIE_NO 1
+#define SOC_NODE die1
 
-&die1 {
-	#include "t6031-dieX.dtsi"
-};
-
+#include "t6031-dieX.dtsi"
 #include "t6031-pmgr.dtsi"
 
 /delete-node/ &ps_pmp_die1;
 
 #undef DIE
 #undef DIE_NO
+#undef SOC_NODE
 
 /* delete non-present DISP power-states */
 /delete-node/ &ps_disp_cpu;

-- 
2.55.0


