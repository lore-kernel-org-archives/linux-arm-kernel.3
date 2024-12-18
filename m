Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7052E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 23:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7tFLc+iUu654xr+ZEInB5+ibN3E0pOW4hXHpK7c/ao=; b=EPihJqcEUlKXS9Io4Q7VjooL0f
	g/Q8sh1lX4aJQMYnZO5X1xj10PzJRmWgJMu6oC9vtU9xQVCBppsmNrS7NxiM/EaCFKk+pO6UxQ0Ot
	NKeAijFDL45FZTwwP8mzn7bNIwiRUqXf+9X4PBSYlpkOXE7p7GRy96pBIV6LXL0cFEcVJR68kzrAI
	4S3L9f2NVcOqk2kqiXB754b+gcSTX794gSzEdcmXSYXuGeDCvLLXJ5jJjSf0lw9GY5VIQzzlOCNNq
	bjzWbz3w5obhmy0VTSeHGuLoVCy9FLGZ4pwPcIYH0bA3HodNiy3OxQ1NZhCZCFv+zxPJKa17EHV+A
	OHz/+tVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO34r-00000000HRU-14zi;
	Wed, 18 Dec 2024 23:03:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO32j-00000000HAU-1Qzs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 23:01:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436281c8a38so1154615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 15:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734562883; x=1735167683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7tFLc+iUu654xr+ZEInB5+ibN3E0pOW4hXHpK7c/ao=;
        b=C5ujgOgRU1VtDRjNC2lYbRWrZrXrpwvw89PO5OSxnI2LexuKZ0yiTHUAL4BGHuS12A
         P+0gjRbVfvqv/Ph6j6gnOIwVmQQVPfghmz+HinjpbpMQMuH6dV+AjPx1I9GOzx2xI4h2
         3NdtyWFn//NL14dFSONfzCdECINhNkxYqEUTkR9I0lq4eHly5ErENEvMNdKo5Oub3J41
         BmBE9ZAtdUhjYDBmmvRANs9f1WKEj89D1c8ZAt+I9b8HYpwK+INFvZdtU1U0fG+TLU8A
         SHc0eomdeA4ITP6lof6lcN2c6mK2iesisQxrVmqLG7nutIMQ7Jlr8pgSClMVuO5jR0QZ
         4TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734562883; x=1735167683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7tFLc+iUu654xr+ZEInB5+ibN3E0pOW4hXHpK7c/ao=;
        b=TUODMpb0A3i2WpM+mK6wYZ/i2BZiU9a0k5KyObrrdQBWmua89wLNFlYG/CR+pfzNqj
         EynHj64XVxZ1Ow5RfgMOVuN4KovLyhWE7WqFxqZYrG5cyEPn/CFtZF67vXl5CvsfpLJu
         DyrTEIH1wJRJ6VfiaPUAaGt8uZoLRgpIj+27y7NGlK9RARXnckuPhw85HL4Bns4T8BON
         A3fmPhe+qcyoRUV+BK/knFUjNdV0y/C1mXAwVCRuooOUDIRDPYk+i1as38grLJFovu6l
         OWAkfbYBsLGaX0bfSns6Q3QF5C6wW8MNmCwmMsT8a4eRCoVzjhoWQaYXjv6syjbrv+9C
         8Z0A==
X-Forwarded-Encrypted: i=1; AJvYcCVkSs6bGS9YiZ5NY2F7GxGjrwYP+BWC/WYM2WhMp5JTyRjeXS3qlGcMrdwYBqnw9Jv586RHdBhKmN4LoH2WD4CC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyw43oI9SDMSgwWIEdLmzOq+wt1/RxkD14SdtIeylNaNIhrOwE
	3ybb7NzDP1EwH/unpDQgXVxp0qK7FEpghbtHVk2q9oA1aTv1xRIlZmWIUmhZ4EM=
X-Gm-Gg: ASbGnctdSQE6dQdRf6+loEmLddmCm5W8nGLMH2L/QRrQGrqGdsoDQl+wh5+X8kjql85
	AMDxvHvlZEOp85sVg5pJHCPcqgaoU5n7YfcmGMnmP8Cyaem83TxULHnajUjEc7HFvfrNpSrnuJW
	KxXAXoWG/V2II5oyRqNpJcvn0459cvqUkNPMcvpaWngGMH0jNud+baKgpVg8U5uAazRhfXaYSu4
	PAdKoDxT97yzlTRwA3TPxDtprFEGCtuxn26ssuVK6lRkaRT0iWWab8CbxQ=
