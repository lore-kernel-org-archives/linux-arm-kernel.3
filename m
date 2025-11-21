Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B9ACFA459
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 00:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kXY0DT6HIsSoJH5czBF21Sus1oqhqzcXbPhbx1UdXUk=; b=f/uZ+5sqzEeOmIxhiQTdeJd7zj
	Bqv6fMCZ6xey9fWGKMrc6azM0ElNnzTGwJm5JNzPIyD3NKLzceSccaLTNpinpvX+asRdmig0rSMtR
	4m1xHWPVxcPiTOoBNE66x5nnaRr+5bpX0B0BFJyJnyFZRXRcW5xoAGknbJKJLcltaaINgyqejQqWx
	hTK8jeRADQIY6knqHK2xkA/h2lyiW81PQVMzD77gZ/YAhYNXBWGejwOYycY336JhAYkb0j3IcGCa6
	kasEiacoqKEluOWALmVVIn3ob5l2IlqJZko9/INXePAzlgGBLM7vAV/4hFN2n865u83RWo4Wwn7no
	KkOI20TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMEwf-00000007biu-2HFE;
	Fri, 21 Nov 2025 00:24:13 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMEwc-00000007biU-3qaD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 00:24:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2953ad5517dso19118195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 16:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763684650; x=1764289450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kXY0DT6HIsSoJH5czBF21Sus1oqhqzcXbPhbx1UdXUk=;
        b=e2hjhG7KadEO9fvf4MoihmT1rqGqzOmPsk5f0SkVvO9loLKVAE+d2tzkLkpAV9qs3n
         r4mJSjXRGESuE2kT9n9ZxFMzvhkbhSjH1uKM2MHxqur/6XZW5f5TJd/oWy5MjeYYwtc2
         QS7Ob0aBlway5Bc+KXgn20HoiuROfLtwkOYrWXfVMJdEUE9JtC3MvqIxtgFCs5ZgPkHH
         9gmSpQXILQz9dkMkVK3T21T+ShBhi9e0U91poYjtcI1Ng7SV8nWxIroFzhaOJzdf1P3L
         UpKD5vtOJCSDGkULrI9EViRNcZSKSsXSgoHhn9m00SKJ3mywikKjYYD3pY1tAhTXTMyr
         jHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763684650; x=1764289450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXY0DT6HIsSoJH5czBF21Sus1oqhqzcXbPhbx1UdXUk=;
        b=rYenO27F3kPdy5EXYOL5uyRpdpGZkkGVC0t9Lq15yjy2/rE4MsfzPZFKFo6U/vKD7A
         xf05qwVKd6jU/xrHbFxSRg95jiusPwEJgcxeS0G5w9mZKwjXLkjXGwh3i2g1b44u11S3
         aS9AMKBGVaJ00Wm8xwNGkuKOeLHnEReAykQaW7ZnEicc4j6Xc3okxDCTVNgwu1SwHgqQ
         x2e6NWSR94sqbPWYdSejYPvHv5Dk+Xvu4R4YliqulMPZtrje//j9pXAP69yz+DO6raPm
         N9mYoiqm+rNLUnXpTLbnRj6mN6Tm/8kFZ9tIhxCFfKaOeDwcw6t3R2emi+gaNUf1Dskj
         ADGw==
X-Forwarded-Encrypted: i=1; AJvYcCU2AA3FNzE++PM+oqFdn72YtQ+Blo3Q6WNJPSH0tDf13gxI197LWbYnAaNXjRJPlHy3J3pVNyBqX1mM3cedlT2N@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd6hVGuDXgzrEkCJOG/BTIKSYLsYJE59vTgr5Gm47YhGAvQCqj
	L0S6kgumNNSWw90aP/p5+JuSHKLReExrcmYCyTtd7fQs2/9Dbs25lcBs
