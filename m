Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE21C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3m3SP6e9NrbIRaMkWtj1uZEt6uHgAf5jXfUplg45r+k=; b=SsNfJz0vxxaXUFw5bAk0MtI3cD
	DErxfmHNxsOgWRyZUf5GAQMvv6EDchTdRIbyPcQUL9ohJP1c8S7fEnOZMH/bHoAOmG0XZri2LRPYW
	+yrnOfNh80Q3UD4JQxq+bRWhSsN4k4GITlGWIAYPvp6z8DRvDdBa3s7jBfsFfdVZ2hzO0MCEtVU2+
	3Z9UTuoodXS8BbXlKhI8yNkfY3UPa9Qi/Kh9e4NX4X5ZL5OWB/YPuyNvqMjABmBd9vF7SWbkj1uhJ
	lOWp14cleIA2npz6ZX9Gify0P2eDPI5gvP3dV/J9pxZupd4SyiSSbAcajJcB0+eQEJgJtW2HGbfsj
	JP8kwZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64BZ-00000003B8g-0gLm;
	Mon, 14 Sep 2026 10:45:17 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64BV-00000003B89-3JkV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:45:15 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-86b90133ae8so1442133b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789382712; x=1789987512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3m3SP6e9NrbIRaMkWtj1uZEt6uHgAf5jXfUplg45r+k=;
        b=rSLALEm5Qy7g8za2tIR+ABo/yzG6mGge7JiSSceZVR3jvIitfunMeoMmQj5Xy5CA19
         e9rpztP393bTHq5Fc1JVgKeQptJFdtQBa3VBHlIIeBXbBMRUXGn1B8dpQkWji0i6zPC2
         MD0KKOEyrMNNwcVBKUH/vNNjgyOSWbYgzV1Ma8Xdw7DFvGiQ43O0IlzJcIZGvhMWlD+v
         pIbQ5rRnGKrxhZfbE/4WGk2L1OPLI/dSBqjxXGFxm/MXY6dbPMExcoxwgIeuLRFAgHl6
         iSMH1vUi61Vqgxf6fOZrH9rzJkFTbuY4J9LTCNgUtzIoncR8/8PxRru4dXRCL/ZI+csn
         0B8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382712; x=1789987512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3m3SP6e9NrbIRaMkWtj1uZEt6uHgAf5jXfUplg45r+k=;
        b=WlpzwzI5cbblDgDcfHmopNd+N4IbmtzcN5d9vKteNnW7esF9rh7zPQk0y6Syv9DNT6
         ok8pykNEJQBOaRCh+k8878tYhub/PrpDTuLObAMAcqi48wDoI1uQ432DoYRIxkypCau0
         EArRs2dPdiC6UPFHM2uoo2omUndG+YonzSrz6PKU/79ZlcYgJy8Dn16f4UEvDtk3jfrf
         35uyrn+2QaXTh6uBT3gb3KwsjZgADsf48aScSEcE+4Rr5CJoaGQa3WlqPyeQJcCgblBV
         7TN8JZy90oKM0SU/Ocr8Rf560kndMyjHaTGhGJebBBmTigtFVGKK/eohPE8umSyTNHYB
         JFsQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0jPaY5qRSs9Uowqx9QI/3DJXp7FEvtFtCoToV2Bn/Ob9dy8m+pBuyZDW9TndHS04f26idnQjfvk34OdCYLsnL@lists.infradead.org
X-Gm-Message-State: AFuF++nt5RHKMrCjSchvO6wYKTs6dwRioyy0vpUI96MLLoIF73hiaMlG
	ugOxAc1PEo74mjngC1jWuJlQicIGptbi7P4cGTwW6X3P2lpietumETHM
