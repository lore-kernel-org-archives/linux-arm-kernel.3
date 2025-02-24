Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C863CC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 08:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eldJ3fyZ9RULfFnJAoQ78yq6LgsezdF6MepZXaC6j0I=; b=tB21OOx0b5dORtWfvTEeIyhHNl
	C7NtIk+hlLt1fsmqHqSbp7t+dMqJI9sNlb1vyjTEDM9bep/eImIQl1l9Oh6EKUoYXFoAmXB89eV+s
	YM3OnVZgLMFrdWLl9zp2XMengY/ox41DV7+NlZAySwF22SsBeDLf7y+wFIqKp6bziY+KdsR0+dGuI
	QobZdJVy0+OUB9qckI5FDNayuL7tb08J68VCNgZbbXsYdMj2gI3Pi/Gk71GZujqfKvdR1+3sEEgtC
	3DJ8ziqOEcYrKUFK/gLBJgxMoVfzL/ObDLM6e+EhYGphSSGh5BvP+XZpK68pA4rt5TGouLIHTV4zL
	CkmnYgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTTj-0000000CcwX-2wIb;
	Mon, 24 Feb 2025 08:06:15 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTPC-0000000CcKd-2wf0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 08:01:35 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f2f748128so1788622f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 00:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740384093; x=1740988893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eldJ3fyZ9RULfFnJAoQ78yq6LgsezdF6MepZXaC6j0I=;
        b=QoiiLYWQ+/cR1osYgDJWwmO9XRGkr05CYdq5coZkNsdj+j7oX6wXRwJO6gk8zfQto7
         q1BlQYNMloBChvyurWZSO2s87CHWNgTtHOQtfiB/qaJM2bVPBDQFEfs1zlURGcFHpv8W
         kX9KVsIW4RDZ34oiL1zm6KGwXlQaxa1J+4l7FziMzEcz54O/9sWhzc95tkdZbKEd8GPP
         oGF+RpY9j27C3gR94c3UrJh6WKn8caHGAv0Dnu1DYZ+KrB+IyxZ8JCkqQs6IwnJHmPKh
         oTjjRGC3odPhyUafi34tldbDHSe/fSUV/mCXpfxH3WL6VcU8Z6HqpH8TmG197D4b0Y/j
         aCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740384093; x=1740988893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eldJ3fyZ9RULfFnJAoQ78yq6LgsezdF6MepZXaC6j0I=;
        b=J9/2r65Y9R+YBHGmApNUvHdajOEEVOt+fCdkkqtLn9MtbvpnBcoB8TS21wQMVteK7+
         MKnMJvuaTSNdd+76KGJ77XZezdAjv19vPiPAbfUgtb2GcYGLmyO2SBwdLd/cx3tNOClQ
         wFMPb9eLeH1wUHy+LbYP8bf1UsZpY4ICnvyzTgSDcXOpFGHJwGqINsswwNCcUyTbrDt5
         zVhI2y5w+KtNsoRVn/abKNmMY57p5t0/aFl1PPLe7pG0jEcHSYUP2n5rOLq5UOXTSP7j
         HWtwDK3C+s4anfsbqZHWWWAs6hXNkCyItx0qBWnqmoL1v27L7ZPJ+9IVeNfLzJDtH4wu
         SaZA==
X-Forwarded-Encrypted: i=1; AJvYcCV+pqlE4r9C2FlT9K8NIlkXmGaAlK1TBr1hXnV8eGPpXDjE4JRvNcpdElisjdSwyMEy5V5/aeZvGihFXhch935D@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7tlEs0V8b5/qixIqfZQHqWdczLNmWavE4w3BwoBHdSrv2kpJo
	Ompkw0AqJldK8kJRY5ifYGZ12mxkZI1UQD4atUR+j70euzlt7qvww+1cvmIq/G4=
X-Gm-Gg: ASbGncs4XBXnmhDFJgQUX9GIsfmNCGNKhmERXIGCbttV3K9maHmaToMkCZlCSbc4JO4
	OBUgdIKe1pfteaEaBcg6hcTuGsIWuFyaSjS6w/dkShbZ2eNzA5wLHcUaFQP6wqgz7HAhZz2zaWg
	wJztrrDotmAS1cS4OO/8Fw4ybMoOtGlIUOlRIm5h81sIQWX9NlTPLgROkLE59Rsqkj52cPBvNhU
	tUkfSRLzLm1DG/12NwUvsAPqXjPAqZCFBt2PGoNmK11AUDGpm5vnarSYJP+efdHjfToYKoE72A/
	p2pZnPJ55SbWJA60qT1Z7gwgHKnuRd9tSfKHwby5+UafiHSnXq5+ncQgW2DSDulIv51+1FvRhSn
	asRg7iA==
X-Google-Smtp-Source: AGHT+IHtf5uVeObOSZyCBZwbvEGvCzNRNum9va67etYAmQ/b61RunJpq5G91CksEuJbTMQeAIBjKag==
X-Received: by 2002:a05:6000:144a:b0:38f:2766:7594 with SMTP id ffacd0b85a97d-38f6e95c60cmr8671320f8f.12.1740384093024;
        Mon, 24 Feb 2025 00:01:33 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0367533sm97690395e9.27.2025.02.24.00.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:01:32 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 24 Feb 2025 08:01:23 +0000
Subject: [PATCH 2/3] firmware: exynos-acpm: move common structures to
 exynos-acpm.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-acpm-debugfs-v1-2-2418a3ea1b17@linaro.org>
