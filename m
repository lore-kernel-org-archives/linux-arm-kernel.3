Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58023C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ietc0fMCi11BuUwuyiJvWRzPfrCW2xOJHK6xEAe6XA8=; b=Wvy5Es1v8SxkbB/Qv8YjZPXHZq
	m3+B2E0S+EMkoX6PhvVOTvU894qB6d/dA4HaNie8qlxHd2N2oymQ/4Tn1s7jX5Y/AovPtdOUTaIkH
	uce/baK6cFM0r2OsRogvKiH4a9eyOClkctNhO/TkOfsyxBsx+DjkAyieCVWQvj85P0C7f47IZYdvw
	V5lCz7ZlVsZGZYiS1ve0Zi1xf+QcKbYZow4fFBGF2W7CVrQQ/quEnNtOcYvjCdzJlLdt6+U0Kl29a
	kFPlmJyDWsNt1Z5fNCEKVXVKC7RRCQxLi/t7JzczTo+WZ0qOrHoY/gVR08iBQ7h//ZkcGuuls8H6E
	iMfEyo3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tze2R-00000003no9-2mHF;
	Tue, 01 Apr 2025 16:00:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdoN-00000003kyJ-1enF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:46:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso58081025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 08:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522358; x=1744127158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ietc0fMCi11BuUwuyiJvWRzPfrCW2xOJHK6xEAe6XA8=;
        b=IqYmo9eMmqeuxQ4t9iBSZfuC1FRcWYA424j38UTfI1G0j2OR6KnI73JGgIdA8GURbj
         4CbPVl/bfxNQ+DlphHlnrgqoFAeVgKdNuBOYDAu7NcWTnKzVIPXP1avl/3Jen2DNSyDz
         DkikVOcGLpi/tTTRP9JbfAzuCUg5uO8rtgXZhZe5RDoHjeWQWLUVXT6vqxGqMXF2Y7aJ
         aQOD4/657iY2mI3QTAxBJayWfCwFdSGtIJ2DeO7r4CF0TGdwMu9MjYP/qmI9gqunkhmR
         D0OyX0zIjxtrTYWaRiO5cQInNbh/2kLOSxOHuuuSuJG34Juugn/xBuOHOfcibUugBwQ8
         E/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522358; x=1744127158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ietc0fMCi11BuUwuyiJvWRzPfrCW2xOJHK6xEAe6XA8=;
        b=Leq2HOxVa7tVxlYCylij9jjkcaf/EEi+69Tn/2XIWC2Pb4Pu4M3JhsSIeZ5awYcwa5
         nR6G2yzLZgn2S8HLWL5nU2E1xTIQTifcUPB3ad08Y+H3iViZvDur08p8V2jo2ULF8D21
         ofujg+Km4Y8BhaHNRJ7zIg1/9mXTLR9kylf3C9RKEvkuydflkYU/CY//S3LwLxe1k0Z2
         KZVfk9ulm8hIQRS47QYZLHYlFqJd8AEPbU3lhquQWklmguqRmux/ho2VNtdZPLfR5cJO
         23fgGIj9w6QS2VcLgjwE+6qGcWSR+RNTR4bBA4YKCqvxg2i4z7TD4hC2ffbk0mXEAQ+e
         TUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt+Ja1Dmm7Lc+dsVim290vUL3oynOf8jrf7zwfPU6uZS6IjcJtMIpdk64yk3coEdaBwjpK3hXFJMow7KtP6n1l@lists.infradead.org
X-Gm-Message-State: AOJu0YyCLQi9v5jPBMQ/T1Oy2lI6qzgi+WaObHgK0J53TsVWFNo+UnUr
	+JG0wg2CZ+LCydAgcw55aaHz0T0Ny71msj3rHOWjZc1OcEkWbCfL
X-Gm-Gg: ASbGncsUqycMv/gNAM3H81CDkHQzuxRQ549ctAMyc0WY4tfFBctu2O3XXYjUDzPk8/a
	jhVxhfhYmHJaYMSAQYHo43ehfxrcRvMsMPgN6RGxDccbDHcbu6jAGJYr++tcnJZJq4+Q0zEIc8Y
	EQmjGBq0omeYb+E1f1nvkkgFintMUX4QH9G2R/+7cFYHp6/2KFvqgfTyAGDCE/yT9eoLL7Rq5h+
	gYXZumup/ubUBnHMVupMQoimuRxxheaJRX7c5r8ou4K554gdHxNamkOGoVLMHKNVA3aTDiqAHDN
	WgCUag6XB9tJ3x3L4dcifd1zr8hs4esXYeH7Fz2dSjO0AXDItD+Bmyn65jWfBLNfTcVK8OF1vHr
	v1vajbuI=
X-Google-Smtp-Source: AGHT+IG9ZYKWN1b40JEhYbcSZx3uZ/1WRX1tT2EFyx9rWI4+Ii3DekqK4BS11iLLv97oUFUaX8G+Zw==
X-Received: by 2002:a05:600c:3d0d:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43db61e0584mr134804935e9.2.1743522357576;
        Tue, 01 Apr 2025 08:45:57 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:57 -0700 (PDT)
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
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] arm64: dts: imx8mp: add aipstz master ID definitions
Date: Tue,  1 Apr 2025 11:44:03 -0400
Message-Id: <20250401154404.45932-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_084559_435469_FCCC79A5 
X-CRM114-Status: GOOD (  16.26  )
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

Add header file with master ID definitions for i.MX8MP's AIPSTZ.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 25 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
new file mode 100644
index 000000000000..23725cdef23b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __IMX8MP_AIPSTZ_H
+#define __IMX8MP_AIPSTZ_H
+
+#include <dt-bindings/bus/imx-aipstz.h>
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
+#define IMX8MP_AIPSTZ_HIFI4_T_RW_PL				\
+	IMX_AIPSTZ_MASTER					\
+	IMX8MP_AIPSTZ_HIFI4					\
+	(IMX_AIPSTZ_MPL | IMX_AIPSTZ_MTW | IMX_AIPSTZ_MTR)
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


