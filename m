Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01C9C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 22:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3krEn/9cYqN/fDovrUoLGh2cVwyrKoWU5FC2Hs4k76k=; b=uyzaaHq/fuAQ2Z/+msLmcKIND9
	thutO5RrSTQj1q0le+O28kRWBzo3mwD2EyrbLQAnlSuRM3y8Xtjo5q5ZBL1BR3cr9MN9Muc3Hgf26
	s/JNwouaeotjaU+ZVtm4WXV7c7zufYknQbWU5XgRn2RdAIgotkyT7aWDCJIDaW+DhcLv6WLEv+Rvq
	LQ24zbWrPE+yAycLKcR1N5qZOEfKnOATV4/1m045AjJ2rGmIve9/SNPG4dfdx1OkA1LeKTslWDeD4
	JMkmyKAPXPySDtanknmW+ZC3FWVq1zBjNb1hd/fsm1Xf9PDNztIl8+di441Pfvx1RHQ70EM6rB6KB
	bD8vmyyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulERl-000000066PD-1Phc;
	Sun, 10 Aug 2025 22:23:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEF9-000000065X8-2Dpl
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 10 Aug 2025 22:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3krEn/9cYqN/fDovrUoLGh2cVwyrKoWU5FC2Hs4k76k=; b=IxLSJ/39RAZqjy37X4FuT8FzvL
	tRl/XeQLxwymdGd4T4e/BV7MOjEKop/aRQNz4ZMEgz6mm69qNgYtE/PhcKWEoILnSwK65+/jpt55o
	9yoL6skI6erd9Tu9SU+KK2zzvLpzIDFjPimYESroqYFQ/fHfBZUqAgVEQzJzfdkPiihWbyg3m8WhV
	Kky+J1Ppm0SC5uCEkhQoC1H0pqXm8VrrYI2bj4rqgvKenqhTNm88ZGSTd2xVFvAOj9pQTd/uBld8C
	Qan7ue8QjBs0r4LFQYYKRMziARJmTPZK1suUWKDWhMNGOTwCPqPwt48ZKft/3GBnWP+sA4Y4bLmHJ
	MEG9lydw==;
Received: from mail-pj1-f44.google.com ([209.85.216.44])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEF6-0000000FIxk-35aA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 22:10:18 +0000
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-321895391b2so1352517a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 15:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754863815; x=1755468615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3krEn/9cYqN/fDovrUoLGh2cVwyrKoWU5FC2Hs4k76k=;
        b=jQywDFQ+Ctu1l+cB/RmTdRZ/i8iBSSHOjgLrIu2t17sNK2O4IpYrJy14exVWt8OKN1
         FHlA0Z6ng/dcRl6xCy3kMA5nwf7gqDvLJ6OANwtSK+V18J8qHbit/g/DepZsfW0dX7p5
         E8ygXLlsk1C/8+zYpSIZxqcHxIxgtBFvKtBmvzh30Bf7Kzwd94vlAKJERjM1uGBtsglb
         rO06C4j+EwLONOcDojP93YoKmG81F0LcuOyQOpxwKjtUZp6l0+djuTFL/WGQb3tJvRgt
         c8vxZtr+q57XCNWNxFn9GglkeTjMhtxxyHPuiVzGU3tslCP+yOIxEPEeEj3Sfl6fyvJN
         BCuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa0LHeVOSAyNuq22xsAdABEDemoNyG1fPq8ffsAg1QygSe6mhSMNemuJXmkgFwiKZ4XgEhGK6/sNZbQrILYTwo@lists.infradead.org
X-Gm-Message-State: AOJu0YwTqfiRJh58DV9D8wN8EOlglifzyR5LuwAPMsdhbES1sp11IpgY
	FZnm2SIEs9mZWWBQJBsP4ERCBqPCzLRTij5YG4Bw/CxWrhzqZSyP8d4A
X-Gm-Gg: ASbGncs+k0SZj/R6shUe748NS7hWMN4gPuHCurlXVU4z4gtnTjfs95vMGbjKMcQkIHq
	UdfEAzh8q2x80asIdIn6f41KX8XlyLZNgplxzLwmNoORVHo/fgAvDmxLd4ayJZEzeHz0en3e4P0
	5yHpEyo6voP9EFBPHoICGmGj73IZTt4DioWLaXE21nvGxbWek/mIzjg4FeLDIeq7bJ0dS8AFgeF
	mIZ8w892F+VDNighFOz6MwNzKbScgaBr8VREwOqomDIbVy+gDOuyfr+35IfIKKw1bO+pFfDvycB
	tyvxoRqkU1Cv12NyJA24OugY1qsS6ZVKVSRbteXCJ4ON5nk+ipGw/swV/NI5JNeHm+/oLHPLx/q
	rbOn0/dFpsPN4yKIXtmlJsu39+db2nKEchZOTiTodGAyumeYZf1bYqYn21b+VaZvFU88=
X-Google-Smtp-Source: AGHT+IHVycpFEKek2S7JEZFXfX7JB07ZOO+8JCByaPzFT/J+gWDvifbNtQBaW8W0P+dVEavhKLSSvw==
X-Received: by 2002:a17:90b:50ce:b0:321:7528:ab43 with SMTP id 98e67ed59e1d1-32183c482fbmr17371641a91.24.1754863814883;
        Sun, 10 Aug 2025 15:10:14 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d6eeesm13150118a91.6.2025.08.10.15.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:10:14 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] media: docs: Add userspace-API guide for the IMX585 driver
