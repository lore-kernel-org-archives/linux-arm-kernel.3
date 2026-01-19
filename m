Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC75ECCF2F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylfAjxpOUxlcbMBmHFNtPCkWSO4scZYP0qkSe//RiXk=; b=YFtkdx3eN16r3RTfhhjeBu8FWd
	vfc+7MoshhNa32z3zBFFnYNKUiMl1FjmLnwh23Vm8crb1FBJik1PIb8pLofyxGV/r4ibDi2YxC1Eh
	vovdUquhpH8ax6c8jr4KVscRYuo5YjecXcxltJ02rRBU79K357k7tJQnCqAqk/I/1z4vAiqXuju+b
	C70HleTwmbGKniV3l7XbjPQrouORjru9oiISe6aIqO8z23hpldaxfWy4bVl22NHx+yDHcZfKXppIY
	yYFAERFlYwtVgkH3oz0xYVBaZg1eS0y40UReoPAB5yVN0YgN3SftAPyCms71AarNIvGwnsKRBW7QZ
	DX5y6f8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho4L-00000001xXu-028b;
	Mon, 19 Jan 2026 12:09:17 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho41-00000001xSc-3LR6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:09:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-430f57cd471so2127291f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768824534; x=1769429334; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylfAjxpOUxlcbMBmHFNtPCkWSO4scZYP0qkSe//RiXk=;
        b=vpBqxCz04i/UFPkC4QUx9kWvEpgQqsoS/Bhe0QlwQ6aQvqtbSpdL1YzMV4uN8sW7eW
         0/vdgUEJpsY4vq2BDqbvr/euZ2tEhJs0MQG6GLJHMWWriaCHhfr1VMnoQYke712H3aFv
         7WKG3o5nf3c6k/B3rSIgY8aa7Jqq55TQs6CDYXB9Qgp68XlREGazPxvrBt/z/iSaL3rc
         SHavjV68HrSxucq7cpYUQNW5nJ/U3/GQ49lC/4V00EOla6FXl2Cj95nMXG4FoMG98hg1
         8NOjwDnajas9896Zez+G8chkhgyAbTT1fPfBnlVa08QtoWMunwY3n9gyeh+B+OQlDTqH
         0tYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768824534; x=1769429334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ylfAjxpOUxlcbMBmHFNtPCkWSO4scZYP0qkSe//RiXk=;
        b=tU9NKCiyNXDgeCV8H/Wdu4Tfay2xeURTAF5TBsNQB4aPcbxOE6thOoIWyDm20fCqZU
         KrqXFolNV4eFf2m/0BDAx66V2VDwTxqSBU4DdCuISUb6I70OFpGZDnxlpIkzlQwX1hyy
         jFAQgsQejT3XnC46enXvJkIQSs2XamvPZ4OUPhJp++J0oGtxVS9SrfObnU54OZgvZdZR
         wKEOA8f3JjJmm7Vitz0ZLAi/j2qJf6iettYomxb02yTyBFV4j74bLD9BNPKbVTmkinwY
         361GyNJEkZB72hmOOVjoKlXj5brO2Jk6tV51VKBqwXGSV9Y6uPpGJ/6V22/Fj0J96BA4
         QfJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfpwszUhOQjg3rQTAMzYoOsgP586EPnTzbbq9Uwt9Cq2YxGS45/qQLo9V8QlSkC6uiWsXBh+TAMSoYwV6UUg/8@lists.infradead.org
X-Gm-Message-State: AOJu0YwtJarlp7V2CfYUvBRfi7oYRlEqH/LMijSA69LwUM5d+4Yqlh20
	5OMBGInWlkrYxLQDB/V253tB8PpWkeD1X3K5FwMTmx4BTunRBFsflLg6AlH2P5PJ1uo=
X-Gm-Gg: AY/fxX4yEl6QvyMWIQT1LOjTIwaJH1OZ+eNf2vWt3qBUxdkLULDHJgRHSZR8TQTBZyl
	oesIaAsqY8AiU1rHhBxigUmyH7xoX6VAZyr+fr6OYWA2ovK7LqZhN3uSWS3lKwH4tpYAwvD+/oe
	pK1JMjJW1+Xo9Ky0DREez7AgYjDlIkwzElu+ueLnaHWXzzl4CXjhadSznMV/xdKofzT8ilfzTV2
	1SDtYP+BVgaeyc6owEZtYVdmDteu8j+xGSWQ3nv7oSvPruxeJZbIkqaXCtJh351My1NqKbrwkFw
	nDcfZr2y0oPZrkXt55B8qfaoVSZ/Kduc7waoEc4srOGVaAYBfgSa8Ijby48c9KE8vVK9EtgXQ5h
	vlqdJXqcrF2Cf6GPvdwNU8ixF72fJW4+ArjPLrIA59V6ijHHgwgPoz0yjaC7WhOJcC3H3rGkpA9
	d6Y+A7Grti+z98+/KR2ui//bU2TP+2i4Zo6rF/L8Jb7eNnqMgGPu+z/f5PR+Avxs5jdO7Tij1Hk
	E40FZxB
