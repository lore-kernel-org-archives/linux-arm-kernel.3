Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F54ED43352
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qXP9PtnD3J1SEZfBjhXKxJm6M7T6ar/XdT7J55dA7tI=; b=obo0SjoUHs7JbsWVMj5EzYUZNM
	kEJjjW7axaSBxCzQxJqOwZMkLlyOtyVr/MzluU4vLJRo0BcwMhUwZWfN2YSBW2SfLvusq6gzeihN8
	beSclKDdcy+YGYR4AvKf8Mm9jhkedlUkQ3OnPSDAi5NhNm4WMoExgHGiOTRU4NAoJF7bYhXcVm9si
	ql/ivZcx1y2BVtOPsivdSifaW0SkIohzkfbTKY9/pNYYh0ljlb+B14u8LzkBJSkZ0ijwt6xMoCSaA
	FRv7V0N+SD/G6DWuND9MIxlQPwmmSGBdf8b/2+CU//xxmlFp8eTQZYUaPxrQOzvA4DXbEGDB30eBM
	GlVEB9rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t92Q2-000000074CQ-2aMm;
	Thu, 07 Nov 2024 13:19:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t92OI-0000000743z-0wgN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 13:17:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 808B7497;
	Thu,  7 Nov 2024 05:18:04 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35CED3F66E;
	Thu,  7 Nov 2024 05:17:33 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	yury.khrustalev@arm.com,
	will@kernel.org,
	linux-kselftest@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Aishwarya TCV <aishwarya.tcv@arm.com>
Subject: [PATCH] selftests/mm: Define PKEY_UNRESTRICTED for pkey_sighandler_tests
Date: Thu,  7 Nov 2024 13:16:40 +0000
Message-ID: <20241107131640.650703-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_051738_324749_D3F32381 
X-CRM114-Status: UNSURE (   7.57  )
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

Commit 6e182dc9f268 ("selftests/mm: Use generic pkey register
manipulation") makes use of PKEY_UNRESTRICTED in
pkey_sighandler_tests. The macro has been proposed for addition to
uapi headers [1], but the patch hasn't landed yet.

Define PKEY_UNRESTRICTED in pkey-helpers.h for the time being to fix
the build.

[1] https://lore.kernel.org/all/20241028090715.509527-2-yury.khrustalev@arm.com/

Fixes: 6e182dc9f268 ("selftests/mm: Use generic pkey register
manipulation")
Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---

Based on arm64 for-next/pkey-signal (49f59573e9e0).

---
 tools/testing/selftests/mm/pkey-helpers.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
index 9ab6a3ee153b..319f5b6b7132 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -112,6 +112,10 @@ void record_pkey_malloc(void *ptr, long size, int prot);
 #define PKEY_MASK	(PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE)
 #endif
 
+#ifndef PKEY_UNRESTRICTED
+#define PKEY_UNRESTRICTED 0x0
+#endif
+
 #ifndef set_pkey_bits
 static inline u64 set_pkey_bits(u64 reg, int pkey, u64 flags)
 {
-- 
2.43.0


