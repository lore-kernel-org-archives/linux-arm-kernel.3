Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650ABCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hmfITIeUR9zgNyqEDGMxgw+mqlzR44/20xSo7lqFBRg=; b=Z0WC3tWu9719l7pGE/JNmqv0Ft
	khg0ABc6EctrQpTn6GErD+Yvve+OOyYl0zyXQUmEj8LdH6KSzLaf8wyAHTwFF/3ED9sb96JmdB0GA
	K+R8fPIa4lkV0L9yfbF03VKxogNpFCidJEkwSa6FsGKq4vjyNxsfo8RLD5o4KOhxzsJZlUjkVqm6k
	jWQ8B1cJhXMrRN++C40/RYq3CmyAQv0jVZy6UUWO/7iJU04jx2FlzAvwjhpyAZZs8ay/j50UAf6bN
	/IaQ/dcCLwC2KpX350P70a40BmWq/POt7BDHNDGIYt/JSglfdgElNW0zx0EQjidhRDFfKvn+M2ln0
	/PfIfkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3Q4-0000000FzFS-2nKQ;
	Thu, 06 Nov 2025 17:05:08 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3Q2-0000000FzF1-0BEC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 17:05:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4283be7df63so656475f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 09:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762448704; x=1763053504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hmfITIeUR9zgNyqEDGMxgw+mqlzR44/20xSo7lqFBRg=;
        b=cZ3vwO4HErQSnD+wfgkqxUmX4euHalT9d3d0REEKGojjOr/tKgkJgQGcHVLkkcFofk
         W41WxXPRbyCjJs3G3qVqPnyD8vJzvrD3MveFf6B6RO2KHZ7wvpLyuoFmf/ormtRDZgUj
         /yIy0+S+c1P8IihOh+AskgBP0HrE4Got/Z5iSADVH6aUx920uX3xv48gSJvvGwGdOhQA
         qqVFtegci7lEgunK/fJ0/DJPxWm5xuQ7sccwCxdXxIsFV3XgKNYRYUVtonRkRWHs2Q6g
         OauaLer45pY9LynYsJ7t1I6OMCmgmTNSD7aEjRxkabWxGKwOKpuPgAvsCX1813YZcOnN
         gwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448704; x=1763053504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmfITIeUR9zgNyqEDGMxgw+mqlzR44/20xSo7lqFBRg=;
        b=L+gNL57Kqa+xjELg4AkNhQiv0IaodXxalBfqXpzRN5/eEPZTouodzQKVzsxcQZnrf1
         XDKsEyCHXaXWXM12hGOjb7weWAo7p5xFsfTl9BKJLcSa6AVReYYU8PPlfiNbGqihSsmW
         fXEx/Tsrk0feMsyQz0MUlBJAL5n4n3L9FrCUoipg2UCIMD9c9WkDF4GPyzng5HKIItJl
         7hD/DdRp90Ro4yS8oT8lFkHWLJzal3AhhbAG2mXjHsQi44NiTjrFgWsBL9yjtq/xVGZq
         2yiGmZs6YUwBEjeDxID1Uwd7Ztzqo4r1sE6Vp3aEsen9s9ie6+VV+SbDS4V+xoer4tep
         gUhg==
X-Forwarded-Encrypted: i=1; AJvYcCUn8tuKID/ODlIlVg5WA5Sid+RFZD0X5SoHWjZDnol5B902tY6oav05wU53BvL+okZvnBGhAsqxpiQnmc9eFmlS@lists.infradead.org
X-Gm-Message-State: AOJu0YzJmLIINvwII7SaN1nDlwHHDsHY7MuyckZmdUfEJmEHRZ8y11Hl
	6nQwE/n81+44zZnluiBavqKxOLU0HpR2uL5seGm/wgXzIJivcqQW1m1EwKfGNT478nY=
