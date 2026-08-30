Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5027BC61DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=; b=C45AoE8p+TjtueJWKs5xctxupJ
	RNpdedCJcWbJtaKLRAlx4heq597P1BGB5yYWMjWN8+cjYyhIMdWPwqb/dwiCsWfWZq1J29N+qKVxm
	iX+th3EM80KauxsRg7NVOHznjIeIDvnoXCoHvmRaFhimFsLbDZo6aC3qe8V3eRdDgKePcUySXKUun
	ru2KwDghOGOp++HsUBeflXo3OZZ24veyY3SKKT9RzLh5jUzJ84fQIxODsGje8lnyagxRr5OxSfA3s
	lfEv/hsS25c5rHc3VcwAP0EIKrwacLbHWMqvfQL385ptoTSZntcXlARD5F0tmSC3+Z2xHiH3oW7Ii
	J0kq5mzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0j2s-00000007w7t-2vGb;
	Sun, 30 Aug 2026 17:10:14 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0j2q-00000007w7X-2XOW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 17:10:13 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2d9201076b3so2418495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 10:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788109812; x=1788714612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=;
        b=hylrAKrG4I+Cb3BlacZ/0iWD3Ao0fTARqfshUlEcVJ/tJjjFN0Y3CUgioAriBneNGy
         OaNHimgTGiFjXvj0PAx3pD7FA9Ph/t+55S+JN5k2McowfQtkWFUH79NXhLWSfAdaJgcH
         mSKFoRAN5N8GvH+f9Kt7Xg4GNQnLrL8zpC3mqqUclIsu7xggD+Wgp7nmF52woWa1Ce5f
         c4j17HSHjWf/BZ7OSkAI0V61+xHKnV6ewZEf+uzY8y+pAj7yl4CJQ7vhsXkkZnTA+UxT
         tMoeR/uKxSJJ57U+I9VB+y9wnGMQFt9YhxRIujA27faeWGEJhQDlm7MYLBlVH6S57QUc
         dcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788109812; x=1788714612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=;
        b=MdroDdJVbv76ij7CokkimZPwQI6QtieRCDVSNv/yCX7TMt5Y9iLtouIhV22rn5+U0a
         Q5feUZDjGl2jfGhvP4D3WrdCrlxeqr1BKUNug1M+IUywlkYhPCoUmWpnLToa/eHfF6n9
         uB/TDUCBO+M2mcD7hCj5TBXz5lEu3MEOP0pucWmR6e/tkftU6HrHhi+6/92g3lhjsIst
         Mm8HltuMzDnLtyoim2GREBZXIr+LuXk+XE2La8xML+jKBuxqVWBX2zGrTLGr2ubxx+F2
         hC4pH+4rq72whjWUw3SQNvxt5MnXHWRtenopgYB4ahmr6xQlBx6axvp2p6Z4hz706TQu
         h3ng==
X-Forwarded-Encrypted: i=1; AKwUvBxvebKBhpNYMmWVZazfYWNxjV11SZUiFuzIWuXBjUS0K5F93atnK3lPNHPr9j9bBG8LNm92RBFbD7xpcK2w824s@lists.infradead.org
X-Gm-Message-State: AFuF++k4XAxF+E1Ge3m6PrKSd41APEbr91ptgwXE+VgTokPmzaYjUiVY
	WbOsM4opA4bRHw1ay0Sy+uroLGVPFRd15lRZd6az0LkpgBPs9bgyMyjD
X-Gm-Gg: AYBFou0CqLhChU2qj9JJ12buWVA2cFHmE92bUVkHpibyQYViyf8kClvwEDrUqQx7Oso
	oVeQmsjIixRgxxT8bYhmdkpJfJ9bALSjy7ZZT3YSoMeYPREIMRf/5mJjPhwLhjUMWmjZ7D0IT7c
	C47qt/fAgyaDfCDfR+BKR7Uv5klopKA6RR8DM8efr4T1j0K/lYs6bOLaSEc2n63s17sGxwxdn3N
	ywg3vlq4LvqPiWPdaUIlCc7L8luGPAXWVtVjHMkFi5OlEkag/Xih7hA7wuFydH3IjOljxx6lyjL
	vjg2u51GObBwQMjrBSsk3P/PGQrpm0dfQ9zF2NSa+uGdeNhV4A6z5Q1G4VQ2owvYKIQdaIXDjdz
	oRjklu1PeIISqgz4s9J7IF0MHhGin0fLRHsGVWq/2M43YXWOm0zWGG+jNfOQ0vS3hwWp5nsLrNN
	EdAne3KMg3F9qsVGTlCDhgXxI/XGPyudaL2NDqclQ+HffkZ7h+N782n20syA==
X-Received: by 2002:a17:90b:4cd1:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-3989bd40da3mr20529328a91.17.1788109811626;
        Sun, 30 Aug 2026 10:10:11 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:88d5:45ce:40e:490f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm17047101a91.6.2026.08.30.10.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 10:10:11 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v2 1/5] iio: adc: bcm_iproc_adc: sort headers alphabetically
Date: Sun, 30 Aug 2026 22:39:14 +0530
Message-ID: <20260830170919.470974-2-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830170919.470974-1-mdshahid03@gmail.com>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_101012_648612_36063720 
X-CRM114-Status: GOOD (  10.92  )
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


