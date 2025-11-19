Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D213CF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kqSmo/Laz/wqcGa5U2yqJUf0vmDAtS4/bm3ej3zoNlI=; b=1ivmD15NXZ2/1c
	pXPhX0PIVF1UfWHpXO3NXlCWKA88CNlXmK6Z6CWINDPgLt0fVNzTuxrGFuvrZ7udwaAUT55ZA5SrU
	RY31WEKaNNjlQPkYwbo4j5nLwcmuCS572AWBczPRAigJ5crfeWkzMTrNhqPMW6yKBGpP7i6edY9YR
	F4r61KESjwHjYhxY5VUIUoHE/fiUnJTGYDp7iOBiLmH6lu4Y19D4D0i1OlJnZxWQ+xYABTA1Oh9pA
	noI4YDcSQBOHM0GvNI72bAIcE4JJRZVVe8vPe8XEgQ6cbFH1NYpStYEiBla5s1avV03zj/InyhJXu
	+WR7B83YcVs8Sz1DupjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLksy-00000003euA-2rAB;
	Wed, 19 Nov 2025 16:18:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLksv-00000003esP-05dw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:18:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so48805065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569099; x=1764173899; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kqSmo/Laz/wqcGa5U2yqJUf0vmDAtS4/bm3ej3zoNlI=;
        b=NY9ntOeM9ZQhFzDl9lLbREZXpefxh0Gj0CyaZq2BML8nDJzQefs43WtzJfi2FqL4FA
         aiiqIBIs5Y9HJcqIqADoxP9rGCKYrKpTQRJRNokqEyakI/Nb5wp6HdocmX+Nmb0wWGie
         PEfAc5ySPhvATtqyjyl/QKkHLLDHCuIAIvQq6DtRns/oauHzM5sdRxaj7H012ZtLy1A/
         Jvbj2X9h7RJK4UOPb08P2rHbJWO4uq56DrzZg1LHBH+836uWZ7X6air3poiblyp41J8M
         z7QJKRR9KVIzf3x51qG6sEdCEsWz4W/d7hcKch++1bSI1NQe8Q/MYFw6AHDlIR6JMs3h
         KDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569099; x=1764173899;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqSmo/Laz/wqcGa5U2yqJUf0vmDAtS4/bm3ej3zoNlI=;
        b=sSQhUye2wIk/3n6tDnNjWhFj0AlrNtZJgwJiJgGOFae8xAm+RnvYgVn8dVfE3T2XW+
         niAdfuYBRser0/YJP0EdRRBMbdd7mGp+fOQI4ZWT1BFrzT5Gcc7xMNt52fHRSL/w4eO4
         9p0nrvolpaUtpfLeBbQOpE7nLBzZrmbj3iJZyAB1cb57hkNuGO3/0+nQb4NIwOHUd1H6
         nLfM3JEXe1kGVwZtrqeNsknGjBQjcG4wgHhfmHSRjx3YOBXTqTY6J4htCdP0ercDS+s4
         UKW32JpNgejZfKv6Q/H6JycfuoJ2SYItFULVGc/joyXUfa9oqO1i63HmOweNcuib6rrg
         cnRw==
X-Forwarded-Encrypted: i=1; AJvYcCVGTVQk09gSxf5PyuHJhSoNoCC099Pr81oVqXQCdS3BoLopgkuLwAm4pn3cfNzpu0pL/+/DJDuG8gGJxp8rnpLN@lists.infradead.org
X-Gm-Message-State: AOJu0YzfzhAj7nA780gDarWKudY/OM8vvJUUQri/iE8vrKN5tM0SnKsq
	coDErhtDyygpNdgAevL6G0BcPZvpHADoJOAE5zPEcQsBsryqThC0EZt1cuapxogYW2Q=
X-Gm-Gg: ASbGnct8rQp5Cacmm6mBE8Xw/3ZgGAFBnmgwOokfr33RvAe9o6htAFLsiEmWVqGODoE
	noR9ODvfkZt6HAn0JEuy2i3WefG9Bvfp9H4RYYV1h7hsxOYb/ddy9m914Qfz0rfXYR+euTAJpiZ
	9Ey26RFRY84kmYcrh1BZmF6Da2Gc3RFklhYE5GLTkEd7eMuVrNnUdLtSkR2OexiJ9ftBGDae7lN
	/dBvDcX2mITGAbp8kfoiqND6WY7CxuOQM/Sd/IQRad+zUT51e8e+EvSAmGo1ch7HOe/G7sBm7Qv
	oQgi23nB+o9HXvAH/qo96sMnTk4cn2MpVlYMujrNgKnF8XulHKiVlK3bRNa/HXGVADeAE6inQtA
	fcmPNdOzwvZFW+DhdDte5bSGWlgsYOIx1BM/EHaQ6DY++PDjPvHrgTTxZd9HRpBzDM+0G5JcSTh
	SSwZfYYvqQIjT8NSOjr0BkToAnUzfTGgA=
X-Google-Smtp-Source: AGHT+IHR+DwUC6v1Y3r57tcBgwQLVK6dWirnJF4ua41MnisnQJishs3n6VHMISKst8u5Qq9qepwLtQ==
X-Received: by 2002:a05:600c:4513:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-4778fe5c820mr231104425e9.10.1763569099061;
        Wed, 19 Nov 2025 08:18:19 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:18 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v6 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
Date: Wed, 19 Nov 2025 16:17:56 +0000
Message-Id: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALTtHWkC/23OS04DMRAE0KtEXmPkbv8mrLgHYuFPOzGCGbCRR
 RTN3XGCBEHjZbXUr+rMKpVMlT3szqxQyzUvcw/mbsfC0c0H4jn2zFCgFhYVf3FvVHmovJ7mkAp
 9cBsQtXVyoihZ/3svlPLX1Xx67vmY6+dSTteKBpfrjzYBDLQGXHAvBIRoSCqhHl/z7Mpyv5QDu
 3ANb4nRoIadCNak4Cdr9iZuCPlLgBA4ImQnEumY0Kc9RNgQ6o8AGBKqE2C0dwhKQAwbQt8S04j
 QnZiQUrQenNX/V6zr+g3PnH2kvwEAAA==
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
X-CRM114-CacheID: sfid-20251119_081821_440048_6A936FB6 
X-CRM114-Status: GOOD (  21.50  )
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
Changes in v6:
- #ifdef out format attributes for ETMv3 instead of using is_visible().
  Then the same block can be used to define format_attr_contextid_show()
  which avoids an awkward WARN_ONCE() and comments in arm32 for a
  function that's never called.
- Link to v5: https://lore.kernel.org/r/20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org

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
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  68 ++++-----
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  39 +++++
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  36 ++---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 164 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  61 +++++---
 include/linux/coresight-pmu.h                      |  24 ---
 7 files changed, 244 insertions(+), 164 deletions(-)
---
base-commit: 9e9182cab5ebc3ee7544e60ef08ba19fdf216920
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>


