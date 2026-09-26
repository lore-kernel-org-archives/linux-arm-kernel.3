Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50E6C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 10:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuUo8zdKSoKE11B/ziniOjON7mdE/CfW6nfGNWVjAv0=; b=1b8g36A5RLmzJsk2D6hDmPepux
	5wgFWcvfkp9oVZMN9xC9g0613qN9Ry0caBUGQyMdAgi/qQBJl8ky7VL3xKGmbvKn1v9IRwhRKU/sF
	+LAAUQq2DxuU0YRPhP+owsJd+vSr2PjYhmZ+e9uH/nWdqdSDV1oMSbzZC7JQFKoX73ADTAWPIhlJz
	fuielLiQQjw945Lv2HGl1JGlCWAq2IVXokteCLs3/FhBslp3HkhGCXvqPIBd44YkvEn3/Pq5z99+1
	0kSmp7bonsXtt/SKpFtOZwZUxzbsbSZGBlQi15z1CpKczkf1b1khXkIdCXRJpmiv7hvQZSdVmmzpr
	fydoSvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAPSa-0000000FFsG-0OCF;
	Sat, 26 Sep 2026 10:16:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAPSV-0000000FFrp-1wC5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 10:16:46 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c2946aa0d5aso377340266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 03:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790417801; cv=none;
        d=google.com; s=arc-20260327;
        b=lhFSY+KbIxHa7i0oyiqz9mSHS7dADH8N6oeoZbv1TWu7MH2Z3rI+aaC0B9ogYKqQ92
         ZXp7kXapXFV4O7xB0geAN0UN/KAqFl4NLoc3ENXRSG8y5Awnq1eTtz7r1zAgylKl4B1Z
         O0Zz/N5lZjoeoQTGf0I3uYB9oiR06vGEg7K5j3MAGLfoFZkAD6hmFdiPQf0xvm9b5ciE
         4fidaMnTZC+x4siAF8KKZxKpTUNl+6TzTFETqEEQGzY1vDdyiqs3qTnsHpOemc318SDD
         rsKNieaAj4vGjzAJN7UTVhbvNN174q2KjCPO/+Al81AcNj/6n8yOo4Px6XmEDS4FcO4i
         fewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nuUo8zdKSoKE11B/ziniOjON7mdE/CfW6nfGNWVjAv0=;
        fh=W8PApDIdNI2m2fKylupxw2XqRSp7TPP7iFeso5JOuoc=;
        b=dWR/i9gwQlCT4qZXXu8TiJ1HaAFq9e38kmkuTQ42ezN+eQENb3bu2WEFcvXP1m2hVm
         Whc7BwUCBTpxrFvTt/fMg7+j2akid7hkLP+lU1en/JlRJS7svofN4Uo25VkhzCnYqno/
         qbngYgT8ZiI3DFaM0KbbSLMXf+rv5KS/7Ba4ydSmD5YeaKXvTf0KOtJB2MQt8md1xUBi
         maNJMaVz/pk8gxpNyydVe4BviD3KHkiCGYbx7FtlAsG9ns1MYobXNv3QZdhS5K5TxB06
         tRRqZsP3JX8EcB1SiTZu0bPOwRhPTK2aOvJ/CkF79O8mJ7aceUg0UScZytWpHSWeSBAp
         FbUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790417801; x=1791022601; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nuUo8zdKSoKE11B/ziniOjON7mdE/CfW6nfGNWVjAv0=;
        b=giveH64UslhZ66LiQ8Du1fcRC6IRx6B2sg3EwDdHL69wTrdJj8oT/FKezLBDW6etAs
         2r6StGErZEQvGrplAYm4PQ3vIrn57mM9h0xN3yvpTBJBGxjUMfObZyNHqheC84mZxvv2
         D4lL0ktGZVeEi1wymns4y4Yn4DLgMuy9C5466cF0L4/eUMJlI1O1GOaH5+ByMYDtb7eN
         fdBLIpPrmcacLRerBfFWwzyeT7q9EgEWa8KTK6Tz4pxhM/ODa5LuytJjK/aJFDARIMDj
         t5WYcO5pvkV6Eo/YqO6WBIlfSZmVScWqnw25/VbXgvZ0eSwzij34tavOMSLZt2SP9Mvb
         sEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790417801; x=1791022601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nuUo8zdKSoKE11B/ziniOjON7mdE/CfW6nfGNWVjAv0=;
        b=hweqU7RNy2hiRE5zM04MWH5G3w1fvDyq+pQ9dYExnHOCs1CzxlhWMCK3AR9OB3BdtL
         0l1JOUHyLz/3mvEgBOa0wojy67MHfAWPDvR8fQw4hlE7w80VHpkdcOAj1CsbKEj2mlKV
         ewcnTzboz7VzycUQql16MygqFQIojzn383dMmPi4xxmzWN2pFOWybXQXa14gEe49k2rh
         0yiepBNDhl/5r99KU+yYh5slavNlg4xeS27sMJuBN67ZPRJdfnAuDsGX7OEnpbntr3nN
         36cd0JXrMQr1ueSBv9zEzZYjShuYXYyuUeXbXbNGtsiu7R+Z1MneUtiJDJvY6aQJa2PW
         Lihg==
