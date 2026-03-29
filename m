Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F4BF3D5E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 06:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysejrTV2AB2ou+MZFcLfbgdnpWQTQns3Jqxq0mhdpzk=; b=cVAm9no6/PIwTTlp4cE2N7Nmx+
	5sqKykReU0JyMddxGG7KQQEKrw294T2+LktNrxMkMY355BZHEGxVBMnGVzPPRMQZesyDOMfUZ+aQp
	wrf0CFZEIhTpuJE//G8D9u+gqxMzX91jxO2LJjjlwGF1PRH8LOW76jRJfTUMexhhuiZ/hKJfIpyVQ
	kJvxQpSUhYwKQ/GgUCEl0IM5ZqAJ7yN6SIFNUo+Vh0KN6+86WVgNsQVtXCx3ShyU1X7GxHgIB49vB
	qI8bo7wN1XeHr4ZJ0TRJU0aHiXhryoNdBJBlTvJqvsmJwMrDbSQqOEh3ZNEjLZT0l1pKv6rp2NHtr
	/OpWwj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jVe-00000009cue-3Sdi;
	Sun, 29 Mar 2026 06:20:30 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jVa-00000009crl-0HFb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 06:20:27 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-953a2634777so217532241.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 23:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765225; x=1775370025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysejrTV2AB2ou+MZFcLfbgdnpWQTQns3Jqxq0mhdpzk=;
        b=ktAGL3INqmEDlAKVRgAR+EoO7jVC81DgU6ouIZGVmXqg86lQD8L6R4KV6UE/n0P7YY
         kjcaGPTGcrUMywS3LeFA2nHo+Umq+g+lIxRi1nDCiSup1tlwfPlgKrrsFI82vZXBZcG7
         UludgtKlFv2+utcwTflwsf9IpzcCCuFWwr7TNcMVQY9otsj0nWZyWpQKeg3Kt5CrTDAC
         SAfYAqigDQ2lKF7H4JcuLR+ThQFAsK6oi30zsk09lOyEMhmgsvlKa5uAgZGCjWWg5DDp
         wmsn+aaOFQtoKPItN1NcnEzIG0VMbXIhpiLwUOdMsreDx9lGhgRQEAjjG6sZ8jEYlKkD
         IFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765225; x=1775370025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ysejrTV2AB2ou+MZFcLfbgdnpWQTQns3Jqxq0mhdpzk=;
        b=G19kQHBpnmf2PXm0ymJQ6SCwFV62mBSt+VtOVhyyA2xghkBgEWZ0YE0vgsOjOULwYi
         0FO1h4j555idldMp/qOclgQOY1OxZlEBmZS8zZkfGPLpjj5dr05BGlDQIel/RcyJy2GG
         Jscd8dkySD6TeliaUpaTTBpTEpl9njwS3kaXOxbb1BCbuzBDY7+zGmdQG2V+9qRVsxIw
         LBV+uLRscz5CW10Stl0v/PKNsX5nHfzvIYSMWYR8VS6NYS09iOg7NnAPByiYx4Jw+WTF
         HHB0xtK1xdhqbXYjt3r8J1ptaYEhmyeq82dlrdR/K8fqkCI4q2rletPYHSCFxCPr1gWx
         0dhA==
X-Forwarded-Encrypted: i=1; AJvYcCXVoD4FadzA5UXYytlfHek/HNbR44vZtxHP3MANEQWjt57RTAYx9RNKf/1mrgmiD2Wyi1kAfd6MebfAg/+f+3Sc@lists.infradead.org
X-Gm-Message-State: AOJu0YzkF/tMXUum/6MmWkrqNj8r/zsuuF6OrIFxyxSWSWzwUvdQ+44p
	1LLZsg7Xzek2GJddaVB96/urCXZ+jJqCheNvfQD9PZXMKMHnnQr6vga7
