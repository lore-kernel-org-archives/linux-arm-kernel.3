Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B45E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlpiUZXVJE4wuqf5kyWjcLv5Lgea080eX5hNDLP6KoI=; b=1uv52vY1HH/eER3qcFjUs8kEfP
	DiYbfhpjuGsggNM32qSjhE5+87FQwq/iOJ8LOnfUl+qf1fSfajRKvOpeacE09e5WCGfSK62S64Pqs
	bcbhoHjP/ZlC7nRUp7cxA9tkdnRuRDagkWAncd8Ly6JkM14chdek65E+KPhKR9ZOL1khbhU7fNKTr
	NyobaJpJUjPUEtGPmZLiPmdk5NGAtwsU8To/B4qbn+v6yBWUN1PIHxCEmimRBH6gV6ESN8H/J+4fn
	DqegjhH1S4N55hP6FJ1cdUU1vNJBHytHBpQwDVuvBDiPrPEK6yvOw5C2b8OPInX4H3Y4dPkFKQlX8
	HtDIoPdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAvC-0000000Fw7Y-21vN;
	Thu, 05 Dec 2024 12:25:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAn8-0000000FuoT-0x0X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:17:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDF641063;
	Thu,  5 Dec 2024 04:17:37 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1321C3F5A1;
	Thu,  5 Dec 2024 04:17:08 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	joey.gouly@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH 3/4] arm64: ptrace: fix partial SETREGSET for NT_ARM_POE
Date: Thu,  5 Dec 2024 12:16:54 +0000
Message-Id: <20241205121655.1824269-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241205121655.1824269-1-mark.rutland@arm.com>
References: <20241205121655.1824269-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_041710_303443_FF63FDF6 
X-CRM114-Status: GOOD (  13.47  )
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

Currently poe_set() doesn't initialize the temporary 'ctrl' variable,
and a SETREGSET call with a length of zero will leave this
uninitialized. Consequently an arbitrary value will be written back to
target->thread.por_el0, potentially leaking up to 64 bits of memory from
the kernel stack. The read is limited to a specific slot on the stack,
and the issue does not provide a write mechanism.

Fix this by initializing the temporary value before copying the regset
from userspace, as for other regsets (e.g. NT_PRSTATUS, NT_PRFPREG,
NT_ARM_SYSTEM_CALL). In the case of a zero-length write, the existing
contents of POR_EL1 will be retained.

Before this patch:

| # ./poe-test
| Attempting to write NT_ARM_POE::por_el0 = 0x900d900d900d900d
| SETREGSET(nt=0x40f, len=8) wrote 8 bytes
|
| Attempting to read NT_ARM_POE::por_el0
| GETREGSET(nt=0x40f, len=8) read 8 bytes
| Read NT_ARM_POE::por_el0 = 0x900d900d900d900d
|
| Attempting to write NT_ARM_POE (zero length)
| SETREGSET(nt=0x40f, len=0) wrote 0 bytes
|
| Attempting to read NT_ARM_POE::por_el0
| GETREGSET(nt=0x40f, len=8) read 8 bytes
| Read NT_ARM_POE::por_el0 = 0xffff8000839c3d50

After this patch:

| # ./poe-test
| Attempting to write NT_ARM_POE::por_el0 = 0x900d900d900d900d
| SETREGSET(nt=0x40f, len=8) wrote 8 bytes
|
| Attempting to read NT_ARM_POE::por_el0
| GETREGSET(nt=0x40f, len=8) read 8 bytes
| Read NT_ARM_POE::por_el0 = 0x900d900d900d900d
|
| Attempting to write NT_ARM_POE (zero length)
| SETREGSET(nt=0x40f, len=0) wrote 0 bytes
|
| Attempting to read NT_ARM_POE::por_el0
| GETREGSET(nt=0x40f, len=8) read 8 bytes
| Read NT_ARM_POE::por_el0 = 0x900d900d900d900d

Fixes: 17519819926211e6 ("arm64/ptrace: add support for FEAT_POE")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 85c862dc845b3..f17810030fa05 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -1478,6 +1478,8 @@ static int poe_set(struct task_struct *target, const struct
 	if (!system_supports_poe())
 		return -EINVAL;
 
+	ctrl = target->thread.por_el0;
+
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl, 0, -1);
 	if (ret)
 		return ret;
-- 
2.30.2