X-Gm-Gg: ASbGncuiX+uBe2+8zHA+E+0zhbyyRMU0JBNOvRKNFmpErDHd890fAU5Z+SYenqQU/Aj
	2xU3db8XE0XTr7cTZxZjcaya7NZ0jwEQLORLGAlzqel4UTsdmoop4xTRn7wTOB2J5mAXFxAHm0l
	sekfPS2hl+NG8eZC8bvy9BzMqvSg9npDg9ph8gGkt9Jtaq91HOAL8ORc73yB8dRAALjHW338tLD
	aGWd9Oux0VBqvvuOWoVlo+km4UZFwxtNCFKK1s8GSUGuS8GUwCmS6GQHKbIlyW22AWeY+Pfvvge
	gryFIHlNch2VfnN4yaTm5AZUr8l1Wwsf/XUhImjBD9rqxD1tKJSZd1dyTvFwjjsNvC6jokRbJo2
	xjaqQWpxMNlU8vn32fkuIpb2erTXLmtA3pP0wYQf+A3M2+zmsx9NpSBisIrBalAL7gzw/1XoGfy
	0wkRft3wp8vrhEI3S3Js6c2skWN9wB0qLBedXP24bunu4EhWXa9xZIaRH4ItB+oJzPXlBtBJwR4
	+7el/MQBtpSPYEUxiEuACQD
X-Google-Smtp-Source: AGHT+IFuVB+OPt8sF01Uh6d7xMc9CZaiz4OHSBYz4E7xn1OnH2Ffn63x7dRG/05JN4//aaaMjYq71A==
X-Received: by 2002:a17:902:d54d:b0:295:615d:f1d2 with SMTP id d9443c01a7336-29b6bf5deb5mr6487245ad.48.1763684649751;
        Thu, 20 Nov 2025 16:24:09 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (14.250.194.35.bc.googleusercontent.com. [35.194.250.14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75e4ca0casm3630383a12.10.2025.11.20.16.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 16:24:09 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: suzuki.poulose@arm.com
Cc: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	pratikp@codeaurora.org,
	mathieu.poirier@linaro.org,
	gregkh@linuxfoundation.org,
	jserv@ccns.ncku.edu.tw,
	marscheng@google.com,
	ericchancf@google.com,
	milesjiang@google.com,
	nickpan@google.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
Date: Fri, 21 Nov 2025 00:23:50 +0000
Message-ID: <20251121002350.1166758-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_162410_964560_45054A1D 
X-CRM114-Status: GOOD (  19.12  )
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

The cntr_val_show() function is meant to display the values of all
available counters. However, the sprintf() call inside the loop was
always writing to the beginning of the buffer, causing the output of
previous iterations to be overwritten. As a result, only the value of
the last counter was actually returned to the user.

Fix this by using the return value of sprintf() to calculate the
correct offset into the buffer for the next write, ensuring that all
counter values are appended sequentially.

Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Build tested only. I do not have the hardware to run the etm3x driver,
so I would be grateful if someone could verify this on actual hardware.

I noticed this issue while browsing the coresight code after attending
a technical talk on the subject. This code dates back to the initial
driver submission over 10 years ago, so I was surprised it hadn't been
caught earlier. Although I cannot perform runtime testing, the logic
error seems obvious to me, so I still decided to submit this patch.

 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 762109307b86..312033e74b7a 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -725,7 +725,7 @@ static ssize_t cntr_val_show(struct device *dev,
 	if (!coresight_get_mode(drvdata->csdev)) {
 		spin_lock(&drvdata->spinlock);
 		for (i = 0; i < drvdata->nr_cntr; i++)
-			ret += sprintf(buf, "counter %d: %x\n",
+			ret += sprintf(buf + ret, "counter %d: %x\n",
 				       i, config->cntr_val[i]);
 		spin_unlock(&drvdata->spinlock);
 		return ret;
@@ -733,7 +733,7 @@ static ssize_t cntr_val_show(struct device *dev,
 
 	for (i = 0; i < drvdata->nr_cntr; i++) {
 		val = etm_readl(drvdata, ETMCNTVRn(i));
-		ret += sprintf(buf, "counter %d: %x\n", i, val);
+		ret += sprintf(buf + ret, "counter %d: %x\n", i, val);
 	}
 
 	return ret;
-- 
2.52.0.rc2.455.g230fcf2819-goog