X-Gm-Gg: ATEYQzxL1HWmbR8bLd3+ySQN1g3JAYyL/jtuhUZQLcK9eKsLC//ZPbiWxUH1G6grbJR
	IM2yfPOm8Z0iJEyByGbzOOwVz1oTObC43br5NJyre+bAAS4pMADguYn8tx+R2IJYhnQXn2A41Ru
	L1LrDiP7237jCBsvvCSSK0BdSvO/xBlapWopxfeONO43IS52h3iEXY3+NzTYm27D/sytnJmDYmO
	IxzZHvxsa9u2BuUda2Nl75rsQdmPLCLW9TbwI7xfdnsZLE6q9wa8/PhBn5QKPeAev0fgzHavnfA
	mndLD16tzjy2Ie/ew0qL76boiqr8tVXBukKpwth98ZQbCCcZZeBELtxiuAgpLTPeWMDFFVpDxua
	9qkOA9ZtPgn9hvUaVY0gdiMyptpcmV8WDCJPNC6pC9jRNF/IAQkaXaRh0wPFV1DThGzPDT1XM7G
	f5rJYZLPvbTuImLI58pAbbbLeY
X-Received: by 2002:a05:6122:65aa:b0:56b:a6b4:5902 with SMTP id 71dfb90a1353d-56d4a6652f0mr3243971e0c.16.1774765224710;
        Sat, 28 Mar 2026 23:20:24 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:6d76:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58893d21sm4429929e0c.2.2026.03.28.23.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:20:24 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 2/2] staging: vc04_services: vc-sm-cma: add address validation in clean_invalid_contig_2d()
Date: Sun, 29 Mar 2026 00:18:46 -0600
Message-ID: <20260329062004.492812-3-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062004.492812-1-sebasjosue84@gmail.com>
References: <20260329062004.492812-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_232026_119135_1A239A2C 
X-CRM114-Status: GOOD (  17.54  )
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

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

clean_invalid_contig_2d() performs cache maintenance operations
(dmac_inv_range, dmac_clean_range, dmac_flush_range) on a user-supplied
virtual address without verifying that it falls within the user address
space. A local attacker can pass a kernel virtual address via the
VC_SM_CMA_CMD_CLEAN_INVALID2 ioctl, causing the kernel to execute cache
maintenance operations on arbitrary kernel memory, potentially leading
to data corruption or information disclosure.

Add access_ok() validation to verify the entire address range falls
within userspace before performing any cache operations. Also add
overflow checks using check_mul_overflow()/check_add_overflow() for the
range computation to prevent size_t wraparound.

The /dev/vc-sm-cma device is world-accessible (mode 0666), so this is
reachable by any unprivileged local user on 32-bit Raspberry Pi
kernels.

Fixes: dfdc7a773374 ("staging: vc04_services: Add new vc-sm-cma driver")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 .../staging/vc04_services/vc-sm-cma/vc_sm.c   | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c b/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
index d597d41b4..29aa5a939 100644
--- a/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
+++ b/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
@@ -40,6 +40,7 @@
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/of_device.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/proc_fs.h>
 #include <linux/slab.h>
@@ -1263,6 +1264,8 @@ static int clean_invalid_contig_2d(const void __user *addr,
 				   const unsigned int cache_op)
 {
 	size_t i;
+	size_t last_block_offset;
+	size_t total_range;
 	void (*op_fn)(const void *start, const void *end);
 
 	if (!block_size) {
@@ -1270,11 +1273,27 @@ static int clean_invalid_contig_2d(const void __user *addr,
 		return -EINVAL;
 	}
 
+	if (!block_count)
+		return 0;
+
 	op_fn = cache_op_to_func(cache_op);
 	if (!op_fn)
 		return -EINVAL;
 
-	for (i = 0; i < block_count; i ++, addr += stride)
+	/*
+	 * Validate that the entire user-supplied address range falls
+	 * within userspace. Without this check, an attacker could
+	 * invoke cache maintenance operations on kernel addresses.
+	 */
+	if (check_mul_overflow((size_t)(block_count - 1), stride,
+			       &last_block_offset))
+		return -EOVERFLOW;
+	if (check_add_overflow(last_block_offset, block_size, &total_range))
+		return -EOVERFLOW;
+	if (!access_ok(addr, total_range))
+		return -EFAULT;
+
+	for (i = 0; i < block_count; i++, addr += stride)
 		op_fn(addr, addr + block_size);
 
 	return 0;
-- 
2.43.0


