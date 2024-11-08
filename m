Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE926D5E15E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 11:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ht0KwdUu8vhgOCoU/2KtiL4NjDHTBnEZp3rYkkHOdBg=; b=Fm5NjLux9jhkaL+is/Hn/9H195
	URKeRIJ8UsTkrCoow9DrU6n/kJBj16LFEg5pPEJKQHa48k/juknYCQ3YnvGfrTuI/rv+6Q9iVaun3
	Pxq5seqmPJEy3ouBXE5ee3Y7jNNMM6ZUumi1Z1RVRDpYBzg/fU3UJrdnoNaiBL0NTlMOxeqhA12bK
	ejyoZ+rGgk3jskL7U4zkhMvi4eIjeRbpZJ5Egpy7N/Si2RcwCm82OQa0zbngTeE50M1w7cKr59SQy
	XI6cptC7A9ZHef8OfN3qWSfBXfILJzXMxzuIRgKb7SiLKAYlSV8+esOgbADjuApV9vQKLsgJeZLUh
	DBNr2ulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NSN-0000000AOpP-1Gbw;
	Fri, 08 Nov 2024 11:47:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9MoM-0000000AH0r-0BVD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 11:05:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DC89A41F44;
	Fri,  8 Nov 2024 11:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F09FC4CECD;
	Fri,  8 Nov 2024 11:05:51 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Subject: [PATCH] selftests/mm: Fix unused function warning for aarch64_write_signal_pkey()
Date: Fri,  8 Nov 2024 11:05:49 +0000
Message-Id: <20241108110549.1185923-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_030554_183742_63C56877 
X-CRM114-Status: GOOD (  12.24  )
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

Since commit 49f59573e9e0 ("selftests/mm: Enable pkey_sighandler_tests
on arm64"), pkey_sighandler_tests.c (which includes pkey-arm64.h via
pkey-helpers.h) ends up compiled for arm64. Since it doesn't use
aarch64_write_signal_pkey(), the compiler warns:

In file included from pkey-helpers.h:106,
                 from pkey_sighandler_tests.c:31:
pkey-arm64.h:130:13: warning: ‘aarch64_write_signal_pkey’ defined but not used [-Wunused-function]
  130 | static void aarch64_write_signal_pkey(ucontext_t *uctxt, u64 pkey)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~

Make the aarch64_write_signal_pkey() a 'static inline void' function to
avoid the compiler warning.

Fixes: f5b5ea51f78f ("selftests: mm: make protection_keys test work on arm64")
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---

I'll add this on top of the arm64 for-next/pkey-signal branch together with
Kevin's other patches.

 tools/testing/selftests/mm/pkey-arm64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/pkey-arm64.h b/tools/testing/selftests/mm/pkey-arm64.h
index d57fbeace38f..d9d2100eafc0 100644
--- a/tools/testing/selftests/mm/pkey-arm64.h
+++ b/tools/testing/selftests/mm/pkey-arm64.h
@@ -127,7 +127,7 @@ static inline u64 get_pkey_bits(u64 reg, int pkey)
 	return 0;
 }
 
-static void aarch64_write_signal_pkey(ucontext_t *uctxt, u64 pkey)
+static inline void aarch64_write_signal_pkey(ucontext_t *uctxt, u64 pkey)
 {
 	struct _aarch64_ctx *ctx = GET_UC_RESV_HEAD(uctxt);
 	struct poe_context *poe_ctx =

