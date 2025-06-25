Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C214EC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 08:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYmOcR+Ty6ORVYOprUyh9SHSbbSmp4y4Zcmg/7D/5kY=; b=Cmn4v0rJP0gdFzjXAPxQ19i+aJ
	POk3qcYW40xeaonKFRg46dyX0S8J3Ph5lvVK6AhuAUYm5rsAn83cHcGDcZ1tNPrWZTZKIDCfD3xuB
	wHPDs4PYz+xxAIvfc5Sc11sys3lkOfUmA7NP5EleVASDb/h+/zcRLulyTr+41PiGWM4vAFJHm7rqo
	xP/+uGiiOpYzx6cg+nMn6LbExvASAx6G9vBCaQFNNWuEpysHvFuEY3ftICLzJHaBb0tDSUE5hmUjs
	dkllryuzbA4Jh3uas55w7A+tz45bO4nhOk3IYcS0nTqixbe41AKR/LlEz9axar5rTiaec2ocihYOb
	jTpomjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULeW-00000007zIK-1Iy1;
	Wed, 25 Jun 2025 08:38:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKHD-00000007lOY-2WWs;
	Wed, 25 Jun 2025 07:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KYmOcR+Ty6ORVYOprUyh9SHSbbSmp4y4Zcmg/7D/5kY=; b=ZJvFllUJTzbgQkkFzdAHnJsHIa
	UMo+xAnULOSHxMHkQFACnkQakXq/+o3150cAtc/U43yQAsDliFITONiviQ0zG4FHc56uZq+ZErI6N
	f+8CefnnxDzjyTtkJY+i9twLJWbpoULtb8gzRx8bvJJ9cqqQuaFUOsP3HNp1TdGZojj9f5tXbRHII
	XiUcQU3D0Z6oahHdlwPxYgWXJkMbJVlLiOoL5XXmDXnurpggITtRq8iY7HA36Q4UYlVcXoSQ9V9ku
	bcBaAsaHWmxUVjb3PCy46OCjOYsmaL/oIwJPhUaaahEj2qLagBG91BwFmA3BP09du6DSQbySGaohO
	/2tiYJZw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKHB-00000005ddF-031A;
	Wed, 25 Jun 2025 07:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F8F44AFEC;
	Wed, 25 Jun 2025 07:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303BCC4CEF4;
	Wed, 25 Jun 2025 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835429;
	bh=1DNk7tX1YvvlA6uSWHlfTS+Bb3s1eS+aWteQQPlb1JM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nqVpQzpxUnKXPMGrZ1EGYozacdniZ2Ei1z0BDb9CArbXCIdhByuU9MICPVrjgSPOs
	 7I9XtCbuuhB6jWShxX4zi3pBcGSRDxsestEYjY/AaCTGarh3AmLmMYGVmsNHH1evss
	 mVm19s4IODFj3zJjHA7UoVak1Yktt1eeG3x4UvGqP1eBFy9no7S/Z2ct6nwLqYlGJV
	 Hfjb4JOyB1ZwjnDHOmsYhRJU6IML4Cg4wPn/XWbASQCigU+IWieRPJoRfKCL2onHLw
	 c93er26kDV2ZMVmMh48fmsPNOWrh8d0egdKTyR/kurxPY6+tKSegQkxGRUJK1Iqp4n
	 jcy1kRYUqSgXw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 05/18] lib/crypto: sha512: Do not include <crypto/internal/sha2.h>
Date: Wed, 25 Jun 2025 00:08:06 -0700
Message-ID: <20250625070819.1496119-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_081033_278943_8AB5800B 
X-CRM114-Status: UNSURE (   9.80  )
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

Since the SHA-512 code is now consolidated into a single translation
unit except for assembly code, there is no longer any need for an
internal header.  Indeed, lib/crypto/sha512.c relies on
<crypto/internal/sha2.h> only for indirect inclusions.  Stop including
it.  This prepares for the later removal of this header, once the
SHA-256 code is reorganized similarly and stops needing it too.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha512.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/crypto/sha512.c b/lib/crypto/sha512.c
index fe9d98b9b7db9..f5a9569a7ef96 100644
--- a/lib/crypto/sha512.c
+++ b/lib/crypto/sha512.c
@@ -7,15 +7,16 @@
  * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
  * Copyright 2025 Google LLC
  */
 
 #include <crypto/hmac.h>
-#include <crypto/internal/sha2.h>
+#include <crypto/sha2.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
+#include <linux/unaligned.h>
 #include <linux/wordpart.h>
 
 static const struct sha512_block_state sha384_iv = {
 	.h = {
 		SHA384_H0, SHA384_H1, SHA384_H2, SHA384_H3,
-- 
2.50.0


