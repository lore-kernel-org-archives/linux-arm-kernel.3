Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44537CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uTBIuaJ6iARLuZWV7QgcnGg8p6Ik2I67yfxC7ANuV5M=; b=YCjrAOGj6xJrac
	vpOM4ySBTVAvD+/4uZ10PPTIsgP5hKq4Upwkf/RzXa9Ts8qKyQpXXiNqdnsD2J4ONiUEti9PikeBt
	SMVWi0HTUOp8hFLd0by8UJpCUMlXfbGVLcx4rPPsgGpucoCdiaqUtLxRt2UG7qjc9x4kMu91/cEfS
	gNouEwsXoFgMTAW8TngK7uH3qdgznQcONlRrl/k/HvaI2erTLEVLNDYFLgvv2Z+vQ5GRjeJeYFgWg
	N/+xuuwNKMb7Ve5u82Ya80KMA+oHzzTiB+7kNZ8e1J3dK/74Zau2fl4kfQGcEpLp5J4AIyGL8BCGt
	cmR/BQnJgECvEPOs6yJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSW-00000002hc3-3pXD;
	Fri, 16 Oct 2026 10:46:44 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSU-00000002ham-22Kk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:46:43 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48dee593f18so1069725f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147601; x=1792752401; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uTBIuaJ6iARLuZWV7QgcnGg8p6Ik2I67yfxC7ANuV5M=;
        b=DeXoeOu55rBO42LW5GCEWvs/O0SEYu0ndY13cyzTAGGtEvk65qYmNmftJBNQ8OBuMw
         2K53XWZdoazozvFAk5WynbqpJoIq7SHu0EKBtU9qqGPel0NzuLAWkelSbT6Hv8K7yo4L
         4MDdy3IlU/d8r4R/f2MEtVrgm2zM/iySQ0pKPhhKcMFH1NWRzA0m23+PkzmwaTv9iPR8
         5nt0ul3XoRyRuU5APHNAmMDfAuVsbKf4XKBPmTQFNqhKLyKbPt4L5c73+t0XuIfpsVTg
         iMaskf1kiD/iMvNv8bCI1djAUCbZzeLPtuKHwpTS4RrHF0F5A7L9WODeCisrz7xxwNNi
         F3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147601; x=1792752401;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uTBIuaJ6iARLuZWV7QgcnGg8p6Ik2I67yfxC7ANuV5M=;
        b=UbAvREwG3Oep8929tYYO1gd4fuytYEmcX5YKpq5CAOsIe+VfzoMwJ8m/f7xPOF7f49
         aDsK6sO7wtH+RGbXCD4vAQ/m7UxCnB5KsusmjpMjQzrSPMJLIXZ7GyaghAp9Lq29vQ22
         x4OcIFP4mdMg5OiuPzRhlmvwB98laDFIm/c2VwLo+zvP0j0nFPYYAo+A6iR5aUu2yOzF
         Z3346e4HbUAqiOOoGaNJ2L950cNjZjJe+YFfR7hg0dtzcptXPbcYMBsovGLUxd0TWVWO
         FkTtOjCVbMnXADXxJAtwIq7+qfS1W04pz9NmZ7L+3H4F7Skhvf5UvJdKQnQJKfUAGsUX
         lNOQ==
X-Forwarded-Encrypted: i=1; AKwUvBygSesJULhVOsBJUeM5SHZMr1aPdpgCRrSN0BZU9xE+XGP+rY8F1j03Xsy0CpIysNJ1oUI/ucVwm6oy/htcLn/7@lists.infradead.org
X-Gm-Message-State: AFq9FYKthEdn5Y9a++YxMzR0V4s8srVghYmWNlcG92SGPCEjk8CFKvja
	K/4ojGmW3Af34igD+Qyw74PFZB5epJssxu6zOiBUUlP3VK+XvnRoXBfVUREn553V/Lw=
X-Gm-Gg: AYBFou0s5sH0IwV6Aa1MXyZYhXlVOldhoqedEugpT9KYcvkXu+Hxig/VdOS2YW5r2se
	x0knYTANhbTK/dY0McAqyV9GBXCYGcnQdC3c/CASx6grtJ0a75qNUHvJnY0Jd46bR6JJaKjUliP
	omzA1bvoX0CUCr41lJ3o3ehpyzB2KyYf56I1dmrBgJhdUZAxb41EtIW/AGWUHhQh99bGygnH5sm
	QSeFx+cZDryr0TJa4vaD7YUdZBsyF5BWglNljE5Ci4aqTtqybnRtsRWPgbIeYPHM1NhLSRLMQ1j
	/HpdsULFwkEO1ykCMTyqOP70CU6vm2iQetqgI4ePlAuNKK4zOl+kxY6skpK59eoMAXiU5/Zp9pT
	JlRwJIrYrkS9I1pLBdZiQgwNXCgB5bak7uH/hCJFp4ulCA3c7ryvR3Ub2UleTMZUX80RX0UxeqS
	ayMYo81rRBkuWknYg57XSEPL7YlsQpheGaj6m5nWTlmbMiz4v4+TJLsfCdrUa+fAgoJe5znUwjE
	Q==
