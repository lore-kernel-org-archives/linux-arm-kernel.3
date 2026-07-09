Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A38C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2HhxTuPayc4fDCilKdE1ZAaquhcp970WU0ec39/y8eg=; b=rHMpsrtpM3QGaC
	SxOZBMLC2+FlwAQTYCZwMHhu0kMFJroLyMj63jd6oY9zMozP/z2bUGvao7yf/qJsiCyh7sgQ4dstz
	kPukgPYs3hgQtD1hUuYocge4022dFrhKaKHtsAK5SxUZR07YOwQCpZsLMtMf7Neq1XGVdzZrRQiG7
	0YrKPs3h+6owZENPPQ2bI1+qXvMMvTK25C1KxeU1+0KeuBDGT4lFm5aQ/HzFbCdPMiImmBV7NF4s2
	yPf8JGFvS5KkWDnTjfS9aqfrJDWIebFd/172YAAVPaoNs8mVcphpb7yAogSwccrSXP5+jLqEC78ge
	PMnn+S4ETtAJ8SHQ6KEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmRs-000000023Ob-0wPP;
	Thu, 09 Jul 2026 10:57:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmRp-000000023N6-1AC6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:57:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1504098f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 03:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783594659; x=1784199459; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2HhxTuPayc4fDCilKdE1ZAaquhcp970WU0ec39/y8eg=;
        b=VG7fnEZH9MWWUSIA9IjnBn4JezeMNRXD4S60w0qwp3L6UngIQ5zI84XRpestLGiYa5
         6q9jsHtXAJRWX4YW1dQ68HVl4/W7UBp8bFg9484l5ThDOtcaqWEw6KV5fuUo4Jm8iUB6
         Kvb23S6l4lf1nL8glIUk5kR2oN+YUOkP0tT4zlYaictKftAACBDvlFgEEqsdyRBbvmrK
         vzJlaKxjRRXrfPdVRY/BRwxf/uA/onwOg4KYVsrtrn90S2AkMibljGWY+rWDyxDFmR8Q
         axRjRd8+/hhX7U9x/21qLjvHkkqNi6faKnUwtMOMQp+4dD8VP6U9WaQgeYGfeQAlpRGb
         t/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783594659; x=1784199459;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2HhxTuPayc4fDCilKdE1ZAaquhcp970WU0ec39/y8eg=;
        b=jXySu+kHbey2lwJCOZ7kQfPY9DCATfqiihqqg6K0GVdhzkaJen3ksRYWcaltxRr+TS
         iskYINyqrzcGZpUgU7iXbZ9q27Hg0G46ORZuci/cK27eIU/581m6yXrrkrpuZBvtXO1T
         0+meqD53hSaauZ5q7/Hw/EqmWgvo9ONbG5yfBZXR3dSE95hvBCBbwfGJQd6p2ggh938X
         53Zlk0LH3aHNe7SsQzlPwdzA8jbEglTNcHFpo1KzJh11gk2pN2lehqEg48DyUB65Subr
         x2amV/vp9B74TRRBzjSz4telYrFbWpIQlyKutXB0qJOmpQC6sJyjP1VxDHhZHjTIWlyc
         3jrw==
X-Forwarded-Encrypted: i=1; AHgh+RoIXPManoI+TUUIJytfBKu2dYfcq/RGIyCKWmcfXq/ot3MAj+ijNAt4SYLkpzByRKA2JZbmy5pjlScyurKwUgsB@lists.infradead.org
X-Gm-Message-State: AOJu0YyeKj/VRkdb66ww4TjLlewj4w28HTIy0C2m21I416xc9ZOnyB9J
	yAg8C8frHDe6eicJ9Nl0uvTY/N8uWSRLayEAJc9229WkSbtPVSXmqEl05CYQiSg2k1U=
X-Gm-Gg: AfdE7ckCyE/Jz/MXe79riRJHPIspSAKwHHZ6tSmGzYZG5zYOjxE/ew+lfb39CNq4q5p
	cc1Skk5zUQzLiFUcUI3UuWgjTBMF9sn/K5jNw9HfHPD0q2VFFABEKQxzQJa9HetT3VQRlau0Apt
	cs49fd4FtY/whngNDGk5MTF2nZTeNWmeHnCE1UUGNQ/lmqric3V1R2y/Ucoa3qBZnEO95xzSljb
	Ftx7s0elDK+nV2r8cAvGtDYyvm1FdJ5JrgbXi6xbB8Wto1IQv28iZF1A/ZWkHBUGYQfuSiGYvOb
	CiGJNzzrzX5yRCDqlDnLZSSSY3bl3YsH5F2Yz/SAYi21rBVl5miZECwRNrYoQb4SRgVfLVMv+qv
	NxXgCsvzm4WMFnS/w7dmwj6kJnYyGOjnzgyJ7rre5m/j69lsYkzerAQf3FlTw5FqNP1/AAJz8Sp
	xuRmhpVPJMCRsCD9nHiedrEg==
X-Received: by 2002:a05:6000:2303:b0:47d:ed14:32c with SMTP id ffacd0b85a97d-47df0789792mr7160687f8f.34.1783594658973;
        Thu, 09 Jul 2026 03:57:38 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9b4d850dsm51927408f8f.0.2026.07.09.03.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:57:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/4] coresight: Prevent per-thread events from sharing a
 sink
Date: Thu, 09 Jul 2026 11:57:22 +0100
Message-Id: <20260709-james-cs-multiple-per-threads-v1-0-d384e6d477ac@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJJ+T2oC/x3MQQrCMBBG4auUWTuQxmrFq4iL0PyakbaGmSqF0
 Ls3dPPg27xCBhUY3ZtCir+YfOeK9tTQkML8BkusJu/81fXuxp8wwXgwnn7jInkEZygvSRGiMWI
 b/aW2P3dUH1nxkvX4P57btgO9MrCsbwAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 Jonathan Cameron <jic23@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_035741_346952_419AF5E8 
X-CRM114-Status: GOOD (  10.61  )
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

This slips through because different events will have the same PID if
owned by the same process, and we only check the PID and nothing else.
That results in unexpected WARNs because it looks like we assumed it
couldn't happen (although exclusive PMU rules allow it). But even if it
was supported it would result in trace from the wrong thread in another
event's per-thread buffer, so we should disallow it.

Fix it everywhere the same PID checking logic was copy pasted. Then the
PIDs can be dropped from a few structs as they are now unused.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (4):
      coresight: tmc-etr: Prevent per-thread events from sharing a sink
      coresight: tmc-etf: Prevent per-thread events from sharing a sink
      coresight: etb10: Prevent per-thread events from sharing a sink
      coresight: ultrasoc-smb: Prevent per-thread events from sharing a sink

 drivers/hwtracing/coresight/coresight-core.c     | 24 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-etb10.c    | 30 +++++++-----------------
 drivers/hwtracing/coresight/coresight-priv.h     |  2 --
 drivers/hwtracing/coresight/coresight-tmc-core.c |  2 --
 drivers/hwtracing/coresight/coresight-tmc-etf.c  | 23 ++++++------------
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 20 +++++-----------
 drivers/hwtracing/coresight/coresight-tmc.h      |  2 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c       | 22 +++++------------
 drivers/hwtracing/coresight/ultrasoc-smb.h       |  5 ++--
 include/linux/coresight.h                        |  3 +++
 10 files changed, 57 insertions(+), 76 deletions(-)
---
base-commit: 98495b5a4d77dd22e106f462b76e1093a55b29a7
change-id: 20260708-james-cs-multiple-per-threads-ed1d25ed1734

Best regards,
-- 
James Clark <james.clark@linaro.org>


