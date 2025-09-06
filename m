Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53584CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMJiDJbKP/etSvCuwnuuixi3lvLXAUo5LVfiKg0BtMM=; b=m4AiHqzMtr2XeEVd2pBmicgJSk
	eBURa+bMP6nfuXvpH4SN33ZfSBHRp4kEeszCiJa5PWuTERav2pFE+3P4GJAKOrKpJFfzaLeqZJ9a1
	ptZEdP7nSfFk7vVSa3zSIpaRIwYVl7Lpz7uy5HcHN/mtv7lOre5k04OWvsUOlmlE12SDrLlUolXKj
	KKDA1F/NhldIftwbXIUZasuIZZ3FDmHJK7B7ebkKZOZWNCB2vHdeCQRiToH1TVobD72xTMcQwqS75
	47y31yEIqVy0HhsQeUYv7kY0SJLLdyTFLkxxfoRdf2bi45v2VVu6RL0EPr4hdt8f9ky1WnXfPIjfj
	szXY7XtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuroW-00000007k8a-02Dz;
	Sat, 06 Sep 2025 12:14:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuriP-00000007jct-0RCl;
	Sat, 06 Sep 2025 12:08:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3dae49b117bso2447529f8f.1;
        Sat, 06 Sep 2025 05:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757160499; x=1757765299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMJiDJbKP/etSvCuwnuuixi3lvLXAUo5LVfiKg0BtMM=;
        b=e9MI/qhyw3YOUXhfcj2OQZS1gkcQjHGvypw9GITBk1P4f2Uo33WCJaySd2qvMncg+T
         /QP2TNc4eWwSmpGZQDrZtl7EaT9WoY1XV8yfZrsGo2oScB31oJhQcdVmpFwoClLWoPWr
         Q4QRHS4sZVR52eCfQ6Esd6Z/Ob/fFzKXbDbEUoSvxLbeK21kCtpdSNXOmJxphdoDqpnF
         JzynH53NvImIka04Y7mMzpDXu/SCJKo4d3gOLYp+k+2KkF7vh24KuHoQB2Bhj9V7K3BR
         gUW4D2zTrlmXpbXdwWjh9gcoGIbp0lYJZU2Z8IU54zll9faoSL9FTAkVlc1crJuPSxRn
         OgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757160499; x=1757765299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMJiDJbKP/etSvCuwnuuixi3lvLXAUo5LVfiKg0BtMM=;
        b=HlT4E/ooAwpyvz8h5rblL+uNJK12G+HL2ZJRsyimTXbq462NoNQgKwfRHFP9/AdNgU
         TSLvbJ0kKj1JpxhpkiuaU9VaIIkD6INDE/Q18wXheirX2w8tbtPv66qz08Uq9pru14EF
         qrI6RiKY/pboTk0YZzAlT1RMfnAJvFmT1xqZa5wDyGlIK997L5K2buCH0ZimyZ7fJAQl
         LSktrEovn4eoS4+HSmgn/wI44sMeLZxTwGITNgnDwuwRsDH3LQ72Jhf3GdZk0SVJUxvb
         K9G3vMJEPq2kzY/DOoShGdeUPxv4YvJJuKFalsghtQjDbhBh375Cx14/wfLE5qsVMwsE
         AKjw==
X-Forwarded-Encrypted: i=1; AJvYcCU6MCA2pPig84cwhWGPkVVH46GffDw0rZ2doboj8iTK6RdbbXcb1frrmglPWmUqNILfl8RhPp3TSqfOr9m5QLdn@lists.infradead.org, AJvYcCU8jMDUA9VD6MhimfqiylESvYKTYSUv+w8LeFcH3A8PwYgvfDwY4kTHXPsT6rO+Nhov18ASlZyAh2dJpvrnsz0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQlXlovu34nbiHjzSkUVLWqhtmrgE0o6ajvLTGzboIH4FHn+rF
	hkNZBwVMRKF6WsK+bnkHBxNCSGkACFN9Hx03l3ICMmvL6WwMTOnTC7uc
X-Gm-Gg: ASbGncvmw76wn9QjCrPlJqok9UqYAcw/C+bZQiYd2GuysuDp3eMinSMTfiQ+El7/9kE
	q9DbqCnt//RGrv9RpPlFtV9Ds3Q7pBaPYEkLlRiYTcjpMeoOQEuxmKCPvdSyGQ5DIUkrVuakr82
	a4Wtba7hD7my+Rh61fF+iNw1QV/KtqwNgBLa89hpPwQrs4QdlnhHqthSbWvIMnohSevJzpZmhuP
	P4LFnn94PZWmxJ7hZBOqqm7ssLoXGQDUX4biVp6gIzW0dVgM506wqddKU7J8HNpUukq8FTbWAae
	savLjUi7UokHCeCISU+Ip5sk+mi8uFstMt0iS8TgwkuYpB56sjtTAxKwj6J4WouK6iUpRQmVc+0
	6IldBUVc8V+66GqtAbC81e9ZB2Og=
X-Google-Smtp-Source: AGHT+IHBJYiQh+I1y35iAqJpgfRb8U4m0E/9PkidxB03WfHyJamTMIisTixcjF4m3yIucg+v2jdCiA==
X-Received: by 2002:a05:6000:2005:b0:3e4:f71e:2d7e with SMTP id ffacd0b85a97d-3e64317ccb9mr1420659f8f.23.1757160499394;
        Sat, 06 Sep 2025 05:08:19 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd058ed5esm60978455e9.1.2025.09.06.05.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 05:08:19 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alex Bee <knaerzche@gmail.com>
Subject: [PATCH v3 2/2] arm64: dts: rockchip: enable the Mali GPU on RK3328 boards
Date: Sat,  6 Sep 2025 12:08:10 +0000
Message-Id: <20250906120810.1833016-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250906120810.1833016-1-christianshewitt@gmail.com>
References: <20250906120810.1833016-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_050821_144801_3D587960 
X-CRM114-Status: GOOD (  11.90  )
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

From: Alex Bee <knaerzche@gmail.com>

Add a gpu node to the rock64 board to enable the Mali GPU and
move the existing node from roc-pc to the shared roc dtsi to
enable it also for the roc-cc board.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Changes since v2:
- No changes
Changes since v1:
- No changes

 arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts | 4 ----
 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi   | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts | 4 ++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts
index 329d03172433..c0b7b98ff788 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts
@@ -44,10 +44,6 @@ &codec {
 	mute-gpios = <&grf_gpio 0 GPIO_ACTIVE_LOW>;
 };
 
-&gpu {
-	mali-supply = <&vdd_logic>;
-};
-
 &pinctrl {
 	ir {
 		ir_int: ir-int {
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
index b5bd5e7d5748..7eef6f7f108f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
@@ -160,6 +160,10 @@ &gmac2io {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_logic>;
+};
+
 &hdmi {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
index 5367e5fa9232..592fd8ca21df 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
@@ -152,6 +152,10 @@ &gmac2io {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_logic>;
+};
+
 &hdmi {
 	avdd-0v9-supply = <&vdd_10>;
 	avdd-1v8-supply = <&vcc_18>;
-- 
2.34.1


