Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDC5C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 17:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UAqYYuU9Sl6j+X2a0g4jqqJJF/LjBnht1Te1rbtsIyU=; b=1SYn/aHIfJFh5iiUAfLBE+bBor
	adHWzk4+nXy1ORB/kTM84utbmBpeTqUlai2h3X22xO+nMNdU/VHUE2mBG/IuBzX5xEqoCjZU5TwvU
	bojlET3Vl39+/0qWiy1CogogajMKi8gswjBHWda4lVj/rsr3sMdmaEnsxcZETchEP5MxifHvzY5tA
	3lG/OYPhSo4Czl+zeSEOJieJhMNSKPfiasoO45yR7K/0jLRB3OdTYxwnWr1gUushP9hQxAQSuRDpO
	uP5Z2O3iw2oazvIf1dRgZlkcjoq+rCCbh9bfLFW2nOYVGZ5i6J25evOv4+nz1z+PgYL5frGcYgZN0
	kYs4E9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx804-00000006bjl-16i1;
	Tue, 25 Mar 2025 17:23:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6hz-00000006Pfl-3kEv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 16:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=UAqYYuU9Sl6j+X2a0g4jqqJJF/LjBnht1Te1rbtsIyU=; b=aA67sgCfZcHuV1DY381t22jYMk
	ITwklJ+n/HH6Mh81sEMyHyippWKkkKdoVfXa/SmaFxnlgKUgU4WInjyn+WaSq661NsbjSpoEzkkMj
	bexkbdGrMXmo5c2KG89o+MChuK/SdUp8fpqhAx3y42DPpmLKEj9COop30rBcR2cxIbEYx7xw6wdo6
	yyPHKfRingkViHWOPynav+7BXXOE1hvv+DWMAjm9qwybaFNdW146nsOIZ4zLnxzL4EDaA5muqy0AC
	pqmLc1OKzpkL6gRJZPqkOfbTa/hVS/XL5Gu8zP23wd/RSWVy+s3011I485Hjlncc2M8XpSC9LmiVB
	kEkvGbkQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6hw-00000005dCZ-3SPL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 16:00:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EEF60A4AB36;
	Tue, 25 Mar 2025 15:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3F66C4CEE4;
	Tue, 25 Mar 2025 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742918448;
	bh=Qyqawt3yEY8kEjetVfNw5tS/eDbvtY8p88+b2hatK2U=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZLFFnVFuaqhxd5I0DmFhj7b427aVOF0/wmgCHjV4XLV4NL4Jp+m390mh2sFz/F9HE
	 YldIk4doKEVLu1Rgnc0mS7GVz2OSUBUSQDjbkPiCiyH/MYdy2fpiPhQxf8CzwqD+3d
	 b8juY4IM25Evt79eVpuYL8sXT5Zpg1PbWdZt2wfCKPzM+G1/S5v6YDC6ZbknddAnT7
	 MLjqgQstl+99wl3+hhw6+kTk4tp9pja5mZ0GBdfQrAt8+qYQDGaGpCgqgCVFhQqt2A
	 3ceRUbBzko5ayMyUySWzsxJL+UFdtctVHErwuvCM0gqGEUjQ4kYl7clal28wNVg3E6
	 4zFvw1McrgryA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959EAC3600B;
	Tue, 25 Mar 2025 16:00:48 +0000 (UTC)
From: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Subject: [PATCH v8 0/6] bits: Fixed-type GENMASK_U*() and BIT_U*()
Date: Wed, 26 Mar 2025 00:59:55 +0900
Message-Id: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPvS4mcC/23RTW7DIBQE4KtYrIuL+TE4q9yj6gLDI0aNTQrEb
 RTl7sW1KrmKlyPxPo2GO0oQPSR0qO4owuyTD1MJ6qVCZtDTCbC3JSNKqCCUKuz8N1icbxfAJ5h
 GnT4SVrbRQgjHOChULi8RlmeL+vZesothxHmIoP8sTihRRHJBm1pISWSLG3y+Gp1qC6OOZvBHP
 2U41yaMCzn4lEO8/fac+QKvlRgRu5VmjglulGTWWNdKyo5fetI2hNpFtHSaxRZp9xFRkJ5zBp0
 1vW6fkXaL7I8ztwVxomONAMkM7Z4QuUEo3UdkQaxmijjXGNH/Rx7r5hE+r+UD8zo86nUCXOYbf
 T5UIfqTn16LlmG5ePwA1/rO9foBAAA=
X-Change-ID: 20250228-fixed-type-genmasks-8d1a555f34e8
To: Yury Norov <yury.norov@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 David Laight <David.Laight@ACULAB.COM>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5325;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=Qyqawt3yEY8kEjetVfNw5tS/eDbvtY8p88+b2hatK2U=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOmPLkt1sV17eDToX5FbpYcyg85HyzccM3pONpx1W9JQn
 elso9XTUcrCIMbFICumyLKsnJNboaPQO+zQX0uYOaxMIEMYuDgFYCLKLYwMX0JYr1z34WlecTP4
 t4yZSky58f6kmTz1h7WnG3uXRyspMTJcX9rwf5aEnMCJmEcucVVe83xmzl2oM1VWyuYhy7xXrP8
 5AQ==
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_160053_069791_2E21DF87 
X-CRM114-Status: GOOD (  20.87  )
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
Reply-To: mailhol.vincent@wanadoo.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Introduce some fixed width variant of the GENMASK() and the BIT()
macros in bits.h. For example:

  GENMASK_U16(16, 0)

