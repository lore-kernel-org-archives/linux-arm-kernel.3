Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9847CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 11:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XxrgoZ+nc2RW0uxcOjuabHAwk7p3VP8+2bqMXrJ39Ks=; b=oii+xeE/DFuu99C4BQUXUMRQXG
	t/q70/WKMv2ox/OcINzl9xl8RZML6sjlGJlsUtzPG1U2gX/+r5wG7BIaVAbZystoSwqtsdo/OvZtZ
	HLNB8tMKIOdeN7z10h6ktHmBGBi7buP9aLrvdcizIL9GvbhIFhNnLk1DtHYC9yc+dRn7/NiyxPTm0
	ZIdmthwcosU9+Z+GK2qIifRdvR5Z7lrcvHtimTg3fe+CAjwMxYZP5RLRqKDjn7/rfSa6x2LyWILPd
	bjVYylZsdOvi0krM+EAuJT/m0s+HpiUZju2lZ4dAWPrpuA0zk9xBY9vcJpWfGIpcAQS0MjXEON9Jz
	K/IdD3UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0zY-0000000Al4X-0cec;
	Mon, 01 Jun 2026 11:39:36 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0zU-0000000Al3Y-3Eod
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 11:39:34 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gTX743Mcsz9vDB;
	Mon,  1 Jun 2026 13:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780313968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XxrgoZ+nc2RW0uxcOjuabHAwk7p3VP8+2bqMXrJ39Ks=;
	b=be8wmpxdlxU7iEYeGhrAGv85VtawF3x4n6x+m9vkn0BXDKBbN9mwG9UUqmW3JuBlsApYdY
	2e1AS3wCGeKCb+oAb8CLwnhsxbxKpXP+Kz9PlxVvcC+bpM8XBpSVMCXNhAyVgR6XMVQR23
	vbpQRXPKggz2AEMeFTI65B485uNUObdCzJ65Q9iucWVV6Q/69oTYOavkL+i+L92Or/Tt30
	4bMYZwlItnjC86XgLBMAtdl5fw5jUw3xm/hilLKC07uzdFpPGsnckLv9VgZ9OL59W9agvl
	cB/0LPKPWK8pMXWNQehPAg6ZZilZ0p1eFVDhJbmFj/EEmN1I/6a9jJ/TxbZWgA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=WrsJPmTO;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780313967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XxrgoZ+nc2RW0uxcOjuabHAwk7p3VP8+2bqMXrJ39Ks=;
	b=WrsJPmTO683K9T91scDLcwy7xNy7qdnCl610OhxPHPdEyCZmEBqSrzjdlQwCMN6fLGt6wd
	h7EdVBrkMMr86n2VR4pXTELwNE96Y9PRTpczPeJ3OUTBt6x23eDgw5JVeRwHfs4a+3OJxd
	67HEeW+UlaFpcmYLq87PNAQABFpnsvNewG2pE33JB8SAKM/wJ0Tlsaxh+2Xj9N+4pMjypB
	7SPi4vetUOQRyGmhA6aIXvjuSYXg2R00izOi+QUsG+5lRTliZJ65OOrn/ZRqMheBKgAdZy
	/PglDpctlLhPeZvEFrEfpdhsv91kfRrxsONrMk+iPBtJ5lEa0Yp8WNP6OehJlA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a78000: Enable application CPU cores via PSCI
Date: Mon,  1 Jun 2026 13:38:51 +0200
Message-ID: <20260601113919.8327-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0ffa117923e49be64e7
X-MBO-RS-META: 6t6yf5ce5dbmbzistm9f7tgmeqcmfg53
X-Rspamd-Queue-Id: 4gTX743Mcsz9vDB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_043932_954862_E204E44B 
X-CRM114-Status: UNSURE (   7.47  )
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

