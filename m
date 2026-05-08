Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E89CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 05:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dgm85ZTzRm7Et/N4PqeSajuQEpz4ZP+SV6Szdoh9oh0=; b=llH14l1QA8qNyMnuNpjoWIZEBl
	wngPJX9s7pk6SGTcXPomkTyebL7WF8TolISVDpQGT4Znjm3D9SdsNXeH4Z6NL+lEE7LyqEuqNFdwN
	phNLg1Qqc1fPsVIwp0s5vVIpnyFPP4R7PWbbUx9br830uC//eDsNZ/a5W5v4haKZcnekhqWN5LBQe
	18RzhdZFFtjDo6tWvKkUozrzPYTbAjwWnCYOsdf4T295AWhg2ebmWfDpPaZ8J0l/FKUoBQLd4i+6i
	IhZjvlZk5pfNco6aEuO9/HMrprWcKKpQGzFTErptleF6xeKB27B6EENkxU8ddc7SCIVmAczTl7R0d
	+edxZUUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEDd-00000005gRC-155H;
	Fri, 08 May 2026 05:57:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEDb-00000005gQk-2P3Q
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 05:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dgm85ZTzRm7Et/N4PqeSajuQEpz4ZP+SV6Szdoh9oh0=; b=oucCbRyieCERNhXtaN43YugWDG
	9SjG68zBvIhcAz2GVwuFZL8fskaeYd+2KM9OpGe3EcQYJkifzv3IzRG24qZ1p5dqSeLIqSQRJdJiX
	1PRlqwOSYlW8iNN/IGO0CyQ2W0aCO6WTujw93Rdr/cww7wKfMRSyEgqB1KP4NEl9xICK3oL1A7kaG
	bUvmbbL2qu6J5UubHM7Y3KCaeScnBEow7Y03n5UQ5oQ7yaJve0K/KffQlkgFaNBIOITANWrdkfCwB
	MCEXwefA0H5O8+Rlom9zfPniKXb0iVIhdm4Tw4QB5HxnA2ZL+lHGx2Ke+zbVn367WaH1kKlxWd3ok
	UcE8w8XQ==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEDW-00000003nX1-3vXE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 05:57:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso9838945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 22:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778219860; x=1778824660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dgm85ZTzRm7Et/N4PqeSajuQEpz4ZP+SV6Szdoh9oh0=;
        b=cERp31WqpjVU6ibonPHqCU7flwUgArLPkbPoK7gWRAkpg1CnbNsch8jTDwzRL50SQ1
         AQFcvhunFvZsp+JtmFzk4iQhwZernUwia89+leifJmT/6SfM2blkaMUnnOkYxct9ZB0N
         kF99/6AvfAes66Tfo6pciiswFDlLJkR+iHbXNQMfmhAyPZ4lDgnmsEzEqY7Jn/2tGI9w
         K1nHZ4lGDR1GwpbMpZQ1QHYUPPm8xQeTNxScs9Qxo95PTOIdQ+ebhM0Oc+Pfzey5dAcM
         hnViYvaEgCntqEiIUvd0OTjCQ868Q9+eGrlip09jsiqD2T6f/kl/es7XxRHkdZ+xiscj
         jahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778219860; x=1778824660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgm85ZTzRm7Et/N4PqeSajuQEpz4ZP+SV6Szdoh9oh0=;
        b=dqSZZM87AXfRc9wvHo/1OR/KaPURCBw7qLiMVUrS7a7ZwusheN92XChOtWYhAegIFN
         BsVOqZ2DFl8t8HK2VlWn6gcB1SCCiCRXRP9zNylB0RRV8g8V2rPbu0ageMcu5HWiXPjn
         mZQUMWYh8VLoMEpvrS8VTuqgYJzaH+BfEhXBZsx/hKLV4m5jbYwhZbX+KdV0SOPpWGA8
         LE2b1ZtM70dF4wzAVwZkKF/zxYU/02psC2aF7FlZN3NS7w8hDpnkWY6JpeSW2fQoxbnV
         t81ArQ7XrIQ+Zr0vnfL9sEdTxeMIKQZ7SJOQ6QfD6G10PTHWgIXSAEoJSbFtRrlUVS4N
         Ripg==
X-Forwarded-Encrypted: i=1; AFNElJ/rZlAwsDhDMy8yRIxnbSPgbCosGxXvtkd8dxAZTatvU7rV3BaT43mYFr1FW0pKPWni8cVLC7GmGwMyuKjIXpb5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3kWbfopE2JZQ8xmhhtEhGckPjUPiX3k0PqT5ekmEaHgMvefWU
	55w0FxODQsi1HR1Xpaaj8UvWsHUiPE9NwYUIVFDOHeohJ4eod9+HR2qg
X-Gm-Gg: AeBDieuNFVhgU3cxCHEVqm1px3dhkS2yTZvqCByO/MirBi2oVrBLwSweVcasHeX8gCW
	GKHx0D1om96ECZTJJNcq8mJPcNMQE+xx2Qjy0yPHiGoVb6j649eVtKH9AnYHvQH2NrWqNt8EpwP
	4s/RLaQzitcinaqwaV4OwWNtWDaKFhHO7GvWkBNgZ1ufhOCrg3oLfS7g2RByYmvIkUEprLkIh/D
	yh1hH2wq7BT6tzMJPrx/AQf3xSGnnVtNSoDD3hKF4v3+Zb5Eoao42yVIIIxcSWnXnGrJva0PNL4
	0IPjyCYpexy5aDfeClUe0eDka1u3mkZNyxgNZu0dkuOCY0CtwI4s+cfnRrQbsL2+nvxstlDFYnt
	C5HXHSNpOdwx8UMIUpWtSFQDQm7UkLdX/+vTGaZ8BV7IqSHmsy1pQXcyeQ0d3NmJ/3wecidKN3D
	HrIkdGFLM4a7rDp2dBSYg2u7Ac3A==
X-Received: by 2002:a05:600c:1c0f:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48e51f3deddmr194731085e9.21.1778219860332;
        Thu, 07 May 2026 22:57:40 -0700 (PDT)
Received: from House.. ([182.180.27.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68f5d48fsm10278735e9.14.2026.05.07.22.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:57:39 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Fri,  8 May 2026 10:57:31 +0500
Message-Id: <20260508055731.19784-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_065743_374361_ACC5FA22 
X-CRM114-Status: GOOD (  10.56  )
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

Fix spelling mistake: substracted -> subtracted

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
Changes in v2:
- Combined both meson typo fixes into a single patch

 drivers/staging/media/meson/vdec/codec_h264.c   | 2 +-
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index 89e0f8624e5b..a6074de15118 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -16,7 +16,7 @@
 #define SIZE_SEI	(8 * SZ_1K)
 
 /*
- * Offset added by the firmware which must be substracted
+ * Offset added by the firmware which must be subtracted
  * from the workspace phyaddr
  */
 #define WORKSPACE_BUF_OFFSET	0x1000000
diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 76e9ca7191ab..ab4374e3b2ef 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -12,7 +12,7 @@
 #include "vdec_helpers.h"
 
 #define SIZE_WORKSPACE		SZ_128K
-/* Offset substracted by the firmware from the workspace paddr */
+/* Offset subtracted by the firmware from the workspace paddr */
 #define WORKSPACE_OFFSET	(5 * SZ_1K)
 
 /* map firmware registers to known MPEG1/2 functions */
-- 
2.34.1


