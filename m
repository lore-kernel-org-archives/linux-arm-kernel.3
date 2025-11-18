Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1551CEE338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=faKepgN5zUJ1IGhRx8V75UbQcZJhRmJlyrhlcIcRmJY=; b=T9Yg8STul0GaV0
	UeIRXo02CQw6Bd6K6ZuPzWSj8uN0ZFX7yHhICiaqY+GBP5xVLSmej5BxjNyRzFkcfQQKZqmRMJRfk
	36CPTmvGJFvIFWxZXR1zXKddpPQ0rPUJFg7NczqLsvkDWbVJhKZNin0gxaEZ0LOzrG5JU2hC3pmhj
	jmWySinG0BvL9ly3+XpgS72X6Fr6Cr05RQD1JW1tiTcdnzsiZjdxHeg0LXOtYZMBAq5Ep4Z17eyC5
	+Zqxd6jsbGzY4LjDDPRsI8Bu9j82d/qJbJtQXr3u+eTZrS/AwMc+my9U/wcjwGYBFnegydtR3t/k5
	t7oh25qy8M1/cfBbSBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOYy-00000000jNV-2bgr;
	Tue, 18 Nov 2025 16:28:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOYv-00000000jME-387g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:28:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47118259fd8so43163515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483292; x=1764088092; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=faKepgN5zUJ1IGhRx8V75UbQcZJhRmJlyrhlcIcRmJY=;
        b=JY6UtXlpPm1BBtAaQfGfAf6g2un5kyy473MwpwsNh7j3j4LpVItFIImkHOVBL5D4wJ
         +ygHmC0IBae6rPeHqd1m1TPcJPFKQE9QJACnqUKjGeSJLvhZReo21YQffcAyv7Ngx7cv
         pkBmzlsrPc4B7vVQPhUwu16jfYfV+kvTiFbiXOSfxe5uxTEEWCBpm7yi6MFBmFHpDGrT
         N4BMw1K+oBFAesemilQ/AE8dod+Cr0Q5qmCMQs+Rr04Ey/j4oM3HWKbeqvwWc3pmBjK3
         HvnAzmPoJJX3GZHqub7ZiaBi0OUKj9THqTQ9Te8SW4uhPKTFWEX7+faFY19VfVo6Jm1f
         lueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483292; x=1764088092;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faKepgN5zUJ1IGhRx8V75UbQcZJhRmJlyrhlcIcRmJY=;
        b=r+iQljizOokdYb/1LvqngxHlLLHHngGI4haFgBgKEG9hxpCpW4ebV7x5CpTDN26rh0
         XvF3HyCKbHEBNtnmzhygoTvB/6UE4jN4ztmSxEL60ONxy9RUA/t1r3XYPYGlvVHNkwn4
         fS8mh1Q81cgKfup6ZzBEYhwDyAEQ0+vghSqw0cGCATTSYbbgDSQmTOEOzAICl+QDqmn7
         FKWy7Ifi5pDKHyrNpyc/jTYbOt+/Tiy9GKJ6SyhDPE0J1vRTzhFCPhn2PuCL0XVdK8om
         Bs0s1xmJm2CcKI6aRMOQCh9a9aGisv6BU00CcUqkRqPNFElBC6RF3KDrb2VcUseaV2+C
         5eEw==
X-Forwarded-Encrypted: i=1; AJvYcCUZb53fx0xZGJl/qSM74DSw78vfL9red1MmadQeAD9L6WSRK7OheOsXNXo0HhJrs8vOOftiQNbYEErnGJZ3nc/a@lists.infradead.org
X-Gm-Message-State: AOJu0YxnGl78tHFUNQKVwIoxbJPRzchC3kGQKsoF1HLRhZd5yZG1HOzP
	xaS6sbv4lARoqOB4sGG7WxPLNObUzkw8WJvgEcP8Husydh4MFJ5n2ZEnmBhpqSb5gpRgQ1HqqWF
	6jP8DTyQ=
X-Gm-Gg: ASbGncsZ+eSJVLW8htfT2UuIEMUUybN26tdET19QykPxfrK7xdNjo/KxePG36voaawL
	lMcnYoXF8YLTgsQkdFQSl6cH1DDorX1MxPRaTVqc9C3ZH/0PIUspOh32v/WbjWaVmqTnI1kcFoG
	6CVK6ck27nIMkP5Dr5XseZDPgr4XzrQMJxlC5O0phrazjHkB8/Oj59kpQ8iy3Ng4yPJSCoVXZXl
	DObulmSt5dLgauo3Z2DXlZ+L0qjN4Q1uHG+i0ZH1ZkE7ORHCucTQLu8nH85jqLz1Nz62Y7GyGRj
	o30tB/eGLZ9oTt/F7NzU0OWd3Hf+3TRwSSV5TIn5Om78b1RoPWS3cbi6HsQ+nIAwLF0yftKX9Vk
	/Emzyfv0HRSevDUyHE+m+Rw1MyEhMCKkJ1/S+Pzq1Voc4CpBa/8hBlLLiEAUx02oEUBZn6OoYn9
	3u8FvdQSxWNdg/bIcituZw
