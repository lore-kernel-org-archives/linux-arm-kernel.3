Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55E7CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TqblJqfbXrrmCzEUxWga4pPKLpbgkCtwFBWjaGRMyg4=; b=GL2snNJXUDcChCAKu5L00p1WJm
	Yc6Gg0JfLJYkkCzovMbJb8/FGZAq6i+aQcFlH1UpaDSkYkjuZxqPtqUlzoZubJtuwn1hqp1sFjfAI
	YqWzOGpcgbwUVNb0HMCNVN+vo+2IO95u2LPckhequmndZID0J17LMxWCscHjArA3MG7BqTeNAAVTn
	nqORYJaS/l2Y/Hi3rtdVkd3VgqbEUBGCHX2pp5DCERczMfdvs29FWmeJo8Bw82cdjgp9FWBE4Kpq/
	bMlnOiEM33KHmVWOQh2VVXgAyofPoEkjVbgZXWByVKL1C1EDe9zgVfnXbF85b2iWn7a//lQG8seir
	BliUJTNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ehV-0000000CF7P-24D9;
	Fri, 03 Oct 2025 12:15:53 +0000
Received: from fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([52.28.197.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ehR-0000000CF6m-3CHW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 12:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1759493749; x=1791029749;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TqblJqfbXrrmCzEUxWga4pPKLpbgkCtwFBWjaGRMyg4=;
  b=iODA/Xv+fzLZVdYchbgWxIiERM+NrjlD5siKrHJuQoSliD0i30sRlGyw
   EnNuze4ltx3M+F7gvduT6LV2gqEb/9soKU9TChF1T3++BbHW6SSHxfstB
   RSQvcciX03urDRcWpQeS8CE+Zwsh3COog5IDjAtmghHePOzyq0B8Uem8E
   uPjeqidBUCJTZNVcnps1tr9Xc8jSGxTmusxO2s4lTvfuRy2d5zUKJC5Z5
   JevVascl1JDQPrf0sNHX0QB+DiHl8OJvgEJjIOF4fdEdwmRERkNSpRg1M
   3I99QoVJyBF/s7CZ+snDYDOb824bVRlsjK5Tl0hSYTUwKsHMSaZq6+wea
   Q==;
X-CSE-ConnectionGUID: MPRaiQ9mQMGHc/f2hmpJPw==
X-CSE-MsgGUID: EATtKZGOSduCjCv28xmVFQ==
X-IronPort-AV: E=Sophos;i="6.18,312,1751241600"; 
   d="scan'208";a="2957925"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 12:15:38 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.234:5820]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.21.15:2525] with esmtp (Farcaster)
 id 965d80e9-c758-4875-b5c1-af6f5c12ff0a; Fri, 3 Oct 2025 12:15:38 +0000 (UTC)
X-Farcaster-Flow-ID: 965d80e9-c758-4875-b5c1-af6f5c12ff0a
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 3 Oct 2025 12:15:37 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D018EUA004.ant.amazon.com (10.252.50.85) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Fri, 3 Oct 2025
 12:15:27 +0000
From: Eliav Farber <farbere@amazon.com>
To: <gregkh@linuxfoundation.org>, <kenneth.feng@amd.com>,
	<alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <linus.walleij@linaro.org>, <dmitry.torokhov@gmail.com>,
	<tglx@linutronix.de>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <agk@redhat.com>, <snitzer@kernel.org>,
	<mpatocka@redhat.com>, <clm@fb.com>, <dsterba@suse.com>,
	<luc.vanoostenryck@gmail.com>, <pmladek@suse.com>, <rostedt@goodmis.org>,
	<andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>,
	<senozhatsky@chromium.org>, <akpm@linux-foundation.org>,
	<lijo.lazar@amd.com>, <asad.kamal@amd.com>, <kevinyang.wang@amd.com>,
	<David.Laight@ACULAB.COM>, <amd-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-input@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <dm-devel@lists.linux.dev>,
	<linux-btrfs@vger.kernel.org>, <linux-sparse@vger.kernel.org>,
	<stable@vger.kernel.org>, <farbere@amazon.com>
Subject: [PATCH v4 00/11 6.1.y] Backport minmax.h updates from v6.17-rc7
Date: Fri, 3 Oct 2025 12:15:09 +0000
Message-ID: <20251003121520.8176-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D032UWA004.ant.amazon.com (10.13.139.56) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_051550_119999_FC13CF87 
X-CRM114-Status: GOOD (  14.25  )
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

This series backports 11 patches to update minmax.h in the 6.1.y branch,
aligning it with v6.17-rc7.

The ultimate goal is to synchronize all longterm branches so that they
include the full set of minmax.h changes (6.12.y and 6.6.y were already
backported by me and are now aligned).

