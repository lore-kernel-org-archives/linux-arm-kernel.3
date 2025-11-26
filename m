Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BA3D1037B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UDVfKPw1JQQfmTQ3Yg6qwG7h5RkKYvdvv3LkFEdpMto=; b=2EnBY6T97xdo0W
	AdA46/NIPPVd6rCxSUWgQ8Ry8jEPFPqc6LlYCFm0TivLOPLf6c0V10ixIkKxQ22wDZcpJliY/+2v2
	WC1iuTJXHlduaSD44c13OiTQAxpw2pfBxyYRIlFoUG89I5G7lEEQMPL9h2T+13v/JOylZT+p/wUhk
	/dtbViVZ/UJZfgRRMVLyqEAlXM1LEJSL6EraRWndWd1sXAnoErInp48oYPERUqZ38+15Heo7tBaKZ
	BEaGTq949017wpihIhGYMtzbTk0pJaIXLaQXkGo3gRXeCI0m/mQOk3MGLKXxXPb7598EgkBYdCeRC
	f2xw17pvnPNbCisLfFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDW-0000000Eqpb-2MXI;
	Wed, 26 Nov 2025 10:57:46 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDU-0000000Eqne-018C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:57:45 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477632d9326so39304655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154662; x=1764759462; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDVfKPw1JQQfmTQ3Yg6qwG7h5RkKYvdvv3LkFEdpMto=;
        b=CHfNkkwUNmdcquMCG08+O4jgukC5S0qLRxfAM5P5pL8X6eR0tsKCDjPUCl0XuPps+6
         IjcdawfgIDX9k+y/sSp16jspzsZ6vwS37kfLLpSNUeH2G9dlsjSx+OXkvdUNwSiCTdSj
         5A88yiWP/STbJhJgJWjRdR/IQG9q2Ol9qWDJ4/UX7hR+i1tIGBB+JtXcimqjWSEBDk7t
         QVNekD6BSgIlCQJ5QYGZn/xJue324XPsWHf4TIcCu1DtZDkULOvxTIqL2PyL+eHyyrLu
         v2klYlwn19hUiDrPJjh5Nw5t0FmQT6U2qRj4ZL+YE/bh5PfdoVYdPDI9IIYvj0epGDP+
         hvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154662; x=1764759462;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDVfKPw1JQQfmTQ3Yg6qwG7h5RkKYvdvv3LkFEdpMto=;
        b=nwOQtnojwrEcb7rgmEg20s5lOqHJrg8Ops6UmAsm8Wi4jD+oD0jhQgbhbbT4JjOa7p
         G4GOK+fb3OCWWj8mgn98dehPDCIC6qUiePRRssvwI3oIJWnOBv78gf9cWVezNwcfXDeG
         ARUAlstdB3k6wj/B0NMCO3irAAL5o90nUNhZwE2XmQeRYeSKYq077GaPRhNgUxvGYaO4
         L7WxYk4QD8P9PyD3HA8QB0Y6oLghxCtCsLeymd3vp8dV/EF98FWTCnKTR+agO8w6p0mE
         gIa+UPXu4H9Vik1omcWk+yH4nZuTfMz4Il6YMzlQJDwv4SLvuPEv+XztAUMobtm9Z0PR
         MEvg==
X-Forwarded-Encrypted: i=1; AJvYcCUttw5GJnDfpZOFXO/gqEtREJUe2PRYwTrw9pTpj+5YbOIBc8CAnqgSBc4BpoZtzifBRPI7mav1LT82AEXX/p0V@lists.infradead.org
X-Gm-Message-State: AOJu0YyYo02s1iGqPoXtnKhf1dx1YYIqcM3JqRxMZ3MvFICmAVgTLjQ5
	LVYBkrlJ30IoVhW6H+ip4f7I9R0bc5ws/O/UBIv0UGwDlnomPksjvGafyoMwevkuFWf89gaedeX
	s1ayXBdc=
X-Gm-Gg: ASbGncsprqd3XtmXA2m/jB0zLaAEmfZVM2yxPr9NKQvDBHBlG8853TI6MzzJpbexX+G
	S61LVBV+Zwi3sJxcLzGKHx51ZHaiT1efQvq3K8kn7Mes202l0/Txum9QePKHKhWr2YVxTZ1T0Jl
	tgX33pvbWV08zwjeInbDvrm15aYySQfZ+FzO/zj+HXDkCiWJBNU4+lYouWDMMiqc40usdInF7uT
	Wxw3ZG/8gcRBmTpxQTg4//hrHgACvBPiQJQPATgNj4pTwXuXTA19kqHSyO18iF0AFkn1nxDbb0R
	ookeFLz38nEqRgH1ukDX1pqpLudnRxvdkc/Bv1S9dWfRksimPavIuhvSISXn/5ExTko46ANRvFB
	mpmaVUqQI8O/Bufj8DJoUCMP5ivvSLe7/htE3Z3P+cyJR/yuH4YlRoIMvLhs9IQ4M7gKJtor1Lk
	ehhg35PhluCkSIWNQShaAF738X1wApvp8=
X-Google-Smtp-Source: AGHT+IEodMVo47Bp4FxcEOGn3B0CEL26ZvCKbvlxSi500O8+h+deBEZnexXdLuSJoOjBK1BjjSrPYg==
X-Received: by 2002:a05:600c:1c82:b0:477:73cc:82c3 with SMTP id 5b1f17b1804b1-477c01ee405mr190579045e9.26.1764154661799;
        Wed, 26 Nov 2025 02:57:41 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:41 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v7 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
Date: Wed, 26 Nov 2025 10:54:29 +0000
Message-Id: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXcJmkC/23Oy07DMBAF0F+pvMbIM/ErrPgPxMKPcWsECdgoo
 qry77hFgoh4eUeac++FVSqZKns4XFihJdc8Ty2YuwMLJzcdiefYMkOBShiU/MW9UeWh8nqeQir
 0wU1AVMYNluLA2t97oZS/bubTc8unXD/ncr5VLHC9/mgWoKMtwAX3QkCImgYp5ONrnlyZ7+dyZ
 FduwS3RG7RgI4LRKXhr9Kjjjhh+CRACe8TQiEQqJvRphAg7Qv4RAF1CNgK08g5BCohhR6gtYXu
 EaoRFStF4cEbtV+gtMfYI3QgjRUTpcKR/xLqu35fc/xICAgAA
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
X-CRM114-CacheID: sfid-20251126_025744_076449_FE0C0F04 
X-CRM114-Status: GOOD (  22.12  )
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
      coresight: Extend width of timestamp format attribute
      coresight: Allow setting the timestamp interval
      coresight: docs: Document etm4x timestamp interval option

 Documentation/trace/coresight/coresight.rst        |  16 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  68 ++++-----
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  39 +++++
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  36 ++---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 164 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  92 +++++++++---
 include/linux/coresight-pmu.h                      |  24 ---
 7 files changed, 275 insertions(+), 164 deletions(-)
---
base-commit: 9e9182cab5ebc3ee7544e60ef08ba19fdf216920
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>


