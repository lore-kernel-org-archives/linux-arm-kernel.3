Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F34FD0070
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 15:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=La09DCP0jA/AbFytPwXt0j25r8TkQJK+X1DFAQGkXJk=; b=Cc7VFlcVAGD3G6Msa7j7filgxR
	n0O7+Oaby2G1uD7hu4iXmoaiLn9lX5wIEl1Hnv516S/3lW1FXIzoTmYcATtsCdkyhCpyTL5tfnxaH
	HAH57D0ZlGVIcyqSA9hmZ3urjTuJCgfxp9G6cAmGALf1G12hBdHA7e40O4k648qUDMne5a+De6QPg
	n1WlU7c2OV0Pzt6J2iEI7Oa2mpghwZA8rJG0khqVqfO14CSJqXYXzkY/ot0pQaCiO468p4Lk2sn6M
	v/WoSrlvaH8RmruN08JtdLbufOG/lS73qB66gztBbj3g4jnyCyYNz8wTDPQlynAlmRTghN8Pt6IDd
	OYfxCkpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwiiY-0000000Bbwt-3B1s;
	Sun, 01 Mar 2026 15:28:26 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwiiW-0000000BbwP-2bbH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 15:28:25 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-899a917a4feso66334726d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 07:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772378903; x=1772983703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=La09DCP0jA/AbFytPwXt0j25r8TkQJK+X1DFAQGkXJk=;
        b=aC3bEnO8buEJ3wdXiLa3TBfgtugpPpfDY7FeBXuvHZqjl9MGXqs8tLhhJLSz1tonIY
         1IW3O493uNWy9EZVrl3D22qT8z2SvHb8opViqaUxZThN1UsddwWnLqkAESCsuTqJc2Ud
         v50rIsrETES5xsru4yd+qLG/YwXV4H2uXnRqIc25z+X0ov5rUY2dYBNvmpek/n1BQ28h
         S67ksdQ0KaeKOEZqI/Zfwpt1Eh6Vxkhp5kmo8Z4NyxPijpCQW0S26LvilV/nbjT/BdMg
         6/pWrwOjJcMRxnbE7kam//+odg8XhURTbweEq0AnlpoecmCaKDC8TYPwlIqEIn1zkhez
         tg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772378903; x=1772983703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=La09DCP0jA/AbFytPwXt0j25r8TkQJK+X1DFAQGkXJk=;
        b=YPLfiIWYbGJS6YFLATLhOlMQbZNj8PCGCCr87JexTlWfWudJ6noXi6dPUWdJ98K2BG
         a9qRITIiIRMr4WX3ILOhh/l2ELW/eL+jwxPBUriPGhfciBCsSDAmTemUpfI4ySpK3v2J
         i2Qg6oELW/DCCuaQVyBe9ZnxmEetpsRxKWHUFY7GS8uhefTk6G2FsL9aUoP8LLRwRZqk
         OkAq6xvDXE6fHIxptnhEfHbUTWfZ0HgMVzZ6xxmG7aypxOz3+SJTxuJnOa1a2TSYwITW
         oijETQ6yWScV28zTUMd9h/Qn0OdLNJX2UyIkP0MWDzyOBWzHZxx9DRVZNyzq4IQrHo/3
         jq7Q==
X-Gm-Message-State: AOJu0Ywp7XH7Nb4gD3pqrXlakbwx9Dpo+oyP+uOGGCxmEsN+r8MwPcvj
	2QoXF1RtZ4OYz866VtL+APYp3nntI7N7Kcb+hlIaP+tZJCv72fvDkbZj
X-Gm-Gg: ATEYQzxl6LHEvDSBYSdXhRpEf3Us8rbhvTqFWaB1MCu5vIpn5nVhFBULkJSigqBoDGW
	Un5sH8wzq8fMHxySbqQ2PKU9/Ik2xHZsiPPAYCChEZrcxq8+HDcNSd+1rVtc8MHTrUyTtwjIgOl
	oxLEVvIU/jfXIxmR4Is9kVPARhzQ3SCQhLqhcml8LpVCEbt/pscC3dW1/SR6nR/e4/Rkkz4MscL
	+Q8h94rh1pZ46LZ2OeHXXD9fY46ATV9gh5awXXtIAUrZyJzKEiC4CA1z3dtDl0jD3m3oACdN7Kv
	MyVmw+xPhMioZtXSjHbNZ6sF21bB0E9ivBjhAUl8EWBJXfT5QreQIE0uTCiXW8M/c+XGHhjtV4j
	hK4u55vs7CCA+LkGnpeIAkH5RWfDi/Jp+IYgeHsIdsQzuQ4Xi1K1jtScLmKdC9xsE5gZp6Z5v8M
	0fXdkmrgR19ThF54E4Ju7kXicKgxwDzK/lxah80Z+iaPdk+usyTGaVW0OiU46FvCcSygkGklk3M
	81p
