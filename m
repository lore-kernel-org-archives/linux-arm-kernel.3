Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1DCCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKcui5kqlHLRoGonq2UNIvF4/eUOOrD4c41D8AoISsY=; b=RocpPm4HGFYNnwOCfIGqu6dQIC
	YF3lZvaSCWVnkRp+OlZMrfDLkrpFzq0uPc06Spy7J2tr53fyA4E3VsOlCg26xjs0vt3lP9gL5EtdZ
	fzREb/2qZwigHeZW4cNmHC5wJPiRzYcklDOK7BZHrzuIrW21pHCVGEI8ew5YnSeoPELE2UjlGQHRI
	JxrO0LxoznCPeTFO6zFrG1aDfj6VOwm2YXRiZPYUzc1Za0TLUsODr1brId+BK73iS1ltNxwGXGAC8
	RnloHg+MRaDxt3/BjdrNC4GWg64g6axam2qztHbXA2dgJo5YfPRrTDKGGALoqC9CpBtrsanEqeyhK
	sq5bvkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uur3o-00000007g5m-0NsO;
	Sat, 06 Sep 2025 11:26:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuqyD-00000007ek9-1dUd;
	Sat, 06 Sep 2025 11:20:38 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45dddfaeb21so3251825e9.1;
        Sat, 06 Sep 2025 04:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757157636; x=1757762436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKcui5kqlHLRoGonq2UNIvF4/eUOOrD4c41D8AoISsY=;
        b=F1TDamLsGmADstCKMqZDzozAuCCozTnplL0c905XxPtv2vmF3KJIRTkCu4h2EvgUiC
         saNpaj3AGjp+nH2uaFUMTkTbIdknaiNcpUF7d3uQrgwUewoVtpMAL/QkzLWNIwdfO4ef
         UzbsemC9KY7BE8ZGuJp8SHR9xAUErBTlMuly5tQITzEJv40v3VvinUg2/Y+H8OsJYqe3
         2cEI4R87cM6Ll+JA3NDYdlLfDtoeb2VjoG6OKzwYiNWk7f6FqSddjmZBuagw8UBwzuWu
         kVzG74X82cbE9ocrDdLmpgw8ebrBelxhBK85EbsMcBSpz5PkLAoCITyFoIOtT9zWaZn5
         qr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757157636; x=1757762436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKcui5kqlHLRoGonq2UNIvF4/eUOOrD4c41D8AoISsY=;
        b=tAsCuuHPtPU9ALGPZ8VfIa8d/r4JMdNCHkKJk5prJpaiFGZt7NmcrA+lF5mBVbqekg
         PVYirb/wVUYdVDOAwzj0Ed8D1LjcnbCaWIof0opxnFgA6Lm0f2QSdsq8k4C1F7Q+lra+
         mVXLHG6LqtzAnszEYIZEK0DZ9hbxjiNAMBp+lJZ4IUNpcVaGJEKiYn5B63Wn1Xu1X2i0
         aYSWurxbtRbJC8v5spf+Q0Zu/EF5CclcGNBiGYVy/+pcPaBXTWLK337/jIcTwUSCR6Yo
         /On5iLGVjA5YJpkjS2hDIBB8TkA4D77f+jOykqftfaQjmbNtFyPD+UGpX0ZZKZcfKkHu
         vTFg==
X-Forwarded-Encrypted: i=1; AJvYcCU21J1RDKfCmTi+4yXxlx+JKWXchs0huJhFiSyRqlaTyBazH5Bfijav00nKnwDlHpExnOVckIIlAoscbSYczBqy@lists.infradead.org, AJvYcCWVk0bykc/ECoEcIbj7R5DTUYjNlsgnFfA9h68f0Rzkz3Mxo2jypd/EZJBRoYxCQTN0fwGbpxcZJQoljueF6lM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxw5pg7n/Wg0U98/mLzQnUPlEEXHDZBfDmqFIJdBChCYzve0/i
	nS9TYilWd0YsMKgXSP+qnhANhg6FKnChaNLKMoq8jrqSkw6oT8tQmb0AXPI76HAd
X-Gm-Gg: ASbGncufjofh1S9DBvv3TFJO4RnP+VvB3drbuUVx8h0Lzqs6wJqLQHuRspA6oorMt2r
	0s4RUn9y5iP1LMIiFpAVlak9JSes3c2JDG9eDZi7YQ0sqUFUyKWqIR0fYDayZFk+k8eQNNM0VjO
	hN7vIjjIj4yGowhsWKEvwIA8S1w2J6pNIP1qW+5xAttydfvCpz0nnrD68RMo6IiZHCPSZQMAWmW
	QSS+woC+7IYetEWA5yufvLbVcKvhrCQck6v/A3o962uk/0E4DJlbIdn0rikPf93k8c85vJ1QHa+
	H3EbbTTspp9OT3kvJsr1f0xWaTQzGFJQrXdEfsD1m+dgrabr2u+0+zQ+rMukmIgdUo9bNIN87Xw
	XrAW3hsy6EQwQ2c3y6rOOakKYnpVofOelROw8ng==
X-Google-Smtp-Source: AGHT+IFv8cE90LFD5yJ/sYFcSqb8G8+DIxE6PJiMga9p7H+75K2qsCzvml9epgjQGTdfAnAhHf5Ufg==
X-Received: by 2002:a05:600c:1c0d:b0:45b:9961:9c01 with SMTP id 5b1f17b1804b1-45ddde832ebmr18317335e9.16.1757157635521;
        Sat, 06 Sep 2025 04:20:35 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de18f4824sm6646655e9.10.2025.09.06.04.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 04:20:35 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: dts: rockchip: enable the Mali GPU on RK3328 boards
Date: Sat,  6 Sep 2025 11:20:30 +0000
Message-Id: <20250906112030.1829706-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250906112030.1829706-1-christianshewitt@gmail.com>
References: <20250906112030.1829706-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_042037_430912_3DAB09C8 
X-CRM114-Status: GOOD (  11.93  )
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


