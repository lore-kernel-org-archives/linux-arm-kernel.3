Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76521CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEKzxyIbxVr9Lt/9n3xWbOrvTFOX3szJ8lqpps0zRyg=; b=4Ak/FPMdCiCfSLY3+BwZ84nQgE
	aZ81im4TY1775TRmXh6h47/Qrc/Vfj99AIZvZSBD4n9bn17mZe6vv3C1chDbIgeB2D7FMuCJF0KMp
	igTeybR4Wp/cu69AD/C7FrU2qLNShJmvBh25dKYowQG20tLbkkS5baaOjyaYI6dPKOtBRQLbl21gE
	G6t2txrguRhkYUIKPt72hM0Gsf81RoFVNeHdn/DjQcR5uXxX57Q0B4iTrbihMgOO8QhJj/Wwi5uHw
	0huDwQYNsB72Gzt6MZUenhGrpMsGbEaQJa8ocoxj18oG5nmq3nsCnIxzueEG9yR+q/t7Z85BamAwk
	DGXUBSzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrmy-00000007Fhm-495t;
	Wed, 03 Sep 2025 18:00:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnyg-00000006f2z-1vQi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:56:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45b627ea685so55100405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756907805; x=1757512605; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEKzxyIbxVr9Lt/9n3xWbOrvTFOX3szJ8lqpps0zRyg=;
        b=sst/PeyBwMtkQf1QJydi30EPlkNlf6glDxH6cMMjuh+LsMEtIskRU0YloldH/8+iLC
         2h3VC20FgFBbhqpzlm0f226At3Byfhe21wH9Tt5opZFIuxSkoLbkeExqTR0w2mI5Skxo
         sFoAXS81zc8EU6cFC64djz46dj5lILF1PHOooJ6A/xbnO3tRWcUY70yguTekuDsLfIPS
         pDnGdlvVIE2J7Nh/lsP+LeuunIulmMd8K1Wu7nhcSlxB9AHM2FUU5U1NTVfgl/L8dgRj
         YLNXzdTjj+SbFloT+odE18VrT6Nsgh4yY0+nDtDp7fXGZEMoyQd/C6upnPHCD0Bhxnbq
         D2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907805; x=1757512605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEKzxyIbxVr9Lt/9n3xWbOrvTFOX3szJ8lqpps0zRyg=;
        b=SWbIYONpQzsnp7Fdpmlrx4yd42oaWD3EUxdAaNZfOO9Cy9/JhwCKd3hL0gKNqtgGz7
         GYDaBWFV67qtEuN5LLLb2GwXRctdL+pvOgV33NeS+/ivN3+5CS3D8UzMJ/yNtEkTUbJy
         Pm+edopIj3N9vNZZ8Pyl0QvujZD5XgtyRCIHX/KYHk4nM8sCbhC39GVXPQl9nnMMfCxB
         M+1v/Nm/NGPYPii4mhKiucKsOOq1oy3ppNaKqWPHIC8a1veYksNJHaWxfcST95MxANoS
         UWiM0Lh53yoLLBCC06qMNBlvZs2ly1DbK3tCTJfm9uBKDnM2CsQaYowL/DGp0ZQWuaa0
         wT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUA+2Nyyl2WoxzrwlWx5dfnaYHBkNg3pRJ9dgguxq90qgEY/7/MphNZCjTagToGWIWlA7LKWa/nioApXWu9mGxk@lists.infradead.org
X-Gm-Message-State: AOJu0YxAg0byJnPqBQUnntlnMxa742OZP70tp/twMn2S4ks3Bn9jXuG6
	2pMfg+Yd3QOWZCjW6s8EftRpba5r3VTfIIeD/anezDj3fFOohcOYJOT8UY0kdsrcpFs=
X-Gm-Gg: ASbGncswn0mbxHRdOAfs1aVT1rkweqfc0Lsft7TYEBkAHGBhfSo9u9lGu4aSoQVCQ2h
	Jd8W3Vhdq2gWw7Crq1lw3TDRXA4ayq1veMX+jsFP6EfpywDneYqK0+OB6SFXW+i1l1n7/pCkHsp
	T4yUCo0x58qxtFmorKHo4EQw2RvUMe5jv99HUMa8yYMbdgv6kAclgWNHV3nZ0NG0EeFyGf9+d2O
	hwj6Gwq54ad+tZ0BQR/b9F1knpi7TNB18kQRi7tMDyjM51U4VI8vDJ40OmuNBpZg6JXcG8UadIV
	JNQ5dIGEXvE6TaqyKNdF15RFNT0c3HaWzVof2mYUdCZDewa1zZ+rNRtqmz/rA6cR7kcBn/176FS
	XiRKaTGhsmC5WSsM/eyp1q9iOzE5kDiR638W+9PPiTzr1t89RamfGQWx/8YQelt7c6Dlf3ixWeX
	AFWw==
X-Google-Smtp-Source: AGHT+IFO9nSz52fxYxdGQzsxxZrKol2dhW6Nm0GN+wyaiDcf/gy+3eG/jsgUY3sa/n/UJDN2fGk2Yg==
X-Received: by 2002:a05:600c:314d:b0:45b:8a92:6b14 with SMTP id 5b1f17b1804b1-45b8a926f9amr119385275e9.37.1756907804887;
        Wed, 03 Sep 2025 06:56:44 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87632365sm197257135e9.16.2025.09.03.06.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:56:44 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Sep 2025 13:56:39 +0000
Subject: [PATCH v3 2/5] firmware: exynos-acpm: add DVFS protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-acpm-clk-v3-2-65ecd42d88c7@linaro.org>
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
In-Reply-To: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756907802; l=6599;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=xWuaKRf4eIWvRTxRFnWQ8EPPrxM66+MS5MywdI2ONhs=;
 b=zZvkeZso8tYtXpk7gaP3vDCYLhLaul5NmQqMEO16vYvJoyZ8W6fwGy2vldN1Gw4xAEkO2psgp
 XUgD8F3Pm0BAhQKfgwliJv1BF+CyfbFX/P5Es0/fUxOb+Dk9urK388V
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_065646_506012_EBD29E61 
X-CRM114-Status: GOOD (  21.01  )
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
2.51.0.338.gd7d06c2dae-goog