The key motivation is to bring in commit d03eba99f5bf ("minmax: allow
min()/max()/clamp() if the arguments have the same signedness"), which
is missing in older kernels.

In mainline, this change enables min()/max()/clamp() to accept mixed
argument types, provided both have the same signedness. Without it,
backported patches that use these forms may trigger compiler warnings,
which escalate to build failures when -Werror is enabled.

Changes in v4:
- Just swap the order of the first 2 patches in this chain, because
  commit cb04e8b1d2f2 ("minmax: don't use max() in situations that want
  a C constant expression") should come before commit dc1c8034e31b
  ("minmax: simplify min()/max()/clamp() implementation").

Changes in v3:
- v2 included 13 patches:
  https://lore.kernel.org/stable/20250929183358.18982-1-farbere@amazon.com/
- First 2 were accepted and are part of 6.1.155.
- 3rd caused build in drivers/md/ to fail:

In file included from ./include/linux/container_of.h:5,
                 from ./include/linux/list.h:5,
                 from ./include/linux/wait.h:7,
                 from ./include/linux/mempool.h:8,
                 from ./include/linux/bio.h:8,
                 from drivers/md/dm-bio-record.h:10,
                 from drivers/md/dm-integrity.c:9:
drivers/md/dm-integrity.c: In function ‘integrity_metadata’:
drivers/md/dm-integrity.c:131:105: error: ISO C90 forbids variable length array ‘checksums_onstack’ [-Werror=vla]
  131 | #define MAX_TAG_SIZE                    (JOURNAL_SECTOR_DATA - JOURNAL_MAC_PER_SECTOR - offsetof(struct journal_entry, last_bytes[MAX_SECTORS_PER_BLOCK]))
      |                                                                                                         ^~~~~~~~~~~~~
./include/linux/build_bug.h:78:56: note: in definition of macro ‘__static_assert’
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/minmax.h:56:9: note: in expansion of macro ‘static_assert’
   56 |         static_assert(__types_ok(x, y, ux, uy),         \
      |         ^~~~~~~~~~~~~
./include/linux/minmax.h:41:31: note: in expansion of macro ‘__is_noneg_int’
   41 |          __is_noneg_int(x) || __is_noneg_int(y))
      |                               ^~~~~~~~~~~~~~
./include/linux/minmax.h:56:23: note: in expansion of macro ‘__types_ok’
   56 |         static_assert(__types_ok(x, y, ux, uy),         \
      |                       ^~~~~~~~~~
./include/linux/minmax.h:61:9: note: in expansion of macro ‘__careful_cmp_once’
   61 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
      |         ^~~~~~~~~~~~~~~~~~
./include/linux/minmax.h:92:25: note: in expansion of macro ‘__careful_cmp’
   92 | #define max(x, y)       __careful_cmp(max, x, y)
      |                         ^~~~~~~~~~~~~
drivers/md/dm-integrity.c:1797:40: note: in expansion of macro ‘max’
 1797 |                 char checksums_onstack[max((size_t)HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
      |                                        ^~~
drivers/md/dm-integrity.c:131:89: note: in expansion of macro ‘offsetof’
  131 | #define MAX_TAG_SIZE                    (JOURNAL_SECTOR_DATA - JOURNAL_MAC_PER_SECTOR - offsetof(struct journal_entry, last_bytes[MAX_SECTORS_PER_BLOCK]))
      |                                                                                         ^~~~~~~~
drivers/md/dm-integrity.c:1797:73: note: in expansion of macro ‘MAX_TAG_SIZE’
 1797 |                 char checksums_onstack[max((size_t)HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
      |                                                                         ^~~~~~~~~~~~

- The build was fixed in the second patch of this series.

Changes in v2:
- v1 included 19 patches:
  https://lore.kernel.org/stable/20250924202320.32333-1-farbere@amazon.com/
- First 6 were pushed to the stable-tree.
- 7th cauded amd driver's build to fail.
- This change fixes it.
- Modified files:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h
   drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
   drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c

David Laight (7):
  minmax.h: add whitespace around operators and after commas
  minmax.h: update some comments
  minmax.h: reduce the #define expansion of min(), max() and clamp()
  minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
  minmax.h: move all the clamp() definitions after the min/max() ones
  minmax.h: simplify the variants of clamp()
  minmax.h: remove some #defines that are only expanded once

Linus Torvalds (4):
  minmax: don't use max() in situations that want a C constant
    expression
  minmax: simplify min()/max()/clamp() implementation
  minmax: improve macro expansion and type checking
  minmax: fix up min3() and max3() too

 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c   |   2 +-
 drivers/input/touchscreen/cyttsp4_core.c |   2 +-
 drivers/irqchip/irq-sun6i-r.c            |   2 +-
 drivers/md/dm-integrity.c                |   2 +-
 fs/btrfs/tree-checker.c                  |   2 +-
 include/linux/compiler.h                 |   9 +
 include/linux/minmax.h                   | 222 +++++++++++++----------
 lib/vsprintf.c                           |   2 +-
 8 files changed, 143 insertions(+), 100 deletions(-)

-- 
2.47.3


