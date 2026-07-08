Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4417CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sa+hq1ddPX1RzBXoQyE6BmGgQ/wGb1XIxI/SPhDUhIA=; b=j2tuKImdMPLxx22TTZoc1K5hK9
	KoPYCPKDOrG27EFfyV0lfQboW7GdeVsu9ozzuxbhEkZ7aBvTUfwtVnpKiOhL/WIoJkFsCoXuOkhLn
	ZXbnHQk3b2p6FQuiCNTFYoqRbHuXUF04zPIPHBdPDTMgiJ1nGgMyJPmGS2bF2CeLjyHtDBDvy1v+Y
	Lbbsg+yx4wr1zb31/mVxPQueqmSdlZSzQBVNdQykcl2COHlSRIk0aZDe3Z4kCBqv9cA0SHkkNa/W9
	BOhThB9WwPNeMau1Zc7sIZpn0sz6r+7bpwkOXpgL44K87nKTvfsyyPVXSDo2RCI73aG/rHIBzc+6r
	9Lbt8D8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whWYF-000000008rn-3cWU;
	Wed, 08 Jul 2026 17:59:15 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whWYD-000000008og-2FH4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 17:59:14 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c126e47a82cso126834166b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 10:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783533552; x=1784138352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa+hq1ddPX1RzBXoQyE6BmGgQ/wGb1XIxI/SPhDUhIA=;
        b=o5Ji96B6TBLWZCt5T6m14NEGU6qdQyYUd9wHcap6geAEogu/ircpZqhnNa7NndXtQi
         35DqSEhzChACTfynFC3Okr3l10ZF6ZBFpccf5WxvOYr3dBMUNvXBJHBoFMioj1Yy+38N
         ZKhS04sKeJcSRXnAP45MCSWYWCdx18Qwnb+TfKqxC3Tl56KEvVNq1Uhx7Hg1C+tQp+7Y
         Wn5cgVspeVeCHukePcnd9mN8CfJm39uBet5goke/uLS3hHGGT5aLlMQmRR36anhDDu5b
         7jVTiKbPuipk5nudr9C7Nn3ulTtAz/xiORBd+kkaVUljpnCTyR6UkMy68CDN9guCEY4B
         XbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533552; x=1784138352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa+hq1ddPX1RzBXoQyE6BmGgQ/wGb1XIxI/SPhDUhIA=;
        b=WRrO5+XkNVcoc8v2VPk7SLeFCQ4mcd6rpN9vgFqLXzTjYfG7tY0dX46n97b/i7ivnR
         UdSVQTvnMXqWdj659vEZlKAn40XNXTB91o4U5XB2RK67n90ok2ulUa0aVtn1IX5yQjng
         L49vvK7RCijAR5N90dbyYbZ2dMTw42mUYCa/2SVhmGhaSYf0hYxWfFu4EZkSoBByVrTx
         aH5HmpebLfot6HjwgxKDBM+DOofB0yXy7v9c1wZkIty85cB/32NYKySKLF0+RJvfYJgH
         Kk9Km1sA/Y0sBpO/XZbh474O7JJpsr4xCrXQfF7+Q4E4fmMk6q/+RgLgLy2rDJlb+HKL
         RM1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoJK0qElwmWNd7Fnt7t8TcAzFlLO3wSAOSzccYsMiDPtJJ0CE7jC9+rcpiw4DKHPj1kSYEqAVqoZ0o/1J616q+3@lists.infradead.org
X-Gm-Message-State: AOJu0Yyepq77fQEfmaYX8gC+bW9hfm28C2r5gddHQQ1kQxc2DpuRSqmQ
	YyzDydwabqNdcyemG/qc9Fp6/RadsLm7oqzvQeaDnyF5IdFvmFOo36wB
X-Gm-Gg: AfdE7cm+adlRl6rz/iWLkzc0q4ODSt8cq/gmF1/5QPuyqO0BiHZbRmtGUeMwUQ8hVao
	TqUYH03TccFP63HbVwAhjQo3majIkzVlZjOQcA4r2aYwY8Oe/UAkP99QEK79FxLsKnrLaXVTJHb
	AFE86KUN8Yj6v1KC8fNC1m1qW2Vr19MogVXVhNQf7/i1W2OiGW0cs8njnirEpNAZSC9nCUmBiPA
	EHtcIwlsDjiDqHoxaOD8EJ/8Cr7D6voW8tNSb0+1p263RB+lAHNQOE6u1FvsbPjhzSVb18Nnut3
	XYbnPuqJhsrtCHOEni0JFXRhTQsz6qAttnhJ3gGseaz+HbGsFeOIpe1n4GlnMuDlwHIJso63ybx
	t5JrBIkSMMDauDilKa6EionlFcx760Mkn2c0KJ27aZ8MlDkfgZsva7G9nQb3A6r8gGJKrYj29OE
	MBnCu71g==
X-Received: by 2002:a17:907:9406:b0:c12:6a72:5882 with SMTP id a640c23a62f3a-c15cde71af8mr169523166b.5.1783533551631;
        Wed, 08 Jul 2026 10:59:11 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bcc26sm357653666b.34.2026.07.08.10.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:59:11 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Corentin Labbe <clabbe@baylibre.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH v2 3/4] arm64: dts: rockchip: Add crypto node to rk356x-base
Date: Wed,  8 Jul 2026 18:58:24 +0100
Message-ID: <20260708175837.1718437-4-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708175837.1718437-1-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_105913_600966_81014690 
X-CRM114-Status: GOOD (  13.25  )
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

Add the device tree node for the V2 cryptographic hardware accelerator
on RK356x SoCs (RK3566, RK3568).

The IP block sits in the non-secure peripheral domain. Its three clocks
(core, aclk, hclk) and reset line are accessible directly through the
main non-secure CRU, so no firmware intermediary is required.

The node is disabled by default; board files that wish to use hardware
crypto offload must enable it.

Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd39..9de7e7487ca1 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1112,6 +1112,18 @@ sdhci: mmc@fe310000 {
 		status = "disabled";
 	};
 
+	crypto: crypto@fe380000 {
+		compatible = "rockchip,rk3568-crypto";
+		reg = <0x0 0xfe380000 0x0 0x2000>;
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru CLK_CRYPTO_NS_CORE>, <&cru ACLK_CRYPTO_NS>,
+			 <&cru HCLK_CRYPTO_NS>;
+		clock-names = "core", "aclk", "hclk";
+		resets = <&cru SRST_CRYPTO_NS_CORE>;
+		reset-names = "core";
+		status = "disabled";
+	};
+
 	/*
 	 * Testing showed that the HWRNG found in RK3566 produces unacceptably
 	 * low quality of random data, so the HWRNG isn't enabled for all RK356x
-- 
2.47.3


