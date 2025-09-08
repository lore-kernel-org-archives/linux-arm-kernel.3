Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067F8CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axRyto/ISVMntXEL3ZXAISR7Gp0i8a/1nJ0/ZHfbjHA=; b=3SJYg2Ymfp31slWsmwMpei2GKU
	sXsTumfkagDihDPKRQpluXZH5Oj9nCHv/LPUJrctv5qvSQEsJJj8vlZfu3M+AGmrDSAJ3+Aq9OHLU
	Am+4p+gYmhvnbwIlMDuBrw+bRk2WwBFNx936mVDGbEgxdH+RxBBI+675ujF7giWB8RPRntG3IT1r5
	3vS6JrqJmaAv+zMp32GMoEN+hG7Dssckc7WwvufTr4lP/WYYlVfqaTZZkGniWPzqiW47XdPS4UWTL
	gFS+62LHhND9hH5ghr8F6cigoU3waZR4R6cKqPxXkaxwgrqIYSJNFcSaWZcw38BHtgxfw2ammrDdn
	XbE594fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgUX-00000001UzA-42ps;
	Mon, 08 Sep 2025 18:21:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbg6-0000000HIPT-1C7N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:13:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so37542855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757337181; x=1757941981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axRyto/ISVMntXEL3ZXAISR7Gp0i8a/1nJ0/ZHfbjHA=;
        b=w2CUJIxKmeYy9uN3GFxxiIdZ/HhJ8jtQ0FPtF+hAHaudwupo1iqfUI+YfbzUxIADAI
         /tm9C+VNNN1cDPCXC7k61sCzHUduXEU+TGpJJcwUaIT/rCeddUDEO6SnYTf+dXiK3KM+
         Jinr9OKTY7wJFXlFoJVqX93vhoylj9fBMD4KHRUq55fq4otbEhYNcnuPp7NvjNzSMuyX
         1cmv7ZKK/y09qyuj601wCFzSXrgmpAFMxz/vPONHoux+5e7y8wPv32BXmolQjouEBgfA
         Cq1urrXihzRqsXhJzG3/M90+jhFoSHfDpWkBvQBmZJRS91cG4aq7ou2m6uZP0pOyUtZP
         Kr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757337181; x=1757941981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axRyto/ISVMntXEL3ZXAISR7Gp0i8a/1nJ0/ZHfbjHA=;
        b=SZvNE4u0lLJvRsK9/H9di4ccdfwGjUV2AD1N4pZS7AxhQ9wKOizqKZNnPHI6OIg3nu
         vJ77Qn6Kp4GtitxrT0jIyMTnQSb6A9HuhnTIjXCj17FWYT/wj7jHvEa1PADGBb6q25WA
         7t3AC481trtC6GbYIkh0x5S01cFrhSSPkr0Jm6wRuMi6Q2g2ACru9nyPmfohtXzBQQlE
         pA+bVqZzTQz/69JcfoGBvwgmeOBw9W/qrXTb5p3vSW63BNMmFXMJMOibr5SQgJ7XjpWr
         CkDaLK3UUgjBzbf0bGP95E/gLnWEs1GbnkOfRO0xbqzqUQSfpr+Gxo+60VP/Erm69JNa
         h3vA==
X-Forwarded-Encrypted: i=1; AJvYcCUXsr+tp0wT7a9ZKV0xF2VxQAl+Y3Kdj9jwvIPLmvuN/jUjNEv82ULbqV9eSkd5COfFjkYJ5JWJpB2FBdfWR04V@lists.infradead.org
X-Gm-Message-State: AOJu0YwMBJLeHFSFokwTsJzvDIk9Zn+dtD/h503F75E6GJe7vuphuQsN
	orBpOhW53F5aTYT0L+tV1cnp7dfYESHOz6+S8fM5YE27Wl7+Ha6YDAGpvkdz8Osl5P8=
