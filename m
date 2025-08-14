Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A20BCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Usjf2Lwxzvbim7S5kgmgOqxfjpVorryscczoj/caPjU=; b=M5HFj8G2M21T+j
	zgBve5fBjyc6OztfykuQ/vWrspquPnnmzI2YnlZEUEE6xBrMf9r9txMYhLbi2DT+WrW5ZZgswJOnf
	pdHFVcq4SNz5ocaxz2eNO27bQlO+9wc1RUPZGpaMBDJJhLmiYKUOKWObVfTMB9PVIELGsNRGXsfBf
	yyXZJwH0gqW99DNwTtbnKS0nbdSSPXIiTN+M36UFAd73LF1DkNLhXMY/gq//PgkZ5C7HfNhPaEyTT
	/N7Rl1hTNROb4vxCim99ZK3eg+qgc02HdAZrf0d7u2de4r/s1uH6rK91P6tG9JNI9EbOLdwjlSc5i
	dSMFeVUG/k4WRKd+KZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXoJ-0000000Gzul-2WLw;
	Thu, 14 Aug 2025 13:16:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVYH-0000000Gf6x-43yC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:51:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45a1b0cd668so3775255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168680; x=1755773480; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Usjf2Lwxzvbim7S5kgmgOqxfjpVorryscczoj/caPjU=;
        b=Mh0/uEbsYt8xlck3FOM7UoVYIh1I9aYA7pDLy0730LYTNsNrKnvHLTvAXIgQSzxzbH
         /EBOpUvlJ5yUlL49aG93WWl5KPdSaKhSZAMrdlnwvSPCkTvjIss3xHO4odBpQcPwOkuB
         jOsCn8mg7qV1OvY6eAa6hGkCUJ5r7yQbgCGXEwV7dYOdtfc2CxgSqd7sdEUMLI+yV4cf
         mnMSwcpkJh5Auy8wsOwkiyPGa0YOnij95zYxFwrtPS/pcsnf8jnnVyLb2QG2crwBlwd0
         +0ZKTgfxsFdb4bGYzYBRPB6VednbnY1nGqfJt0BzAg/mOaoMcW/6qPXF5FX3H6uu2rT+
         jcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168680; x=1755773480;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Usjf2Lwxzvbim7S5kgmgOqxfjpVorryscczoj/caPjU=;
        b=KMxWESNXOva5mUxz9ejFqn6wsGEbULeJKFVOc5PxrezEYhg0MFc/GuWFSPbFPJR4as
         dTgwmhHLg04Qsq4pzmeuScDREgCr3GTii1fTdsVMOmqsMP/sXl8SQz+eFh69YaigZuDy
         fzxA4b/s+EVeIE2XR3yrKhAbJ0at7ptE1801a7O6+ePccA/2utT8Z09mYMU18h4nyQ2F
         fGDDrQ3d5UO8zvgUu6EsnmrMqsC6A2FgiiQLTEadr9S45K5N7hKsIQKcjmlGZ546BnFX
         Sxq85SoS7PriGJeVW/hW/QdDCdKbnsCPL+w7nO0FJv28Uc99Pf9wyMH1o5uLXe3zaOHJ
         w0GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCVLb84xOAO1y1JH4I9MHkI7Q4ZMaHxGqnj8s9BVig36zsdpWDZP2VH4s2unrCkrMCieOQ5vUbECySzOnm931b@lists.infradead.org
X-Gm-Message-State: AOJu0YyWOEOvkm2FQrv1/tUQvD8sKIfsqg0EIA5ykiUyD3ZAGG/AMIwB
	EEgkFsBQPUxIt+6luANz6A7NiM2eFW/Htl4SJ0ODU9uV15aCfEqhIzR9rsPg8I/ZIRM=
X-Gm-Gg: ASbGncv9bg2rowJ2R87mw/BWrjLV68Kb06zxlfhtb2/RZFRff9GHowOERKSFj4Xd3dS
	EpmeU8lLit8Gz+/xAAhg3hYCcZzdGgFfPqIh5YHrgjhUOPl/+4tYCMufuHXq6br+SRo8AoIohyJ
	FPYnhk9JpF88oQI/QA7mOqgbY31bPgDtDJZf0tYdO336FhYYT6FH14q4beSTQOgDg57hA3ToWi/
	dHEdG8ePr6WDcW/60z++E5iwecWfCdcU5cMT+lLb1DQaFsn7UOZNi+G8c0hQgdYatQOG9TIHOUv
	Vb6uEL8n05vWg/9qpQI2nvaWHNnulejwtNqmnkTKRtYLd+RNABE9kAmCXAJdtD/r+H61LWrCrNv
	CSkZc1Bta2kPieXvIXHHnNuH/9eAOMu6EpuqwZHYR5Q==
X-Google-Smtp-Source: AGHT+IGi1J840nNnMEHt0PQ+bJMM7STyMRvyW+nAoUIIj5zhCJZ53xyxLHO0So7XafSfOfSk3XvbbA==
X-Received: by 2002:a05:600c:827:b0:459:e094:92cb with SMTP id 5b1f17b1804b1-45a1d7309camr9947535e9.12.1755168680077;
        Thu, 14 Aug 2025 03:51:20 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm14228345e9.1.2025.08.14.03.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:51:19 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/6] coresight: Add format attribute for setting the
 timestamp interval
Date: Thu, 14 Aug 2025 11:49:51 +0100
Message-Id: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+/nWgC/22Nyw6CMBBFf4XM2po+QIgr/8OwqGWAMdrqjCESw
 r9bcevynOSeu4AgEwociwUYJxJKMYPdFRBGHwdU1GUGq22la1uqq7+jqCBK5hh6xqeqg7VV7V2
 DnYO8ezD29N6a5zbzSPJKPG8Xk/naX60x5k9tMkqri9YmdAd0pS5PN4qe0z7xAO26rh/AyvQns
 wAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_035122_024187_C5B37017 
X-CRM114-Status: GOOD (  13.51  )
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

Do some cleanups then add a new format attribute to set the timestamp
interval for ETMv4 in Perf mode. The current interval is too high for
most use cases, and particularly on the FVP the number of timestamps
generated is excessive.

Although it would be good to make only SYNC timestamps the default and
have counter timestamps opt-in, this would be a breaking change. We
can always do that later, or disable counter timestamps from Perf.

This is added as an event format attribute, rather than a Coresight
config because it's something that the driver is already configuring
automatically in Perf mode with any unused counter, so it's not possible
to modify this with a config.

Applies to coresight/next

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v2:
- Only show the attribute for ETMv4 to improve usability and fix the
  arm32 build error. Wrapping everything in
  IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X) isn't ideal, but the -perf.c
  file is shared between ETMv3 and ETMv4, and there is already precedent
  for doing it this way.
- Link to v1: https://lore.kernel.org/r/20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org

---
James Clark (6):
      coresight: Change syncfreq to be a u8
      coresight: Fix holes in struct etmv4_config
      coresight: Repack struct etmv4_drvdata
      coresight: Refactor etm4_config_timestamp_event()
      coresight: Add format attribute for setting the timestamp interval
      coresight: docs: Document etm4x ts_interval

 Documentation/trace/coresight/coresight.rst        |  14 +++
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  13 ++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 110 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  86 ++++++++++------
 4 files changed, 151 insertions(+), 72 deletions(-)
---
base-commit: a80198ba650f50d266d7fc4a6c5262df9970f9f2
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>


