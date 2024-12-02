Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230E0D7833D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvZ5Ea7O2CMMS8JxLyAlrOZJQuKNKPriSx2UOmU4MyA=; b=ARMmqrSWsFawZcOZ+qk8wh1N6T
	obwT/SxemS10mcG9obFxHrPbvdanMJP7X5+sTwHfAatih5349RIfBWSeS6GyizBKml7mbB+EWM157
	aadeQmJgQXEFH5joUFRaEXmPawsAEtP4mRZ00Us6yUvBQvkKpv5xzMcRK2cTH1l1NXOh03h+cQrMK
	pDW7uORmnZ2DnrR7R871+c/FLbN7PTvlguy3g7jallUMv5Ti38MZJ5ZWdt2cp8H5mrosH8Kp/YVt1
	FPp2DAojtNQXjSTfccS7MvQJH049KY7s0yRw7aedKr648REoN8qju443xM+r4mFYtwOc2bktpq7mi
	X6TArYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAS4-000000073nv-11vj;
	Mon, 02 Dec 2024 17:43:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAKA-0000000720g-2s30
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:35:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8F6BA41081;
	Mon,  2 Dec 2024 17:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D9C2C4CED1;
	Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160904;
	bh=otRfIIpR9ke8jKx0T5rYqZgdrJ75ZS57/Fik5wYJ77g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mbv/N+QLcgtpQR8QD3+Ebo0ZkA7L0mv7KOGi59I1rnrkhoHvWWt1ejgoGG0hn3cQH
	 7vY0bEpghsh4bdGKfDPWkJgjgE9H1kbPj3okgFTgy7GsQ5nHdE7+BlS4CfYCtp+olK
	 IxHhytNs+RjNxOecYykd2M4jLLUkudPct9tMAWZ31vqh51ucXMeaL2xLFjw4duIFDw
	 maNwAvLXVHp5++7gPZAAkp9asgFSy/lVIQgrV/RYVoGKbVqtKt/DGnAwPQJVU+dLvv
	 OQNeCRsZUu9f3KQ7My3boRoQ7P4tB3aYMYuiHyP2HChG+NdQkCk0tLHRZQHijwMmM6
	 fzSDVM2CqMrSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAD4D7833C;
	Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
From: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Tue, 03 Dec 2024 02:33:28 +0900
Subject: [PATCH 06/10] fortify: replace __is_constexpr() by is_const() in
 strlen()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-is_constexpr-refactor-v1-6-4e4cbaecc216@wanadoo.fr>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
In-Reply-To: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 David Laight <David.Laight@aculab.com>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
Cc: linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=jMI6GLWGOq2qwprnzsUGV4xG+9C9iHAQ1IPi4ZG8B0k=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOm+749+/rqPW6pvpu+W2UzTPlgk/hDbmVItMcnU/8kTl
 hNartOudJSyMIhxMciKKbIsK+fkVugo9A479NcSZg4rE8gQBi5OAZiIaBsjw/wOdQfrmY9Kw6X+
 neVT9cwNVGdRL0772611cXrWBz25mQx/RT0nvEo4NlP8lov1Q74UufJwLg3WJUzZSUkaeZNe+69
 lBQA=
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_093506_865047_6154656C 
X-CRM114-Status: GOOD (  11.00  )
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

is_const() is a one to one replacement of __is_constexpr(). Do the
replacement so that __is_constexpr() can be removed.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/fortify-string.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
index 0d99bf11d260a3482bbe46e35c7553c0ccfb8b94..e3f2f772c5439ef71eb4a904b4ce27956bc69743 100644
--- a/include/linux/fortify-string.h
+++ b/include/linux/fortify-string.h
@@ -254,8 +254,8 @@ __FORTIFY_INLINE __kernel_size_t strnlen(const char * const POS p, __kernel_size
  * Returns number of characters in @p (NOT including the final NUL).
  *
  */
-#define strlen(p)							\
-	__builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),	\
+#define strlen(p)						\
+	__builtin_choose_expr(is_const(__builtin_strlen(p)),	\
 		__builtin_strlen(p), __fortify_strlen(p))
 __FORTIFY_INLINE __diagnose_as(__builtin_strlen, 1)
 __kernel_size_t __fortify_strlen(const char * const POS p)

-- 
2.45.2



