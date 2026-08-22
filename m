Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBBBC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SFWwYfK2ORvvb1ePNWqdIkWg8WHsPyZq2XD2ex3XzW0=; b=h2hHpeXJj1GDwPh5N5AWo2eRSA
	ntFwl1u8AN+0EEiMNE4VlYuc0Y45iJQEMc3WqpcKsVJy8YA3mPIgkVgnCZg9yrs0Kf67//8Q1ynhK
	Lb08renyANtnL2ntGoDGe+dhRFpL+Nw/RCDrseuh4EbfTpq++LwoGygKaSQkMElP3yIsIpDdfeyqQ
	tPYRB+FBEzcibw1ypZnMHNeaeO7jBCriho9lP3LU/5n+jcFxB8W2bEgz5voOesYbqGf2MkjT+PkJq
	OvKAgIUEiMJKqrfwYjLhPzduNWC16HgX+esTJ948sSN+7IOtyAwW1cixdqBgpvrKML1sQv0moCLup
	apwFtlwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAc-0000000EYXu-3WQL;
	Sat, 22 Aug 2026 13:54:02 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAZ-0000000EYXS-3lSY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 13:54:01 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-499a8039ff5so18181455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 06:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787406837; x=1788011637; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SFWwYfK2ORvvb1ePNWqdIkWg8WHsPyZq2XD2ex3XzW0=;
        b=c8nJapc+gbmnh1s+eLhJ0VkqUO3FkhA5nRqE5ol0oC3pZo+1g0ArpJUKxnhM37pIy7
         0d5tFLDyDCfnc+Be8UJBBibZtoOeXc4HpnapgkNUj+x8up5IDovfDVjpPC8FnROpX68g
         f3+KGdMJeQ8J3W3F+KLUuovQMbUWNXGbq8bMwdBAX0E59ExxCvv3aLFed0ZQc39fs8wT
         kgAQZ1fZclycdPHpqHvE/+j0OfrWpli7pQ96DItRSASajLzrHV3BjpmvlGHfVEg1eF7F
         U9m0aXKyms2O29SJu+6dCKh2Mc/HfAs4wfoRQk9bb6CdYs8bA9M84RZVxDROyHUPkZw1
         Oryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787406837; x=1788011637;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SFWwYfK2ORvvb1ePNWqdIkWg8WHsPyZq2XD2ex3XzW0=;
        b=MxaGKvtE02KyFWIfaMoGhgJh5zJl5JecL3y/psY27KMbYq+MkFAjtkJKoYSu54JKFB
         rLLpoT8C6PsveW2SdeEfoIXu5xIAUDn1OESPIH1saHTKJqMtid5VLJ34ZtkCFCfm0owN
         ylOxRrxandSnOZDE3MG35ZXYwf6yiwgAej2gScOrm6xiDZWbz+NL8F/+ovavKfrS0Hnb
         WYj3IqujTGyrJ0muk+lWpQ37wuxQ1viyjphsdnvx4MOMzZmWeLyrYWNyEaVU9lsnGwkF
         V2glZXPjge9KxJAnQdvE5ngJC5ATfdJj+EGCgQKqiKGDsquCPr4zs2cBApdbOiFvd5DB
         aTDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAx4ntzooZnFeY2Ba4roMcpm2FdoIubc26y3+0Rw/wFlPmbgCQ+xp3e+vLeBdz20W4568kLNJYG9IfbbyovSQ8@lists.infradead.org
X-Gm-Message-State: AFuF++mHkdmchQovBHL2+eSc69+MuTFUe9Ux3rX/5dsB5y90xgEuVdr/
	uPrxpLoSf5llZT7a9fakhI/P51cSLAg2sZ6QnLsZfqnXDoRETVQaKkXpZHGgW5IyZpmKsA3V/g=
	=
