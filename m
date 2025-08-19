Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E83CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLJDOHFLAE+/7ofBBmeHWb5P/k7aXqaaIgt/JhlZZaU=; b=2Reo5kCfr5i6vpCjopbVTOoO9C
	1nkFA5iC4Vy7rle6w6Iu08/FWDCDJ+mhyVW7ycwEU+A6IWHIzwrp+qu2aLSZxH66ezbz1vRyFbgQY
	iEUx9ARE5pYzx1SykhSDWpNFJ4phldDpClGqWywXgPRY5UuQll22/oNXOdyIDIqOREzjoSXMSzjLy
	L9/sAbM1VyoQ5CpmJ/H0PGo6rZpbTzhZ6qyA45SoVoxaLw5/XamY7fLed2+/aIzguICkDZ+FUPgf8
	j2jnC4HhIjj1yk2n6QPdEo+ypVjHGRFA/lCDRDvIPcSJr8y/N2wORMdetqFCeWK4zTX6AesdXj6LE
	uYKOGYmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoN3a-0000000AiOh-3qXr;
	Tue, 19 Aug 2025 14:11:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKmq-0000000AKLe-2d5i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:45:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b9dc5cd4cbso3574827f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603955; x=1756208755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLJDOHFLAE+/7ofBBmeHWb5P/k7aXqaaIgt/JhlZZaU=;
        b=U+R9AmyQ+OMM7m0s6GkWnl5IosSkeyvVKCrHYIS9AVbid1OgnXYuExPBxRQl2a7FKY
         6l/mU/WOd3v2S4tOuDUGSHEUDabpMbDJDMi9IjurBYUI14wlG11Y5s9w7CEXa5JUeAVW
         YSiwiChBgLZjBVOymP6EnWtZ/Y4IdO1r2D1zZRo5147ve6CmLdmTKGjkeUZvgGhXZAbh
         4O3ktUB8/bqNxoCB+QV3qzt4+kBI64wCdZjtCoj8x5NqjEFUm/bmmPfWsVe+O0dZee7o
         6EJI4G5BE72Zu+nM0H/htBBR3aqmuJ3Sj2JqwzntLj2C3BKY60FFOgswp4H3+mno1nBM
         4m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603955; x=1756208755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLJDOHFLAE+/7ofBBmeHWb5P/k7aXqaaIgt/JhlZZaU=;
        b=qJPaqzcKVyl2hJZy7rqGKfR5HyeBb5xSlXhMoHmQbq9UK/OdOkdkesPYpvW9K/K6d5
         FPmi6QDqUKlcOFKRj0ZosXk2VVPhHPy+EEXn7u59Di8nsQoGUbekbY+ZHDVm9cxHtQan
         KZiWQpkuaGxV0PIxqLkLpWnm4BdWg5TFhJxE3R2+VdPmwFpUUkTnylK3lAV/iEBNAz1T
         +qQDzB0V1255ARSJPNhc6EH3392GfmdnQlU6Hx5VnUogDmc2jieiTK4+/b/9fywQDylM
         wNoyOJPwKtVac3ij3oaHHVPipU2qOoeVI9xnLsjcV3+r3MxML+xhqvChVjTBlbYXq6X8
         dkTg==
X-Forwarded-Encrypted: i=1; AJvYcCWhPYlgQvZo0AKrnz5FhqNNj7OswKJHslRInsc8PlwxK02OTnMcGQuEIdCAWxOxeX2IjtwTzWluJxkR1pFHAc8u@lists.infradead.org
X-Gm-Message-State: AOJu0YwFy7GqcIKOl7AUy9ofe0aNlJBXKOZ5jUJM9GCnQWarw13P+DL6
	IiC9RuYazaiuLhgJnse79JuY2SG0fGEL/OzUiGenKjXRzJyn8jrpqoRP0pJZJoTPVl4=
X-Gm-Gg: ASbGncuOqAldD91McLt5P6xaKWT52FWv/e8ul3S7xfjEvrvyQRUfPRq/nDWClP0+USE
	ACow0/lfwlT22CC6eXcOqTV1wZKCMKMYmrbff+nsySiJ4/dw1lLJlpXQ9bj9CeqM6DfLXPtIWSn
	ufqyPCNN/Xh/iKzJRLDlBYmXeWLvRu/CVt0ZjTE9Co4AD+++YwUUNM9JvXHe/BWNdXYeVuFTDjn
	WVtzkjDocEXh+uQbi3uX3JeQniH3QXecxdvi/EYlFpkduJ4brBe0gsJ2lsN8v1QpDWpq54S3u/o
	dRx0CrFU4IMwb/uSd4R1p/m9xRTp0/0NQOqbI6pcvfIGHplYXa4y4eCgCptiq7e42V81I2w3sjQ
	P2pR/m1pN+Ll6h17sDuhpvIznEPWAghTvCQLNdEv0IMHdCrCa790QocQc0bp+0/vtWezP9We1fQ
	Q6IA==
X-Google-Smtp-Source: AGHT+IESX1PPZElxnFttFv84eb1J/CkA8TVR6xWv74teidOy3fiZPcwgJofWE17WBQlXCHAWQn7osA==
X-Received: by 2002:a05:6000:4383:b0:3b7:8473:31c3 with SMTP id ffacd0b85a97d-3c0e00a105fmr325000f8f.9.1755603954886;
        Tue, 19 Aug 2025 04:45:54 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm3430817f8f.48.2025.08.19.04.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:45:54 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 11:45:37 +0000
Subject: [PATCH 2/3] firmware: exynos-acpm: add DVFS protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-clk-v1-2-6bbd97474671@linaro.org>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
In-Reply-To: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755603952; l=6621;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=j0BnWAhDqW93980MJMTG4FCn6QvHbgEEGRYAeb0s4W0=;
 b=KTiIalOm1UBeH7L/m3ZP8PgxAwNUu4gW37VVDI7lJrJMmvBPyeXjemeUn04pDogpe84GEjvVP
 QLEWsW4HaFSAa3LCLpnOovFdrk8Ou6Qwe8TRNrqJYzNzY0FnEyM9Ce1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_044556_672531_04268FE2 
X-CRM114-Status: GOOD (  20.55  )
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
 drivers/firmware/samsung/exynos-acpm-dvfs.c        | 85 ++++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        | 21 ++++++
 drivers/firmware/samsung/exynos-acpm.c             |  5 ++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  | 10 +++
 5 files changed, 124 insertions(+), 1 deletion(-)

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
index 0000000000000000000000000000000000000000..ee457c1a3de2ff2e4395d9fc3ff4c13294473b2d
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -0,0 +1,85 @@
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
+enum exynos_acpm_dvfs_func {
+	ACPM_DVFS_FREQ_REQ,
+	ACPM_DVFS_FREQ_GET,
+};
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
2.51.0.rc1.167.g924127e9c0-goog


