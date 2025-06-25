Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077EDC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ohYtH3FomwlmwUhzkgDcJoJeCwH+yQx5UkmmfIYOTVA=; b=Qljv0kSMq/JWaxPOUCTJAnd3y4
	Kwj+wV2nkw9mvu6VHYWhIrZD0gfApQfbojHHERupktyENuNE6LmEH+gF5nbt9iAyFa8W8z50W+q3j
	o+5eUVtochL4eqM6DtmA4u+ukNWneWGWH5/lDkF+gsP/r/Dgxvy9KRQQm5J/CizpsN4pK1ertopQi
	wQOV/wdiMJgskwdD5qd8FSkBBb1sWh3eVL00DCqWJNn72JyDv+fTdPaGSw3lgPTHjwlGKZ4DgXB4C
	+ZA9gTDLOFaXYz6BmElAGXyTiqvXrHCAOrdw5jvsMGVsSGnFRkp0IOkgy6ChMsY45xteve4LsN7Vb
	praNBg8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXi2-00000009yBl-0mfi;
	Wed, 25 Jun 2025 21:31:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVKL-00000009fZV-3qIe
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 18:58:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=ohYtH3FomwlmwUhzkgDcJoJeCwH+yQx5UkmmfIYOTVA=; b=NcXTpOEZSJgicmKnDPrw5a0KYZ
	ZjYOQU9HLdE3+cF0yEnPPLVRZ8U0s9SjAyPIpJ2LMsRDDyw+u9AGEblV5VKMgyS9ghbY6l3E4WVgE
	+LsucUUWBYEXeNUD43b5rY+fmUh1lTPPnucdpuT8HfhjMVbCaBaa83SGA2FYVUUqKKqtP70+eDKbJ
	/SOgbEXTI90gFUWdW/zpUkjPAmtx/GIXDWK2pKAA3ngm0YD5k0Ep0hnx9aB/7mpKAO0MpNdOLWc0T
	AJPIlYf1YIGgunw0nzUUbK4Srufve/EAw/71VrVzg6Koxjo0wy6QuoJrbGRcdFg9cWsJc3zgvT5Us
	gCP6ojMA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVKJ-00000005wUE-1FlG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 18:58:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4326F4A3FE;
	Wed, 25 Jun 2025 18:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26621C4CEF0;
	Wed, 25 Jun 2025 18:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750877909;
	bh=RjlGb7w/AnhlwxzMhXI+xVDeW3FXUUnZ+ueqKPPcNeQ=;
	h=From:Date:Subject:To:Cc:From;
	b=qDmKZ1SP9+00sFr8CcP0qy9BUZzeazvNkHopWl1nYQIasIjEgqQ6kkYeNucUIP0cf
	 BR7t5fMsCokWi/6Yv2G7djfPU0dzcihUv/dbVF1YwLpAG686S1/sDW2WW5wXhrvJej
	 gUbdQ08O7oCZBQ4jMCUOCdRQ2/6+/UR+P1C9OBJXul2a1t7Vq1DfAIkLCa6h03fFva
	 4uuKlMSxTvTtz4zwO2avrO1opuF8BUSTesRdfP9gss2oKRlXOEI3R30ONd9uJMyiQO
	 5R7tVFEVIw2Qw4mDBYdx/7ybzqP9fLTLOGfIX2LItxcAozEr+A8lBHgZoBWdVgabvm
	 3eLTz5sMFjIHA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Jun 2025 19:56:34 +0100
Subject: [PATCH] arm64/gcs: Don't call gcs_free() when releasing
 task_struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-arm64-gcs-release-task-v1-1-54cbdc2db416@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGFGXGgC/x3MTQqDQAxA4atI1gYyVqfgVcRF1Kih/pGUUhDv7
 uDyW7x3goupONTZCSY/dd23hJBn0M+8TYI6JENBRUUxELKtscSpdzRZhF3wy/7BF72HLtLIoSs
 hxYfJqP9n3LTXdQNLq9FmaAAAAA==
X-Change-ID: 20250610-arm64-gcs-release-task-307db60fa1b4
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RjlGb7w/AnhlwxzMhXI+xVDeW3FXUUnZ+ueqKPPcNeQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoXEbTeUN5t/UlNloC7DPsJVvz95VmKcMJhv+lG
 Sqh4xj8YY+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFxG0wAKCRAk1otyXVSH
 0G+9B/9D8IUxvntv3DBKBNH2U8vBc2ndFy/Axie0znjeibUqabV9UqqSVUvDdfOBT2GrL2IWC6j
 m7rd08BkjcCWu5XiquQP9lR4nLE77Q0PQHOre5TEPuYpEEDZQgTw9CMRYzZl/Y1h8Jp7CzIqGnn
 kOqu0KjExJpzH1PDmJdYtQRkP4l3A2lQ40RwkwxNIgYHBiLTtP1DHfnUdk0LdJ/arTCLqkeqUC7
 dy3DzLknQw2gPL0PGEhPGJ+ZHcNJt2JXAyFDeaFhnbG5T10QuNSJgNxYGyjhWYjr0dfpg8kHf8d
 1J8nSxrIwBHVUEimywPCeQ382SjQLGMjVurkweXkXuCCjKTE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_195831_591150_959147B1 
X-CRM114-Status: GOOD (  11.28  )
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

Currently we call gcs_free() when releasing task_struct but this is
redundant, it attempts to deallocate any kernel managed userspace GCS
which should no longer be relevant and resets values in the struct we're
in the process of freeing.

By the time arch_release_task_struct() is called the mm will have been
disassociated from the task so the check for a mm in gcs_free() will
always be false, for threads that are exiting leaving the mm active
deactivate_mm() will have been called previously and freed any kernel
managed GCS.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/process.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 5954cec19660..5dcfab9ce012 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -341,7 +341,6 @@ void flush_thread(void)
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	fpsimd_release_task(tsk);
-	gcs_free(tsk);
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)

---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250610-arm64-gcs-release-task-307db60fa1b4

Best regards,
--  
Mark Brown <broonie@kernel.org>


