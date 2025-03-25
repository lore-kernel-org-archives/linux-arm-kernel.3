Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D32C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22F3uA1pFjUSsqH5uZTrmsJjR2r2mTgeguTTuS3Ky1o=; b=XQjdKU6giOkRrNspyit7hwqzwo
	aa5aXnWjfCPTShqlX2VF0E2p3gGG++hjfXCfYMbSyIcb6B53IKqXiJr5OFi76VABDxpKoK4Qtc9H/
	91Il9pgXazf+gHQcQRcw7QMgZRQzfgnRuj9Iuybh3Xg1zREK7GnhMI0JqB6CGlkaEHZORZpRxAgSL
	JncBFMuMyyEwRTizrvcPzM1mfB3uHANkonrN25eV1OW4xqoW2BA11fbW6VF53uk9L/423WjGENHG3
	5bcbrMssb358bwXDArDG6VAzNpB2ZRK2yl4oO1yOgtCJicAdFfHGjLfG3GI+3U9J0IpqroxFOY3KN
	fmDW1egw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0ul-00000005M8N-2WQn;
	Tue, 25 Mar 2025 09:49:43 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0rL-00000005LcH-3iO1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 09:46:13 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso184853866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 02:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742895970; x=1743500770; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22F3uA1pFjUSsqH5uZTrmsJjR2r2mTgeguTTuS3Ky1o=;
        b=Ve6NsjP3b2CGZkrrMp7/xwAqt6z8iK8CDkpYODDqxFEmC9EdA/NDbEnnL9EmE53inX
         Yf0knW3pnAlE30fBY41yj8EaaRWZ5/H9SGkeiZEVk3KDyc9WpJqxzmFsg8vXAnvbncZ/
         iPicCJzvIkdjkxV0QhnivMRX806j2a+zFiiAaLGs+ZcJ6T0f3fr/vOBjZCmFu7yHetfa
         MHnTWN2Z1swWMT2j1VTLT5APgSGRLvqoXQAs9kToe44AaDgpOkN95Okeklzr+/PRgsU6
         qfg/cEFFxi5w7jL8GOXaEMKMP+5bBrijzSjPhBG5pX1VAMahMpIWBeog1ZHy4Ltj1cjb
         zZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742895970; x=1743500770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22F3uA1pFjUSsqH5uZTrmsJjR2r2mTgeguTTuS3Ky1o=;
        b=H0LrxcnezJWY+jQTOm6qgxhzf6ndcQKvNjOZHIHidjIXqIRaci0wiu32UR3PQ0t03g
         6XoGOczvmEwZ6TXlCZQLnDttKvYF3HvMFafRiXeVXOg9cBXF6TMr9b1vcfKq0ycdGgBz
         lhihyzLLFPx1Csq1D65fnQGKqki9D8GTtdt/n65j1xXANG2ifOlMnL6lqIwkQv9CJdmk
         Dn5hFPdKrxUQIWgzkca57yKqTib0xJ8aU6UGO+ZGsVvDcw3l6i7vA7AQ7EYacbfbbJA2
         6LY+X466+UBSJV3TUnzwDk3oCx6UPcqMh6PqQS+osxUxMB41Ne20DBP7LYNjfI9MYxVp
         qU0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4S+AQmdTB1leEQkOeFm60qRtj60Pj3V/8UBc2ONiaQTUw+BUL/wRnnUcoTxl2vLI9um6T70j/uCfSYMesdFFZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzvVTmGFwzeMLdkWFUgl0oA8R166VR2jStAIrRJ4Wu5gdeHCWeQ
	IN/POVZOF/mtPqMx9DpZeNo0jVIGqU5g5Lf4z/2CqZAtAYVw0zqBZrbkPZsLXkA=
