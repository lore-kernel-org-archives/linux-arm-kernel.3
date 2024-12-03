Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8844E64A8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63Dz4jjbRwX5CQLNLC40wvOTv92feQluubf1HWJS80s=; b=XMsDUFZUYb5+Oj4FgppZxoFZ2A
	nDz90WEuRS6E9BcFkEuQBNsQz6HEv+Z7O9LYyi3GUa5gHbI9Exuor7Lb7Mr9ry4R79ssTXCdqm0oB
	OEkRK8MGA4Jr3Ta05wwdrI9jAwL/HtxbEraXxUjnwVXQRjizMkHHGNrOBSjB58WBzbB2aHpe+mWyq
	icnOrdpoKcbVeFsGO4k8lBEVIdDOdVb+RjOaU2A+6iCDEmgrg9bUMciY13d+PgvH0QZMEA1ObpZUX
	N7CMZWrqyFuiG7HwSPOD1M9i6B6ohuVZH6NvJJfKRKUGzfaIuBp/qBX1ccVpUzoBi8rDhmdmEllWm
	Sqc3phrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISW8-00000009WnK-2KRj;
	Tue, 03 Dec 2024 13:00:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISK4-00000009UJP-3RKh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:48:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C9BC0A414B5;
	Tue,  3 Dec 2024 12:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA78C4CECF;
	Tue,  3 Dec 2024 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733230091;
	bh=fwkQ2FXE6pq57Zq+2np3KAdjth1F3BAf6kMutQobcPY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uECPxY2yGDTQ96vqDI8oz8ZKkSYDhsE6FOJ+q/2wjZ0pJYpkWoqI7JXoWxmMjv1No
	 JPlnGyw/i4S5l/2DcfSALiOluwqInss7WhO5yjyPxjE0jmLKsYQvADY2/hIOOBHlmz
	 APAh7elCXYNs02IQQ7PiJDb1zWUEuBlegj+isdtZaV4S1GJf0RcVYU3nzSb4EAQkW2
	 Hj+1RSVRGVrtwlCfYWhD414y4jo7uI2qJZ+7v90KOjbisEg+XPh8BEl61ZYtQKZJRs
	 cnZegheuib6DkJdL0WR4cfk5IaplQYsaQjMKXONdbJSECGF8N5zvkRxSkHeMHyPy42
	 yS07ous1B5OQQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 12:45:54 +0000
Subject: [PATCH 2/6] arm64/fp: Don't corrupt FPMR when streaming mode
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-arm64-sme-reenable-v1-2-d853479d1b77@kernel.org>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
In-Reply-To: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fwkQ2FXE6pq57Zq+2np3KAdjth1F3BAf6kMutQobcPY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTv4BcA+HNfWUMV0jBjkRtcw5Z8TgIMYMn0+FMt8+
 8FdSoVaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ07+AQAKCRAk1otyXVSH0KOMB/
 9c2BmpHnuajRU9qKEBELWI4QXCe3SSVNuHwY74LKEBjrA8LN2EW6J9MdYUqtSC91exM3H18GcOdtPf
 kSEYFZADm3h48TsP4aXgofFDty7s/LK/SmV9pGvmEGxzFgsLAlmFvM9PuPmPTrGNIocxNGN85Exhn1
 h9Z9VYduy9XzB91sdEGxS6cL3DwT1C4dIiqZyLfGErJx1FIYFmK1FFkFWjHmx+KKOTQDE2GDiSw1uC
 GPJgu5V3/TalyHuLYZF110vLpLWVYuhreG2JnasDGX8SMuXx9R7nh6i12CDNyDIVzmR297d6IR0880
 VkFbiwNqxJlS8lBoTT8NQ5eahcD7cl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044812_941091_683F6513 
X-CRM114-Status: GOOD (  11.87  )
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

When we enter or exit streaming more FPMR is reset to 0.  This means
that when restoring the floating point state from memory we need to
restore FPMR after we restore SVCR, otherwise if we are entering or
exiting streaming mode as part of loading the new state the value of
FPMR will be corrupted.

Fixes: 203f2b95a882 ("arm64/fpsimd: Support FEAT_FPMR")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index eca0b6a2fc6fa25d8c850a5b9e109b4d58809f54..a3bb17c88942eba031d26e9f75ad46f37b6dc621 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -359,9 +359,6 @@ static void task_fpsimd_load(void)
 	WARN_ON(preemptible());
 	WARN_ON(test_thread_flag(TIF_KERNEL_FPSTATE));
 
-	if (system_supports_fpmr())
-		write_sysreg_s(current->thread.uw.fpmr, SYS_FPMR);
-
 	if (system_supports_sve() || system_supports_sme()) {
 		switch (current->thread.fp_type) {
 		case FP_STATE_FPSIMD:
@@ -413,6 +410,9 @@ static void task_fpsimd_load(void)
 			restore_ffr = system_supports_fa64();
 	}
 
+	if (system_supports_fpmr())
+		write_sysreg_s(current->thread.uw.fpmr, SYS_FPMR);
+
 	if (restore_sve_regs) {
 		WARN_ON_ONCE(current->thread.fp_type != FP_STATE_SVE);
 		sve_load_state(sve_pffr(&current->thread),

-- 
2.39.5


