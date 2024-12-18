Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C84E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 23:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqYUm1i7e1fblFqY9jJKn51mYoOB0b0xVEyAilyqTvk=; b=S8Bk53eDQnzgA1EFSJxQEvKygU
	X5fMOib1H3RAdKw3qzIf7jSBxs8Y6OVZz6SNJvl+u370n37QJ/ixSHGGmH1whNtFLpmUnOdczD3Pc
	yTIplVVoZEMLzLH9CiovLZtsrONMTttATuICIxxr/JiNrcVKJN8b7CP62KAavzvX8LGFdS9YAyQRP
	HiMzwkWa83SQfkcOvXGRHBkcOcKfM0X0ct3gzCBjR3tLC9i2t1XbAQTnUb9xVsj9wbAy04k5mbCxN
	SdiNxB2LRg7Zx3WGhlDbp94TVq9decLH5A+iam19QKvkulskY6LPRNExFAzKOtlBwC8y0u4VzKRIy
	iciKUqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO36z-00000000Hfq-2TbD;
	Wed, 18 Dec 2024 23:05:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO32l-00000000HBJ-0UwX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 23:01:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so1715605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 15:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734562886; x=1735167686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqYUm1i7e1fblFqY9jJKn51mYoOB0b0xVEyAilyqTvk=;
        b=ebtFbyVwRFr9nms/73H0G3iyhHGleY36NCQWwPmgcb/Yl2RM83EaZ2//cWXUIA9DHT
         1k8/Zhro3Tz7k4oJ+R75d2uC4RGINzVKCfdLPGLOFMNcgLnt36j0nsMMFGf4qRvXcfCa
         uMewu6bk+nMLp98u9vUxw474WbDUJgWPhBCF/SHClx5jAi/BMAM6T80TbLwWS+1AP3u3
         qvlCMLR5TbcY49LcOITFKhN/HHiH4gXEaWJ+dNua3l8CNcC9nnooT/XaB4NJN0L1gyrg
         +Edpqji3zQ8SD3HwR7TC4Eg8NugAFXrfmYm0o0xVS+meaQtpGWIfVG9AB86ouTewOeyE
         a4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734562886; x=1735167686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqYUm1i7e1fblFqY9jJKn51mYoOB0b0xVEyAilyqTvk=;
        b=AC1WHrxGsfukJHdxgOvqrKiIec4BMZBUdFDieCL0rguVtLsirBaw6uNNYcEryJUunn
         s/ESOuECrKP9l5Wv1BpZGvYAX5mndAeLdEXydCBJWzS0vToHj3VtERGM9QxQqcGjuEFK
         OjLj5g/UoGoJCnR41GYOTqlXnfcMLj1RrAUYHeKF4fMBp1z6y8mDJl50cmlWmtID+WsY
         u332atUg4Ol18eBGaXV2lUcFPM5JlSksgX8laRYNZjAFu6icAYut5anEK7DzE85TXVdE
         mvJ2Yxi5FF4E4tuencJqZgIkE7aymxDab67jCN0PR8zoeGNBreL+djmSFupFtGQZr0SW
         z7bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm3MmEs0TA3Pn14X/uXTj+hL9yn20KjA4CJJd2kB7sgz8CwcanX/jXBjV/bYBWg1Mq/t+QSlws9MCesIZhAMcw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+cQAOPOpsKUF4+0Wfz+OEZm69+cO6JGf8AILelxoecNJw7AbD
	HkrOJkQtO/tZ9FXPc+Btsq4bY9FL1tVhR3tY9h3wzXA1JMX/ZQIuRiVMCSO9xa8=
