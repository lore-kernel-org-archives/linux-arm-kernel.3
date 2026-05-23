Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFF7CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 16:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pHoejXCQr1jc5SyppxOGDWNZ9/MW7Y7foH30qobTVFI=; b=ioi/6lYgqgjRSaH0uaHZB/BclE
	G6XU9QGRMmdWnd32GNtoIjZE+itn3TP1563hIFt5JSOSkLsQiCwf3BYpsmXfzq4cTKKki/alsDAAJ
	iv0x2THcQDhVufFNfqNFRs0dRbK+kcL5SY62Ni3bW0pqDUYJeefQglEn5NdiLcfPTyWTFOSsbMie6
	/WQD6EuZKqS7B2ltOxzn5Ci0fAIOa1rb9MLBFNKlwXKyRx6k+0EXOB1IorUKi1UB45gtg9yqFpjnP
	kWRXu/CI1qih7/mKAiTJ1POtrvL7Miqso4CIsvvFGJ5Nzofxg/79+fTKRLksXxYbxFN4ebqMrl62c
	7wp4/IGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQphK-0000000Dbz0-3XbT;
	Sat, 23 May 2026 16:59:38 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQphI-0000000Dby1-1fNr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 16:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=pHoejXCQr1jc5SyppxOGDWNZ9/MW7Y7foH30qobTVFI=; b=sHetnfG/J+5bKnmxv9oVviUBtp
	Z70PpAgSpaxoBwuOW2N1OFPHgSmm7OFrnW3iV0GA4oVAo/8dj926PqsVxgJZ5UosL3aw3JkrWAk5c
	dOUsyKB3N3eeRMmXzSMeD4ndhG3qcvrzAKn+cLDnGB1A3+6JKWQ7iidl566aVyGiEVmK4xo1+mxQs
	v3x4cyU/f5l1bUN80wIrBSZMnShjJDty2lxq9Tr/1znj6P1VmbbseGuFBGNMWftvnLSKmvSMhoaa2
	49xKpM17ZU77uwXPMduqf7niKwsKBawVGvzMVxfUB39Mai2+587MP6x9Eb7lpUGJDzvEMlmQjOgdn
	udrCoScA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wQphA-000AtY-2I;
	Sat, 23 May 2026 16:59:28 +0000
From: Breno Leitao <leitao@debian.org>
Date: Sat, 23 May 2026 12:59:26 -0400
Subject: [PATCH] arm64: arch_timer: reuse arch_timer_read_cnt{p,v}ct_el0()
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-arch64_fix-v1-1-283bd4b73d49@debian.org>
X-B4-Tracking: v=1; b=H4sIAO3cEWoC/yXMyw5AMBCF4VeRWWuiF214FRHRGowF0iIS8e6K5
 XeS818Q0BMGKJMLPB4UaJkjeJqAG9t5QEZdNIhM6CwXkrXejVo1PZ1MK665KazhRkI8rB7j/MW
 q+nfY7YRuewtw3w/nfA/DbgAAAA==
X-Change-ID: 20260523-arch64_fix-6416179b7173
To: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2906; i=leitao@debian.org;
 h=from:subject:message-id; bh=FpVvWXXT+S08a+oGxhddN0b61XMhJtmpPVbqFqjHluY=;
 b=owEBbQKS/ZANAwAKATWjk5/8eHdtAcsmYgBqEdzvU+sjRQT1fn7VIl7NSCmeZl4AjAmh6JfsZ
 2ULhfsm982JAjMEAAEKAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCahHc7wAKCRA1o5Of/Hh3
 bV5fD/9U69LA7SGp1Z+Zp4GhN4Gtz4LHBOhd5NXQ9JSAukj/mGHFg0GK6hKJFdskB2397vMwvdC
 tmDN2cPrwJxsvGL+UOtCEgtqIS+cO6fO4Iiu142zujf5BOBykRY7J91eDWJB4A1SWs6HO2E6oKz
 dfg3N03wpDOq8l3MGz1QHrcVAIwmIgR1Qb37lKNgLUebHrNiF4cx9ePUhXh2L6bDcnyWyAt4wLq
 qFMniEzDVGkQ/s+Ju5W8hAKMxvyyskBKNPpLbWX54DgWGA9Won/knVlbhbJQacZAuqYBdRRqDrD
 tSDQr+akkAfzm/dKSpYG8tO8+3FrLjzCTNNc9xvKF0ZWyKh92Sz/bAQPZ/eIsYd1iHJPTivkP+Q
 6rDo5cPo8+EfiZnj1af70JG5StzibGU5m47AOabgWAASCpV0PbhkplP6Da30eFQFpb97nDtFoWa
 px7LbCF3hmJsxRYNiqBX3PKSiUlxk2kkxW3h3AUnq+qdEn6DC0GU417c2cRweDgbZTnGe+SbiSD
 zOggA9mYnYAuOU0OEgJ1gGld4rJL1L+Rs11JuUcZg2UuG1wLfgngXd21o5In+z14fJwqwQwaj/B
 MHCf0zpryfaQ3MCKIZtUeNAdMuUOEdB0F+XnI0TkCN3AM0DqIOKUtrcKRDJ/Qm2beWHsgqWtunc
 pXuFHg+ZiWm7Y/w==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_095936_448305_4525C083 
