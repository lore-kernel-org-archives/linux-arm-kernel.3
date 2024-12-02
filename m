Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB87D7831C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTDbXQrXeL1QtkcRT6P5tuG++7/ooNKDiK5MNH+dj+8=; b=pGxqA7BpI6SjKp7bKCWnFr7kgW
	vMi6XPaag6ar0nPwZ1j1UM2WJbZKv0zyYnFybVwIhqV7YGfK6+QPch3Lt9UFCW+1LieCvd1diL+CJ
	BAKO09XoOPZkItr/PMvq7qT8s7R/U6oNYMGuTd/iSjUM89t3Vhp+TbD5XR5/fdC1cWzT08Y7cml7K
	jtHlfwZIybFm+Zq6G4yVNuUhhEEnYzMhnEA2xU0ifj4yV1+HoEYM0fb5z2fpwhGWf5ngrCTp0/qFc
	eZ0J0OSTpkkqJB8DXYrlLO7xQn9KoVhvvPoyKDwe7Q6xkXSSTiE4K8qCgzy5XgIXTVEmRc1LC/QyF
	ah1R1bng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAR6-000000073g7-2lya;
	Mon, 02 Dec 2024 17:42:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAK9-000000071zi-2bTM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:35:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 448955C5D5B;
	Mon,  2 Dec 2024 17:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB054C4CED6;
	Mon,  2 Dec 2024 17:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160904;
	bh=5SkdVpyxMkwcefHUvrmeRmooVspzWLLjyCNkLAyYF/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=krYcOchpdZfTOGmmZmYXGkkzng0VBYzBaTIPS/JdWNiJdmt/4S7+V2deZeuJtDiHJ
	 5bOfjWx9PMCJkw4vWMJA+j7RGJgyQT3MCvZz+ywWGgXkUPQ1I8zhp2RRNDd7wmPgUC
	 KVr3TdRx7r3vS7sNZQQ4VuZSeMJ1Co4MyFc7SbZRWDfa4cIk4lQ19T0FRsrpwOa17T
	 JopKvCO/OnNKT3V7n07PfE9Ll3My7kWEoWbthp4JMgarfO7M35ovTZ+SUQIDeAkdh8
	 VxQs0KDQFLoqYMNE9XZ9vIlYg+Eia5POewyoXqK+ltXanlAIbCfNk8+zvx51tcJKic
	 OeLS9BafEnm7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CC9D7833C;
	Mon,  2 Dec 2024 17:35:03 +0000 (UTC)
From: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Tue, 03 Dec 2024 02:33:23 +0900
Subject: [PATCH 01/10] compiler.h: add statically_false()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-is_constexpr-refactor-v1-1-4e4cbaecc216@wanadoo.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=MUJOQQOOJL9dYDVaPT65KhZRSmD+ZVJ1pjvxSAixArY=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOm+74/KH7/U7qegXjXTofXb3TYljXrmuVYbMjW/tLXe4
 w0P49vQUcrCIMbFICumyLKsnJNboaPQO+zQX0uYOaxMIEMYuDgFYCKiExj+h59n32w4XUS9Q6Hd
 rUTL9LrKv/cufhltT6M9vi38WfriOSPDth1s9Y4XTgudV69oFplrmhzR2RRm0jljjlHtl08TxWX
 ZAQ==
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_093505_756979_F0B06A45 
X-CRM114-Status: GOOD (  12.21  )
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

For completion, add statically_false() which is the equivalent of
statically_true() except that it will return true only if the input is
known to be false at compile time.

The == operator is used instead of the ! negation to prevent a
-Wint-in-bool-context compiler warning when the argument is not a
boolean. For example:

  statically_false(var * 0)

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/compiler.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 469a64dd6495fefab2c85ffc279568a657b72660..a2a56a50dd85227a4fdc62236a2710ca37c5ba52 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -314,6 +314,7 @@ static inline void *offset_to_ptr(const int *off)
  * values to determine that the condition is statically true.
  */
 #define statically_true(x) (__builtin_constant_p(x) && (x))
+#define statically_false(x) (__builtin_constant_p(x) && (x) == 0)
 
 /*
  * This is needed in functions which generate the stack canary, see

-- 
2.45.2



