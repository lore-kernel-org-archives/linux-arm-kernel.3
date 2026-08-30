Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA3EC61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSXd07nmgAz6SThzdSSun0e/bFs1/0gaIblRruN5ApQ=; b=nUFVxBrj9qadcgDT7tTkniXniD
	GJAUlBoA/jJZ9wOwWTnErLYXa3QImRkyI17+39q2sAur7FUoCiVpyCldY+E/txhccSC6eklum3Y6z
	YJbg04LJt1bIj1rh7+EQuXz+7UKy2KxgodGged+LQr8h91E6zzBVHNOJ8tkW6e49Dee4cgiTgFhVe
	TxfihkPgpK2yz0D/fnp2OQnZLjq6kUEafM1zBP291oQIB36RtNm8+7NDK/MThaDVBWJcqpmP9/paM
	zYErtwunJxW0way/5xjXHPKqahkkt1YmZOnfXu7dO3axEPxkQiNVehemA35xVH46rAGFYTc5q3gEI
	7cuT6tsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0j31-00000007w9m-0paw;
	Sun, 30 Aug 2026 17:10:23 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0j2y-00000007w8w-39YQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 17:10:21 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2499142a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 10:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788109820; x=1788714620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSXd07nmgAz6SThzdSSun0e/bFs1/0gaIblRruN5ApQ=;
        b=kWgFJrTd0CEwvV1Etj9D9dM/+BpG+wjY8yfP2JywZmd8ND4K0a6CcxeUraSYD08SeU
         g9CpJN4KLeN41I1RSRG/QGv5ymAk7Zjx7nx+fr+VEFxXXzqmA+CsT4q85g9WOArT9Kol
         09lZ/IS+nsPSwk4XJXhCsiQcLzZWAThU1sINp1cuDGzOPSHz9Jw86eVfhmP+M9bFx2x1
         DI6QUNZKyj5pgbm/dIs5q9XaOfFT668skka73iUyQymnUGi/Fymjcr6kCUwngcwnbj3s
         da4cnkVq2G+boBA9T6egfIGk5rNKzXQDNn9vfAjwua0roU4GoFKS1COrpsxP+EkUUrNG
         NV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788109820; x=1788714620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSXd07nmgAz6SThzdSSun0e/bFs1/0gaIblRruN5ApQ=;
        b=qsBZ4UpJvqwvSdLmW7Zwg/251WfwXKRWDC5AHzV68fp3YqDwUOfR8imtWL8ksIqe/t
         4F6ikds993UDIFaZB92/yRn4+Lj6QxxzXSVCOzznrgdKv7+HR4sSqOr2mG1FmLPrzzZa
         SJ6UWKvkceKB6++zI8xzUq/gUZqGkAjNawdK/jRqWVquW0xmkML9jxNwabI81luHJAGe
         lLr8bOp7qIjftSo1C0oyMFzezJaLkdWtZhpm5o62p8oBLqHe6FNbWJCj5UYYkjQE6NE1
         G8xanV4DBv7kLKaW3Wqa7wCjTnHqF5kltFe6SQ04eFMIyOCYlNXxp52mYYlF29QnsDpV
         zojA==
X-Forwarded-Encrypted: i=1; AKwUvBymxzXETgFxTs4YZ37X3VrdzvQKfbrtc2wLMBiHI8DnoIL4oKs3JXWYwQFor+fSnenAKOvv7ILMj/v1pBTQyMHO@lists.infradead.org
X-Gm-Message-State: AFuF++kd9mbgM8WOXcnTy74+9Kq7AqyBm90P+PSsj2qdDAd819moZcvk
	tso4iFCOa+yBdQfasjiiSetWFylZyp77I/8xUTyjc/qCQQ5xyV4EC7pg
X-Gm-Gg: AYBFou0S+Z8dgvqsQAxDbbZVeyQMuheR1ZcMuVOGVoYaYG0A7iJ2KNrARBo8mugFTOI
	VnZRD2t5rLG5LRk6G24iW4xCK/w153p0obCWPH5jRuRG55WToKeNUFpHDR4QcdOFkJLchww8Aty
	XhIhJ2unirJA5MzoczXl3hSZ1gW1jMmBvbsnyMIXMD+NsrY501zUQYcSTXeM8TwH7DXSbPqc6v0
	puvdwFLYhb9KigKbkKEpH53xZjRFAhTznksgkFKoncxAFUZEjSW2OwRLyHQ9+uH8GXEuD49HM38
	vtCxxJJSMooFs4hwArKwZlNBfW5XCu+9ZWiiz7WC/XRGPntEWdJ8i+x1ebHKm8L7yGr61P5UYj6
	RYppXp1xH8XM6PgL09cpuzBGAmYPQjTDHFI5c8Qc2jJ1BvQKJmEGEXUk/xNGcP+1yhvDxNlbHrD
	lbYTASEjD8zchvtd3w6UMnp6ssy170yPxFGHkQKAX/OjJYB2YlpjhrJtRH2g==
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-396d0e5bbc0mr35517294a91.2.1788109819698;
        Sun, 30 Aug 2026 10:10:19 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:88d5:45ce:40e:490f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm17047101a91.6.2026.08.30.10.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 10:10:19 -0700 (PDT)
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
Subject: [PATCH v2 2/5] iio: adc: bcm_iproc_adc: fix include dependencies
Date: Sun, 30 Aug 2026 22:39:15 +0530
Message-ID: <20260830170919.470974-3-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830170919.470974-1-mdshahid03@gmail.com>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_101020_794332_45E10804 
X-CRM114-Status: GOOD (  10.41  )
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

Add the headers required directly by the driver for completion and
mutex APIs.

Remove the unused `linux/io.h` header now that register access is
handled through regmap APIs.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index e46e3761993a..2b59819c4ca4 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -4,11 +4,12 @@
  */
 
 #include <linux/clk.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-- 
2.43.0