X-Gm-Gg: AYBFou1CHDLKp+JYckxqnlfa8G2bXELXDTlVbkxIhmtdS0Iuh+KrvuN/Vo6Na5RlnkZ
	bqCL4xr8UakuN1eIqa+d2kgK9hd1r0mklNVldSB6wqgk83+DhbioICKjq90ksL7ucyxTUsXMcJ4
	1B94zpUYqLFR29l4Ww3PgiU1Z5v/V2dAoOyik88pZEeagZ7gwgQYwgG2U87Zy1x+jSQqSp98OuE
	71Y30XGcyJNtDlgRk/2p285F2M5B1wskelo8md0C7+yBjZkJJu14QF3AAvA8u3t7lvsXGWGP/gB
	J39RE+YOAvMItMHZuqYC4GUWl2XkTm+5xJR6z0viZl53DQElou5eMSgKgM0ektK5EGSxyJ2r4Ed
	NiYd6lF9jwzy+q8IxO5F9i9mRc0P3cJQf8ky3cmMUiID79q44ezguWY/Hw6mAounN0PkVdvbt0v
	oNXhZi/Un5LVNcZimFLWD8D25GW1AbWKnsWxjI17Wgvmx/c9NvxESiDBSIa9jYWSxtXG5sIMHQE
	9UWSo1pdecwUwF8IFuh+O94f/LJS2oFYKk1D1KohfA3KTcGlhMCNs3codFtyxHLAt1pyLxV/81R
	B3O5FUsSrFzf/v/0DURf8gi1ocPRCL6waidtdN1NdRC7YVJSPy53d1HznIc55cE=
X-Received: by 2002:a05:6a00:21c2:b0:857:7384:b5fd with SMTP id d2e1a72fcca58-86f8737ced2mr3809414b3a.25.1789382712304;
        Mon, 14 Sep 2026 03:45:12 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b28fd0e0dsm4234386b3a.26.2026.09.14.03.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:11 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-api@vger.kernel.org,
	Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org,
	Karel Zak <kzak@redhat.com>,
	util-linux@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH 0/3] mm/swap: reserve swap areas for deliberate offload
Date: Mon, 14 Sep 2026 18:44:58 +0800
Message-ID: <20260914104501.3960616-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_034513_842724_D7EAB238 
X-CRM114-Status: GOOD (  18.45  )
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

Some swap backends are useful for deliberate cold-page offload but are poor
dependencies for ordinary reclaim under acute memory pressure. Swap on ZFS
zvols is an existing example, with documented deadlocks under memory
pressure [3]. Compressed swap is another attractive target: accepting a
write may require memory for compression or storage even when logical swap
slots remain free.

This series adds an offload-only swap-area policy for such deployments,
alongside a conventional swap reserve for pressure reclaim.

Proactive offloading is already established by TMO/Senpai [4], which uses
pressure feedback to offload cold pages to compressed memory or SSDs.
DAMON_RECLAIM [5] also uses free-memory watermarks to suspend proactive
reclaim under severe pressure. These control when reclaim runs; this RFC
restricts which swap areas ordinary reclaim may write, including through
retained swap entries. The existing memory.zswap.writeback control [6]
restricts backing-swap writes per cgroup, rather than reserving individual
swap areas for explicitly admitted offload.

The minimum contract is that ordinary reclaim must not initiate a new,
non-zero backend write to an offload-only area. Reads, swapoff, zero-page
metadata, architecture preparation, and I/O that was already admitted remain
valid. If no eligible swap remains, existing reclaim and OOM behaviour applies.
This RFC does not promise a performance result or define a new workload policy.

Cgroup v2 memory.reclaim and per-node reclaim establish admission. Manual
MGLRU eviction currently does too, but its debugfs interface is not stable
ABI. Ordinary direct reclaim, kswapd, MADV_PAGEOUT and DAMON reclaim do not
gain access. This is an explicit operator policy; the kernel does not measure
physical headroom or automatically classify backends.

The three patches are based on mm-new as refreshed on 11 September, at
995829088503:

1. The complete swap-area policy, including eligible-capacity accounting and
   recovery of eligible cache entries.
2. zram03/zram04 coverage for reclaim routing, zswap bypass, discard policy
   and file workingset activation.
3. zram05 coverage for retained swap entries, including ordinary-write
   refusal, proactive recovery, data integrity and checked teardown.

The implementation is intended to make these questions reviewable:

1. Should pressure eligibility be a durable property activated with the
   physical swap area, or should it be selected late during backend migration?
2. Do provenance, allocation filtering, eligible capacity, and retained-entry
   refusal provide a useful minimum contract for userspace and controllers?
3. Is redirtying or activating a retained dirty folio, with possible churn or
   OOM, acceptable, or is backend migration a prerequisite?
