Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4BAC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/d6itVVQFRbg0AVwV7Dpvkqo81/sIA6k7Bzl+7epUWc=; b=NXPWBTFL4EOLV1k1d+j/lBOnzK
	+Ep3GmyMFPXUrteEib24wRF4i+s0DsSHcM+ADosxYac4BDmZG9OLjUQ6OSVoxk8K98LEz7BYz5Vj8
	DpvWSmmtSFCj2gvdWuHARcyelbJaIlZinq0EHmzuBwiHlKdRLdlopHzf6uyEyxOksdmZkg6WH/R/k
	6wzaPtN13f10LUPxaadNYfvlv15FVyJvob/likhkCgTsqwOkOUckgguMn6X+H1qCq6+ZlUWKIyaYH
	7AIzSSG1Q9Fei/KZR/8Hg7qaCrzbzQ9K58D7c4/W4Jdg8cOXvrfgPd1+Qj/aXaiGs1ut3HI//gyso
	35CBMtVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XZu-00000006fGU-3qTk;
	Mon, 07 Sep 2026 11:31:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XZs-00000006fG2-3ULW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:31:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3536D1476;
	Mon,  7 Sep 2026 04:31:50 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 068E03F7D8;
	Mon,  7 Sep 2026 04:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788780713; bh=/nkzuLXZd8OORpC17ln8IsqCVVb4HdJSiufFerY3KOA=;
	h=From:To:Cc:Subject:Date:From;
	b=jkJUS0qFx+rYlXH5rOKR/WVwWGw8CPW5EYxZhaZX+2wO/tdYZBfJXDp9qpPZNmDqW
	 a41wTixM++lsEci+t6I0hbljln1YU93nJoXVbx+lXtPMk3vtsPe2VtUM+S4KJaaeMS
	 w1kAXrWPbC4mSv458w0oU8q7m22AuNvH6To8CgMc=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Yury Khrustalev <yury.khrustalev@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] arm64: mte: Fix PTRACE_{PEEK,POKE}MTETAGS error documentation
Date: Mon,  7 Sep 2026 12:30:25 +0100
Message-ID: <20260907113151.363924-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_043156_905561_A9102A2C 
X-CRM114-Status: GOOD (  15.55  )
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

PTRACE_{PEEK,POKE}MTETAGS return -EIO rather than -EOPNOTSUPP (as
documented) when no tags are copied from/to a mapping without PROT_MTE.
This has been the behaviour since the interface was introduced, though
the original intent was to distinguish between address not being
accessible and mapped as untagged.

Update the documentation to match the implementation (de-facto ABI).
Since -EOPNOTSUPP was never returned, change the error assignment to
-EIO as well to avoid confusion.

Fixes: df9d7a22dd21 ("arm64: mte: Add Memory Tagging Extension documentation")
Fixes: 18ddbaa02b7a ("arm64: mte: ptrace: Add PTRACE_{PEEK,POKE}MTETAGS support")
Reported-by: Yury Khrustalev <yury.khrustalev@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---

The alternative is to fix the returned error but given that the bug has
been around for 6 years, we can say it's ABI irrespective of what the
documentation says.

 Documentation/arch/arm64/memory-tagging-extension.rst | 5 ++---
 arch/arm64/kernel/mte.c                               | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/arm64/memory-tagging-extension.rst b/Documentation/arch/arm64/memory-tagging-extension.rst
index e6fe428f0e2a..1d32fc5df183 100644
--- a/Documentation/arch/arm64/memory-tagging-extension.rst
+++ b/Documentation/arch/arm64/memory-tagging-extension.rst
@@ -208,11 +208,10 @@ will use the corresponding aligned address.
   tracer's space cannot be accessed or does not have valid tags.
 - ``-EPERM`` - the specified process cannot be traced.
 - ``-EIO`` - the tracee's address range cannot be accessed (e.g. invalid
-  address) and no tags copied. ``iov_len`` not updated.
+  address) or does not have valid tags (not mapped with the ``PROT_MTE``
+  flag) and no tags copied. ``iov_len`` not updated.
 - ``-EFAULT`` - fault on accessing the tracer's memory (``struct iovec``
   or ``iov_base`` buffer) and no tags copied. ``iov_len`` not updated.
-- ``-EOPNOTSUPP`` - the tracee's address does not have valid tags (never
-  mapped with the ``PROT_MTE`` flag). ``iov_len`` not updated.
 
 **Note**: There are no transient errors for the requests above, so user
 programs should not retry in case of a non-zero system call return.
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 1a9aad6ef22a..31f5c6b0510e 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -476,7 +476,7 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
 		 * was never mapped with PROT_MTE.
 		 */
 		if (!(vma->vm_flags & VM_MTE)) {
-			err = -EOPNOTSUPP;
+			err = -EIO;
 			put_page(page);
 			break;
 		}

