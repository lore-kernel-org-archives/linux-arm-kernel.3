Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C44C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 11:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/d6uUrEQJ1Jj6D3ujEDjXcpi6dwqRaoAAIna3MeOrcs=; b=xjVvmqg2G0pJJi6rWYzOxhJqe5
	IIVUP/I1/jeHn4EtszycOQz9aeq1q7MgTok/QpM5GrZyEFJew56FPtqB+m3gFZwRsCC9bhTMmkhRc
	XPDpQ9e2XkoRlQ+Ow0HG1GHBT71IRGkrQDpUWBM308JWz+tEtPoSaV2kRTcgGDDFb3aHGhz0F1fW2
	UWFXiS4UZEnEemo8wTmobjN0qdVzJV+jLKL3R63RHG82umDO0o2UI76Rrg8Iy9WqFayqXyJ+Yrjbv
	ope/i97ldwNIDiXnSHqamZapEtOcPWgN+IIL/719R/Rffn1jYXLVdPByagrlZvvDM+k5sQ3j0KkXs
	MWuhuOFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSoN-00000008TSi-30G0;
	Wed, 09 Jul 2025 11:18:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRG1-00000008A08-28VM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 09:38:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62BCC153B;
	Wed,  9 Jul 2025 02:38:17 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 067563F738;
	Wed,  9 Jul 2025 02:38:26 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	linux-kernel@vger.kernel.org
Cc: james.morse@arm.com,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v2 2/2] bitfield: Ensure the return values of helper functions are checked
Date: Wed,  9 Jul 2025 10:38:08 +0100
Message-ID: <20250709093808.920284-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709093808.920284-1-ben.horgan@arm.com>
References: <20250709093808.920284-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_023829_589844_4639708C 
X-CRM114-Status: GOOD (  11.25  )
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

As type##_replace_bits() has no side effects it is only useful if its
return value is checked. Add __must_check to enforce this usage. To have
the bits replaced in-place typep##_replace_bits() can be used instead.

Although, type_##_get_bits() and type_##_encode_bits() are harder to misuse
they are still only useful if the return value is checked. For
consistency, also add __must_check to these.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 include/linux/bitfield.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 6d9a53db54b6..5355f8f806a9 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -189,14 +189,14 @@ static __always_inline u64 field_mask(u64 field)
 }
 #define field_max(field)	((typeof(field))field_mask(field))
 #define ____MAKE_OP(type,base,to,from)					\
-static __always_inline __##type type##_encode_bits(base v, base field)	\
+static __always_inline __##type __must_check type##_encode_bits(base v, base field)	\
 {									\
 	if (__builtin_constant_p(v) && (v & ~field_mask(field)))	\
 		__field_overflow();					\
 	return to((v & field_mask(field)) * field_multiplier(field));	\
 }									\
-static __always_inline __##type type##_replace_bits(__##type old,	\
-					base val, base field)		\
+static __always_inline __##type __must_check type##_replace_bits(__##type old,	\
+							base val, base field)	\
 {									\
 	return (old & ~to(field)) | type##_encode_bits(val, field);	\
 }									\
@@ -205,7 +205,7 @@ static __always_inline void type##p_replace_bits(__##type *p,		\
 {									\
 	*p = (*p & ~to(field)) | type##_encode_bits(val, field);	\
 }									\
-static __always_inline base type##_get_bits(__##type v, base field)	\
+static __always_inline base __must_check type##_get_bits(__##type v, base field)	\
 {									\
 	return (from(v) & field)/field_multiplier(field);		\
 }
-- 
2.43.0


