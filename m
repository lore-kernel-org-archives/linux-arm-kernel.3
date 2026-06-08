Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB116CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJZ2SsrLyYdhpaIk7NOSs9hYatpYCTJ+2tcOe2ZTmuE=; b=qGdg2M2ZAIuslvVSwUOvASWIEy
	Swn1PBQXHISSDQJJ31DBV5feD0wyuZ0FdAkCvKBYKtMGO384/XF9pOLPHH/3HHX0TY90Xbh55KdJB
	J5t0Ic5SIB8Q2C/4AOkPIvIjpSacn9oZD/KjqLDYJvOxhX0b+aYjH1ZkjrnSimCDrd2rQJLEuznZE
	O/wlizZq8zmqa+0eMjRsVqnKx3D/UOWd4aoXPCH6S6tCLpvi+Bo0QwU50TS3yVBMSxyPnZ9++fYKc
	i/mmG1ziK7zHHo86S66ybTaT4Unkps7tOEBhVizaGvfG0JAPWgrwhsKyFioZdvkkTlRsZUIMYidse
	nOLKVjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvS-00000003Hc7-2lub;
	Mon, 08 Jun 2026 10:09:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvO-00000003HXW-3TYB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso2915685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913381; x=1781518181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJZ2SsrLyYdhpaIk7NOSs9hYatpYCTJ+2tcOe2ZTmuE=;
        b=GBV9ShPaMGUhPphFLg08FrJCs08U1SOsaKgy5bAvfQsd1nMMUf5n8xHWFIHq6NwJqT
         9uJQ9H7KG8R1xmjXiYuhlb+VBIksU6vYr8EI+Y3MwjI78yqODDPMSGuj7uggu9hrdNb1
         a9QEyKtqhpwd6b/+Pv59wTrZapSD0gp494XbNTub/yzG9BIgwh1IxUMmuv94S7fis4TC
         utDLGLLOVKNeB+qm/ga8iEjyoagp9n2gjVPljY4z05fFZVuEDfPx7PI7SE2hJUx9E9sU
         GbBz0U40Hp4xXsRJLEArGnwAEtn8qmuJ619FlxFGG5q+cHgwSsrQP4CDuBIHqCHgE/5g
         Q90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913381; x=1781518181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJZ2SsrLyYdhpaIk7NOSs9hYatpYCTJ+2tcOe2ZTmuE=;
        b=snEvB34GpgSFxnggXmSsVnB4bE8ZsYpk2t9zYFNo8UJk5qzAjsp/yShes+lFMXuFcf
         I2dcYrXDyM4gaBDJHTQRlBKquGL8/DIWmtworcrd72KxMriH10+7WxKQuS9el28sNhb6
         nTVE8F9mu8ELMqTnamD/BcCgb91qyMrekOMcNIcAfsJphuEHhvitphQSfvm+dJ6/OR5u
         G/4CA+xw6kAyBnYbZ3vls2YPwSkvnOJj3VzQhJvxlN3c7N95re3RCSqiyzpvIyD92OKd
         bT0xJkKLf8ps0Ium3sigOnDzNuHZpbBNXbacLKcf/7NjC46xumQqYavaE1RM3DnU6V9n
         114w==
X-Forwarded-Encrypted: i=1; AFNElJ8UncsxDE95XZ9KkQLl+b0xhD/aKdsI8ZFlxlweoJPP430EbK1AwV3JyKua5v8cSEq35tTX+FRC9DRsxEphMigs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8fr7lAhke7c1wPXceSdLyqAeE3sgBI1GvOvqfveCR5uMnUslG
	iB6FHJWgKWas99cMXobq48k1kyYEYw8FrZ3LH3ybyHCueEhqzSVW3XB5
X-Gm-Gg: Acq92OFQu7Yo21K3zZuCA7nMkwhEapmxyp6Rw3KM4oNnLs45DP06pMQdznX9PK5DOBS
	zXG9584kE2W4o73aFI5rtchbHhfna+04jOxBN+ku2Y4csEujhLtEYiro/sCKh9TYgAnxAKJxXLZ
	d6UsdvS/qjllDFbavqnYPE+iMm3Sz7XVC2Ph4zr5dgyVaYKqjb/10woE5J5+fPBHeDmobxKzVbk
	AXEDSM1evhEb8R9SrDKVYpBsZoaThuVW7ZD/6c8hZy4atbNU5WAh7gzNvKH/2ilRvSfQghQ18Eq
	/6KOgAsY+jrijutan3XODvpNlCFdGuCgHepD0ZWktAGlxbf2D4S10YKDD0ox31SAG+m32jKgDxA
	l1zn6dAcMqOaOMk41OwiQXDwtkBaMMQ9HVNvdNXILU1jOG9Yp2c/W04pbBcYjvlM/zSKUkODLpl
	8PhLb4oofzj5U7DtRnwm//P1zWi63avWFUeTrMiwecQCA/2mXE9YfqDb2LbUf/GzytD+NnLDDFn
	4n9Q3Au25teQWPXSuipq/XZJUAm2o4VQ0XV2N40tSUnwzLR
X-Received: by 2002:a05:600c:8b70:b0:490:ae94:a7e6 with SMTP id 5b1f17b1804b1-490c25c20e0mr231115895e9.24.1780913380888;
        Mon, 08 Jun 2026 03:09:40 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:40 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 04/14] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Mon,  8 Jun 2026 12:09:22 +0200
Message-ID: <d940e6d16047eefae56c866ff619fe952bbb89e9.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030942_886349_C492074F 
X-CRM114-Status: GOOD (  10.66  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index e9fcc491e5b2..7b839efdbcbc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3


