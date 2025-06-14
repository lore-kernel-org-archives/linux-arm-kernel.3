Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C320EC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 18:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apK2Hae7QVQW8sVcfdULJFrMHKxa3eLsLFIQMUAHMeE=; b=I027pPYPFTX7IofH8UhKcyZUVh
	dueio2Wv9fs/5osihHFVXdsQcl3l5gxtk4HGH1Op3I/PD5kzUh/UOa4skmQ0zonvfdBfKwKbBfd0r
	4hlC/DWHQ5EO7WuZoAwF14ZUIx+/DISUYGuwtFC5Afdd81+Rebq+NnFwS8p4jgUIXeB4JuMQ4/3mt
	aTL8XDUJ3e7rpFSP6vkhA7sYM7dXfoVnTGsXMFAni02PrKAE6KpL8I4dFkxUM7EdJpYEMGByAgRVx
	tjDjyaWGvP+l+uPpU+I3CYypHODsiOgFhbnPjVF4lq2wkTzUdd4p/b1u65HqfOxFAgDy/xClkKsIH
	P8iPG6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVVl-00000001eqM-2hfE;
	Sat, 14 Jun 2025 18:21:49 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVPL-00000001eCl-1waB;
	Sat, 14 Jun 2025 18:15:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-441ab63a415so35093035e9.3;
        Sat, 14 Jun 2025 11:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749924910; x=1750529710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apK2Hae7QVQW8sVcfdULJFrMHKxa3eLsLFIQMUAHMeE=;
        b=gdH8alsNx7xGwou2dqdhckSG4sOvsApKVNC9i5e5S8rXFJcVnGqgxDWIP/zLOeHeV4
         fxrwcueMPo+AoTXYFfylFP47xx8eiGPJhlUkazUDjKg/dBkSmhjsynSmnzxMap7pbApQ
         BI8Ha+/u2Yz3cH7CCbAwV2Y6pYqR/ebE7DbtlrnoI1zAs5h5IW2wCDg4nUVM3mmObAT4
         duCF2PqN2nrdNVc04tOmL5iJ3lcAbP3QBxyWAnmUF8rXxl7RGuQgyXv7IxqmlbvTpaHu
         6LaEUrgM2ULuaRcx/VB7Y65MLSe3UyQyaAd2Mlp94WDKh6yKV6lJ6stQB+fc0oVahCJ6
         Bwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749924910; x=1750529710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apK2Hae7QVQW8sVcfdULJFrMHKxa3eLsLFIQMUAHMeE=;
        b=sL+tMWBjoI26kPyB6+4BD+K6TI8SU2bCxX0moJ9T/e/3hr2/80/IvH4Nmdglo1lZS/
         AGR1gQ2r45YcssRGoo1pN4amQpKBBMHaH+B8EOlAK5g69aLT7FZzjq0GkDAIOHZjXJdq
         XDyoN25lcm+dvk8EGSD4vqVCkwR6VohVNC+g6rtCGGTJfKx62CesJIIUIx8cQqi1Q518
         CQUKt7NZwYwEt+FPFXApuWXumuB2c0Hpsfldy7wXHEQ0voRIttHsgIj7TLHXWs2qgXNj
         UoBcMJ1aa//CqNJaJOoEWnKsUm8D0/OQRpHzm2gPUBp/+juyMpDaxuOk095DBDZq8YtE
         1HlA==
X-Forwarded-Encrypted: i=1; AJvYcCVqFVvDtx66aBvYQ22vgZuTrRrfasnFxgMkCj7kHan5cvfrSco8dJmV8wdojPyYLuJFzSCws6ERv/0evZ6HJtY=@lists.infradead.org, AJvYcCWVCaI27dgOrvvWYuK8RlJO8XTq/o2cAKrMujvO0EkT8U0KNf1RNqyVJfN3kCBxyuywROTsB3xU4yshJAVZ5a2K@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0EMDw7+8/MMB1M80Pp3if9dI7STUxYUxtaw+NCXAaj9ZlTRIA
	v5s271M4WFx+jqk044JAQp0rN3aJiDu0K1tg7JvHbJcmK5vz1CKSXxFA
