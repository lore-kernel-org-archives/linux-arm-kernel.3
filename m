Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56785CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA5Jwu2TbO2wIihoVRGPmFSfloMwBAJFimdo4qXoLBQ=; b=QrRGom18u5cCr/vxvuSUZSb8qi
	zd5F/EfR5VxAchXz5cSkIIFxCUX2R9Jfs62fD7rLTpgB7hAr0kAZmdoE8hzucrEWxEuRK4HXrXbjy
	mvb7KJXKEdZnCYmEm4Rrsop46N+fJoBBtbD7ysXliQ3LCx9NfNvIfPV+aGcIPGuWrVrA1a7aQFksW
	DknqyzwvPWFVi8FTvDqCo0C4RwKTIyqegXlTDyCmwSqIJTNqIy/MPbBm8cYt56LsGk2Mbu6RTGRQG
	lSWE79A90d2tu0RglxCljsd+fC9mDHlcuWhBXUBWgEZ6uaCBTXRRiKSh7M+MVXwAOQMmhrX0iWToB
	RMqweTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIJv-0000000GnwL-2ZUT;
	Tue, 05 May 2026 16:08:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIJu-0000000Gntx-0jyl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 16:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hA5Jwu2TbO2wIihoVRGPmFSfloMwBAJFimdo4qXoLBQ=; b=MrrmCGPwTVPqZxtQky9oEu5WKe
	3tQeAhj1LQqL/qaEqxiU414C7iODYJNpQOIjC1Fdx4saPYe8H7w7Yjt/FKQ/wh8vQ8ZrFCfxKk/p8
	tAWNhnUVK1D8/Tt0dnB5Fk0YsghPd5sWOLPehWEPHOwexfdV1RnGez1kOKt5ztptA06/cFUSKK2A7
	SdGcbK8UnZpRV3HvZOrJGo/Z199wh9RJcHP+B4QZOSfLSJbvv+GdWzMm4Ff7zC7vF490i1wKulgiG
	CJN4MqzH2K38j7jB7qChJPPjbTrttJTlGKt8St9vn9VhUBp9MUARw7XSxjqhXQXyMppVoMPrVW7+z
	NenAadiA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIJp-0000000Dz71-3VXd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:08:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4394A14BF;
	Tue,  5 May 2026 09:08:15 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C7253F763;
	Tue,  5 May 2026 09:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777997300; bh=omwCAkmx3thEkpkTqNX8z5wj8c3+qOTHKO6WhZwka58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bE7gISU03gq0h755odYFsgUzOaw6UDvswOcJVrHQb7PQhhWyk6yiq+HnvJuqZPmdb
	 Fic9XDvc4cYQn3o6sKXeRw5zTwg5dq3jBAXKilBxXBvI+EicgvKmE9G8KFeMYsisYy
	 npvWbqceXO+gbqx/NjShjbqNXvzlyo8KLckaSZGI=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 05 May 2026 17:06:06 +0100
Subject: [PATCH RFC v7 17/24] arm64: kpkeys: Support KPKEYS_CTX_PGTABLES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-kpkeys-v7-17-20c0bdd97197@arm.com>
References: <20260505-kpkeys-v7-0-20c0bdd97197@arm.com>
In-Reply-To: <20260505-kpkeys-v7-0-20c0bdd97197@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, 
 Yang Shi <yang@os.amperecomputing.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org, 
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777997220; l=1216;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=omwCAkmx3thEkpkTqNX8z5wj8c3+qOTHKO6WhZwka58=;
 b=zfUg7xwypSzq4NEGLAX1n6Kb71opGk8Ba4Dk+wrRWrE1XDWMw4FDZX+FCmdcwhWvH8K1snn4m
 v9noznHVB+MDzDbG8bhnCVOUWISyMPU0c1iJDQMs1vX4UbE0Q2tHNto
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_170822_081104_D39C5F69 
X-CRM114-Status: GOOD (  12.31  )
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

Enable RW access to KPKEYS_PKEY_PGTABLES (used to map page table
pages) if switching to KPKEYS_CTX_PGTABLES, otherwise only grant RO
access.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/kpkeys.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kpkeys.h b/arch/arm64/include/asm/kpkeys.h
index ea915f78936b..0c155b970582 100644
--- a/arch/arm64/include/asm/kpkeys.h
+++ b/arch/arm64/include/asm/kpkeys.h
@@ -12,7 +12,8 @@
  * Equivalent to por_set_kpkeys_context(0, KPKEYS_CTX_DEFAULT), but can also be
  * used in assembly.
  */
-#define POR_EL1_INIT	POR_ELx_PERM_PREP(KPKEYS_PKEY_DEFAULT, POE_RWX)
+#define POR_EL1_INIT	(POR_ELx_PERM_PREP(KPKEYS_PKEY_DEFAULT, POE_RWX) | \
+			 POR_ELx_PERM_PREP(KPKEYS_PKEY_PGTABLES, POE_R))
 
 #ifndef __ASSEMBLY__
 
@@ -33,6 +34,8 @@ static inline bool arch_supports_kpkeys_early(void)
 static inline u64 por_set_kpkeys_context(u64 por, int ctx)
 {
 	por = por_elx_set_pkey_perms(por, KPKEYS_PKEY_DEFAULT, POE_RWX);
+	por = por_elx_set_pkey_perms(por, KPKEYS_PKEY_PGTABLES,
+				     ctx == KPKEYS_CTX_PGTABLES ? POE_RW : POE_R);
 
 	return por;
 }

-- 
2.51.2


