Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80245CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5siMT/l62N7dgVQpWdDqKdAn4faaJHK9QEi9zh8Jhrw=; b=KsyGEK+SP28EeFbQIhMQje2GC3
	yVGTlSv1DIC6Wkk58WUIb52rHeQcDX9DHWQO+l90GCRDnwsk+n8B3a+fe1B2j0n91qFH8WJKpSMcs
	Be2NyYwFfsd2yhxE/bcM8gfjcTNph66xmKxbsoQjLBVFiMhNnudG8yljBfFFz4snAKbb4TbUnDMGq
	YtRRU9EQ5w0xD85+lTmeQXWXzug+dcm4Qf71pYlfxfJVOJJbD2IaEXL6f89kq03fKb6AgbCMr3lxK
	MTC2dAuSldWJhyPpmuCzkvZ25TliSXyUpbgS16ocOhdWWEH8H/3sWiAjd7ISvvEcrzCvfVs+Tg7yr
	DpJ/boNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0ds-0000000GH1l-2Kzf;
	Mon, 18 May 2026 16:16:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0do-0000000GGzw-0WQj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 16:16:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 81E4544088;
	Mon, 18 May 2026 16:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22768C2BCB7;
	Mon, 18 May 2026 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779120987;
	bh=7GKFSYrY0L2am6cu4ZjHbOPqVJRK3ddPdovx7/54Msw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gCsPIF0rt8d90RybYIb3G0O82EKweISeB3WpzwsgKagzHbO1L21wjoTqNJD0zRWfn
	 zz5TItA8+id2IwTrv9AyUrdJF6fbKU6UIuywwobhysVBN5juKPl7d9mD4HUmkAi8TZ
	 lFQ1WgdYXbjG6HkRm3e1BX19s/2UikU5sSeyJeALKMQ2l6ZBkkqwV8rAgKbUhlkgum
	 XvgM55w3c5RsMqCuisOuaRIj35ypeGMoVbWk1R9tVIApPNe1ASe35dusZzUC41cPMW
	 HmGHckjWeg8tM67qiExtY2QsnWV8GqSOkEPEXH/tWcWRtC2Gb9aPfiULfdwPmZfiIx
	 g0HA2IQ/aesMQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 18 May 2026 17:11:47 +0100
Subject: [PATCH v9 2/2] arm64/sve: Disable TIF_SVE on syscall once per
 second
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-arm64-sve-trap-mitigation-v9-2-9cc8fcd002fd@kernel.org>
References: <20260518-arm64-sve-trap-mitigation-v9-0-9cc8fcd002fd@kernel.org>
In-Reply-To: <20260518-arm64-sve-trap-mitigation-v9-0-9cc8fcd002fd@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, 
 Ryan Roberts <Ryan.Roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2697; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7GKFSYrY0L2am6cu4ZjHbOPqVJRK3ddPdovx7/54Msw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqCztVf/8aqA8T7M7Ki+eyuqBCf0N3vet/co4xs
 pcLg01eH02JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCags7VQAKCRAk1otyXVSH
 0KXYB/sGD8XpYQtPjxVqrX/DuIIwuKEoLweuGK2SF9rot5OYfnOSlCKmkgfSQHeWOzw+jTFwsCl
 1eSb6PAT1NUaDt0QM+SyJv0TksjlzyW86JASH2OvEHMibjeKbKyVJ8KQZwYECIvt8uNHdhI+ICU
 b3wZucYU+MXynwBe6dtNaDKJu6c8977+3khydWTWgxS0G32g6du8jv9/Lv1b29afVbm2s3sZ5Dw
 AuNRGZyYq08jbYVNVbxy9SDMMvIwQ6njvvnlpNPznlK73npLWbLacmo4AWBFHEzwDcuwzX86r/8
 SoP4OBYCOJAq8Jdsl75bnrsMWXCA54sA0su2fgKGNusSbWtx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_091628_209351_FEEB5AA6 
X-CRM114-Status: GOOD (  18.21  )
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

Our syscall ABI requires that when performing a syscall the portions of
the Z registers not shared with the V registers, the P and FFR registers
are reset to 0.  Since we have no way of monitoring EL0 SVE usage this
is implemented by changing the in register values on every syscall for
tasks which have SVE enabled, for systems with 128 bit SVE vector
lengths this has been benchmarked as a 6% overhead.

We currently support disabling SVE for userspace tasks when loading the
floating point state from memory during a syscall, allowing tasks that
use SVE infrequently to avoid this overhead, but this may not help CPU
bound tasks if they are not fortunate enough to block or be scheduled
during a syscall.  This is done whenever the state is loaded from a
second after the last time the task generate a SVE access trap.

Extend this mechanism to also apply during syscall entry, disabling SVE
instead of flushing the live registers when we perform a syscall a
second after the last time a SVE access trap was taken.  This adds an
additional memory access and branch for tasks using SVE and means that
CPU bound tasks actively using SVE will take extra SVE access traps (at
most one per second) but will allows CPU bound tasks that infrequently
use SVE to avoid the overhead of flushing the registers on syscall.

On a system with 128 bit SVE vectors fp-pidbench shows a roughly 4.5%
improvement compared to baseline after having used SVE, for a roughly
0.4% overhead when SVE is used between each syscall.  Obviously this is
very much a microbenchmark.

This is purely a performance optimisation, there should be no functional
change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/entry-common.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index cb54335465f6..e02e2c1013e3 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -240,8 +240,18 @@ static inline void fpsimd_syscall_enter(void)
 	if (test_thread_flag(TIF_SVE)) {
 		unsigned int sve_vq_minus_one;
 
-		sve_vq_minus_one = sve_vq_from_vl(task_get_sve_vl(current)) - 1;
-		sve_flush_live(true, sve_vq_minus_one);
+		/*
+		 * Ensure that tasks that don't block in a syscall
+		 * also get a chance to drop TIF_SVE.
+		 */
+		if (unlikely(time_after(jiffies,
+					current->thread.sve_timeout))) {
+			clear_thread_flag(TIF_SVE);
+			sve_user_disable();
+		} else {
+			sve_vq_minus_one = sve_vq_from_vl(task_get_sve_vl(current)) - 1;
+			sve_flush_live(true, sve_vq_minus_one);
+		}
 	}
 
 	/*

-- 
2.47.3


