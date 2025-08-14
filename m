Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA3ACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 03:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pl0UCqTEugdT0otZ1JL4PHmJhUzKYCzZ7agBq4X19mE=; b=pZ4i/UCr9v3wIdx1E3hmPx9GLL
	t5jWt4Pg0TaNPHuWpNboYZ4pCSJV1NeW6AxCdf/t+sD5TD+zz2auUWrmenungycSTIZn5j9AzjUZb
	6NHKrKvSgAaxiYnrbhIxALK69fsYbpCc5bYarxJJ0S7IIxHJ8s4BpVdnOPV5LbRWXjunz3nVb8giA
	fkVu1wZn6INlarPs/zxYEoaPgeeIDcsjIT38j6XjEzHeuQaM67JP2OiLAz78kDTHoK0MQh3I8OpIZ
	/k4JW1MTMUjVX1d2ORBi/2EKhHwXZL0zu+T4WHW037aOPwTEZ+pkFDcTymRWE/eNKZUl5yc2k+ot5
	LqDXXgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umP4S-0000000Fhfe-1GKJ;
	Thu, 14 Aug 2025 03:56:08 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umP1m-0000000FhOx-3y9J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 03:53:24 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b47173a7e52so279091a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 20:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755143602; x=1755748402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pl0UCqTEugdT0otZ1JL4PHmJhUzKYCzZ7agBq4X19mE=;
        b=g8d+JVtxIwyOWk+vMwasGLS4o20nzcO0wqCU84OnPw0yzxIT3V8UGq7W/aiD8y5o1Z
         8RIKS7e7LFt/JHxKPpuJcnGsAuqYlbZoejApoW5xhel1HkI1SPWndISM7FY9eK6ybmru
         G79iSFTEUD8lzRq1dQwqC2vNC3XazhHwlo9gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755143602; x=1755748402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pl0UCqTEugdT0otZ1JL4PHmJhUzKYCzZ7agBq4X19mE=;
        b=WRS18/EMwAP0LAvzuePNsg1IM6HdUBihKsiHmVEapCDa9UNuD3E6ED4NQiZ605xKi9
         adRBbzIyPl+GKkdZeJeHpDiXVtc5DzGI3x9vCy+bjSULhcmL91LApVXVDx07/UgSUXKq
         7dEmcpDcq+WQ1B1l5RM4Yn1hz2/JerFj9Y+Vi7NeLaaMb3GA9fB4z02kFQ2Par/I90mI
         g10Qlarfg1EZy2NZyrjfvkxKjdDnACkd+4eyEhUoJcI/BiXHEv8VthwZh1c6NhBxrEPn
         zyRbui1B3/uLW6OgQQ7rLgBS/Ua1STncL0s2amINS0WRVnov+VAHWIiKecq8D+GTCQ7a
         9rBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQtvQ6a7eFlXVFQFCgDA58fg9gmMEQ4BUTgqmh0oXVIctOQCnKOfTcynZdaH1BOiZm15UyNImXIVYruwWRosjf@lists.infradead.org
X-Gm-Message-State: AOJu0YzRAv+wQdDp2mknZS4x6BZVM46VOrcFyBDVZCDhfg5Q/5yoeq0a
	8hUkQNzJvBVEHVt/Jdk2a8w0kTczzCpS9Ydz+8wuT2kBP/D534eibVZDnE7Gj99K9w==
X-Gm-Gg: ASbGncuUWXNPRYmCxZKBZZ+su4rTt7DhkvOVvhEGiHhI9RXOqkDgPG/5Sz3PWP9BYNr
	ZiusmXvd+jLCVFlsu/NcpWQ7wXjwM3V9Jy0WfDCLPlRAtLsXrojMVjQ2Gqre/sMB6D+JBVWn/xK
	vyEiwhJe8BrNUuJXvVJNVaTCdzLl6S8kl3cGPDQnR1MPjuZDuqXk8Td3ZlG2vh3SPgT+M9Yy2Yb
	Sx9X5RN+lQqrBft11gICw+QS1FPmt+tA5NMffJAlDzWP+f2pp8c0jByA0qA6S6sh46+2ZgRMriN
	4se68QbXeUKuWs1LZ5zvVgePM+7pzKRUA9vHCTDeWDFHbmGddCkoL1y9ZpV2/3QK0h5sIiY4xgL
	crH9AZV+nfSUCLdN03RMGryAGmU7EUWNe7kg8ELLq
X-Google-Smtp-Source: AGHT+IEewGnhW08uwz92qzGaMb1N+K9gny1YesoScUE9j7LXkcIxhYyAzeLPYF+E+O3U8ZcDGRXTxA==
X-Received: by 2002:a17:903:985:b0:234:f580:a11 with SMTP id d9443c01a7336-244584e4479mr23394845ad.19.1755143601765;
        Wed, 13 Aug 2025 20:53:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c44f:5805:6bc2:66d4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f21c65sm342150205ad.73.2025.08.13.20.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 20:53:21 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] clk: Sort include statements
Date: Thu, 14 Aug 2025 11:53:15 +0800
Message-ID: <20250814035317.4112336-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_205323_108992_19A3ECD4 
X-CRM114-Status: GOOD (  10.02  )
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

The clk core has its include statements in some random order.

Clean it up before we add more.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/clk.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b821b2cdb155..2eb63d610cbb 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -6,21 +6,21 @@
  * Standard functionality for the common clock API.  See Documentation/driver-api/clk.rst
  */
 
+#include <linux/clk/clk-conf.h>
+#include <linux/clkdev.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/clk/clk-conf.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
+#include <linux/device.h>
 #include <linux/err.h>
+#include <linux/init.h>
 #include <linux/list.h>
-#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/device.h>
-#include <linux/init.h>
 #include <linux/pm_runtime.h>
 #include <linux/sched.h>
-#include <linux/clkdev.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
 
 #include "clk.h"
 
-- 
2.51.0.rc1.163.g2494970778-goog


