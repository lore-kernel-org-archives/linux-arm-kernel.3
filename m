Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72D3C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPzjBHrzzVCbUkGlqURX2pauy/TIgkOkpaFezU8RL+8=; b=r8OF58HbaT7nl3VL/z2tyc0bES
	IFnmjZtZLoCUtyFybID3YvO6luMh72NXi7dDUsD9iu/WVpr/WHHKq0sjNEHQR2zi6RNgfFUmjO/qc
	c85Ik0DAABtB+bUGUjOaMG3Gwe0qGkChDuemyKFVmvjxj+mpFkV/Ji5++iuh08FpasZHFNsZzW1ED
	4AQTozcMvRo81EeA0MAPXb/5sClw2TMjWcisfDcap07qmDqKfkKPDwy4mxwwSC76WnlMq1GXKxsbo
	iFWh4Er3u/rDU+2AClvO9terdrKeUUIZi8+4AJPQG4VzA+aFUm8f2kIFTjbAWwEuYRgsnbbFCv5mK
	zDgCxTkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2gQ-00000004yyB-0Y24;
	Mon, 17 Feb 2025 15:05:18 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2ZH-00000004xdP-3avB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:57:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38f1e8efe82so4922873f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 06:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739804274; x=1740409074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPzjBHrzzVCbUkGlqURX2pauy/TIgkOkpaFezU8RL+8=;
        b=CqaxWJkXbzybiGKDkp+wTXurHGo+GqbjN6EwrtEoJCIgHniYHqcLGM5CqTks90dXzj
         orLaqXO2Redx8X4fDow6/d9Xdw1CEbox7Er0IqddbD2XXWu7YbPMd5MZORXWHa0OrY80
         rSzQJvNHhFvmvXCvBm6DeV38vJMPN40yt4a8Bx6fpU+irORUtOyxGtzvDYruyb044QdA
         xb2VDpJr1kgsZ8HRsAE6FgScm812CB0Db6q+svNC88lmOyhaf58xBuPzqF2fwBKWEb3w
         ydOYOAaUIP+XjobeDe/cvdOXUr5E1opnGGdSE2juY8/6vosSRwJaNkFZVOSHXIHqsi/7
         AjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739804274; x=1740409074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPzjBHrzzVCbUkGlqURX2pauy/TIgkOkpaFezU8RL+8=;
        b=G2bnYoo9U+bQd4NhVl8qPY4b7nJR+UGzTSTMnP8ZmtA5HnzMXjAislxa/3llJHzLhj
         qkPJaS1Zs5yggBJJZ+sVgBf6uLnsvOo4y9BnCEBrYt8VTOI98kJEPkkelu/AcycubtDI
         cgH1uOBvBztNbog1I0gd9FIAMLewx/uWEacFO/uppV6Jg5Cff5QYftHTmKL9oo+1aBzJ
         9PAqFLPqb2n6/AaMZnz8Lm6OHzzlefqmpoNqWU/+eVqeT72a5j4pY+XDXhVSYzD+hkFg
         GDOjNfdKpuKZ24g8SBX2nkuKX0xrW3tC9C5onELNKsfPzCLheZWAjOUIXDYackZd5eZg
         NBqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVw0H4Kph0LhSc9l4BvyLgs55QcHohNl2Eh7MJGiWXItEUnlOvU3ODfA77oyvL1Td35KocYh8gBD0cguxob3Hl@lists.infradead.org
X-Gm-Message-State: AOJu0YzN1ez4NUFAyKEBN2JgFHGlvOqCLQt4xNO48vk3OJ5fpxpyATAy
	LgQed4mGuGUG4fJ3D5aBF2RiDTH3n2J1BXXgzuh9WNIh+rnGNwCM
X-Gm-Gg: ASbGnctDmfDtTnLjakGLmVzxHyLYPVLjA4iAHotGbdWVd9cDYO0mkm79pcTjdtD8kBq
	QqW6A364VR0nhkK5Jovq3JUuf4wObHIxeh3rJyeR5S5M5UnYn13UUaQPObd6YLE2yoFxC9D79Dm
	9sqngnqXNeGBrzAukKDrlPUq2EqNryNaftsdJPV8gFPatep6AfnZ3oHm4LxYSlrB7pEL85LAOYh
	qzg2LA6/l0u3u0ILcrAj499XH4kwlPe/YccSM+M15DHLgOLJ4k8he++3g06DeukdTBaqq2nYtd9
	cbd/CrvPN7DbF+JxvxH4Cp5Izv+k8p8=
X-Google-Smtp-Source: AGHT+IGK7+cIXXgIKkuykxAfls8SaqI808N2jXSNqI/UIxUmdRXsLloVYzsBEB3YjD9VWOD/Jw0UYA==
X-Received: by 2002:a5d:438c:0:b0:38f:2856:7dc4 with SMTP id ffacd0b85a97d-38f33f62c72mr8242324f8f.55.1739804274078;
        Mon, 17 Feb 2025 06:57:54 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:48e7:ac19:aeba:f677])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915146sm12645020f8f.56.2025.02.17.06.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:57:53 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx8mp-verdin-dahlia: add Microphone Jack to sound card
Date: Mon, 17 Feb 2025 15:56:40 +0100
Message-ID: <20250217145744.179213-2-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250217145744.179213-1-eichest@gmail.com>
References: <20250217145744.179213-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_065755_916748_71DEA375 
X-CRM114-Status: GOOD (  11.47  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

The simple-audio-card's microphone widget currently connects to the
headphone jack. Routing the microphone input to the microphone jack
allows for independent operation of the microphone and headphones.

This resolves the following boot-time kernel log message, which
indicated a conflict when the microphone and headphone functions were
not separated:
  debugfs: File 'Headphone Jack' in directory 'dapm' already present!

Fixes: 874958916844 ("arm64: dts: freescale: verdin-imx8mp: dahlia: add sound card")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
index da8902c5f7e5b..1493319aa748d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
@@ -28,10 +28,10 @@ sound {
 			"Headphone Jack", "HPOUTR",
 			"IN2L", "Line In Jack",
 			"IN2R", "Line In Jack",
-			"Headphone Jack", "MICBIAS",
-			"IN1L", "Headphone Jack";
+			"Microphone Jack", "MICBIAS",
+			"IN1L", "Microphone Jack";
 		simple-audio-card,widgets =
-			"Microphone", "Headphone Jack",
+			"Microphone", "Microphone Jack",
 			"Headphone", "Headphone Jack",
 			"Line", "Line In Jack";
 
-- 
2.45.2