4. How should persistent activation fail closed and remain auditable when
   /proc/swaps and swapon --show do not expose the policy?
5. Should an ineligible fast-path cluster be invalidated immediately, and
   should an offload-only area recover its own cache entries based on eligible
   fullness rather than global swap fullness?
6. Should the workingset activation heuristic continue to count offload-only
   capacity when pressure reclaim cannot allocate from it?

Build checks passed on x86 with i915 built-in or modular, and with swap or
memory cgroups disabled. The affected arm64 MTE objects also compiled.

The routing and workingset tests passed in x86 QEMU guests. In the
retained-entry test, ordinary reclaim wrote nothing to offload-only swap;
proactive reclaim then wrote the dirty folio, and all data verified
correctly. With the write guard removed, the same test failed because
ordinary reclaim wrote to the offload-only area.

Persistent fstab encoding remains unsettled. When hibernation is about to
save an image, an active offload-only area named by resume= is rejected as
the image target with -ENODEV. Virtual Swap Space v4 [1] separates swap
entries from their physical backing, while swap tiers v10 [2] proposes
per-cgroup backend selection. These raise the question of whether offload
eligibility belongs to physical swap areas or a later placement decision;
this RFC does not assume those interfaces are settled.

An explicit-only util-linux companion implementing swapon --offload-only
is prepared for separate submission.

Feedback on the eligibility contract, its placement in the swap stack,
and the unresolved ABI and reclaim-policy questions would be welcome.

[1] https://patchew.org/linux/20260825153238.2695446-1-nphamcs@gmail.com/
[2] https://patchew.org/linux/20260713025644.170839-1-youngjun.park@lge.com/
[3] https://openzfs.github.io/openzfs-docs/Project%20and%20Community/FAQ.html#using-a-zvol-for-a-swap-device-on-linux
[4] https://engineering.fb.com/2022/06/20/data-infrastructure/transparent-memory-offloading-more-memory-at-a-fraction-of-the-cost-and-power/
[5] https://www.kernel.org/doc/html/latest/admin-guide/mm/damon/reclaim.html
[6] https://www.kernel.org/doc/html/latest/admin-guide/mm/zswap.html

Matthias Goergens (3):
  mm: restrict offload-only swap to proactive reclaim
  selftests: zram: cover offload-only swap policy
  selftests: zram: cover retained offload-only entries

 Documentation/mm/swap.rst                     |  87 ++++
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |   2 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   6 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |   2 +-
 drivers/gpu/drm/panthor/panthor_gem.c         |   2 +-
 drivers/gpu/drm/ttm/ttm_backup.c              |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |   2 +-
 include/linux/swap.h                          |  29 +-
 include/linux/vm_event_item.h                 |   1 +
 mm/memcontrol.c                               |  20 +-
 mm/page_io.c                                  |  24 +-
 mm/swapfile.c                                 | 126 +++++-
 mm/vmscan.c                                   |  31 +-
 mm/vmstat.c                                   |   1 +
 tools/testing/selftests/zram/.gitignore       |   2 +
 tools/testing/selftests/zram/Makefile         |   4 +-
 tools/testing/selftests/zram/config           |  10 +-
 tools/testing/selftests/zram/swap_offload.c   | 402 ++++++++++++++++++
 .../selftests/zram/workingset_offload.c       | 206 +++++++++
 tools/testing/selftests/zram/zram03.sh        | 166 ++++++++
 tools/testing/selftests/zram/zram04.sh        | 149 +++++++
 tools/testing/selftests/zram/zram05.sh        | 360 ++++++++++++++++
 tools/testing/selftests/zram/zram_lib.sh      |  28 ++
 23 files changed, 1620 insertions(+), 42 deletions(-)
 create mode 100644 tools/testing/selftests/zram/swap_offload.c
 create mode 100644 tools/testing/selftests/zram/workingset_offload.c
 create mode 100755 tools/testing/selftests/zram/zram03.sh
 create mode 100755 tools/testing/selftests/zram/zram04.sh
 create mode 100755 tools/testing/selftests/zram/zram05.sh


base-commit: 9958290885035431e2494159f555e332c3c14906
-- 
2.55.0


