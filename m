Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E646C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHCoVKDwev31CZRQgniIkI3MubB2o6wMEg0d+8Q2S+0=; b=cI7kc6Orw7rnaFp+7qo0xzrPDX
	G1clenUkATQK2ksra5GA5vkZFIw1QIUe+BywlwxzezifTnPM0TqGEn1jll5oSkFtoUOeGHuIFUOzh
	n1zdOSX0SY0sgqzCRJgmAdJnDZBtXLSvv23rhsCW27VQuuXgrcTfCpUiHoV0jcu91xlou2BML5vTd
	10qdBUHyzp4uLCTtrekJs2Aj8TJBPrJeOlfggOXF3xM0sWCbm/KISBTnrgId1MO2xi0TX+cEQ3tD+
	bF9moZW/rWNemfLP4heytc2dRyNlUWGjBF9X1CsWZgQ6r5dZ31swPzQSFpNho7nZyx4aGt5EsppLf
	rYn75KDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SUo-0000000Cr1Q-1Xz2;
	Tue, 01 Sep 2026 17:42:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SUn-0000000Cr0e-1FAO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:42:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BAEBD6025B;
	Tue,  1 Sep 2026 17:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4551F000E9;
	Tue,  1 Sep 2026 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788284524;
	bh=QHCoVKDwev31CZRQgniIkI3MubB2o6wMEg0d+8Q2S+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UO6SaejVNgcQzvC5/BZJaDHJ7aLmqg/7YjrsXM9qGV2ZGgLYQ2pzLgLIgOBSJM6zd
	 oQSBdXyof/2Huf41qiaVlNmJMCWAR+5Kk2IVmf84ykntKNRW5MNOAoLh5H7oTWzPkR
	 gVfZodXqMi0Ft1uoJkwXjpnPSE2bU8NQbPFI/i5K1xz2eMbY6zwsM79l4/Jz6PTMJK
	 J14uTqM7BU5gKsWQz2/FgIiCFNM10njjQzKSTQpL4eoNspRao1vaknUhA/wwx+RBUt
	 5stkoSijDPV4Cekne5FBbauGUzwgcTEtjqmU82i6hpE1rWcD5TK4lZ20nm/YavYNLL
	 HKZSF+iNuUqww==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:38:42 +0100
Subject: [PATCH v11 2/2] arm64/sve: Disable TIF_SVE on syscall once per
 second
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-sve-trap-mitigation-v11-2-be8095543a46@kernel.org>
References: <20260901-arm64-sve-trap-mitigation-v11-0-be8095543a46@kernel.org>
In-Reply-To: <20260901-arm64-sve-trap-mitigation-v11-0-be8095543a46@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, 
 Ryan Roberts <Ryan.Roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2616; i=broonie@kernel.org;
 h=from:subject:message-id; bh=28ej9lX6BTa8SavizmAaCMmgCQFPdsywzv1lKDVkBbQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlw5kwTcSK4+P1IfePYLoFIca4cm3IuwS2ecaw
 2V2ztIVGBeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcOZAAKCRAk1otyXVSH
 0CJdB/9sv51gCXyxJkI/luXlMaw2mdmESC8ijFo7ANiG+trh1UAzYTdwBzy7wbnXsV9C0hn6trO
 kFQbXwXKtUJN0OkML0jbysWxI8SEvIhfIYC5JMwAqcbLO7eAGEDOld2p2vi77wG3oOf9qFfI0YI
 IsA6BFPFzg3fQhbnY48ohCEUF7xc0QiaaVMUGrxs240XvwFfw2vYWFtW6XWNCtJPN4Rcna/pJAx
 dCxGPhie3m3/hgpHo6x3dJKAMSAvW8Rt+Z50xAONC1qhAWjnSU/BbIScbmultToUXtyKktsJK9F
 0mV8jRmUJfo5+CIU4UeKlIvK9KoVy/iofcXsxN/UXE/ewPbh
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
index 72c03ccea59f..475c22e103fb 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -274,8 +274,19 @@ static inline void fpsimd_syscall_enter(void)
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


