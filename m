Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B453CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9kL7sLOaubIomrxMG9EMGJEPQDeUh/zlxyCoHi0rRk=; b=bC26gbwwgY/lgcmvHAhaSIOhCO
	ZfrCPJnF+nbIU/4ZqcC/2YntMqfe4Kyf5wSoNXElNP4jWW2hXV2AK80A3OLA2Mf74XZ2WJGPww/ka
	GQw78tyaiJLUBMvnxLAPBl84gJ4Amv+17ER13nWpAuV5IVHNL5HuwL/JbINpIKaWybMk49PUiA6dZ
	oe4VPS33OsKKjO/rdTVXq+a0Q4y4tgYRlUKUJcgFsJ7yLO8nOywtnWiipzhCdR5QMo6j6vnkZWlhx
	pwNYbTQtRkAaFvDSPWILFipOvcn1iITqUPXsxs0r1O7cSRwKvdEP/9H5ycyJ0m50ee9/rZR9j3FYg
	M0Y41Akg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIn3l-0000000784l-1cwE;
	Tue, 11 Nov 2025 12:01:17 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIn3d-0000000781Y-1wkN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 12:01:16 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-641677916b5so4586459a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 04:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762862468; x=1763467268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9kL7sLOaubIomrxMG9EMGJEPQDeUh/zlxyCoHi0rRk=;
        b=A1e3HGg8ODIa3dvS9jHSlTFpeVoYtEPJPOaoKGPdc1CEvZrlOU7vTvNMQyUDn4I2mY
         eCKBVHgs2P4KF9TBNs7eH5K0JZ4sOFuAd4vQzp+EM9og12/vWhzH5MvYxmHxtgJtWste
         Kfi1PhDK+HdKzVnMxSYNgE7s07FlbqZ/rvrFAZwittgZFjMvc9IzK8ypVbmJFCPI6Hzn
         9vMlKtZX4gmg54SX7E9jWy421Aq6JPNKGKnPo+XLyfza5y4hmaM6FNKd/6eouSyp+6k8
         7Z/athgN1B2u3pa8Zzgt6C83XVub6tLu9As1i9/Fz3CCZ6uTAaapzZfm7v7M+cZUGQDm
         4xdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762862468; x=1763467268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y9kL7sLOaubIomrxMG9EMGJEPQDeUh/zlxyCoHi0rRk=;
        b=XROHw7QfE+hjmEgkxX0F9B8AzwaeX241NLqXAKVyMooi5troX4Gzv/9utlQbugcu1O
         F+LZ2ldoKCGOq7Bl2tgYV5aYXao/Na7/2p5taS25E0L71c31lM4Sqiwd54YzcMpx9/pb
         97FSwjU0ZmcCNhyK4KCZ1HatoWdyzddmEPff1XdkncXhM90S+yB40GP/jfEggFb1OndI
         8G7zAQjL+lPfGRfaqUmVkrfHaAcLq/cUtXTUNXBXQ3LyVQLh83aUPdw0YjvsFrZSC0nb
         BdaFRDNAzc2IDxh0/k0DGY7DS2V1YfN0FTY1W7RbXousxFTtq4zni9lmjiLuu+AUhctj
         D9rw==
X-Forwarded-Encrypted: i=1; AJvYcCUp6bgSWKSI4Q13WKSl+KXnkO+rgm8il99RWggnQUKoeJr0KOiB3a/a9xVNQw29aThA84hs44wxVaZQrj0t7XiK@lists.infradead.org
X-Gm-Message-State: AOJu0YwWxQU7nXFg+19BZTlJla0WTCFu/MqyZQSR9AaZBIrqkn177XQe
	4yb8S43MSLPq9Knx/URjQaZ+RJCDSYix8I3EU7DXfns2r3Anstqyfy+q
X-Gm-Gg: ASbGncshuIs7+y5Nt1I5IGRT2aaibd8z7ba6nkakfRkW7z66uE6ceMpEAp6/wKexms7
	KRrzR7+C/mhNBO+0cNRmqXIwptt9XsI1TzJnOD2pt6fZc4TVWkBoFZrypYWMVxCv7WEUkoPO/zx
	2x50BaERYvBL2hyc5nxl7HR8OE6IuY83xkKGEQZnztiDFxox3/zpqRJhV+mACeJFHUfY0V8oAEV
	XS/UR0/p5hhLyM10maybXrH/pSRgn2VtsABEFH0bAhsZG1kCzbnJS0E7Cy70pWlozG+YjYRbHUN
	kgtpWnNRGZWHPy0m3HiUPOCGKJhNT+VlDG7pUaYlheQXyQdY9JRmH7GPTlO/iebXEoAQdEXvSZH
	tyQFPdLAN1VzOod8ZoOu/hMuqgn1YeftLWdki7CiFAKhtdTJfNuUhIT6cfvP1Lb7Sdduteq3iGw
	veQUrvaIk6HAhB8wFG+Y50CL/KJnDNdd9lHGzn
X-Google-Smtp-Source: AGHT+IGQs7jakKZkFO/dMmI5qT5oEtzxJPB2RdXOKmXDqglsY8VX/AxfcjPsqoxWzM27nSsqJCFqIA==
X-Received: by 2002:a17:907:7f21:b0:b72:5a54:1713 with SMTP id a640c23a62f3a-b72e04efb37mr1121724566b.58.1762862467536;
        Tue, 11 Nov 2025 04:01:07 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf407a01sm1340707466b.22.2025.11.11.04.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:01:07 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue, 11 Nov 2025 04:00:22 -0800
Message-ID: <20251111120022.696-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111120022.696-1-laurentiumihalcea111@gmail.com>
References: <20251111120022.696-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_040109_521030_F7024ABB 
X-CRM114-Status: GOOD (  17.79  )
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

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  6 ++++
 2 files changed, 39 insertions(+)
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
index 426c11853d84..2173b539dfb5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mp-aipstz.h"
 #include "imx8mp-pinfunc.h"
 
 / {
@@ -2479,6 +2480,11 @@ dsp: dsp@3b6e8000 {
 			firmware-name = "imx/dsp/hifi4.bin";
 			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
 			reset-names = "runstall";
+			access-controllers = <&aips5
+				IMX8MP_AIPSTZ_HIFI4
+				IMX8MP_AIPSTZ_MASTER
+				(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
+			>;
 			status = "disabled";
 		};
 	};
-- 
2.43.0


