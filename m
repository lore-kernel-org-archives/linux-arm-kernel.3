Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0FFC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FV+wfclkzugbLkCy54mYHKEPBH8PIJdPMzEm1zgdoXI=; b=k0oqMZ4IhN0c+PTt4cQDmgkAR5
	ivy5gVhRQqPw5qPrqabZCKO6btUAmemMsPaL4WdZ7y9r29EG8rB9RLXHifWcLYkQSq1NS7CiQ9CzJ
	Fk3rOKZZaTCTC39qpI4OC7P6yYSpG8pFrLe+AWIDuydY47/IiNZ4inTsjdjz5oLEOoGnvrUFiMkOO
	jMXopA+KoQQ0aAFzau3Lnzfr60nzfZj88DATNCLuD5VA3KnBwzhvZt72qjUhAbPRC7s6aCkXD2CAR
	wgTcSQVKWBREZ+hHWq8hRaT6KOCC9XHw3WYQcMq25NJxDBnJJ5rfuXB3WypXVt11mDRhp2Hyl2NDM
	czc/GbZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pS-0000000364m-3LWW;
	Mon, 14 Sep 2026 10:22:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63oq-000000035Rc-0sGK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA4F01570;
	Mon, 14 Sep 2026 03:21:42 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5A85F3F7B4;
	Mon, 14 Sep 2026 03:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381306; bh=sxbfNwTeofefRK40dY20hCsJdqocgeFdoKXP7oZ9jBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VTS4P4xskLaT2InuTUg4ck/2ukTIUcn/kVKE8qpxb6C0sKl2UcjLZts1l+nXxaV0W
	 4fLrMmFopO3igfrrVktMwadHE9jHaSd+eVFJpztHzdlziTtyV2dLlAwBX96kIq5VBz
	 w9oV6LYmCrP4zMvc6snpo4U9xvJYgLpEyXKuow6U=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 13/38] arm64: cpufeature: Remove system_has_prio_mask_debugging()
Date: Mon, 14 Sep 2026 11:20:37 +0100
Message-Id: <20260914102102.68597-14-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032148_291462_9EBB9510 
X-CRM114-Status: UNSURE (   7.09  )
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

Users of system_has_prio_mask_debugging() have gone, so remove it.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/cpufeature.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 4f04ad82ea34..09aa80df602a 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -814,12 +814,6 @@ static inline bool system_supports_mte(void)
 	return alternative_has_cap_unlikely(ARM64_MTE);
 }
 
-static inline bool system_has_prio_mask_debugging(void)
-{
-	return IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING) &&
-	       system_uses_irq_prio_masking();
-}
-
 static inline bool system_supports_bti(void)
 {
 	return cpus_have_final_cap(ARM64_BTI);
-- 
2.34.1