X-Google-Smtp-Source: AGHT+IFY/GIp2ub5yggP1OkETG5FUg1k7SgxWvzcAPkxkGMe+FzO5/IcGapEB/VobU8EKioqIpXiBQ==
X-Received: by 2002:a05:600c:4753:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4778fe5ff23mr145350685e9.1.1763483291692;
        Tue, 18 Nov 2025 08:28:11 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:10 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v5 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
Date: Tue, 18 Nov 2025 16:27:50 +0000
Message-Id: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIaeHGkC/23OS04DMQyA4atUWRNkO69pV9wDscgkTpuqzECCI
 qpq7k5aJB7qLH9L/uyLqFwyV7HbXEThlmuepx7mYSPCwU97ljn2FgRkwJGWR//KVYYq63kKqfC
 7dIHIOK8Gjkr0vbfCKX/ezOeX3odcP+Zyvp1oeJ1+awPiitZQghwBMETLSoN+OuXJl/lxLntx5
 Rr9JdYeatSJ4GwK4+Ds1sY7Qv0QCEBrhOpEYhMTjWmLEe8I/UsgrhK6E2jN6Ak1YAz/iGVZvgA
 3n0D7fAEAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_082814_625923_327BC70B 
X-CRM114-Status: GOOD (  19.47  )
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

Do some cleanups then expand the timestamp format attribute from 1 bit
to 4 bits for ETMv4 in Perf mode. The current interval is too high for
most use cases, and particularly on the FVP the number of timestamps
generated is excessive. This change not only still allows disabling or
enabling timestamps, but also allows the interval to be configured.

The old bit is kept deprecated and undocumented for now. There are known
broken versions of Perf that don't read the format attribute positions
from sysfs and instead hard code the timestamp bit. We can leave the old
bit in the driver until we need the bit for another feature or enough
time has passed that these old Perfs are unlikely to be used.

The interval option is added as an event format attribute, rather than a
Coresight config because it's something that the driver is already
configuring automatically in Perf mode using any unused counter, so it's
not possible to modify this with a config.

Applies to coresight/next

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v5:
- Add parens to interval calculation in docs (Randy)
- Swap "minimum interval" and "maximum interval" in docs. (Leo)
- Add TRCSYNCPR.PERIOD to docs (Leo)
- Use CONFIG_ARM64 to avoid is_kernel_in_hyp_mode() (Leo)
- Add a comment for hidden ETMv3 format attributes (Leo)
- Hide configid for ETMv3 (Leo)
- Link to v4: https://lore.kernel.org/r/20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org

Changes in v4:
- Add #defines for true and false resources ETM_RES_SEL_TRUE/FALSE
- Reword comment about finding a counter to say if there are no
  resources there are no counters.
- Extend existing timestamp format attribute instead of adding a new one
- Refactor all the config definitions and parsing to use
  GEN_PMU_FORMAT_ATTR()/ATTR_CFG_GET_FLD() so we can see where the
  unused bits are.
- Link to v3: https://lore.kernel.org/r/20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org

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
James Clark (13):
      coresight: Change syncfreq to be a u8
      coresight: Repack struct etmv4_drvdata
      coresight: Refactor etm4_config_timestamp_event()
      coresight: Hide unused ETMv3 format attributes
      coresight: Define format attributes with GEN_PMU_FORMAT_ATTR()
      coresight: Interpret ETMv3 config with ATTR_CFG_GET_FLD()
      coresight: Don't reject unrecognized ETMv3 format attributes
      coresight: Interpret perf config with ATTR_CFG_GET_FLD()
      coresight: Interpret ETMv4 config with ATTR_CFG_GET_FLD()
      coresight: Remove misleading definitions
      coresight: Extend width of timestamp format attribute
      coresight: Allow setting the timestamp interval
      coresight: docs: Document etm4x timestamp interval option

 Documentation/trace/coresight/coresight.rst        |  16 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  70 ++++++---
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  39 +++++
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  36 ++---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 164 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  61 +++++---
 include/linux/coresight-pmu.h                      |  24 ---
 7 files changed, 258 insertions(+), 152 deletions(-)
---
base-commit: 9e9182cab5ebc3ee7544e60ef08ba19fdf216920
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>