will raise a build bug.

This series is a continuation of:

  https://lore.kernel.org/intel-xe/20240208074521.577076-1-lucas.demarchi@intel.com

from Lucas De Marchi. Above series is one year old. I really think
that this was a good idea and I do not want this series to die. So I
am volunteering to revive it.

Meanwhile, many changes occurred in bits.h. The most significant
change is that __GENMASK() was moved to the uapi headers. For this
reason, a new GENMASK_TYPE() is introduced instead and the uapi
__GENMASK() is left untouched.

Finally, I do not think it makes sense to expose the fixed width
variants to the asm. The fixed width integers type are a C concept. So
the GENMASK_U*() are only visible to the non-asm code. For asm, the
long and long long variants seem sufficient.

This series does not modify the actual GENMASK(), GENMASK_ULL() and
GENMASK_U128(). A consolidation of the existing genmasks will be
proposed later on in a separate series.

As requested, here are the bloat-o-meter stats:

  $ ./scripts/bloat-o-meter vmlinux_before.o vmlinux_after.o 
  add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
  Function                                     old     new   delta
  Total: Before=22781662, After=22781662, chg +0.00%

(done with GCC 12.4.1 on an x86_64_defconfig)

--
2.43.0

---
Changes from v7:

  - Meanwhile, in commit db6fe4d61ece ("lib: Move KUnit tests into
    tests/ subdirectory"), lib/test_bits.c was moved to
    lib/tests/test_bits.c. Rebase onto Linus's master branch so that
    this change is reflected.

  - Remove the note in the cover letter on the return type, instead
    add an explanation in patch "bits: introduce fixed-type
    GENMASK_U*()".

  - s/shift-count-overflow/-Wshift-count-overflow/g

  - Link to v7: https://lore.kernel.org/r/20250322-fixed-type-genmasks-v7-0-da380ff1c5b9@wanadoo.fr

Changes from v6:

  - Split the series in two: this series leave any existing GENMASK*()
    unmodified. The consolidation will be done in a separate series.

  - Collect some Reviewed-by tag.

  - Address miscellaneous nitpick on the code comments and the line
    wrapping (details in each patch).

  - Link to v6: https://lore.kernel.org/r/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr

Changes from v5:

  - Update the cover letter message. I was still refering to
    GENMASK_t() instead of GENMASK_TYPE().

  - Add a comment in the cover letter to explain that a common
    GENMASK_TYPE() for C and asm wouldn't allow to generate the u128
    variant.

  - Restore the comment saying that BUILD_BUG_ON() is not available in
    asm code.

  - Add a FIXME message to highlight the absence of the asm GENMASK*()
    unit tests.

  - Use git's histogram diff algorithm

  - Link to v5: https://lore.kernel.org/r/20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr

Changes from v4:

  - Rebase on https://github.com/norov/linux/tree/bitmap-for-next

  - Rename GENMASK_t() to GENMASK_TYPE()

  - First patch of v4 (the typo fix 'init128' -> 'int128') is removed
    because it was resent separately in:
    https://lore.kernel.org/all/20250305-fix_init128_typo-v1-1-cbe5b8e54e7d@wanadoo.fr

  - Replace the (t)~ULL(0) by type_max(t). This way, GENMASK_TYPE()
    can now be used to generate GENMASK_U128().

  - Get rid of the unsigned int cast for the U8 and U16 variants.

  - Add the BIT_TYPE() helper macro.

  - Link to v4: https://lore.kernel.org/r/20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr

Changes from v3:

  - Rebase on v6.14-rc5

  - Fix a typo in GENMASK_U128() comment.

  - Split the asm and non-asm definition of 

  - Replace ~0ULL by ~ULL(0)

  - Since v3, __GENMASK() was moved to the uapi and people started
    using directly. Introduce GENMASK_t() instead.

  - Link to v3: https://lore.kernel.org/intel-xe/20240208074521.577076-1-lucas.demarchi@intel.com

Changes from v2:

  - Document both in commit message and code about the strict type
    checking and give examples how it´d break with invalid params.

  - Link to v2: https://lore.kernel.org/intel-xe/20240124050205.3646390-1-lucas.demarchi@intel.com

Link to v1: https://lore.kernel.org/intel-xe/20230509051403.2748545-1-lucas.demarchi@intel.com

---
Lucas De Marchi (3):
      bits: introduce fixed-type BIT_U*()
      drm/i915: Convert REG_GENMASK*() to fixed-width GENMASK_U*()
      test_bits: add tests for GENMASK_U*()

Vincent Mailhol (3):
      bits: add comments and newlines to #if, #else and #endif directives
      bits: introduce fixed-type GENMASK_U*()
      test_bits: add tests for BIT_U*()

 drivers/gpu/drm/i915/i915_reg_defs.h | 108 ++++-------------------------------
 include/linux/bitops.h               |   1 -
 include/linux/bits.h                 |  57 +++++++++++++++++-
 lib/tests/test_bits.c                |  30 ++++++++++
 4 files changed, 96 insertions(+), 100 deletions(-)
---
base-commit: 2df0c02dab829dd89360d98a8a1abaa026ef5798
change-id: 20250228-fixed-type-genmasks-8d1a555f34e8

Best regards,
-- 
Vincent Mailhol <mailhol.vincent@wanadoo.fr>



