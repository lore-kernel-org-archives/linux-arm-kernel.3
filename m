Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CE1C0219C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54iXlGsz9B7Sdyg3RzGURwQveukxIgeMMUfxlEzdSXs=; b=LgwgMZq8VA9aM675gpf+Um/yUG
	l/k7sZUI2tT5tKbJbCl6thNIumQxmFEkLkOM3Bf36D8jZCv3Io1dfR1eY+CXo5XFHQf9sd1soZrm8
	XVQQ6IpmIzA/Nr7iWFjZf3f4Bn/QR1HD1IjxHTc5wRPhDEQXDLhZhbeL6U3P2Kud1Sh8Myctjw/U/
	pieHgbOodXwx8g+ZT1eANdwuUKc7JVzZ6DLJJIb9MxpRDK4FcAed2AN6R1S3YLtgEsFLBWbRW9yN2
	ue3Dbko9R/oJy5r4YhqxHWcccCqeWGl+CdIx6SthjILOasgnL30R9AygnC7dXR5Rpn4zWLd7+QgM8
	pT1QsJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLCD-00000000sU3-133d;
	Tue, 04 Feb 2025 15:50:41 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKz9-00000000qMB-0CDY;
	Tue, 04 Feb 2025 15:37:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738683408; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M+jJ3zCjDsjDnu5p0IcsJGhTZbjO3H5WonEDeYztF8vGnaOlUfdssDT2ughk8sAij6nxTVcFzhIdgZTnxryv545JhTq+VrjfQaHRu52JZecT5XZ+yNjxNBL/OBwT+LQ0kyjRqB3MG3MIggeB1gopNjQ0Py1nAZGfFhqe1kYdOMU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738683408; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=54iXlGsz9B7Sdyg3RzGURwQveukxIgeMMUfxlEzdSXs=; 
	b=R2mOS4nKAKumwAndqcYf6K2rnSvuDQXg8WwT7aNpWhkGDXgFu+NO8EMQGGOsQnrQGAu4YcSOjie5II/YCIHP+X6M9KZZ34eTk/TaytRbTUGNew99kmSjy5fB4RkyNfpQ9cbYu4TT10Qb3suF6DZ4m/Mv0dFsKBV3d5bdFSBTRic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738683408;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=54iXlGsz9B7Sdyg3RzGURwQveukxIgeMMUfxlEzdSXs=;
	b=KF3VZuAJFP5QPbkxC8awh5M+FfkmEf/aZLK/FuqXZ85aHe4qIsJcVom18JTduGLA
	KmokPTb6ARVgyLMwXSB+ADu7j2yu8cQM5Ht7nQ3nWVSQbuMzjrg8pJivYZcdztaQ5H+
	sY7JxC3Hd0VWttyjqiuDoM5NAYuZjXdfTin27Tb0=
Received: by mx.zohomail.com with SMTPS id 1738683405706315.2089997355388;
	Tue, 4 Feb 2025 07:36:45 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 04 Feb 2025 16:35:51 +0100
Subject: [PATCH v2 6/7] arm64: dts: rockchip: Add rng node to RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-rk3588-trng-submission-v2-6-608172b6fd91@collabora.com>
References: <20250204-rk3588-trng-submission-v2-0-608172b6fd91@collabora.com>
In-Reply-To: <20250204-rk3588-trng-submission-v2-0-608172b6fd91@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Daniel Golle <daniel@makrotopia.org>, Aurelien Jarno <aurelien@aurel32.net>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_073711_151012_00D04C16 
X-CRM114-Status: UNSURE (   8.70  )
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

Add the RK3588's standalone hardware random number generator node to its
device tree, and enable it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 8cfa30837ce72581d0b513a8274ab0177eb5ae15..3cb52547754c2b64ee2dc0e08c23decf9773faeb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1921,6 +1921,15 @@ sdhci: mmc@fe2e0000 {
 		status = "disabled";
 	};
 
+	rng: rng@fe378000 {
+		compatible = "rockchip,rk3588-rng";
+		reg = <0x0 0xfe378000 0x0 0x200>;
+		interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&scmi_clk SCMI_HCLK_SECURE_NS>;
+		resets = <&scmi_reset SCMI_SRST_H_TRNG_NS>;
+		status = "okay";
+	};
+
 	i2s0_8ch: i2s@fe470000 {
 		compatible = "rockchip,rk3588-i2s-tdm";
 		reg = <0x0 0xfe470000 0x0 0x1000>;

-- 
2.48.1


