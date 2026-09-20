Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236B7C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdoc/fNZ3/8mGQaouIvfU+D4x9tivmX8+zHcMnaA4Lw=; b=47zF5RfEGL5HA3IHwVXcYY/8CO
	fLeWHFp6PFyMr/D38xc8eVUcPS7e77N76UmvUlfzLDXLL5kqQYgS8iCSXZ6E5l+vJFg+V32821U60
	2BUNrllD+nI0scaWaz9kzPqtGvXsok8ZDYkvAIDMHYY3Gh1TkHBJ3R4L4Ef89bddbml+CEktLT3Qc
	5gwdy8G0BN2EmOeJp+KpUvfYEIvGsmRxFkhFQ5Z4dS7+JVAkkpVbaMDVCfFVMVTYJCC1qYwxfiASH
	ZOTy1osDqCFZ2UG9S+8yL6kOUO8zVg/Nm3NKl72RNzp3yyzb1MhY3MIuXOvXFMrcBxeiULW2dznQF
	Ce5MwAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FY3-0000000HKCl-0pK6;
	Sun, 20 Sep 2026 11:17:31 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FXp-0000000HK4W-2Omi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 11:17:20 +0000
Received: from [192.168.10.153] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68KBG36Z088236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 20 Sep 2026 20:16:13 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=sdoc/fNZ3/8mGQaouIvfU+D4x9tivmX8+zHcMnaA4Lw=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789902974; v=1;
        b=wST8YOyR3tflDV0qWGSbQkBzHm4onY042T/KqofQhCB5cWfqGvfpNd5RBrSR27PV
         x4VwM13HbqRhBGbMatvO+wdb5lkv8zzNcz5z9zvSDZNeS3ubmspV3KFExUs6vDLM
         k87ziOa7mu+q0LXMd/649Qw7zrvqcTOYqxOZtTKWZJxO4aNbWfIdbglB+CF7Yenz
         /JEuQfB7ZRbxEagYCnhjn6UbdF/zzLHWyselof44mUATFIbmB96swxsgT2Q0NTQd
         GtfrQSVaowIFAiZxTS3/F7qyXqUFibYhtnVppXk3rgTsfPjn7B/Q20JjvOljBiDc
         RgaklXn9JtNC3WyECw5VYw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sun, 20 Sep 2026 20:15:53 +0900
Subject: [PATCH v11 12/21] tools headers: Use u* types for bitfield helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hybrid-v11-12-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
References: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
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
        Steffen Eiden <seiden@linux.ibm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
        Sean Christopherson <seanjc@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3005;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=0gFY16czEJJdVIZNruax1OboJIq4DgiNXWKP5yi8iWI=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9b6Azkr16mpCGi+jGqJeMRluOH4S0b256HPtjbkfKyZe
 uq4wc5THaUsDGJcDLJiiiwpRbu5NaJrPxUmxLfAzGFlAhnCwMUpABPZu5Dhf9Vtsyn6b5hdXPlP
 lF3ivvf7A9uliJbSRK2thtf/GczapcXIMOFIV+fjKn5n05+b+epZmY/5vPXOCnqUPH/6kRshmiu
 1+QA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_041717_841740_BC600851 
X-CRM114-Status: UNSURE (   9.56  )
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
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
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


