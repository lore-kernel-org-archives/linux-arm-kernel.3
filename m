Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287F9CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuOlYqld5kQKP6/uNDvi8w+JMtWorT85t5I6G7jNhHs=; b=D5QAXHdUAHFJR8+dyh9FNtDJay
	GDgkgBl5Tq/7PWlaFF3l1zLstfZaBz30aTkI30h2YLVy5SQ8o2wOeDfXjb8CQcxKAdMX/xZb0d3G8
	svmhK1Js4oinCKv1XMXlr+JuF/p4YASETFN1JVAKPYysDUI9VLutF51RhjpATwt3JmbGfwCNXaZGT
	D9AO4UOr1PCJamjauAJLM/DcSOUCqo6E2YPts/DGqw4sW8tK6h1TNH6hi4+P/N/SWh0AMnp+GxQ0p
	n+9JZ+T+S+Sd0Co++a8gWqN8EtKw/glzMhyg2GHSN86cdpj1TfmVOyIZvzoxuApgcel5mTAdvIDTG
	Huk0QSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdks-00000002Oth-00vb;
	Fri, 16 Oct 2026 08:57:34 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdkf-00000002OcE-3quq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:57:24 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cd1006978ecso358456a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 01:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141041; x=1792745841; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VuOlYqld5kQKP6/uNDvi8w+JMtWorT85t5I6G7jNhHs=;
        b=gIXYfaFNootugc56eSEHn8K4BEaGH9uW8eqqjBs1oswj40otCIDioqH/CUxf8RfAuA
         IRAbst0RWr+Ps7iSI2JIgN1vaETHk9QuqIurmeM+JR7m8u3n9Nu9Vb+JjLi7BjF+dA7f
         bKEAgWGx7TJSgdW0Iu9tigLPQ3uMKPJ5+gDNOeXufJ8suzhHsjrgkRdUr/+t61z3xmJd
         4aU9QHlX2pF9lYcLdLX4td/U5eIR4Q1At74BL6kY6Fca48f7H7qNjF7rHGfcF/OvHmx6
         syfLQtuIuor4oLsWnl9Gq9K8wtAYXsKrdSzkHDPhNCZNzGcOK/CmKaBaT+VgRaElBp72
         3v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141041; x=1792745841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VuOlYqld5kQKP6/uNDvi8w+JMtWorT85t5I6G7jNhHs=;
        b=yKgidVWQZ1/MGt7saPykmhJww0cz06cI/8rRyZQ0TKrIxD3J4C4oWvQp9Y2ck8EAWc
         TSkb5WQjFAthN/KeIaFcja22tBBZP3QQtiYiPggTRn64B+TCzHO/u6p7BrQd3Wy3j8Z+
         FfBcYr08HUZfyXa/QZGM1bIECCZnn1OpzfvOBoUY1tfRfgGLbQGNQ8MMKXsKqVSsg54S
         zP7z0rtXKmm7upYm+ZQ3P7+lfsWidc4+q/6uRNiscJYWoKU+PG5RfAO3AfRQrQIWj8G8
         9QvrOksDHVtsas6jwdnH/fMoVFnAF/neLZI7DIkjPYG0mRnE9tS/UsqJk6iw7CAg9+77
         7kVg==
X-Forwarded-Encrypted: i=1; AKwUvByZ6PD7ipxCR2bhs4J7IU6+NQjNf5ntgoKzm1+g6MvRPlO+0FhaU0xJj8QkovNuRJVYi7BQYMi+fzraZOaO50Mp@lists.infradead.org
X-Gm-Message-State: AFq9FYL3tQPlhOd4yThdjUA2fq0cRTDHj+FxSCB7i21HKXrpJ5hz7WX3
	bv2bVPnICbpWgGqzNNY2Em/Zqx/7siYGJiwJR7sYY3ZNNFWK/fRAbkQT
