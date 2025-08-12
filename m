Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7B2CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xz4Qdv62lAKsjkAZ22ZFX9wEAksTHe+JhTiso/RYQVc=; b=APhoxN6O1CD70tmmeW/a83CrP1
	BgBIr1hlf9IQL098u5/I2MKlHq7XVa1nbIaG/0wjeArAvZ0XdMDb5rUjdBuNBKcGud5miVr1Fa3Yx
	YsivQxCcqWV8kvllm5pr5iqkqzRnvYdaZU2a3stM9RJqTiJXYt1C7YnfIihE9HgdCH+mk5/07uQJN
	pH8e4mjFr8+FsXrhioFf/t/jRZ0EOf5W62XJFWAV9S5c/5KtWoF73fy1HSrXVULErD32IZPyDfOWB
	NNNStAtKPO1Ri00qrsNiv6jUjVIqK9/etMPJHKLD2rKQy2Z8eaTN48dFpdfVTm1YRO9cr5164PeZC
	gnHYzUbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHY-0000000AlVk-2JX1;
	Tue, 12 Aug 2025 12:39:12 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulklC-0000000AItv-0YAo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:53:35 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b3bcb168fd5so3453406a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754988813; x=1755593613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz4Qdv62lAKsjkAZ22ZFX9wEAksTHe+JhTiso/RYQVc=;
        b=ZQKxYcPp5VRteX4pNjNnIn4JbnjBUpd/5RrmMw7WnHQjfy+b/sccvCbCHTVT0lCUQ6
         qrJezhSNee8clCn9fG7YM0E+5cT3+qB1blXceU8m/iUlTnORTFhGyMwQyEuOD2WMBh0v
         zzddJsPSbOa9+nA0UFVq30TU1eUNK+quwS9N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754988813; x=1755593613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xz4Qdv62lAKsjkAZ22ZFX9wEAksTHe+JhTiso/RYQVc=;
        b=Ga271y+3qKSGSoj/BUDZ2e810ZYNfhttLMM6/rGZsE18PyIQJP6bdTHfJ/egJIIpDY
         MSrywf51J4ZgMRv2ORYWhGxrdrimqeCifjKHv8Q2FaNx5BLQikBdV+4IsIk22a8LmeS9
         KgpDYCQVCfZQsMXJVsO5JTNH69HFzWwTIMk7JLqJ0wlsqdqYrsYPHmITIjAoQ1qqbd/3
         FyZ8KbQG8vlI8ySZ9UOmDLZYpOxSif7ThFloRBHBwNCwlhBrnZPkWchf5MpzcPoMB/i/
         w7s+HSTCXqzpFvJdX3K2kyx+iAVQZLdSxI8lUVOwdBOTuOT33WOGI5C3riquDZMzBMae
         Zb8A==
X-Forwarded-Encrypted: i=1; AJvYcCXh+2kfqquG2RKq9nHXMvzDhtwWB2IL4dD0vXf0HrMHdoLY5cwunwqS+kniRGF+hJx2iIH+5JisDSZq979snj9v@lists.infradead.org
X-Gm-Message-State: AOJu0YxuqAzrR0GOfnP0qQ+HlH0FWaQXFh50A7phxew+wo3ZOkymXs9d
	stURuzRzGoVtHKN2qxrnrb57IIARwrde49InlA/QNvT2QsLyxRjlI33PNdb7YjJL8g==
X-Gm-Gg: ASbGnct4NdwqgxKzVxPrvGUWgJ4VawwudmRirrwfGXhVAVL/iqv7R+F/cwD4IJT1S1S
	Plk6CecByxJsZjfljKB/1yQ1yj6zSSHZa9Y6y5sAZneIWmd5Q09jM1exMH/Dtm5L7s4PgSSBm2b
	BIg0YHt1e8IJ3SMbmHERimxmgKwuCNwZGaqd8BjVxomIW+OqR/WiLAOajYS0DFcBT6omC2+QxAw
	rYkXSUZ2284TXtVRqttkC3pVbRouNSxp2avqx21g7k9Kom2z7JSFhBahsu1lyKseHkM0/fOW0Ci
	JpP+wWWglHABRYflf7dCGOTw78OrB+x75pL+ALbYXNoq3ItosOf9sYs9gTtbjRvab8agioI+Vhk
	l4+3LMqk1blOPqWzLcytGZ6ouaRdsGo7ApiMw1HiL
X-Google-Smtp-Source: AGHT+IFOWCZVXUc44tmrtbFyVyCPua9bqZtg9A4wAaJCkeOc5TnmXp6aSqWf4TQcG7yMH+z4ilx1Fw==
X-Received: by 2002:a17:902:d2c4:b0:240:3e40:43b8 with SMTP id d9443c01a7336-242c228f274mr203344785ad.53.1754988813155;
        Tue, 12 Aug 2025 01:53:33 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:f81e:7c91:8fbf:672a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243017dd480sm10014365ad.33.2025.08.12.01.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:53:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: Sort include statements
Date: Tue, 12 Aug 2025 16:53:26 +0800
Message-ID: <20250812085328.3306705-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc0.215.g125493bb4a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_015334_207678_358178F5 
X-CRM114-Status: GOOD (  10.20  )
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
2.51.0.rc0.215.g125493bb4a-goog