Date: Sun, 10 Aug 2025 23:09:21 +0100
Message-Id: <20250810220921.14307-5-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250810220921.14307-1-will@willwhang.com>
References: <20250810220921.14307-1-will@willwhang.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_231016_949317_0C65088B 
X-CRM114-Status: GOOD (  19.92  )
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

The new IMX585 V4L2 sub-device driver introduces several
driver-specific controls for configuring Clear-HDR blending,
gradation compression thresholds, and HCG enabling.  This patch adds
an rst document under Documentation/userspace-api/media/drivers/
that details each control, allowed values, and their effects.

Signed-off-by: Will Whang <will@willwhang.com>
---
 .../userspace-api/media/drivers/imx585.rst    | 122 ++++++++++++++++++
 .../userspace-api/media/drivers/index.rst     |   1 +
 MAINTAINERS                                   |   1 +
 3 files changed, 124 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/imx585.rst

diff --git a/Documentation/userspace-api/media/drivers/imx585.rst b/Documentation/userspace-api/media/drivers/imx585.rst
new file mode 100644
index 000000000..9f7c16f30
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/imx585.rst
@@ -0,0 +1,122 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Sony IMX585 driver
+==================
+
+The IMX585 image-sensor driver provides the following *driver-specific*
+V4L2 controls.  They are visible only when the IMX585 driver is loaded
+and sit in the sensor-private control class.
+
+HDR data blending
+-----------------
+
+``V4L2_CID_IMX585_HDR_DATASEL_TH``  (``U16[2]``)
+    Lower/upper **thresholds** (0 – 4095) that decide which exposure is
+    chosen—or blended—for each pixel in Clear-HDR mode.
+
+``V4L2_CID_IMX585_HDR_DATASEL_BK``  (menu)
+    **Blending ratio** between the long-gain (LG) and
+    high-gain (HG) read-outs.
+
+    .. flat-table::
+       :stub-columns: 0
+       :widths: 1 5
+
+       * - ``0``
+         - HG ½, LG ½
+       * - ``1``
+         - HG ¾, LG ¼
+       * - ``2``     # duplicate ratio present in the datasheet
+         - HG ½, LG ½
+       * - ``3``
+         - HG ⅞, LG ⅛
+       * - ``4``
+         - HG 15⁄16, LG 1⁄16
+       * - ``5``     # second 50/50 entry as documented
+         - **2ⁿᵈ** HG ½, LG ½
+       * - ``6``
+         - HG 1⁄16, LG 15⁄16
+       * - ``7``
+         - HG ⅛, LG ⅞
+       * - ``8``
+         - HG ¼, LG ¾
+
+Gradation compression
+---------------------
+
+``V4L2_CID_IMX585_HDR_GRAD_TH``  (``U32[2]``)
+    17-bit **break-points** (0 – 0x1ffff) that shape the 16-bit
+    gradation-compression curve.
+
+``V4L2_CID_IMX585_HDR_GRAD_COMP_L``  (menu)
+    See V4L2_CID_IMX585_HDR_GRAD_COMP_H
+
+``V4L2_CID_IMX585_HDR_GRAD_COMP_H``  (menu)
+    **Compression ratios** below the first break-point and between the
+    two break-points, respectively.
+
+    .. flat-table::
+        :stub-columns: 0
+        :widths: 1 4
+
+        * - ``0``
+          - 1 : 1
+        * - ``1``
+          - 1 : 2
+        * - ``2``
+          - 1 : 4   *(default for COMP_L)*
+        * - ``3``
+          - 1 : 8
+        * - ``4``
+          - 1 : 16
+        * - ``5``
+          - 1 : 32
+        * - ``6``
+          - 1 : 64  *(default for COMP_H)*
+        * - ``7``
+          - 1 : 128
+        * - ``8``
+          - 1 : 256
+        * - ``9``
+          - 1 : 512
+        * - ``10``
+          - 1 : 1024
+        * - ``11``
+          - 1 : 2048
+
+Gain settings
+-------------
+
+``V4L2_CID_IMX585_HDR_GAIN``  (menu)
+    **Additional gain** (in dB) applied to the high-gain path when
+    Clear-HDR is active.
+
+    .. flat-table::
+        :stub-columns: 0
+        :widths: 1 3
+
+        * - ``0``
+          - +0 dB
+        * - ``1``
+          - +6 dB
+        * - ``2``
+          - +12 dB *(default)*
+        * - ``3``
+          - +18 dB
+        * - ``4``
+          - +24 dB
+        * - ``5``
+          - +29.1 dB
+
+``V4L2_CID_IMX585_HCG_GAIN``  (boolean)
+    Toggle **High-Conversion-Gain** mode.
+
+    *0 = LCG (default), 1 = HCG.*
+
+Notes
+-----
+
+* Controls are writable while streaming; changes take effect from the
+  next frame.
+* HDR-specific controls are hidden when HDR is disabled.
+* Inter-control dependencies are enforced by the driver.
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index d706cb47b..87912acfb 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -32,6 +32,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	cx2341x-uapi
 	dw100
 	imx-uapi
+	imx585
 	max2175
 	npcm-video
 	omap3isp-uapi
diff --git a/MAINTAINERS b/MAINTAINERS
index 175f5236a..42e32b6ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23183,6 +23183,7 @@ M:	Will Whang <will@willwhang.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
+F:	Documentation/userspace-api/media/drivers/imx585.rst
 F:	drivers/media/i2c/imx585.c
 F:	include/uapi/linux/imx585.h
 
-- 
2.39.5


