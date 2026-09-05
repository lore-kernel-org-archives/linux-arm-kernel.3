Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85287C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=; b=vLz8yFNZTFJXIeNFoIuv4wVCsR
	7JHiHFX2wo3oqwgY5XOpjeCvYWCmvo4CMw86nz8XWZ0bqWQVujyOfPzIkod2Mg+lViGfSpOrBpfoO
	A2XWDIwpY+c1jXTez38kjsPN3yJN1PJqN26IgQEwT1OwQ1pdzrXro7DnQaDHaiK36Q9B8pPi1JrZv
	cezEB21luatWhU14fnOCgp4HTcz77LiXQVvkAdcqPFerwCUhZ+7srUHXna+wL15U9zAdOPzb8Rqa1
	iy+OajZmWFkrcX7+X79mE1hG81mPEMjrH14cj3eK4A/Qw13xndydxj92cZX6eig7maDXNOxL/W733
	tj18/Djg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mpz-00000003utV-3oPg;
	Sat, 05 Sep 2026 09:37:27 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mpx-00000003uss-2UEE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:37:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1513891a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601045; x=1789205845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=;
        b=UZfbW5FyfbzHZQW+W59gRPRtXyR1fZtYXgPiEM2WP1Xu90r9mfYNMRggYWLvU1W4u2
         rtY59vgPKXje1qNAc/UjX3SEmF4rLOemOVzZixFxLYEr1K2RIy5+pxbQjowKOPxg90XM
         VOQHquDigG0AD6U4/4iHiWD4o5UdgXXxQonJ5apchh8OGgHGCNBszp4sSjRBTdxp0zxs
         DIhHEyUEpueLwMFQPhFIaiZ/VlCnAnsC6E0VWHNq5eWzfKNSyGu8nQT+OnFYCa3acVMu
         /DTYKADFtl/JPzyOGHxMtQSTLx1IIeQlvN9rBLk7JPMwf4hQp4lNhDX20LSA0iL2BIbO
         lseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601045; x=1789205845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=;
        b=A3Dt3bqrwMYBYJPMCNbWIDWKa7jifKWpZvPAzLsDtfTNLDHYyk9eXOcWBVq1hNmvUj
         GzXnN6QyGXKplmW+Cbjb464gjk+9xXLN9S8rzRBU1uxrW//S4iwdUAHLr5hP5Z657UBR
         h/JOKg+rHe4wP9XejgtOrFTSdCq3MvulxmgoWy72vQM2/ElTieCFsDUgxhbasS/1xN0B
         p7YMpG1g8Bpg0W3tBkSHhMDNu5xWa2NsrJf+n0e2a4D2jhe75bR20jN0eFz8JgCmA9JF
         IOTXzI4aUMqnHziFeb+sppotBuOuddFMbx0puL3073mYdUkUZgRsTUkpFF3M+eXuSZbr
         3URg==
X-Forwarded-Encrypted: i=1; AKwUvBzB/n3TrMrF0MASg9L/pN3yt/AQ3ZUH+11VAINL6JrZ54gJg0EYT54RNXFZ17ikEoTbToliyEUq1+f2xckrYZCK@lists.infradead.org
X-Gm-Message-State: AFuF++nxXvHJIpmmUQuYbch2uLZ6Y4TMDA8fCtF76XfdXpHKKx1+l8T0
	w2NxYuZd9l93cXu3zEApPCuwMKVbLAWL0hweEyXu/DsI/vuArxLBuUwT77EDzzQHiaM=
X-Gm-Gg: AYBFou3BpydR4p8lZ620kPBHFZMTkrfkiVU7MdloITbazoo7EHKlgsVHKrXRC0ppJ27
	u6HI8jEo4htEY6E2yRVhebpR/sLdr5NrsohATKZYc35E2gCejQZ1BgzBxxwARWUxEMaNX/Ijvc3
	XA2V5AeCSgTRouNNemKF/88Tehx+dLEiEnpexPlfTxrFdz7mUhJMaI5gW4QhxRrHvq8s+znQbnM
	THB1ENSaxZSKHkq59OSTjiWi84cfWe6vY24HwWjfIe/MImAl9JPdaE3aGsN0cdoLtf/5jO7CzRD
	B5Fm/506PRiSSDhyC4ERniuUqb/FOeBG1p6XZUe6y+RqHE9J65g8Tnthgp1JX8YCAGsK26CuEi8
	3aEkCLI9xEKjNqFV3vL5JgpyjIDXcPhtlL9JX1pVVMDTobhIV91sDc1w8qG+x+IhN6itd/z5lmK
	qLBdJ6MPY5sTAg1WaFSUNLYhl+TQYDQRGOFxrj2Gotfxi2nXnoIKALu5UZUA==
X-Received: by 2002:a17:90b:1e03:b0:398:b17b:3bd2 with SMTP id 98e67ed59e1d1-39b260dda6emr15831418a91.4.1788601044620;
        Sat, 05 Sep 2026 02:37:24 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5b5:60e7:9f67:1689])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm15763353a91.15.2026.09.05.02.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:37:24 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v3 1/6] iio: adc: bcm_iproc_adc: sort headers alphabetically
Date: Sat,  5 Sep 2026 15:06:26 +0530
Message-ID: <20260905093631.48667-2-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905093631.48667-1-mdshahid03@gmail.com>
References: <20260905093631.48667-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_023725_634562_6C130144 
X-CRM114-Status: GOOD (  10.89  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Sort the Linux kernel headers alphabetically to improve consistency
and make the include list easier to maintain.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index ab66b97d2f04..e46e3761993a 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -3,14 +3,14 @@
  * Copyright 2016 Broadcom
  */
 
-#include <linux/module.h>
-#include <linux/io.h>
 #include <linux/clk.h>
-#include <linux/mfd/syscon.h>
-#include <linux/regmap.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #include <linux/iio/iio.h>
 
-- 
2.43.0


