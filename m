Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE470EF9002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 16:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vSqwphXV0lntnfqs2BswODSP2JF/VYqeGhd0vIuj4qw=; b=ZJqtBxUPCObcf++mUAH61iN6yD
	3NW964jwR3qeNTQbZtPZdiLQvWuq8QNTjLuyGXWAP6sTvETBeGYRODETnNz9oaaGAG2KsLa4YLH1I
	px3Q9Z47Wv9KOjADu013Zc/oS5lLbmJ/hmmx77nfjWuoGhIKdAK5+EEuGLNTI32DkjvsFdCdZPuBe
	FQ1m7MBr5TfJ7lrKdssJ6fRoZ2Ej/ZqSLUq0CD/Lu2hROvjVwEW+qkAxk5ELcVbm5HWY6Ny/W5e8V
	dZHpbf/7gkprGGzau/nJ8wUO5+JMGZYh01G5oyCfDUYWxZMr+aMhYMx0DgazcFrbqPc4afWALS+ac
	b34u21GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpLV-000000006Jv-2VAw;
	Wed, 04 Mar 2026 16:45:13 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpLS-000000006J6-2XNZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 16:45:11 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-56a9402b52fso5922227e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 08:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642709; x=1773247509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSqwphXV0lntnfqs2BswODSP2JF/VYqeGhd0vIuj4qw=;
        b=E1BBjCzUNyMfOHqZ+inChVfIfeL77+xsaQDVU/6ULTm4M4wHS4hXvYLZYmMr1FKSL+
         Trw29xzmZ7IZj20tQjI5fZrKw0SE5xlwNAh4bQI8oE/JqRlgapgS5xySygZSqqoJ6SqO
         zJ3kV8BxLlhkTL8Nzv6q6/c/W0cQ0221HOWDzwKBi8ipJhb+2/BPxG339SPRq1Fe7cYc
         hmLey9f7d+i+Sd7sUVdR9SQ3qI0o5Tz3x+Pvt3MRPoSTjWiYK5FYEebnKWNhNseOw9f9
         yDzvB2iLpMkQ5blUTT/cNTZ7lr54wyNWLOZahgcMRJKv3z5eRL+v7AGdp9PVt0KfqYsx
         sCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642709; x=1773247509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSqwphXV0lntnfqs2BswODSP2JF/VYqeGhd0vIuj4qw=;
        b=ZbwVw+QvQCj/xyGUvKj2CLCxUfb3mWVOshcdsmJ1kO2t7jjIiUhSQUQyr3t063vSdF
         d9mcHS7gzcDcojEgTyKwfXFdjmwOeKnJ8AUDns7+Fy0gn1mvKenhtcw3siAkrcb2mWRC
         4URBWNj0LlfN/gVqux4eD5Y625Zqo0yFI5fvGWjo4XzNjxRg8qkTjo7q3toQ0I0fhdAP
         BWdUpmXws0tQWoCp3j8VI5PnQQBtIqls2JCLcxPTjJFdZ5EBwr5HJmd1DACYJ2M+youT
         uHYruAv48AU8vHoCexRAe0L5eu8T8VTcFpwIzWywtdlXF9nIq4v3vNrpdkxrG6Ip9dVh
         Uhyg==
X-Forwarded-Encrypted: i=1; AJvYcCXNcJlxQJ0bEwCCKjqM7VcxcWm8QCEf+HufM/Rlp1a2caNZ3gS9xPXRiUMZmuWVVHamzCO5kBtVUfbgusGqxLTl@lists.infradead.org
X-Gm-Message-State: AOJu0YyHJKf5ABApcr+9E0WVvKH1oWBFMhr1UcX56iLUC4sGdp26KJ7Q
	QPV41v1v6pEKxJZpLHwi7mVP/RmjVnNY69m2Pw4Cs91oOq99KVWf2hQ1
X-Gm-Gg: ATEYQzzVawghgMgWO0fcVVj7v9yeUq96xyh119TWiI7UQXVhiVjtCptgBzYxdPSDUDU
	XVInssybiSwJ2YrXnQzyFcTXMAjMT9gG4vvMsIy2svPlvzq6qjJybhtyav+k/DJNyZ7MLf5Hooy
	/tEl4UhXgZvYdx4czBTNKK665qA0vEzJc/ySvY1lMoODII4R49NuEjrp3art3x4afm8F9+f2Hjj
	oCBgRfFaNFRNF/zoPjmeChz777ViB9osoAyI7yFHSJzB+YSKe6HD9OmLNyeGgtR0S/Nbjf31sR+
	m+/kpJdcqVXm0aJTrq03fVAWTCAUcbW1D6/gNrmWqq6wfFi5aZaVBrFzqfNQ6qEm+59BqAMWSMC
	xeiP2H7ANnCs4wUaMOmm4yGsJz45uufFONroyriRmlGWV7IHKMER5YYxwuA6qJf4jszrc39pMfn
	JTH+llYTWNW/OSvxL39dszZA/OA8HWBNpKDUWrfRDBczfCsUFd+AW+roJQjOGOkz4GGe6hSCUhl
	gMQwSs=
X-Received: by 2002:a05:6102:c8c:b0:5fe:f14:e701 with SMTP id ada2fe7eead31-5ffaaf11d15mr1217828137.24.1772642708940;
        Wed, 04 Mar 2026 08:45:08 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:1b3:a802:8875:aef4:cbcc:b059:892f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e845aabsm20613914137.7.2026.03.04.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:45:08 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ARM: dts: rockchip: Fix the trackpad supply on rk3288-veyron-jerry
Date: Wed,  4 Mar 2026 13:44:48 -0300
Message-Id: <20260304164448.1024410-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_084510_651199_22CC19EF 
X-CRM114-Status: GOOD (  13.17  )
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

According to hid-over-i2c.yaml, the correct name for the 3.3V supply
is 'vdd-supply'.

Fix it accordingly.

This fixes the following dt-schema warning:

'vcc-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts
index 6894763979f0..0bf03b1ff2ab 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts
@@ -488,7 +488,7 @@ trackpad@2c {
 		interrupts = <RK_PA3 IRQ_TYPE_EDGE_FALLING>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
-		vcc-supply = <&vcc33_io>;
+		vdd-supply = <&vcc33_io>;
 		wakeup-source;
 	};
 };
-- 
2.34.1


