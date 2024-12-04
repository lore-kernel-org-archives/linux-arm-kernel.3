Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA94E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbrPPtzaz1uYp8syc2SwQibDDWFYYYcWdraEyuneUW8=; b=0fRdW1bAKSsUFq/YrltCc7EPQj
	X2PDmRPKumw2yKC3GLmCnNfL4Uxhqo1tCSFagEUqHVive2TH6zLLnqCjRDY//DNVElsGWrZrKi+0h
	K7FLEwba+23gO+RsUEsk955XvXkz/45gonrj3cAx33ZhE9LFr/w1P4q2Db1TSx1BVqoxdtLH6ApNF
	fW7ePapJxDc1EXW/1H5v6/fSAYZ6qO2hzr0bChZ/Js9jdD2XwPO/Wpc9mtEbOipUBUw6TtumEFKCc
	W9GLYMp17a8QCqamIXWON5A1AL/Z0ZdxtCtvtGMya6wJYoMmC7Oj6Mcgr+n9FAmoEpay7X9nTEGj0
	FBLWYKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrGq-0000000CznQ-0zxQ;
	Wed, 04 Dec 2024 15:26:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrCw-0000000Cyt9-2ckA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:22:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4526F5C58D9;
	Wed,  4 Dec 2024 15:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4F9C4CED2;
	Wed,  4 Dec 2024 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733325750;
	bh=A8QKBxilDmxPa7rkbda6zcbE9W7eNHPT2bdz3YleFLw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QNj5hXemT+0ygrwbrgagcUNKOZv7DgPtgEFPYb2ASRGxh801B9/Gxxd88fI+jbDvg
	 JXiP3zd1ThdTKB0crkPoFya/IKM/m0aBjYCv7N4DqXshIk17EBw3LMNPR4GsRxCWRd
	 ESiLrVPAn2oXczQspoZnSOFa0AY2xWyM1v7JTtEhAjUacMhtsC6mWdAaQXVg9U35Yf
	 a6VzE0jAv80ZkgP8JErM2iPhqJgas5NSOVaAUpJiQEyCY2rtg8TybLbu+iISNbPm5O
	 6o5ZWZ4UKPLGy180R+7AvMjUUAdpu3cn7mRDnYXxtfxpFwfzudscBcgI34+mNxa+S4
	 ZDhyxvNCXkzWQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 04 Dec 2024 15:20:51 +0000
Subject: [PATCH v2 3/6] arm64/ptrace: Zero FPMR on streaming mode
 entry/exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-arm64-sme-reenable-v2-3-bae87728251d@kernel.org>
References: <20241204-arm64-sme-reenable-v2-0-bae87728251d@kernel.org>
In-Reply-To: <20241204-arm64-sme-reenable-v2-0-bae87728251d@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Martin <Dave.Martin@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536; i=broonie@kernel.org;
 h=from:subject:message-id; bh=A8QKBxilDmxPa7rkbda6zcbE9W7eNHPT2bdz3YleFLw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnUHOqPfutP7bJSiz1k/7SJhcoIeMOBJXZS1GuIf38
 grLqUyCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1BzqgAKCRAk1otyXVSH0K5oB/
 9g8XrD26deExaGvYbmtEB2rk9DdkgD0udiS0bq/MVMNeUZAP6wa0bz7mKAWRk9vEZ7UQ2XhBC+5JOU
 Y74TcXmBDAxrhN+kxiv/EwXqzTyvLBQ7dmz4sr6sfRUW2jIkzyawXKXPWByssW6Cqu0+Z+lCylgevf
 V9tCwn/IbrKcvHinej/SrO4Z1BvUjs4B+ea0iAmbCpTipdlARj8HTOESCozy38MrlHXpktcPv5Nzuh
 5Z6YyRTBGFWARBoyqqtAMrB4UKfclQrK1g4flJL01GNB5xki7imPM+Xdf+sclqpAKtOMX1ErxyGIQu
 ETIrsydK0mSkxcXkHB0+UfZC4CPCFD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_072230_746653_2AE2AF96 
X-CRM114-Status: GOOD (  13.19  )
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

When FPMR and SME are both present then entering and exiting streaming mode
clears FPMR in the same manner as it clears the V/Z and P registers.
Since entering and exiting streaming mode via ptrace is expected to have
the same effect as doing so via SMSTART/SMSTOP it should clear FPMR too
but this was missed when FPMR support was added. Add the required reset
of FPMR.

Since changing the vector length resets SVCR a SME vector length change
implemented via a write to ZA can trigger an exit of streaming mode and
we need to check when writing to ZA as well.

Fixes: 4035c22ef7d4 ("arm64/ptrace: Expose FPMR via ptrace")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kernel/ptrace.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index e4437f62a2cda93734052c44b48886db83d75b3e..43a9397d5903ff87b608befdcaed3f9a7e48f976 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -877,6 +877,7 @@ static int sve_set_common(struct task_struct *target,
 			  const void *kbuf, const void __user *ubuf,
 			  enum vec_type type)
 {
+	u64 old_svcr = target->thread.svcr;
 	int ret;
 	struct user_sve_header header;
 	unsigned int vq;
@@ -908,8 +909,6 @@ static int sve_set_common(struct task_struct *target,
 
 	/* Enter/exit streaming mode */
 	if (system_supports_sme()) {
-		u64 old_svcr = target->thread.svcr;
-
 		switch (type) {
 		case ARM64_VEC_SVE:
 			target->thread.svcr &= ~SVCR_SM_MASK;
@@ -1008,6 +1007,10 @@ static int sve_set_common(struct task_struct *target,
 				 start, end);
 
 out:
+	/* If we entered or exited streaming mode then reset FPMR */
+	if ((target->thread.svcr & SVCR_SM) != (old_svcr & SVCR_SM))
+		target->thread.uw.fpmr = 0;
+
 	fpsimd_flush_task_state(target);
 	return ret;
 }
@@ -1104,6 +1107,7 @@ static int za_set(struct task_struct *target,
 		  unsigned int pos, unsigned int count,
 		  const void *kbuf, const void __user *ubuf)
 {
+	u64 old_svcr = target->thread.svcr;
 	int ret;
 	struct user_za_header header;
 	unsigned int vq;
@@ -1184,6 +1188,10 @@ static int za_set(struct task_struct *target,
 	target->thread.svcr |= SVCR_ZA_MASK;
 
 out:
+	/* If we entered or exited streaming mode then reset FPMR */
+	if ((target->thread.svcr & SVCR_SM) != (old_svcr & SVCR_SM))
+		target->thread.uw.fpmr = 0;
+
 	fpsimd_flush_task_state(target);
 	return ret;
 }

-- 
2.39.5


