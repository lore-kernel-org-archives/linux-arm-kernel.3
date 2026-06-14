Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1181BCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 21:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x5PL9ea68ETMoE/me7VchVD3ZaplPIV6ryZDRpLN4uU=; b=k9FnUa5vSyX4Otl3grfFxIO2XW
	2RdjPDLcrEoEgMMOdOq7gZ8t6HmGTwCQSBsfuNfnR4uJVZXth2RUoNHxIrJnF6YXPcxThILWv3xt0
	6u9d7wW8UVnhTSpipRUGZutI9np6LrI3jPT9S3FCYf0oGLYXYWY6aKKuyl0oPFc/+CXQjpPtlJZVy
	2LMyQ3Wxfobvfk8bUoShLWa5YLWTyct1Vm+0iU5KDgAHpt1BedL2BtJL6qOQSStuF9z4v8rfmsdrR
	9YWsB6DPTdsR+FMP7F7EIKP9nYZddENX7Tk8d1FTmZTLadbv2V/4/QZr9gqA1mz4IFXRipZJqUNIU
	Y1X9o4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYry8-0000000DIJJ-2jCu;
	Sun, 14 Jun 2026 21:02:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYry7-0000000DIJA-3abD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 21:02:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F082143A05;
	Sun, 14 Jun 2026 21:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00EE1F000E9;
	Sun, 14 Jun 2026 21:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781470930;
	bh=x5PL9ea68ETMoE/me7VchVD3ZaplPIV6ryZDRpLN4uU=;
	h=From:To:Cc:Subject:Date;
	b=DnL97brAJwWsRnbft2pAvI6LhC44L+A+or5qP9u5r5vret8j3fO/knh/Payo1LFUi
	 ciEFh4xbJHSSzl+SrYmvlwaF0hCP2j5rNZJc3wTNMaMWbCVwM1P2f6K0fEvp3y6Wk+
	 qjNgktpemBXnmDOcOkEZd0qmq9x31Ammny8roA1Hg35bAMO7hEm17lGbIOAHUTNruE
	 X3wAhWdTRMRwToz7jU0zLKAYr/TY4xHB0M93FKFg6FiGwwqmUi9DJgF61LsWm0SXeM
	 K8Qa0dRUWC+zyEvRL/jibWjjFgvrEVQ5db03zFnV/ltJfv3j9FXFG7TtT1tI8eFszF
	 +n7kxmpgPpj4w==
From: Tejun Heo <tj@kernel.org>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: ast@kernel.org,
	andrii@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	memxor@gmail.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	rppt@kernel.org,
	arighi@nvidia.com,
	emil@etsalapatis.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next] arm64: mm: Remove misleading pte_none() comment from ptep_try_set()
Date: Sun, 14 Jun 2026 11:02:09 -1000
Message-ID: <20260614210209.2371030-1-tj@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This comment was thoughtlessly copied from the x86 version and doesn't
apply to arm64. Remove it.

Reported-by: Will Deacon <will@kernel.org>
Signed-off-by: Tejun Heo <tj@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 3ce0f2a6cab6..b0213799ebc4 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1830,10 +1830,6 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 	return __ptep_get_and_clear(mm, addr, ptep);
 }
 
-/*
- * Note: strictly-zero compare is narrower than pte_none(), but the gap is
- * harmless: a fresh kernel PTE has no software bits set.
- */
 static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
 {
 	pteval_t old = 0;
-- 
2.51.0

