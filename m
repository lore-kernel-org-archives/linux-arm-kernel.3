Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB63F8FA90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=grAqEp/sRey0m1OBPeoLWEJ3oM/p3XRbZF24sedy66Q=; b=pjF+wWz1l/sKrpEu8Uj8ZRpDBm
	dtCHyPVi7KsW7zd8i6+rxUAjVwrlPVnLE1EjoYIbraxLDDuvejBgCMd4wrWdwCPmyMEXJ1S1GHGnd
	LPRthgKuWqBC1rVFuZj5UKm1yJ6QfGZoSWPjhI9dI9L0IsB5jK70gyFOFf8ms798A/QN336zgV3ho
	VQw0QgUetCUKZ/zry4SEi9J2oT3QYQKojsdml0/NwRRasXeuTsn07u7KYQcHKpveD3SxFTUtkgdxI
	FnVRpN5otNZtDOaE7Ai+B0yAVQnsejEKI8PPHBDoStuQMXVrC1/9X3lCWuhIbq+amP1/8u0tilrWo
	33NHYNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDVU-00000008sPt-04Wx;
	Tue, 21 Apr 2026 15:59:24 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDVR-00000008sPT-28X6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=grAqEp/sRey0m1OBPeoLWEJ3oM/p3XRbZF24sedy66Q=; b=WLlGEJPaMi7/yzJY+BSHF/K5A4
	705T3OONxv2snffpKALqcF3LHDG52K2aN5lpF0iVSo2l/V/iionNoJiw+MFOcD8136DaG57GXNFHd
	X5igEc4hQ3b6xnr52SyjCJ0CaxyDcdNDJt/EX1DhduJnjnTFbFY3x+mtxnAKrNMSCMpULlLw/B/EB
	9cal3vLUDg17feiSTj5Q8OkszjlLmgJeL0I3GmChwI1VvNR+Thu3407V6ZnVPgoRPoYOY+GeJtdGa
	gX0nvycO/f5wlSt7OkmZzrAhbJ8Y3XVUGApTp7Dg1FKaXtT2vQHwZT6z+jyJFGOXjr0MNHwXpj2Vc
	2u7XqF4g==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wFDVE-000y2J-1H;
	Tue, 21 Apr 2026 15:59:09 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 21 Apr 2026 08:58:57 -0700
Subject: [PATCH v2] arm64/irqflags: __always_inline the arch_local_irq_*()
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-arm64_always_inline-v2-1-c59d1400514d@debian.org>
X-B4-Tracking: v=1; b=H4sIAMCe52kC/32NSwqDMBQArxLe2hSTSkpc9R5FJJ+nvmJjSayti
 HcvsfsuB4aZDRJGwgQ12yDiQommADWTBQM3mNAjJw81A1lKVVay5CY+VNWa8W3W1FIYKSBX1mn
 vz05cUEHB4Bmxo89RvTU/Ti97RzfnVDYGSvMU12O7iOz9PyyCC+6t0UK7rlLWXT1aMuE0xR6af
 d+/nMfIFskAAAA=
X-Change-ID: 20260420-arm64_always_inline-6bc9dd3c17e6
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, mark.rutland@arm.com
Cc: leo.bras@arm.com, leo.yan@arm.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, paulmck@kernel.org, 
 puranjay@kernel.org, usama.arif@linux.dev, rmikey@meta.com, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=4392; i=leitao@debian.org;
 h=from:subject:message-id; bh=mAe9BvFOLCTLtvBDPhhECHbkwCKUqpygD+hK9qnLn9g=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp557HM1YA9SP0fIUCMblItdBk7DdiUJ5bMiWm3
 Wan1SFcEfWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaeeexwAKCRA1o5Of/Hh3
 bX8lEACcN1zISBkusw0Yil24hyk3dkukGMWgWLDTeHfbWLrWQ3o9rYqemKrwgn+3DIXQX+5GWbU
 S7duEm1FmggkdwYhLPtRGeSDUWIAKZGRX0sbRfaVIxkaRuiGpsFUURnwTFkmpRS4cEMiHL6D/bK
 7nIxFmPDDdGywpKJYf+9N83tVxeC0ckaCDb21DnNBvdTaeyeNfL/ZlnWUDqvAWSTjdTs1D/MGeh
 j+0v1aI+oaqb9uj3ndwX+yA3TI999Ui1notwH1zyg1tQAwFmjDxYIcTNJEpbAoRuSv5gwCLv6qm
 8h2I4UJ50MdHxXC1J+b4fAQwFfi0uYqOopKjbuDJkGvJQlra2w2Be2afj6BXnfR+DqtaUn1Am/h
 5QweeWT7IEQIGn2761Wv9W82Tgy2Vqg8BiyGk8Drf32nQ/yTTCr6kujTaxki7Ts36p7otW2yUP0
 9nUi3/m46/tDwTJprfT+3zanJqJWVfNtpBa6QgD6HKlRyjXZ/rHD8bnjK01mLhpnbNCpWFl3v8j
 Mq50zdwz6AHIGo3FuyzGC4PlasBKdzGavye8d5ovvxyLyaJIFuiLuc/+5qbPHwBDh6iUrOMvTwg
 OzXx3k1y7IGCI1B6h5g4iTK7QcVFDu0KbH7S5EFd5/wWAqieNaSeb2mMCn4/UGwaHPou7Q/zPo4
 +eMxs0pn5gxkKmA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085921_558604_09AC48EC 
