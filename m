Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188F1FCE09A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wFTR7lhD97LfedhQI2IEmT24MfcevcT3nwblhyoeQS0=; b=hIJGJPc6j5G1OuXU/G4sVgmJ30
	u4MB1Ccum3vT8Pf1pzQYnHfVq41igTmJsbGtmAiujCNp9tnH1ZM6iPNOuXpO3pd+per5AI6f2XtY7
	SiKaS0vjFgh8klwAVIaJylJci22PonHeh0GA0E1uOWm9R/S2UUCGiQZsC1ohR5YDm+FZP0SiWieWl
	3/Db7I6x19ry9jaPsWvAlkKitoYSNCwt6q0+jX5yCVW43OIDpmKzreBX2h6PUZUhFdQ7KKLo/Thof
	JuSkvMwdeeyeMKhY7W7tylf97T8o4id4QdQ1rU6xzT5KvaZBvdPpMEMzWFnb6624nAivDAmHZViZa
	k0c0X+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcfg-00000006N7K-0XQL;
	Thu, 26 Feb 2026 14:48:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcfd-00000006N5X-2TWr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:48:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso8074795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117331; x=1772722131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFTR7lhD97LfedhQI2IEmT24MfcevcT3nwblhyoeQS0=;
        b=MZvtdmZBM19Itd9bqt2iJw+WaUhrCXHZ75AchgWlUzTx2Rg1j8OsI0l8A+DhB54ahQ
         LZGWh8Tom7jYoLxRP+GybTZNJLzvWo5W6IjfqKK0YC+7ybyailMqi7QGIzO2gsbEX05d
         XOP5LNEZ9phuvcwEoHYdkq2GeX/FZU4Jc32VjA+LfzOGV20m3JXhfCRKWZENWUacSKCj
         G/Fw/Y0kncjQMgetF7/3/E77AvtvGeHoey/weFKwNrFi3hjno3JY4GvneHYfQDtLtBTR
         f5BWU7USqU8LKkIgMb+myIFyhHHzQuPPfAfgHj7w958YHlVVRsq7WheDFYsTRzX6zai7
         qFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117331; x=1772722131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFTR7lhD97LfedhQI2IEmT24MfcevcT3nwblhyoeQS0=;
        b=ZzYo88rxuUeNKOlsmoGh2SOUKTgbRx35/uHqj6V5p/KQ1ry+27Tp/Li8A12jH50Jyo
         ga8EIpEkAMuPj1rwO+ot26Ph60meCS3Ca1ZH+2af085IkxvHPqeU7ZpIfYfk5pQfTSBd
         FN70wrTxKRhkJ8WS6KQsrgd4LgP271+QCnpgOk7Q702uS31Gyb55fCPctZPwLaNkoH0a
         ajh0vdaVzdk6fjmoolYcQwyf9iF8wLkUw1T9SB7Dv6hC3R7kUGVK/6z63p/HOWRreb3/
         i0JNU6Yg8Epvgq+WSObE0MtJp1vByzgHfWuGXIL7wFgLhH0iBDGlDUOZFbRyl7a5cUyv
         8xMg==
X-Forwarded-Encrypted: i=1; AJvYcCUt/QOSWeePUahb0ZsVi/CcZnRJne5svZPLI65qnX+jx/dsR3ARNjPss2DriYGSaVQE15y0XNv9DokxBdEZ8sT5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw82JybiKpFFnY11o+cBHut2y+g7wUDSk1VhfujtGOagIcNlD4j
	gFx4tfUYV7GuDtkXueaM80URRNI4BzwOyXrvlFcZJppfRQZLkdMsmeNf
X-Gm-Gg: ATEYQzzVgfprIUXyrgE7j8TnF2Uw2S0aRke70PbLgC0hDgXGBDPjpIE5iomu1QmL4HH
	2wwT/dtLhBHY089fZ4BXlz1GdIqf4MR5HR3mb/WdOE46+xGZdT3KXWJ2amcGc76VnuS48TgebIT
	p6b/USNFIeKLSWgTG7ZlPAIIXSZXiKyaTX6sVY5UP0WTH8WkhTv9/XS9l8ZRiIRqMFjGCMbj3tZ
	K/dxda5lhZcFHnzPYn0xXGbSM3plQ6KSskild1LDFzXOXraEXFGmzkLHg8GHZCK52cjj4BbWXwS
	+uGA8IkAzgJdxD6+5bUz9YKBwFAp6HYMjwyfiA8gHZVEsZ71ehicRyvbZXaYQ16g4iF6B1BtMPp
	ALYtPNUi7az9bucg/1QJ0MPiOlKdnaI47Py7cjBfZ7Gd7BxPV20aSqHHC6jlSVjYxHhOgkygdaq
	RVo13X8opmv2Y4jm0iYpyiHzxTIw7U8oujLZ2Aj16LGS3D99oaKVIlBhtWxqWXitkNtEHm
X-Received: by 2002:a05:600c:8b6a:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-483c3de6856mr43250455e9.19.1772117330946;
        Thu, 26 Feb 2026 06:48:50 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4766:6506:d16b:e2d5:7fdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm91497075e9.3.2026.02.26.06.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:48:50 -0800 (PST)
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
Subject: [PATCH 1/2] ARM: dts: rockchip: rk3288-veyron: Remove invalid property
Date: Thu, 26 Feb 2026 11:48:41 -0300
Message-Id: <20260226144842.2727107-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_064853_634503_E83DC93D 
X-CRM114-Status: GOOD (  10.01  )
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

The 'regulator-suspend-mem-disabled' property is not documented nor used
anywhere.

Remove this invalid property.

This fixes the following dt-schema warning:

('regulator-suspend-mem-disabled' was unexpected)

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts  | 2 --
 arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts
index ade9cc291813..d7790eebfdcd 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts
@@ -91,14 +91,12 @@ vdd10_lcd: LDO_REG7 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1000000>;
 			regulator-name = "vdd10_lcd";
-			regulator-suspend-mem-disabled;
 		};
 
 		vcc18_hdmi: SWITCH_REG2 {
 			regulator-always-on;
 			regulator-boot-on;
 			regulator-name = "vcc18_hdmi";
-			regulator-suspend-mem-disabled;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dts
index d665c3e8862c..20fe84683928 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dts
@@ -246,7 +246,6 @@ vdd10_lcd: LDO_REG7 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1000000>;
 			regulator-name = "vdd10_lcd";
-			regulator-suspend-mem-disabled;
 		};
 
 		vcc18_lcd: LDO_REG8 {
@@ -255,7 +254,6 @@ vcc18_lcd: LDO_REG8 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-name = "vcc18_lcd";
-			regulator-suspend-mem-disabled;
 		};
 	};
 };
-- 
2.34.1


