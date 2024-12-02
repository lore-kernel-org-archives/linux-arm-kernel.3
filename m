Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A16D7831C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyBKNImG3543zkiJ+eMXPxx3YNczz2Mf1C6U2FxVidE=; b=ENnCzrg1VUeRnni9nQacR+jx9V
	rPrPZ4FcOq6/BIpfIwAPu8fhhYWIjqIZ4HuA1q29MvS9wvDSXgeXViLHHIunVSvzM3cSlcValYFSI
	lYtd+Y/NoQL96wIoIcVmtCq+t6L5ZFJnEu/yVCVWQBn4XRYASocZXzxWVY4JQNDg1qHiKR3KJCNlc
	hQWNr5TjK8EQYgMj75ymFj4D7an1Iz/2CbjoIc4HGY5LQkoPbHlaFTRgEdNGI6Ud2I6jw2Li/esu2
	gB1SXOMS3PXYySfn00D4OiHjbKvHPk8toGPrUhPoZkuApu3bY6pDQzv90qD5egEULMr0wSYSPPh0U
	3QnuGr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAVu-000000074MH-1gTa;
	Mon, 02 Dec 2024 17:47:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAKF-0000000723B-3PXQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=MyBKNImG3543zkiJ+eMXPxx3YNczz2Mf1C6U2FxVidE=; b=VP2E+Fj7+kfaJtxoPJ+ttYxg+c
	7ekNQnjeQLTP2YJKC+BHB08GMsL18jVHwLMvtRQgDmM1pbqaNlbO0UgbwzAoO6IW1C127HtA3ENH2
	gzIJgXvS/OuL5gy4DKKrZbOBdwetlO32ZuuxzAlJGNLjLzxEjfnnBHq4ShYbpZyhQuEIB1SPpnERw
	HvbpNJN1s9dYOOTy53CtVuYZyD5t3WfMdIWAHwJrPHc/es5W3Cdf06+VNfd6tHVh9jsPeBE7dc0NQ
	llIDdmRooq7jkt3rXzWoOT56DK6f5n6Y/RD44e3AT2EsfjH5OwXa7pQ/5Cbdu/6spICvsd6kg1iNq
	6alZE02A==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAKC-00000002Dig-2hbe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01F775C5E9D;
	Mon,  2 Dec 2024 17:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 451ECC4CEE2;
	Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160904;
	bh=xwTNFn3pAcjVSWQWx0fHAn53Pqy1YgPTXPD7CvZlCBE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ungmd37L4dkWQvhcuFclEv+4CcvM6Wg2DepR4tJAgCJBakZJ4OmYWS9Csu9MKZr41
	 XOv24ODLjWwD+67sbFUifpRNCmPEQhS8JwS9csGxIlgYR/YLsHOkJVI+rsTOnZRPEy
	 yH2cFtTBr9uKzmixHN0oJOTceYmKMqTwlwwO5KPm5TZsGgwOtl4ORdHEwBnZoivBBH
	 bSGeNjS+e1SaQ5F6GGhF5sehAhHeG+tGesILeTagGwibgp+e6zEqRMEwmeSetfdcXn
	 lSorEV45P7zurGKv9mS3+xrhz3uFMSJ+2PzbCz77WDhjVgbfudPNRgeib2oB/A/4F2
	 ITeXGxWMkkBeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394CFD7833C;
	Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
From: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Tue, 03 Dec 2024 02:33:26 +0900
Subject: [PATCH 04/10] linux/bits.h: simplify GENMASK_INPUT_CHECK() by
 using is_const_true()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-is_constexpr-refactor-v1-4-4e4cbaecc216@wanadoo.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=7pxUmK/6W4pXlFZB1NGxttLkuRalLbmF/D69OP2jG1o=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOm+749GXp33N/vXlsdiTw9lODzSEugV7vlifP1CSKJpp
 EL7cw+XjlIWBjEuBlkxRZZl5ZzcCh2F3mGH/lrCzGFlAhnCwMUpABNR2Mnw35utNVRP1Thc1XO/
 kFrZj4LtpwX/s53aHOaffebyus1pTgz/82/rzvn0wGB67rdoO1XPe0Viq2NqdiXV19t3Vhuemj6
 RGwA=
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_173509_043138_7453655E 
X-CRM114-Status: GOOD (  11.53  )
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

In GENMASK_INPUT_CHECK(),

  __builtin_choose_expr(__is_constexpr((l) > (h)), (l) > (h), 0)

is equivalent to:

  is_const_true((l) > (h))

Apply is_const_true() to simplify GENMASK_INPUT_CHECK().

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
This change passes the unit tests from CONFIG_BITS_TEST, including the
extra negative tests provided under #ifdef TEST_GENMASK_FAILURES [1].

[1] commit 6d511020e13d ("lib/test_bits.c: add tests of GENMASK")
Link: https://git.kernel.org/torvalds/c/6d511020e13d
---
 include/linux/bits.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/bits.h b/include/linux/bits.h
index 60044b6088172b3f26aa3f17cdaede9786863dae..ef0119e6179e1ca95345a3d4d3327ba19633028e 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -20,9 +20,8 @@
  */
 #if !defined(__ASSEMBLY__)
 #include <linux/build_bug.h>
-#define GENMASK_INPUT_CHECK(h, l) \
-	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
-		__is_constexpr((l) > (h)), (l) > (h), 0)))
+#include <linux/compiler.h>
+#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(is_const_true((l) > (h)))
 #else
 /*
  * BUILD_BUG_ON_ZERO is not available in h files included from asm files,

-- 
2.45.2



