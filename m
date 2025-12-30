Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CA8EE4992
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 18:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=liNs4Nu20YxUTwqcdL8jR/v1sBx3Nke7g7mFbFi8pF8=; b=NqvyTehdbrG9rbbOJzrq1CHF+K
	W46mNIepzcwYikSzXI67I8Cl0TN4BTd+5LjXS1uSKPMVwbKGwV01MGfV1zKAcjgoOxCNktA2GWhAG
	GI2EvoauVlR39hmqu0sEdiU6mnUufGvYMibZhIuVxwq5UIXk221cJeFFkBP4ZFw9/Ewgd1eniugGu
	8W98c1EwHTvQDVfqv5W6lQmOHi2qN9TJ1VvLA0cNydzs4xsPwmtnPE8XAf6y3XPJZGghtDHRplL3T
	QspQgGHONd8hx0ae+2BpbKsFZ37P6NKi3lJPIYcjsEu+KXcN3zbyRTT0LDNU/Nq5bcuI91nr5Aw/P
	Ox9sy98Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaeWx-00000005BJG-2MgL;
	Tue, 30 Dec 2025 18:33:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaeWv-00000005BIp-1WPA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 18:33:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a0c20ee83dso129920385ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 10:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767119592; x=1767724392; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=liNs4Nu20YxUTwqcdL8jR/v1sBx3Nke7g7mFbFi8pF8=;
        b=Jvcm+sKdGnaJV2XIo8ASAFnZOxs1702Xo/AJ1FSlh4LBLc3xuh0ayr8Cyp09nGiz2r
         3he/rf6sDroy1N0YpQrGmf6sGcUhUFDSM2iS8FRLQ7v4qaHr6TP7izTKdl6r5ptcMR28
         UhThGMUQjiXBXYxTRuHmgOfov62v1dLRjHfeKA4SyJpQElNnrAX0UrXTWYkQYSYcZMHZ
         5mpxfcpFhnqXKiVktCWtvgX+J1/gdZpChyLRqGyHxeyPiTFlGgK+9v8zTQy5AE93rvig
         c+eEp8L5q0w+srR/mOjUwGtRYrMmCQ7a3MfyagGNo/aWzpX2m36Seeld6YeSdB9Bm3Vk
         PLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767119592; x=1767724392;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liNs4Nu20YxUTwqcdL8jR/v1sBx3Nke7g7mFbFi8pF8=;
        b=KmUkky7egx/gYMlFanXcgwLuBLmQRpu5V9u5+3Z/XRdxrWxHa/1oIimVwE2/B+E9k6
         U+vqVgtx4INsG7vNV19KtwCkjSd9dZg9Bwsy6V8zdQmGAV/OhwYXcKY8YUIN9fF36LwI
         2xfBRb25YZeD/kV7uVo8XrBQ1vCDN5u0Mz1Lo+p+VfPkZ107Pi845DZeuo4uZxH6xGpX
         e8Hgmk3j4Jc7Zkld4IlGVJSmhyMNy+we5XsZsPnv2dRUw2wR1Hpi9dXikzGWt4ZgxvzX
         VKbHBq2gY5n5LK9dwZOKuNUDHGABU5/4DYm6gmuAV1MaRWfiZKWbWxqSOE+M5DJacaCK
         czug==
X-Forwarded-Encrypted: i=1; AJvYcCW9zbXUzhJne4BMt5mCNijCQ4XGEYEq9ctvPbREOcnQJCngIMFbOXfYW90hjOfyx3AHAbGQP8iD0i8T188FoZzQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyHjtqjuOCwfJrrh8OkWiXBGUoh2WGj85x/MhyEVZgC9tgxeGcG
	TsTXcOAF5c3tjC7Q7SKh5SeaNkV3vSA7XtetwhlNUD+QO5hnTlPdAd7m
X-Gm-Gg: AY/fxX6DzKNdTw3Y3flasFZa2DK9GUHWbVZDQB7elXBFVzYGOi5BHQkyUD9UM3gMWC0
	TGp6lioxquXLZVfyXxovSB37vmxozwDaKM9g/dbymmKlHQulRosPMZxo4KIoJnbOhAODcfm0MNQ
	r79j5atdu1yxym5GlhmBv9Iy02QokSNOh6DTkqffPH2Pcsvr6hU3TeVHYRl0GjRw7j4X6b2fg8x
	09EKha9cnThcH2UdwDREU2S+BdFl8RGLES1wwv6jViQ53tRBtcCZT8h/QBaH8y6DjuBk5CmMZ9t
	v0LlehXHhO36sxOQhWerv+QxjPa88TE/wKsDww21BIGMkj5vZxPsp8N90yIv4M5sQJ9/GhZjghP
	u1cBq+RU6CWqhOREYoCV4i0x8uMd/Xz1DrtwyIhYf4miyLI7G/Ahz6epfvjO81gFOWwTZVn16yG
	+D1DD37Lsc53Z88+WoZ++6Iug=
