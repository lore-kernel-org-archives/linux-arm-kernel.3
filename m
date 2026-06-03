Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A20CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/nEIbnakCut4PPJaCdQL+A43yQkp7C92xn2uZmD9N4=; b=FLyZ+CCJXL+TQb4l4nZwfD69vU
	izIy3iTQbUXV/9Rij582KOyU5fHhq3OBEzyBokYQEd7q1pFWkeoFpyhNzdv612n3Nr9RsrBbw7M9c
	fGUPhAEblntsl7AhIG+oUa2curL6TeOmJ6CdJWG3YRcGQndLmU4qTk96MaoPmi9+6tR9LW0dSRHFt
	DUi/QI6pPijGiCWqbT+PMWq3HK9aZ69tqWgcjyPA1JAQvgs/5wpgx/aGS9VGZfygpeJHbZE3BMP8i
	oOtTgAiWTpJsCtltHaJIH9YLyPheQZH4dwh9/N3y1s8VkxipphK+dpPAAMEXfBRGqR2u/e7qS7D2e
	bYqASRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjQx-0000000Esv8-3L4j;
	Wed, 03 Jun 2026 11:06:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjQv-0000000EstA-0j9J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:06:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2D2232E4;
	Wed,  3 Jun 2026 04:06:43 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D203F3F86F;
	Wed,  3 Jun 2026 04:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780484808; bh=IabF/qhrKADpVfYSXfZTKIbKpsiQcARly16NJbg+a/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JwLGLwerbUUjbzMIgEZSrZfLshH52L5HoP+gseROdIxQBRaPDXse9soqAsuZPpyos
	 Zgp1NYrA9fqol9Wd5l0eW0rZ9WU4Tu1J75NltXl/+X9OF2kGkIW+8YntGay7NZ7E9M
	 5SOk8NoAGEsvnK65j0+XDQeRuzuTrZFyoRx2EMic=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	stable@vger.kernel.org,
	tabba@google.com,
	vladimir.murzin@arm.com,
	will@kernel.org
Subject: [PATCH v4 03/20] KVM: arm64: Don't include <asm/fpsimdmacros.h>
Date: Wed,  3 Jun 2026 12:06:13 +0100
Message-Id: <20260603110630.1027435-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260603110630.1027435-1-mark.rutland@arm.com>
References: <20260603110630.1027435-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040649_247405_738C4DA5 
X-CRM114-Status: UNSURE (   9.33  )
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

There's no need for hyp/entry.S to include <asm/fpsimdmacros.h>.

The fpsimd macros have never been used by code in hyp/entry.S, and were
instead used by code in hyp/fpsimd.S.

Remove the unnecessary include.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/entry.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
index 11a10d8f5beb2..308100ed25de9 100644
--- a/arch/arm64/kvm/hyp/entry.S
+++ b/arch/arm64/kvm/hyp/entry.S
@@ -8,7 +8,6 @@
 
 #include <asm/alternative.h>
 #include <asm/assembler.h>
-#include <asm/fpsimdmacros.h>
 #include <asm/kvm.h>
 #include <asm/kvm_arm.h>
 #include <asm/kvm_asm.h>
-- 
2.30.2


