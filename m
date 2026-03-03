Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38007E67A6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 06:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pULSeUtzOPPUmAeWig0JTMg4Is4eMOysTC4/LlGbY1A=; b=UcFUvmkNd7r3wpqxl9VZTeduVh
	biN+f3OTr6RChmusepBDsePxQjJyzKNKExAr84V25jAdQEbTA8qliM34iQlp8k7cw3sCvILkM/5xm
	jpV3PYZ1PWw5izOim0OABycWnqhLuW4NwzQ0gfavKpf4IxUV2NAlfHE0fBzmCqqxpiMTM0rZf0/OF
	OiQRygml0gj1+wPAzPWU0idyBTRURAeewvfDL3I0zKxb7bGMvuZRFqPKfXKWZxOoIeqLVTRZZmQhf
	2s8ovHLi5mn4YrrXHdQCo6O+75g8QjAETQNlkd/srcVkmrtuubGxHOHAwPwaAZ83N0YO1dPYKejE1
	iNo/cqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIsw-0000000EaEs-3x8h;
	Tue, 03 Mar 2026 06:05:34 +0000
Received: from smtp.jvdsn.com ([2603:c020:1:bd00::1:3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIsv-0000000EaES-0sB7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 06:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jvdsn.com; s=mail;
	t=1772517930; bh=enmyVlM9QgRzuKEYUPIKv1hMr+WrNhZ5gYCBMQMAZ8E=;
	h=From:To:Cc:Subject:Date;
	b=pukjEq0F6SSJxbGXZm4eRcDDr/58o6BsyXvGMdFuIYlRHB03PKiyOyT99FdaLfnVm
	 CQwEBGx+A5njCdAYb+wqe+iiwWSzyJcw0k3/CMzNJXB1BtR1wItUSmMO7pTB35oOO9
	 JVzYGwEesbjmsT/K+8SzeLfMN81/pf/5dMwgwyCW/17JbYNXfwTr2hQaGQRwVrL+rC
	 mY8HQlOL2uM9RCYbklJrfp5hmqM932HwgdeXmtOOQ/kPdZ/vbMIhdyGdwYALME0wOY
	 wxDo/CUdzYRUV5yq+6fb8sk7Dqn5aX6jspqDs/trmV8xXfY3S+sfx5CRZdUmC50PdF
	 HRMonRhp1VC7w==
From: Joachim Vandersmissen <git@jvdsn.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Joachim Vandersmissen <git@jvdsn.com>
Subject: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
Date: Tue,  3 Mar 2026 00:05:09 -0600
Message-ID: <20260303060509.246038-1-git@jvdsn.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_220533_308391_6F2D967B 
X-CRM114-Status: GOOD (  10.85  )
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

xxhash64 is not a cryptographic hash algorithm, but is offered in the
same API (shash) as actual cryptographic hash algorithms such as
SHA-256. The Cryptographic Module Validation Program (CMVP), managing
FIPS certification, believes that this could cause confusion. xxhash64
must therefore be blocked in FIPS mode.

The only usage of xxhash64 in the kernel is btrfs. Commit fe11ac191ce0
("btrfs: switch to library APIs for checksums") recently modified the
btrfs code to use the lib/crypto API, avoiding the Kernel Cryptographic
API. Consequently, the removal of xxhash64 from the Crypto API in FIPS
mode should now have no impact on btrfs usage.

Signed-off-by: Joachim Vandersmissen <git@jvdsn.com>
---
 crypto/testmgr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 49b607f65f63..d7475d6000dd 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5609,7 +5609,6 @@ static const struct alg_test_desc alg_test_descs[] = {
 #endif
 		.alg = "xxhash64",
 		.test = alg_test_hash,
-		.fips_allowed = 1,
 		.suite = {
 			.hash = __VECS(xxhash64_tv_template)
 		}
-- 
2.53.0