X-Forwarded-Encrypted: i=1; AKwUvBz9n8QixqfC9DyIr0lGtr8bpRvNZJf1saV0YGMjC7gWIK+i9hYo1TnYEwnJ8osl6FMUzi39xWW3YNYBppVAcgi8@lists.infradead.org
X-Gm-Message-State: AFuF++ktZ+pjiEaAN/e7RaFGvNpHnzbKT3W7XuEIW9A5M2dYJ7WCHG/Y
	mv/ivB8aSg0YicHo2pafyiiNPshP6A68MlhHDsSm46Ikc6RV2BgAhdsulOydiSfdz5ZBOT/l6SE
	Bp90PIFFPTyX0zgxq244XBOCkdMitB3c=
X-Gm-Gg: AYBFou16tphDxXRYOwl1BqhouNxnrIGmk5SF8uDjpnZUaSWmWGv+IH/NPuAnqQ25IKj
	9fvmfCwkmsUeQUKpYw4Jxa0sEd2KwH3H+etcODrXJZbEif/G6TgFapxiZmQvzD54Nr/ijCXWcUv
	A0/ASnJkAhtEL6P7xKQmJLhFfZUOufjZdc0+50awwhB3WgIqfgprCnqf0GEiDLRQz6lxe3ivAoP
	U6qITka+TuQGGox34PUJN28jODPp6pWRrix9XD8jInOP5UghnGCXR+wgAgcMzQHXDedvRMkDjdh
	aCwTsuTL38dqVK9Bpxww8nXGsopq8qIbbBM5anCwYcoE/iAQq8W3nY4zlrsT7F3gcI/Gy//TRpZ
	zoV5wMF9wsWw=
X-Received: by 2002:a17:906:dc89:b0:c26:3341:b8f6 with SMTP id
 a640c23a62f3a-c2ac23a79a0mr705591166b.31.1790417800888; Sat, 26 Sep 2026
 03:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
In-Reply-To: <20260926045517.3458413-1-matthias.goergens@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 26 Sep 2026 18:16:03 +0800
X-Gm-Features: AclHuK-9Dsy7rrAClr-629S5BXo_K2Hom1PYuYOl9rMJseRXC4FOvcoZCXsi7Gw
Message-ID: <CAMgjq7B7jem_dwtUEX7ZJPQm_pKBegR6WS9+B7nFp-gZugpUng@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate offload
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Baoquan He <baoquan.he@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>, Barry Song <baohua@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-api@vger.kernel.org, Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Karel Zak <kzak@redhat.com>, util-linux@vger.kernel.org, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_031643_582536_3D4591A3 
X-CRM114-Status: GOOD (  22.97  )
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