X-Gm-Gg: ASbGncuLJVlR+cVjSEZnzRbtP2JgWk5aooEVVik1LeHWLXdPxh1NN0oOJmW3RDw7Us/
	PQOAFnlupK8mMhlVXtjCm2NWucJDMPUh+jXgtGnbddomGmlnthMEarWZa/8hkBDKDf6X8s3BXrF
	25CHyT/kMMb5QGCGmZ/hkiXfhuGBgic4fRhcfQRux9sZtz5ZXR7YtO+sXXxgJjVt7m437DgCkPT
	VlNucgBefOj2rXpenbVd5IM/IBMd0s4xGIRoIMwuuPtZscg8GwUDRmp7UXKQP5L+1lv2hRWbapv
	f8U7rTPDHa6Ld2sJjvdpNqSVsUHU47oHnSJWMznBMfAhj2OC1KzQfUI/6OL6vglYCKAiFz0Vh2B
	Z0Q==
X-Google-Smtp-Source: AGHT+IG6q7vHN/vHBeZAA7oir6GZzQ1YYg+JHtWFX9c9V66ye3en/szawBqlTQWpbngZPIMv57Kpdw==
X-Received: by 2002:a05:600c:1c12:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-4533ca46428mr41136945e9.4.1749924909606;
        Sat, 14 Jun 2025 11:15:09 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm88195255e9.4.2025.06.14.11.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 11:15:09 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 14 Jun 2025 22:14:34 +0400
Subject: [PATCH v2 2/4] arm64: dts: rockchip: add SDIO controller on RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-sige5-updates-v2-2-3bb31b02623c@gmail.com>
References: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
In-Reply-To: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749924902; l=1453;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=+R55JLPva4RxIrp3zXjLnnlES7uYtBgDS2XhRWk7w0Y=;
 b=lQ8gtAauPmLTaar8ct5JF/6gWJkN/9mNycR/7CqdRijYPpExgkmwe2W+HwUPoPvoTikFoFueB
 xsRMyp5Pe/7C9MoPRaip4yPdcJjhUDoiRmK+1fDz1g+a4EJ1/MNNWnv
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_111511_506393_19F61921 
X-CRM114-Status: UNSURE (   8.98  )
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

RK3576 has one more SD/MMC controller than are currently listed in its
.dtsi, with the missing one intended as an SDIO controller. Add the
missing node (tested with the onboard WiFi module on ArmSoM Sige5 v1.2)

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 1086482f04792325dc4c22fb8ceeb27eef59afe4..d3225d20baadd56364655fdde6b33113b65484ad 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1695,6 +1695,22 @@ sdmmc: mmc@2a310000 {
 			status = "disabled";
 		};
 
+		sdio: mmc@2a320000 {
+			compatible = "rockchip,rk3576-dw-mshc";
+			reg = <0x0 0x2a320000 0x0 0x4000>;
+			clocks = <&cru HCLK_SDIO>, <&cru CCLK_SRC_SDIO>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x100>;
+			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <200000000>;
+			pinctrl-0 = <&sdmmc1m0_clk &sdmmc1m0_cmd &sdmmc1m0_bus4>;
+			pinctrl-names = "default";
+			power-domains = <&power RK3576_PD_SDGMAC>;
+			resets = <&cru SRST_H_SDIO>;
+			reset-names = "reset";
+			status = "disabled";
+		};
+
 		sdhci: mmc@2a330000 {
 			compatible = "rockchip,rk3576-dwcmshc", "rockchip,rk3588-dwcmshc";
 			reg = <0x0 0x2a330000 0x0 0x10000>;

-- 
2.49.0


