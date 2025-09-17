Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF75CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GxweiOVVTcEgVbzVlG+QY4Uckoc7fpLW+fnTNbNLkg=; b=T4M3SyKiQ8GujHNKO7iFr8OZwZ
	FrRkgaNifyrVa+5OPwMVRgX54BISj7wqLd5t8/byWfAB420uuQKFKvCJjQVINbSO9a/QyK/WvXvse
	VVPBZHQgPsdRSvqLZvAFbAAbWMNbDvxPSwo9zK5JL+kJs/hbgTWSdCOSt9Rd3CcSRGZh6q0Y3R+hz
	qwKiKA7c+rAY3j1vajdR0P2/E25Rm71UGpFaglYCnBeM99tQWDAAxpt4+msdLb1PVuqnDxU8Vgb00
	4ieDKdOzzFKkR8f+z2r7Mv3+AlkS3lAj9IMFJfS+Psj7cVhGV6VVosHRXUsWhtt609SoHw+EwhzLU
	6DsqtvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqh4-0000000BBVF-2n0Z;
	Wed, 17 Sep 2025 11:51:26 +0000
Received: from mail1.nippynetworks.com ([91.220.24.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqh3-0000000BBTv-0smp;
	Wed, 17 Sep 2025 11:51:26 +0000
Received: from grunt.nippynetworks.lan (unknown [94.228.36.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lists@wildgooses.com)
	by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4cRcYR1NVHzkd2x;
	Wed, 17 Sep 2025 12:51:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
	s=dkim; t=1758109883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/GxweiOVVTcEgVbzVlG+QY4Uckoc7fpLW+fnTNbNLkg=;
	b=cAl2XOq+1DTiWZUTOf9eSqTYc8ZrsOs3EmhV62esiHsvB8JkqJ7y3Yjifv2AoqHinHsYRR
	1fqM28Ob/n7PS5IpdT4dHmk045b1EtTKwUmM6C3UwI4TNTbjzTdrlxhfCw1vDuDO4ZqM8U
	Xh0ncBjWaVNfo2OnS/eu76YQYoe5Mfc=
From: Ed Wildgoose <lists@wildgooses.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ed Wildgoose <lists@wildgooses.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: rockchip: correct uart mux for Radxa ZERO 3
Date: Wed, 17 Sep 2025 11:49:30 +0000
Message-ID: <20250917114932.25994-2-lists@wildgooses.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250917114932.25994-1-lists@wildgooses.com>
References: <20250917114932.25994-1-lists@wildgooses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_045125_377726_DF2E1815 
X-CRM114-Status: GOOD (  10.37  )
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

The rk3566 has multiplexed pins and the uarts can be moved to a choice
of 2 pin groups. The default rk356x-base.dtsi appears to default to mux0
for all uarts, however, specific hardware might choose to implement
alternatives

The Radxa zero 3 shows that is uses M1 for uarts:
- uart4
- uart5
- uart9

These aren't normally enabled, but we should at least correct the
default pinctrl definitions. Without these changes there will be
conflicts with mmc0/mmc1, leading to the SD or eMMC going missing.

Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
---
 .../boot/dts/rockchip/rk3566-radxa-zero-3.dtsi    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
index 1ee5d96a4..41b3c4403 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
@@ -492,6 +492,21 @@ &uart2 {
 	status = "okay";
 };
 
+&uart4{
+    pinctrl-names = "default";
+    pinctrl-0 = <&uart4m1_xfer>;
+};
+
+&uart5 {
+    pinctrl-names = "default";
+    pinctrl-0 = <&uart5m1_xfer>;
+};
+
+&uart9 {
+    pinctrl-names = "default";
+    pinctrl-0 = <&uart9m1_xfer>;
+};
+
 &usb_host0_xhci {
 	status = "okay";
 };
-- 
2.49.0


