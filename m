Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4A5C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 05:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ditAkCCrXh+YkXADVfso0W9S/4JCyLrDicaPFc0dzLo=; b=foJ3bPyN/ZIYL53dWno7KngZ7e
	IzP1aq4wKZJiYGAmxDYHPiyYgBXoFbZpK0ngJE9/wq4mKRmBzHqc9sVgU9f7DpWwEzjE5T+1pEays
	3l/HWJ+OHLEUzHHlWcgK7ze9NVL+dBQdMdJOWfhgfFLXr/+lHNUMNY7uo9pgRoqK4ytTxOawhio8+
	gSpkcE/7iVec2y0ltNJ8BPwNeJgOpNKKXfetwBeW/ATIsrWsGzwbyP0oUUJFCcbpOABkWXp4MLc7L
	YkIWjP0nVYbSSMe/Z9PCuAUd4rvyRBmxa58nlQg1TclNJduRL1+Lo9CtPPqDI03yES2ytYRaerMJn
	U7w+2cnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgii-00000005s0c-1gZ3;
	Mon, 20 Jul 2026 05:39:16 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgiW-00000005ruH-02UQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 05:39:07 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66K5c7op075973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 20 Jul 2026 14:38:27 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=ditAkCCrXh+YkXADVfso0W9S/4JCyLrDicaPFc0dzLo=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1784525907; v=1;
        b=sKrvylHvOFrgFgsKcvVyGlVdk09KMkw2VoCaXwweA310Gkwg6SDz0I+BSvv7csa1
         aFmYwRJ/DELX5kni8QcgyNDgx3vhgbQUgWfKCwT4DRxfIW7wAWYl5hs/8bqlka24
         3M6b89oyqlKw+ed4fRP9z7tlENma4BO6c2x9y5KbBAwYi+XINfUwHy59xyYPxEWb
         Icx6+7UkMxMPrWsirsMPDi5GhRSebEumzfHNukXNGV7ih/A6XmQycXtPagI71FXi
         tSgpMufa/27qnQtj8rHgcUOZW+FDFKbZH38ufixIaqO+ZGlSBGrKtrwcsUI5KcWw
         jbuASudKIvN21KjbOt4lHg==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 20 Jul 2026 14:38:01 +0900
Subject: [PATCH v9 07/16] tools headers: Use u* types for bitfield helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-hybrid-v9-7-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=2957;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=N/y16fl48YztPTKgFTuZ9+7HYNROEUxLYFOVWXFM1KA=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bsFnfRCQ82B4gwHfVaf47LffbMy1bMIt93yv4+e9Osn
 2Na5NuqjlIWBjEuBlkxRZaUot3cGtG1nwoT4ltg5rAygQxh4OIUgInkmjD84fp1vzpN7O/LY7dP
 HG1+/Cap1KRykVpGQOevAuG1pe03bBgZ5ijOjGteWHfAdo4295xfndOerrzrn6MXzbBqx2H3b8y
 rWQA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_223904_433662_09726323 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

Commit 9486aa387716 ("perf tools: Fix 64 bit integer format strings")
defined the tools-local u64 as uint64_t so that PRI*64 format macros
match its underlying C type. On architectures where uint64_t and __u64
are distinct types, however, ____MAKE_OP() still gives the u64_*
helpers an __u64 interface.

Teach ____MAKE_OP() to accept the helper name and storage type
separately. Keep endian helpers on __le* and __be*, and generate the
native helpers using the tools-local u* types.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 tools/include/linux/bitfield.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/include/linux/bitfield.h b/tools/include/linux/bitfield.h
index ddf81f24956b..1c633343d576 100644
--- a/tools/include/linux/bitfield.h
+++ b/tools/include/linux/bitfield.h
@@ -142,32 +142,32 @@ static __always_inline u64 field_mask(u64 field)
 	return field / field_multiplier(field);
 }
 #define field_max(field)	((typeof(field))field_mask(field))
-#define ____MAKE_OP(type,base,to,from)					\
-static __always_inline __##type type##_encode_bits(base v, base field)	\
+#define ____MAKE_OP(name,type,base,to,from)				\
+static __always_inline type name##_encode_bits(base v, base field)	\
 {									\
 	if (__builtin_constant_p(v) && (v & ~field_mask(field)))	\
 		__field_overflow();					\
 	return to((v & field_mask(field)) * field_multiplier(field));	\
 }									\
-static __always_inline __##type type##_replace_bits(__##type old,	\
-					base val, base field)		\
+static __always_inline type name##_replace_bits(type old,		\
+						base val, base field)	\
 {									\
-	return (old & ~to(field)) | type##_encode_bits(val, field);	\
+	return (old & ~to(field)) | name##_encode_bits(val, field);	\
 }									\
-static __always_inline void type##p_replace_bits(__##type *p,		\
+static __always_inline void name##p_replace_bits(type *p,		\
 					base val, base field)		\
 {									\
-	*p = (*p & ~to(field)) | type##_encode_bits(val, field);	\
+	*p = (*p & ~to(field)) | name##_encode_bits(val, field);	\
 }									\
-static __always_inline base type##_get_bits(__##type v, base field)	\
+static __always_inline base name##_get_bits(type v, base field)	\
 {									\
 	return (from(v) & field)/field_multiplier(field);		\
 }
-#define __MAKE_OP(size)							\
-	____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu)	\
-	____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu)	\
-	____MAKE_OP(u##size,u##size,,)
-____MAKE_OP(u8,u8,,)
+#define __MAKE_OP(size)									\
+	____MAKE_OP(le##size,__le##size,u##size,cpu_to_le##size,le##size##_to_cpu)	\
+	____MAKE_OP(be##size,__be##size,u##size,cpu_to_be##size,be##size##_to_cpu)	\
+	____MAKE_OP(u##size,u##size,u##size,,)
+____MAKE_OP(u8,u8,u8,,)
 __MAKE_OP(16)
 __MAKE_OP(32)
 __MAKE_OP(64)

-- 
2.55.0


