Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDABE69E85
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 18:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSecgOFCcnddgSXhEf8ACXGiWtLdAEY7PHrRXowILx0=; b=Sgr+iclMqfe0oPX3U9//m/UAsQ
	LcDgcQAt7N/61ioL4ygrAtac634ojxuDGrKOqSM2r8NXdU7Lym9+9w8naIi3MOvTXAuygtGqBcKPO
	z5GHWsqAr0uaj3cE5gncnt46BrRj09p9jk9gA7GaMYxul88wvLxECb22cUkNXkE0wu5G0mFV3slW6
	P4xxsYU4VKdPn8416Bau33xQmv/bnFu+i5MsM33atVCCbKVOxLarQEIRzw5x15sjg/Zm4v9ttiTY+
	DjwpVQNRqpjc0F28w6ClZcylYEd/ecbKdSM5UtsXHetqzCD+REgNJ+ZUPs/TK+dOEWsnNHuT2qCRm
	1gBgAl6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBd9-00000007Dj9-0mB5;
	Mon, 02 Dec 2024 18:58:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAKF-0000000722j-13uz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=qSecgOFCcnddgSXhEf8ACXGiWtLdAEY7PHrRXowILx0=; b=hNA0j6Vvnbxv5P5j8cl8FnRzk7
	7LLrJkiZ+ODRIzF5GGLMHUJK+NZM4NW6RlJ9bz/hokwAWmgnPw/S7CnTy1Xgh2k+DIEqXbSPrEI17
	/6pgZqqZ7TeHnqw3G1AUTkiwLSBt9W7FbfbkzwCKXLTnDLJ2zZ/AMvRV3K0/xfWsmrL8J0uAtRxlZ
	TmsIoSFf3Naw73dCEwzEhMoK+aQJbF7vP2VfZFj/Wml/EzO2XzgP43B9s4r5PXSYl71elI33UkIAx
	nEHbDCAnqgnqs1+XhC0njP22JFnXdBTYZg388VirflnwryK985pTfjvRTUGIsHw1n+cccV9bi2SHz
	1icVxNHA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAKC-00000002Die-1ERx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4E26A4105D;
	Mon,  2 Dec 2024 17:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AEC8C4CEE9;
	Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160904;
	bh=0n7K8123aVRmHZxGT60ksDzEW/cULJYrbFl/Q86l37M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j/90kkzHJYpxgw9fCykFpmgCYrZb/HPUY4Fn5AfokJhP84zgU7WPjnPRfcVDKNTZ6
	 wg+fmlmBVyCt//Ey3/M6ExHqZHnZfnNtjNwYpa7cjYFMZUUr9k/jEbhhMlkpXAEPu8
	 tyBddS+OV2r4MV7GOACqXDiV2MFmPliFoCKNi3gXMxhlm3mvVMqJV7rk2kHU1Nf1iF
	 Rmspw7y6S/BTMrAVwZfQYYIvu3wu1tA0CWgmUb/hRT/5vecMQRWoCUH10RiN4SK+ik
	 KNISAN2qv9Bv/qfkjhjCxYcPlt6QwRjzMjF4MkKIAmeuKGAEzSHUCnhg3q3mCxkg59
	 zwzNKjWmBqpZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EEED7831C;
	Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
From: Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Tue, 03 Dec 2024 02:33:29 +0900
Subject: [PATCH 07/10] overflow: replace __is_constexpr() by is_const()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-is_constexpr-refactor-v1-7-4e4cbaecc216@wanadoo.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2119;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=3zhdAHGJKxe/cfP6gSQHSq0jEALX5ywlxJaLknSE8PU=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOm+74/q876MC9CKYjyo9Ky9cdPpsilBc38vnbBxvs6ZW
 UF5mtXRHaUsDGJcDLJiiizLyjm5FToKvcMO/bWEmcPKBDKEgYtTACbyQ5fhr7xK1ZyIKSviHgrp
 8+d4/NxvmD6DX/jspxv39qf9Nnzx8QYjw5+v16eWdS2+XNXV/TjVMnulR8GKU3Mazly4pdn98Ng
 OKx4A
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_173508_635752_8195686F 
X-CRM114-Status: UNSURE (   9.65  )
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
Reply-To: mailhol.vincent@wanadoo.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

is_const() is a one to one replacement of __is_constexpr(). Do the
replacement so that __is_constexpr() can be removed.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/overflow.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index 0c7e3dcfe8670cb95f371a6f7d41bb8b63b1786c..d69361a3128897d493b5e2ec471f077ca2b9861d 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -234,7 +234,7 @@ static inline bool __must_check __must_check_overflow(bool overflow)
  * Returns: true if overflow can occur, false otherwise.
  */
 #define overflows_type(n, T)					\
-	__builtin_choose_expr(__is_constexpr(n),		\
+	__builtin_choose_expr(is_const(n),			\
 			      __overflows_type_constexpr(n, T),	\
 			      __overflows_type(n, T))
 
@@ -250,7 +250,7 @@ static inline bool __must_check __must_check_overflow(bool overflow)
  * back to __same_type().
  */
 #define castable_to_type(n, T)						\
-	__builtin_choose_expr(__is_constexpr(n),			\
+	__builtin_choose_expr(is_const(n),				\
 			      !__overflows_type_constexpr(n, T),	\
 			      __same_type(n, T))
 
@@ -352,7 +352,7 @@ static inline size_t __must_check size_sub(size_t minuend, size_t subtrahend)
  * Return: number of bytes needed or SIZE_MAX on overflow.
  */
 #define flex_array_size(p, member, count)				\
-	__builtin_choose_expr(__is_constexpr(count),			\
+	__builtin_choose_expr(is_const(count),				\
 		(count) * sizeof(*(p)->member) + __must_be_array((p)->member),	\
 		size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
 
@@ -368,7 +368,7 @@ static inline size_t __must_check size_sub(size_t minuend, size_t subtrahend)
  * Return: number of bytes needed or SIZE_MAX on overflow.
  */
 #define struct_size(p, member, count)					\
-	__builtin_choose_expr(__is_constexpr(count),			\
+	__builtin_choose_expr(is_const(count),				\
 		sizeof(*(p)) + flex_array_size(p, member, count),	\
 		size_add(sizeof(*(p)), flex_array_size(p, member, count)))
 

-- 
2.45.2



