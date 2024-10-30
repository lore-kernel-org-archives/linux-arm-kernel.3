Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF00D6B6DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 20:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITqiCo6Oy9VyIO08ktrefacPN0wP55EvXmHcJds/A58=; b=hVgMg4C+yZjL/INmmybgIONpit
	+9xYjuUwCFyA8qrng3XZdY2Qd9zj5ULJJZqMyjKFrG/CiNoRCb8lxU3Z4GzRtyoEisurMrc3CBymy
	fISpJFDhYHILLC5pO0OCZ7qxtVeJeBYAWo4BhQhniYi265+w3zvBen6iGbRY5bH0BJHveQ9GI5rGa
	n5RatxNJJp1Aa43PKq9UibIJIQwODZlAuHFE/sg6cNt/A/9XO9cb59xW9X5bm/at5H3kNPH9bW+rm
	xOiD+S/ItctHyJtKPhMK6X1Er4AFtPWis31PN+leFbBbrAhOJ5nQWnud4RwqL2/l7nyTCBO4cIJuK
	YvEzUR+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6FiL-00000001kL0-1rUc;
	Wed, 30 Oct 2024 20:54:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6FdW-00000001jRo-14mJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 20:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1AF65C568E;
	Wed, 30 Oct 2024 20:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2757FC4CED3;
	Wed, 30 Oct 2024 20:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730321389;
	bh=qJdTcgpxMWoOYJiUsP4GiG9tUqa01DGZ7YOgoBaVGYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MOoVF7LLTAGPZR8k2y9yUPTSo3ePcHSsIQKKysT8QUfGtY3lQVdYZqVM+iITuloim
	 E7+DHneXNINFM3j7VlFWRmnGc3PyugIbOXZn3HOW5OuZ+JTup64mFLx/RYvpVC3tYd
	 46qFpapz61zxbnJQTiIH6BJB/ix0X5AZ2cd0ZR6SruXvngyNixxOHkgHgN2JDjbyQf
	 40BTfLzImQ7zA6ViT1dH8CjN8RBP++xbxwf/3fDZv7B7xB5oWn9brXkpUrV9lo91xN
	 QODVwZPQJYvp165YgXvA8QAIdZ2SQlJXRTlygDB0e7HeyskrYT+kV6ScZTOyMBtuid
	 Y6zZhINpalTnw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Oct 2024 20:23:51 +0000
Subject: [PATCH 2/2] arm64/sme: Flush foreign register state in
 do_sme_acc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-arm64-fpsimd-foreign-flush-v1-2-bd7bd66905a2@kernel.org>
References: <20241030-arm64-fpsimd-foreign-flush-v1-0-bd7bd66905a2@kernel.org>
In-Reply-To: <20241030-arm64-fpsimd-foreign-flush-v1-0-bd7bd66905a2@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qJdTcgpxMWoOYJiUsP4GiG9tUqa01DGZ7YOgoBaVGYE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIpvnUTblL/oeizk6bN46HjZA0iw8vzEUtYmdpw9l
 fgVjsx+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyKb5wAKCRAk1otyXVSH0O0ZB/
 9Y9TutGjpVTwnaB7MGwyaYlS45T1zetmUTPlUgk5Bzrrtxnik4kWCWtMbUweX/06JhukK8Mo25LHu+
 IWlwyj0MO9SREDJUnqgGsAeJwCLx+Zg1mduJpZynDnFSwuCdEPM2cWtUu+LMvmG5MM05wquiL96F6Y
 EoQ50JgPqJV3ssrk+StMixv8AsUsRJ3EcECzuWQF34WlHFILUocL7cTz1i1yP5T3ykAQy0dy/knPu3
 wg1GhMzCp7m1ouVUHjLlJOSHBZjzO7KwS+fjTjDJU3zO5K/oSwd70BUm/CVBykNnZDDaafQnleB30X
 pMa33MLb0Sh+c5uvS/mgWDsXmFUW/H
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_134950_383227_24788F4C 
X-CRM114-Status: GOOD (  11.60  )
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

When do_sme_acc() runs with foreign FP state it does not do any updates of
the task structure, relying on the next return to userspace to reload the
register state appropriately, but leaves the task's last loaded CPU
untouched. This means that if the task returns to userspace on the last
CPU it ran on then the checks in fpsimd_bind_task_to_cpu() will incorrectly
determine that the register state on the CPU is current and suppress reload
of the floating point register state before returning to userspace. This
will result in spurious warnings due to SME access traps occuring for the
task after TIF_SME is set.

Call fpsimd_flush_task_state() to invalidate the last loaded CPU
recorded in the task, forcing detection of the task as foreign.

Fixes: 8bd7f91c03d8 ("arm64/sme: Implement traps and syscall handling for SME")Reported-by: Mark Rutlamd <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kernel/fpsimd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 6d21971ae5594f32947480cfa168db400a69a283..1eaa670cbffa448c1aced8c8b37040492e18a21f 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1460,6 +1460,8 @@ void do_sme_acc(unsigned long esr, struct pt_regs *regs)
 		sme_set_vq(vq_minus_one);
 
 		fpsimd_bind_task_to_cpu();
+	} else {
+		fpsimd_flush_task_state(current);
 	}
 
 	put_cpu_fpsimd_context();

-- 
2.39.2