X-CRM114-Status: GOOD (  10.40  )
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

__arch_counter_get_cntpct() and __arch_counter_get_cntvct() open-code
the same ECV-aware ALTERNATIVE block that arch_timer_read_cntpct_el0()
and arch_timer_read_cntvct_el0() already provide in the same header.
The two pairs are byte-for-byte identical except for the trailing
arch_counter_enforce_ordering() the __arch_counter_get_* variants add.

Replace the duplicated inline assembly in __arch_counter_get_cntpct()
and __arch_counter_get_cntvct() with calls to the corresponding helpers.
This mirrors commit 00b39d150986 ("arm64: vdso: Use
__arch_counter_get_cntvct()"), which removed similar duplication from
the vDSO, and keeps the system-counter read sequence in a single place,
reducing assembly code in the kernell

No functional change: the resulting inline assembly, alternatives, and
clobbers are unchanged; only the source-level expression of the read
moves into the existing helper.

Verified by rebuilding the consumers of these helpers before and after
the change and comparing the resulting disassembly:

  - arch/arm64/kernel/vdso/vdso.so (final linked vDSO):
      bit-identical (same sha256 across rebuilds)
  - arch/arm64/kernel/vdso/vgettimeofday.o:    identical disassembly
  - arch/arm64/lib/delay.o:                    identical disassembly
  - drivers/clocksource/arm_arch_timer.o:      same 50 functions with
      byte-identical instruction streams; only difference is function
      ordering inside .text and NOP padding, with no opcodes added or
      removed.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/include/asm/arch_timer.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/arch_timer.h b/arch/arm64/include/asm/arch_timer.h
index f5794d50f51d..6717209df05b 100644
--- a/arch/arm64/include/asm/arch_timer.h
+++ b/arch/arm64/include/asm/arch_timer.h
@@ -178,12 +178,8 @@ static __always_inline u64 __arch_counter_get_cntpct_stable(void)
 
 static __always_inline u64 __arch_counter_get_cntpct(void)
 {
-	u64 cnt;
+	u64 cnt = arch_timer_read_cntpct_el0();
 
-	asm volatile(ALTERNATIVE("isb\n mrs %0, cntpct_el0",
-				 "nop\n" __mrs_s("%0", SYS_CNTPCTSS_EL0),
-				 ARM64_HAS_ECV)
-		     : "=r" (cnt));
 	arch_counter_enforce_ordering(cnt);
 	return cnt;
 }
@@ -199,12 +195,8 @@ static __always_inline u64 __arch_counter_get_cntvct_stable(void)
 
 static __always_inline u64 __arch_counter_get_cntvct(void)
 {
-	u64 cnt;
+	u64 cnt = arch_timer_read_cntvct_el0();
 
-	asm volatile(ALTERNATIVE("isb\n mrs %0, cntvct_el0",
-				 "nop\n" __mrs_s("%0", SYS_CNTVCTSS_EL0),
-				 ARM64_HAS_ECV)
-		     : "=r" (cnt));
 	arch_counter_enforce_ordering(cnt);
 	return cnt;
 }

---
base-commit: 9f84f9898cf191aa251268547ceef03abb8d1edd
change-id: 20260523-arch64_fix-6416179b7173

Best regards,
--  
Breno Leitao <leitao@debian.org>


