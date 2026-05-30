Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C284ECD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SJMrJ4Tyw4rnth10NKoarZEEEB3Q5hOPvF+j2hwsdo=; b=eyU7/IEFVbSvAEgLrT2O+4RKkA
	G2xbMcjKsUVxmWfF7uj/Z8h4BjqsGAavV0G0+UN6sXYXjzrVsXuvw1mJ6EmT9lGbgNR6M9ejUl5hs
	3v/26ZC42bzT1YYsL7cURRvmtBrRlvkh18ZIBISpNscgqsn83HoekX+xo8b407yN0lZ8BriJTw2kI
	Ewa1Y0H+0ZvAcHlMuNF3H2M28aliteZ3Cz5/pmw/u3j4TW0oLkgMl7zFISBNrmK9tP9orFwNtFDTO
	vhGKEbyXOZKnLFirMNwyc9MLDTYISQh0OTTzUYapzkk8ZeNkx6VeMokhW56VrulH+l9AGg9uacrg+
	EuyGtbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMDj-00000008uJ4-25X6;
	Sat, 30 May 2026 16:07:31 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMDZ-00000008uAm-3e49
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 16:07:22 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so5180286f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157240; x=1780762040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SJMrJ4Tyw4rnth10NKoarZEEEB3Q5hOPvF+j2hwsdo=;
        b=PEU0zsTN6o/PafM7Xhw5WwxC7M1Dh4BKtKosPYO8/ZdWHW2Vu87UzzcYbyqbMKTOub
         +qV+YlIoXd56KBEPoFhZyYzmzfRJfyKcubP5FAQVCjNUcYa3PHa73oTxc1lKKiZk7m4+
         DoMw/Pp1sLKTznxr7JS0poxhrKUB8C0YY0xx6jaLdvLKDZK5BZo4zSupFlsF3Km/dmzt
         6KbWgPFy2Z2yt/pHwiJAYlvMjWXZbJv1+hm9WKTWVUq80H7Np2qfW04p3KT2oNJyErxw
         iBndksOBtkPYwWraVO2JlswtnK/714ZHpLAtmNU1OYlzr4gqyq0ZjviE0HxCwutTIxLd
         n9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157240; x=1780762040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+SJMrJ4Tyw4rnth10NKoarZEEEB3Q5hOPvF+j2hwsdo=;
        b=mcm6zOmAgbXbYYKvvbYjswB2/elNnRZ+qvZonBdv5lTcKIgsS4lRAgrxZ1J5yogCo+
         QnJtRBlQDOH3DDFcEe7QBQpZ43pI41x733acOHHdhe7ch+61ossxfnB3SxithTEtTEdi
         0FngKpK+4Xg854ChdxcPEP1rJovlP7o0Z/VSI7qa+psIOPzRmThsCGNyC28H7Y/j3Wwb
         vFtUtI93N0W6C/5YxEBlBWux+hk81O/Oi0TzUm7baw+BhMjmJRkqoPeCUnFLHR75cv+W
         uZUiwAOQq+6tPnzZofPPPFu8q5ChFNDGsekD9l42aGf66Eh0eHwWCB68rxwbBIBapCq+
         HViQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iAcnycz2nQZi2iXpu07bdAj4AeCCOBqJM9t+SgM5P2y8JC9iuKlQqlXNFSuHN5zs5B+AsUQ8iZwyUw7nVCQv/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6/y5KKti6ZHU7qceLa4dnxoWBulIbyvJoA+Qq4+xZi6PHrCDh
	JcmBm+aSShRT/B+aVt0FRHpTSkGzPtttJvOMK2eovTEMWZHMyc3KZTSTTfhsbXbT3oI=
X-Gm-Gg: Acq92OFn0Dkpvg27zmDZKxyqb0wR6AXUhqhulxpxFmezDe0CdGt4JR6zSCvqCRjYmEg
	jcnoV7tDCatcBvxkzioFYoKF2zXursYGFLastRpvBJri8juA81oOiFNlmy65t7LieAR6ZLdtsVz
	nRaGx5vqi4DQFJmXJzvO4KR1H8ZgEAnON6HOvj/6yl2fP8hHtqzKLSJi6f7t5AjaKTJ77qz+u8w
	ZQQXZ0ltKjRq8qdu+HVMfqC+jSeg/8a/A960IhUWBEn7ZTXnMUqH3/4vQ4fXi58YwSxwa8HHAp8
	m+jAZGi8xYmwWxBWmHaFQRqBxa3R9zzkaPsQ/WpHSgZ4L2gJmL/lry546gCFh3oBSWl4HDnryW8
	BIplRz6U3DHV+lmdwr2uWTTYUn2lM+PT2MOP9SWgGrrqDt5vEFMg1l794233kKcXoCCOefy4P8j
	Y1OhYNQGywsQZbrQRwsXddH/jRKCg=
X-Received: by 2002:a5d:5989:0:b0:45f:68a7:38d0 with SMTP id ffacd0b85a97d-45f68a73a2amr1942009f8f.0.1780157239975;
        Sat, 30 May 2026 09:07:19 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef32fabcasm11667339f8f.0.2026.05.30.09.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:07:19 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	heiko@sntech.de
Cc: linux-crypto@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	clabbe@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH 3/4] arm64: dts: rockchip: Add crypto node to rk356x-base
Date: Sat, 30 May 2026 17:06:44 +0100
Message-ID: <20260530160704.3453555-4-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260530160704.3453555-1-dawidro@gmail.com>
References: <20260530160704.3453555-1-dawidro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_090721_919950_24FD86ED 
X-CRM114-Status: GOOD (  12.26  )
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
index 64bdd8b7754b..3b73a56046e7 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1171,6 +1171,18 @@ gpu_leakage: gpu-leakage@1d {
 		};
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
 	i2s0_8ch: i2s@fe400000 {
 		compatible = "rockchip,rk3568-i2s-tdm";
 		reg = <0x0 0xfe400000 0x0 0x1000>;
-- 
2.47.3