X-Received: by 2002:a05:6214:d8f:b0:899:a91a:2e0c with SMTP id 6a1803df08f44-899d1e45937mr145098116d6.46.1772378903232;
        Sun, 01 Mar 2026 07:28:23 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e53a16c0sm32849486d6.35.2026.03.01.07.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 07:28:22 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 2/2] arm64: lib: xor-neon: fix pointer spacing for __restrict
Date: Sun,  1 Mar 2026 15:28:20 +0000
Message-ID: <20260301152820.2589291-2-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301152820.2589291-1-objecting@objecting.org>
References: <20260301152820.2589291-1-objecting@objecting.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_072824_688007_DB7454AD 
X-CRM114-Status: GOOD (  11.10  )
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

Fix coding style error where 'foo * bar' should be 'foo *bar' for the __restrict qualifier.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 arch/arm64/lib/xor-neon.c | 52 +++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/lib/xor-neon.c b/arch/arm64/lib/xor-neon.c
index c65b44a8f134..cdf6ae923e1b 100644
--- a/arch/arm64/lib/xor-neon.c
+++ b/arch/arm64/lib/xor-neon.c
@@ -9,8 +9,8 @@
 #include <linux/module.h>
 #include <asm/neon-intrinsics.h>
 
-static void xor_arm64_neon_2(unsigned long bytes, unsigned long * __restrict p1,
-	const unsigned long * __restrict p2)
+static void xor_arm64_neon_2(unsigned long bytes, unsigned long *__restrict p1,
+	const unsigned long *__restrict p2)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
@@ -36,9 +36,9 @@ static void xor_arm64_neon_2(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-static void xor_arm64_neon_3(unsigned long bytes, unsigned long * __restrict p1,
-	const unsigned long * __restrict p2,
-	const unsigned long * __restrict p3)
+static void xor_arm64_neon_3(unsigned long bytes, unsigned long *__restrict p1,
+	const unsigned long *__restrict p2,
+	const unsigned long *__restrict p3)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
@@ -72,10 +72,10 @@ static void xor_arm64_neon_3(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-static void xor_arm64_neon_4(unsigned long bytes, unsigned long * __restrict p1,
-	const unsigned long * __restrict p2,
-	const unsigned long * __restrict p3,
-	const unsigned long * __restrict p4)
+static void xor_arm64_neon_4(unsigned long bytes, unsigned long *__restrict p1,
+	const unsigned long *__restrict p2,
+	const unsigned long *__restrict p3,
+	const unsigned long *__restrict p4)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
@@ -117,11 +117,11 @@ static void xor_arm64_neon_4(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-static void xor_arm64_neon_5(unsigned long bytes, unsigned long * __restrict p1,
-	const unsigned long * __restrict p2,
-	const unsigned long * __restrict p3,
-	const unsigned long * __restrict p4,
-	const unsigned long * __restrict p5)
+static void xor_arm64_neon_5(unsigned long bytes, unsigned long *__restrict p1,
+	const unsigned long *__restrict p2,
+	const unsigned long *__restrict p3,
+	const unsigned long *__restrict p4,
+	const unsigned long *__restrict p5)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
@@ -191,9 +191,9 @@ static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
 }
 
 static void xor_arm64_eor3_3(unsigned long bytes,
-	unsigned long * __restrict p1,
-	const unsigned long * __restrict p2,
-	const unsigned long * __restrict p3)
+	unsigned long *__restrict p1,
+	const unsigned long *__restrict p2,
+	const unsigned long *__restrict p3)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
@@ -226,10 +226,10 @@ static void xor_arm64_eor3_3(unsigned long bytes,
 }
 
 static void xor_arm64_eor3_4(unsigned long bytes,
-	unsigned long * __restrict p1,
-	const unsigned long * __restrict p2,
-	const unsigned long * __restrict p3,
-	const unsigned long * __restrict p4)
+	unsigned long *__restrict p1,
+	const unsigned long *__restrict p2,
+	const unsigned long *__restrict p3,
+	const unsigned long *__restrict p4)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
@@ -270,11 +270,11 @@ static void xor_arm64_eor3_4(unsigned long bytes,
 }
 
 static void xor_arm64_eor3_5(unsigned long bytes,
-	unsigned long * __restrict p1,
-	const unsigned long * __restrict p2,
-	const unsigned long * __restrict p3,
-	const unsigned long * __restrict p4,
-	const unsigned long * __restrict p5)
+	unsigned long *__restrict p1,
+	const unsigned long *__restrict p2,
+	const unsigned long *__restrict p3,
+	const unsigned long *__restrict p4,
+	const unsigned long *__restrict p5)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
 	uint64_t *dp2 = (uint64_t *)p2;
-- 
2.43.0


