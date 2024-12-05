Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A1EE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7LXISJLfi5g84tBfq4pFkH7usQNUfBegQfd+IxeI3c=; b=duRLVfnnsaHZNOh9Y6MUVfN1b0
	S7s2fJqKXAROP8utdOvzT3ASlyeNFzZmxAItzYV7Zm3aIAEaMIkX/O+3AMLrQgVBqtvKRINFkk3Ve
	0F+9htLkChvt90W303Jktz2tXFvlKehNTiNC1QLmtmokuzeqfs6dcGo4wDSIzNr5kwwch9TgMJJco
	5LrVxNpXkxDDAA1gYdd8uwN2Oav9F94rrtXxFlOYCrFtKavmrvlx6dfmzDxm3Ih136WOvPoxkEy1/
	TAr/0sHs3heZJ9mf10xgNDkGtNfchQJWbNV7YsOYamtpzXtOilFKGTVM/7fdZL4rEyf3zzWKwq8RE
	SricyN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAuC-0000000Fvtf-3eJj;
	Thu, 05 Dec 2024 12:24:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAn6-0000000Funw-2gTa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:17:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50C4816F2;
	Thu,  5 Dec 2024 04:17:36 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78EC03F5A1;
	Thu,  5 Dec 2024 04:17:07 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	joey.gouly@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH 2/4] arm64: ptrace: fix partial SETREGSET for NT_ARM_FPMR
Date: Thu,  5 Dec 2024 12:16:53 +0000
Message-Id: <20241205121655.1824269-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241205121655.1824269-1-mark.rutland@arm.com>
References: <20241205121655.1824269-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_041708_718968_B2175A67 
X-CRM114-Status: GOOD (  13.25  )
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

Currently fpmr_set() doesn't initialize the temporary 'fpmr' variable,
and a SETREGSET call with a length of zero will leave this
uninitialized. Consequently an arbitrary value will be written back to
target->thread.uw.fpmr, potentially leaking up to 64 bits of memory from
the kernel stack. The read is limited to a specific slot on the stack,
and the issue does not provide a write mechanism.

Fix this by initializing the temporary value before copying the regset
from userspace, as for other regsets (e.g. NT_PRSTATUS, NT_PRFPREG,
NT_ARM_SYSTEM_CALL). In the case of a zero-length write, the existing
contents of FPMR will be retained.

Before this patch:

| # ./fpmr-test
| Attempting to write NT_ARM_FPMR::fpmr = 0x900d900d900d900d
| SETREGSET(nt=0x40e, len=8) wrote 8 bytes
|
| Attempting to read NT_ARM_FPMR::fpmr
| GETREGSET(nt=0x40e, len=8) read 8 bytes
| Read NT_ARM_FPMR::fpmr = 0x900d900d900d900d
|
| Attempting to write NT_ARM_FPMR (zero length)
| SETREGSET(nt=0x40e, len=0) wrote 0 bytes
|
| Attempting to read NT_ARM_FPMR::fpmr
| GETREGSET(nt=0x40e, len=8) read 8 bytes
| Read NT_ARM_FPMR::fpmr = 0xffff800083963d50

After this patch:

| # ./fpmr-test
| Attempting to write NT_ARM_FPMR::fpmr = 0x900d900d900d900d
| SETREGSET(nt=0x40e, len=8) wrote 8 bytes
|
| Attempting to read NT_ARM_FPMR::fpmr
| GETREGSET(nt=0x40e, len=8) read 8 bytes
| Read NT_ARM_FPMR::fpmr = 0x900d900d900d900d
|
| Attempting to write NT_ARM_FPMR (zero length)
| SETREGSET(nt=0x40e, len=0) wrote 0 bytes
|
| Attempting to read NT_ARM_FPMR::fpmr
| GETREGSET(nt=0x40e, len=8) read 8 bytes
| Read NT_ARM_FPMR::fpmr = 0x900d900d900d900d

Fixes: 4035c22ef7d43a6c ("arm64/ptrace: Expose FPMR via ptrace")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 8525d03f0fb40..85c862dc845b3 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -720,6 +720,8 @@ static int fpmr_set(struct task_struct *target, const struct user_regset *regset
 	if (!system_supports_fpmr())
 		return -EINVAL;
 
+	fpmr = target->thread.uw.fpmr;
+
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &fpmr, 0, count);
 	if (ret)
 		return ret;
-- 
2.30.2


