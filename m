Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB65C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7AGVn5rsoivy4XdBbDHT+ZIYjzG6P/lq4w5yM1Xww0=; b=Gt4/eKhyEj2MEUOgKmtDkx3xT7
	xr/SIF9mlClEjkriSMKOMJ21FB8Nla8q5WoFzZ9d22Z4yDZiRzhek9HNyynu/ib/ky7TNclO9PjSu
	iCGePhA+hjIAMixrZNKecLjVFO8sqKE2Q3S3wmeJBf552VDXOXXVrk6X+mOY8/waOklJg5TU/3tTZ
	uSp8fvp+d56vwBPOXlP8GxOWqOPjsLkwsOUJxr/jOTHc0WaASeNbvwHndiCvaXWSMavGKXPKk/cLh
	JgMkwGSgq9YDmmr+2nvLeUcxXHJU2nS1Rb2/0eU4LnhFYbL4vaab15k6AB/wJdDZGDjSUkgWFjhle
	0YMtqMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6s6-00000006RX9-2sMj;
	Tue, 25 Mar 2025 16:11:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6hz-00000006Pfk-3MxL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 16:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=v7AGVn5rsoivy4XdBbDHT+ZIYjzG6P/lq4w5yM1Xww0=; b=B9Ise33n7gfPebZmkz7EOv9Z30
	ziGnkRYE1hf80zAUGI6VqLzvxz5q8YLXMMS6sxOP4kmm40MD/VRZPsN21HYI+5rVeiH7TGh2sIaR2
	N+Oa0HFaKEKhNtB4OXP6y979zwF8Wmhh8mr50i6pasmtTNH5zp8mZEOpwMkgSz/9I8Z/MpwPJWaOc
	2oH++OJIvI0IlvjSA+3Cp/HtuAUWf+RZTmX1FjdZ7eUt32xDX+GHINTMuN4bryRT01xiw9DwgwEtk
	B/4NUepY+0oCFcZqunbvZM5xBYv42A+apYAh00tltN14+29BOr6ATlbpRprBoda8Lt5ZrV0qOsQVf
	PybJgAew==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6hw-00000005dCc-2uID
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 16:00:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C733A4AB3D;
	Tue, 25 Mar 2025 15:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14F53C4CEEF;
	Tue, 25 Mar 2025 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742918449;
	bh=0MgHXb0J9A/vlPO8SY2whMNKBj8R4Rsvop50Z26NQ3o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A/mVVA9v2v9buK38So11Q5AI7ibZq1R0Tl0Uz/3/QHGulUg8i0K5CTZP1WRUYXDZT
	 s67seeJl5A/re5LH+E2Ac6+gLmLvKX+hF7n+rK5TtyqRE4/DtuSEWkzm6/PRGFDjhs
	 qgbm4SgDv5Z4w9+KdB6zQSFf0ajE3v0r/uUk+N6Os/0WAzqq6KGg1z1tZ0C/Z2MN6i
	 Gnw9iKzQBZA1I1VB0wDYdy3yplQRHGPEGkKcGk/Zs1Y0pR2d4rSUBieIIMMXMR/tXO
	 M7uvznwt4dsGVeMPpCExydESfMt48UNYovI6nG2bRo6/QvxWtClMVdD/7+hsMm2VId
	 1BP8hhJfyL0QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC22C3600B;
	Tue, 25 Mar 2025 16:00:49 +0000 (UTC)
From: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Wed, 26 Mar 2025 01:00:00 +0900
Subject: [PATCH v8 5/6] test_bits: add tests for GENMASK_U*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-fixed-type-genmasks-v8-5-24afed16ca00@wanadoo.fr>
References: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
In-Reply-To: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
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
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=Nb/G0eCNCNsy7H+SqFg3vz5WdbZbgtEPSfg4VSWoDLg=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOmPLmuZWLx5XdtmddnzTrXHjbsRirLftRcHlV3ve82Ze
 PtK2PkLHaUsDGJcDLJiiizLyjm5FToKvcMO/bWEmcPKBDKEgYtTACaSsIaR4UTMnxXpZsEWv/zz
 O2U9jNom2c1a/K0zImnWe8t21YI39xj+52aEnPt9+sn5rB87ZMrPrgwo6FvdGd7VIdcZ4f990uc
 YVgA=
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_160053_054356_D5977D7F 
X-CRM114-Status: GOOD (  12.96  )
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

From: Lucas De Marchi <lucas.demarchi@intel.com>

Add some additional tests in lib/tests/test_bits.c to cover the
expected/non-expected values of the fixed-type GENMASK_U*() macros.

Also check that the result value matches the expected type. Since
those are known at build time, use static_assert() instead of normal
kunit tests.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
Changelog:

  v7 -> v8:

    - In commit db6fe4d61ece ("lib: Move KUnit tests into tests/
      subdirectory"), lib/test_bits.c was moved to
      lib/tests/test_bits.c. Adjust the patch descrption accordingly.

  v6 -> v7:
  v5 -> v6:

    - No changes.

  v4 -> v5:

    - Revert v4 change. GENMASK_U8()/GENMASK_U16() are now back to
      u8/u16.

  v3 -> v4:

    - Adjust the type of GENMASK_U8()/GENMASK_U16() from u8/u16 to
      unsigned int.

    - Reorder the tests to match the order in which the macros are
      declared in bits.h.
---
 lib/tests/test_bits.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/lib/tests/test_bits.c b/lib/tests/test_bits.c
index c7b38d91e1f16d42b7ca92e62fbd6c19b37e76a0..f443476f3265c463c1219b13c1ef9663d238d58b 100644
--- a/lib/tests/test_bits.c
+++ b/lib/tests/test_bits.c
@@ -5,6 +5,16 @@
 
 #include <kunit/test.h>
 #include <linux/bits.h>
+#include <linux/types.h>
+
+#define assert_type(t, x) _Generic(x, t: x, default: 0)
+
+static_assert(assert_type(unsigned long, GENMASK(31, 0)) == U32_MAX);
+static_assert(assert_type(unsigned long long, GENMASK_ULL(63, 0)) == U64_MAX);
+static_assert(assert_type(u8, GENMASK_U8(7, 0)) == U8_MAX);
+static_assert(assert_type(u16, GENMASK_U16(15, 0)) == U16_MAX);
+static_assert(assert_type(u32, GENMASK_U32(31, 0)) == U32_MAX);
+static_assert(assert_type(u64, GENMASK_U64(63, 0)) == U64_MAX);
 
 
 static void genmask_test(struct kunit *test)
@@ -14,11 +24,21 @@ static void genmask_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 6ul, GENMASK(2, 1));
 	KUNIT_EXPECT_EQ(test, 0xFFFFFFFFul, GENMASK(31, 0));
 
+	KUNIT_EXPECT_EQ(test, 1u, GENMASK_U8(0, 0));
+	KUNIT_EXPECT_EQ(test, 3u, GENMASK_U16(1, 0));
+	KUNIT_EXPECT_EQ(test, 0x10000, GENMASK_U32(16, 16));
+
 #ifdef TEST_GENMASK_FAILURES
 	/* these should fail compilation */
 	GENMASK(0, 1);
 	GENMASK(0, 10);
 	GENMASK(9, 10);
+
+	GENMASK_U32(0, 31);
+	GENMASK_U64(64, 0);
+	GENMASK_U32(32, 0);
+	GENMASK_U16(16, 0);
+	GENMASK_U8(8, 0);
 #endif
 
 

-- 
2.48.1



