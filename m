Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC52E64A8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeJdzf4t40MZFTMmuIYXtkOVI7y8KM/1YokE6gmXH/Y=; b=1lLEvlsPU56qqqZUvymJn4LDkZ
	EPxGXi7LCdtMt5OD0YslgtBlR7mXvC9ATcelOqHBwbP59gJB8fpG2ZlDVH0N0HU1GGy1y3CXa7d0B
	tme1XlmPnoVgjhp//SWFtO01KDis9AymOOthQgHpdYvpbq1KSQ/w//Zx62cM9qq4fOuTaPbcB9YhV
	ppKr7nOJGOa/HyP1TS6B1v6Z4RBlC+nog6JWpqZV/Ji9TSaqq6hYuw+Mm+JNLKUc9z84OheoEqylP
	vCYCVKdEpyzViWEaRGrhSPAE3XqZLorK+OLTdnOxMPWpade5/O3tNXGfLbYfVpjFEULCV1epT2I7g
	GY86q08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISV9-00000009WYa-3xI6;
	Tue, 03 Dec 2024 12:59:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISK3-00000009UIP-030R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:48:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 161CEA411AA;
	Tue,  3 Dec 2024 12:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACCCC4CED8;
	Tue,  3 Dec 2024 12:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733230090;
	bh=LpOVQoMlpE/E8rUSHH5zwrqMIfcMHJ5yw+nwZF82uAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NtYb1fxEkI2ZLYOEInRO4JT0N1O6Cp77u2HFOwEHVSmNmbf2mmBLUjqLFy5Muk8ls
	 tNHX8UfGBS94tO5oQ6EBOqpHVic4wyRcZzBAGWRGaOGpA/vZR5IIWJQBIMREXyMRZw
	 mS9c9iHlerOja+AAN72vQqTvDefMaHLfWQrRRL0TuN90LxRZXVQ9gzqM4fi2bGmjzo
	 C8zJ+vR80iUumIGgA5JzJ7JDigny3VQEwpyYCsEBj/ULGyNMTwXHi3x/kRWP3cLMM/
	 yK5BcRvwa6m/QbqpPjDA2DYQWy7xo/rfhkJ77rHu2whIUKlJyb32sI53o09uMIieiF
	 eqDc1Vg8U5BJg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 12:45:53 +0000
Subject: [PATCH 1/6] arm64/sme: Flush foreign register state in
 do_sme_acc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-arm64-sme-reenable-v1-1-d853479d1b77@kernel.org>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
In-Reply-To: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LpOVQoMlpE/E8rUSHH5zwrqMIfcMHJ5yw+nwZF82uAs=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhnS/fwxZFimK2tZr1lq9W90o8CI4fq/Sy1JJxgCOwmCpNZxB
 sv2djMYsDIxcDLJiiixrn2WsSg+X2Dr/0fxXMINYmUCmMHBxCsBE3vqz/9OzNm9XOHpxwU7GkkX7Wu
 5sfHg6nbPpFfv2KXbJHOlHD36KPvRVi3nZzmsXpPz8TwtMn2rhv7XCyuXbmqqlvKunlnyc82Nf0skM
 YbtK48Atu47Paw5s6rjn0xHkJNNgdvJfCHP+TV1Z90l7C3/IvbEK2bnKjDH6u2ecUl/ocaF+ra21Bb
 YGtl9kn1xj5VbsU2yTeOK/xf77moPBv8xkvxzlcemVubFttVXYvdd/bVujl4rPfZFuVV5SxHbSV7mb
 t6rO3tkgNe6n5uSfj39G7Yxmar6g/7/OMHWJmFMgU/eUDxPXf0qb8ttUsbb8jfSfhBw7kTRR8ZKHc7
 tVl3hckAvtaf3To2sxx1y9INoJAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044811_113666_5E640052 
X-CRM114-Status: GOOD (  11.77  )
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

Fixes: 8bd7f91c03d8 ("arm64/sme: Implement traps and syscall handling for SME")
Reported-by: Mark Rutlamd <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kernel/fpsimd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 8c4c1a2186cc510a7826d15ec36225857c07ed71..eca0b6a2fc6fa25d8c850a5b9e109b4d58809f54 100644
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
2.39.5


