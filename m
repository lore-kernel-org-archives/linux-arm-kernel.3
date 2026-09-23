Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12668C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=; b=T1/iRSOlJO+KKNeXjYgwM+vdc4
	HBr3G9g7MSMsROMHdOOCnvgbSJM9x9lDdhSE0SwNsnV91nKISP0ButyFDYgLfGoayJPeiA5CO/9Uv
	VFZ3sUWanMLr0uRVHCW5vEa9gRGKmcodlET4lpRJM2MmWjlVT9XXKgSe614FdFAYQilFow+nkkF/H
	9YaVWKdsMYzs5y2tW6UUf0hmqV13+PR0kfGXBddJRuMloTasL1OBkQY+8WVBZ5kGhxNF00VRY+dVC
	wNyQ4fVGgf3Ibnyay1n+7/abeaXxZWWeR12vtVvKqs3dtTsCBo5AzUeztjDyPOV0BuaTQ//SqgWGY
	Q9dYLc/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9L1W-0000000839u-3HUa;
	Wed, 23 Sep 2026 11:20:26 +0000
Received: from mail-lf2-x11.google.com ([2a00:1450:4864:36::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9L1L-00000008365-0q6g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:20:19 +0000
Received: by mail-lf2-x11.google.com with SMTP id 2adb3069b0e04-5b5e4f1651bso584204e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162413; x=1790767213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=;
        b=FBkufBCNdO5ktBltlFiQqhJyWGrjXjCCOKs4o4GGd5yz+RzfzctAhJQjLni9acQ1EW
         8fWmwa35aNBKDz23GXQk4G2Sa0Osm512UO+tSQu3j+BDdx7etkD4VVfLC0ZCgg2MmBx3
         /aDuR5hx7YMvw+Np0zkrS1XqLPEpLkvA06N2gYk+ynkRJn0pDbj1NJMgt5tUGQxRS8Jj
         rVof09Hdk1Vki1+DDSDs/1IkVC7dgW1fcam02lyLn7aAeTnr4BNFlocKMtQuHorgLYBH
         7orkvs5C4ukC+Q7mTVwjVG5EfFKM8Xo00CjHKeyu316zUfcVzZzWUHZmFysqA8uFHCWS
         /xbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162413; x=1790767213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMrTWA/cK4iFg9NfdW/xvRzKZHKELCHs+UzWlZTmsiw=;
        b=kdIozet90pZby1WCapWKzvcjEV/7MZk4FcQ7Pi2VjD/vzHABHyQbDWnsYv3VHt301Y
         ypvTpyv8SaxpFXJexofFhYCgEFxOI2QbxI3+gNCGcbDLc6lVfcZ6hMsueldggEFGJ4gu
         1wc7CIj3ixeEkOsAtZGMm9tqtP7wd1fyr1Jbp48AAomFhKjiyoLVVpKsd76ZCbjxAMo9
         1RY8TVDr4opJ82ln6qG7VbmbSFNE0kqIC3JeRTsjhNLEVC3MuoQ0xnRPbNyqyKAB/hob
         UIBfv83QEAiNs/yeiBah0TM/vo+yA/ihGimrTMPhrCp/X2wrvRckYv+629nXfeYYeTeN
         lWSg==
X-Forwarded-Encrypted: i=1; AKwUvBy179h88hpxW4U2M0SQzTdrj1wTE/6xXYL7zPCsOUFJYEcNm6Vzl4mw4c0olj3CbN1sKmHCOrtScw8202zhy3RE@lists.infradead.org
X-Gm-Message-State: AFuF++ntbaxVa5Dh/aIGM4y+l+rG6DHFHn3vA0Dbvkj1tyneS/irxE+q
	dxdevIkNiksZWTHGiuWFxk4HS9remnRmHGjAfvowOGgFecaSQAe45eX4
X-Gm-Gg: AYBFou3L9+A19tcF4GliBQd9b1j+XdQm41aAcjgVfy0LykU4KojyuH1b0nXPh5qzz54
	chHGm6rhiyCCcoT3IPjwQAnS0a7Z82VGfuA6pj6UB94xajffeg+xErBEQv7TGKKYaCqFIBdZdZ4
	j65VyqYZA/SD+TKxfPMzEdB0Acknz9sgrlokapeJh1fLADqT7mCplNxfUljj7fCLGM0GzR8JrpU
	CAkIZjFMUqV28xD4jMJkttulgQ3xtoHRsAsojW5QgzuWOKPg9ZRZLd6gUSn/jypi+KhVQtS+/EM
	v6MEhVkxnktnhXmpTj0ae4HseAQKonDIPWxLAKz6WUPwbgmFTeXUQ8IEE21Uu0c3H4wXe5TUxrJ
	djiZNF/5hvOxKW6XS7GSB/7uAZdY3b3nCDLucBpORFfKc/iNC82LKGuFqtR1t9eNPlN05KjLgpe
	t82bjzvZk7JinM86XO5GR8JznqMaLj0Dk+qaRxoipE4yKJJlPHNhN3E1/EBABq2IyeZ7544ajOg
	mrdjHRMmHrQ6zub+O4=
X-Received: by 2002:a05:6512:3091:b0:5b6:4ae:3ff4 with SMTP id 2adb3069b0e04-5b8d8967f46mr778397e87.28.1790162412004;
        Wed, 23 Sep 2026 04:20:12 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8595cb6sm516505e87.82.2026.09.23.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:20:11 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion overlay
Date: Wed, 23 Sep 2026 16:20:07 +0500
Message-ID: <20260923112009.1062-1-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_042015_673304_C0DC40B0 
X-CRM114-Status: GOOD (  14.39  )
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

The optional 24-pin expansion board carries two buttons on LRADC channel 0
and an IR receiver.  Keep them out of the base board .dts: with the board
detached the LRADC input and the IR receiver pin are not driven and float,
which can produce phantom key presses and interrupt storms.

Provide them as a devicetree overlay instead, following the existing
sun8i-orangepi-zero-interface-board.dtso approach.

Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion board.

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  2 +
 .../sun50i-h618-orangepi-zero2w-24pin.dtso    | 42 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d1f768dd646..e4576030276 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -57,6 +57,8 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w-24pin.dtb
+sun50i-h618-orangepi-zero2w-24pin-dtbs := sun50i-h618-orangepi-zero2w.dtb sun50i-h618-orangepi-zero2w-24pin.dtbo
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-yuzukihd-chameleon.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
new file mode 100644
index 00000000000..2d7e98e4b66
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w-24pin.dtso
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+/*
+ * Device tree overlay for the Orange Pi Zero 2W 24-pin expansion board.
+ *
+ * The expansion board provides two buttons wired to LRADC channel 0 and an
+ * IR receiver.  These are only present when the board is attached, so they
+ * are deliberately kept out of the base .dts: on a bare board the LRADC
+ * input and the IR receiver pin are not driven and float, which can cause
+ * phantom key presses and interrupt storms.
+ *
+ * Apply on top of:
+ *   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/input/input.h>
+
+&lradc {
+	vref-supply = <&reg_vcc3v3>;
+	status = "okay";
+	wakeup-source;
+
+	button-1000 {
+		label = "KEY_1";
+		linux,code = <KEY_1>;
+		channel = <0>;
+		voltage = <1000000>;
+	};
+
+	button-1600 {
+		label = "KEY_ENTER";
+		linux,code = <KEY_ENTER>;
+		channel = <0>;
+		voltage = <1600000>;
+	};
+};
+
+&ir {
+	status = "okay";
+};
-- 
2.55.0.windows.3