X-Gm-Gg: ASbGncvYUJnb5K3kL92zhII1IaZgo3Si21IgxHZn0T9txmi2yOLp6Y5I5faACXC15sx
	t+LaJY/tQk/YPJeNR/XERsMA4gshA3bQOb0MHD+9g5pEa/gSnW64pLpyb6ertYPL+WVnJYMOqcn
	jvsz173c4Odl+4Wy6lvmCB1zNUm5pLzeitHtQXjjrYrUhyspE3hyCD/YIogI3y6ikzjAsjTOwXh
	9NIoXMCiy3THJZGS43kZaVVn9zRf18eKVYzmHpabAAd36Olah7FNQBQlGXPMJmOWkHARL8BJ7Ln
	nsUUrlRdJpriBx3w7nIU65SB/61bmhp6j7QuMd/nEVHD60t4hxukUtolI8u7ZY8c2oVKoMCSPP7
	UxpOZIjyr09e6rm397EsMXet17KzxkC1Hz0nNf1BvSU9cfy04RJSSoKZ3y/mjvfQ3mRh3roxulq
	OomgIecTPg+/yw6dV9vr26nHR7N6zNdNrpdGNH5ellYS/jWZb2V0MK8TPL6RDpER3NY21+
X-Google-Smtp-Source: AGHT+IG6+Y8/xO+RlybIvSJ8UToflUonXatZYaEe3GrS+kZrJwAjzGUthljg2YYqVXNYggrOwWqgxg==
X-Received: by 2002:a05:6000:60f:b0:425:7329:e1d2 with SMTP id ffacd0b85a97d-429e32e452bmr7320490f8f.16.1762448704063;
        Thu, 06 Nov 2025 09:05:04 -0800 (PST)
Received: from linaro.org ([217.38.114.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d54fsm104227f8f.45.2025.11.06.09.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 09:05:03 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	leo.yan@arm.com,
	james.clark@linaro.org,
	Mike Leach <mike.leach@linaro.org>
Subject: [PATCH] coresight: tmc: Prevent sysfs parameter changes if sink in use
Date: Thu,  6 Nov 2025 17:04:59 +0000
Message-Id: <20251106170459.2348-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_090506_112370_75336492 
X-CRM114-Status: GOOD (  15.70  )
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

The sysfs files that change the operational parameters for TMC buffer_size,
stop_on_flush and trigger_cntr are writable when the TMC is in use.

The new values will have no effect and be silently ignored.

Alter the sysfs functions to return -EBUSY if the TMC is currently
in use, and also protect the write values using the spinlock.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 41 ++++++++++++++++---
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6..a1216a1f9681 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -489,15 +489,24 @@ static ssize_t trigger_cntr_store(struct device *dev,
 			     const char *buf, size_t size)
 {
 	int ret;
-	unsigned long val;
+	unsigned long val, flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	ret = kstrtoul(buf, 16, &val);
 	if (ret)
 		return ret;
 
+	/* do not permit write if the sink is currently in use */
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED) {
+		ret = -EBUSY;
+		goto out;
+	}
 	drvdata->trigger_cntr = val;
-	return size;
+	ret = size;
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	return ret;
 }
 static DEVICE_ATTR_RW(trigger_cntr);
 
@@ -514,7 +523,7 @@ static ssize_t buffer_size_store(struct device *dev,
 				 const char *buf, size_t size)
 {
 	int ret;
-	unsigned long val;
+	unsigned long val, flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	/* Only permitted for TMC-ETRs */
@@ -527,8 +536,18 @@ static ssize_t buffer_size_store(struct device *dev,
 	/* The buffer size should be page aligned */
 	if (val & (PAGE_SIZE - 1))
 		return -EINVAL;
+
+	/* do not permit write if the sink is currently in use */
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED) {
+		ret = -EBUSY;
+		goto out;
+	}
 	drvdata->size = val;
-	return size;
+	ret = size;
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	return ret;
 }
 
 static DEVICE_ATTR_RW(buffer_size);
@@ -547,17 +566,27 @@ static ssize_t stop_on_flush_store(struct device *dev,
 {
 	int ret;
 	u8 val;
+	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	ret = kstrtou8(buf, 0, &val);
 	if (ret)
 		return ret;
+
+	/* do not permit write if the sink is currently in use */
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED) {
+		ret = -EBUSY;
+		goto out;
+	}
 	if (val)
 		drvdata->stop_on_flush = true;
 	else
 		drvdata->stop_on_flush = false;
-
-	return size;
+	ret = size;
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	return ret;
 }
 
 static DEVICE_ATTR_RW(stop_on_flush);
-- 
2.32.0


