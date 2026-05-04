Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F19ECD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AFkvwk1yHFeeDLYag5Oi8EMMsCVOXTu0Co6nMK2/h4=; b=NhR5iWl+g1juyidQVQo/qVn1D2
	LNtrFezQ2SmiZEeVEmuOQEpFzbB6etN0faErl8O8ZyfnIq51pw3MKM+yuIHWIyxF6m4NEzFQxqNvl
	HjslR5hTWDTBRnrBXiXTV+d1eBpmEDDL4g60iqMARJAPGtR7ZB7JzBS512SaDVRDvrDIj+R9ZNmTq
	Pp3d+yz7aC2MWgyXuwkOAekzY9SPKVnpz6U0Ru/e8q987i8txDpiygVAeaq0y1b3GetsBqP/yVTqo
	PL/1ot7p12GeI9jj4X7CDivHxF0v9qQed0uHnM1olhaKETpy7pP53qEcU7PPvx0io6Vyo+8ROGBPG
	QdXvzu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqLE-0000000Ctex-36Sk;
	Mon, 04 May 2026 10:15:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqL9-0000000Ctas-2bds
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:15:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-44c350a5b87so758984f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889750; x=1778494550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AFkvwk1yHFeeDLYag5Oi8EMMsCVOXTu0Co6nMK2/h4=;
        b=pdUE9R+oPpLEBus2MaE5kIcbmX+lSzRqIXLeVdahOLrcVGeyq/8r9AWwUqyTfcYhUP
         uO0tXL35aorD8r2QkIok0uxoNJ5VEU/Ur6eGrcUxkwci3NL205zxBQShoCrn0b66IEhQ
         URT2Ry75F/pCNw3feCwJElqdy/uLRrEZjcsAKBkBGTiT/cBFgH024VlpzftXwFkfuAO4
         htMGzQU30PxCLhErmU1qJtDpWTIa8QV4Y2DGx6ju0/bmZUrtNRmgpRyb2yez6X6Ig9st
         MhFW0aTgEUiMhqfxegsO+DSlIwRLQUO0g5ygxfX9e3bvVxseQoweTgddbkZVTlWxjvYN
         AjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889750; x=1778494550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4AFkvwk1yHFeeDLYag5Oi8EMMsCVOXTu0Co6nMK2/h4=;
        b=Zewc0wwUE1Y5InPTBUVX1qqKL/DP+mG11GQijG02tar1TNwXa8Y6BTusZybM6anAVi
         XcJkp6Ccu2mbLDObAvcFva+nkvguBe9gfhCUgeGCabaDMA+gGldQW7YHevl5Ss5VSIPS
         JZmdvoNMWaFCAvi4mtUXLgMTCmZ8SgVKsaoaovbNNEBI1nreozr3kHvgTdX4NnQPF7HM
         AwG+KOCyCCq6hzKAC7yZVcpKyaOUY+kYybIdrUH5xUXlgzyGGvw7W0uS1RDVLo5omoCK
         UylCXJFUXgBnBJM19tvoO7K8EC2LuXGXodWBj9LXSp85Dfu5EdmhbNIxKcAzrjNEwZCG
         qzXw==
X-Forwarded-Encrypted: i=1; AFNElJ/W1uAQakxJ01DW+cngWCbqT/ou0dwEz/F8pVcRjip7sRXf2DlovZPQjxRqFlPWdmfmmOjnzrBhIg7dbYztFLcI@lists.infradead.org
X-Gm-Message-State: AOJu0YwPkOk2rS6RD20NDEqoIvZlzUnsdV5RPJKGhW/bCMpn6EzmuRs2
	NMdwNozls/ojzNMPWD/yoF0M2vpCT6ML7C+MVdh9UydNLCdN2AN3u5RsfcZ1B0B1/NI=
X-Gm-Gg: AeBDiet8i1I5b3+ooEM9bVEL4FZtCsdeJAOtmGAXblCCDj2ZK+XPPaemMousVEawmD+
	vZKnAypGyf2HsqspK+rMxcRNc5s3+bLoA98HEq0mtxAYknVDzW8TQCdVc4oi0+XTtZs0Rtsio5x
	s1bgv/o2YkjZcKWlwUCGyEA4gL8ijn6hacGYBqwhrscSBwdbY0GiwEdbAi6lAFHuhYUi1DOp1R3
	hWuT5qf2YXqlioS2dB/nKE2hcmYuPY3e7nTC5Jfa/D9/gNGNzJ6/aw46b0hntoI30p0p2SumnTd
	+tKJYWefugK5HG/6fzqev7NW+9XtBp4Xyl9/fQ2j237V5dIcAcyVkf3He7APgfx+vxC+Y+uQBd/
	+MPq77WBvRrMM8LZ9k4P7Tu/NiXj80O8wdu3W+QJ/VKcR/jORRiRJ2NgipzfjmcglzLPkwSLXK3
	ny7rfp8Pm5xUR1WdjyQ+J6qwNhHRFrv3J76w2nbgNmjsf0wheGmNzy/ZyJBpDG4QYWXx9+60M3C
	YsSsVJzOavx5qfh0Q==
X-Received: by 2002:a05:6000:2906:b0:44d:4898:7ed9 with SMTP id ffacd0b85a97d-44d489881bbmr8562220f8f.23.1777889749744;
        Mon, 04 May 2026 03:15:49 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:49 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:47 +0000
Subject: [PATCH v4 4/7] firmware: samsung: acpm: Add memory barrier before
 advancing RX pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-4-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=2113;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=wZGIg1WvrcZuYhDQpreZS8xozMJIsonW/o4iqtdaJ6c=;
 b=suLmSOE+T23wbkQEcy8h90SPyQuIK637mI8IZ9Ruc7euPvI2vIZ2kHtS6x9sSzy80sumoELUw
 twf0j7bUtcvCZwZaVcYPk8Znt+FJlyLRxilXSSdTe46SYqdAH2SzCha
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_031551_690719_20727761 
X-CRM114-Status: GOOD (  12.64  )
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

Sashiko identified a silent data corruption in [1].

In acpm_get_rx(), the driver reads the response payload from SRAM using
__ioread32_copy() and subsequently updates the hardware RX rear pointer
via writel().

On weakly ordered architectures like ARM64, writel() provides a write
memory barrier (wmb()), which strictly orders prior writes against
subsequent writes. However, it does not order prior reads against
subsequent writes. Consequently, the CPU is permitted to reorder the
writel() store to become globally visible before the payload reads
have completed.

If this reordering occurs, the firmware may observe the updated rear
pointer, assume the queue slot is available, and overwrite the SRAM
payload while the kernel is still actively reading from it, leading
to silent data corruption.

Fix this by inserting a full memory barrier (mb()) before the writel()
to guarantee that all payload reads have completed before the hardware
queue pointer is advanced.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad%40linaro.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 9766425a44ab..a9449bc33bd0 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -5,6 +5,7 @@
  * Copyright 2024 Linaro Ltd.
  */
 
+#include <asm/barrier.h>
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/bits.h>
@@ -278,6 +279,9 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 		i = (i + 1) % achan->qlen;
 	} while (i != rx_front);
 
+	/* Ensure all payload reads complete before advancing the rear pointer */
+	mb();
+
 	/* We saved all responses, mark RX empty. */
 	writel(rx_front, achan->rx.rear);
 

-- 
2.54.0.545.g6539524ca2-goog


