Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CC7C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 12:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PC9YSbxdR9iJPk8oXBOZ5WVDNwyIOGESsfrnDMxeno=; b=AmLeOTaxIsNkNfC2m+Md/FBtsD
	C2u11Y6RnMQdjGjKYx0ez9YkSDfAIVoLlXrJ6oXMTaL7CMCHdZoc1CBANugk04zbVCGaBLZNxIHxO
	/aryrOJOVF0ehgqRigB2ZARow2SkQPvVShTXyxGKZmg/Mn1ROC8ty69y/MjztNtz0UWeMlSr5VR7a
	s1/uxp0cSw4NcPMT/NMzn07dukMt/L9j9Lme9w+5KbnB0alnK23/+aOpA3Y2mqD/EMopxpN3G5Oc5
	sOxlX7m9v4JQxy3v28r+MSAV67/1Xja1FX9DGcJCWKoRo+5IZCNRA+lDY5f9viqgBCibgpu/xsFaR
	u+XYPDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OB3-0000000CuHe-36IW;
	Thu, 17 Apr 2025 12:17:09 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Nwa-0000000CrDV-0jCz;
	Thu, 17 Apr 2025 12:02:13 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D18A925DFF;
	Thu, 17 Apr 2025 14:02:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTLTMcTzHm4d; Thu, 17 Apr 2025 14:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744891330; bh=6ZXpOpKFXe3BQmkcz2CtFn5gZTsYclZ9GbD4T6xOKbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lgc1Ii9q+HCq0tjO48u2cSjz4lhYMGVyVIMDSO6MRA67ndnRauaK9TG3tDkwVQbB9
	 uJEYAJGAlL3+CLPSC0rxF4BXuJuH4YtY4aHemKLf/mArgpb9Xtoh981ORsFWZfd/P/
	 uRJR8Dk9Tm5moIfbFNcO6+/5ajtEYrDiT/AiWe8tvAr/UMeKAeQ97ZRwRYO3Eo1O3i
	 Dkh7MLvi2z/tHiBuAoTAkGG1giLyTa9AGiP4jTFo4ciswujMBxllwjqIHAAcHVD9nB
	 22m7bEHlbH4jU8okBEr8mZ7cNzAQUPbVZK3UGd4zUAxJlkT4Aot8glBxQa1+Lb+UxS
	 E0vpi2H/D2AJQ==
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C
Date: Thu, 17 Apr 2025 12:01:19 +0000
Message-ID: <20250417120118.17610-6-ziyao@disroot.org>
In-Reply-To: <20250417120118.17610-3-ziyao@disroot.org>
References: <20250417120118.17610-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_050212_342925_8627E639 
X-CRM114-Status: UNSURE (   7.38  )
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

Radxa E20C ships an onboard I2C EEPROM for storing production
information. Enable it in devicetree.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 57a446b5cbd6..6e77f7753ff7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -110,6 +110,20 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m0_xfer>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "belling,bl24c16a", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&vcc_3v3>;
+	};
+};
+
 &pinctrl {
 	gpio-keys {
 		user_key: user-key {
-- 
2.49.0


