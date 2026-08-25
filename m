Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37DEC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 20:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dvG8fDOHWdM0omtWZoCkfRi9vcvwSeryRVWH7Ed/eA=; b=gUzK42+KV7Qttll9BQZ2xZWoJz
	3hU43psZHKJA3ppPhVVWGiWF62QSP3r5Z22/qBmfC8CcSIqXODQpoqha5/fUp/JX6oGjNlFClIxQg
	/JuNVB27GpmYgd1Isf4TgtgqPm7J7ZO0/FmmS/oTkfECtkP8JH2TF9IHV7663sRdcCBgMMtnX5E5S
	qHorG+t4tVZmpyHfRKJjUMa1buZKa3AaGnwlOezVeLMQH5TjubmDIiarrLQhIOsI5pjk0luUBj/lJ
	gjV+MBvjKmzw98UGrUqyJZ/As2B1986kP5dLDYVRvXLBfSkU7m05+5hv72bnv3iPVd0oIZqOycLej
	K8q2c2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyES-00000001StO-2kbd;
	Tue, 25 Aug 2026 20:58:56 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyEI-00000001Snb-3Mnt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 20:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691523; bh=/dvG8fDOHWdM0omtWZoCkfR
	i9vcvwSeryRVWH7Ed/eA=; b=iWF9+jgBqpWuT2caZOg1KqUlbwkPytLMdB2DTCjmkP9zbsd/b2
	S6oOlZ0c1MjKs+pQrTpht1YuHOIA9K/5ffWM+2P+wFJUjlYS9N1cTTUTa2Vao1SVtDQk0H6yIaC
	lLAtal59xykEcKDMp8pOZuJ/9B0dAm3BLRoXm51EcnW5xDpu9KQCw4e/bbpqvYs4p1PdV85ERhB
	iJmGplpMTpklGej0CZwKq+TmDxrG09TNly5BSfNlqqEEr4JY3BlF/c18wanc2XnV8agvEuf4LDQ
	43WFz2KS+IHjh/Tszb4UqSD2h+79fCl+d7cSa1hyDBNW3641UCCZk76x7ne5hbdiU/w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691523; bh=/dvG8fDOHWdM0omtWZoCkfR
	i9vcvwSeryRVWH7Ed/eA=; b=rBIxKT78xLkDYZW6vyVR5Ozc3cNsqYS2hd8VWTZYvR0KGD30Rf
	m5I5h+aIU1YXMNfestrvUi5otXuPP6HE7kCg==;
From: Bradley Morgan <brads@mainlining.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH 6/7] arm64: hibernate: only clean to PoC
Date: Tue, 25 Aug 2026 20:58:38 +0000
Message-ID: <20260825205839.14571-7-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825205839.14571-1-brads@mainlining.org>
References: <20260825205839.14571-1-brads@mainlining.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_135846_993876_EDA07C9A 
X-CRM114-Status: GOOD (  13.90  )
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

The hibernate code has to clean parts of the kernel to the PoC so they
can be used with the MMU off. We only need to clean to the PoC, but we
have been using dcache_clean_inval_poc(), which does a clean plus
invalidate, just because that is what was available.

When hibernate was added in commit 82869ac57b5d ("arm64: kernel: Add
support for hibernate/suspend-to-disk"), the only cache maintenance
exposed outside the DMA code was __flush_dcache_area(), so that is what
got used. Commit d34fdb7081394cbf ("arm64: mm: convert __dma_* routines to use start, size")
later exposed dcache_clean_area_poc(), and commit fade9c2c6ee2baea
("arm64: Rename arm64-internal cache maintenance functions") renamed
things again, but the hibernate code never switched over either time.

The invalidate is pointless anyway, since the mappings we clean through
are cacheable and the CPU can just pull the memory straight back into
cache right after. Use dcache_clean_poc() instead.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/hibernate.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 30b02e39a397..60e264299a4d 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -367,18 +367,17 @@ int swsusp_arch_suspend(void)
 		swsusp_mte_free_storage();
 	} else {
 		/* Clean kernel core startup/idle code to PoC*/
-		dcache_clean_inval_poc((unsigned long)__mmuoff_data_start,
-				    (unsigned long)__mmuoff_data_end);
-		dcache_clean_inval_poc((unsigned long)__idmap_text_start,
-				    (unsigned long)__idmap_text_end);
+		dcache_clean_poc((unsigned long)__mmuoff_data_start,
+				 (unsigned long)__mmuoff_data_end);
+		dcache_clean_poc((unsigned long)__idmap_text_start,
+				 (unsigned long)__idmap_text_end);
 
 		/* Clean kvm setup code to PoC? */
 		if (el2_reset_needed()) {
-			dcache_clean_inval_poc(
-				(unsigned long)__hyp_idmap_text_start,
-				(unsigned long)__hyp_idmap_text_end);
-			dcache_clean_inval_poc((unsigned long)__hyp_text_start,
-					    (unsigned long)__hyp_text_end);
+			dcache_clean_poc((unsigned long)__hyp_idmap_text_start,
+					 (unsigned long)__hyp_idmap_text_end);
+			dcache_clean_poc((unsigned long)__hyp_text_start,
+					 (unsigned long)__hyp_text_end);
 		}
 
 		swsusp_mte_restore_tags();
-- 
2.47.3

