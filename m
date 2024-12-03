Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E5DE64A8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbrPPtzaz1uYp8syc2SwQibDDWFYYYcWdraEyuneUW8=; b=ewk72zMEf0wrjy9QjNnSRGgxKt
	20NVsjuB4LHYgNlN0kmzh7QlXwg0LwBVxXwDFmWlSFYXLOQ3LKIqTJ036wbv55X0nE5KVIp0p3Psx
	pN0cK9NBZk3Ly5BC+9D7URdkEKjFWuZ/+n2HwYM9mhfYtAn01CdbDZkk3ec84h5prPqB1DjZt6whH
	0Y5HdF37jsCscPHk4tr47v1I3x7nPF7GU6fRfbEJKscpiEi4bI6TLRmguMgFCU7bQY7uILvpzAr3i
	MNCavPumRM9sq0vtQZV+0GpJAXNuCUz3ZWqIEG0uX18owr3lrhcfwd1S7MvFesHmqmfTMKh/0km57
	eD8Yctcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISX7-00000009X1v-0lVl;
	Tue, 03 Dec 2024 13:01:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISK6-00000009UKn-1fUO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:48:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E06675C6CC6;
	Tue,  3 Dec 2024 12:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35ACEC4CEDA;
	Tue,  3 Dec 2024 12:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733230093;
	bh=A8QKBxilDmxPa7rkbda6zcbE9W7eNHPT2bdz3YleFLw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YB1/JhVVfVllWqpTIrk7/axmeR9qWo1CHsDZMaaZTOWJ29KPqtjV3kLB4Pk0GoN2V
	 AbbvlHTU1FZ+DHYwFi6AF3Yeu1TKtv9Yew9wF0o6u89WlZgOlzsLREFY46EmLl4PKE
	 gPF3qGGGtg59PCzJPDt1gkn684JMR/mBBVmy2MShSIbi26KebRhM7L9dA3FiXS6KUs
	 SwyBymbe+bDRIlhaoAYRn/ZBN5dHh2KzXQjr2m27ZIVUMpOTk8jlRJMmXw9f8XTI4k
	 58sA3Wu7c1Pc8ei4ezose9Kdwq05p9VvShFCdrxjTEdh93/RDQeITLthtHW2ol+mUm
	 HN/ENvn45KIsg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 12:45:55 +0000
Subject: [PATCH 3/6] arm64/ptrace: Zero FPMR on streaming mode entry/exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-arm64-sme-reenable-v1-3-d853479d1b77@kernel.org>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
In-Reply-To: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536; i=broonie@kernel.org;
 h=from:subject:message-id; bh=A8QKBxilDmxPa7rkbda6zcbE9W7eNHPT2bdz3YleFLw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTv4CiOSW2bhpgcdgsYNhwD/Bim4F7ucOylhTitF5
 bNZ69KSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ07+AgAKCRAk1otyXVSH0LOrB/
 99y5btc73beTOcl314LKxYh6c8mPHO20HigFHyqQdH86SXdpieb5FJR5m4nRfAnosSZgvstgKONgTz
 XZqsLN/KGPd4tQ9DKCVEydJ3/qFG/nswfG8vbzrZjvHZJ/R27QaD+TrhV3stJvQ+vb9ExTbYHxLbly
 a2q+yRIYr7+UZg5twhsndT1luzc4kNgcnc3yyEiqUm/6CQZzYTl3hn7duGakQiQun0A5IFN4fo3+7W
 /RfIDT448OmJWNI/6atAEtDOSpHazBrW8YbYL2Hn8+vGSQmltJjnGmtktoMOAjED3od8W1fkRBQB9w
 gfO+/3RX68xQLyTKjlR4djCYJYqWcj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044814_525236_EA8BBDD7 
X-CRM114-Status: GOOD (  13.05  )
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