X-Received: by 2002:a05:600c:1c28:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-4801eb109e0mr130549215e9.28.1768824534313;
        Mon, 19 Jan 2026 04:08:54 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e664sm20698421f8f.30.2026.01.19.04.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:08:53 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 19 Jan 2026 12:08:48 +0000
Subject: [PATCH v2 2/7] firmware: samsung: acpm: Add TMU protocol support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-acpm-tmu-v2-2-e02a834f04c6@linaro.org>
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768824532; l=11506;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=xm2Bk0tp2/dYXXAn7n3eVAFPnJF+Lc6bvpH8padRGcg=;
 b=rK0SJyctMob1vdqVS1D3IM9jdQOu7BrB06o+UuhUxD6Fa9dPj+HX2X3tOmK6b3Z9riwIfmBH8
 25iPEkXpzD/Ccb0PKShVmQz+ixWvGYzX5PWtpZj5zVaHXf8pMfbSn/E
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_040857_911491_66083B3A 
X-CRM114-Status: GOOD (  21.33  )
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

The Thermal Management Unit (TMU) on the Google GS101 SoC is managed
through a hybrid model shared between the kernel and the Alive Clock
and Power Manager (ACPM) firmware.

Add the protocol helpers required to communicate with the ACPM for
thermal operations, including initialization, threshold configuration,
temperature reading, and system suspend/resume handshakes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 212 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  33 ++++
 drivers/firmware/samsung/exynos-acpm.c             |  12 ++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  24 +++
 5 files changed, 282 insertions(+)

diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
index 80d4f89b33a9558b68c9083da675c70ec3d05f19..5a6f72bececfd98ba5af37d1d65fed48a3d8f912 100644
--- a/drivers/firmware/samsung/Makefile
+++ b/drivers/firmware/samsung/Makefile
@@ -3,4 +3,5 @@
 acpm-protocol-objs			:= exynos-acpm.o
 acpm-protocol-objs			+= exynos-acpm-pmic.o
 acpm-protocol-objs			+= exynos-acpm-dvfs.o
+acpm-protocol-objs			+= exynos-acpm-tmu.o
 obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.c b/drivers/firmware/samsung/exynos-acpm-tmu.c
