Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0771C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 02:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amu8emrGl8rkPoLIi8XUc7V5H+nNUKD4hdESOSeB00M=; b=3+ShAQVBV/S7VBuFoX6dLjiU/m
	ryuYSpjVRjiTdqgWiruWRIMqdjLf2HMBJlqZt7KiSGMnb6QzVmSVM1bzRLvThtkTgmAWKz6umEezz
	XnOF+sS2G1QwhsiLLp9V036p2uPGMUq5QNyBmkH5ZImrXyXAdXXLeE+eZ8QAHxhoKi+NbKu1ujdNW
	8/lN+NqniV5569aWp5gbChrpcFWMFgxjlIQ8Tu+xrXF96tfdHoNl0e05gvn5Z39PZCtA3h8yuM9yg
	REITdv63DW/5pFoNEXlahPkblwAlxx/iFMZYixxsL+dLvrhy5sCQZ6GXqK69WdggGnqtV4qhsZcvg
	JsHIA0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOSYs-00000003IM2-18ul;
	Mon, 09 Jun 2025 02:48:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOSWj-00000003Hqh-2idu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 02:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6FF261155;
	Mon,  9 Jun 2025 02:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85B52C4CEF3;
	Mon,  9 Jun 2025 02:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749437180;
	bh=4OnMzJOtM5pU1oWgHTKYNUPFKsLktwixoiO0Wzf9d1Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iWxSwPDYh/HygwisJlO1XmTIOAtuJVN+wZPNYnMmsU6NEtHE1lbX2Z08lQznoPsZj
	 hnhYHWzFgcBO95RzsirWY4jCdvYfq0Sbqaag1142BJ2b2ekwc/fI3VHBdTGBYM1o1d
	 tXaLiCjJoP1G0DCfG6dodP7B0FwLUKxwrSsedrpA/40NUe3h+UbEYjta1RZ72IL848
	 w+W3u4qPqeOaloOmj0pOp7D6E0ApkpL81n3gq1At8dazVsNBVVSuCSbzMpboAm30Rv
	 XdeszjMK6S//HFcbq+dN2gxlDEbHc9CDvU3T/mtveSLedDCr3qTHAuvjQnsKkuQeY6
	 HasJxt1Bm1Okg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1A5C5AD49;
	Mon,  9 Jun 2025 02:46:20 +0000 (UTC)
From: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Mon, 09 Jun 2025 11:45:47 +0900
Subject: [PATCH v2 3/3] test_bits: add tests for __GENMASK() and
 __GENMASK_ULL()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-consolidate-genmask-v2-3-b8cce8107e49@wanadoo.fr>
References: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
In-Reply-To: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2912;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=3zlQdv4EFCMg/HesmXq1vpsLUuJL8L+7u7ycJRCz2oM=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDBluXj+OROcksv85HMKzRf9qy/3Vp7btD5RqkRfo7bDiD
 szL6TjUUcLCIMbFICumyLKsnJNboaPQO+zQX0uYOaxMIEMYuDgFYCJCPxh+HMpYoMy2mZO9Yxm3
 9XG1VF3Zs6rm7K+jJ+g+Vjn6NVeV4Z+OmdwBZZfycL89YZtEf153lHjC8Sqvdv0+M2GXC7a3Kvg
 B
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
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

From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

The definitions of GENMASK() and GENMASK_ULL() do not depend any more
on __GENMASK() and __GENMASK_ULL(). Duplicate the existing unit tests
so that __GENMASK{,ULL}() are still covered.

Because __GENMASK() and __GENMASK_ULL() do use GENMASK_INPUT_CHECK(),
drop the TEST_GENMASK_FAILURES negative tests.

It would be good to have a small assembly test case for GENMASK*() in
case somebody decides to unify both in the future. However, I lack
expertise in assembly to do so. Instead add a FIXME message to
highlight the absence of the asm unit test.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changelog:

  v1 -> v2:

    - No changes

This patch previously belonged to this series:

  bits: Fixed-type GENMASK_U*() and BIT_U*()
  Link: https://lore.kernel.org/r/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr

Below changelog contains the history from the previous series.

Changelog:

  v6 (previous series) -> v1 (new series):

    - Add a message in the commit description to explain why the
      negative tests are dropped.

    - Add Lucas's Reviewed-by tag.

  v5 -> v6:

    - Add a FIXME message to highlight the absence of the asm
      GENMASK*() unit tests.

  v4 -> v5:

    - No changes.

  v3 -> v4:

    - New patch.
---
 lib/tests/test_bits.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/lib/tests/test_bits.c b/lib/tests/test_bits.c
index 47325b41515fde2c3ed434ed6f4094925c98886b..ab88e50d2edfa2b011f07d50460ac8ea6ff99923 100644
--- a/lib/tests/test_bits.c
+++ b/lib/tests/test_bits.c
@@ -26,6 +26,23 @@ static_assert(assert_type(u16, GENMASK_U16(15, 0)) == U16_MAX);
 static_assert(assert_type(u32, GENMASK_U32(31, 0)) == U32_MAX);
 static_assert(assert_type(u64, GENMASK_U64(63, 0)) == U64_MAX);
 
+/* FIXME: add a test case written in asm for GENMASK() and GENMASK_ULL() */
+
+static void __genmask_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 1ul, __GENMASK(0, 0));
+	KUNIT_EXPECT_EQ(test, 3ul, __GENMASK(1, 0));
+	KUNIT_EXPECT_EQ(test, 6ul, __GENMASK(2, 1));
+	KUNIT_EXPECT_EQ(test, 0xFFFFFFFFul, __GENMASK(31, 0));
+}
+
+static void __genmask_ull_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 1ull, __GENMASK_ULL(0, 0));
+	KUNIT_EXPECT_EQ(test, 3ull, __GENMASK_ULL(1, 0));
+	KUNIT_EXPECT_EQ(test, 0x000000ffffe00000ull, __GENMASK_ULL(39, 21));
+	KUNIT_EXPECT_EQ(test, 0xffffffffffffffffull, __GENMASK_ULL(63, 0));
+}
 
 static void genmask_test(struct kunit *test)
 {
@@ -123,6 +140,8 @@ static void genmask_input_check_test(struct kunit *test)
 
 
 static struct kunit_case bits_test_cases[] = {
+	KUNIT_CASE(__genmask_test),
+	KUNIT_CASE(__genmask_ull_test),
 	KUNIT_CASE(genmask_test),
 	KUNIT_CASE(genmask_ull_test),
 	KUNIT_CASE(genmask_u128_test),

-- 
2.49.0



