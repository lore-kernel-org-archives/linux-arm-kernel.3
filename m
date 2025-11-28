Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F189D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w0TcHWb9fHTi0jCTcopxtEaDqpd5gmt1KJnh5vwOy84=; b=lCkaegU2ZHzpJF
	6mxG0lC7QKChFhvg8wIHT25uXyiV3Wzn6ts3Qf2uHy6nLcayDWIEx23y47IHMATDeFrhy8jM6BVp5
	Cn9ajXlwwUh+9rnob1p7fdJk6F4eyRO54ai/ly+fw9JSEgjNr6eLr8faXPQr0dJhQzyXEm8SpAke+
	uXyUIfWeLblXTMDpvpMc+zNjGW490QR0kiFJfxQlX8hTvNV2L6xDI2oPFJGPD5CywmtOTFqo+YSQc
	5HZM6gW6KJgwyUK/3PN1maxxnqhd1IL1ctVB8SNLs3oCkru5veT9gzLCQECLaS+m66qRa7dfigCV2
	c2+f/kW1bKScaCgWXe9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx4t-00000000Nha-1bkc;
	Fri, 28 Nov 2025 11:55:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx4p-00000000Nfe-0k6Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:55:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so11974595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330949; x=1764935749; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w0TcHWb9fHTi0jCTcopxtEaDqpd5gmt1KJnh5vwOy84=;
        b=t50oXE1TrbJ5oZ8yCrdPtEPgk95nOS2r7bqEvvdgbmFzuyjFeo3HPMy08KLG4ZzrPg
         Fez2tkHRvY2bhRvACLiL+bq/+9i1EvF5moCg0ee/MnmzmS3kPW/0XzCdjjQ00sKIQy7f
         tUXqRbzOy7uqRCopkfOWB9nAfgPrDOLbwsvhHmsb4YuPXbYuHDZUhLT28HzjxHo224AC
         43YJJEEfm6nXZ9yofY4P1vQA/BG7WD3z903k5cx/xMC/drgn3XwOzx8YpEVSp9LI44rk
         wVJadlKhxKN6leU4W8yCVreIc0dKisDBZMhU2LxgOulCvrNh9KrqWNFdnBDVhKWt7pV5
         RqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330949; x=1764935749;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0TcHWb9fHTi0jCTcopxtEaDqpd5gmt1KJnh5vwOy84=;
        b=YUpR61Bjcx2Y3b3rKdtTOCRwb7Y0As94ioSHdDWcrZqQ/+21C1+TvJ1GlSMDEhd9is
         MKleozEKl71GiZFV6sT98zXzX+jyqrnAO60aWqlgxanGeiMVbhiCz60FA7w7I5FiymZX
         8Xtlv/OO948pdKuui5361a2OdXJ6dTfhyA3kN9d+SEk+pza42YZCVofn+FD/vrOb6VDE
         u7ceozzZ5or8BvIVU+ZEiQ1ySXxxu5o+xY+aCXavVC4e0DjLaL9vxi0DEvSmR5N1meAW
         ndSDkDT56/FKNE3m2Y4q+qY75zEYcoV3/xNVia6JCRyMnJSbEUq5hJxdQY9Qz/LS2oOf
         68ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWUZZXPhWJuSvAZWct1HJNsARzhGYjiPZnUvFt7uE64pLiu8UIKIjVgkcTQOd1WsazwsqBwMJPHd5QDuxB2CD/b@lists.infradead.org
X-Gm-Message-State: AOJu0YxdyLdxS5BRuqvqcQg3xI+jmoHStjIc/kpR2bhepLMlTw8QyhKK
	4MzY2yQ9L8JpMJsDqDeV5LGap4p9/JAzOmKFgshyGDoCRmLfhS+VfEUWOwtln+H7JhY=
X-Gm-Gg: ASbGncuU6Td1SQHJnU4Wxk108XTAmcFi8Qojr2gcpZZwUl9ozXEWLDDNNwaUvIacpbx
	1wq1T9seLMBI7GcBgXPl3XzhD4b/ZT+5X1Cg8LoK1zOI6Q2hc3syPspFBnGxIBjD5m8Y1T26fmX
	c87cFWylqQvnNzFycKC2DmD4ApLRPxPZ66AzHUtskDTIQ3OIerT10OPVorMIqb31jiSX5dL+fw1
	qXNA9IThaQYPDAsT7TpjuVpeyZFHsW4odzklwYsLHUgqm48qfAd/6vN5ZLYuAyEdtgUxd0qcMG8
	ZeTeirFbRQeIVA2rfXVNWGmT/E5zUNaazzonQfhrzcbnD73BIIe5Jsc/R9PgyPNywRHxru/c2yl
	FhwOPTnBQ/EacIdgXxT/uulhCmhs6WBkuXOdCZwBioYNZodnWPW8DlvaTTogQa9mDYULuVGYtvJ
	pPkgepIR9+/P8pvreL8bbN
X-Google-Smtp-Source: AGHT+IFCaezpDzwvJ5YFy4YkZmmbr4ySHFAbq4jp3qLN1r0Mys7bkocqdmJgJAT/s2gldrYAZNuG/Q==
X-Received: by 2002:a05:600c:3b11:b0:477:8ba7:fe17 with SMTP id 5b1f17b1804b1-47904ac464bmr139805295e9.7.1764330949090;
        Fri, 28 Nov 2025 03:55:49 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v8 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
Date: Fri, 28 Nov 2025 11:55:12 +0000
Message-Id: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKCNKWkC/23OTU7DMBAF4KtUXmPkmfgvrLhHxcKxx60RJGBXE
 VWVu+MUCYLixSzeSPPNu7FCOVFhT4cbyzSnkqaxBvtwYP7sxhPxFGpmKFAJg5K/uncq3BderqO
 PmT658YjKuM5S6Fi9+8gU09fdPL7UfE7lMuXr/cUM6/ZHswANbQYu+CAE+KCpk0I+v6XR5elxy
 ie2cjNuiVahGSvhjY5+sEb3OuyI7pcAIbBFdJWIpELEIfYQYEfIPwKgSchKgFaDQ5ACgt8Rakv
 YFqEqYZFiMAM4o/Yt9JboW4SuhJEioHTYU4MwGwJ1izArER0pEnVA/yOWZfkGG1gLkUUCAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_035551_292311_AA4B33CC 
X-CRM114-Status: GOOD (  22.45  )
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
Changes in v8:
- Handle ts_level attribute outside etm4_config_timestamp_event() (Mike)
- Flip commits 11 and 12 so that the new attribute works as soon as it's
  published to sysfs for bisecting (Suzuki)
- Remove some spurious header includes
- Link to v7: https://lore.kernel.org/r/20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org

Changes in v7:
- Change TRCCNTCTLRn and TRCTSCTLR register definitions to use a
  combined field for TYPE and SEL (EVENT) so that they can be used with
  the new utilities.
- Add utility functions for creating resource selectors that do compile
  and runtime checking of the resource selector ID.
- Link to v6: https://lore.kernel.org/r/20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org

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
      coresight: Prepare to allow setting the timestamp interval
      coresight: Extend width of timestamp format attribute
      coresight: docs: Document etm4x timestamp interval option

 Documentation/trace/coresight/coresight.rst        |  16 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  68 ++++----
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  38 +++++
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  39 +++--
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 175 ++++++++++++---------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  92 ++++++++---
 include/linux/coresight-pmu.h                      |  24 ---
 7 files changed, 279 insertions(+), 173 deletions(-)
---
base-commit: 9e9182cab5ebc3ee7544e60ef08ba19fdf216920
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>


