Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D0EFDEE42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 18:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aCUIQKGwjYWyiYUETBzXQ2kYLoZVgqeL54EOmI3cmaM=; b=QfX4N20igDgHvOzNfn9QFynGOj
	O3m41Q5PBY7uBJv7nTq/SrCHRBY+cd0RlXR/xUJ2q3euWdLD2j36r4ETZgoKuZbByMYs0fJGPOfSd
	W98767oCY8Iq9h4MYCuV5wM4JPHcV5cspa2/1QFQl7YO9azdaOK29lsYasRb83dyT67grSZ8HQzVh
	Pnes5il7Ozb+pYfEmweJv+t09t67peETuYleOdWsN9gT7XmcPBcXeCZn6Q2TskymWdgtg8+ApmJXt
	KB87RILm2F2qvKIubMzX0J36CjeKAqiDRneWqFJhuNWDYXFrfdWGCaAxNskR3NXw6l4xIvcKJ0ofm
	sVrk67JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFysH-0000000C7b0-390X;
	Thu, 23 Apr 2026 18:34:05 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFysE-0000000C7aD-0rJ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 18:34:04 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-12c7212836bso1181978c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 11:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776969240; x=1777574040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCUIQKGwjYWyiYUETBzXQ2kYLoZVgqeL54EOmI3cmaM=;
        b=ceofZ8OMWDTQiT6aoPX99cgVjV3bGTuzSrEbBMDgwNnLfMvBnqIQqQKMOLylBNcSI7
         P7RWUtkLun7ff9QaVhilNlz4Ybn9Xwco/4Exx01ncBf2TVu9kek8otLusYJmV2uAfApP
         l/lcn43aNmpZ+RWVFhLE+cMgK7KV494J5xMdwxwPpwesCppwn01/WXb/bOIvhH00rUm7
         rZGPnur0BEa3NfEja1u9VxBbyeqqUFFUC2Jf3otLKwNmjbgVwzvpURjrLqhi6JyuDEi6
         uvrUBFGuS93f0RHem02bQgJ8mzRXgw4kJPwLK3LBrixT9ZjzJiIOFsMOrMSWyGmyo6Ds
         /TFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776969240; x=1777574040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCUIQKGwjYWyiYUETBzXQ2kYLoZVgqeL54EOmI3cmaM=;
        b=mk8g43ozozZrXZ+dc+DsMV5O7Qqj66dRLFCl3GY1VL3DvCfGbarDHuLpZDI25GVIIA
         713FY0VmrcN8z52ptFdiG5njpkUZo0kyc8ca3z9Fp+sqtU8eAWJaS71fItwJSAnZ9sv6
         BP+SVA10GMFTobByxCc5h3+kjzD1xfRRE8lZff25kqnS/hJo2ign4WRtZRzdqHtzBsu8
         kxhYcvoZZ3s3HVuuWCwMQTdjLzxiRs6md1R4aNk7fkwsfKrlMg+D9AfP91+JL38/Egu4
         BejMEYkWfYY2tgUwSeds0137A2+qdRgH+A8Q4acCZHV0h/OzFNAVFXkXcE5cKC7US4OO
         G7Dw==
X-Forwarded-Encrypted: i=1; AFNElJ8EcSEqpwkjCIl3hbXsHyAVCNwFzqWWHpWwezpUHIQBn8WFw0tjC2sJoe4/vgH969K06Ajwa0KCFbC99wAW3FV0@lists.infradead.org
X-Gm-Message-State: AOJu0YwfrqDCWUNgR4u4ohQuEQLM1ACNQYOKzDZ2QpKo7Pmm0iYNqIxP
	ybPoc3owaA6q/GLa+LMuiJ7kZmYN0OiGzCGOAb4WBqLXoBDhHxpLH0w9h7u1IXX4/JM=