X-CRM114-Status: GOOD (  11.38  )
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

The arch_local_irq_*() wrappers in <asm/irqflags.h> dispatch between two
underlying primitives: the __daif_* path on most systems, and the
__pmr_* path on builds that use GIC PMR-based masking (Pseudo-NMI). The
leaf primitives are already __always_inline, but the wrappers themselves
are plain "static inline".

That is unsafe for noinstr callers: nothing prevents the compiler from
emitting an out-of-line copy of e.g. arch_local_irq_disable(), and an
out-of-line copy can be instrumented (ftrace, kcov, sanitizers), which
breaks the noinstr contract on the entry/idle paths that rely on these
helpers.

x86 hit and fixed exactly this class of bug in commit 7a745be1cc90
("x86/entry: __always_inline irqflags for noinstr").

Force-inline all of the arch_local_irq_*() wrappers so they cannot be
emitted out-of-line:

  - arch_local_irq_enable()
  - arch_local_irq_disable()
  - arch_local_save_flags()
  - arch_irqs_disabled_flags()
  - arch_irqs_disabled()
  - arch_local_irq_save()
  - arch_local_irq_restore()

The primary motivation is noinstr safety. There is a useful side effect
for fleet-wide profiling: when the wrapper is emitted out-of-line,
samples taken inside it during the post-WFI IRQ unmask in
default_idle_call() are attributed to arch_local_irq_enable rather than
default_idle_call(), and the FP-unwinder loses default_idle_call() from
the chain.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Expand the functions that uses always_inline in arm64
- Link to v1: https://patch.msgid.link/20260420-arm64_always_inline-v1-1-dba919cf46bc@debian.org
---
 arch/arm64/include/asm/irqflags.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index d4d7451c2c129..a8cb5a5c93b78 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -40,7 +40,7 @@ static __always_inline void __pmr_local_irq_enable(void)
 	barrier();
 }
 
-static inline void arch_local_irq_enable(void)
+static __always_inline void arch_local_irq_enable(void)
 {
 	if (system_uses_irq_prio_masking()) {
 		__pmr_local_irq_enable();
@@ -68,7 +68,7 @@ static __always_inline void __pmr_local_irq_disable(void)
 	barrier();
 }
 
-static inline void arch_local_irq_disable(void)
+static __always_inline void arch_local_irq_disable(void)
 {
 	if (system_uses_irq_prio_masking()) {
 		__pmr_local_irq_disable();
@@ -90,7 +90,7 @@ static __always_inline unsigned long __pmr_local_save_flags(void)
 /*
  * Save the current interrupt enable state.
  */
-static inline unsigned long arch_local_save_flags(void)
+static __always_inline unsigned long arch_local_save_flags(void)
 {
 	if (system_uses_irq_prio_masking()) {
 		return __pmr_local_save_flags();
@@ -109,7 +109,7 @@ static __always_inline bool __pmr_irqs_disabled_flags(unsigned long flags)
 	return flags != GIC_PRIO_IRQON;
 }
 
-static inline bool arch_irqs_disabled_flags(unsigned long flags)
+static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
 {
 	if (system_uses_irq_prio_masking()) {
 		return __pmr_irqs_disabled_flags(flags);
@@ -128,7 +128,7 @@ static __always_inline bool __pmr_irqs_disabled(void)
 	return __pmr_irqs_disabled_flags(__pmr_local_save_flags());
 }
 
-static inline bool arch_irqs_disabled(void)
+static __always_inline bool arch_irqs_disabled(void)
 {
 	if (system_uses_irq_prio_masking()) {
 		return __pmr_irqs_disabled();
@@ -160,7 +160,7 @@ static __always_inline unsigned long __pmr_local_irq_save(void)
 	return flags;
 }
 
-static inline unsigned long arch_local_irq_save(void)
+static __always_inline unsigned long arch_local_irq_save(void)
 {
 	if (system_uses_irq_prio_masking()) {
 		return __pmr_local_irq_save();
@@ -187,7 +187,7 @@ static __always_inline void __pmr_local_irq_restore(unsigned long flags)
 /*
  * restore saved IRQ state
  */
-static inline void arch_local_irq_restore(unsigned long flags)
+static __always_inline void arch_local_irq_restore(unsigned long flags)
 {
 	if (system_uses_irq_prio_masking()) {
 		__pmr_local_irq_restore(flags);

---
base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
change-id: 20260420-arm64_always_inline-6bc9dd3c17e6

Best regards,
--  
Breno Leitao <leitao@debian.org>


