Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B78C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 04:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lez8Lh9LK2IJV3Lg+4+qOHMKMvDRPEZgp+OMdBxRRpI=; b=Z/xotz7OM1Q+6107QIiwiIDG86
	QuFuPMnYzEpqofDg31P2kFdAqCUCtYojocz1ciU4u8WaW5Kb71LDVbwENLj83qz4vKX+MPOLIA98O
	NP4ZTrbK8SMowtXOgQXZ+q2aqa1R+1PWTfg5EaEg0hgZNLednggRxRn9pT166NmzYZAevEN6xFnHW
	UYBJGNxQtwiESpZtIZqss3yw/14I8Br67wpev3P/srBKsB6cDZDisz34jsOZrZNccQBYn8ye91Nsd
	19FujMvmpvobZ4L6yIkfiYpFyJOCvBsfnwKaMV0AG7fF2IqlOYtNFOuEiIqsoa4KITuh8BnpJzua0
	rcxlgSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKRj-0000000Eywu-0vxU;
	Sat, 26 Sep 2026 04:55:35 +0000
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKRe-0000000EywW-2TDy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 04:55:33 +0000
Received: by mail-dl2-x0f.google.com with SMTP id a92af1059eb24-1438e88300cso1319794c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 21:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790398529; x=1791003329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lez8Lh9LK2IJV3Lg+4+qOHMKMvDRPEZgp+OMdBxRRpI=;
        b=KDAM3nScZq+0xBXdF5h8QM3pEKN5rfnuBQTD4zB8mSrtFPD5gvL8yu5WkB40VRTlgr
         sUpSnswxLGQJIlOjJvhGNYcYMyokb1f0V1iofENUJOwJ2Uza/sCq/c3RPYyyJvH4N7R/
         lqaXzL2omTCNuC3UxpOEeP277ETxzJGkjEOgtOg+x94/0xGC6KPMLgm5yr+iGFurWdOh
         KDz/fz4zIaB2fyBlfRt89FgI42LVzOXgJD9yVJ/WAWJQU7H0TEPQfBACQnPbIsch+hLT
         MCNb9Ux8i2A5M9HsgdDtVfykIeu8UReNR1cwcb6w4quUxB+X53Ccg0BuT2gSYPN3uEg+
         K8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790398529; x=1791003329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lez8Lh9LK2IJV3Lg+4+qOHMKMvDRPEZgp+OMdBxRRpI=;
        b=CT5bEEaA7OzcPM+wGnLK7RyJkwL/HDnSGtGywY+Q6qcyu8aUJhMHg2UVFqqYZM0W0u
         vAlLUSUygT35fbVA87QheEQTTNrbC6OLXVUKz2JSwoO0LqxxJrTXndHd14lj4Ws5CAx0
         VfSEKJcf5vAHjNRHBTgfTC3ziGziBtMhOPR/IACsSIVf6rEBmhovhCsPP25N+/+h4pke
         r3yYAA3A9+4r7TPJtmkNgp1EOHYFJZ2uk9R+hO8aCqUalevhCLoRVU+4b0Fu+EQat8P9
         5CMkzOBmosKSwROkruKWV6Hi/EQiLJHaKqmXv4ebw97AH71fgyhrg8rUn0M+ss0by2lN
         TA9w==
X-Forwarded-Encrypted: i=1; AKwUvByqzQafiz8maEmOJZN62KqZbkAGqyab97lrET4aKzric8irKp0bKxwbS3tW8cj/9GnZ+ieay+PizZj8Q+vjOk6B@lists.infradead.org
X-Gm-Message-State: AFuF++kvRPuqNBLuyzxSkH+sepXl+80nU9SzqUf45Og6PlpaKZQ6ZYpD
	seCq5zzBmnt8DjxhW4JWUpm0qsVf0oZElkjPwgpbi0NMD/ZrLlkmJkyE
X-Gm-Gg: AYBFou3NXn5imMVOCy7sX9i49LnXnzAH3K2nSkKGvjMCO1YB43os0/GjLG6aPsXr/NX
	GCMVSEXIMN2G27B9qQNhk9XWxqnH+SvBCeHyEEuiBZBu7CLLHoi+VxRbFq9bHR9wn05Mr1XHiqE
	BKugRDrueaOyKU6OOSeIIGGqKJduyiSpvkfQxjBmq3fcEn5omxqLYdCdXiCoTPrgxl5OCzMmxhf
	bnJlxBKKUWRq5XA2jEH479Jxxmp7yIlnj2xbtLfx8TQ1JaRhwJgU6CkRKJmtTKV2p0x+JD78jc0
	zaYizQq3woEAT4MERHF/AZyuW8+fDstxPuHm17U7wwx6DkFOiD6jJKAP0Yh7stZhAVnGJY+qVyN
	gkIjEb67jIJ0Yvz659t395Nhl7pafUezLg4C4MHusP7Q/dKo3M5R7LWXGXaP0OYXPAe1hDqI4Bt
	9HfnP4Q9JABN8ASiAaHMvR7uOs+JksKBvsWFAMthVp9anqwZTb7ts2MdtjO9l8eHlZ8vsh1iaOz
	XlM5cRpxq09Gm27K83qCEOiz0Ac/rX2rtmKORpVpWZtTbvvqlQBasGmHU33UbyDVkWcRCy1X9jy
	+0WVK1bcrTNDEjcCJvb4UXOmLNmEFw7wloHrrqawsrUfkz2zCsrJjB7n+w8=
