Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA61AC02187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LhA2NVlEKfcVBvBTCiVY32y/xH4Hrx8Ejnf1JnnZLNA=; b=YrlqPO7Lvq6yZ3DnJJt8u//KB5
	rOjg5mfpszZ0ojSM557nJz4bSa0Iq9NPOqJzW2citqP8Shyk/1thohpTld4TSC/1rrXZcmbaakMak
	LefzX09jAnqknS1DWsl4x2puyiucnQTv7rmZuAv+Ecx7WAAjQrW/6hnockaCmPpyeWE75fE4SfvP/
	/QdU6+AuM/VLvSlF91fx97R8+1RKyqphKL5iAHwzpeAAvIXVHpn6HLv4MrvN4zDZhvoUIsuPff+Oy
	ViVBONJ6m7uhiNbyop8kMu/nCJxZU57G9+sBzEi+Oy0xUDdnFlpzaoxPgcZxcZ0T1B+lRqmOoA6os
	s2/NprEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZRNh-00000003dP6-0sIG;
	Sun, 19 Jan 2025 09:14:09 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZRMP-00000003dKQ-2Y0X;
	Sun, 19 Jan 2025 09:12:50 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-216281bc30fso81705515ad.0;
        Sun, 19 Jan 2025 01:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737277968; x=1737882768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LhA2NVlEKfcVBvBTCiVY32y/xH4Hrx8Ejnf1JnnZLNA=;
        b=ChQpZG7eDDOCSCCljvVf8zZgHqjUhhgE7CPJa2cuCaTiKZo1qrECCi8eBshBrvDv5X
         Yg9cN9gB+TbVv0fzY0cwaZBlb3xKlRvukcplISVqn/gGoS3pzg2y4quBcSmut7tQOqh3
         q84hMOplygrgjcRfpdCa4Zc/l5HW8nVoGkDE4mxtOqXyKcksryxyPt2AAV8pOigL6k+Y
         7uC1JnNm+iVMHEppkXKDwib6yWhpfv1dxJ9hRAq7brJYp0dFUm6V65peyZcPYEpM3jcp
         COPyW4J+LujcMzK8NCuYPgH4ZFidFHoB7OV83M5HVOEOervzX/d85s7jl3y0xZ55F820
         F8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737277968; x=1737882768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhA2NVlEKfcVBvBTCiVY32y/xH4Hrx8Ejnf1JnnZLNA=;
        b=xNXgJXMcGKvUGHvF26L18n53zOGwVtuEyIXPmqymarBcR5+s3q9chkMG40U+6mH10v
         zIYLFU3LUfC1H9yIrP7B6WsfBTWBgkiv2o1Ci4iety0FIHLkktaT+YkrkWpq5ppKR/xD
         RYLj/+zL6Qn5ik7i59Omkoz6cauePquPShKmHEIZwk7hpFeC7ziL8O5jT48UZ8YWelhC
         9HPEbkSEXne1oAvtoRudXrWeJ07BUQMknDHaVkzT6Rxq1NC4nMY5ssu7qkWvuifOfNH9
         MDKv/wf6h0L6L6M8mRSagnL8tp2PtqnoIfYjCV9YQLN0hNwr6NUocZI11/JGP/6cSQEK
         4kUw==
X-Forwarded-Encrypted: i=1; AJvYcCVq8ncs4IN4ltG5DUhqJ2k5k3GSZk7hNPyyGj70N1uSETQv6AraNUyL9Na+YF6lpxvHGF7NIASiHy3KuCha+vw=@lists.infradead.org, AJvYcCWEqPdmu2hThLhQEEipzfyubltorezy6NiYaqOLb+/PbaSBIcPzl2dLV0xu4s0iD3pndNI5twNT1nTOSmTf2XU0@lists.infradead.org
X-Gm-Message-State: AOJu0YxURqRtZNMQoBaXkqRlmF4h7POXW6752tEn+GTASNH3NItceTSv
	07FvJmGfkyeToJhCml8c8tXscKLnxfIUmFRP87tjOIC0d2jXjKMC
X-Gm-Gg: ASbGncunwTJO9fYVB/UmeU1xJMyebVQo2vVWrf9u04kRtSZaChzYg93Um/zh3P6BAtC
	5h5LSyRlBOiUe1YWT39G1jCixX9+EFSqSsbVWUONanCcyN13kl1JdkAoPA5e78CPda6p7r7FgE7
	XHnkC++7P2jsuCmcfkr9MMKm1JeHn1JFSEoH+W4QNIVKFTY3nnY3Y6pN5NRROQfiP/EdPUYVxrH
	FbEZMih05TBxuwRFXKQQmK/ueTNCj5MVzU4gx8YQcy9wNiND0DAYyeNcpKewCHWwNIeS6dH
X-Google-Smtp-Source: AGHT+IEMR4GkrqPducHUzdmvKmp45CrEQ0781699gN42PINXS9mQr93hcVS3Xb9IhAYhNezJgIlYkw==
X-Received: by 2002:a05:6a00:2d19:b0:72a:8bb6:2963 with SMTP id d2e1a72fcca58-72dafa44141mr12644220b3a.13.1737277967594;
        Sun, 19 Jan 2025 01:12:47 -0800 (PST)
Received: from CNSZTL-DEB.lan ([2408:8362:245d:4738:bc4b:53ff:fead:2725])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab849e1bsm4872907b3a.80.2025.01.19.01.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 01:12:47 -0800 (PST)
From: Tianling Shen <cnsztl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Tianling Shen <cnsztl@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: change eth phy mode to rgmii-id for orangepi r1 plus lts
Date: Sun, 19 Jan 2025 17:11:54 +0800
Message-ID: <20250119091154.1110762-1-cnsztl@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_011249_648980_678B1127 
X-CRM114-Status: GOOD (  13.21  )
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

In general the delay should be added by the PHY instead of the MAC,
and this improves network stability on some boards which seem to
need different delay.

Fixes: 387b3bbac5ea ("arm64: dts: rockchip: Add Xunlong OrangePi R1 Plus LTS")
Cc: stable@vger.kernel.org # 6.6+
Signed-off-by: Tianling Shen <cnsztl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts | 3 +--
 arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts     | 1 +
 arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi    | 1 -
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
index 67c246ad8b8c..ec2ce894da1f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
@@ -17,8 +17,7 @@ / {
 
 &gmac2io {
 	phy-handle = <&yt8531c>;
-	tx_delay = <0x19>;
-	rx_delay = <0x05>;
+	phy-mode = "rgmii-id";
 	status = "okay";
 
 	mdio {
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
index 324a8e951f7e..846b931e16d2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
@@ -15,6 +15,7 @@ / {
 
 &gmac2io {
 	phy-handle = <&rtl8211e>;
+	phy-mode = "rgmii";
 	tx_delay = <0x24>;
 	rx_delay = <0x18>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
index 4f193704e5dc..09508e324a28 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
@@ -109,7 +109,6 @@ &gmac2io {
 	assigned-clocks = <&cru SCLK_MAC2IO>, <&cru SCLK_MAC2IO_EXT>;
 	assigned-clock-parents = <&gmac_clk>, <&gmac_clk>;
 	clock_in_out = "input";
-	phy-mode = "rgmii";
 	phy-supply = <&vcc_io>;
 	pinctrl-0 = <&rgmiim1_pins>;
 	pinctrl-names = "default";
-- 
2.48.1


