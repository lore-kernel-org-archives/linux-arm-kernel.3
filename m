Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0D1CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NK9+MAufae3OUHglq3BxF1m5jq3s3djB2nPaLW09hjI=; b=DSWFrPet7Ra+yNtTvKn18XcZwu
	8hvyQUmMi4Jgs7zVwmE47BeVWUt7x8nK1hbhttHLOz7rsAZgOqNS5MeEa+1Rd6i23x5U3PrvrjoB4
	kTzcAyr/nXkKJ78aGllqvC+pE9UpAFSAnqdZD3aPUi0luj4vCSFZLeChOTK6RAQUGscWRgfgLsq8P
	D0ALZ7lt0EFR2ezWXGW25BPHUXkrUVhBJGF2YC/RL7H++4mOo9Tr1IuNIcgnMtyJXqiQI0Jh+YsNl
	T0+IZwz0fER0TDdyv+cDxXaCk0ERf4BOhx3zA8oOO0jT0o74WzprV5GK2GwPe+Z7FDOPQMZQTEw4i
	W+AphH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4xc-00000003EMt-2R0I;
	Wed, 27 May 2026 03:29:36 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4xZ-00000003ELN-0G2B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:29:34 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so4588171b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852571; x=1780457371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NK9+MAufae3OUHglq3BxF1m5jq3s3djB2nPaLW09hjI=;
        b=UwIUK1Jf9KWd+hU9vNM0qasrmwN6p8i9ixv2ur6xwQBUXcnHBW/r1zIDQnNuFCCsrE
         vTxoXumSv0jdt5RBtlU52tg9sWdSmd92vKZPFRjkG07aiIOLzLxUcHYQcXvzfofS3lD4
         Fqmn72taG9nvyoe2OWJO0UjtKxhmx9fZ3ResVDGFoBebvCBWPZeDj+/SwnSu7/S8b5Nk
         rwz+pttkBXiVpnvbg+IueZrBIHLgtsQUlMqIQvaueuSYAX38dimUbZGK88zbxIKe/mI4
         49DPSHIUGjV6ohmeEJ4luFdfgfdoz17OcZA2n5NZZifmwTye6gsHa6Rx+SebgIPkMRV9
         ZF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852571; x=1780457371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK9+MAufae3OUHglq3BxF1m5jq3s3djB2nPaLW09hjI=;
        b=BYrKAXz/PMAe+ej9TxYvqpvezkiXS+S9bTrLruWDHLAtbc/CFysYNzzlAHbAEJWTbM
         kZtRsxsYfJWVzjvnMrtH3Gk0r6gEPitqSV9iL8jbxxWgiS2cs99Ru7ftI2sdAMSWznNZ
         xWyte58jBvstow+1dhdhVjTgkWcu7bzagTcKjG5ysKDyleaeug5bNoRViWvC2t9yi7xZ
         +kJtodeMZvru6MLbYBPsBcvHFalcd75fQkXjvnm2/6edZbQX2uXu+hZW4VC5psB4Ds77
         e/uiyb4FM1zz3fl3NUBjbbZxPhqDx85M52cVUnqcktlyJT/hN6zdABgFIZdV2uKhyH1k
         PGOg==
X-Gm-Message-State: AOJu0YxaVXDK4fi8Yl747IKRUgy8b/6187DK+/Zvobrjoq3sAQ0Zid/e
	W1UrapFTlcqVEnHt2Xgxpua4vpTdT0FqSJ0RyNGmWenMSyFSu+4o6r5LK+GFxufd3U8WHA==