X-Gm-Gg: ASbGncukRWWgmlAktG8CNKCZ9IXPBendgWlIsTC6wHCTaDVTFD34z/e/HD4TzL4+PQF
	nCHNJrbLicJl0pqN6WFXB7V9NlE2UjwWzCIQyzvUPCPYFiZvRvfEbs10KC5EOetFwVAvG713Pdh
	YyfnCGLzVgVpgmGVN8yLaNceKNQRMpGies6HQ7KTDi1fofRtgLzkjt6evP6rHfZv/xGN3nPEPoi
	CBFsZyx++jTthOhEGBX1IZ3FfuW7MxAwNRP2lIYOobr5udovxVnSZbny54OUykFZM8+ped9YdW1
	OurW/r09TPX14NKPZ37KC3D16JfrlIaJ5TjUmsXck4K56hu/Jlk060EZLpaOjqb3Nenjwg/mY/J
	dYNx9fM0I95JdFSD1qwFJPHEzVQSJGGrHp16GBLNTfKDc65Lcig6qWcVL/NMhoFlI+d6L2t9OaO
	6JlZiF3NW+xeUh
X-Google-Smtp-Source: AGHT+IGwIG5gbqEOa/X2dR0JZvfb5YQB2PpmEsolXTUv2RvpCoxPAS94Oqup7vYXB9W/8UsdI1FEOQ==
X-Received: by 2002:a05:600c:1390:b0:45d:da7c:b36 with SMTP id 5b1f17b1804b1-45ddded7614mr64813635e9.19.1757337180651;
        Mon, 08 Sep 2025 06:13:00 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9dbfsm41650181f8f.43.2025.09.08.06.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:13:00 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 08 Sep 2025 13:12:43 +0000
Subject: [PATCH v4 2/5] firmware: exynos-acpm: add DVFS protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-acpm-clk-v4-2-633350c0c0b1@linaro.org>
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
In-Reply-To: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757337178; l=6599;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=WEYCc0m08cozmqjakGvBtMPbDEIfLlrQSlYRfrXgnOA=;
 b=IEHGUjctdjN/UA7r9A7/JSWgbrBpcnXg/M4EDFmiviwzFAkzy2IwstmPk9jHaEZ002lkTifxM
 LS63Zr3LLjUBR3cFHkPES+5ETiie9FZsaF2sD6M7cTD/QP//jbcxPp3
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_061302_339316_145FD8BC 
X-CRM114-Status: GOOD (  20.86  )
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

Add ACPM DVFS protocol handler. It constructs DVFS messages that
the APM firmware can understand.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/Makefile                  |  4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        | 83 ++++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        | 21 ++++++
 drivers/firmware/samsung/exynos-acpm.c             |  5 ++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  | 10 +++
 5 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
index 7b4c9f6f34f54fd731886d97a615fe1aa97ba9a0..80d4f89b33a9558b68c9083da675c70ec3d05f19 100644
--- a/drivers/firmware/samsung/Makefile
+++ b/drivers/firmware/samsung/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-acpm-protocol-objs			:= exynos-acpm.o exynos-acpm-pmic.o
+acpm-protocol-objs			:= exynos-acpm.o
+acpm-protocol-objs			+= exynos-acpm-pmic.o
+acpm-protocol-objs			+= exynos-acpm-dvfs.o
 obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