X-Gm-Gg: ASbGncuYXB8Z4ZzR8Nz0ik9HwucR48u1+fhWvi+1dcfT0YiskiSculOosMlc3aBERt7
	FOlzB6rdt6nW6g3fzD/lGCSgYJkAeha+qVff6svgLNxzsOjuxHD8w2SSLoNV1H0LuAFbWzEOFs7
	ok4xrupsQc3R+z+HnEW+cmVOm4n+pmDKEXhhFLK25Nls0pai2rKd3tFjqZUDFaZCurZpINntaTe
	raNxEn7l7qWrpshROg1l7NazH5UAWetJ7OqzsINC2x5aEhUvL+hU5nA7kU=
X-Google-Smtp-Source: AGHT+IH1H5gzkXGiuEoDmhNHJ2hwnBCSMabu2fmzR+8En/9OikahIreXFTalAusBqUZe4sYSxVeucA==
X-Received: by 2002:a05:600c:4fd1:b0:434:f819:251a with SMTP id 5b1f17b1804b1-4365535b124mr42404355e9.9.1734562885805;
        Wed, 18 Dec 2024 15:01:25 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:7895:12a9:ae3b:17a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b190f3sm33291835e9.32.2024.12.18.15.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:01:25 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org
Cc: james.clark@linaro.org,
	mike.leach@linaro.org,
	suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com
Subject: [PATCH v3 3/3] coresight: etf: etr: Update logging around flush_and_stop() errors
Date: Wed, 18 Dec 2024 23:01:18 +0000
Message-Id: <20241218230118.999859-4-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218230118.999859-1-mike.leach@linaro.org>
References: <20241218230118.999859-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_150127_159537_EF613B37 
X-CRM114-Status: GOOD (  11.16  )
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

Insert additional context around tmc_flush_and_stop() errors.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 12 +++++++++---
 drivers/hwtracing/coresight/coresight-tmc-etr.c |  8 ++++++--
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d4f641cd9de6..62b4b685c1a1 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -84,7 +84,9 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
 {
 	CS_UNLOCK(drvdata->base);
 
-	tmc_flush_and_stop(drvdata);
+	if (tmc_flush_and_stop(drvdata))
+		dev_err(&drvdata->csdev->dev,
+			"Flush and stop error disabling ETB\n");
 	/*
 	 * When operating in sysFS mode the content of the buffer needs to be
 	 * read before the TMC is disabled.
@@ -146,7 +148,9 @@ static void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
 
 	CS_UNLOCK(drvdata->base);
 
-	tmc_flush_and_stop(drvdata);
+	if (tmc_flush_and_stop(drvdata))
+		dev_err(&drvdata->csdev->dev,
+			"Flush and stop error disabling ETF\n");
 	tmc_disable_hw(drvdata);
 	coresight_disclaim_device_unlocked(csdev);
 	CS_LOCK(drvdata->base);
@@ -496,7 +500,9 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
 
 	CS_UNLOCK(drvdata->base);
 
-	tmc_flush_and_stop(drvdata);
+	if (tmc_flush_and_stop(drvdata))
+		dev_err(&drvdata->csdev->dev,
+			"Flush and stop error updating perf buffer\n");
 
 	read_ptr = tmc_read_rrp(drvdata);
 	write_ptr = tmc_read_rwp(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index a48bb85d0e7f..122a067d1bb8 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1139,7 +1139,9 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	CS_UNLOCK(drvdata->base);
 
-	tmc_flush_and_stop(drvdata);
+	if (tmc_flush_and_stop(drvdata))
+		dev_err(&drvdata->csdev->dev,
+			"Flush and stop error disabling ETR\n");
 	/*
 	 * When operating in sysFS mode the content of the buffer needs to be
 	 * read before the TMC is disabled.
@@ -1578,7 +1580,9 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 
 	CS_UNLOCK(drvdata->base);
 
-	tmc_flush_and_stop(drvdata);
+	if (tmc_flush_and_stop(drvdata))
+		dev_err(&csdev->dev,
+			"Flush and Stop error updating perf buffer\n");
 	tmc_sync_etr_buf(drvdata);
 
 	CS_LOCK(drvdata->base);
-- 
2.25.1