X-Received: by 2002:a05:6000:400e:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-48dee35b532mr15189988f8f.8.1792147600645;
        Fri, 16 Oct 2026 03:46:40 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 00/10] coresight: Prevent per-thread events from sharing
 a sink
Date: Fri, 16 Oct 2026 11:46:10 +0100
Message-Id: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHMA0moC/5XPTQrCMBAF4KtI1o4kaZq0rryHuIjNtI30j6QGp
 fTupgVBcVHcDLxZfG9mIh6dRU+Ou4k4DNbbvotB7HekqHVXIVgTM+GUS6poBjfdoofCQ3tvRjs
 0CAM6GGuH2nhAwwxP41SJINEYHJb2sfrnS8y19WPvnmtdYMv2LecbcmBAwSSZQGmEUro4NbbTr
 j/0riILHfhfHI8co7qIktQlvf5wyQfHt/4OSeSkRlSpyktmvq+b5/kFNDipk2kBAAA=
X-Change-ID: 20260708-james-cs-multiple-per-threads-ed1d25ed1734
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_034642_602460_59C9AE6C 
X-CRM114-Status: GOOD (  15.47  )
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

Fix it by determining if sharing can happen at setup time. Then remove
everywhere the same PID checking logic was copy pasted in each sink.

The first three patches fix configuration initialization, AUX cleanup
and topology locking. The remaining patches enforce the sharing rules
and simplify the sink drivers.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v4:
- Count CPU sources in the registered topology and retain each sink's
  sharing classification until its last AUX session ends.
- Serialize AUX topology access and provide locked and locking path
  release functions.
- Reject unexpected path setup errors while retaining silent skips for
  missing ETMs and unreachable sinks.
- Prevent all problematic sharing cases at aux setup rather than at
  runtime. (Leo)
- Drop "coresight: tmc-etr: Don't stop Perf cleanup for active sysfs
  reads". It was a pre-existing bug and is even more unrelated now with
  the new model.
- Remove workqueue rather than fix the lifecycle, its no longer
  needed. (Leo)
- Add a getter for the config manager, cscfg_get_state(). (Leo)
- Link to v3: https://lore.kernel.org/r/20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org

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
James Clark (10):
      coresight: configfs: Don't assume active until cscfg_mgr is set
      coresight: etm-perf: Remove workqueue for freeing AUX data
      coresight: etm-perf: Serialize AUX topology access
      coresight: etm-perf: Reject event if building path fails
      coresight: etm-perf: Prevent sink sharing at setup time
      coresight: tmc-etr: Reflect new sharing rules in allocator
      coresight: tmc-etr: Remove sharing guards from ETR
      coresight: tmc-etf: Remove sharing guards from ETF
      coresight: etb10: Remove sharing guards from ETB10
      coresight: ultrasoc-smb: Remove sharing guards from SMB

 drivers/hwtracing/coresight/coresight-core.c     | 104 +++++++++++++++--
 drivers/hwtracing/coresight/coresight-etb10.c    |  28 +----
 drivers/hwtracing/coresight/coresight-etm-perf.c | 119 ++++++++++---------
 drivers/hwtracing/coresight/coresight-etm-perf.h |   2 -
 drivers/hwtracing/coresight/coresight-priv.h     |   4 +-
 drivers/hwtracing/coresight/coresight-syscfg.c   |  11 +-
 drivers/hwtracing/coresight/coresight-sysfs.c    |   4 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c |   6 +-
 drivers/hwtracing/coresight/coresight-tmc-etf.c  |  22 +---
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 142 +++++++----------------
 drivers/hwtracing/coresight/coresight-tmc.h      |  16 +--
 drivers/hwtracing/coresight/coresight-trace-id.c |  97 ++++++++++++++--
 drivers/hwtracing/coresight/coresight-trace-id.h |  26 +++--
 drivers/hwtracing/coresight/ultrasoc-smb.c       |  20 +---
 drivers/hwtracing/coresight/ultrasoc-smb.h       |   3 -
 include/linux/coresight.h                        |  26 ++++-
 16 files changed, 346 insertions(+), 284 deletions(-)
---
base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
change-id: 20260708-james-cs-multiple-per-threads-ed1d25ed1734

Best regards,
--  
James Clark <james.clark@linaro.org>


