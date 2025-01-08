Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C206E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 23:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWPloh1b9JNANrh2tS83xtQVSDsQsvCbsXMQQp+hxms=; b=YumuqdYOFMupnsRZyJ7ppS1Ghh
	0Urdoe3/0UXFNAUShRS4r+RGE7zv9OC96MMbVN5tNqDJ8kPpjO8jNhb8WmOtrMrlnS59aELqWrVi+
	iduzY3f3IJd8dB/KnVHFT43yAh49Et8pQBE/zz3D4v/4W2olvnTINKfuF5+DWPEGlW7Nq663YQR+o
	zmhyRl5mQRnnYLJCTFi2DFZO74mIiBHO4MBAgDaGp3x14FKTcUMgiZBwoTg/ikebgm0AuUy2p3fwG
	T34eHha16aD25RMbUcgG+3UJyx4VcSW8LI36kuyFCKHW5rVGhbFVQ+yzKN0Hr2kM5oZnQYGtZsVMz
	kx6i2J0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfr6-0000000AC5l-2Bno;
	Wed, 08 Jan 2025 23:52:56 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfpk-0000000ABzF-1zGD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 23:51:33 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-85b8c94a6b4so107282241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 15:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736380251; x=1736985051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gWPloh1b9JNANrh2tS83xtQVSDsQsvCbsXMQQp+hxms=;
        b=Dp4+o0mheQGqVYLsjL4Sxl5MLfWlBLF/54K5snnqATNcd0aoQ8FCaBISAhWWEv33Xz
         0+56Of/qWedsIjE6CXNmjpFrOiNur96Fdcwiy+y+Am96Vd79SmM2jJ5+2Abf7HS7vbpe
         R867sDd0yPYcK8OQYx7hjmksoD5Nbjp9Hf7RzAPdtJaXoI9xcjpFMOgCGaUrnjRQVSPB
         m25mB3gHkLt8RxgRtyaJ/lOVuM3b1B0Jbh+yFSQqBvMLRQaotRrgU4rMU53+x1oYQzDe
         tNiWrj7n3g8aXBOgiWYOvbIijhnAIVUIbT1xkxa2cBUpN2zNwr0vclZORxjFW1i0O8g3
         Ohog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736380251; x=1736985051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWPloh1b9JNANrh2tS83xtQVSDsQsvCbsXMQQp+hxms=;
        b=Ak2X08WYWGi90BY33CskTRCyrbpc2S0/EUT7J+fABHaY7fdpjpZE2tSknrF0qyPGwe
         TKtKS9uulH+aQy+KMhiC0bpmN/r9x32300Sxt5jZ+W0X7w64WH4tpbJuu/BZbZhr78jw
         V9XD18YcYY+B1PM+Yj8i4G8sjWwSd1u/sSQpc7x8KMYibFqNsRF4RjTCE3VADBNe6WaR
         NSapxSS0QQgngyTczH2EXbIYiR5yb8DdQ/BL6heAxfrLcYVUC4DyZYc4dTiAhMftx6wf
         l9uBsBulm1jbAJjPSacV4UoOFbXEcBRi3AMw/fVMST2vk9T740aQkIy1hluSxg9g3fFx
         oKMw==
X-Forwarded-Encrypted: i=1; AJvYcCVkSqRt+Y1GYZSB4p+WNPLY2bZ/2oye03C5g4zgA+uDC3icOhueQmO0tXP1vWu4Eu7grBejudjsCbz7JuZmccrI@lists.infradead.org
X-Gm-Message-State: AOJu0YzpbCJ4cBzejdO18EIqXMJfPXUd+MXWROLOqhc8MRnBIinhftz4
	jLSQX+7bcz1Gm4eI+0T8t9NJ1OE8mtjKt7Z0C+iSdn1IofczbVOXx+gSNQ==
X-Gm-Gg: ASbGnctfzJXZPGV0EdOVJu4lzZRicPOC3dHnP4VNAZrWDR10K4xfkDwJGJvLtewUMX4
	ae+4NThG3+1EpIQ9g8pV8qX4ZVbW2q06J8G/utOwI0RHxfbrID9Ib4Hi+MP8KE0iprwDZE+n+wI
	tPGU9zH0VEDqa8nLYCr/ENL+QrFqG0GzxQRWANcSkmK/KjUmsUcmJNEMJowWnt2dY7GRx9QCdUP
	N6silHwG3Yqr5SBiwGRHtLt9vSEZxyGthLsbahI55WtcOto9PbadHu2m5T3HZiwR9HW1g==
X-Google-Smtp-Source: AGHT+IE+wfMODRLMjuAMDTwfXKanIVD6f6M2e1eSuPQ7GeiM0agNhDqGh8Trj7BMwSFv6R88sv/urA==
X-Received: by 2002:a05:6102:c4f:b0:4b2:49ff:9786 with SMTP id ada2fe7eead31-4b3d0e8ae3bmr4684908137.17.1736380251232;
        Wed, 08 Jan 2025 15:50:51 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:32cc:f64f:9e3:fa63])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b608f890easm78053137.19.2025.01.08.15.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 15:50:49 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] imx53ppdtouch
Date: Wed,  8 Jan 2025 20:50:44 -0300
Message-Id: <20250108235044.32209-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_155132_518996_705D3582 
X-CRM114-Status: GOOD (  12.04  )
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

From: Fabio Estevam <festevam@denx.de>

According to atmel,maxtouch.yaml, the correct property that describes
the GPIO connected to the touchscreen reset line is 'reset-gpios'.

Change it accordingly to fix the following dt-schema warning:

'reset-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts b/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts
index e939acc1c88b..2892e457fea7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts
@@ -593,7 +593,7 @@ &i2c2 {
 
 	touchscreen@4b {
 		compatible = "atmel,maxtouch";
-		reset-gpio = <&gpio5 19 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio5 19 GPIO_ACTIVE_LOW>;
 		reg = <0x4b>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
-- 
2.34.1