X-Gm-Gg: Acq92OGbn2tnvRe0+3lDltq4f4exfkzsvsKd0xz6HmUAzsRLlBE+9NM6R9ujH4I323U
	7orKrCahrt6aubxQ+8x28XDyK43NDvGWjyUexPfE7WcG/ih2dX63MVChEthvb0CNRUpcc5VqUbP
	JNsy9j0j0IP9lxeVgnjf1/D9xi4CtsN++v+WEvb+X6oTvrcWa6dy47LgyPdxjcv4JkCkXrSnO7r
	dVCot8D2VW8auknS+ADIqDtwTNSrizbLLoCunrbawUR2mt7i/l3cCMf2Z7pZ5toBSRxFK/hehUK
	HNRkp1m81wddzpCALvyXQk55buOML7K56EBDOCjNjjshPWYm9F3Psy220EzIvW2ido448/fnPAf
	HrvxD+Ksi7bVz4ALQxdklkpe0lQdgZ4glpHV5+m955vsGddxYWgb1ZOG/pYJJs4kAQocoPvqCjK
	89vJgyoPWFd2egAQWmabioOifJ5uWRLlIRA0ps/s7+YJlTiUg=
X-Received: by 2002:a05:6a00:4f94:b0:82c:6da7:2d3d with SMTP id d2e1a72fcca58-8415f3d0e36mr19286959b3a.11.1779852571354;
        Tue, 26 May 2026 20:29:31 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:30 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 00/11] kdump: reduce vmcore size and capture time
Date: Wed, 27 May 2026 11:29:06 +0800
Message-ID: <20260527032917.3385849-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_202933_095217_C43E61D7 
X-CRM114-Status: GOOD (  12.84  )
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

From: Wandun Chen <chenwandun@lixiang.com>

On SoCs that carve out large firmware-owned reserved memory (GPU
firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
those carveouts as part of system RAM even though their contents are
firmware state that is not useful for kernel crash analysis.

This series introduces an opt-in 'dumpable' flag [1] on struct
reserved_mem and uses it to filter the elfcorehdr PT_LOAD ranges on
DT-based architectures (arm64, riscv, loongarch). By default reserved
regions are treated as non-dumpable; CMA regions are explicitly opted
in because their pages are returned to the buddy allocator and may
carry key crash-analysis data.

The series is organized as follows:
Patches 1-3: Pre-existing fixes and a small prep change.
Patches 4-5: Restructure to allow appending /memreserve/ entries.
Patches 6-7: Add a dumpable flag and append /memreserve/ entries.
Patch 8: Add generic kdump helpers.
Patches 9-11: Wire the helpers into arm64, riscv and loongarch kdump
              elfcorehdr preparation.

v2 --> v3:
1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.[2]
2. Fix UAF issue when alloc_reserved_mem_array() fails.
3. Add some prepare patches.

v1 --> v2:
1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
   feedback [1], v2 drop that property and exclude reserve memory
   by default.
2. Split some prepared patches from the original patches.
3. Address coding-style comments on patch 5 from Rob.

[1] https://lore.kernel.org/lkml/20260506144542.GA2072596-robh@kernel.org/
[2] https://sashiko.dev/#/patchset/20260520091844.592753-1-chenwandun%40lixiang.com?part=4

Wandun Chen (11):
  of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
  kexec/crash: provide crash_exclude_mem_range() stub when
    CONFIG_CRASH_DUMP=n
  of: reserved_mem: avoid post-init UAF when alloc_reserved_mem_array()
    fails
  of: reserved_mem: zero total_reserved_mem_cnt if no valid
    /reserved-memory entry
  of: reserved_mem: split alloc_reserved_mem_array() from
    fdt_scan_reserved_mem_late()
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: save /memreserve/ entries into the reserved_mem
    array
  of: reserved_mem: add kdump helpers to exclude non-dumpable regions
  arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
  riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
  loongarch: kdump: exclude non-dumpable reserved memory regions from
    vmcore

 arch/arm64/kernel/machine_kexec_file.c     |   6 ++
 arch/loongarch/kernel/machine_kexec_file.c |   6 ++
 arch/riscv/kernel/machine_kexec_file.c     |   4 +
 drivers/of/fdt.c                           |  11 +-
 drivers/of/of_private.h                    |   3 +
 drivers/of/of_reserved_mem.c               | 117 +++++++++++++++++++--
 include/linux/crash_core.h                 |   6 ++
 include/linux/of_reserved_mem.h            |  15 +++
 kernel/dma/contiguous.c                    |   1 +
 9 files changed, 157 insertions(+), 12 deletions(-)

-- 
2.43.0