X-Received: by 2002:a05:701b:4354:b0:143:8865:cca with SMTP id a92af1059eb24-146cfdcf390mr1703579c88.22.1790398527862;
        Fri, 25 Sep 2026 21:55:27 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adcc5b00sm9334211c88.15.2026.09.25.21.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:55:27 -0700 (PDT)
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
Subject: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate offload
Date: Sat, 26 Sep 2026 12:55:13 +0800
Message-ID: <20260926045517.3458413-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_215530_672250_F20A7E54 
X-CRM114-Status: GOOD (  15.05  )
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

This RFC adds offload-only swap areas for deliberate cold-page offload to
backends unsuitable for pressure reclaim. ZFS zvol swap has documented
deadlocks under memory pressure [3]; compressed swap is another target
because writes may need memory despite free logical slots.

Explicit proactive reclaim can use these areas alongside conventional
swap, ordered by priority. Ordinary reclaim cannot initiate non-zero
writes to them, including through retained swap entries. Conventional
capacity is not reserved for emergencies. Operators choose the policy;
the kernel does not measure headroom or make an allocating backend safe.

TMO/Senpai [4] and DAMON_RECLAIM [5] are related cold-page reclaim
approaches. This RFC admits offload-only swap through memory.reclaim and
per-node reclaim, but not DAMON. Other related work includes per-cgroup
zswap writeback control [6], Virtual Swap Space v4 [1] and swap tiers v10
[2].

The util-linux companion [8] proposes swapon --offload-only and an fstab
option. Older swapon silently ignores the fstab token, so persistent
activation needs discussion. Apply the separate i915 fix [9] first to avoid
a pre-existing folio-lock leak when shmem writeback is skipped.

The series fixes zram selftest device tracking and error reporting, adds
the swap policy with DRM eligibility checks, and tests routing, workingset
activation and retained-entry write refusal. It is based on mm-new at
995829088503.

Feedback is particularly welcome on:

- Activation-time eligibility versus backend placement or migration:
  is retained-entry refusal, with possible reclaim churn or OOM,
  acceptable without migration?
- Eligible-capacity accounting, including overcommit limits and OOM
  scoring; cache recovery, cluster invalidation and workingset activation.
- Persistent activation and visibility: current swap listings do not
  expose the policy.

Validation includes x86 builds, affected arm64 MTE objects and builds
without swap or memory cgroups. QEMU tests covered routing, retained-entry
recovery, data integrity and cleanup, with negative controls for write
refusal and teardown failure.

I have also been using this policy on my own machine with experimental
bcachefs swap support, with no problems observed so far. Deliberate stress
testing is confined to VMs; I do not deliberately stress-test this machine.

Changes since v1, incorporating Sashiko's public review [7]:

- Improve selftest isolation, retained-swap measurement and memlock skips.
- Track allocated zram devices, wait for udev probes and report cleanup
  errors without deleting data through a mount that could not be released.
- Clarify activation, capacity reporting and conventional fallback limits.

[1] https://patchew.org/linux/20260825153238.2695446-1-nphamcs@gmail.com/
[2] https://patchew.org/linux/20260713025644.170839-1-youngjun.park@lge.com/
[3] https://openzfs.github.io/openzfs-docs/Project%20and%20Community/FAQ.html#using-a-zvol-for-a-swap-device-on-linux
[4] https://engineering.fb.com/2022/06/20/data-infrastructure/transparent-memory-offloading-more-memory-at-a-fraction-of-the-cost-and-power/
[5] https://www.kernel.org/doc/html/latest/admin-guide/mm/damon/reclaim.html
[6] https://www.kernel.org/doc/html/latest/admin-guide/mm/zswap.html
[7] https://sashiko.dev/#/patchset/20260914104501.3960616-1-matthias.goergens@gmail.com
[8] https://github.com/util-linux/util-linux/pull/4633
[9] https://lore.kernel.org/all/20260914105606.3997649-1-matthias.goergens@gmail.com/

v1: https://lore.kernel.org/all/20260914104501.3960616-1-matthias.goergens@gmail.com/

Matthias Goergens (4):
  selftests: zram: track owned devices and report cleanup failures
  mm: restrict offload-only swap to proactive reclaim
  selftests: zram: cover offload-only swap policy
  selftests: zram: cover retained offload-only entries

 Documentation/mm/swap.rst                     | 105 ++++
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
 mm/swapfile.c                                 | 123 ++++-
 mm/vmscan.c                                   |  31 +-
 mm/vmstat.c                                   |   1 +
 tools/testing/selftests/zram/.gitignore       |   2 +
 tools/testing/selftests/zram/Makefile         |   4 +-
 tools/testing/selftests/zram/README           |  20 +-
 tools/testing/selftests/zram/config           |  10 +-
 tools/testing/selftests/zram/settings         |   1 +
 tools/testing/selftests/zram/swap_offload.c   | 425 +++++++++++++++++
 .../selftests/zram/workingset_offload.c       | 207 ++++++++
 tools/testing/selftests/zram/zram.sh          |   9 +
 tools/testing/selftests/zram/zram01.sh        |   9 +-
 tools/testing/selftests/zram/zram02.sh        |   9 +-
 tools/testing/selftests/zram/zram03.sh        | 174 +++++++
 tools/testing/selftests/zram/zram04.sh        | 164 +++++++
 tools/testing/selftests/zram/zram05.sh        | 447 ++++++++++++++++++
 tools/testing/selftests/zram/zram_lib.sh      | 189 ++++++--
 28 files changed, 1926 insertions(+), 94 deletions(-)
 create mode 100644 tools/testing/selftests/zram/settings
 create mode 100644 tools/testing/selftests/zram/swap_offload.c
 create mode 100644 tools/testing/selftests/zram/workingset_offload.c
 create mode 100755 tools/testing/selftests/zram/zram03.sh
 create mode 100755 tools/testing/selftests/zram/zram04.sh
 create mode 100755 tools/testing/selftests/zram/zram05.sh

-- 
2.55.0