X-Google-Smtp-Source: AGHT+IHfak2FfRD9VrZovrwOmes8QiGk+sY8RzvYOjUrAuZrPT3jY6+ly7bsYHkegveLW5pJZduZFg==
X-Received: by 2002:a17:902:e550:b0:29f:87f3:9c22 with SMTP id d9443c01a7336-2a2f2c4cc02mr379373775ad.52.1767119592031;
        Tue, 30 Dec 2025 10:33:12 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d4d87fsm302758125ad.46.2025.12.30.10.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:33:11 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Wed, 31 Dec 2025 02:30:42 +0800
Subject: [PATCH] arm64: dts: apple: s8001: Add DWI backlight for J98a, J99a
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-b4-j98a-j99a-dwi-bl-v1-1-24793c2b99fc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFEaVGkC/x2MSQqAMBDAviJzdsC21u0r4qHLqCOi0oIK4t8tX
 gI5JA9ECkwRuuyBQCdH3rckIs/AzWabCNknB1lILaQSaEtc2sYktAb9xWhXtLpyqqi1KUcLqTw
 CjXz/13543w8vWX6xZQAAAA==
X-Change-ID: 20251231-b4-j98a-j99a-dwi-bl-b56c3075a4fb
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=peiIl3kcZSGYDI0SYDU6pNL+X/0lARo53q7LuV+LeDI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVBrfZDu5oRktCcjFTaRTbil7TaNMr/NVMwu9P
 RIiqTyoz6KJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVQa3wAKCRABygi3psUI
 JCfBD/4uajJFiAAk8T1F7l8vcke5uW7iQljDlvYBkbO4PCkYGYaS9JOoV/PlM9s8oD0j+RTe1zt
 W53+AdleMK4yl9rfxMaKoA9ZcLghAMegPCLBlyby0XrFdPUDlWwczui7N7NOino66HzpL2D6CLZ
 9tnRseowYOmL1cKCSqxwbXfW9DFVp1cDZezOFXz9lOY2c3ouGcJyevE1MTOaYx6arVHJ8/e3eXU
 FLTLCtoAQ8MexqmffRzwxOP9FBZoiEDQqDGi3dD2McnwNuC7oIXNnoxh2J6tI/xTVJ67IjhBwLW
 y+CfruiuZ++/6Bqx3eVWO6mBdU1ghsACYLvyS8Y/LG4ylfO0NeBUGFEGQnYc8T12SkuLLpD1ToM
 FqgquhS8lChUcPmr/Hau75eocJD5dpQoUbGKqUjRilxXIU0c+xAi27HFqqw1fY6Ns00o6yuDg4J
 S7rRh4zSoKcvTV1N3xKyno+QUrFZnTge8CCSFh6WIUsR+zIZ0ClyaJiP1Ca56s564IEhGmZm9Lh
 kB3RkfssnVO3hlSouoSLDxd+mg2tuefHds9qmR5iqBLjdS3jsdfFqhN2ie7IHg79ZMEznEATpVT
 nY8GwKT9RJGaC/hai0CcnKJRJFW4LWEq9J66arLAU3Ex5r3MentJrQ89Pv3dKBs2ONbFRd9B+li
 WjHqgkSjTawFH0g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_103313_410308_F6202146 
X-CRM114-Status: GOOD (  10.04  )
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

iPad Pro (12.9-inch) uses DWI backlight, while the 9.7-inch model does not.
Add DWI backlight node for s8001 and enable it for J98a and J99a.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s8001.dtsi           | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi b/arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
index e66a4c1c138fe82dcdd652d4d56a8f4583f660cb..67633c56a7238983517b36ba319a704424be07c5 100644
--- a/arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
@@ -9,6 +9,10 @@
  * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
  */
 
+&dwi_bl {
+	status = "okay";
+};
+
 &ps_dcs4 {
 	apple,always-on; /* LPDDR4 interface */
 };
diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index b5b00dca6ffa4caa1d504860693da001a8ced80e..209c7dd19b7c289096e22b3c86a825c53d19a78f 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -209,6 +209,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200080 {
+			compatible = "apple,s8000-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200080 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251231-b4-j98a-j99a-dwi-bl-b56c3075a4fb

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


