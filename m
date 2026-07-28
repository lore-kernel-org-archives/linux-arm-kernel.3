Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5374BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qWoF0fB5PNOKYnD+A4X5y/pBZZyCEll/MQB77HbZLNU=; b=xzYMIgl5wXHGLd
	6RfYEX6dyQVgRlpo45SUoaQEHBdKTi9oG+oxGT/mMTb6dksUyKiPpUvVDKKCEiqGwavpkzl6bKQnD
	6j4RIb4pawtGQWphVEW51DGSNdtstjNvzMxQ4epAjIn2zK4It189i2+UWBUziKeyfxqIDNGkRdLtO
	x6gWDFUWjIgbt5dl2fqR+9mZ4YHnzWDNySEzK/2icpfptZm0yVfc57RwamvjpcmK5/CR5qmkOMb+S
	LMhe9eGNpPeqFUl73X7GBbJAOr/gBNLY4SF6+7EPzaVuQmtKZ9xTZsYkeD8tK1Jb9iKbRPo5NuCHL
	rXVsS+at1KtR1htqLsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIn-00000005Zbc-1UBv;
	Tue, 28 Jul 2026 15:01:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIk-00000005ZaZ-3yiu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:01:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1009377f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785250860; x=1785855660; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qWoF0fB5PNOKYnD+A4X5y/pBZZyCEll/MQB77HbZLNU=;
        b=rcA4kXA8CcmYC07JVw5o6W+ljM24EilqYWK/R1K2DTx642tcOn2V4tmqg0H/gGs3Lf
         R77UCBdQVSDJTcLa/0PXT+75txgIu8iMRpP4bxdyZfUXD+Lk6H7ldyFIQo5NcenPBNNQ
         +ekcylCmLv3enHVDxS3/Vvmnx1X9732+BxJZKEaSaAbq9b7jcKy+y3wtC7YEP7nUiF1F
         v31nHrl0VtipiEksASIujW++DYIVuKRfSNUG9WRIdnTvAw5dny/98bPt4b7Fap8yxlWy
         GHuGQwchTSzCx1/W3uUk2hpPfry2W3JCmkyK97sRWV5nmA5+jshtmPqcBJ5lKaxt2qTT
         Cetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250860; x=1785855660;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qWoF0fB5PNOKYnD+A4X5y/pBZZyCEll/MQB77HbZLNU=;
        b=bFCObbv4zVoP+jORlw1GmMq8619c6s3UrIoumRgspbPcIiTDlrkVC/Q+XEGXr2sf5v
         HlUJhSn0Dyz4+zujQ5jmfSS6kjjsEVVXICNwtiH82DjBex9/kAq+qdRq3/U840r+05q/
         Ca9AVWzpE/nkFdNwR8Ph274qi6dMCRY6tFMeolNh3JK8IRqdVoZnkGp0uIrQKNojqHKc
         ygaCPM1bo7npqxcDp6/TY67LrJ4ajL4vk72NAW6Q2k5xx5vpaFInWd6h3x7sZvjwWEBS
         CJjrQI/7on3DGXEFQ7h/xFr+LZhPNqOqGvi1Ph/abjUI3Qzwt8FD3bTN4oTIBUSnOPS5
         RNiw==
X-Forwarded-Encrypted: i=1; AHgh+RpkppFHUNa/q5kJU2lsFOYkc14xPOzjT8B+nGrr4DKerXBvbp2WyQVBYg1oewvbxfSSUmpbYweOaedHJ+QWKd3F@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3/MuD1PzmSnyHh51qtiNVLaGMB9P6LiLYiaDEa4A+bcpoMqWx
	dobvQFGfMQOXJrtbCt4xO0U/lx+B9fPlrXGA+TVcjuTF8v6BJLAZdHCysCPZ7NXisy8=
X-Gm-Gg: AR+sD10+KBc6KME1gTQU3gPKbdthxMvw8yXZAEVrBzhvkxjZ2NVkb7p0tKPyOXSp4HW
	s9KPstJ3/a0aAziFVJwFiEvYQN/1wve7wz7Rh8Zie73kmbryXKwq4kw8CPXqcNfOEV42pR5tY6G
	8Y2IdFoVY+mVVviESVC0SgTVQaGA6V3z2F7yRIIhsccQVz6VCsUYR5sjxr5CXAStPNpGQs7/enY
	Dw6HzRawTti21BQ2vPWY+oTfJMErDus1ESyVLvVZEyW6cDV9n4agygeDwqL/hWa80fGyLUEA5KW
	2IudzejVymbXKTokxB/+TNGb6FxGUxLktjob1aSd9k1WWHKWOPCVw8rGpWw+EENe0qhvQ/25Plq
	bI8o5WnA6gmLtte3rX7CvvsL3YBpRWeS7B8OnaC88GYRWx6JZt2eUWTjndMHEYYvBJ8pxHZY5Pe
	Wjf0a2F80=
