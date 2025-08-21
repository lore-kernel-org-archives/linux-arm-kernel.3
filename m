Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921ACCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2daTJdOUs7gwwo4Y6Ley9/OGggF+jXeQxzTCIINH4FI=; b=vDzm+OTCXmVIwBB/3yc1OYzhOA
	RuedfA98Xyn5pLCRBkuBCn4Bmddk1Wad1KXkITzO8cTLzGnIJIiisXRF+BxVvZH4dFZsJ5bHte5oM
	ky2wpH6NENgBu5Hrcbl4mIb/M9IabTsrrUzZ15Cbn9XTJkPL8NS5HvmRMPVd1t7YUpKDrwygv6Oy1
	nxia2pdAwIDon8QIvPo4WlT3D1q/QPkVrDHEnvqs09d2OFUJRjQOXexW1r3xM65Gl7eCt4vjo+57F
	CxArVHaU5lmN7ewh355IUlv+Vkf/KRNmf2ptoZLPge+zul+Pjb0wHdF0CwLjZR2eCMaxr8t0qUuP/
	QSn1BkFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Ef-0000000HM1R-3iIV;
	Thu, 21 Aug 2025 15:29:53 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2yT-0000000GfzW-24p1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:56:54 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb79f659aso140900766b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 03:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755773812; x=1756378612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2daTJdOUs7gwwo4Y6Ley9/OGggF+jXeQxzTCIINH4FI=;
        b=YKlJD3Y2am5bwuPGNuBqtGBfJj9TSJR8dYOSc+tKZhGiakp22gidpD/oHRvUK8hj+N
         YgA4L1EHv6xAZWjw4YulYgGcMYeyofoa8rgLm/bNPHZa8UKkie1CjXgILc63r3EMh74p
         FwnNoFCdM9X3kCSPZfq7Nrnve6n0y174yXHdu3bc9vtIQqr51d93navrekk/IOPp3WI8
         8d6jrdv5thTkiaInoFrSbnBGBaF2HlXTwfSdTZH22c5lIOyRBMCy4KHDbIOIq4N6JW10
         PeZl/Db8jhF+Y7l/D0kv1k1a+FK8AlK8XSmopBS44sdDv9d3ovOOShD1/nTk6MwKCTrK
         r1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773812; x=1756378612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2daTJdOUs7gwwo4Y6Ley9/OGggF+jXeQxzTCIINH4FI=;
        b=ghBcPKR4iw+7nWRZpYXfA7rjSKuPBd3/0nm+XBVcC8JTL2XdrolQQst+QtiWg5UgVA
         c565mjuLaXuUbX6lQn+KAD3ARdDvYOlnamqVmKAqquVZveucke78uqOTYvsILk6NFYEt
         wDLkiyQDyaxfYp/1SVF+RLajK8UIS0eFZgfI+cTPZo9HQhMSAg4FbYjke0gim1S6kD7k
         5nFyBvdXL8tzltQ++MKQKCWRO4oiy7Oe4k5Ecej+/IG6WcSGe72VFXme9JcWseKSDss8
         C7gIpAi/KKjJfQcsTnGwiHYyT0poYMw/2WIDijIyadzBMbd6ErH9uUF/sd96WXUpPupo
         b29A==
X-Forwarded-Encrypted: i=1; AJvYcCVxa+1cTPrs6I+FSRwlSMCzNn5bDfa0vcztewlUmSVDrrpD967GDRkiAiW0LcEWzsQkrasvs0KioTrZuBaM1+bs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4i+Ay92zjv74STB9N9AiL6jJxkR6lGjlRXEDZszoFvemCiSs2
	C4fweraMeT0Dxm2rrUBKB43UYLvbRaGW08Q2zGCvtmMYdnj5PrDamat0
X-Gm-Gg: ASbGncsZBGEuxFIuNW1Y+j9T2w3pfxzDtksz6VlyHJGSc+KkvgNrRbJYQvjjm5geoN+
	/ZuLGXHg5nDKbPtvsNGE6bCFqKgdPacaRZNVXUIOxOmkLSQ9pTzCKeRFwTJ2yKttlok+ZLL6zp1
	xQAOdYAji+1y2WikCcMiLHYVKmmqeJBDewubjjhahEkCAShY/L1fYKBIQt3ZAzR1BcrfVYjadu0
	tyzoCkLnuyULZVXoNQ7/wbz5+cFjRojQMlvvZF+c+So+2efyG4VtJ1oEartDwK776iGMsHx1Rkh
	dL847cBB9JcEFPfLB3XYRT+acltDNNuMEXKDwkXC6AdFk+z1FPPLNT6GEq08uVPXmSRj4joTAqy
	IDI2n1LPkHsH3hT4bTsg/oxLPYzhW8xPgQcnzWuH0bFXeARMbl3Ts
X-Google-Smtp-Source: AGHT+IFEe+0qmb0RjWgma2YAE8GxP9EJJf5z+x4gnLaWMQuiKVo3goUUZWAAcFHsJ3Iv3pAdS9sTvw==
X-Received: by 2002:a17:907:3d10:b0:af9:8438:de22 with SMTP id a640c23a62f3a-afe07d9c920mr191769866b.39.1755773811822;
        Thu, 21 Aug 2025 03:56:51 -0700 (PDT)
Received: from DESKTOP-TTOGB9M.localdomain ([92.120.5.3])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afded4790bbsm373602866b.56.2025.08.21.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:56:51 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: imx8mp: add aipstz-related definitions
Date: Thu, 21 Aug 2025 13:56:33 +0300
Message-ID: <20250821105634.1893-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
References: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_035653_535706_C4057BAC 
X-CRM114-Status: GOOD (  15.68  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add header file with AIPSTZ-related definitions: consumer types,
master/peripheral configuration bits, and master ID definitions.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
new file mode 100644
index 000000000000..6481c484ca37
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __IMX8MP_AIPSTZ_H
+#define __IMX8MP_AIPSTZ_H
+
+/* consumer type - master or peripheral */
+#define IMX8MP_AIPSTZ_MASTER		0x0
+#define IMX8MP_AIPSTZ_PERIPH		0x1
+
+/* master configuration options */
+#define IMX8MP_AIPSTZ_MPL		(1 << 0)
+#define IMX8MP_AIPSTZ_MTW		(1 << 1)
+#define IMX8MP_AIPSTZ_MTR		(1 << 2)
+#define IMX8MP_AIPSTZ_MBW		(1 << 3)
+
+/* peripheral configuration options */
+#define IMX8MP_AIPSTZ_TP		(1 << 0)
+#define IMX8MP_AIPSTZ_WP		(1 << 1)
+#define IMX8MP_AIPSTZ_SP		(1 << 2)
+#define IMX8MP_AIPSTZ_BW		(1 << 3)
+
+/* master ID definitions */
+#define IMX8MP_AIPSTZ_EDMA		0 /* AUDIOMIX EDMA */
+#define IMX8MP_AIPSTZ_CA53		1 /* Cortex-A53 cluster */
+#define IMX8MP_AIPSTZ_SDMA2		3 /* AUDIOMIX SDMA2 */
+#define IMX8MP_AIPSTZ_SDMA3		3 /* AUDIOMIX SDMA3 */
+#define IMX8MP_AIPSTZ_HIFI4		5 /* HIFI4 DSP */
+#define IMX8MP_AIPSTZ_CM7		6 /* Cortex-M7 */
+
+#endif /* __IMX8MP_AIPSTZ_H */
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index b62bb821cf61..afcd8c785cfd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mp-aipstz.h"
 #include "imx8mp-pinfunc.h"
 
 / {
-- 
2.34.1