References: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
In-Reply-To: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: andre.draszik@linaro.org, peter.griffin@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740384089; l=4949;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=hCBzOfJSymMyHvVROjcOk8C8vSA3TYnFB5U/O/rnkDE=;
 b=ATLynd3c1Y0yvN4/G4Wd0ln2S20qs67kvDyIgdhR9p4lEnrThWwETuUT7EpmvVxuE4ICAf2Hk
 NacKRW6DfReDLvZ+0SKuVRyS5pZc2HH7MZxIvDXf0/JNF0VtXLnWvh9
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_000134_770699_19F5B902 
X-CRM114-Status: GOOD (  19.59  )
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

Prepare for the ACPM logging feature addition. ACPM is capable of logging
things to SRAM. The logging feature needs access to struct acpm_info
in order to get the sram_base, to the configuration data from SRAM, and to
the struct acpm_queue internal driver representation of a queue.
Move these structs to a common exynos-acpm.h.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 48 +-------------------------
 drivers/firmware/samsung/exynos-acpm.h | 63 ++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 47 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 3c14afc89fd7..8d83841f1d62 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -12,7 +12,6 @@
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/mailbox/exynos-message.h>
@@ -27,7 +26,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#include "exynos-acpm-xfer.h"
+#include "exynos-acpm.h"
 #include "exynos-acpm-pmic.h"
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
@@ -38,20 +37,6 @@
 
 #define ACPM_GS101_INITDATA_BASE	0xa000
 
-/**
- * struct acpm_shmem - shared memory configuration information.
- * @reserved:	unused fields.
- * @chans:	offset to array of struct acpm_chan_shmem.
- * @reserved1:	unused fields.
- * @num_chans:	number of channels.
- */
-struct acpm_shmem {
-	u32 reserved[2];
-	u32 chans;
-	u32 reserved1[3];
-	u32 num_chans;
-};
-
 /**
  * struct acpm_chan_shmem - descriptor of a shared memory channel.
  *
@@ -85,19 +70,6 @@ struct acpm_chan_shmem {
 	u32 poll_completion;
 };
 
-/**
- * struct acpm_queue - exynos acpm queue.
- *
- * @rear:	rear address of the queue.
- * @front:	front address of the queue.
- * @base:	base address of the queue.
- */
-struct acpm_queue {
-	void __iomem *rear;
-	void __iomem *front;
-	void __iomem *base;
-};
-
 /**
  * struct acpm_rx_data - RX queue data.
  *
@@ -155,24 +127,6 @@ struct acpm_chan {
 	struct acpm_rx_data rx_data[ACPM_SEQNUM_MAX];
 };
 
-/**
- * struct acpm_info - driver's private data.
- * @shmem:	pointer to the SRAM configuration data.
- * @sram_base:	base address of SRAM.
- * @chans:	pointer to the ACPM channel parameters retrieved from SRAM.
- * @dev:	pointer to the exynos-acpm device.
- * @handle:	instance of acpm_handle to send to clients.
- * @num_chans:	number of channels available for this controller.
- */
-struct acpm_info {
-	struct acpm_shmem __iomem *shmem;
-	void __iomem *sram_base;
-	struct acpm_chan *chans;
-	struct device *dev;
-	struct acpm_handle handle;
-	u32 num_chans;
-};
-
 /**
  * struct acpm_match_data - of_device_id data.
  * @initdata_base:	offset in SRAM where the channels configuration resides.
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
new file mode 100644
index 000000000000..c212fe28758a
--- /dev/null
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2024 Linaro Ltd.
+ */
+#ifndef __EXYNOS_ACPM_H__
+#define __EXYNOS_ACPM_H__
+
+#include <linux/debugfs.h>
+#include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/types.h>
+
+#include "exynos-acpm-xfer.h"
+
+/**
+ * struct acpm_shmem - shared memory configuration information.
+ * @reserved:	unused fields.
+ * @chans:	offset to array of struct acpm_chan_shmem.
+ * @reserved1:	unused fields.
+ * @num_chans:	number of channels.
+ */
+struct acpm_shmem {
+	u32 reserved[2];
+	u32 chans;
+	u32 reserved1[3];
+	u32 num_chans;
+};
+
+/**
+ * struct acpm_queue - exynos acpm queue.
+ * @rear:	rear address of the queue.
+ * @front:	front address of the queue.
+ * @base:	base address of the queue.
+ */
+struct acpm_queue {
+	void __iomem *rear;
+	void __iomem *front;
+	void __iomem *base;
+};
+
+struct device;
+struct acpm_chan;
+
+/**
+ * struct acpm_info - driver's private data.
+ * @shmem:	pointer to the SRAM configuration data.
+ * @sram_base:	base address of SRAM.
+ * @chans:	pointer to the ACPM channel parameters retrieved from SRAM.
+ * @dev:	pointer to the exynos-acpm device.
+ * @handle:	instance of acpm_handle to send to clients.
+ * @num_chans:	number of channels available for this controller.
+ */
+struct acpm_info {
+	struct acpm_shmem __iomem *shmem;
+	void __iomem *sram_base;
+	struct acpm_chan *chans;
+	struct device *dev;
+	struct acpm_handle handle;
+	u32 num_chans;
+};
+
+#endif /* __EXYNOS_ACPM_H__ */

-- 
2.48.1.601.g30ceb7b040-goog


