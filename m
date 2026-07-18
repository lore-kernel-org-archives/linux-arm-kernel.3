Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665D5C44523
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkAddxCtIZjvbuQcdVYEMV492MXwwpyu35XKLgJr4rw=; b=LUfT+nGlxPVWc1g/drX2A5uO2h
	U36CFXhuayWggyaqTETAnjgHw7reNs/7LFvuXLI/WDTTmBGptPv+B3sIZCv/UJRbTUhJYZWdp7Mzw
	8OwTwGCqFNP3D0v/gbx5H6v5zT82qofEsFQj1cwKmegqJA67/grJ/N+pGhSInF2+GpoD4NMZPjvVq
	SbtazHjbb7rVjvRSxQdfTx5ghNQdWPF8Qa9Kuo6k6orryNvE/mmoqwjuzJ8LaChzHYOdW7KRnjeox
	miQCtO51XMEJ4AQMSm7Pxr+kSdIzrLoEUAMeGhrZ7cl5vzXFNNfyhhQD96nXFuuEZzH63uPW5ZcQE
	hXi5RFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl0s1-00000003v4V-2zX5;
	Sat, 18 Jul 2026 08:58:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl0rm-00000003uwH-390F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 08:57:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490d6730461so9670945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784365069; x=1784969869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkAddxCtIZjvbuQcdVYEMV492MXwwpyu35XKLgJr4rw=;
        b=OQWzxOt+VEIB+Byy+P2e55WTMYLqffyoltJVc2fVwjKWJEt+6NQyepyOprtskdkyr9
         JwHCHwTHmZkpbbi0s3nQOoNtk9i4ulIPcqLgtQ5exD3zfjn77vLdcL9SM3I/9J0MQJE0
         tWm2wkTcR/5x2ROHvMyBUNP0i5VbD2A2rQ+qM+6XOkFlCn0clowOWgoRsK2hUyW27Asu
         lwSj0R5BplmtxMZ8nVlYF1YcwYQ2QCa8RKG1wIOANVVYelXjLrSk5BYv1M8cGAYbEGrQ
         Oi3GiGQuYSnHLVWrs2Zp6/83ef8hOo6FUvFZ3XH71X/2TgF+0kFngPnO7fUdsts78mys
         oZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784365069; x=1784969869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkAddxCtIZjvbuQcdVYEMV492MXwwpyu35XKLgJr4rw=;
        b=VY0yH6amhSPgEXIlhSn9ESABdxeyha403x6Xqcy0aF4CCrsrZMuHf5LzwAIlaLvujw
         BFLDM8onMHe9K1fjC2PUI3/XTVlT+tn2kHOiCVCDbRQBnkK6Lw1kJgQPz7PNuo5ni3F/
         q3C7CKLs4XlnV1SBzh+Gxh39c1tZG+uIN9dSwnUTZGP4UFDJ6Rw07qRKqnGngHylfUt+
         YSD0ThTuQNJlCuuwteimqOpHKJBLTBfL+u9XOR8G9KgRVmiopWGMYAeDlCRJZBjRzurG
         fkU3gaDx/ufp3a07UNK4EiYVQRk2ZCqtBIZJfcKG5KQSiSUCOd7v88RPKggIC0IaWysZ
         xArg==
X-Forwarded-Encrypted: i=1; AHgh+RrefHOb4BLCwkSRYVkr7dyT5wbNb7k8RrKf+vfSEYgF8tgos9JaOtJ9sZmyrk924y8nqtjcluW7QorAPJWtQBrV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/OvjoNtW96uHOempWD0YT4v5C602FIJyI0O7fNyzN01LpHedP
	oNKtD+oZhsMN+pDMT4li9CIhOOwdz3S1lLKn233g2vzxdXdmcn2oL7KI
X-Gm-Gg: AfdE7cnyt3Z/fslDfETpFZkiPB30QgCytOBGjq3XLKwwiMGHWk0va0Sdnu9dN47t0d+
	kBsFGNJAU9iURl1A7XYfMIa47HIv69CtqSxzVmiv24uimXysS+65ivYrYswMc+vcW3K18ZQucl2
	bE4NAxOhGf8w4DpBK7tDnTFHeV3EFurqhsRzooxRmj+RbTpyAterWeNTvpzSKiOfnS3VcF3UTQX
	GH/JW+CNqaY/OG/qHemF1z6b55zCrythu2vO+oquXAPuRGROyfvdtnv5658HVqoIckcLjDk20AG
	8IUuIxxTyABx3phZIextne9OhhBVYo5LeY2yXTT4gaQdxt5WPQqPgIJnzcORgCrkM/AotBiH5vx
	BDGc5INCkCHc/qbjSaNDCKVhzPi6vRj5h7RpRc2qOK2XCKqwvRo7XIo8V9z1KV34vmrjYLoj2BE
	rJuZ9dhIgd9L0Uyiul6zPUkU0LoMMAAdhbAHTtfZaEMI8vIEae4C5do1rb2OCNCMXUj9nhIR2WD
	tiIh9TLYQ==
X-Received: by 2002:a05:600c:3553:b0:495:4a33:2c34 with SMTP id 5b1f17b1804b1-4954a39955emr39555925e9.0.1784365068868;
        Sat, 18 Jul 2026 01:57:48 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8D1600206D23E70680CBAA.dsl.pool.telekom.hu. [2001:4c4e:1b8d:1600:206d:23e7:680:cbaa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834edc3sm91477455e9.0.2026.07.18.01.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:57:48 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio capture on Orange Pi 5 Plus
Date: Sat, 18 Jul 2026 10:57:28 +0200
Message-ID: <20260718085728.6797-5-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260718085728.6797-1-royalnet026@gmail.com>
References: <20260718085728.6797-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_015751_216718_1322B29F 
X-CRM114-Status: GOOD (  12.97  )
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

Route the HDMI receiver audio to i2s7_8ch, the receive-only I2S
interface dedicated to HDMI RX, through a simple-audio-card with the
receiver as bitclock and frame master. Together with the audio
capture support in the snps_hdmirx driver this exposes a capture-only
ALSA card fed by the HDMI input.

Tested on the Orange Pi 5 Plus with multiple HDMI sources: capture
follows the source sample rate and stays in sync via the FIFO-level
clock tracking in the driver.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
New in v3.

 .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 9950d11..d5840e1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -37,6 +37,22 @@
 		};
 	};
 
+	hdmiin-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "rockchip,hdmiin";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&hdmiin_codec>;
+		simple-audio-card,frame-master = <&hdmiin_codec>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s7_8ch>;
+		};
+
+		hdmiin_codec: simple-audio-card,codec {
+			sound-dai = <&hdmi_receiver 0>;
+		};
+	};
+
 	ir-receiver {
 		compatible = "gpio-ir-receiver";
 		gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
@@ -247,6 +263,10 @@
 	status = "okay";
 };
 
+&i2s7_8ch {
+	status = "okay";
+};
+
 &led_blue_gpio {
 	gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-- 
2.53.0


