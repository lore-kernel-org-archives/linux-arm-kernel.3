Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60207E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15AaAK2+TNf0pjNDy/UAqLLtCRlZm3/kpGALTDknfLk=; b=ItoToSXX4YKt2ocZEJJqGNCBeA
	nrS0e6DfxBifM79jumu8lrt+l53J7CE62C3HHLDxmr8HV9OwYWrdRCEPlssToV5CGR6MEeK4gYrwG
	Ro7czyaFlEdsymGWVSOc2TeQM7GHz8o9bGE5eqN5AEnRj1qEOytMijwBFeYk+pbWmDBiLBOIIWrx1
	xrs6Y86OalY/M5mPIMHNXuSDzd6wC1Q9eLq65vs1H9m1VC+jWU7fShcRLpp43ejUgm+qFsDVz1e8Z
	lYGor3ag8ydMg9ddchtNJXa6sqFU4W2JgJ6bz/VrAaav/UVqN6Ix6UzBjY4729eJ2PpFZvlcfc9R7
	NOzokE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM711-000000049kp-0hH2;
	Fri, 13 Dec 2024 14:51:39 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6ys-000000049CE-1j8c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 14:49:27 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-385d7f19f20so892823f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 06:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734101365; x=1734706165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15AaAK2+TNf0pjNDy/UAqLLtCRlZm3/kpGALTDknfLk=;
        b=aMjBUzRrSN52aAHChVJBhrYi+qBZ8u+PMc9WL2g8FUXwjvXpAFT0U00vZbwoziJ+56
         Erp5/5WZ6QHdqP4v1TtWYgkundm/r1PmYtgDlPy3x0XcrqF+s7rp/4EtzG0ugkshncVb
         JKcuE+/oHnSnk60vPaXCY7TD1sTgu+hcvLsy8NdytaImXY+BKWymO8CnAfR6P9WMkJdI
         buCFFTOvqg9DVl7DhlSaB4b2W2kmfwN9Njc493P26EJehdTZ/JIKrg3YMvkFSyuLmIlv
         IsjFzyPmJUAQuhHI/USW2D9ThyY2nUFdBF6K9RQTkdnUrQi03dkXdac8MXjMrdrAwmVP
         GSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101365; x=1734706165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15AaAK2+TNf0pjNDy/UAqLLtCRlZm3/kpGALTDknfLk=;
        b=tzSSbZ7LwH+6GI3M12sq3R3qtzDsd1/4rbE0bfsbqQreEIBUWP4WUu+WgPY+tcrRoD
         S6aoMuSjGtXJUSNtp5/xx7ZJZnD32W3XIr2gQ4KlUe/hNAg8OTqtuK5KnlihRRMZ057+
         f2jIYeAK1qwTb5BocZIkju2/CBXdNIjBD6Hrd40fEtRlQKAAHJjkSDjQI40T/Vw+t+xx
         AzZ+Frllis646uzhY/aV1CuNv3aN2DydkffX3oSCcI70fnXR2POIXoQ3Eq7nwiGZbrsz
         GOcSGOMicRtVe1IFMsOjg6ZFSApVq96Jz8AtC7r+XBATWCIu+9WJ2lcQE7AnylsC18OK
         Zk5w==
X-Forwarded-Encrypted: i=1; AJvYcCV0/wTJvWVWFgD+rVE9d6FJLtvd+rzj4Ca3WWduIDKqA/EAjK2QMzMv3U2PDy4yDf0ANHetLDTjzwklh6Az2KDO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc4xfTqSsHZcuaTAUmfCO8qhOVwTBMtNFMveOllqdDStCVxy6B
	Ry9CedynEoegWjGVOivhSOaCvJPDhRHStzOEvLUV8LKPLU0pTLTOXB7aL+xJqfk=
X-Gm-Gg: ASbGncuqG3LINpu3MMNbqIvNs3qc3SWPjG4n1QmhgzWdbRL4sfvqzQTG7NQG7nOEYV4
	vqsfQq5oeSfUyphrOlrzh1/LsnA6h0WSdnBOepGXzsJsFvplSpzBUqFhCVWM0clOsd8NiwgE/Gr
	lo7lFN0LQciphGUJHEjQH7FEkThO6sKaj2U35VAWHlYyVSps2y2obk2nnFF/1wgYCwiJyiLw/G5
	bJ6PEDMLcaw695KeEN1xqYw1boybnYIaGG/K3I5dDhnJ37RjLjuq6CmKA==
X-Google-Smtp-Source: AGHT+IHO0M2mkaBgTv2bRXcbzSWDj4N1+DMABwuK3YzAtH8N7NuvAFA9fIE961ZHfmLSmGa1Mu+Zcg==
X-Received: by 2002:a05:6000:2ad:b0:385:df6b:7ef6 with SMTP id ffacd0b85a97d-3888e0be442mr1907627f8f.51.1734101364916;
        Fri, 13 Dec 2024 06:49:24 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:dd7a:c2d:2b46:b1a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c50b7sm7196295f8f.57.2024.12.13.06.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:49:24 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org
Cc: james.clark@linaro.org,
	mike.leach@linaro.org,
	suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com
Subject: [PATCH v2 1/3] coresight: Update timeout functions to allow return of test register value
Date: Fri, 13 Dec 2024 14:49:17 +0000
Message-Id: <20241213144919.110642-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241213144919.110642-1-mike.leach@linaro.org>
References: <20241213144919.110642-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_064926_447280_C23D959F 
X-CRM114-Status: GOOD (  19.80  )
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
index ea38ecf26fcb..feb1a1db355f 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1017,32 +1017,37 @@ static void coresight_remove_conns(struct coresight_device *csdev)
 }
 
 /**
- * coresight_timeout - loop until a bit has changed to a specific register
- *			state.
+ * coresight_timeout_retval - loop until a bit has changed to a specific register
+ *			      state. Return final register value
  * @csa: coresight device access for the device
  * @offset: Offset of the register from the base of the device.
  * @position: the position of the bit of interest.
  * @value: the value the bit should have.
+ * @rval:  the last read value of the register being tested.
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
@@ -1054,7 +1059,30 @@ int coresight_timeout(struct csdev_access *csa, u32 offset,
 			udelay(1);
 	}
 
-	return -EAGAIN;
+return_rval:
+	*rval = val;
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
+	u32 rval = 0;
+
+	return coresight_timeout_retval(csa, offset, position, value, &rval);
 }
 EXPORT_SYMBOL_GPL(coresight_timeout);
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 055ce5cd5c44..29cb71e82b0b 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -639,6 +639,8 @@ extern int coresight_enable_sysfs(struct coresight_device *csdev);
 extern void coresight_disable_sysfs(struct coresight_device *csdev);
 extern int coresight_timeout(struct csdev_access *csa, u32 offset,
 			     int position, int value);
+extern int coresight_timeout_retval(struct csdev_access *csa, u32 offset,
+				    int position, int value, u32 *rval);
 
 extern int coresight_claim_device(struct coresight_device *csdev);
 extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
-- 
2.25.1


