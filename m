Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E4ED37E3B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUpc7tPcYauEJYqevhj0yziHsT/ZtjU3a5lZkEZyS1w=; b=GydVDDhyIpGo5W7O64tl5nL7mv
	i3IJai6s4zWvjo9qFytpjdqSrE3PWQcmSz/7v92NnRcI7yOxMay0TskEiNufRhI1t4k6hNl1C2x22
	fv1WVOm4CNPqyRnizKfzXTMk1YOEIopKAeFgvV1ryM8IiThVoyQiCtlVLWHV52HrYahxfAhc9fUGA
	4ymlti/GjLYjSYuVaINSP6wXY3j3/lk9XxGSW6cYrscprLnb8JCuKEq3WGAD/fwVrJzP0XBfYjVNg
	mKkZAib1R5+MDPRrTp2aaFSKDdHcMqPUQJX/4Pwe1g8tw/gYsdPBE81aMOB5NLsai6ZUzpDjjrfU+
	eHN8wAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gX-00000009USh-2VRh;
	Wed, 14 Jan 2026 14:17:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gT-00000009UOF-3Ggn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:17:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so1873085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400236; x=1769005036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUpc7tPcYauEJYqevhj0yziHsT/ZtjU3a5lZkEZyS1w=;
        b=ZyYwCt5qfR1VIAk7Gv2NMxzWuKc+HSP2ZvJ8ZtDsHuVGO98y3Aa4j/HGkw3f9B5KIx
         32ZssHE/OkmIUkq8/VrFU3khu+lE6PgJPT//PP4cnG0wE1yEqd88JEzq7gf/6kLpnXJZ
         AyvHdGDoqI4Mfq3xsSUOJ77RwGh2iRC3QA2M/qi4cV7GULpJ/8tBIKxLuvI75Sq3JZIT
         e1YqwPadrZ1RwxoY9X+BK+pQPHoqjLyyiWrSNzo983vmPvkQDPYweSh/K6RNhJ3IU1Ch
         espxZ6yvdNWO5ojb0gbjmYNTooTpUhO2rnjYUj/Cem9MV0PqhUVZQB13YgFUZv6KQcfi
         4sXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400236; x=1769005036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUpc7tPcYauEJYqevhj0yziHsT/ZtjU3a5lZkEZyS1w=;
        b=hBCg7mE5xlNLLXfpa59CJ2QWAH3CwxE+XqTpW03hLaIJo9A3fKLgapJQrJZ983pMot
         zsoJRCkcU/R2LXtmz1OsI3oQUoRxgfm4uBBQvhb0/t/pbpU/CEubVZpxN4CS1JBBycT5
         K12e0Ul8+2qPv3Nml8MeGzyNLBZj8MpSZZLX+wHcfRzWiGayHZgV9SfSCZSPvO49dghK
         7D7JQcfNVvOEwm5kCwF6bI391INKYfU5jeFtt4K3TtF1WSUJ78w2Lad5MQVfjtvXxwuq
         r6HdKSnIYio5NOFcvAYiLy3hZey4iieZAo7OiAinNdxlFrKhcLU0OnTAYLWFXcWKMxmm
         3gYw==
X-Forwarded-Encrypted: i=1; AJvYcCV26/WdYXyo2XsbuRERbBL7pKlhqfKMHG0xQpCO0Wc4rQ7DBIkFVBs/86HmCH7W+fNqpS/5Kf/tToCXhDyBBQQe@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3LtGUodrLVmtcHKeJgydivrYLhccfnlD5+52HXwObCetjEDBF
	WC4JD/dxOJG7kwbrU9fcU35EAv2X1mtFaXSKfS0MkIewSYKkgFmo8Rk8aPODxrldMDa11VMPHu5
	kQdUDBR/vLQ==
X-Gm-Gg: AY/fxX6Sb9vGW+JCDq+YPqIZqgUnYnQ2ecsp/ZK4VBLfNW3DOsgsNhwWxYsdjVu9ulK
	944M5QO5KX2CrdmmL4YUwgt7+1sxwTB43Gq3g8n0LOc/i+P5CHVF5MNLAUQHeC/O68ERfL+kmAc
	8rEDpzMi6jppUUH6WZ0+OGGokNMqFV33dIq1Sy2nouXlQ4IVUnKGpV/eQDc3I0H4GbnC0nGdPca
	Q6I9N45jVaPy70dpjkcAk2uNcHOAUYvm5vd8bamNSbLcjCY/vq0xouMONJ8bD1vHLRurmdZcYdC
	HdlY0m/siExfDXBRcJ0/x/0/x9Hg+FfLhhszZE3ZpPTl3ePHIkU82sySLvZpBKXm+GXaQ3AUq3m
	RvTVnCcDw3LIXK0KcoQxYznxWfWB87LDYgaQB5BdF8iXahWeHCkH0yAN7DDwPqwWktFZDHypXv7
	aJaNcBENs77/XE8Dqe9UzcqMp6mlP2NKxUpMGCNyBPqA56j2W455y2kMvweeGLDj5l5qfCZA==
X-Received: by 2002:a05:600c:747:b0:477:9d31:9f76 with SMTP id 5b1f17b1804b1-47ed7c284f3mr55537135e9.12.1768400235738;
        Wed, 14 Jan 2026 06:17:15 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:14 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 14 Jan 2026 14:16:32 +0000
Subject: [PATCH 4/8] firmware: samsung: acpm: Add TMU protocol support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-acpm-tmu-v1-4-cfe56d93e90f@linaro.org>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=11917;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=scZVLwTECj4CGzumXSOMKU8Ox6ZHln+/s1mUJJlsDnc=;
 b=5mBrS0mafIwBfkzAx7jh6ZJxc7p3Byf+AqDcw5Ue/nSlE+ZkDs76evSOIhSrOHLU1kRnnU0Oc
 B2lX0e++yktClE8dn7EwV6KxxKpjWxAEcl8FGBqCsiOlyY9Yx+lm++m
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_061717_888675_04AB7580 
X-CRM114-Status: GOOD (  21.74  )
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

The Thermal Management Unit (TMU) on Google GS101 SoC is primarily
managed by the Alive Clock and Power Manager (ACPM) firmware.

Add the protocol helpers required to communicate with the ACPM for
thermal operations, including initialization, threshold configuration,
temperature reading, and system suspend/resume handshakes.

This architecture requires a split responsibility between the kernel
and firmware. While the kernel can read the interrupt pending status
directly via a syscon interface (for low-latency sensor identification),
it shall not write to the status registers directly. Instead, the kernel
must issue an ACPM IPC request (`ACPM_TMU_IRQ_CLEAR`) to acknowledge
and clear the interrupt, ensuring the firmware's internal state machine
remains synchronized.

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


