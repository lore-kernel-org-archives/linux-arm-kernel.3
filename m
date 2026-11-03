Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC85606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iw321cl7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBr6vEao
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eCpLb2eSBdU7oOnz3uYs19P+wbMVKJaOGnZyAlRZ5JQ=; b=iw321cl7Bhq2gqqCEgf1C9AsYQ
	+e0L+RohXZ+RTmfDEiCyG+KE/Z4dHNRGOiz9nCD6eewt5/XzU43vg9d49sRBj5n71hiBOtiK6cnFA
	2KS2FYtXtN8u7uDuE8c5MzKDnrANZiT6tBpLfbzHF4CdYXudxqJiEpk/bsfhRrSjtq3LeQkq+Vt0t
	ABCrCL+ZAKRgIvWOMCBZhmup8kwOR0VS9N74oCOM3RSm54wJWKvBEY2wMwHuu6QC6niQnYYODRvI0
	IVe4Hd31rJSIUElQn2fd35gbPnCVqQzvgG7K4346ADNSuG0jXE7Huek2QlL8DspKzoBUaKnHvnesJ
	SriiU4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONEb-00000003ssQ-0gCK;
	Tue, 03 Nov 2026 22:44:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONEa-00000003ssD-1rd8;
	Tue, 03 Nov 2026 22:44:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2054B40BC8;
	Tue,  3 Nov 2026 22:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBFC1F000C1;
	Tue,  3 Nov 2026 22:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793745844;
	bh=eCpLb2eSBdU7oOnz3uYs19P+wbMVKJaOGnZyAlRZ5JQ=;
	h=From:To:Cc:Subject:Date;
	b=aBr6vEaoSaSIlgo+yE1NlG5IxyzfubHlr6a8X5qUV4/pTRXFKDPZ7nBg+zAMGGqfe
	 +A/nPSln2hNiF7yICWJb4QNGaY/boYgyl1PoM8WJHw+PmE0Y51jF8Q2mF2zy/5Kopc
	 wcHFTrwgsQMXjOSfNDytPdObM5Y68mpthtCeZDNyWPr5rQXZhnutZEE9lS02KYswPr
	 tmOiHV2WlWKwRV0NPmw+mgA6uUtnYP0pEg9YvAVyC34zuIM9XSKG/CY9ZjkVfeQxQY
	 24JoyvgVtYfqNbjfXDXo4gHNlkNbHXZZWbWupgyjqyaMgVdhmUkzLq5JbEv74E5do2
	 Kn+nx+B4B83oQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: James Tai <james.tai@realtek.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: realtek: Add RTD syscon compatibles
Date: Tue,  3 Nov 2026 16:43:50 -0600
Message-ID: <20261103224352.862662-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"syscon" nodes must have specific compatible strings. Specific
compatibles were already added to the bindings. Update the DTS files
with the specific compatibles for the RTD1295, RTD1395 and RTD1619 CRT,
ISO, SB2, misc and SCPU wrapper syscon blocks.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/realtek/rtd129x.dtsi | 11 ++++++-----
 arch/arm64/boot/dts/realtek/rtd139x.dtsi | 11 ++++++-----
 arch/arm64/boot/dts/realtek/rtd16xx.dtsi | 11 ++++++-----
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/realtek/rtd129x.dtsi b/arch/arm64/boot/dts/realtek/rtd129x.dtsi
index ba50e292bdbb..a7fb8dde1d60 100644
--- a/arch/arm64/boot/dts/realtek/rtd129x.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd129x.dtsi
@@ -64,7 +64,7 @@ rbus: bus@98000000 {
 			ranges = <0x0 0x98000000 0x200000>;
 
 			crt: syscon@0 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1295-crt", "syscon", "simple-mfd";
 				reg = <0x0 0x1800>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -73,7 +73,7 @@ crt: syscon@0 {
 			};
 
 			iso: syscon@7000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1295-iso", "syscon", "simple-mfd";
 				reg = <0x7000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -82,7 +82,7 @@ iso: syscon@7000 {
 			};
 
 			sb2: syscon@1a000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1295-sb2", "syscon", "simple-mfd";
 				reg = <0x1a000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -91,7 +91,7 @@ sb2: syscon@1a000 {
 			};
 
 			misc: syscon@1b000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1295-misc", "syscon", "simple-mfd";
 				reg = <0x1b000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -100,7 +100,8 @@ misc: syscon@1b000 {
 			};
 
 			scpu_wrapper: syscon@1d000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1295-scpu-wrapper",
+					     "syscon", "simple-mfd";
 				reg = <0x1d000 0x2000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/realtek/rtd139x.dtsi b/arch/arm64/boot/dts/realtek/rtd139x.dtsi
index e8af39193e75..11113999824c 100644
--- a/arch/arm64/boot/dts/realtek/rtd139x.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd139x.dtsi
@@ -62,7 +62,7 @@ rbus: bus@98000000 {
 			ranges = <0x0 0x98000000 0x200000>;
 
 			crt: syscon@0 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1395-crt", "syscon", "simple-mfd";
 				reg = <0x0 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -71,7 +71,7 @@ crt: syscon@0 {
 			};
 
 			iso: syscon@7000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1395-iso", "syscon", "simple-mfd";
 				reg = <0x7000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -80,7 +80,7 @@ iso: syscon@7000 {
 			};
 
 			sb2: syscon@1a000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1395-sb2", "syscon", "simple-mfd";
 				reg = <0x1a000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -89,7 +89,7 @@ sb2: syscon@1a000 {
 			};
 
 			misc: syscon@1b000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1395-misc", "syscon", "simple-mfd";
 				reg = <0x1b000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -98,7 +98,8 @@ misc: syscon@1b000 {
 			};
 
 			scpu_wrapper: syscon@1d000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1395-scpu-wrapper",
+					     "syscon", "simple-mfd";
 				reg = <0x1d000 0x2000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/realtek/rtd16xx.dtsi b/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
index 43b13d133c32..7f6e7a03f4e9 100644
--- a/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
@@ -143,7 +143,7 @@ rbus: bus@98000000 {
 			ranges = <0x0 0x98000000 0x200000>;
 
 			crt: syscon@0 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1619-crt", "syscon", "simple-mfd";
 				reg = <0x0 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -152,7 +152,7 @@ crt: syscon@0 {
 			};
 
 			iso: syscon@7000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1619-iso", "syscon", "simple-mfd";
 				reg = <0x7000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -161,7 +161,7 @@ iso: syscon@7000 {
 			};
 
 			sb2: syscon@1a000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1619-sb2", "syscon", "simple-mfd";
 				reg = <0x1a000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -170,7 +170,7 @@ sb2: syscon@1a000 {
 			};
 
 			misc: syscon@1b000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1619-misc", "syscon", "simple-mfd";
 				reg = <0x1b000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -179,7 +179,8 @@ misc: syscon@1b000 {
 			};
 
 			scpu_wrapper: syscon@1d000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1619-scpu-wrapper",
+					     "syscon", "simple-mfd";
 				reg = <0x1d000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
-- 
2.53.0


