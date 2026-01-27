Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B96FD2F02E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mLQnsl8W6LI3YyHD0cgZ828WlS2y8nLbvfa/HBL+XbU=; b=e6t1U9m4RIbKFWi7sNfcAckBlg
	38XpVW7IbJ+QprkdI07seZ7qixiQL/vgTDSo7LVAP8lfwyLpYYlmHPQyxGyqZ3Fqicx2joF7ls8+v
	UqYY8x5QVpy/5BtUjZQVDbLE9JC/wfzA4XMAX0XDI4pI8kEMzsDGrW0RM//Hkyh2kbvDm+uOSy/FG
	katR97wx3ME4VDEhVGCN45opgtZNw4J6gKLMVQO435D+t+qZyKgPfvyfGf9TmAUkgpiyCjmXMOiMW
	b7wNW5MHq4mJzW6pMRWQR7kDLKeYbdXC1RLEYXRD8vKz1/KZZMMXc+HFEkB9Y6npOK5NDZfOrWSwc
	AUBaHWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjIE-0000000EJvl-02JM;
	Tue, 27 Jan 2026 13:39:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjIB-0000000EJvQ-2jbP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 13:39:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 662E91595;
	Tue, 27 Jan 2026 05:39:30 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99E0C3F632;
	Tue, 27 Jan 2026 05:39:35 -0800 (PST)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: david.spickett@arm.com,
	joey.gouly@arm.com,
	kevin.brodsky@arm.com,
	mark.rutland@arm.com,
	stable@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2] arm64: poe: fix stale POR_EL0 values for ptrace
Date: Tue, 27 Jan 2026 13:39:26 +0000
Message-Id: <20260127133926.2677180-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_053939_750731_F7B1D54A 
X-CRM114-Status: GOOD (  12.16  )
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

If a process wrote to POR_EL0 and then crashed before a context switch
happened, the coredump would contain an incorrect value for POR_EL0.

The value read in poe_get() would be a stale value left in thread.por_el0.  Fix
this by reading the value from the system register, if the target thread is the
current thread.

This matches what gcs/fpsimd do.

Fixes: 175198199262 ("arm64/ptrace: add support for FEAT_POE")
Reported-by: David Spickett <david.spickett@arm.com>
Cc: stable@vger.kernel.org
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm64/kernel/ptrace.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index b9bdd83fbbca..8a14b86cd066 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -1486,6 +1486,9 @@ static int poe_get(struct task_struct *target,
 	if (!system_supports_poe())
 		return -EINVAL;
 
+	if (target == current)
+		current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
+
 	return membuf_write(&to, &target->thread.por_el0,
 			    sizeof(target->thread.por_el0));
 }
-- 
2.25.1


