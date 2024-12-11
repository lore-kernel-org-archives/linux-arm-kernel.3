Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C17E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTKqCe2SELpX+WlhYxUqap5glecVBp4pq97MmKxgypE=; b=I42l7cIOQY48tZ8NvLwcXHDUbo
	M96A2ujWlLoX09fDo6Er0Tyegh5mUYVlNlKXKxLZ5KdeqEBC8zNCmqq7vxIf3vd1rD8YafoUmqXIh
	7ujZfYYyi7yalPdCvr9fN18X0Tvm5LLsuoEitZk52yHBpVEfjofhqEzPUjvGw/2pFjJO1AHZGXx5i
	OSKr0ZoIzaRHZ2E0G8nQKPdJyS4wUKQ4UKR0PJvubore3kXM0EuW7QZPmG4wtsZZDnMDyzADm3LUX
	zorXl4AW6U/gV20wKdMO7OEgs4rZnvS8m7la4FKhBFnj7z+yC0vb7vu6TaYzXn01Zf6LMgcjFk4nt
	JvX+E8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJzZ-0000000EaBO-2pqc;
	Wed, 11 Dec 2024 10:30:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJsj-0000000EZCd-03DV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 10:23:50 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38632b8ae71so3140432f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 02:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733912627; x=1734517427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTKqCe2SELpX+WlhYxUqap5glecVBp4pq97MmKxgypE=;
        b=rkZolzyoW2q35bnu0SVcKywnilJNvVf/tOKj4hg7fb+StNJKwN6aPFg3A7s6P/MfXf
         aR+lnI6l9L9VFugFLWqdT6yBUTEhGAmXVZNUyxtIYoZAbYmWI1aC0bNgdhmJf3dywVy3
         IuDtp73gDJDBT9S/wwESmjCB4KPz/YK7TU1LlP0g4A/RaYmy24cB+bYL3FBkVhgYjyon
         yh+jWSKdnfrjo/710IGdaAJXmrtZNnCYB4V2lk8P23G522hIjWJnoshM7JH2B+QWGRDw
         ivWD0urRheqhcXz4MpviDQwjdqL1X3NjlGoxN0vwi/d3Xu/hyHIaXLLRMmMs5l/ERi3L
         42xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912627; x=1734517427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTKqCe2SELpX+WlhYxUqap5glecVBp4pq97MmKxgypE=;
        b=IllwLvf1ld2QfBq7URM//ptuWsyR8t1yN0t8ehz4XjZTRTd1rV1G2bbuvn0dXFpUEn
         QfThGE7mP75vIjIj2DWXWIvzjU4n/147tSXN9e3PE/BEMzFR/V+iu2z87dtNru0zrUhe
         4M+8SVWSMqJGzSZ8m8QZm21Oliter5NKQAyyVNpzBDOAVsB9zXJJ0zrSDTzSkZJFnh5w
         aTBOWF6NG7Ax7INLr6KxBBorXPMJbjTcu93QQMJLhYu2cLMR+zbzKpWjabeMw73Z5aqi
         m8B74FZIAIQPNXyEBRgVRy7zcOiL2MYBQXZXDbkZRUhD1YpQNc/ZGOnyBgTKfY3FxxqP
         CH6Q==
X-Gm-Message-State: AOJu0YxCVfIthdgQ9Vt4napj3pgoiVO2xo4O3E+TNgOJHdsWUAFpfnFw
	KnMNmESB2MrKjgbV7ThPDuTAfp2mKdVhge1IJcgntCngJyABIs269HA8ab6kdW4=
X-Gm-Gg: ASbGncvqkyCUopcfzRJznpmhw1lC6ZEHSylDCdrJxT5qG8mk6+U8cCL1kIJqOw0vQa0
	mNBgPOg7Cnsnl3yNFhhDfs74YjqywgMjVx6yYS30VW1kgldjO+zDdUcrI+ntYBHSBeDPH/omjev
	Qud9LBbFCOhbcoKfoP9EZMYrNql0PCfKfXM46iRKXWR8VxBVrG3EINvzXMnpKrs/pq4jO9lTJiK
	x1n+pk5QR5fL3Hi/9DFkxXrrgl0bke1jINFqMXnxec+OOSozg5RFg==
X-Google-Smtp-Source: AGHT+IGb04BT249VC+YXzPYDilPJen43l7hFegMSZVIrm1PY3iqvihpx9mzJpwggyt25syAnQKuRgA==
X-Received: by 2002:a5d:64e8:0:b0:385:fc70:7eb with SMTP id ffacd0b85a97d-3864ce7fe09mr1468743f8f.12.1733912627500;
        Wed, 11 Dec 2024 02:23:47 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d1b3:c106:bf71:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514da2sm935137f8f.66.2024.12.11.02.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 02:23:46 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/3] i2c: davinci: order includes alphabetically
Date: Wed, 11 Dec 2024 11:23:36 +0100
Message-ID: <20241211102337.37956-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211102337.37956-1-brgl@bgdev.pl>
References: <20241211102337.37956-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_022349_050565_67C775AB 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For better readability order included headers alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/i2c/busses/i2c-davinci.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 4b499931fdfd..bab9f785eeec 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -11,22 +11,23 @@
  *
  * ----------------------------------------------------------------------------
  */
+
+#include <linux/clk.h>
+#include <linux/cpufreq.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/delay.h>
-#include <linux/i2c.h>
-#include <linux/clk.h>
-#include <linux/errno.h>
-#include <linux/sched.h>
-#include <linux/err.h>
-#include <linux/interrupt.h>
-#include <linux/platform_device.h>
-#include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/cpufreq.h>
-#include <linux/gpio/consumer.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
 
 /* ----- global defines ----------------------------------------------- */
 
-- 
2.45.2