X-Gm-Gg: AYBFou0/yJPvV34NC3wp/lU8LhJ9SnZSHfunMPzOIwEO0zx6yBZXEP1LkEZ9lP2waXX
	I3uLwZkKxsmF1IjtXymKcfkV+6xcr2flBoUcr/zzSqkBIO7ZHRMuEMGkPV7vyNcyJXFRzRyPR+r
	stTas/zyXgEx3tJfVyycr2Ftx4+68RSOkj0snB0Atj/xjgoBjPFNl3f7lJqROBIWLSV0B4jM6rT
	94a69MsOCAlirF7Hdn1LA93fZ1kJBXJeC0s20SyKz5J6Lh3kupLaLXt4xG0hAyt7x63iOfcO/5H
	A2249X1QTizdtbhOG/taoBsXSw2PzZa1l2K/zlrqOT89TlyfmFK2Y82aXy2nbxS5lRtqSmFrcaN
	flI+LsHnaYTTIvzGqTAQAdAJ8JKiTCIedT/OJagZUW2Yrz8rR0gouTFU0fpEDQZFDCyhubDg/VE
	Vs+iC8/ECkYV/Ukth6bCzMpDJZ1iOC4MvbfXvVoIkiXtXdUd2A97iBSfYxGdr4s2nNZUUCf91Ua
	5wv1/xkD1WDErGziCNpV2ie/TgCnA==
X-Received: by 2002:a17:903:2b0b:b0:2e9:65bd:62c7 with SMTP id d9443c01a7336-2e965bd66e8mr71321655ad.0.1792141040552;
        Fri, 16 Oct 2026 01:57:20 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:57:20 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:42 +0800
Subject: [PATCH v5 8/8] arm64: dts: rockchip: add mipi csi-2 receiver nodes
 for the dcphys on rk3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-8-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=2717;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=45Vrf2/gUP59T6NzCoulPq5BhPIFCtcRAs06OTbCzKM=;
 b=eV5j0Ku70J/SwIYITZNqaBAM4+oArZCW1gHMYmzwcCjICMvYtJVzPGrN4pNjb2YAnqgdR1JmW
 QRDZGk+6fb0AGvQEIOdD40NiINRZQcSPgvqp/0vE9+XFZSQzix1cCh3
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_015721_974594_980D5204 
X-CRM114-Status: GOOD (  10.12  )
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

The MIPI0 and MIPI1 receiver units are connected to MIPI DCPHY0 and
MIPI DCPHY1, whose receiver side is now supported. Add the two nodes and
wire them to the VICAP ports.

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 68 +++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 94d68fd89753..30bc69a09102 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1516,10 +1516,18 @@ vicap_dvp: port@0 {
 
 			vicap_mipi0: port@1 {
 				reg = <0x1>;
+
+				vicap_mipi0_input: endpoint {
+					remote-endpoint = <&csi0_output>;
+				};
 			};
 
 			vicap_mipi1: port@2 {
 				reg = <0x2>;
+
+				vicap_mipi1_input: endpoint {
+					remote-endpoint = <&csi1_output>;
+				};
 			};
 
 			vicap_mipi2: port@3 {
@@ -1568,6 +1576,66 @@ vicap_mmu: iommu@fdce0800 {
 		status = "disabled";
 	};
 
+	csi0: csi@fdd10000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd10000 0x0 0x10000>;
+		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_0>;
+		phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_RX>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi0_in: port@0 {
+				reg = <0>;
+			};
+
+			csi0_out: port@1 {
+				reg = <1>;
+
+				csi0_output: endpoint {
+					remote-endpoint = <&vicap_mipi0_input>;
+				};
+			};
+		};
+	};
+
+	csi1: csi@fdd20000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd20000 0x0 0x10000>;
+		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_1>;
+		phys = <&mipidcphy1 PHY_TYPE_DPHY PHY_DIRECTION_RX>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi1_in: port@0 {
+				reg = <0>;
+			};
+
+			csi1_out: port@1 {
+				reg = <1>;
+
+				csi1_output: endpoint {
+					remote-endpoint = <&vicap_mipi1_input>;
+				};
+			};
+		};
+	};
+
 	csi2: csi@fdd30000 {
 		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
 		reg = <0x0 0xfdd30000 0x0 0x10000>;

-- 
2.43.0