X-Gm-Gg: ASbGncsBWduJmLt5vQNGhoTGJSp2whzeEwJQZ1qaAhFB0C9AXXqiH3cIihjy3OZiWZR
	lVktZXNf0nPsBcl7fY0pihcSxjdmbMPS6NRaMoCs/ONbCykMbiP9tAV60jb+P0U/I40A1Lqc8ua
	fj+VFNOv/2U+buFrH00FuGYnn/0s5wK3NYOB/X+DxpLCuqfvfzfQXgviEwgQHU4xkrytZeezi+T
	j1utNwdI6IUBdMfMCdSnrhBjxu6PLVN2BZ3BqzUMQl+c/QZKGNRmjrRGaEP90U/fn+Djx4eDdLy
	cvq/uYG9qPOPVU/EZ7D7zBdZcQaJHwIvPGpfbRAVcCU3qd5pI4ilpI9YXKJ2ZO761Jdpc3fQw5y
	wKqOmAd3/TkXNbY0h55wLHxchj7Mm
X-Google-Smtp-Source: AGHT+IHxghepagNA7JYR+0kzFqQK/51FZuRNjy/iCwlqs4UQAA4cdYxiEkKhK4hN7ohtA8n2bEJxNg==
X-Received: by 2002:a17:907:bb4b:b0:ac1:e14a:19d6 with SMTP id a640c23a62f3a-ac3f1e494e8mr1615547566b.0.1742895970048;
        Tue, 25 Mar 2025 02:46:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8e509dsm832834566b.68.2025.03.25.02.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 02:46:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 25 Mar 2025 09:46:07 +0000
Subject: [PATCH v3 1/2] firmware: exynos-acpm: use ktime APIs for timeout
 detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-acpm-atomic-v3-1-c66aae7df925@linaro.org>
References: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
In-Reply-To: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_024611_923705_0108383B 
X-CRM114-Status: GOOD (  14.03  )
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

acpm_dequeue_by_polling() uses a loop counter and assumes that each
iteration of the loop takes 20us. It may take longer, though, because
usleep_range() may sleep a different amount.

Switch to using ktime_get() / ktime_before() to detect the timeout
condition more reliably.

This change also makes the code easier to follow and it allows us to
adjust the sleep if necessary, without having to adjust the loop
counter exit condition.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* slightly reword commit message due to updated patch 2/2

v2:
* add missing ktime.h
* ktime_before() instead of !ktime_after() (Tudor)
---
 drivers/firmware/samsung/exynos-acpm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..542eaff03f9e39422a8c5345ca75e05c1710a9ee 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -15,6 +15,7 @@
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/ktime.h>
 #include <linux/mailbox/exynos-message.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
@@ -32,8 +33,7 @@
 
 #define ACPM_PROTOCOL_SEQNUM		GENMASK(21, 16)
 
-/* The unit of counter is 20 us. 5000 * 20 = 100 ms */
-#define ACPM_POLL_TIMEOUT		5000
+#define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
 #define ACPM_GS101_INITDATA_BASE	0xa000
@@ -284,12 +284,13 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 				   const struct acpm_xfer *xfer)
 {
 	struct device *dev = achan->acpm->dev;
-	unsigned int cnt_20us = 0;
+	ktime_t timeout;
 	u32 seqnum;
 	int ret;
 
 	seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, xfer->txd[0]);
 
+	timeout = ktime_add_us(ktime_get(), ACPM_POLL_TIMEOUT_US);
 	do {
 		ret = acpm_get_rx(achan, xfer);
 		if (ret)
@@ -300,11 +301,10 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 
 		/* Determined experimentally. */
 		usleep_range(20, 30);
-		cnt_20us++;
-	} while (cnt_20us < ACPM_POLL_TIMEOUT);
+	} while (ktime_before(ktime_get(), timeout));
 
-	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx, cnt_20us = %d.\n",
-		achan->id, seqnum, achan->bitmap_seqnum[0], cnt_20us);
+	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",
+		achan->id, seqnum, achan->bitmap_seqnum[0]);
 
 	return -ETIME;
 }

-- 
2.49.0.395.g12beb8f557-goog


