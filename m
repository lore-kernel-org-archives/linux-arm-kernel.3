Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0AAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWuN2Rt1W5FqVK9juWydaDJejrOY+hSJdXCYlgq8gnI=; b=QFBImHODCVmYO4TsPs1UGLKjNG
	pZ45BBCjTqIqdTvTCiupagBCgVBwFaxcdNi37MTPaMf67J7wAKE45BjGy9enAzWQ1CNC54oKxzo4e
	8sYLroDXmuULUWP6Dy3S76M3Kjcflo/o0L1eW6yH0Hcz+W05jY+otb8fK1irEfNBnAftjBXHMafIE
	hwkGK9vwNTfJ/nB5/ngWwzIIl9BPSKXE62VbyGnzCOXMKvRMifYGpsgQeK0DlSrI18adw20rEaEi2
	w4kA357imggW38OKHVPsSgxp4yes6BVtaJYvhPGxd8RS0Whzf9tN0xx8zGYi6ejtNsB/ONvfl1Ocs
	5LymeuWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdHv-000000070J0-0TGJ;
	Fri, 03 Jul 2026 12:46:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdHr-000000070Gz-3p5B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:46:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AAAD3434CB;
	Fri,  3 Jul 2026 12:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A33B1F00A3D;
	Fri,  3 Jul 2026 12:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783082791;
	bh=dWuN2Rt1W5FqVK9juWydaDJejrOY+hSJdXCYlgq8gnI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=e3Gpqt4nO5LZghq/2OCEPSgwth1RYyFEoA7NYA2oOFve3GIOfYhRKDtsmYh1jYSfL
	 08QDEN9nZO+DfTNzJaT0dnxN/pMwWeHUjLMx0NYySoa9uFa6axNkbHZhsq6i3kNeWu
	 Din8doQM2VtWTqXaMLxMg1tmNqeh8zWPcEQICOgzehV3qiquMzL5nX54ZOHvUuWjFR
	 EvWjwuzmZWn9NPfef6BGC1kMcZP4jB2h6+4YAC4ilAoilnUqApJgKjyRGJRK/Ae5oP
	 Ei00bMUVF6obBPkWGf1odaQs0XBXLQ3r6gxWQ+W9mNBpFfo83pakCPQQqKrQ0bcC5U
	 pGGxOgIcMjGUQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 03 Jul 2026 13:34:05 +0100
Subject: [PATCH v10 2/2] arm64/sve: Disable TIF_SVE on syscall once per
 second
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-arm64-sve-trap-mitigation-v10-2-32b4861b64fc@kernel.org>
References: <20260703-arm64-sve-trap-mitigation-v10-0-32b4861b64fc@kernel.org>
In-Reply-To: <20260703-arm64-sve-trap-mitigation-v10-0-32b4861b64fc@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, 
 Ryan Roberts <Ryan.Roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2616; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RNPZGVyON1HECSjMncNyEpF8EY5+1IvWtl//VNwlc2k=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqR68hzulXE7wWmjSTOivJ0R5gQDMxvJ0oCvzDC
 6TcSS+M3T2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakevIQAKCRAk1otyXVSH
 0FOlB/9Mut6TQrOKmgUHKZ6WTJMl1o/tsqvYH/VoiQZClpUUSVfcS1K60xTKKR/QvLDHzMjmxBA
 tt1+69wgXfUWRi8z1Nqo7/mjPPx283vMHW7Al+NbTjQCYppiqQsuikjlw0FB3ca3zr1la9sWj7o
 KiWo1TbvO1Cfm6yXdbUI08NO8IXJN4cFvOKLnS4MeCsuhONDSXtoaMCWT3tJN1XSlnlPY6NyC7M
 d8wvl453qCpr+jZmAiJWo3QNAwBzlH+nJzlGP7Oo92AAqd5trLkbqCSGakq5jG2S6ZgLHZvYCYz
 mc7kQfDzKRd3jxL0mAV4eBpB+iaGqJTkFy1eJG/e5GBesdTb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
 arch/arm64/kernel/entry-common.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index ceb4eb11232a..c11008f30bf6 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -254,8 +254,19 @@ static inline void fpsimd_syscall_enter(void)
 	if (!system_supports_sve())
 		return;
 
-	if (test_thread_flag(TIF_SVE))
-		sve_flush_live();
+	if (test_thread_flag(TIF_SVE)) {
+		/*
+		 * Ensure that tasks that don't block in a syscall
+		 * also get a chance to drop TIF_SVE.
+		 */
+		if (unlikely(time_after(jiffies,
+					current->thread.sve_timeout))) {
+			clear_thread_flag(TIF_SVE);
+			sve_user_disable();
+		} else {
+			sve_flush_live();
+		}
+	}
 
 	/*
 	 * Any live non-FPSIMD SVE state has been zeroed. Allow

-- 
2.47.3


