Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF47CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O7VH5GloSW9zlV5MKDiGfn6qUlpNBb/HaUQn6uAJYa0=; b=Dpy7pkRGJO8nA3V2ge1TowdGaJ
	raFpAt8qSmMowlJFRgfbp3F+pf+40etE+29ECBmaNPOKqxkKYUJilLqb5Q36g402f/rRkpu4DVfSl
	Jo5vexTymPt1IBXkXfkc9dnoRJ7uUzUNQZflu5t/nudb6aHSMPPlDlkdvAKbRsqXBxv8h5KhwoeX2
	kvDLq+WHhmsBYa0K0XN/EOeB1elbGA9N39+FW1xOg7sa6F65k7VmTwI8G1cL51reeaeaUIxClYlU4
	wPwqW44UZOhTVWukNaHYuqQR6ohGN/o5Gspsty26ovqSt+O4bMbbk6f6SmtsGD3qJE9X+Jc5wRRZ0
	snEAtdnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2oLf-0000000Erbs-1bc3;
	Sun, 28 Sep 2025 10:09:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2oLc-0000000Era3-3uH6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 10:09:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-46e3af7889fso17440445e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759054178; x=1759658978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O7VH5GloSW9zlV5MKDiGfn6qUlpNBb/HaUQn6uAJYa0=;
        b=EbqnS8etNO6LUFrT/FIwkBsHfn3oT0kcX3am0n3oRhQlawKBO6p/i85U9cU8OZh1Mz
         8TzTjf9Iz6cDjti6AfswsbZjhP5tXEqGm3BCiflaqxxJSdjh1K6Jo8XngJ9PfABX7GrF
         3S1OfH3Aq4y6TqsK+9DglV121I1ZHsnFikxYqkV4z47UZGKOwEWffJTdBjHtbeoSHqai
         kuxup+7617q+mB4nMLIMPZ6wnJTcAvkV4UIZ8Lx4oJSCJ8nIDlXXh4eYji2veUCwlnG1
         wdZtNvuOK2cYPexjr9erfyNWFj/kJn5Si+Yh1QlkJmy8CPo5GFX9fOq9IUVA18R0bO2V
         pJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759054178; x=1759658978;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O7VH5GloSW9zlV5MKDiGfn6qUlpNBb/HaUQn6uAJYa0=;
        b=SQkNVd2oMipaDScKYOgHGNWBMf/HpAoTc5HAX+PXMR+OYuGKy9LmYpJwSGTzPfZg22
         O5NmWne5mSZXoYabdPsZB/QL2dXhVhclGLsMiSZwrq/SKveSL5I5P8oRxLMD4l7hpTwk
         muZTky4Cp2T5jV2stpIrFzEVZZoiT1bAhT4982r6/chHGw/B+GBGEvIEcVhqOO32Fu/B
         tfLzLuOLavbYT339OExFs+QdZw83uQb/0ptMNpzgWS5FHEpMMjAgZ2SwcN7p292uFrXs
         rhbB8on/GelGNyq8AOZvxI19+PTF26gXd0R4g6DlJi3CxMphkv4VxUZwErLUFRne0a2+
         lFpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuASXtZ+dAhYv1pN6eArCvGr1f2dj13mzGm2qU1nn5FkuouWQ8WOPiRuaRdsUjBB8YOL8LcyAUNHPHZJtN6STu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6uyow6aEdVuBa3TGRvsOCBNJI+Iy4/qQNMG8NYGfFR+ZoolIz
	H1rugv+NpPzKc/68iELJUMeS0DZp1Lrr3Rn106uviiDpQQXtDoHx8mZj
X-Gm-Gg: ASbGncsBvo+VHVEKSGM9CDNSxTSiMpytfl3mwEeDygwpznMWXenCyTGdGrgn6wCNzJF
	qOd7SdDP1ioRK00wBjjGmE+tLCzJBe7imFkb9TgK5sFDouQLnx99zMjIJR+mY9ZEWJe6ngmbCKP
	EcAvmwVy9/KkFoscyeZFrtfPQIgbbGIrbN1rz/KmmXeoRKRnykwQLfav5zUfJfOVzcmAb6fC4ST
	bmtchNjjQ4Y2n+8zUr/+lfMgK2LljkkdJ7e5sH9+uqQdgDADX0ORS6T2zaxEbTvnMHcCs7yvx6c
	ax4lvJRvS+d+RBNxKtGt2oCxW+0lzDPg+DmYux///Ph7NtpcosvQftTF18//8YTBjl6GGgHLomp
	3DqOG/BRO+1aTv1wcflM5T+Wpdd1iFn1qHZIioBxxd346FMGvUdjAxBMccuBhBmT57TEPzcPJ0x
	1GAsA=
X-Google-Smtp-Source: AGHT+IEqCtc23uR91vJX1oENcguv3h+oXK5yd4n5mW5QIEhXCja0/eHYFgJA/f94YSrqA0IKGpmApQ==
X-Received: by 2002:a05:600c:1508:b0:458:c094:8ba5 with SMTP id 5b1f17b1804b1-46e329b62bcmr82520475e9.12.1759054178464;
        Sun, 28 Sep 2025 03:09:38 -0700 (PDT)
Received: from deskilmich.example.net (host-79-36-214-146.retail.telecomitalia.it. [79.36.214.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a996bf1sm185811095e9.1.2025.09.28.03.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 03:09:38 -0700 (PDT)
Date: Sun, 28 Sep 2025 12:07:49 +0200
From: Michele Zuccala <ardutu@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Alex
 Bee <knaerzche@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: rockchip: add hdmi simple-audio-card for RK322x
Message-ID: <20250928120749.36df6a8c@deskilmich.example.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_030940_991889_4D1C94A8 
X-CRM114-Status: GOOD (  11.72  )
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

Add "simple-audio-card" definition for hdmi-sound. While at
that also add the missing #sound-dai-cells for i2s0 and hdmi nodes.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Michele Zuccala <ardutu@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk322x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk322x.dtsi
b/arch/arm/boot/dts/rockchip/rk322x.dtsi index
cd11a018105b..a6b3c934c8ab 100644 ---
a/arch/arm/boot/dts/rockchip/rk322x.dtsi +++
b/arch/arm/boot/dts/rockchip/rk322x.dtsi @@ -108,6 +108,22 @@ arm-pmu {
 		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>,
<&cpu3>; };
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "HDMI";
+		status = "disabled";
+
+		simple-audio-card,codec {
+			sound-dai = <&hdmi>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s0>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
@@ -156,6 +172,7 @@ i2s0: i2s0@100c0000 {
 		clocks = <&cru SCLK_I2S0>, <&cru HCLK_I2S0_8CH>;
 		dmas = <&pdma 11>, <&pdma 12>;
 		dma-names = "tx", "rx";
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
@@ -732,6 +749,7 @@ hdmi: hdmi@200a0000 {
 		phys = <&hdmi_phy>;
 		phy-names = "hdmi";
 		rockchip,grf = <&grf>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 
 		ports {
-- 
2.51.0



