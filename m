Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B048BCCD182
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a2glQqIoDqidxCvkUg1dS2LmkAX1c7KXwOLpe1injDU=; b=u0vT377tcca5aZ
	5uNn234X/DtsrXV9ac3i7bOjMFrZZGpBRDX4X2eEzKU3iy0hZRtDcE/oMuUznZqa6Hsdd6mu57Mtr
	LqRqqZ2D56j+wU8R4wJfpmfEKTL/t2gvQFely73OuPqdcmbMqhYihQwsVi8X6s9jw4dPCK5u90Hz1
	CPHBTXvwMTKC8+fFhPH/hVE6pHovkKjQ9icMhKRWvNPNdxWPcT0iFwQHCuFKpYulyLLNNPfWEfp8M
	Qc0AMreVNY6zQG3ZIDxcU297H+sT3564g4uUdKdoPRNdfyW+87P/ikD8oUNALViPJLTj7ddvrAkpI
	VZFDg6bbslgGCt+L9FtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GG7-0000000ACoA-3pFm;
	Thu, 02 Oct 2025 10:09:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GG4-0000000ACmn-3S0K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:09:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so8283545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759399795; x=1760004595; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a2glQqIoDqidxCvkUg1dS2LmkAX1c7KXwOLpe1injDU=;
        b=TFzf5/ko24r9RypXvmPWPiYsk1Juub/y/muok7JOpNxfFoXe2wNTF+wRJqESc2sjem
         akcsg9lyuoxbXQ334SXdFVex7ICPbmH76fmoRnwD9i0byKycYoXmm6qNdFq7DXMKcry4
         9m/caYkEbLzITyrpUNluI6rtcAqgdarPUweAMKmcMxodc/U9u2AxdZF7vlzr9Mc/4Ne0
         XGLTm4Fq1moFjygW6Fal8A5Qw01BFNAor7dt+bvu1flsbYNokj5toj7ZD89SGgCxPvNh
         FJ68wClo9T1fjpL7Ykwffq6kRMrEodo8cpDoPRn2kBRCtzC0vJy2hjwximVKINt6h1BM
         DEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399795; x=1760004595;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2glQqIoDqidxCvkUg1dS2LmkAX1c7KXwOLpe1injDU=;
        b=L6/ZBpMEUiOsV7wPRQfj5ttMqZM7krknhD75iylH8iTR3asp9rL87qGD1z6Rl6wVYx
         pXgV7NeGPJjsTMiVSGuM0zZKhuLpQ/2NcxNaaF8SZihuj6tQ8JKLFvatzEjAk6vHRNyn
         TM2RexED3J8r3nkBdlXkMSe8ieD0v8TZlICPilsu5Mo/Lqn9j0eQvbRyn8gJkSI0SLMc
         FCn/eS0onQD1MJ/1dkx6IOBcXwzQEBgRrE6YcqY2fGRHBrzfaeshNHsXpZ8IaetWGlPI
         v0iwJEbgV7oJjZxeLEcUesuXc0OfvVsdISjlqzRADyzrfb6KCZrgDqosgltlg/LrF5DW
         9OkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe4Rn4rxroF2AZag2kpvQyhMCNIa3VLWat1Q76roXCWxKIO54z5bO4GhxP1onEOevUtpz415e0+Ivs3kEOEGwk@lists.infradead.org
X-Gm-Message-State: AOJu0YznQl9SXK+iXV+G9Wv1R8vHOXpo79wDePIZNVB7F8+L5QHQzjkX
	3FrKl9Qluo16nRDiQGcS0Y5+Mxm4UZE9J8670FiH709LmKD4BPxg7sE1FdrKKhNfadcIIzSP2n9
	Qk4BnsZo=
X-Gm-Gg: ASbGnctUTuSdA+RlbM+HdcQ1OVlFdchL7M1+wRWkAd6lvl9uQj/0j+XjdrC0P9qqGvk
	5AB+Efx4DSPqaA4YIg9t8pZJ2SJvKG6QtTTBApLq/oC4mToSnuC8LVCPqmTkoT/yhr9maXcNjqR
	p3wgBK549ISAVWh+cJd/gDVeP0arHk1xu6f82DZ87jI4hNabwbwaTQ/gyysK+rX/GA09ivIkj8m
	qvooEz1uOR9HblwfgeTX2XiZIZW34DOQR+jOY68F87mxoMMb9fno9/74eTYwkSK7durpT3a2uJe
	elaLMR6hoz4r7QuE2YRDolNuSKtT5rZek2G5n3wQsatm3lgsjnPwST390vU6AFzSSQW7J87m0am
	uvzQfWnL/9TZKa/RSDKufZ0ENEDNfPgSaL8649XO6seZds9OAkQUxxEddgUlH/EzMZEOwyRo=
X-Google-Smtp-Source: AGHT+IEH3w3OVVeZtpHd+VudJWMIn/QHbYxRQn1xSG2I6GioyRqjXQBLA6ig4WEqtopdkFxe9EMwgQ==
X-Received: by 2002:a05:600c:1d1c:b0:46e:2d8a:d1a1 with SMTP id 5b1f17b1804b1-46e61285e6cmr55580785e9.10.1759399794785;
        Thu, 02 Oct 2025 03:09:54 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab960sm3017289f8f.13.2025.10.02.03.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:09:54 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 0/5] coresight: Add format attribute for setting the
 timestamp interval
Date: Thu, 02 Oct 2025 11:09:28 +0100
Message-Id: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFhP3mgC/23OSw7CIBCA4as0rMXwaKG68h7GBYVpi1FQMMSm4
 e7SutGky3+S+WZmFCFYiOhYzShAstF6V4LvKqRH5QbA1pRGjLCGSFbjq7pDxDriODndB3hiqRl
 rpOItGI7K3iNAb9+reb6UHm18+TCtJxJdpl+tpXRDSxQT3BFCtRHAa1Kfbtap4Pc+DGjhEvslt
 h5KrBBail53rRQHYf6InPMHqPjXjvYAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_030956_898264_AA7311A4 
X-CRM114-Status: GOOD (  15.64  )
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
Changes in v3:
- Move the format attr definitions to coresight-etm-perf.h we can
  compile on arm32 without #ifdefs - (Leo)
- Convert the new #ifdefs to a single one in an is_visible() function so
  that the code is cleaner - (Leo)
- Drop the change to remove the holes in struct etmv4_config as they
  were grouped by function - (Mike)
- Link to v2: https://lore.kernel.org/r/20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org

Changes in v2:
- Only show the attribute for ETMv4 to improve usability and fix the
  arm32 build error. Wrapping everything in
  IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X) isn't ideal, but the -perf.c
  file is shared between ETMv3 and ETMv4, and there is already precedent
  for doing it this way.
- Link to v1: https://lore.kernel.org/r/20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org

---
James Clark (5):
      coresight: Change syncfreq to be a u8
      coresight: Repack struct etmv4_drvdata
      coresight: Refactor etm4_config_timestamp_event()
      coresight: Add format attribute for setting the timestamp interval
      coresight: docs: Document etm4x ts_interval

 Documentation/trace/coresight/coresight.rst        |  14 +++
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  16 ++-
 drivers/hwtracing/coresight/coresight-etm-perf.h   |   7 ++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 110 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  61 +++++++-----
 5 files changed, 143 insertions(+), 65 deletions(-)
---
base-commit: 01f96b812526a2c8dcd5c0e510dda37e09ec8bcd
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>