X-Received: by 2002:a05:6000:2212:b0:46b:70db:2113 with SMTP id ffacd0b85a97d-47fb1e1d7f5mr3445185f8f.0.1785250860087;
        Tue, 28 Jul 2026 08:01:00 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm61036324f8f.20.2026.07.28.08.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:00:59 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 0/8] coresight: Prevent per-thread events from sharing a
 sink
Date: Tue, 28 Jul 2026 16:00:12 +0100
Message-Id: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP3DaGoC/5XNsQ6CMBDG8VchnT3TFqTo5HsYh9oeUAOUXLHRE
 N7dQuLgZFwu+d/w+2YWkBwGdspmRhhdcH5Ike8yZlo9NAjOpmaSy5IrXsFd9xjABOgf3eTGDmF
 Egqkl1DYAWmHlIV2VFywZI2Htnpt/uaZuXZg8vba5KNbvRz7+kKMADjavCixtoZQ2584NmvzeU
 8NWOsq/OJk4wbVJUqlrfvvilmV5A+BnR8oaAQAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_080103_056421_C933B729 
X-CRM114-Status: GOOD (  13.20  )
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

Concurrent per-thread events results in a WARN on N1SDP which leads to
the realization that per-thread events shouldn't have been sharing sinks
in the first place.

This slips through because different per-thread events will have the
same PID if owned by the same process, and we only check the PID and
nothing else. That results in unexpected WARNs because it looks like we
assumed it couldn't happen (although exclusive PMU rules allow it). But
even if it was supported it would result in trace from the wrong thread
in another event's per-thread buffer, so we should disallow it.

Fix it everywhere the same PID checking logic was copy pasted. Then the
PIDs can be dropped from a few structs as they are now unused.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v3:
- Storing and accessing event owners at runtime causes problems due to
  various scenarios of: events (and sibling events) exiting, children
  inheriting event FDs, PID reuse, CPU affine events that also have a
  target process set but different inherit settings. Fix it by creating
  a session ID in etm_setup_aux() and holding the references in it for
  the duration of the whole session. (Leo)
- Make the ETR buffer allocator consistent with sink sharing rules by
  not doing numeric PID comparisons there either.
- Fix up some Sashiko reports that it sees after interacting with cscfg
  and taking extra references to tasks and PIDs.
- Link to v2: https://lore.kernel.org/r/20260709-james-cs-multiple-per-threads-v2-0-10ac7ac6af0b@linaro.org

Changes in v2:
- Fix inherited events by following event->parent
- Link to v1: https://lore.kernel.org/r/20260709-james-cs-multiple-per-threads-v1-0-d384e6d477ac@linaro.org

---
James Clark (8):
      coresight: tmc-etr: Don't stop Perf cleanup for active sysfs reads
      coresight: configfs: Don't assume active until cscfg_mgr is set
      coresight: etm-perf: Flush workqueue before unloading module
      coresight: tmc-etr: Prevent per-thread events from sharing a sink
      coresight: tmc-etr: Use session ID for buffer ownership
      coresight: tmc-etf: Prevent per-thread events from sharing a sink
      coresight: etb10: Prevent per-thread events from sharing a sink
      coresight: ultrasoc-smb: Prevent per-thread events from sharing a sink

 drivers/hwtracing/coresight/coresight-core.c     |  28 +--
 drivers/hwtracing/coresight/coresight-etb10.c    |  33 ++--
 drivers/hwtracing/coresight/coresight-etm-perf.c |  79 ++++++++-
 drivers/hwtracing/coresight/coresight-etm-perf.h |  15 ++
 drivers/hwtracing/coresight/coresight-priv.h     |   2 -
 drivers/hwtracing/coresight/coresight-syscfg.c   |   6 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c |   6 +-
 drivers/hwtracing/coresight/coresight-tmc-etf.c  |  44 ++---
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 207 +++++++++++++----------
 drivers/hwtracing/coresight/coresight-tmc.h      |  30 ++--
 drivers/hwtracing/coresight/coresight-trbe.c     |   3 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c       |  25 +--
 drivers/hwtracing/coresight/ultrasoc-smb.h       |   6 +-
 include/linux/coresight.h                        |   5 +-
 14 files changed, 294 insertions(+), 195 deletions(-)
---
base-commit: 98495b5a4d77dd22e106f462b76e1093a55b29a7
change-id: 20260708-james-cs-multiple-per-threads-ed1d25ed1734

Best regards,
-- 
James Clark <james.clark@linaro.org>


