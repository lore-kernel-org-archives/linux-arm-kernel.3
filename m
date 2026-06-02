Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2129ECD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/nEIbnakCut4PPJaCdQL+A43yQkp7C92xn2uZmD9N4=; b=B9ZhqVTjCE4osvdTteVGtrCnF7
	wUqeCOxHFUsRwAGceN8y2kJC/+UfqadwB5eStjuJkYpEGM7M6bfdjU4PvT3mV5B8p6F5Vem0PxUdb
	mM8mMkNAAU5RXAUDgZLGW9+qdfFAY6J9ZLbfYunQDtTtW5R9aJOo2BsfT3Od4P6yXiGGMXTDKj99d
	zJ+7S+yB436/NcqWSU6JJyvzFeKoCySsOiy8qu+b5NOaZNzu2bDPVAyZYxCBl5dnVmEU/KH5S8OnT
	bnQkWig0KnFou9Ghzthr2AzzFkReMvLQpi7IKY+zVbnOvjvxS6SEd18wp1H0UEwLAu4NzctG1+Qfq
	gcRBRz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQmw-0000000DGPS-0Uhq;
	Tue, 02 Jun 2026 15:12:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQmr-0000000DGMG-2CD6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:12:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FE363573;
	Tue,  2 Jun 2026 08:12:06 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E3A53F7D8;
	Tue,  2 Jun 2026 08:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780413131; bh=IabF/qhrKADpVfYSXfZTKIbKpsiQcARly16NJbg+a/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VCeBIblMqNdooc4SEP68CT37qb4S7n05TdKsTWhDmeO0gHYHZhysUktSqiAEOVv1k
	 BOT6FT1vJ6fpIQ3reFbhW69Xk7azwm2+Lovb/qRTwR6YM8yDgyxlKYCffUaS3lP9/v
	 tS6LN0eBMCtfMnXXdot3EkOznGX3j4sofTwIReUs=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	tabba@google.com,
	vladimir.murzin@arm.com,
	will@kernel.org
Subject: [PATCH v3 01/18] KVM: arm64: Don't include <asm/fpsimdmacros.h>
Date: Tue,  2 Jun 2026 16:11:33 +0100
Message-Id: <20260602151150.925126-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260602151150.925126-1-mark.rutland@arm.com>
References: <20260602151150.925126-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_081213_637434_2DABD10F 
X-CRM114-Status: UNSURE (   9.03  )
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


