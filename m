Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559ABC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89K4nGcHH8WHdZ8xcpzD2km9shq9IidWbcZ/CNYM0CM=; b=35cj+HgXfit3Ho8K4UaowEQcW+
	k9yaMbXXwqt3nTJlrOiJsZ2F65lN63pYuDNt8Ho/GbFtWLvdkj9PQJBkv4id8H18Q4+ZlniuJWEPr
	t0bufZNG4U6o+jn31C7dMIiTGZZhHTWq8klGFNGn7CjPD20Us5i5GkrnLuE9nsq4QvpITTXfS5oJ/
	TNq1HrXiCL14VVqbJ5dM3w6RT7/9SEWUGYdRAxfhsZpRSvgNGmY9DoVOg8hhKpo7co3GeQFuVYfNO
	/0P9kK34rMnPhHb2jth8Vfec+RyO3R/bASQ/D/6AX2XUTZZ0fwKGYIJscKaQFRb56coykEXn6lMoW
	N11v2V9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6vU-00000006Rwg-2dQz;
	Tue, 25 Mar 2025 16:14:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6i1-00000006PgO-1GxY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 16:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=89K4nGcHH8WHdZ8xcpzD2km9shq9IidWbcZ/CNYM0CM=; b=pc2oDhyYH1bn8wdrEnDheAo6xE
	4f7mzue/l5UtVBE8Y27IYfpT+YspH1XqHBPUpWkL5kW/KvMEX7xw4jtxUU7Vu3FJEQkq/e/PmU5DF
	1wk2heUJLMX/N74pkAdBnZVf71DqUCJbl0KXrY/JjkTisqKZ//nF1HT7TMK8lJCYsIGQ+nKBNnF8s
	h0oE9v+PqcPKgXq7rZ61YMLRg8BpbE0lWMo1Robk3z0j4RUofgacgvibrxy6aS2dQrYeEJNVq0f6R
	YO3iqfAlmXcXLbehZ+Hl7bxcnHhGHr30UQwCRPfCh1n+4TXmQZ8L29ko9HkaGznpeP8dfEOy7nsjy
	EndwdN3Q==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6hw-00000005dCa-3V2N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 16:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14390A4AB3C;
	Tue, 25 Mar 2025 15:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBD7EC4CEED;
	Tue, 25 Mar 2025 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742918448;
	bh=TjiHYCpNQphi1tE+0DL9muw8Pf7OfDUpMtLAFTcJtqA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gExSObNVNUTCOeWV6gSIlTeNmstu3+4Vk1ZJbnxrNZkdiTPiMrZZDFZWEApwx96+j
	 0d0Bb0/eHNOOkrRzPoo/Iq3e4DPllkFJC4mMJgPmqBH2z3YkKMi0iZbWl/seHTOiFJ
	 aj8g8vB9NFsCVivmOQVmUE3v9CXpTROUFk6/niGm1wtDPIxXNdMarA+KCINUwrcpbH
	 srZvZ7X/UGfZLaRZ3tCYjAYRk4p23ML9wFOTiFxCfIZpG8UxNQXirCCmYskuBPORnM
	 ++0jRXgmFZ9IhHW4HQBDrngAdm+jgQInmrQNEpQM9P12tDMEOlzjplytaJFnuF44k3
	 P0qZg7UobNLHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC3FC3600C;
	Tue, 25 Mar 2025 16:00:48 +0000 (UTC)
From: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Wed, 26 Mar 2025 00:59:56 +0900
Subject: [PATCH v8 1/6] bits: add comments and newlines to #if, #else and
 #endif directives
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-fixed-type-genmasks-v8-1-24afed16ca00@wanadoo.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=Ogw/eQvEVmEiIvULs2D8+i7sug2mLu6AIl3BoTH0U+o=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOmPLss+er5p5/8bRxLjOl1Ftl3iT34zv3ml1X4/6V7Dr
 1oKOg/NO0pZGMS4GGTFFFmWlXNyK3QUeocd+msJM4eVCWQIAxenAEzk6g9Ghjd/rmjMnnfwn2Zr
 8dlgbceNMdY9nQHp+zVvpRf4SP6vmsHwP085q5nvqPz3U3lTDTSPrZNc9mNTjwenT0PA3z1Tj/+
 RZwYA
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_160053_110994_D141D196 
X-CRM114-Status: GOOD (  13.34  )
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

This is a preparation for the upcoming GENMASK_U*() and BIT_U*()
changes. After introducing those new macros, there will be a lot of
scrolling between the #if, #else and #endif.

Add a comment to the #else and #endif preprocessor macros to help keep
track of which context we are in. Also, add new lines to better
visually separate the non-asm and asm sections.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
Changelog:

  v7 -> v8:

    - new patch
---
 include/linux/bits.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/linux/bits.h b/include/linux/bits.h
index 14fd0ca9a6cd17339dd2f69e449558312a8a001b..e1e5177691406919ba4f5bbc875bd230414fd117 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -19,16 +19,21 @@
  * GENMASK_ULL(39, 21) gives us the 64bit vector 0x000000ffffe00000.
  */
 #if !defined(__ASSEMBLY__)
+
 #include <linux/build_bug.h>
 #include <linux/compiler.h>
+
 #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
-#else
+
+#else /* defined(__ASSEMBLY__) */
+
 /*
  * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
  * disable the input check if that is the case.
  */
 #define GENMASK_INPUT_CHECK(h, l) 0
-#endif
+
+#endif /* !defined(__ASSEMBLY__) */
 
 #define GENMASK(h, l) \
 	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))

-- 
2.48.1



