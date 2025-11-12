Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8997CCD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QaaKNFNqowM2WQP3QSzkztxHtPDe8RFUGO77+dvhWo=; b=Ez+eX+stG8KS4Hwnjv1JnLUadR
	Vn/Smrj1xZdA3IRajigsTsUGOU/bSLR/m24uMxy9tAkgStp6qyx2ejmSS3zd+VqAQ4wmKgDQ9j4sN
	hCetqPdmnaT4xLkdedls0uLB/3jj1RCEnSaiQiLauErxdGQMQwgFN1w7FoDS35LZ1WCaIjp3CKTQo
	I9KnHOBLwumYtjtq1CuZFQmLJr6z458E08KYh6IVOd09iwiiplftNvIVvFdFXhTfENER7kYYB1Y8f
	JyS6qbqeTbNn+fILMgh3ATvPy69P6Mh4MfeE2hAnthapxBgbEM00VwJG0Lhym1+OW202Pyhn/+hI2
	+k6cy8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgI-000000092Qq-2RWr;
	Wed, 12 Nov 2025 15:22:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCg8-000000092Hz-3jAw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:22:38 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-429c7869704so760322f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 07:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960955; x=1763565755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QaaKNFNqowM2WQP3QSzkztxHtPDe8RFUGO77+dvhWo=;
        b=ZAftxIgH1f2qrBN9S2sRe+mA4jgL4UMbedW8E2YrB92c0Ndxt3+EBOQHn/E3b/U45g
         nCVTwlunQ9rW+e5p3rlcBq8ftTwrFDH1VA+czVddvCluj/nxw0rlxbbs5c0WBZxT5r+9
         K5qj9biPlyaVA7zDW4nqXS8e7nI5QT9zFaoFrDfUNZvCHnZ0gd2srJFkWIwEKhVIgY6H
         V4+4HgNXocIu3dfBHeUxcs+/3jL4W/eBvG/k6H1F30H+8wGdgiWOISGPBzLFaCy3l/fM
         7f74/otTJZbzQtkz7RvElknltkRN+GMESibuUacY9BzOsjMu5010xFoVvr3F/aV5GNTt
         o38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960955; x=1763565755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4QaaKNFNqowM2WQP3QSzkztxHtPDe8RFUGO77+dvhWo=;
        b=SUc1IONBw5AFWl1Prm+2FHZW+3XoYuemW/OTdIjWpfx4GzKIqX+H5UvYL4XgQdKVBY
         3tmLavcoKNS06NjnNnF5/8XLF5LZNxyFxCjmYHUAlPaYVUtLxshoY0C/WwkGjSOXZjtA
         KRsWsn9vO8c7w9pKm1NkcYhtTJ6aoxSUMxZ10soDFji8dM5z5YSEXLaUDSVl9gPZYLpu
         /6WRQINN9Ik7acoBM8oIupwKO8AMA5v73+/Td4GTg/0wg8oK1HL7xAAfu7OElxNp3+IR
         3mPoKd/NAI0goKKh06fJrR/AaJZ6MmhOCMRFDd/hlYRx6V56Yinsu08p3SwjvykCfWkj
         z/1A==
X-Forwarded-Encrypted: i=1; AJvYcCXvEoCv11DX3VSu90HX3mf/UHBA1I5WNZmW0uHKcmG1Ndg+sScGHGjBv9w7TuhDgXpevF2llcArm0wG7W7My9/+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm2cfrLfpDLMYgOXfw8UY16dbOPS5vSiNSJZVz47dZVYpjPtfe
	HhRAWRGCC46px4TsReL8MAxd+3eCowwqNyP3K2WIt5yYHkpmlKf2eO5oNkcZ1jDAimg=
X-Gm-Gg: ASbGncseSJ1+cH2RmgYyaj2cv0K9nyS07Hga0mCthtvchxhLkqXMdAZgClSn48Bn2Ci
	BT+/jdcEtstZNY/IMYgL2/cOB4C92nvSblV/DyO+Q101R8rKcCdxSsfm5ipTtM2Ox3sXFytVjRN
	Az53niEGLe0Bn1dErckZ4/xv0iaAFKmIPc0tvvfPpNzk4GCw9A+9xnCSDyGg4Hodhqapw9enwz8
	X8IkhN5H0M510pLSbSAm90l9aqvONi3BEpcynDdybd/Es+Ix8C8LtoMEgwdu50nduxT2uwRiOyV
	8aEykmmNKTDVc2IekkLbL/742fwbHvWrdCktRt0EmBiIJt7j0XP9NbzQr8znypPBoNtgwu0UHaY
	hNPG6XmJpMJbQ+Eh0R4RXXLKs3hd+ufYjtbptZs8vuThr1FbrqhkxoEdt51perrgSlYjdjX2Ucm
	IPvOUqoFO5TQ==
X-Google-Smtp-Source: AGHT+IFw8jUIYvhHHQaSc4qHGp9oC+g6GYxlDDWV26ZjuQvhCnuoCCgNV1aDlJVXL+R28ybNJLrR3w==
X-Received: by 2002:a05:6000:1786:b0:42b:3ccc:91ec with SMTP id ffacd0b85a97d-42b4bb9fb98mr2774010f8f.22.1762960955263;
        Wed, 12 Nov 2025 07:22:35 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:34 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:13 +0000
Subject: [PATCH v4 07/13] coresight: Don't reject unrecognized ETMv3 format
 attributes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-7-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_072236_952610_D5E1A070 
X-CRM114-Status: GOOD (  11.84  )
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

config isn't the only field, there are also config1, config2, etc.
Rejecting unrecognized attributes is therefore inconsistent as it wasn't
done for all fields. It was only necessary when we were directly
programming attr->config into ETMCR and didn't hide the unsupported
fields, but now it's not needed so remove it.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 4511fc2f8d72..584d653eda81 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -333,13 +333,6 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (config->mode)
 		etm_config_trace_mode(config);
 
-	/*
-	 * At this time only cycle accurate, return stack  and timestamp
-	 * options are available.
-	 */
-	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
-		return -EINVAL;
-
 	config->ctrl = 0;
 
 	if (ATTR_CFG_GET_FLD(attr, cycacc))

-- 
2.34.1


