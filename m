Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5A8D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 09:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+rjHsH8Bx/+IHKZLfcoDmpiz05m3E/CkK2Bfpjlnb+o=; b=PcigtAlnR6gCtYXQiKzM99w/WY
	f1/uli3lNxVAwoOA5f89wuUY2DZXlr3nzKjyqEmfiYPuvRL5KSMbQKghPycPKRpj/kiGTi0rYTn5g
	EsjwuZoNErtE5B+kaRhI5iVofs/Qq808WtKMY930ZGBCG1ndDBlipDLsqesADO3DYMRSmbOs4WbZ/
	ZkVAMnCf/4S9QA1RS3jtyDQYbCX1xIjNscajiZHDTK6dUxED+ydH12oc3nSkRz1v7WqRvQmXKgePW
	Rb1EhY0kav+andL4Baj0tuq+rzkjxdsBq1tKG2C9Is/WwebwVdEXD73frnENjjpasHhMgaOLsBc7/
	ef03i2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0aM-00000003F67-1DDU;
	Mon, 01 Dec 2025 09:52:46 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0aJ-00000003F5P-1zsa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 09:52:44 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7baf61be569so4690145b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 01:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764582762; x=1765187562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+rjHsH8Bx/+IHKZLfcoDmpiz05m3E/CkK2Bfpjlnb+o=;
        b=fIO7d1y2cL2+IZqK3tJgNy5YQjVwEmivf+OTwI/C25tGwmF622IcuFN0ZmUOWmfdmc
         IWSy/zfqdHdmAki3+rCr9BxhmY9r9WoxR6xVPnbdifePkohJibnWEWdD/+2UcEniyvhl
         OswBpnsiQ5RwMiMjwrYfmcKxUdOOIv+0OKx7Y87KL46CW3UivHFOSqwbMp/Cq1Y3G184
         QD6QWmHa9Ep11cCU9TQFNcgfh70rYQYp+wR7ldJeEeiAO8WpVb1EDPSRJxBZ+TVzHtGB
         uVuaAJ8wKcsYUYz7m795G8z1HIOy3xeicfVfrdIfp3qbEoPRi55JnhRSWV/iWj5qj9Lz
         Wy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764582762; x=1765187562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rjHsH8Bx/+IHKZLfcoDmpiz05m3E/CkK2Bfpjlnb+o=;
        b=N44pXzIUIqa+UCPbvZJbe91Ceq0xMISNta/T3+rSxvDC5GAw9dMB21skzU//QYgLvU
         aSLh6yVXUhAWm6S9py//rxnAfZ3EVbRLiJVBbiRLz/74ptrxQml9TObbl9J6izOKcm/o
         UYp0ULbQ4YHXBJnShejg8k40TKV//6EVPjcZiCl/KsbfmeM2S8tQfKKmoeXpDxb8o/lB
         7pdTSo7hpe5hOYtz3c3rygr5VNK3u1qvN4aXDD+IOYA/F90ieFW6iGhMAus7mxsAYRpH
         UEbbfMQ6L2njwsZJ8IRekXAgav4XwUZsSIuY5tjnQa3JYunWNtYd2mO4leVBlY6FUSRF
         uI+g==
X-Forwarded-Encrypted: i=1; AJvYcCVdDPLJEDp383RyLkkdHciPJ/mfQM6qX1ees43W2CeZBdypdreF+VW8E6H5+NaoKHqe4NiL14nhgIeqHL65IKaU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhy7vG5rsHMR5OwGgipUU90JkOG44hLxj5mCnCVgUGvadRgIT1
	bnT8oXTWUu/dGriqGyUw1OiUvCCTwAVBPsnP8Zn4gGIULEsVzhX8UqB3
