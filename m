Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60E8D6B6D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 20:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAY5Pf9wgYGGJGg21s8WFusTUh1ZWAb1XgWfjBzX/eU=; b=OmRF8tpEMMiImD0kcj6PyVl6Z1
	y1rYzp9XahF9vRL2t0NcF9DVozR856vzv7vrd301k4ipGvY5FLPtTMF7QBfgmFbVvhePqDq3e9I1n
	IO0xZnVutj6BjH1ZYD41EpGG5NqnNILWvJbwv53ZQVd2KcQA9BtK35aHbqkAo3voqzgmsTkXlXCss
	XLoVHn9ypHmL+Sr/hTtCvPOsLxbC2IU3233IqouFxyZuycVgl/cmh0da5Wwt/A1pGnHLUND3ThFcF
	vo3l71wBAq6YMWaMIuPwI7tmrkGdoeZPr0vOuv1eaCOY+mg9hZsk8hU3wedDNKuM4WbUiIUnOxOk7
	qpk/lp7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Fgk-00000001kAP-0fAO;
	Wed, 30 Oct 2024 20:53:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6FdU-00000001jRN-2FAp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 20:49:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0ACD85C5489;
	Wed, 30 Oct 2024 20:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F76C4CED1;
	Wed, 30 Oct 2024 20:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730321387;
	bh=dLqAw4xy5/KKmZNX6yrvJQT14/QmwjMru+J+jwCboHM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L3liUFqPA1FyGPmrsabDM7RM3yowwAs/TK5/9jJzyFy28OJVRxyIUqjPYZKPn4ZUz
	 3RUExHjQimbeOiymBXIpzpXPql8nYLS4cyZqcuiMdUJ09q0i20Q4j0X5d2KorWC6S4
	 cNkb1sT4Vr3OJStwGC7HQr48rWrj4Jbd1Ui3QbzTg2xH7VQBzM35KTVCZAVRd3DeNP
	 PhNMYGGIJXhsH8I75Jits6FqjnwrHcOppfVuP7mTGRmWlvY7Q+QTa2UCU4SF53Idlr
	 mZbNq/SXiVs+lYKImCLH9f8PBHrsyXS1s6MzHGX4qrI6UuWUtcWm6hd+zsuQwLJQ0f
	 JOE9Xl6P8csOA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Oct 2024 20:23:50 +0000
Subject: [PATCH 1/2] arm64/sve: Flush foreign register state in
 sve_init_regs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-arm64-fpsimd-foreign-flush-v1-1-bd7bd66905a2@kernel.org>
References: <20241030-arm64-fpsimd-foreign-flush-v1-0-bd7bd66905a2@kernel.org>
In-Reply-To: <20241030-arm64-fpsimd-foreign-flush-v1-0-bd7bd66905a2@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dLqAw4xy5/KKmZNX6yrvJQT14/QmwjMru+J+jwCboHM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIpvmTGqCbde0j16dyrk16BYTp5wddvqHWezRdera
 9Vfb+FyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyKb5gAKCRAk1otyXVSH0H4qB/
 9Yz+KS9YtbwvLFuU9RqjekMoIrPAkbHkjkUJCp/j9ZaBAf+7EZSNJogZcZXCuf2qUF7O1aV2sjaJ0j
 C5Pt+hdLBwe5keWkhhyfktLONox4y/Lxg6/6r4lr+mdLXXpl4Nd8mfPjxlvR/ZRXz7y8SVBKtEktXY
 nGjhnyAtXdxTLQJXaC/sEB67h0JSYbY0Tb0oul/FlC6ApE/qPfnPBmXaE8lLjCnHbkY8TJm6gjnsiO
 J+T336OyWGJxiNLiJhCT4U2MwGvi4JZm+aBKoP4c2wD+zmKP5F+d+dSw6j+q8pUaXGjyn5qGN20kzN
 0csdyvYKeag2vaLE4eZ6AeWKXTnlj9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_134948_660778_4291BFB1 
X-CRM114-Status: GOOD (  12.86  )
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

When we update the in memory register state in sve_init_regs() we neglect
to flush the task's CPU binding, meaning if the task is rescheduled to
the last CPU it ran on it is possible for the check for current state in
fpsimd_thread_switch() to falsely determine that up to date register
state is present on the CPU.  This results in it incorrectly clearing
TIF_FOREIGN_FPSTATE and suppress reloading.

This will also suppress the sve_user_enable() done in
fpsimd_bind_task_to_cpu() as part of return to userspace, causing
spurious SVE access traps.

Call fpsimd_flush_task_state() to invalidate the last loaded CPU
recorded in the task.

Fixes: cccb78ce89c4 ("arm64/sve: Rework SVE access trap to convert state in registers")
Reported-by: Mark Rutlamd <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kernel/fpsimd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 77006df20a75aee7c991cf116b6d06bfe953d1a4..6d21971ae5594f32947480cfa168db400a69a283 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1367,6 +1367,7 @@ static void sve_init_regs(void)
 	} else {
 		fpsimd_to_sve(current);
 		current->thread.fp_type = FP_STATE_SVE;
+		fpsimd_flush_task_state(current);
 	}
 }
 

-- 
2.39.2


