Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0C1C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+b83bGMCzyEzByJ+5LU82nBa96lT9m0LV7qEzNfGOc=; b=s3JavNunnpTo96iP0pIZAufK1A
	rN0fGJg8KNFxg/p+ssgzYJ3o8BzhBP+mTVEibw8U3GfHwiWG12r7dRKK/4hH9UNQUp2oZJx6MbFln
	2wg7aJWzRymwlJCFPhfMNvw4O7cUS3TcVIrakkqprHmV4fvHypHuF4/7QR9p76XIytl/JwDIoDtDs
	jgBahTVmn1RfbYyRgF4bNQ8eSt4tD5jnGYbIGZ1BIqUpbo4o25/pi/ecHVV5e2bKaOUDSHFAPilTX
	Ois2Q2IYRpZHJCElzZFrLXR7PLsqf1EjKtpaRj3rr0qEiSoegLF4Ofkqu1UFYvLqTxB6AHu2qX4A2
	5NaLanPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKXS-000000086ZI-0Z5J;
	Tue, 18 Aug 2026 14:11:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKXM-000000086W4-3lK6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:11:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AD8B152B;
	Tue, 18 Aug 2026 07:11:28 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 690E53F85F;
	Tue, 18 Aug 2026 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787062292; bh=+OGpwgzVEkFFPsMOgL6J2ZFY9bOrw4hijWLmgpJn7uk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GqWBrhBuTT2Z+RmPO2jLniGoqbeXO1MzPDp17DBjTk6bl6eWab6GB6sMhri7bvzCZ
	 ZkuQWZHbRHdq/2nDVNSoTGEdT3paXyJEiQETePGSw3zcJSwQPT4uDOjGeWz7V18zMZ
	 UFO845i7sIb0wTMe6wGNhlTHQ4KzOxZVW3YVXE0Y=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 18 Aug 2026 15:08:44 +0100
Subject: [PATCH RFC v9 02/25] set_memory: Introduce set_memory_pkey() stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-kpkeys-v9-2-743ad31b2c8f@arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
In-Reply-To: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 =?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787062276; l=917;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=+OGpwgzVEkFFPsMOgL6J2ZFY9bOrw4hijWLmgpJn7uk=;
 b=fzhJpHPj7MYRTjp/HCw+erSxU/CpJ6la1guJcVIYXR3YYwefH56ufe+Ej8z4qIeVthMvdJfjR
 FRItISUl4vcBKIMhTDxfFQ0oZ4ArYUUIpp0VT9dk/lF5oTo/1vMcX50
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_071132_989138_9E158E05 
X-CRM114-Status: GOOD (  10.11  )
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

Introduce a new function, set_memory_pkey(), which sets the
protection key (pkey) of pages in the specified linear mapping
range. Architectures implementing kernel pkeys (kpkeys) must
provide a suitable implementation; an empty stub is added as
fallback.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/set_memory.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 3030d9245f5a..7b3a8bfde3c6 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -84,4 +84,11 @@ static inline int set_memory_decrypted(unsigned long addr, int numpages)
 }
 #endif /* CONFIG_ARCH_HAS_MEM_ENCRYPT */
 
+#ifndef CONFIG_ARCH_HAS_KPKEYS
+static inline int set_memory_pkey(unsigned long addr, int numpages, int pkey)
+{
+	return 0;
+}
+#endif
+
 #endif /* _LINUX_SET_MEMORY_H_ */

-- 
2.51.2


