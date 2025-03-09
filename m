Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F60AC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 07:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z627OTkHKGpwKIKLrrsH8jzNXVRCNDvstmTgUqmzlZQ=; b=LKIi3EpwOQtvmo4vT+Tm3x8Jw9
	uQw8MWShJpAJih4HdPJWaMGWjnPed9rFurAN4XnnYgagkTNZc0HJ3UssEnZBdXgWwD3KpVq34Z85z
	ljYyyxC/YkKaMPFVvJDMvoXYLLDf6VPLHAh+z4cjpYRKs6mHZ6+s+w1/F6j0wcACSIoP/Pqz3eWVM
	F4nnCBAjqpm3Q25B2AnXOg5D0GKaRkCdu4ZM2Y35av/jsbNdYOSUQteEUOLjTtJhIOj3FmePTLyYa
	gG5jN5qsQMiy7WiH05Ke/ZuE8meaLWlE86+MOH9RX6j2XNI8KdUWtSY+MADzXlfjVnkV/r8+Nv7y3
	qEOK6AEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAp2-000000006Sx-0t4X;
	Sun, 09 Mar 2025 07:11:40 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAkN-0000000064v-2EuZ;
	Sun, 09 Mar 2025 07:06:52 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6ED5125EA7;
	Sun,  9 Mar 2025 08:06:48 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5s36HJaxT31; Sun,  9 Mar 2025 08:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741504007; bh=YZ1NsQ1LjueMRWx5/RoVphfcn/yEKTPpf10GAJTNcmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JDh0VXQSKXAliQQF/zxU6fQcqg1cc4yIDhJMoInrGxY5AE6wY5Z2RFVdZt4uJghho
	 A95cxH/N6VJhKASlkbfX0fKpJsASyFEn/vDvQLwude6+eKM48pauSIOmw2OYvhiZFX
	 vhLYYunQSG9iK5551JyaMjSy7kRj25yXmRBBz9aq4N8f0V4q1I1g4obSYpK3Ex7NM7
	 d/oIa4sANlCQe/5ZcaATnh/B8KKY2MneeeTZyRuci88+IYNCeESrGHM1RAkBT0ddqq
	 9YSanSlQkhd4nrfSw3P8EOGLBYIN4NfK+JRYCgf0nuMkSWLijg3jjlLxMmrFWdNjIf
	 ZIK4KeX67CfzQ==
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
Subject: [PATCH 3/3] arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C
Date: Sun,  9 Mar 2025 07:06:03 +0000
Message-ID: <20250309070603.35254-4-ziyao@disroot.org>
In-Reply-To: <20250309070603.35254-1-ziyao@disroot.org>
References: <20250309070603.35254-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_230651_702892_0AF6E306 
X-CRM114-Status: UNSURE (   9.29  )
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
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index b74e605a5a82..ddcf690eb513 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -122,6 +122,19 @@ vccio_sd: regulator-vccio-sd {
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
+		vcc-supply = <&vcc_3v3>;
+	};
+};
+
 &pinctrl {
 	gpio-keys {
 		user_key: user-key {
-- 
2.48.1


