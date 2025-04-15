Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FF8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 18:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fgz6+kp7zmkPoRijrNzRHRYa9N8E/CF3R4uqgGXI6Oo=; b=ysCkX8dhhoXF/sI5ksMoHsg6ls
	bQVLzbJtVIcQVUjPSZ+HBUwdZwvts590fZOZTONbsfzrax+Sjmob/2wJJcmjKdlYN/wCJrVrBBCUy
	jdH82ML0NXqxPvi2xl91fBH5Mq1uHSlF6RHJmIZo9K6XMgEJIeMGGQYyrTEbE8fEDJ7dtHkJzVv+T
	uS+PdKro0e5/5QCKnF9CVjw+G7OTxf2bKPcQGm3AEYusJ+VJMrAsz5wegkxklp9sgTuuGLZNBNUZT
	yMRQYnCYygI6eBf9ROaKRV2CXctw6mBW2UR1ucJ9OK3BJfE8QcMc9/YWPFeesi47ejfsosAeMrA5F
	ufMJjWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lPF-00000006mdb-3nXQ;
	Tue, 15 Apr 2025 18:53:13 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lJ9-00000006lI8-1YSy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 18:46:56 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-739764217ecso4815096b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 11:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744742813; x=1745347613; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fgz6+kp7zmkPoRijrNzRHRYa9N8E/CF3R4uqgGXI6Oo=;
        b=sj6z82gqR6/Hc1/hppoybs7j9h7wMcX0gnc90q5Ughv7/Dk/7hmgDoGBRpt/iTaDWd
         IAVwkfzaXnZRZow+LbQRpvqecaZgjJc45OqN5BPLAZA6kcuPMCWuuGHo9iGBPurr4C22
         FTpEL83qMLiM8hkWj9luPH0ZI+OjJgakp/awW/fZxLlXYlBYoAAmWhSDvsckmPsUT54D
         J/eQZQ0vRvh8xt+XWN+b9FT6ZPqtP7KwFa68AeFdzjYHitxVu9N/jkIcS3G21ujrw98F
         tVwvChRRHIs9KXGelPpFxGuDDT1gCfsv4afXTUc362gR9ojl5M52dJRb4Muc9+S5HyQv
         js3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742813; x=1745347613;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fgz6+kp7zmkPoRijrNzRHRYa9N8E/CF3R4uqgGXI6Oo=;
        b=OT8CurS4WlX4AADMxmGg/ZYVLnIEiD52eEVZRkM6WOHF09redaYP/6FnM/t0gG4EcI
         JndIOajd6FCWjFNdbNQq73UUucYwmSt4AujKjWMKzDfRXi9K8MR8R7ju6BxxC4WGFYOc
         LXiTB5YEknAw9TH4/ntK/dMYku22gnQBiCj6QAUUt/coTpBM4nnhrW0omWKCMN/Kf0hZ
         vXHXGHOgUFYNQaWyP4pNbavlGn2twIkaVjEVFGM3lORA2lJN7g8YLfAEDvyNRffT8TsH
         j+4MiJcUPQKrM00iulttv5sBql0kvuBrvTOcvWVCFXeMf8QMsUMca2hw2n2QIxSlN981
         kR4A==
X-Forwarded-Encrypted: i=1; AJvYcCUBzPg/q8Sqi+nQiO7SmmV85mgeGwwqjzUVj/IlwnrZ/eRdxGHxNRzEVgKOQPTOLO3tyoPHQXfx6wY0AC1VzgUK@lists.infradead.org
X-Gm-Message-State: AOJu0YxonthiXeWyhPhsacY2ohpdXNNsnU+ZWyY2gwcUc4YU4i2j1MKF
	DLmNhEka998Ug1IKKAToarDuw2P68Mhsyg2+dQSqrLXnaGTAzpw3w6GpWVBFNWC4ZoV+YODhxxR
	3
X-Google-Smtp-Source: AGHT+IGx2Sd7l0abLi4M5LJHhB/6edJNncexmpdJ3vQ/ErAmhZ56SDxQzSgIYjGBmp0jsI4y+fZ2tJEj3Dc=
X-Received: from pfcf21.prod.google.com ([2002:a05:6a00:2395:b0:737:30c9:fe46])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b16:b0:728:f21b:ce4c
 with SMTP id d2e1a72fcca58-73c1f92f43dmr1026521b3a.5.1744742813607; Tue, 15
 Apr 2025 11:46:53 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:46:47 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250415184649.356683-1-yabinc@google.com>
Subject: [PATCH v4 0/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_114655_410772_8FC8B0B9 
X-CRM114-Status: GOOD (  12.43  )
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

Hi Coresight maintainers,

When tracing ETM data on multiple CPUs concurrently via the
perf interface, the CATU device is shared across different CPU
paths. This can lead to race conditions when multiple CPUs attempt
to enable or disable the CATU device simultaneously. This patchset
is to fix race conditions when enabling/disabling a CATU device.

Changes since v3:
 - Add newlines between variable definition and guard().
 - Add path parameter when calling coresight_disable_helpers.
 - Use "goto err_disable_helpers" in coresight_enable_path().

Changes since v2:
- In catu_disable(), return 0 when refcnt > 0.
- Remove the patch checking enabled mode.
- Disable helpers at the places where a coresight device fails to
  enable.

Changes since v1:
- Use raw_spinlock_t and guard().
- Add a patch to check enabled mode.
- Add a patch to disable helpers when fails to enable a device.


Yabin Cui (2):
  coresight: catu: Introduce refcount and spinlock for
    enabling/disabling
  coresight: core: Disable helpers for devices that fail to enable

 drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
 drivers/hwtracing/coresight/coresight-catu.h |  1 +
 drivers/hwtracing/coresight/coresight-core.c | 10 +++++---
 3 files changed, 25 insertions(+), 11 deletions(-)

-- 
2.49.0.604.gff1f9ca942-goog