X-Received: from wmlu19.prod.google.com ([2002:a05:600c:2113:b0:493:ae35:2761])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f06:b0:499:a5fc:207e
 with SMTP id 5b1f17b1804b1-499b8340754mr196385025e9.8.1787406836660; Sat, 22
 Aug 2026 06:53:56 -0700 (PDT)
Date: Sat, 22 Aug 2026 15:53:22 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3648; i=ardb@kernel.org;
 h=from:subject; bh=2f7AvVCI5x1tX97+DCcut0s/Ah4Z634pXHbbbq7B0rk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIatz5WXxBeue7y3/sIvrsfxld8u+ud3712Ssecfy8Xo4Z
 /z2HZaKHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiP98zMvRtO33wRsLJ8H2u
 zLVsqfNVVy7rWL3p0aqaHzyLTcMu3S9h+KfBcnOJYGSsFldpb0TP6S2Bt7lMSs58us+6yehx6eU XX1kA
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260822135323.795946-11-ardb+git@google.com>
Subject: [RFC PATCH 0/9] arm64: Allocate .text and .init.text together
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_065359_997317_45BF0725 
X-CRM114-Status: GOOD (  14.39  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The arm64 module loader has to deal with a couple of corner cases that
may occur when .init.text is placed out of direct branch range of .text:

- ordinary direct branches from .init.text into .text may require the
  use of a PLT entry (i.e., a trampoline aka veneer), which means not
  only that additional PLT entries need to be allocated for
  cross-section calls, but also that .init.text needs its own PLT
  reservation, as the one in .text will be out of range as well;

- dynamic patching of the ftrace handler into .init.text code needs its
  own dedicated trampoline as the one in .text may be too far away.

- recent compilers may omit BTI veneers for static functions that never
  have their address taken, and so additional veneers will need to be
  added to .text in case cross-section direct branches from .init.text=20
  require a PLT entry (and therefore a landing pad at the target end).

This is unfortunate, because it is actually somewhat unusual for .text
and .init.text to be so far away from each other: only when allocating
either of them (but not both) exhausts the 'near' (PLT-less) module
region, the other will be allocated from the spillover region, which is
not in direct branching range, and therefore requires PLT entries for
cross-section calls.

This series addresses this wart by allocating both of them as a single
chunk, and freeing the .init.text part along with the other init
sections at the appropriate time. This ensures that the two regions will
never require veneers for cross-section calls, allowing the arm64 module
loader to be simplified.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>
Cc: Daniel Gomez <da.gomez@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>
Cc: "Adrian Barna=C5=9B" <abarnas@google.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-trace-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-modules@vger.kernel.org

Ard Biesheuvel (9):
  mm: execmem: Add API to split an existing execmem cache allocation
  mm: execmem: Allow huge vmappings to be avoided for execmem caches
  module: Place MOD_TEXT before MOD_INIT_TEXT in enumeration
  module: Allocate MOD_INIT_TEXT from the MOD_TEXT ROX allocation
  arm64: mm: Permit permissions changes on huge vmappings
  arm64: Enable the execmem ROX cache for module text
  arm64: ftrace: Revert "fix unreachable PLT for ftrace_caller ..."
  arm64: module: Combine init and core PLT entries again
  arm64: ftrace: Simplify PLT handling

 arch/arm64/Kconfig                  |  1 +
 arch/arm64/include/asm/module.h     |  2 -
 arch/arm64/include/asm/module.lds.h |  3 -
 arch/arm64/kernel/ftrace.c          | 13 +---
 arch/arm64/kernel/module-plts.c     | 63 +++++---------------
 arch/arm64/kernel/module.c          | 20 +------
 arch/arm64/mm/init.c                | 19 +++++-
 arch/arm64/mm/pageattr.c            | 13 +++-
 include/linux/execmem.h             | 11 ++++
 include/linux/module.h              |  4 +-
 kernel/module/main.c                | 22 +++++--
 mm/execmem.c                        | 47 ++++++++++++++-
 12 files changed, 124 insertions(+), 94 deletions(-)

--=20
2.55.0.860.g4b6b3295ed-goog