On Sat, Sep 26, 2026 at 12:55=E2=80=AFPM Matthias Goergens
<matthias.goergens@gmail.com> wrote:
>
> This RFC adds offload-only swap areas for deliberate cold-page offload to
> backends unsuitable for pressure reclaim. ZFS zvol swap has documented
> deadlocks under memory pressure [3]; compressed swap is another target
> because writes may need memory despite free logical slots.
>
> Explicit proactive reclaim can use these areas alongside conventional
> swap, ordered by priority. Ordinary reclaim cannot initiate non-zero
> writes to them, including through retained swap entries. Conventional
> capacity is not reserved for emergencies. Operators choose the policy;
> the kernel does not measure headroom or make an allocating backend safe.
>
> TMO/Senpai [4] and DAMON_RECLAIM [5] are related cold-page reclaim
> approaches. This RFC admits offload-only swap through memory.reclaim and
> per-node reclaim, but not DAMON. Other related work includes per-cgroup
> zswap writeback control [6], Virtual Swap Space v4 [1] and swap tiers v10
> [2].
>
> The util-linux companion [8] proposes swapon --offload-only and an fstab
> option. Older swapon silently ignores the fstab token, so persistent
> activation needs discussion. Apply the separate i915 fix [9] first to avo=
id
> a pre-existing folio-lock leak when shmem writeback is skipped.
>
> The series fixes zram selftest device tracking and error reporting, adds
> the swap policy with DRM eligibility checks, and tests routing, workingse=
t
> activation and retained-entry write refusal. It is based on mm-new at
> 995829088503.
>
> Feedback is particularly welcome on:
>
> - Activation-time eligibility versus backend placement or migration:
>   is retained-entry refusal, with possible reclaim churn or OOM,
>   acceptable without migration?
> - Eligible-capacity accounting, including overcommit limits and OOM
>   scoring; cache recovery, cluster invalidation and workingset activation=
.
> - Persistent activation and visibility: current swap listings do not
>   expose the policy.
>
> Validation includes x86 builds, affected arm64 MTE objects and builds
> without swap or memory cgroups. QEMU tests covered routing, retained-entr=
y
> recovery, data integrity and cleanup, with negative controls for write
> refusal and teardown failure.
>
> I have also been using this policy on my own machine with experimental
> bcachefs swap support, with no problems observed so far. Deliberate stres=
s
> testing is confined to VMs; I do not deliberately stress-test this machin=
e.
>
> Changes since v1, incorporating Sashiko's public review [7]:
>
> - Improve selftest isolation, retained-swap measurement and memlock skips=
.
> - Track allocated zram devices, wait for udev probes and report cleanup
>   errors without deleting data through a mount that could not be released=
.
> - Clarify activation, capacity reporting and conventional fallback limits=
.
>
> [1] https://patchew.org/linux/20260825153238.2695446-1-nphamcs@gmail.com/
> [2] https://patchew.org/linux/20260713025644.170839-1-youngjun.park@lge.c=
om/
> [3] https://openzfs.github.io/openzfs-docs/Project%20and%20Community/FAQ.=
html#using-a-zvol-for-a-swap-device-on-linux
> [4] https://engineering.fb.com/2022/06/20/data-infrastructure/transparent=
-memory-offloading-more-memory-at-a-fraction-of-the-cost-and-power/
> [5] https://www.kernel.org/doc/html/latest/admin-guide/mm/damon/reclaim.h=
tml
> [6] https://www.kernel.org/doc/html/latest/admin-guide/mm/zswap.html
> [7] https://sashiko.dev/#/patchset/20260914104501.3960616-1-matthias.goer=
gens@gmail.com
> [8] https://github.com/util-linux/util-linux/pull/4633
> [9] https://lore.kernel.org/all/20260914105606.3997649-1-matthias.goergen=
s@gmail.com/
>
> v1: https://lore.kernel.org/all/20260914104501.3960616-1-matthias.goergen=
s@gmail.com/
>
> Matthias Goergens (4):
>   selftests: zram: track owned devices and report cleanup failures
>   mm: restrict offload-only swap to proactive reclaim
>   selftests: zram: cover offload-only swap policy
>   selftests: zram: cover retained offload-only entries
>
>  Documentation/mm/swap.rst                     | 105 ++++
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |   2 +-
>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |   6 +-
>  drivers/gpu/drm/msm/msm_gem_shrinker.c        |   2 +-
>  drivers/gpu/drm/panthor/panthor_gem.c         |   2 +-
>  drivers/gpu/drm/ttm/ttm_backup.c              |   2 +-
>  drivers/gpu/drm/xe/tests/xe_bo.c              |   2 +-
>  include/linux/swap.h                          |  29 +-
>  include/linux/vm_event_item.h                 |   1 +
>  mm/memcontrol.c                               |  20 +-
>  mm/page_io.c                                  |  24 +-
>  mm/swapfile.c                                 | 123 ++++-
>  mm/vmscan.c                                   |  31 +-
>  mm/vmstat.c                                   |   1 +
>  tools/testing/selftests/zram/.gitignore       |   2 +
>  tools/testing/selftests/zram/Makefile         |   4 +-
>  tools/testing/selftests/zram/README           |  20 +-
>  tools/testing/selftests/zram/config           |  10 +-
>  tools/testing/selftests/zram/settings         |   1 +
>  tools/testing/selftests/zram/swap_offload.c   | 425 +++++++++++++++++
>  .../selftests/zram/workingset_offload.c       | 207 ++++++++
>  tools/testing/selftests/zram/zram.sh          |   9 +
>  tools/testing/selftests/zram/zram01.sh        |   9 +-
>  tools/testing/selftests/zram/zram02.sh        |   9 +-
>  tools/testing/selftests/zram/zram03.sh        | 174 +++++++
>  tools/testing/selftests/zram/zram04.sh        | 164 +++++++
>  tools/testing/selftests/zram/zram05.sh        | 447 ++++++++++++++++++
>  tools/testing/selftests/zram/zram_lib.sh      | 189 ++++++--
>  28 files changed, 1926 insertions(+), 94 deletions(-)

Hi Matthias

That's a lot of changes for a rather limited usage. IIUC what it want
to archive is, for different kind of reclaim, swap operations should
only go to certain devices?

This really sounds like another usage of the swap tiering design: A
default per-cgroup tier setup, and a one time tier limit during
proactive reclaim.

Just like we already have a "swappiness=3D" parameter in the reclaim
interface, perhaps adding a "swap.tier=3D" would be better and much
cleaner to achieve the same goal? Based on Youngjun's work here:
https://lore.kernel.org/all/20260916183437.2946306-1-youngjun.park@lge.com/