X-Gm-Gg: AeBDiev0PCOpCvp9UiHXoFUALwTLhX3jwolsUtvt4hDjTcmcJH9FzSbuVQfJzbw2Wz0
	SraiM4arz5W1pGUjkRfAt/76FzhvMwgtskJG/DKmLG4qPgD0b/lZ1sHIS4zIMTujGv+0ynOfSeC
	tE7V9anwtqUnhMUu1dohn8IlOZMVoepSWoy4gOfD7X/8/wGqIq+FbZR4Rw5lqLzw3ga66RjGTFu
	1qh3iRF9tT/2wF4Yo/w/tjMf5sCYH8Q3jAFwNTxmKTbQClF8tK3p92TEZFRmU+IOskrhAkBaoiU
	v9/+5ph6L0f7dEOVRVMlA1Za5HUBFrrWnrH264YtcRgG9VD6/eDD1aOfc14zAcSXgLJls4nxwtU
	EI19IgO2aLoZSERB6kqg4+v72LIgJOcjV3wBcRgV1V1wDDytgVdcFfpeep5DzBaVe6GRLrhyqyG
	+/QSVgpbHz5b8v4drOKCx6mp9vpj4bSQcF
X-Received: by 2002:a05:7022:ec09:b0:12d:c4a1:2dd0 with SMTP id a92af1059eb24-12dc4a12defmr436977c88.2.1776969240164;
        Thu, 23 Apr 2026 11:34:00 -0700 (PDT)
Received: from eileen ([38.10.152.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm36357934c88.14.2026.04.23.11.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 11:33:59 -0700 (PDT)
From: Caio Morais <caiomorais@usp.br>
X-Google-Original-From: Caio Morais
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	michal.simek@amd.com
Cc: Caio Morais <caiomorais@usp.br>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] iio: fix header includes across multiple drivers
Date: Thu, 23 Apr 2026 15:33:41 -0300
Message-ID: <20260423183349.636757-1-caiomorais@usp.br>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_113402_935448_530EA305 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

From: Caio Morais <caiomorais@usp.br>

Remove unnecessary includes and add missing ones as reported by the
include-what-you-use (IWYU) tool.

Files changed:
- drivers/iio/adc/xilinx-xadc-events.c
- drivers/iio/buffer/industrialio-triggered-buffer.c
- drivers/iio/common/st_sensors/st_sensors_i2c.c
- drivers/iio/common/st_sensors/st_sensors_spi.c

Signed-off-by: Caio Morais <caiomorais@usp.br>
---
 drivers/iio/adc/xilinx-xadc-events.c               | 4 ++--
 drivers/iio/buffer/industrialio-triggered-buffer.c | 8 ++++----
 drivers/iio/common/st_sensors/st_sensors_i2c.c     | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-events.c b/drivers/iio/adc/xilinx-xadc-events.c
index d16e61953..20b796ec7 100644
--- a/drivers/iio/adc/xilinx-xadc-events.c
+++ b/drivers/iio/adc/xilinx-xadc-events.c
@@ -7,11 +7,11 @@
  */
 
 #include <linux/bitmap.h>
-#include <linux/types.h>
 #include <linux/errno.h>
-#include <linux/mutex.h>
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
 
 #include "xilinx-xadc.h"
 
diff --git a/drivers/iio/buffer/industrialio-triggered-buffer.c b/drivers/iio/buffer/industrialio-triggered-buffer.c
index 601a26398..5796c9da7 100644
--- a/drivers/iio/buffer/industrialio-triggered-buffer.c
+++ b/drivers/iio/buffer/industrialio-triggered-buffer.c
@@ -5,15 +5,15 @@
  */
 
 #include <linux/errno.h>
-#include <linux/linkage.h>
-#include <linux/module.h>
-#include <linux/stddef.h>
-#include <linux/iio/iio.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/buffer_impl.h>
+#include <linux/iio/iio.h>
 #include <linux/iio/kfifo_buf.h>
 #include <linux/iio/triggered_buffer.h>
 #include <linux/iio/trigger_consumer.h>
+#include <linux/linkage.h>
+#include <linux/module.h>
+#include <linux/stddef.h>
 
 /**
  * iio_triggered_buffer_setup_ext() - Setup triggered buffer and pollfunc
diff --git a/drivers/iio/common/st_sensors/st_sensors_i2c.c b/drivers/iio/common/st_sensors/st_sensors_i2c.c
index 6ab143498..974e349ae 100644
--- a/drivers/iio/common/st_sensors/st_sensors_i2c.c
+++ b/drivers/iio/common/st_sensors/st_sensors_i2c.c
@@ -10,10 +10,10 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/iio/iio.h>
 #include <linux/linkage.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
-#include <linux/iio/iio.h>
 
 #include <linux/iio/common/st_sensors_i2c.h>
 
-- 
2.54.0