new file mode 100644
index 0000000000000000000000000000000000000000..7ec4b48074eb8b4e569b39d4bb5963d887aa9521
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-tmu.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2026 Linaro Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/ktime.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include "exynos-acpm.h"
+#include "exynos-acpm-tmu.h"
+
+/* IPC Request Types */
+#define ACPM_TMU_INIT		0x01
+#define ACPM_TMU_READ_TEMP	0x02
+#define ACPM_TMU_SUSPEND	0x04
+#define ACPM_TMU_RESUME		0x10
+#define ACPM_TMU_THRESHOLD	0x11
+#define ACPM_TMU_INTEN		0x12
+#define ACPM_TMU_CONTROL	0x13
+#define ACPM_TMU_IRQ_CLEAR	0x14
+#define ACPM_TMU_HYSTERESIS	0x16
+
+#define ACPM_TMU_TX_DATA_LEN	8
+#define ACPM_TMU_RX_DATA_LEN	7
+
+struct acpm_tmu_tx {
+	u16 ctx;
+	u16 fw_use;
+	u8 type;
+	u8 rsvd0;
+	u8 tzid;
+	u8 rsvd1;
+	u8 data[ACPM_TMU_TX_DATA_LEN];
+} __packed;
+
+struct acpm_tmu_rx {
+	u16 ctx;
+	u16 fw_use;
+	u8 type;
+	s8 ret;
+	u8 tzid;
+	s8 temp;
+	u8 rsvd;
+	u8 data[ACPM_TMU_RX_DATA_LEN];
+} __packed;
+
+union acpm_tmu_msg {
+	u32 data[4];
+	struct acpm_tmu_tx tx;
+	struct acpm_tmu_rx rx;
+} __packed;
+
+static void acpm_tmu_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
+			      unsigned int acpm_chan_id)
+{
+	xfer->acpm_chan_id = acpm_chan_id;
+	xfer->txd = cmd;
+	xfer->txlen = cmdlen;
+	xfer->rxd = cmd;
+	xfer->rxlen = cmdlen;
+}
+
+int acpm_tmu_init(const struct acpm_handle *handle, unsigned int acpm_chan_id)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+
+	msg.tx.type = ACPM_TMU_INIT;
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_read_temp(const struct acpm_handle *handle,
+		       unsigned int acpm_chan_id, u8 tz, int *temp)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int ret;
+
+	msg.tx.type = ACPM_TMU_READ_TEMP;
+	msg.tx.tzid = tz;
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	ret = acpm_do_xfer(handle, &xfer);
+	if (ret)
+		return ret;
+
+	*temp = msg.rx.temp;
+
+	return 0;
+}
+
+int acpm_tmu_set_threshold(const struct acpm_handle *handle,
+			   unsigned int acpm_chan_id, u8 tz,
+			   const u8 temperature[8], size_t tlen)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int i;
+
+	if (tlen > ACPM_TMU_TX_DATA_LEN)
+		return -EINVAL;
+
+	msg.tx.type = ACPM_TMU_THRESHOLD;
+	msg.tx.tzid = tz;
+
+	for (i = 0; i < tlen; i++)
+		msg.tx.data[i] = temperature[i];
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_set_hysteresis(const struct acpm_handle *handle,
+			    unsigned int acpm_chan_id, u8 tz,
+			    const u8 hysteresis[8], size_t hlen)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+	int i;
+
+	if (hlen > ACPM_TMU_TX_DATA_LEN)
+		return -EINVAL;
+
+	msg.tx.type = ACPM_TMU_HYSTERESIS;
+	msg.tx.tzid = tz;
+
+	for (i = 0; i < hlen; i++)
+		msg.tx.data[i] = hysteresis[i];
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_set_interrupt_enable(const struct acpm_handle *handle,
+				  unsigned int acpm_chan_id, u8 tz, u8 inten)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+
+	msg.tx.type = ACPM_TMU_INTEN;
+	msg.tx.tzid = tz;
+	msg.tx.data[0] = inten;
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_tz_control(const struct acpm_handle *handle,
+			unsigned int acpm_chan_id, u8 tz, bool enable)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+
+	msg.tx.type = ACPM_TMU_CONTROL;
+	msg.tx.tzid = tz;
+	msg.tx.data[0] = enable ? 1 : 0;
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_clear_tz_irq(const struct acpm_handle *handle,
+			  unsigned int acpm_chan_id, u8 tz)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+
+	msg.tx.type = ACPM_TMU_IRQ_CLEAR;
+	msg.tx.tzid = tz;
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_suspend(const struct acpm_handle *handle,
+		     unsigned int acpm_chan_id)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+
+	msg.tx.type = ACPM_TMU_SUSPEND;
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
+
+int acpm_tmu_resume(const struct acpm_handle *handle, unsigned int acpm_chan_id)
+{
+	union acpm_tmu_msg msg = {0};
+	struct acpm_xfer xfer;
+
+	msg.tx.type = ACPM_TMU_RESUME;
+
+	acpm_tmu_set_xfer(&xfer, msg.data, sizeof(msg.data), acpm_chan_id);
+
+	return acpm_do_xfer(handle, &xfer);
+}
diff --git a/drivers/firmware/samsung/exynos-acpm-tmu.h b/drivers/firmware/samsung/exynos-acpm-tmu.h
new file mode 100644
index 0000000000000000000000000000000000000000..f1a1ac21736d52bea0ad2a7cb3b280201fa74ffe
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm-tmu.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2026 Linaro Ltd.
+ */
+#ifndef __EXYNOS_ACPM_TMU_H__
+#define __EXYNOS_ACPM_TMU_H__
+
+#include <linux/types.h>
+
+struct acpm_handle;
+
+int acpm_tmu_init(const struct acpm_handle *handle, unsigned int acpm_chan_id);
+int acpm_tmu_read_temp(const struct acpm_handle *handle,
+		       unsigned int acpm_chan_id, u8 tz, int *temp);
+int acpm_tmu_set_threshold(const struct acpm_handle *handle,
+			   unsigned int acpm_chan_id, u8 tz,
+			   const u8 temperature[8], size_t tlen);
+int acpm_tmu_set_hysteresis(const struct acpm_handle *handle,
+			    unsigned int acpm_chan_id, u8 tz,
+			    const u8 hysteresis[8], size_t hlen);
+int acpm_tmu_set_interrupt_enable(const struct acpm_handle *handle,
+				  unsigned int acpm_chan_id, u8 tz, u8 inten);
+int acpm_tmu_tz_control(const struct acpm_handle *handle,
+			unsigned int acpm_chan_id, u8 tz, bool enable);
+int acpm_tmu_clear_tz_irq(const struct acpm_handle *handle,
+			  unsigned int acpm_chan_id, u8 tz);
+int acpm_tmu_suspend(const struct acpm_handle *handle,
+		     unsigned int acpm_chan_id);
+int acpm_tmu_resume(const struct acpm_handle *handle,
+		    unsigned int acpm_chan_id);
+#endif /* __EXYNOS_ACPM_TMU_H__ */
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 0cb269c7046015d4c5fe5731ba0d61d48dcaeee1..cc045370f4b0dc6ccea99e3c2d6f86a43b2e9671 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -31,6 +31,7 @@
 #include "exynos-acpm.h"
 #include "exynos-acpm-dvfs.h"
 #include "exynos-acpm-pmic.h"