X-Gm-Gg: ASbGncv4Q+t1zGvLRBNlAWsRql74zVsAGH8AXNRMmto2XXWcmQeq6xiS5OJ2+vHCkLu
	Yu+A3n31i+i6H7HVB8VSMFi7mAz6Qx1cvyLXmjO9McZEPXH+GzYl8woFdnjtrYGFPHaVQohSCKX
	sUMbdQtJeiQ6GjwOunkhHa2XtkTaMdH6Msos9vvnJ3LRg0ktXEBT9vwkM2SXg2qFLirdYxdMek8
	P4ZoLEOE44h/DnX4XPn0ntQp97sD0fqn6c0Fw77z8a32GYNLGLSczDr/r7xmhFFAasiem5gMwK/
	YZ1ECIuLL9/U/wk8yjZ1x/ogoWU9LoX1QnhgbQ7p1QTaLI9e2CR3q4lEvoOv/udAVKsts1QAvoX
	paFcGJ7LVvXUTc2CGiBnZvO/F3F/nrVtr5d2nCrpnuUxZATXq8AbG8t9FuHIb1QgR/obpQS8fvr
	N3ldnkxsH1kpXhRgikoSckNJbD8+fClaVCcm4oGo5fdHEhsE8CQ+fdnuhiCl8A/eGbHuU85fgvN
	JBJi6+KUQtsU0cTpa+qAavC
X-Google-Smtp-Source: AGHT+IF3WOvTGIxt+bSrODAhW9gVIWO5Fy6ov3TQKRAk9K4oppyhq2XbWwPpQleVzVUFv59vmr2h9Q==
X-Received: by 2002:a05:6a20:734f:b0:35c:fd6d:b1f0 with SMTP id adf61e73a8af0-36150f25276mr44107506637.40.1764582762153;
        Mon, 01 Dec 2025 01:52:42 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (14.250.194.35.bc.googleusercontent.com. [35.194.250.14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm11776408a12.3.2025.12.01.01.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 01:52:41 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: suzuki.poulose@arm.com
Cc: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	gregkh@linuxfoundation.org,
	mathieu.poirier@linaro.org,
	leo.yan@arm.com,
	Al.Grant@arm.com,
	jserv@ccns.ncku.edu.tw,
	marscheng@google.com,
	ericchancf@google.com,
	milesjiang@google.com,
	nickpan@google.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2] coresight: etm3x: Fix cntr_val_show() to match cntr_val_store() behavior
Date: Mon,  1 Dec 2025 09:52:28 +0000
Message-ID: <20251201095228.1905489-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_015243_521424_F4E0B39B 
X-CRM114-Status: GOOD (  14.20  )
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

The cntr_val_show() function was intended to print the values of all
counters using a loop. However, due to a buffer overwrite issue with
sprintf(), it effectively only displayed the value of the last counter.

The companion function, cntr_val_store(), allows users to modify a
specific counter selected by 'cntr_idx'. To maintain consistency
between read and write operations and to align with the ETM4x driver
behavior, modify cntr_val_show() to report only the value of the
currently selected counter.

This change removes the loop and the "counter %d:" prefix, printing
only the hexadecimal value. It also adopts sysfs_emit() for standard
sysfs output formatting.

Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Build test only.

Changes in v2:
- Redesigned the fix to match cntr_val_store() logic (display only the
  currently selected counter) instead of attempting to list all
  counters.
- Removed the loop and the "counter %d:" prefix.
- Switched from sprintf() to sysfs_emit().
- Refactored control flow to use a single return point.

v1: https://lore.kernel.org/lkml/20251121002350.1166758-1-visitorckw@gmail.com/

 .../hwtracing/coresight/coresight-etm3x-sysfs.c   | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 762109307b86..a6a650331196 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -717,26 +717,19 @@ static DEVICE_ATTR_RW(cntr_rld_event);
 static ssize_t cntr_val_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
-	int i, ret = 0;
 	u32 val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
 
 	if (!coresight_get_mode(drvdata->csdev)) {
 		spin_lock(&drvdata->spinlock);
-		for (i = 0; i < drvdata->nr_cntr; i++)
-			ret += sprintf(buf, "counter %d: %x\n",
-				       i, config->cntr_val[i]);
+		val = config->cntr_val[config->cntr_idx];
 		spin_unlock(&drvdata->spinlock);
-		return ret;
-	}
-
-	for (i = 0; i < drvdata->nr_cntr; i++) {
-		val = etm_readl(drvdata, ETMCNTVRn(i));
-		ret += sprintf(buf, "counter %d: %x\n", i, val);
+	} else {
+		val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));
 	}
 
-	return ret;
+	return sysfs_emit(buf, "%x\n", val);
 }
 
 static ssize_t cntr_val_store(struct device *dev,
-- 
2.52.0.487.g5c8c507ade-goog


