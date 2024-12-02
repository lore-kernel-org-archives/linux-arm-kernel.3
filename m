Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB6ED7833D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joZYj5b0s15HYUbIVYcG1b7ouBChg5WQYHZmgetOqSY=; b=HrySieCtMZTygAax0SGpJOlytJ
	JRV6sj54/+/O2xom0mgxWMTy//t61OvJFwatl/t5yL+v110ZZLPh+sXC+XVPeejuuF0D69LQ7livK
	JJuEsnsS2Ps2VgZK94aj0QUn4hOSzDJxl/mcawYdwqTgkHyBaBJtRnIHmWB2P8tXFOUUATxVYfsSq
	qBKniieeSCW6NMXxUXWRzQE1Qqwl6CskDSDvyrN92XH4PNwKcUr6bkfh4zACUpMGGjpUoN+1AEa6T
	JtExSlXy6QtaU8xFz79omUQHI9xzX8vU4gLJcPd4Naaro3eQtLEyat/21O8giRP9XX4zYoH546qGM
	eshuWevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAUw-0000000746l-3SmF;
	Mon, 02 Dec 2024 17:46:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAKF-00000007237-2aFM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=joZYj5b0s15HYUbIVYcG1b7ouBChg5WQYHZmgetOqSY=; b=E2OAsokemteQNzRLWCI+XhbGV2
	Zy18fATNC8mvAOLl/BfBB2SzYlM8tDOjURCgQXQknoMX6F+vzFYtOmr/KTnQjJB3LVy+kYNRMlEqH
	Tf1pgAL5kFW73oq+iVyD6g2wWrirNUkWcnMP2DWmu8uoXBWwBT7ZffZRrVvcHajXtBQX8eD8HUU+h
	BkNBIRalApad/vZY8CypWxF9wD6caVQLDGOQmdsAORIiOKazUKUDwFbJhGJbR5QZOprMR/qRSA+7m
	5Y+SokQm8bVWs4W6JUv4z3X875WmZyVoMfX9a3hTYxn2GfaShLuoY3A1si53F1LWNX7etq+L+6tOP
	ccbCRrSg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAKC-00000002Dic-1I9J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A487F5C5D80;
	Mon,  2 Dec 2024 17:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E788C4CED9;
	Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160904;
	bh=9iW7A+YjBOO9RVnkPZTBuwbq0imIzWIqQzS9oUoJV80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=roR0wmNDodAzyFfPTgFBBp/KqBd/M1Zco1d6OqO8B8sJlOTrYchslvtT08b9PEPAD
	 spi3Zv5Lq4VW/Jihv7VnCNPNtkCFI4MsIeV4lzHFYmMaP7dYZGXCQ8d5TXlEApUNZq
	 8xoSLxg+uBDYJRHUQDRQQNT2XbDMV9G+MwlYNwxH7cmYQ06PHmtyFfEE6xh1DLG/UW
	 fBq0X8GswKgLTC9l8wZKXKu8xTD6Nt4EJlv1q0krvN4+bcuQhKCJFdz8WlioK9jwoK
	 9VKeyHkx1LzW8cff48edd8HPqMCYIPhMmgODxWxXnUj/PlHgA8fMAPfb7UemLpzrLf
	 oQq2wYAjdEIDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2538D7833D;
	Mon,  2 Dec 2024 17:35:03 +0000 (UTC)
From: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Tue, 03 Dec 2024 02:33:24 +0900
Subject: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3781;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=ut5SHXlG8TFqM4dSL1voozHgmPfm9PCB5ssUWoNnPGc=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOm+748Gv37O5/hx2ynzqG0iN+cezF1/Uri8ynPxlkd99
 448enNwUUcpC4MYF4OsmCLLsnJOboWOQu+wQ38tYeawMoEMYeDiFICJTCliZNgwxSRxxgaPNqN9
 SvblgqYXk6R6q/p2hk3PmPP5/5TfZXaMDPsvHppbuS+xzuf2BZ0oL/Hl4l8WKni3vHLVk9a2ddC
 S5AQA
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_173508_712931_BF57DE09 
X-CRM114-Status: GOOD (  18.79  )
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

__is_constexpr(), while being one of the most glorious one liner hack
ever witnessed by mankind, is overly complex. Following the adoption
of C11 in the kernel, this macro can be simplified through the use of
a _Generic() selection.

First, split the macro in two:

  - __is_const_zero(x): an helper macro; tells whether x is the
    integer constant expression 0 or something else.

  - is_const(x): replacement of __is_constexpr(); tells whether x is a
    integer constant expression.

The split serves two purposes: first make it easier to understand;
second, __is_const_zero() will be reused as a building block for other
is_const_*() macros that will be introduced later on.

The core principle of __is_constexpr() to abuse the return type of the
ternary operator remains, but all the surrounding sizeof() hack
disappear.

On a side note, while not relevant to the kernel, __is_constexpr()
relied on the GNU extension that sizeof(void) is 1. const_expr() does
not use any GNU extensions, making it ISO C compliant.

__is_constexpr() is temporarily kept and will be removed once all its
users get migrated to is_const() (or one of its friend).

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/compiler.h | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index a2a56a50dd85227a4fdc62236a2710ca37c5ba52..30ce06df4153cfdc0fad9bc7bffab9097f8b0450 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -316,6 +316,47 @@ static inline void *offset_to_ptr(const int *off)
 #define statically_true(x) (__builtin_constant_p(x) && (x))
 #define statically_false(x) (__builtin_constant_p(x) && (x) == 0)
 
+/*
+ * Whether x is the integer constant expression 0 or something else.
+ *
+ * Details:
+ *   - The C11 standard defines in §6.3.2.3.3
+ *       (void *)<integer constant expression with the value 0>
+ *     as a null pointer constant (c.f. the NULL macro).
+ *   - If x evaluates to the integer constant expression 0,
+ *       (void *)(x)
+ *     is a null pointer constant. Else, it is a void * expression.
+ *   - In a ternary expression:
+ *       condition ? operand1 : operand2
+ *     if one of the two operands is of type void * and the other one
+ *     some other pointer type, the C11 standard defines in §6.5.15.6
+ *     the resulting type as below:
+ *       if one operand is a null pointer constant, the result has the
+ *       type of the other operand; otherwise [...] the result type is
+ *       a pointer to an appropriately qualified version of void.
+ *   - As such, in
+ *       0 ? (void *)(x) : (char *)0
+ *     if x is the integer constant expression 0, operand1 is a null
+ *     pointer constant and the resulting type is that of operand2:
+ *     char *. If x is anything else, the type is void *.
+ *   - The (long) cast silences a compiler warning for when x is not 0.
+ *   - Finally, the _Generic() dispatches the resulting type into a
+ *     Boolean.
+ *
+ * Glory to Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
+ */
+#define __is_const_zero(x) \
+	_Generic(0 ? (void *)(long)(x) : (char *)0, char *: 1, void *: 0)
+
+/*
+ * Returns a constant expression while determining if its argument is a
+ * constant expression, most importantly without evaluating the argument.
+ *
+ * If getting a constant expression is not relevant to you, use the more
+ * powerful __builtin_constant_p() instead.
+ */
+#define is_const(x) __is_const_zero(0 * (x))
+
 /*
  * This is needed in functions which generate the stack canary, see
  * arch/x86/kernel/smpboot.c::start_secondary() for an example.

-- 
2.45.2



