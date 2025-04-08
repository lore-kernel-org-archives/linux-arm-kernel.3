Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D1AC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maaEXNzrca1Kg4OV2OKYRdvmHiFVuGZqAVh5fMF8Ylk=; b=I9u1eJBsHLun4zkxSFXBL/fjC9
	8YAbosFiAEtRRSxD8+yZCb6zI+OQLar4ZtSt7XvOOOA8QmTsV+DtwqsMW4GsEIt9yIos5VZVOKA2U
	z5BsRoJAZZpNfLyaDw4n2Gc56bvhicThZQmqBubbZ3nDxESTlVUrtvQjkMldSlnfOQJIb1jvTGwt7
	Yo+YQ4E9JXJkI5mGivFWcp8Phn6DQ11Y+TXmvYXqMV1tNzwlVUw2jQSw2nGYiEXmsPkRkZdqwWHR1
	I6rdT3SxyF9mjYCkqgWerjjoT/EzRthkfi9tkmp8ImbBBKZYMrs4GH3LPCc592luyG3v2TDwm8Vw+
	X1YnAixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BGl-00000004hfg-2ypF;
	Tue, 08 Apr 2025 15:53:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B6N-00000004fpL-2bZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:43:05 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso53750925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 08:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126982; x=1744731782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maaEXNzrca1Kg4OV2OKYRdvmHiFVuGZqAVh5fMF8Ylk=;
        b=jjuXelSqEkSKEwMLpIGNUm7lZNE3dSstWQLdns7QVkSe2hIXe07Jcz7/NmKnaBzZQI
         v7daXb+msVSW/fQjk6P/oPkvyhNPasOjn1z7N+BtCryr73xC5uJ2nb3McHqQdx5I3TPa
         NT/BMMHjWQfft+hyrkkMQID41G+JZI78xjrGBms3E1D+mbvD/Ig8YCpKrL8bYZqOGo66
         46XjHpgfUEmiJbEKDMpEiQqt2QNXqh6mGfc1ELTUrLemv5PYIQd6lcdlc3AxlJ3sUhGb
         wDdEA0dg4jCvZTppYQRBONzRkMq2xM/NB6JUwh+H+sr1Ja++VJlnb61DTw4MTMNG7K2s
         x/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126982; x=1744731782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maaEXNzrca1Kg4OV2OKYRdvmHiFVuGZqAVh5fMF8Ylk=;
        b=dF0E66OdZIgcc5UA4u9BBColxOuzG+UTCE/ansq1GQcAiKo+6hUUnT0jvnDJYxsqr/
         kLFlDajnJq035sh6p1gZpppEYH6GoKRyKWvTb+lyDL5OOPZHb3dcs7KxJP3skcVKzEdu
         fOtzULFHg+mFgQa0/8MFPpSOjcyobMTlPveXArZ5y0e+dob+2lHAn4cBCoQ+HoaynIOE
         nXYcT5msZ7CgjhHjd1MW8c1EbrtuNVInOtzKCwHkr+i4EfbDkeyQUDtUn41DlHFlgJgI
         bloTdTRHoG25aW1dbxDNPTF0eRx126aI/VsyCNGAoWuQ/SWRg1PctiXOeaCsDzPNj/4E
         xR8g==
X-Forwarded-Encrypted: i=1; AJvYcCVgO0seRys6Kvm4xwdYPy+uwIQwYTqa43LZeJNvCw4lAcJcrDAPX38GHC9IrgHOl9oY8LOBH4InR1AoBCB7J0Tr@lists.infradead.org
X-Gm-Message-State: AOJu0YwQX4OOXsgxn4YsjYuwEasQPKbINRUJEvw/SSJ5jW8bWIsLkaR8
	zgek8zhPRcyaDjflsUiR7jWsacKpVLDVmg8pWZUuPhuqtSjUP1Bn
X-Gm-Gg: ASbGncvdiCxLOB+YscfRnZ0RYr/RmIIVsAQpuJOG2vfxaufA0s9Fvf74Kqg5TrZTkUW
	aWTjObPna/+XrxuLb/Pu+eYz2kPXdDAcOBj2wAJv3Srq0wdGP93+9UaeR0MZLYruI32eP6tHjpQ
	fJdgNgEk4odwjLG0FZTwMwm6HJFF7b9Pi1tSyzFUR1z07TBLdQ9Ye+CFhETtUtkAlNQdxVn2sJF
	uoXhfF7+Bkuk3p0aazZtnGmOKuCeaPmvvzuHFzFv11LX14AT2Vyhf/x/XyPkk4viWqMdN67KOXP
	edfb6hvwCbnOCbdEVemXWZOx8MvjVPsFDbVIlVrulmowV88xI5hquiO+YGNEUvkQCN4AdsuyRRo
	H+PEsyHmXQ53O2NcfOw==
X-Google-Smtp-Source: AGHT+IFOFcncwKUYi57UNaeAvO+49/JOi3agiI45bF7fu89GYair4F29jldwkpCUEx5THNXGOXM2Mg==
X-Received: by 2002:a05:600c:1549:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-43ecf8f2f4bmr173448545e9.16.1744126981776;
        Tue, 08 Apr 2025 08:43:01 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:43:01 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/6] arm64: dts: imx8mp: add aipstz-related definitions
Date: Tue,  8 Apr 2025 11:42:35 -0400
Message-Id: <20250408154236.49421-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_084303_660080_02FD4714 
X-CRM114-Status: GOOD (  15.02  )
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
---
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 39 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
new file mode 100644
index 000000000000..b816cb6ee9d0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __IMX8MP_AIPSTZ_H
+#define __IMX8MP_AIPSTZ_H
+
+/* consumer type - master or peripheral */
+#define IMX8MP_AIPSTZ_MASTER 0x0
+#define IMX8MP_AIPSTZ_PERIPH 0x1
+
+/* master configuration options */
+#define IMX8MP_AIPSTZ_MPL (1 << 0)
+#define IMX8MP_AIPSTZ_MTW (1 << 1)
+#define IMX8MP_AIPSTZ_MTR (1 << 2)
+#define IMX8MP_AIPSTZ_MBW (1 << 3)
+
+/* peripheral configuration options */
+#define IMX8MP_AIPSTZ_TP (1 << 0)
+#define IMX8MP_AIPSTZ_WP (1 << 1)
+#define IMX8MP_AIPSTZ_SP (1 << 2)
+#define IMX8MP_AIPSTZ_BW (1 << 3)
+
+/* master ID definitions */
+#define IMX8MP_AIPSTZ_EDMA 0 /* AUDIOMIX EDMA */
+#define IMX8MP_AIPSTZ_CA53 1 /* Cortex-A53 cluster */
+#define IMX8MP_AIPSTZ_SDMA2 3 /* AUDIOMIX SDMA2 */
+#define IMX8MP_AIPSTZ_SDMA3 3 /* AUDIOMIX SDMA3 */
+#define IMX8MP_AIPSTZ_HIFI4 5 /* HIFI4 DSP */
+#define IMX8MP_AIPSTZ_CM7 6 /* Cortex-M7 */
+
+/* helper macros */
+#define IMX8MP_AIPSTZ_HIFI4_T_RW_PL					\
+	IMX8MP_AIPSTZ_MASTER						\
+	IMX8MP_AIPSTZ_HIFI4						\
+	(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
+
+#endif /* __IMX8MP_AIPSTZ_H */
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index aa7940c65f2d..ebbc99f9ceba 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mp-aipstz.h"
 #include "imx8mp-pinfunc.h"
 
 / {
-- 
2.34.1


