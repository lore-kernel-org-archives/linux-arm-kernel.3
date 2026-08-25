Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784C5C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 17:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=; b=p3QzJ66DzTe4cWd3+yaCGOVofc
	hFJYtCsAixRWPr4nArWDPUa6YSlRKB/g4/4SH8V23WGqWwgC4G3b7IJPVv7iwbgN2Ei9yQoAmH86M
	KWT0oPlfWVledTGaCgk9GhMqoY1Ay/1vAibLx9eIoR79uHlS8+smLXZ1rNxo6Kgg151RZl4GVbzmS
	RRQECP5iD0PGxTAnjQdVcALX4HOYxCd6ouB885Kn4HE/V91lLSWoQCthmMNHKaTcuwqtXiTJxRB8Y
	bnbyh7jj10e0VBcLH+wyWSJAngVZOFNZL0AgI+jGJXNHqRkBnxKI1CTKUO2lzQZ6UGbbnj3BUNy6z
	mvH05t4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyurC-00000001Cs0-1OnX;
	Tue, 25 Aug 2026 17:22:42 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyurA-00000001CrB-0cHK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 17:22:41 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cbedf318752so3927235a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787678559; x=1788283359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=;
        b=Xue9e9Q9UDScFl4CUfLuJ4mgDvhP9wkYQ2nwUBh1rcunHKcS7GKHDgeD32VlNNvlqu
         OKAAxf2VlQz0MMYiVtqoN4LF4PK4oxSNdsTtdCvlRDk1HQuODcMhfG/nUMMcqiNyOz2d
         SY/NYxoQ95XiXgIQ0YUvZUo5xBpCVVkw7uCzE9/27tQ5Wfu6zWZ6zhojuNZcijbiGsC9
         TT1hMur8oZ25RvubRTf3wgoKCNzeIgcgqveVtD2tte51GzLqHitSF69CIo7NtACOZTLG
         Xg7EnnePf7Op+WcH4/GuRCUHhzyfQHNA+9evsbBtGA9QkLktW3Wp2pOPcz1fN0ru0pd9
         PHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787678559; x=1788283359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=;
        b=TaMdEHifMZctUIlHpJXovgq1YhsUOTTezGgL5kqM37vaXTw1XPlaDskCKGlRPpRqyA
         IRd4Wrlx75pAIdl6XVX5fDjCUz2jtE1vW7PXeQQHihuHs0bhA++sYmUPUEDWi/C6jQSO
         MuT9fWsMHCJJs/nIuDFO2tC+Rkr6YcsDF/6l+CIR5AKUiNllRTX9r0tG50SbAvHjBu5l
         AKLhTcpUIVli/wh7vhia+tbkx6Qe4yMadN54wpNKbsLBKrzrPEIJu4LPrJcBFyrpP30u
         oqRxhQD9siziIfBNPVaqrsijIbhopigkdxAug3U/xDnmlrBYnG8HlDBkc3H9hzzYZTwa
         oVnA==
X-Forwarded-Encrypted: i=1; AHgh+RqvInMqAAKaJe6E4DUgtLvCRNV0qM0CfQg+yIH7IHUQN2NMy0V+yvT0juZPduB6cveW/kMgJDJKb+K0ufnIbhhw@lists.infradead.org
X-Gm-Message-State: AFuF++lYCzeK3zTZcREfMTUU4b8Lr9BykmPQ1QTwSXd3cIljmd0vVUWQ
	WcvSWkZCKA7CnAf1Ug848rKjRdGj0Yi9wv7mUMKpAf6wY8uDr1dyfxuJ
X-Gm-Gg: AR+sD106tJ9kPONqL5XOJNlBqOekQVgpyIoUngmOJVT8pzZAiJH+o65PRr5umutPd2/
	uoPv6Irk7snvt9k3UYoHwlneqAgKq0z4ee7FQUdd8Qtbt9fCvyDBLYb0qpSDtuBeHI5LOkNO8r+
	xWyRQWI6Xe3alRDwgxn9Zx+kXNMkKHQ278sH2IY8NhVIh3TFEMUR3YLz2Uf1/n9PbsGgux87i1u
	isTFpj9zJ5Ya3bRcIs678QemQKMgjEK2wkl0rXLFlWpHozhXiNZShoOaWmDQxYm6FkPcm40Ji60
	qio0ZXgkmrLbb7g9tb2CEeQIiS03vEziSVKuVe70jRXE7sEIGD2qgOIcfZp3QQeB9lAbz7kNqB+
	4nYAB+ux1W6SyOerpgMd9XDOkHb33CkQ4n38h0SgiuwQI/dD5IP0EuEJhE7n4m9dJhdh3B7A2wB
	K8SH52HA3dofluunbzEA2n3A9xxqpCQcQCqRMbFwQHMRTfkUGayZEHkWXMlq8=
X-Received: by 2002:a17:90b:4a01:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-3966d1bae93mr1317136a91.6.1787678559136;
        Tue, 25 Aug 2026 10:22:39 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:7ed1:605d:3bd6:fefb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8d208csm327637eec.23.2026.08.25.10.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 10:22:38 -0700 (PDT)
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
Subject: [PATCH v1 1/3] iio: adc: bcm_iproc_adc: sort headers alphabetically
Date: Tue, 25 Aug 2026 22:51:53 +0530
Message-ID: <20260825172155.250484-2-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825172155.250484-1-mdshahid03@gmail.com>
References: <20260825172155.250484-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_102240_191928_6F36DCE8 
X-CRM114-Status: GOOD (  11.41  )
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