X-Google-Smtp-Source: AGHT+IGBekGqRLKeTUOgL5pkMylABNCwxn1vFt/8TScAu/KTnZwD5za7lopJ4KSP5x7Qv1fpeFw1Jg==
X-Received: by 2002:a05:6000:4a15:b0:385:df44:12cb with SMTP id ffacd0b85a97d-388e4c93e55mr4969683f8f.0.1734562882670;
        Wed, 18 Dec 2024 15:01:22 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:7895:12a9:ae3b:17a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b190f3sm33291835e9.32.2024.12.18.15.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:01:22 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org
Cc: james.clark@linaro.org,
	mike.leach@linaro.org,
	suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com
Subject: [PATCH v3 1/3] coresight: Update timeout functions to allow return of test register value
Date: Wed, 18 Dec 2024 23:01:16 +0000
Message-Id: <20241218230118.999859-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218230118.999859-1-mike.leach@linaro.org>
References: <20241218230118.999859-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_150125_444109_535DDE3A 
X-CRM114-Status: GOOD (  21.62  )
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

Current coresight_timeout function spins on a bit on a test register,
till bit value achieved or timeout hit.

Add another function to return the full value of the register being
tested.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 50 +++++++++++++++-----
 include/linux/coresight.h                    |  2 +
 2 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 0a9380350fb5..595f7ec0782f 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1092,32 +1092,37 @@ static void coresight_remove_conns(struct coresight_device *csdev)
 }
 
 /**
- * coresight_timeout - loop until a bit has changed to a specific register
- *			state.
+ * coresight_timeout_retval - loop until a bit has changed to a specific register
+ *			      state. Optionally return final register value
  * @csa: coresight device access for the device
  * @offset: Offset of the register from the base of the device.
  * @position: the position of the bit of interest.
  * @value: the value the bit should have.
+ * @rval: if not NULL, return the last read value of the register being tested.
  *
  * Return: 0 as soon as the bit has taken the desired state or -EAGAIN if
  * TIMEOUT_US has elapsed, which ever happens first.
  */
-int coresight_timeout(struct csdev_access *csa, u32 offset,
-		      int position, int value)
+int coresight_timeout_retval(struct csdev_access *csa, u32 offset,
+			     int position, int value, u32 *rval)
 {
-	int i;
-	u32 val;
+	int i, rc = -EAGAIN;
+	u32 val = 0;
 
 	for (i = TIMEOUT_US; i > 0; i--) {
 		val = csdev_access_read32(csa, offset);
 		/* waiting on the bit to go from 0 to 1 */
 		if (value) {
-			if (val & BIT(position))
-				return 0;
+			if (val & BIT(position)) {
+				rc = 0;
+				goto return_rval;
+			}
 		/* waiting on the bit to go from 1 to 0 */
 		} else {
-			if (!(val & BIT(position)))
-				return 0;
+			if (!(val & BIT(position))) {
+				rc = 0;
+				goto return_rval;
+			}
 		}
 
 		/*
@@ -1129,7 +1134,30 @@ int coresight_timeout(struct csdev_access *csa, u32 offset,
 			udelay(1);
 	}
 
-	return -EAGAIN;
+return_rval:
+	/* return the register value used when terminating the test */
+	if (rval)
+		*rval = val;
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(coresight_timeout_retval);
+
+/**
+ * coresight_timeout - loop until a bit has changed to a specific register
+ *		       state
+ * @csa: coresight device access for the device
+ * @offset: Offset of the register from the base of the device.
+ * @position: the position of the bit of interest.
+ * @value: the value the bit should have.
+ *
+ * Return: 0 as soon as the bit has taken the desired state or -EAGAIN if
+ * TIMEOUT_US has elapsed, which ever happens first.
+ */
+int coresight_timeout(struct csdev_access *csa, u32 offset,
+		      int position, int value)
+{
+	return coresight_timeout_retval(csa, offset, position, value, NULL);
 }
 EXPORT_SYMBOL_GPL(coresight_timeout);
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 17276965ff1d..cb3592d2803c 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -649,6 +649,8 @@ extern int coresight_enable_sysfs(struct coresight_device *csdev);
 extern void coresight_disable_sysfs(struct coresight_device *csdev);
 extern int coresight_timeout(struct csdev_access *csa, u32 offset,
 			     int position, int value);
+extern int coresight_timeout_retval(struct csdev_access *csa, u32 offset,
+				    int position, int value, u32 *rval);
 
 extern int coresight_claim_device(struct coresight_device *csdev);
 extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
-- 
2.25.1