+#include "exynos-acpm-tmu.h"
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
 
@@ -595,6 +596,7 @@ static void acpm_setup_ops(struct acpm_info *acpm)
 {
 	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs_ops;
 	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic_ops;
+	struct acpm_tmu_ops *tmu_ops = &acpm->handle.ops.tmu;
 
 	dvfs_ops->set_rate = acpm_dvfs_set_rate;
 	dvfs_ops->get_rate = acpm_dvfs_get_rate;
@@ -604,6 +606,16 @@ static void acpm_setup_ops(struct acpm_info *acpm)
 	pmic_ops->write_reg = acpm_pmic_write_reg;
 	pmic_ops->bulk_write = acpm_pmic_bulk_write;
 	pmic_ops->update_reg = acpm_pmic_update_reg;
+
+	tmu_ops->init = acpm_tmu_init;
+	tmu_ops->read_temp = acpm_tmu_read_temp;
+	tmu_ops->set_threshold = acpm_tmu_set_threshold;
+	tmu_ops->set_hysteresis = acpm_tmu_set_hysteresis;
+	tmu_ops->set_interrupt_enable = acpm_tmu_set_interrupt_enable;
+	tmu_ops->tz_control = acpm_tmu_tz_control;
+	tmu_ops->clear_tz_irq = acpm_tmu_clear_tz_irq;
+	tmu_ops->suspend = acpm_tmu_suspend;
+	tmu_ops->resume = acpm_tmu_resume;
 }
 
 static void acpm_clk_pdev_unregister(void *data)
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 2091da965a5ad238b5e16c567a72fe88fafe6095..43d41e11ad2eb985e27a918ce3f9e9ac15a194ee 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -40,9 +40,33 @@ struct acpm_pmic_ops {
 			  u8 value, u8 mask);
 };
 
+struct acpm_tmu_ops {
+	int (*init)(const struct acpm_handle *handle,
+		    unsigned int acpm_chan_id);
+	int (*read_temp)(const struct acpm_handle *handle,
+			 unsigned int acpm_chan_id, u8 tz, int *temp);
+	int (*set_threshold)(const struct acpm_handle *handle,
+			     unsigned int acpm_chan_id, u8 tz,
+			     const u8 temperature[8], size_t tlen);
+	int (*set_hysteresis)(const struct acpm_handle *handle,
+			      unsigned int acpm_chan_id, u8 tz,
+			      const u8 hysteresis[8], size_t hlen);
+	int (*set_interrupt_enable)(const struct acpm_handle *handle,
+				    unsigned int acpm_chan_id, u8 tz, u8 inten);
+	int (*tz_control)(const struct acpm_handle *handle,
+			  unsigned int acpm_chan_id, u8 tz, bool enable);
+	int (*clear_tz_irq)(const struct acpm_handle *handle,
+			    unsigned int acpm_chan_id, u8 tz);
+	int (*suspend)(const struct acpm_handle *handle,
+		       unsigned int acpm_chan_id);
+	int (*resume)(const struct acpm_handle *handle,
+		      unsigned int acpm_chan_id);
+};
+
 struct acpm_ops {
 	struct acpm_dvfs_ops dvfs_ops;
 	struct acpm_pmic_ops pmic_ops;
+	struct acpm_tmu_ops tmu;
 };
 
 /**

-- 
2.52.0.457.g6b5491de43-goog


