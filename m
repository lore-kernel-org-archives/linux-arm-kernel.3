Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7CE606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GUi+TMBg;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JeBWw5Sg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4xxlvNZCLruKmdUnQTK+W1ikorCjxfEyWivpTX0CZds=; b=GUi+TMBg1whY0W
	oOcpsr/nk25k2Gj19xM/TJKwvvyesi3T2GgtEqBwSs8W6K1b+owIZRawZ79DyvuHP/I1i9QyyyUC9
	w1cYM+FmKCx9ADfv4r2Dl2AIdBaszdfaO65IlKYPGrWDTLIhXFHwSQ3tvj6zFgNv+B6I4cYhU6Azj
	wvM/Cvw9COEsd8sMnkZJ28MxfYxzT3sfFIjmSEVWtg9GcIjhE2uYYMNzh/mTcqlr/rfR66jSkv2VM
	eP0n7Av+nwPYtvxDPBH+BoV6ZpVywEv1yr4ZaGAbQ8tKngWlHuMfQbpCt0Kl5pHSEvoSb+Gr/R8Tt
	m20TN8CFqtBZmJPRgX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODOt-00000002LE7-3ETN;
	Tue, 03 Nov 2026 12:14:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODOo-00000002LCK-3RSp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:14:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47F6E1691;
	Tue,  3 Nov 2026 04:13:55 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7758D3F628;
	Tue,  3 Nov 2026 04:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793708038; bh=3Axued/g6yvKAobdSETGinRgJIdRC89TMT2sXo83y6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JeBWw5SgAX3+y8uFtVnJm/+ZK/uwmJhf+7svXD+Oj1+jp0rSesLljLOTZ0aRYhqMl
	 VGwlH50jaIv2Yiz9kaoZRWs/+M67DMSBuPFDM4y1g+5ZXOFNht3eONmVqCv6Fx66t9
	 x9yL6ibpfhpCixZqxFH3W8OrM13uSj6Yd+T8Dsy8=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH 1/3] arm64: signal: Remove redundant SVE/SME cleanup logic
Date: Tue,  3 Nov 2026 12:13:44 +0000
Message-Id: <20261103121346.1858305-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261103121346.1858305-1-mark.rutland@arm.com>
References: <20261103121346.1858305-1-mark.rutland@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_041358_901076_51890E0F 
X-CRM114-Status: GOOD (  10.56  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, restore_sve_fpsimd_context() and restore_za_context() clear
TIF_{SVE,SME} upon a memory allocation failure. This is benign, but
unnecessary:

* In restore_sve_fpsimd_context(), when sve_state cannot be allocated,
  TIF_SVE is cleared. When sve_state is NULL, a task cannot legitimately
  have TIF_SVE set, and hence the task should not have TIF_SVE set to
  begin with.

* In restore_za_context(), when sme_state cannot be allocated, TIF_SME
  is cleared and SVCR.ZA is cleared. When sme_state is NULL, a task
  cannot legitimately have either TIF_SME set or SVCR.ZA set, and hence
  the task should not have either set to begin with.

Historically, clearing TIF_{SVE,SME} served to (partially) hide bugs
where other code could leave the task in an invalid state. See:

  https://lore.kernel.org/linux-arm-kernel/Z_Ueq4ezJyCPEJ6m@J2N7QTR9R3.cambridge.arm.com/

Those bugs have been fixed, and neither restore_sve_fpsimd_context() nor
restore_za_context() need to clear TIF_{SVE,SME}.

Delete the redundant logic.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/signal.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 6a06a4e352b1d..2e85ac6a24681 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -494,10 +494,8 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 	}
 
 	sve_alloc(current, true);
-	if (!current->thread.sve_state) {
-		clear_thread_flag(TIF_SVE);
+	if (!current->thread.sve_state)
 		return -ENOMEM;
-	}
 
 	if (sm) {
 		current->thread.svcr |= SVCR_SM_MASK;
@@ -629,11 +627,8 @@ static int restore_za_context(struct user_ctxs *user)
 		return -ENOMEM;
 
 	sme_alloc(current, true);
-	if (!current->thread.sme_state) {
-		current->thread.svcr &= ~SVCR_ZA_MASK;
-		clear_thread_flag(TIF_SME);
+	if (!current->thread.sme_state)
 		return -ENOMEM;
-	}
 
 	err = __copy_from_user(current->thread.sme_state,
 			       (char __user const *)user->za +
-- 
2.30.2


