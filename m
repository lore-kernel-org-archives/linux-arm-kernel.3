Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79065E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeJdzf4t40MZFTMmuIYXtkOVI7y8KM/1YokE6gmXH/Y=; b=bcW3127Ze8quvZmn8pS/443Ahl
	GL0YX2517EqrVu8aM1SfTC9p8XkoAxiPep3agNx6/RbPuBSL2dYxU3HCr+bjXpFDQhpPhAcMvzAAB
	AVDC41t0TGzPprc/pqEJ/W52LCBkY5qjC9lXvIU9Osj1YMocgQWDvA2B1O6oscoGPb2BNpTQr6ZR2
	mmLFgwc0ZH5QCqtztntxsCA7Uz2ytMhfVpcezFqynDwi9npQG3Nq3p39BTxE3lbHJrJkCb5eYYEXn
	si1QuZp8LPB7IBkXh+vukKIECXymSMmX0ObWytsestilZ+zVASVczLvvm4FBbcUieyHGOOToMLJAH
	0sak+aHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrEt-0000000CzQ8-06eU;
	Wed, 04 Dec 2024 15:24:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrCt-0000000Cyri-0WEe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:22:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 988095C455A;
	Wed,  4 Dec 2024 15:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA593C4CEDF;
	Wed,  4 Dec 2024 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733325746;
	bh=LpOVQoMlpE/E8rUSHH5zwrqMIfcMHJ5yw+nwZF82uAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NGXcSMjFEK3Gb5ZThhTotb8LtObyRrVYXZMwWsjbtfNNERt/rSoOgxKD4cfll0oT1
	 gA4Vir1uILjYXAxidPmQWIayCKAJFXCxh3QEWX1ClTDpAtN+oX46EtV3AV1qarfLJT
	 1gsDKErmPYoPUi3vgG8jWS4hBB7Oe+uBbsHpYM0tFBE/Ga1pvtzf8pkpEosmauaZx7
	 moc5xQAf/foWsJSDEs+AEuTGL1Mtx0fOtyjc4RXaPCx4v8rjB2qHOQ6WPW5+pro1TK
	 PH3Z8ZytH+xdIGUt6G2xRMLdYMd2TGVNtqUk6PcmrVufDsg/ngoh6LdMt43T08YwUu
	 oPROgdoK9zFkA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 04 Dec 2024 15:20:49 +0000
Subject: [PATCH v2 1/6] arm64/sme: Flush foreign register state in
 do_sme_acc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-arm64-sme-reenable-v2-1-bae87728251d@kernel.org>
References: <20241204-arm64-sme-reenable-v2-0-bae87728251d@kernel.org>
In-Reply-To: <20241204-arm64-sme-reenable-v2-0-bae87728251d@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Martin <Dave.Martin@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LpOVQoMlpE/E8rUSHH5zwrqMIfcMHJ5yw+nwZF82uAs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnUHOpV1gwjo0EzhOoXMD37trHVNnA76xlj4H70URa
 8/Ka34eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1BzqQAKCRAk1otyXVSH0JU5B/
 9tJ8ahfl3ZVfslu1hDK5SdC1zHiWbpICVSKPprRqsqf34h8Q5rtN3W3y6cDJIAhS3VnYqrnyQ34PdB
 qQPuOe4L3HsDy+RZfLSY6gJZr/3/vHtN6tXCcFuQZ2KZAu7S2iDU+MfBRWUSSW2B5Nw5nW4AXCgnO7
 nYmwctPULF9HxwZ5Jk+zd9Kf5ym1S+3cEb5SjgSbMH9/EI93o0sbQqh+cOJ37BAbCmDS3CTdikqzPC
 rMDC2rIgm0u+ufDvuyO389ZOY8CxdxzZGumTrRX26WEaRStIyFVTUaI5OgH7XXS/xznwK61W6grplw
 4ANmhMEhh14yXBZYEuOsu3KK6qRKC6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_072227_199493_88D27B7F 
X-CRM114-Status: GOOD (  11.81  )
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


