Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA133C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5ptgH1+l+eHmiDjFhFIWK1AN+3vpULjdQe9ooy3wMI=; b=QZ94KPxZZyQtzJqx3eaiUzzjWD
	+9RBIObePnJLeTrSwcKaCYjIpbe69I9Rq+K9OSpb0CuXxTnLaKAV4zqSPplP8Eyf+M39L6icTTPdM
	noN0oXhry7ZU7KHEfi024yJ5i+je/TlgneFM82qZUz8aQpItHyPAVLRJxjcMmw6mWQqqv9CkWPXQo
	4uPYWVCajkjOqe9PZUTNnL1b8GqSVyJodZIkGUusUt8H/DQG9nQTNTTCsQJotdO0UO4UjkVVDEaP7
	4PaskmoGskskT085Z42JB3qmxOxMy7VxBwJwJCSy67/GkeWvJ0JMEZ91UQX7R+m7LCo0Z0EFBQHUd
	U2RyfIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyES-00000001Su4-3iy6;
	Tue, 25 Aug 2026 20:58:56 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyEN-00000001SqR-3Nxb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 20:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691520; bh=x5ptgH1+l+eHmiDjFhFIWK1
	AN+3vpULjdQe9ooy3wMI=; b=MxPDrAYuYMDGqzEx/3V8Rd+RVnUqiMnNK/ThqEgl6Fd7M5NJ2H
	wRk3id6CJ2IKZREVzyoccpxTJM/HKFriHIS+MRXAWbzel+S3McidVpg/yLixbpRUyPiWCMR3nLt
	i0ySW9tuwShZyX6BuORVL+Fbj0DIDFGHvrXc2AaCHS0wVu5lEp+/fXYiyEqUTS0Wc70sex635An
	mfkOzG81Vgl1vMApPmq4Iagd5PJEXGx90Auf8AJzJsCunmL2m4vGWA0ucsEYCjj/aFv0f/FYe39
	wfZH5i0PJuYXPmydb0Pctb0+tNZIwIxMFot0cI8D3Za2iWJBb7VN/X1jimGThGxWFkw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691520; bh=x5ptgH1+l+eHmiDjFhFIWK1
	AN+3vpULjdQe9ooy3wMI=; b=wZJ8sK4ypJ5yYbibF3C2Rlrwt5c6chdBFxa174mQYdxccwGlmR
	QnunZEAlwjplgEQt0Z1lG3NKALTfO9maCRCg==;
From: Bradley Morgan <brads@mainlining.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org,
	stable@vger.kernel.org
Subject: [PATCH 1/7] arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
Date: Tue, 25 Aug 2026 20:58:33 +0000
Message-ID: <20260825205839.14571-2-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825205839.14571-1-brads@mainlining.org>
References: <20260825205839.14571-1-brads@mainlining.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_135852_002085_2B0E79E0 
X-CRM114-Status: GOOD (  10.77  )
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

swsusp_arch_suspend_exit() reinstalls the restored kernel's hyp stub
vectors with an hvc, but never passes the arguments. x0 is not set to
HVC_SET_VECTORS and x1 is not set to the vector address, so the stub
dispatch falls through and returns without writing vbar_el2. EL2 is
left pointing at the trans_pgd copy of the vectors, a page that
swsusp_free() releases right after resume.

Set the arguments up the same way __hyp_set_vectors() does.

Fixes: 788bfdd97434 ("arm64: trans_pgd: hibernate: Add trans_pgd_copy_el2_vectors")
Cc: stable@vger.kernel.org
Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/arm64/kernel/hibernate-asm.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/hibernate-asm.S b/arch/arm64/kernel/hibernate-asm.S
index 0e1d9c3c6a93..2baefe7a82d3 100644
--- a/arch/arm64/kernel/hibernate-asm.S
+++ b/arch/arm64/kernel/hibernate-asm.S
@@ -89,6 +89,8 @@ alternative_insn "dc cvau, x4",  "dc civac, x4",  ARM64_WORKAROUND_CLEAN_CACHE
 	isb
 
 	cbz	x24, 3f		/* Do we need to re-initialise EL2? */
+	mov	x1, x24
+	mov	x0, #HVC_SET_VECTORS
 	hvc	#0
 3:	ret
 SYM_CODE_END(swsusp_arch_suspend_exit)
-- 
2.47.3

