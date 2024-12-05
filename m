Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119A3E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DQj8homD0inyAdCUx9HjNnb00tV3Wrp/g0R9zC5dSo=; b=MYcg+HRPP7OolU0ZPCL7F4THHc
	w0OZqwNl/C8a1FQeKtKGqx4pB8L77spG94lmrl9zHdNe29I8Gc5L7X2xMW+GoGr3UzLFwXdqVK5BD
	wCp9hONy55/W3yC79heH2KJ2rfAby5RfklsiKROnx2K8ih/KZepSoCAUvx4iaXYu+EXUg2hf1/+3x
	AH87JWBq0G5hjuLwcEwLRIrweOJ35RJvfMQxD6KlqFeHrPQkiK8TcATp732HY0HZUkFde1uoXFV3t
	pQwz9pI9rixYIhVLQH+Cj0ccweASoS/+f5kcMfp5WnwY7B2NovgnUYk7Op1Q11U9RODYQJ595hI7x
	ULy3s88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAtE-0000000FvnI-0rhl;
	Thu, 05 Dec 2024 12:23:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAn5-0000000FunF-19hG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:17:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4572169E;
	Thu,  5 Dec 2024 04:17:34 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DD8C13F5A1;
	Thu,  5 Dec 2024 04:17:05 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	joey.gouly@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH 1/4] arm64: ptrace: fix partial SETREGSET for NT_ARM_TAGGED_ADDR_CTRL
Date: Thu,  5 Dec 2024 12:16:52 +0000
Message-Id: <20241205121655.1824269-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241205121655.1824269-1-mark.rutland@arm.com>
References: <20241205121655.1824269-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_041707_354221_70D18284 
X-CRM114-Status: GOOD (  14.67  )
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

Currently tagged_addr_ctrl_set() doesn't initialize the temporary 'ctrl'
variable, and a SETREGSET call with a length of zero will leave this
uninitialized. Consequently tagged_addr_ctrl_set() will consume an
arbitrary value, potentially leaking up to 64 bits of memory from the
kernel stack. The read is limited to a specific slot on the stack, and
the issue does not provide a write mechanism.

As set_tagged_addr_ctrl() only accepts values where bits [63:4] zero and
rejects other values, a partial SETREGSET attempt will randomly succeed
or fail depending on the value of the uninitialized value, and the
exposure is significantly limited.

Fix this by initializing the temporary value before copying the regset
from userspace, as for other regsets (e.g. NT_PRSTATUS, NT_PRFPREG,
NT_ARM_SYSTEM_CALL). In the case of a zero-length write, the existing
value of the tagged address ctrl will be retained.

The NT_ARM_TAGGED_ADDR_CTRL regset is only visible in the
user_aarch64_view used by a native AArch64 task to manipulate another
native AArch64 task. As get_tagged_addr_ctrl() only returns an error
value when called for a compat task, tagged_addr_ctrl_get() and
tagged_addr_ctrl_set() should never observe an error value from
get_tagged_addr_ctrl(). Add a WARN_ON_ONCE() to both to indicate that
such an error would be unexpected, and error handlnig is not missing in
either case.

Fixes: 2200aa7154cb7ef7 ("arm64: mte: ptrace: Add NT_ARM_TAGGED_ADDR_CTRL regset")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index e4437f62a2cda..8525d03f0fb40 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -1427,7 +1427,7 @@ static int tagged_addr_ctrl_get(struct task_struct *target,
 {
 	long ctrl = get_tagged_addr_ctrl(target);
 
-	if (IS_ERR_VALUE(ctrl))
+	if (WARN_ON_ONCE(IS_ERR_VALUE(ctrl)))
 		return ctrl;
 
 	return membuf_write(&to, &ctrl, sizeof(ctrl));
@@ -1441,6 +1441,10 @@ static int tagged_addr_ctrl_set(struct task_struct *target, const struct
 	int ret;
 	long ctrl;
 
+	ctrl = get_tagged_addr_ctrl(target);
+	if (WARN_ON_ONCE(IS_ERR_VALUE(ctrl)))
+		return ctrl;
+
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl, 0, -1);
 	if (ret)
 		return ret;
-- 
2.30.2


