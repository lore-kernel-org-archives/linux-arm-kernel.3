Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BE4C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 18:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+4y8TmBDjghp9ErYULHBpdj/Hhdpt9SH44oaM2jpwQ=; b=aWqX3rZoG4d/lLdTrbtYky8+9n
	p3ZPuZMaCwCjFTqOLTP2jmkQtEOFPFEFTpiL+CBLiKWzV/KnJuyGJn7puPOxTdcxBoGpKP6hJJUgN
	NA+bM0u1GKJ2StaW3f9CdIawptWylqCE5jrDXj8Uoj5pL9vXeVLLfZJ17qxCe8w9awdD2+55Hefvh
	PwShdDn59k+YAifPicHNtyGvLYpLh3EGnp5/r8+2HdElF8k+qTx0d5vuZHYzKfqOcxQOB203OrbYB
	6S/KPwmZhjqjmXjrT7EP6U5oRMCW1/n15lehfnqDQjuH1zJ8zQ29/os5oUdloJ5BCpfssp9uFwY22
	ZsZhfSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKp-00000003ONS-3AgK;
	Mon, 27 Jul 2026 16:37:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJA-00000003NHX-2wuY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:36:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C31D11758;
	Mon, 27 Jul 2026 09:35:59 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA0ED3F86F;
	Mon, 27 Jul 2026 09:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170163; bh=8a4Lq+OUcgJzJ0Ua9TeNCsVDA3ko6/NnIYp5erySm30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xx+EKDuVYlAPrnst55kS99zRwYejilUFA+ud11iWN2KLFkW7TqH6XApIOeO2RoIAr
	 DNLj6DKG5b3ZSV064e/THKkrwYerP/Ggh/TbfiKPgOLF3GK7TPmTLSIl1+9FcndiC7
	 D5F/BY7TwTdtLwYdJaEaM9oK6Qw1WYCgP2VfJ3/o=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 35/45] arm64: suspend: Always initialise PSTATE.ALLINT
Date: Mon, 27 Jul 2026 17:34:43 +0100
Message-Id: <20260727163453.7969-36-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093604_825942_2C0E8B7A 
X-CRM114-Status: GOOD (  11.53  )
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

PSTATE.ALLINT is always set to the inverse of SCTLR_ELx.SPINTMASK,
regardless of the value of SCTLR_ELx.NMI. SCTLR_ELx.NMI is initialised
to 0 by default, so PSTATE.ALLINT does not cause any interrupt
masking. With upcoming FEAT_NMI support, SCTLR_ELx.NMI will be set as
part of the enable sequence.

However, during CPU suspend/resume, we reinitialise PSTATE to
INIT_PSTATE_EL1. INIT_PSTATE_EL1 currently does not set
PSR_ALLINT_BIT, but SCTLR_ELx.NMI is restored from the saved
value. Since all exceptions are masked during CPU suspend/resume,
avoid a state where SCTLR_ELx.NMI is restored to 1 but PSTATE.ALLINT
is clear, since that would permit an NMI during resume.

Include PSR_ALLINT_BIT in INIT_PSTATE_EL1 so PSTATE.ALLINT is always
set.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/ptrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 16ba164b890e..ad5dcaf66a8f 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -17,7 +17,7 @@
 #define CurrentEL_EL2		(2 << 2)
 
 #define INIT_PSTATE_EL1 \
-	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL1h)
+	(PSR_ALLINT_BIT | PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL1h)
 
 #include <linux/irqchip/arm-gic-v3-prio.h>
 
-- 
2.34.1