Add PSCI "enable-method" DT property to all application CPU cores.
This allows the OS to bring application CPU cores up and down.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
NOTE: This depends mainline TFA 2.15 or newer (or SDK TFA version
      which includes b950bc09f5e9 ("plat: rcar_gen5: Fix multicore
      boot by ensuring fixed address for plat_secondary_reset"))
      and on SDK 4.32 or newer SCP firmware.
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 7780fb4e8351d..fb71974ef3905 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -143,6 +143,7 @@ a720_0: cpu@0 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x0>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_0>;
 		};
 
@@ -150,6 +151,7 @@ a720_1: cpu@100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_1>;
 		};
 
@@ -157,6 +159,7 @@ a720_2: cpu@200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_2>;
 		};
 
@@ -164,6 +167,7 @@ a720_3: cpu@300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_3>;
 		};
 
@@ -171,6 +175,7 @@ a720_4: cpu@10000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x10000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_4>;
 		};
 
@@ -178,6 +183,7 @@ a720_5: cpu@10100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x10100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_5>;
 		};
 
@@ -185,6 +191,7 @@ a720_6: cpu@10200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x10200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_6>;
 		};
 
@@ -192,6 +199,7 @@ a720_7: cpu@10300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x10300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_7>;
 		};
 
@@ -199,6 +207,7 @@ a720_8: cpu@20000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x20000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_8>;
 		};
 
@@ -206,6 +215,7 @@ a720_9: cpu@20100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x20100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_9>;
 		};
 
@@ -213,6 +223,7 @@ a720_10: cpu@20200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x20200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_10>;
 		};
 
@@ -220,6 +231,7 @@ a720_11: cpu@20300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x20300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_11>;
 		};
 
@@ -227,6 +239,7 @@ a720_12: cpu@30000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x30000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_12>;
 		};
 
@@ -234,6 +247,7 @@ a720_13: cpu@30100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x30100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_13>;
 		};
 
@@ -241,6 +255,7 @@ a720_14: cpu@30200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x30200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_14>;
 		};
 
@@ -248,6 +263,7 @@ a720_15: cpu@30300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x30300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_15>;
 		};
 
@@ -255,6 +271,7 @@ a720_16: cpu@40000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x40000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_16>;
 		};
 
@@ -262,6 +279,7 @@ a720_17: cpu@40100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x40100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_17>;
 		};
 
@@ -269,6 +287,7 @@ a720_18: cpu@40200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x40200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_18>;
 		};
 
@@ -276,6 +295,7 @@ a720_19: cpu@40300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x40300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_19>;
 		};
 
@@ -283,6 +303,7 @@ a720_20: cpu@50000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x50000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_20>;
 		};
 
@@ -290,6 +311,7 @@ a720_21: cpu@50100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x50100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_21>;
 		};
 
@@ -297,6 +319,7 @@ a720_22: cpu@50200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x50200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_22>;
 		};
 
@@ -304,6 +327,7 @@ a720_23: cpu@50300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x50300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_23>;
 		};
 
@@ -311,6 +335,7 @@ a720_24: cpu@60000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x60000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_24>;
 		};
 
@@ -318,6 +343,7 @@ a720_25: cpu@60100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x60100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_25>;
 		};
 
@@ -325,6 +351,7 @@ a720_26: cpu@60200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x60200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_26>;
 		};
 
@@ -332,6 +359,7 @@ a720_27: cpu@60300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x60300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_27>;
 		};
 
@@ -339,6 +367,7 @@ a720_28: cpu@70000 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x70000>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_28>;
 		};
 
@@ -346,6 +375,7 @@ a720_29: cpu@70100 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x70100>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_29>;
 		};
 
@@ -353,6 +383,7 @@ a720_30: cpu@70200 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x70200>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_30>;
 		};
 
@@ -360,6 +391,7 @@ a720_31: cpu@70300 {
 			compatible = "arm,cortex-a720ae";
 			reg = <0x0 0x70300>;
 			device_type = "cpu";
+			enable-method = "psci";
 			next-level-cache = <&L2_CA720_31>;
 		};
 
-- 
2.53.0


