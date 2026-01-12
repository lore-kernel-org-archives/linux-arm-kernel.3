Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FEBCF45B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bg/1Xgfn1E0DEXNbS9d/rzxNmu9VvpCFlIYq9KHMtu4=; b=qZcDo46Mad4TFe+GW3biFAeCaF
	U0QbPw2bCpudpRbjlavaUX/cJZEbH7p8CaNxlgsG3R1NWF34cZNEgiEhCvoL+o6odRsA1fIPFJ3zo
	hCBRNeznuD0IUfNL7RPurUtdx1TdjVjLULzOcp8F9bZq1ersydq8naV7+YwcXQLQaXvGeS5vICTcT
	PPF1rYnPPQq+kD2M00P7E5J11QqScsnfU+RFnEb3rhPA/lHqg2oPa6BdtanyE24Xa0w4EFEDgP819
	PFPr5IcCNLJylqX7HuRwmXVzLRnfl3syyL/bh4D5K3N6JiRpeWggL6GrximZhynyEkZuUXIbFTflm
	Gp4hXkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLiX-00000005rKh-1Ye2;
	Mon, 12 Jan 2026 17:28:37 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLiS-00000005rJc-38gY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:28:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768238909; x=1768498109;
	bh=bg/1Xgfn1E0DEXNbS9d/rzxNmu9VvpCFlIYq9KHMtu4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=neR07E+Jnlg+uKT0Q4Qubayl3FT+ONbfw/RQtxLwbd2s/UeKOK7bBvXT/+o/gc3tB
	 kbhvs41hlEgd8Uj7zNq5O6gkUMYnsaA3PvC2ZeX4P2vC+ylJDxfhd9fO/ZjxTYLtsV
	 8fY3cwV5lOUDRQlUFEkA++Ghk4lynTDT/ftHTlcD0ZFc7Lv8otiP7h34gTOw2wpaw2
	 J5/VeWyUpG0URq+RWwtmDmfQkGvubSkNW2g6nTHXgTCm+BagDnnsBTP8vZP1lnqcpS
	 Q/kKJWf/DTAeAPMq5km6HFPyUOaM5ih1ovjMRpVw0OxJE1DGb3rYQwaoJhb1UeHQqM
	 Bv/t3y4sDB1DQ==
Date: Mon, 12 Jan 2026 17:28:24 +0000
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 12/14] arm64: Unify software tag-based KASAN inline recovery path
Message-ID: <85ee02ae536a4c2e95f7d2609c5893d99cd64a00.1768233085.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1768233085.git.m.wieczorretman@pm.me>
References: <cover.1768233085.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: abd5dd7e650f6c0c9201b312154c351ebdd0b398
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_092832_943758_5B886417 
X-CRM114-Status: GOOD (  11.13  )
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

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

To avoid having a copy of a long comment explaining the intricacies of
the inline KASAN recovery system and issues for every architecture that
uses the software tag-based mode, a unified kasan_die_unless_recover()
function was added.

Use kasan_die_unless_recover() in the kasan brk handler to cleanup the
long comment, that's kept in the non-arch KASAN code.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Alexander Potapenko <glider@google.com>
---
Changelog v7:
- Add Alexander's Acked-by tag.

Changelog v6:
- Add Catalin's Acked-by tag.

Changelog v5:
- Split arm64 portion of patch 13/18 into this one. (Peter Zijlstra)

 arch/arm64/kernel/traps.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 914282016069..e076753576e0 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -1071,22 +1071,7 @@ int kasan_brk_handler(struct pt_regs *regs, unsigned=
 long esr)
=20
 =09kasan_report(addr, size, write, pc);
=20
-=09/*
-=09 * The instrumentation allows to control whether we can proceed after
-=09 * a crash was detected. This is done by passing the -recover flag to
-=09 * the compiler. Disabling recovery allows to generate more compact
-=09 * code.
-=09 *
-=09 * Unfortunately disabling recovery doesn't work for the kernel right
-=09 * now. KASAN reporting is disabled in some contexts (for example when
-=09 * the allocator accesses slab object metadata; this is controlled by
-=09 * current->kasan_depth). All these accesses are detected by the tool,
-=09 * even though the reports for them are not printed.
-=09 *
-=09 * This is something that might be fixed at some point in the future.
-=09 */
-=09if (!recover)
-=09=09die("Oops - KASAN", regs, esr);
+=09kasan_die_unless_recover(recover, "Oops - KASAN", regs, esr, die);
=20
 =09/* If thread survives, skip over the brk instruction and continue: */
 =09arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
--=20
2.52.0