new file mode 100644
index 0000000000000000000000000000000000000000..a8763bf9374d41952a8d26124cc77baae0f1c723
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2025 Linaro Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/ktime.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include "exynos-acpm.h"
+#include "exynos-acpm-dvfs.h"
+
+#define ACPM_DVFS_ID			GENMASK(11, 0)
+#define ACPM_DVFS_REQ_TYPE		GENMASK(15, 0)
+
+#define ACPM_DVFS_FREQ_REQ		0
+#define ACPM_DVFS_FREQ_GET		1
+
+static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
+			       unsigned int acpm_chan_id, bool response)
+{
+	xfer->acpm_chan_id = acpm_chan_id;
+	xfer->txd = cmd;
+	xfer->txlen = cmdlen;
+
+	if (response) {
+		xfer->rxd = cmd;
+		xfer->rxlen = cmdlen;
+	}
+}
+
+static void acpm_dvfs_init_set_rate_cmd(u32 cmd[4], unsigned int clk_id,
+					unsigned long rate)
+{
+	cmd[0] = FIELD_PREP(ACPM_DVFS_ID, clk_id);
+	cmd[1] = rate / HZ_PER_KHZ;
+	cmd[2] = FIELD_PREP(ACPM_DVFS_REQ_TYPE, ACPM_DVFS_FREQ_REQ);
+	cmd[3] = ktime_to_ms(ktime_get());
+}
+
+int acpm_dvfs_set_rate(const struct acpm_handle *handle,
+		       unsigned int acpm_chan_id, unsigned int clk_id,
+		       unsigned long rate)
+{
+	struct acpm_xfer xfer = {0};
+	u32 cmd[4];
+
+	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
+	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, false);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+static void acpm_dvfs_init_get_rate_cmd(u32 cmd[4], unsigned int clk_id,
+					u32 dbg_val)
+{
+	cmd[0] = FIELD_PREP(ACPM_DVFS_ID, clk_id);
+	cmd[1] = dbg_val;
+	cmd[2] = FIELD_PREP(ACPM_DVFS_REQ_TYPE, ACPM_DVFS_FREQ_GET);
+	cmd[3] = ktime_to_ms(ktime_get());
+}
+
+unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
+				 unsigned int acpm_chan_id, unsigned int clk_id,
+				 u32 dbg_val)
+{
+	struct acpm_xfer xfer;
+	unsigned int cmd[4];
+	int ret;
+
+	acpm_dvfs_init_get_rate_cmd(cmd, clk_id, dbg_val);
+	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, true);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return 0;
+
+	return xfer.rxd[1] * HZ_PER_KHZ;
+}
diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.h b/drivers/firmware/samsung/exynos-acpm-dvfs.h
new file mode 100644
index 0000000000000000000000000000000000000000..85a10bd535d118f2f36e9888e41b9b705b08ea59
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2025 Linaro Ltd.
+ */
+#ifndef __EXYNOS_ACPM_DVFS_H__
+#define __EXYNOS_ACPM_DVFS_H__
+
+#include <linux/types.h>
+
+struct acpm_handle;
+
+int acpm_dvfs_set_rate(const struct acpm_handle *handle,
+		       unsigned int acpm_chan_id, unsigned int id,
+		       unsigned long rate);
+unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
+				 unsigned int acpm_chan_id, unsigned int clk_id,
+				 u32 dbg_val);
+
+#endif /* __EXYNOS_ACPM_DVFS_H__ */
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 3a69fe3234c75e0b5a93cbea6bb210dc6f69d2a6..9fa0335ccf5db32892fdf09e8d4b0a885a8f8fb5 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -29,6 +29,7 @@
 #include <linux/types.h>
 
 #include "exynos-acpm.h"
+#include "exynos-acpm-dvfs.h"
 #include "exynos-acpm-pmic.h"
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
@@ -590,8 +591,12 @@ static int acpm_channels_init(struct acpm_info *acpm)
  */
 static void acpm_setup_ops(struct acpm_info *acpm)
 {
+	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs_ops;
 	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic_ops;
 
+	dvfs_ops->set_rate = acpm_dvfs_set_rate;
+	dvfs_ops->get_rate = acpm_dvfs_get_rate;
+
 	pmic_ops->read_reg = acpm_pmic_read_reg;
 	pmic_ops->bulk_read = acpm_pmic_bulk_read;
 	pmic_ops->write_reg = acpm_pmic_write_reg;
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index f628bf1862c25fa018a2fe5e7e123bf05c5254b9..e41055316bb578bb8250a1b1177f1059eeeb2611 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -13,6 +13,15 @@
 struct acpm_handle;
 struct device_node;
 
+struct acpm_dvfs_ops {
+	int (*set_rate)(const struct acpm_handle *handle,
+			unsigned int acpm_chan_id, unsigned int clk_id,
+			unsigned long rate);
+	unsigned long (*get_rate)(const struct acpm_handle *handle,
+				  unsigned int acpm_chan_id,
+				  unsigned int clk_id, u32 dbg_val);
+};
+
 struct acpm_pmic_ops {
 	int (*read_reg)(const struct acpm_handle *handle,
 			unsigned int acpm_chan_id, u8 type, u8 reg, u8 chan,
@@ -32,6 +41,7 @@ struct acpm_pmic_ops {
 };
 
 struct acpm_ops {
+	struct acpm_dvfs_ops dvfs_ops;
 	struct acpm_pmic_ops pmic_ops;
 };
 

-- 
2.51.0.355.g5224444f11-goog


