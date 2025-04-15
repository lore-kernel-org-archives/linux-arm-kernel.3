Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1036EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KQvEsaeONHy/l4Xju7O10zDYvEBhHW4gcNN9+1RZRM=; b=i/8ltGr1BI5B8UPOlUrz+XcAWa
	FH/y5+0K4uZj8ajNhVxOOdMQU3PEBDXqPWUtBx8MA/ee8B2sU4soo1ubbfTwlGxOdTPQayvOIWzCn
	i1/8QlRqhfG3QrxJnKn1VWUdhWEIaH6cFkbhAmvX+jdhqktW85Ygw+IwpQ4t8djTe+MGeOx1oyZ45
	x64/6Wk2wV9wbwXZuEXKE+6lGrq+xRGcyoC1/f7S8i4dIhvjR4KlYasrLfjD0plYD6ku2nYsi6hiv
	f1bp9Yi+MmRbhcu/T+FYA4kJr/RwXVIsd6Pj4veq4Wl1vl4v4foBP0cS14HYGlFfYxwdwapFN2EVE
	iuUMPXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kRR-00000006dHP-2nif;
	Tue, 15 Apr 2025 17:51:25 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jyB-00000006Xqh-08LK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:21:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso3600509f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 10:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737669; x=1745342469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KQvEsaeONHy/l4Xju7O10zDYvEBhHW4gcNN9+1RZRM=;
        b=K43oS1dNxzjyINNNETcjvQsv0yoERzD0Dw7KQFZyyHIMUUsU5QA1esp3chedKzEd8x
         f4pkm1Qu+FkwRFLchzl696XaSybHGKz3wc36yqLip0RJBoxodLxdGQNR+m1z14ql03dd
         Vklpz6+0DkRz2gPeatON7vr+bqKjKodusqL9Ftw9/yca8WK4x4Be6WDeUzpF7fZI/Lc+
         VKVhvuPd0iMLPGxvyxpiXFotzMTap78pRZLeLHZ2hTYpDr3SOnA9XO2HjJnrOk247/Zw
         4OMpieRzbvCXCKlChTibcV+hKoYVIHDMAAoGEXhmswK6u/iPKa0GuZ6C4Too08Rowrbj
         yYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737669; x=1745342469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KQvEsaeONHy/l4Xju7O10zDYvEBhHW4gcNN9+1RZRM=;
        b=t0jd2l/EKbZUS+VCFyJIYdPspdPJ6FocI8WXDW81OanjalwrMsLEhBp5f06ejbWf/i
         Cmv3u+MV1Zmj//QEe/8/l4wK4s1YfxDIZeyxQbngSyAMhpckMugljKW69teMHydRxMxQ
         33PAgNvBGByZc72i6v06V9vV21scZdEOnuZjo40EzZ1Uzobru4atr+vjwRlpHYuzcf7V
         4HfhVIJjzlDni8KGjIf/3puGd50BY6Uxgll97j6S477GJyrWiSnya4wPUBG9H7OUpgOl
         +CaPdRgTxPGE+iE/n3n7vjvk7IAjnfDiVy5I5Mk7N0xDEIK2J0G65+b+sGPAu0xs9PgG
         P1WQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/6OVU3jg+lDIXSfDdxBe4kOr3OvyxNR2uvdWN6uCf4HBfoMU0h5SpJmHliyXeWBhGSP5KibVqkgKK/eKHBzxt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4JaJwTFI33gAp9EHJSRGNovsMs52YXnFYltf7h0LsC4wJc2al
	pz4hfSHgE/E3MaMeJyAmscKkiqJKY0qDXinwOf300RnFDqSpLFTWmKulrZsg
X-Gm-Gg: ASbGnctDcNejcfuE6iRVuSbVEdXy1FLYei7XQaO4N4pz0j1WWyVgjPfvtl5iDCs8RXk
	ovjpXLqRPoY+EeAAyfoYbw6Wjgi15kUzGOU4ZWyuUyBY2MSLHsnzunapLMi/1qcjKHz4yhbNryV
	C1qFyxSBnwPD7a17Fz1Wn4HdML9fo7hzLRCfFjpag9lCm0pjKVbiIYwYMqjZGPY7N0QlFc1nzAr
	hLGQ+W/zjyVAlslEbTsF8aaq+8vf/AqJnvDJB8pztdRyucrvxrH/5UGO8yVWDgZlywjWuuMaJT7
	xDBDERBEz2866wxdHLae9hauU0zeQEcckU9+HbnngThnrkKSn5Dhcx2Gnxe4PVj4Wn3xbxFezhk
	oiqY=
X-Google-Smtp-Source: AGHT+IE5LwUFFqRN1DRApHuDZUZuydgO0U6kSCqbQ6tZKxGSHxRY3Qiff50MLBjjeVgYq+0MQAeeSA==
X-Received: by 2002:a05:6000:1a8f:b0:390:e158:a1b8 with SMTP id ffacd0b85a97d-39ee2760646mr250766f8f.43.1744737669297;
        Tue, 15 Apr 2025 10:21:09 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:08 -0700 (PDT)
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
Subject: [PATCH v6 5/6] arm64: dts: imx8mp: add aipstz-related definitions
Date: Tue, 15 Apr 2025 13:19:18 -0400
Message-Id: <20250415171919.5623-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_102111_069516_1808A829 
X-CRM114-Status: GOOD (  14.99  )
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
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
new file mode 100644
index 000000000000..b5bfcbcf38b8
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


