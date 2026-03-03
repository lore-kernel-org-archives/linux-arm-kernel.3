Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8F0E67A8F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 07:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NeEpzRQmj9HQYB43w5IF2yW5cBIjWDjGe2ippJ0Ds4=; b=4D+cnO/BUmLxcCleW+5P18U/OI
	3gYLvA+dQ6YUjcedYror68N9r2Anrv/Hlyc++qy05yV9L5HorLhxje7GgRaizfJ5K+CuCWfDEoD/w
	/+/llLpt0odFPN/gvWx8Ah11DbTlX+WU+YPHei68hWrdLOi5I6q4qlr/Z5SfoSzM6scA8R3ang34K
	IgGKbleadgNFZiwpR/E0o9sYPWpRD0qxrMDbdsusjEz7TOoscjuQimsfgaDKgSTrJuXUWtUsoh9/O
	/UdGY93FU7UDJtLByYmAqtbdTOX32UhSxa4fiCOhstomIzjUwqKQ4AeIju8Oq4s+tJS0XICe57PvH
	yuyTzICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCT-0000000EfsK-1O5u;
	Tue, 03 Mar 2026 07:29:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCR-0000000Efqs-2xEf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 07:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BFF060126;
	Tue,  3 Mar 2026 07:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B56C19425;
	Tue,  3 Mar 2026 07:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772522986;
	bh=elY+CZyZdiBR2XlC4Wmh1wlATCX04DwIBCppVpV7a+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=klxPeg5Eias12xHchKofvWiQBGdpoHmAstyiuc9UCUy4mUNibX3v1HvMQlDchhoaP
	 n4E1m8EA6hrfVUG+2DLiABSxlag8hAQD6g37N6q/xiPilO2w/9o1KBOwBH7tXgqWLZ
	 ZKbEBdh4AWNKJBlO1DDmXYUIXsXuf7S2MPYLE728rvqrQ1eFaCRov/kxZt9AIPTHi4
	 eeBqIu/CZ2z9UG6HKQpzZSojwVT8cwS7uKRwZo+wDa7ZDIajFRMpgJHZNbrvklabRi
	 k7fYjh7HyZGGWHv9sVSoMlMaw90KJYWUP3CP18cOnh5CMgqa5mukBpFWFKOaM3VRg4
	 vY4TdZ5WK1+sA==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 03 Mar 2026 08:29:35 +0100
Subject: [PATCH v2 3/8] ARM: dts: gemini: Add SSP/SPI block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-gemini-dts-fixes-v2-3-5b92ced841ce@kernel.org>
References: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
In-Reply-To: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Add the SSP/SPI block to the Gemini device tree.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/gemini/gemini.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/gemini/gemini.dtsi b/arch/arm/boot/dts/gemini/gemini.dtsi
index befe322bd7de..23e68e17ffbb 100644
--- a/arch/arm/boot/dts/gemini/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini/gemini.dtsi
@@ -61,6 +61,12 @@ mux {
 						groups = "rtcgrp";
 					};
 				};
+				ssp_default_pins: pinctrl-ssp {
+					mux {
+						function = "ssp";
+						groups = "sspgrp";
+					};
+				};
 				power_default_pins: pinctrl-power {
 					mux {
 						function = "power";
@@ -228,6 +234,17 @@ intcon: interrupt-controller@48000000 {
 			#interrupt-cells = <2>;
 		};
 
+		spi@4a000000 {
+			compatible = "faraday,ftssp010";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4a000000 0x100>;
+			interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&ssp_default_pins>;
+			status = "disabled";
+		};
+
 		power-controller@4b000000 {
 			compatible = "cortina,gemini-power-controller";
 			reg = <0x4b000000 0x100>;

-- 
2.53.0


